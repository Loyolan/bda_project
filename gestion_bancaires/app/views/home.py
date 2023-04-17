from django.shortcuts import render, redirect

def login(r):
	return render(r, 'login.html')

def index(response):
	data = {"title": "ACCUEIL"}
	return render(response, "home.html", data)