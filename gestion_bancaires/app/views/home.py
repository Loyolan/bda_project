from django.shortcuts import render

# Create your views here.

def home(response):
	data = {"title": "ACCUEIL"}
	return render(response, "home.html", data)