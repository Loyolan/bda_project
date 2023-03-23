from django.shortcuts import render, redirect

def index(response):
	data = {"title": "ACCUEIL"}
	return render(response, "home.html", data)