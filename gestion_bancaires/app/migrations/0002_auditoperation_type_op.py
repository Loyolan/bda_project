# Generated by Django 4.1.7 on 2023-04-18 18:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='auditoperation',
            name='type_op',
            field=models.CharField(default='', max_length=10),
            preserve_default=False,
        ),
    ]