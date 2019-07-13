from django.shortcuts import render
from order.models import order as Order
from django.db.models import Count

# Create your views here.
def index(request):
    data = {
        'shipping': {
            'free': 0,
            'others': 0
        }
    }

    order_set = Order.objects.values('shipping').annotate(count=Count('shipping'))
    for order in order_set:
        if order['shipping'] == 0:
            data['shipping']['free'] = order['count']
        else:
            data['shipping']['others'] += order['count']

    return render(request, 'index.html', data)
