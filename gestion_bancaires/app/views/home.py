from django.shortcuts import render, redirect
from app.models import Client
def login(r):
	# if r.method == 'POST':
	# 	form = r.POST
	# 	if form['username'] == 'bda' and form['password'] == 'bda1':
	# 		return redirect('/bda/gestion_bancaires/home/')
	# 	elif form['username'] == 'admin' and form['password'] == 'admin':
	# 		return redirect('/bda/gestion_bancaires/login/')
	# 	else:
	# 		message = "Mot de passe ou nom d'utilisateur incorrect !"
	# 		data = {'message': message}
	# 		return render(r, 'login.html', data)
	# else:
	# message = ""
	# data = {'message': message}
	return render(r, 'login.html')

def index(response):
	clients = Client.objects.all()
	total = sum([c.solde for c in clients])
	for c in clients:
		c.percent = round((c.solde / total) * 100, 2)
	data = {"title": "ACCUEIL", "clients": clients, }
	return render(response, "home.html", data)