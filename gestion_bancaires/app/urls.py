from django.urls import path
from app.views import home
from app.views import client
urlpatterns = [
	path('home/', home.index),
	path('clients/', client.clients),
	path('add_clients/', client.addClient),
	path('update_clients/<num_compte>/', client.updateClient),
	path('delete_clients/<num_compte>/', client.deleteClient)
]