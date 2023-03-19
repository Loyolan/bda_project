from django.shortcuts import render, redirect

# Create your views here.
def index(res):
	return redirect('/bda/gestion_bancaires/home/')

def home(response):
	data = {"title": "ACCUEIL"}
	return render(response, "home.html", data)