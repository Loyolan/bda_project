from django.urls import path
from app.views import home
from app.views import client
from app.views import versement
from app.views import retrait

urlpatterns = [
	path('login/', home.login),
	path('home/', home.index),
	path('clients/', client.clients),
	path('add_clients/', client.addClient),
	path('update_clients/<num_compte>/', client.updateClient),
	path('delete_clients/<num_compte>/', client.deleteClient),
	path('versement/', versement.index_ver, name="versement_home"),  
    path('versement/add/', versement.index_add_ver,name="versement_add"),
    path('versement/update/<int:id>', versement.index_update_ver,name="versement_update"),
    path('showpageretrait/', retrait.show_page_retrait, name="showpageretrait"),
	path('showpagejournalier/', retrait.show_page_journalier, name="showpagejournalier"),
	path('insert_retrait/', retrait.retrait, name="insert_retrait"),
]