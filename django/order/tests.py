from django.test import TestCase
from order.models import order as Order
from order.models import order_item as OrderItem
from order.views import get_order_shipping_ratio, get_most_popular

# Create your tests here.
class OrderTestCase(TestCase):

    def setUp(self):
        Order.objects.create(order_id=1, customer_id=1, shipping=0, created_at='2018/1/17 上午 4:09:53')
        Order.objects.create(order_id=2, customer_id=2, shipping=0, created_at='2018/1/17 上午 4:09:53')
        Order.objects.create(order_id=3, customer_id=2, shipping=80, created_at='2018/1/17 上午 4:09:53')
        Order.objects.create(order_id=4, customer_id=3, shipping=80, created_at='2018/1/17 上午 4:09:53')
        Order.objects.create(order_id=5, customer_id=3, shipping=80, created_at='2018/1/17 上午 4:09:53')
        OrderItem.objects.create(product_name='milk', qty=2, order_id=Order.objects.get(pk=1))
        OrderItem.objects.create(product_name='water', qty=1, order_id=Order.objects.get(pk=2))
        OrderItem.objects.create(product_name='water', qty=4, order_id=Order.objects.get(pk=3))
        OrderItem.objects.create(product_name='tea', qty=2, order_id=Order.objects.get(pk=4))
        OrderItem.objects.create(product_name='milk', qty=1, order_id=Order.objects.get(pk=5))

    def test_get_order_shipping_ratio(self):
        shipping = get_order_shipping_ratio()
        self.assertEqual(shipping['free'], 2)
        self.assertEqual(shipping['others'], 3)

    def test_get_most_popular(self):
        shipping = get_most_popular(2)
        self.assertEqual(shipping[0], 'milk')
        self.assertEqual(shipping[1], 'water')
        with self.assertRaises(IndexError):
            shipping[2]
