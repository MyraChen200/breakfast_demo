import json
import datetime

from django.shortcuts import render

from order.models import order as Order
from order.models import order_item as OrderItem

from django.db.models import Count
from django.db import connection

# Create your views here.
def index(request):
    data = {
        'shipping': get_order_shipping_ratio(),
        'cohort_data': json.dumps(get_cohort_data()),
        'popular_product': get_most_popular(3)
    }

    return render(request, 'index.html', data)

def get_order_shipping_ratio():
    shipping = {
        'free': 0,
        'others': 0
    }
    order_set = Order.objects.values('shipping').annotate(count=Count('shipping'))
    for order in order_set:
        if order['shipping'] == 0:
            shipping['free'] = order['count']
        else:
            shipping['others'] += order['count']

    return shipping

def get_most_popular(limit):
    popular_list = []

    with connection.cursor() as cursor:
        cursor.execute(
            """
            SELECT
                result.product_name,
                count(result.customer_id) AS order_customer_count,
                sum(result.qty) AS total_count
            FROM (
                SELECT customer_id, product_name, sum(oi.qty) AS qty
                FROM order_order AS o
                JOIN order_order_item AS oi
                ON o.order_id = oi.order_id
                GROUP BY product_name, customer_id
            ) AS result
            GROUP BY result.product_name
            ORDER BY order_customer_count DESC, total_count DESC"""
        )
        row = cursor.fetchall()

    for data in row:
        if len(popular_list) >= limit:
            break
        popular_list.append(data[0])

    return popular_list

def get_cohort_data():
    order_cohort = {
        'dates': [],
        'counts': []
    }
    with connection.cursor() as cursor:
        cursor.execute(
            """
            SELECT DATE_FORMAT(created_at, '%Y/%m/%d') AS created_date, count(distinct customer_id)
            FROM order_order
            GROUP BY created_date
            """
        )
        row = cursor.fetchall()

    curr_date = row[0][0]
    last_date = row[-1][0]
    i = 0

    while True:
        (last_i, i) = check_next_item(row, i, curr_date)

        if i == last_i:
            order_cohort['dates'].append(curr_date)
            order_cohort['counts'].append(0)
        else:
            order_cohort['dates'].append(row[last_i][0])
            order_cohort['counts'].append(row[last_i][1])

        if curr_date == last_date:
            break

        next_datetime = datetime.datetime.strptime(curr_date, "%Y/%m/%d") + datetime.timedelta(days=1)
        curr_date = datetime.datetime.strftime(next_datetime, "%Y/%m/%d")

    return order_cohort

def check_next_item(data, cursor, target_date):
    return (cursor, cursor + 1) if data[cursor][0] == target_date else (cursor, cursor)
