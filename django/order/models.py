from django.db import models

# Create your models here.
class order(models.Model):
    order_id = models.IntegerField(null=False, primary_key=True)
    customer_id = models.IntegerField(null=False)
    shipping = models.IntegerField(null=False)
    created_at = models.CharField(max_length=255, null=False, blank=False)

class order_item(models.Model):
    order_id = models.ForeignKey('order', null=False, blank=False, db_column='order_id', on_delete=models.CASCADE)
    product_name = models.CharField(max_length=255, null=False, blank=False)
    qty = models.IntegerField(null=False)

