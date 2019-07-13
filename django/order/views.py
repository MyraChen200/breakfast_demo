from django.shortcuts import render
from order.models import order as Order
from order.models import order_item as OrderItem
from django.db.models import Count

from django.db import connection

# Create your views here.
def index(request):
    data = {
        'shipping': get_order_shipping_ratio(),
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
    cursor = connection.cursor()
    cursor.execute(
        """
        SELECT 
            result.product_name,
            count(result.customer_id) as order_customer_count,
            sum(result.qty) as total_count
        FROM (
            SELECT customer_id, product_name, oi.qty
            FROM order_order as o
            JOIN order_order_item as oi
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