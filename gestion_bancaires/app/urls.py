from django.urls import path
from . import views

urlpatterns = [
	path('home/', views.home),
	path('', views.index),
	path('versement/', views.index_ver,name="versement_home"),	
 	path('versement/add/', views.index_add_ver,name="versement_add"),
 	path('versement/update/<int:id>', views.index_update_ver,name="versement_update"),
]