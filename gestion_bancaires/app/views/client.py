from django.shortcuts import render, redirect
from app.forms.client import ClientForm
from app.models import Client
from app.views import errors 

#========== LISTE DES CLIENTS =============#
def clients(response):
	clients = Client.objects.all()
	num_cli = [int(num.num_compte) for num in clients]
	data = {"title": "CLIENTS", "clients": clients, "num_cli": num_cli}
	return render(response, "client.html", data)

#========== ADD CLIENT ====================#
def addClient(request):
	if request.method == 'POST':
		form = ClientForm(request.POST)
		if form.is_valid():
			form.save()
			return redirect('/bda/gestion_bancaires/clients/')
		else:
			return errors.server_error(request, "Erreur inattendu du serveur, Echec de l'enregistrement")
	else:
		return errors.server_error(request, "Cette page n'est pas accessible avec la methode 'GET'!")

#============ UPDATE CLIENT ===============#
def updateClient(request, num_compte):
	if request.method == 'POST':
		client = Client.objects.get(num_compte=num_compte)
		form = ClientForm(request.POST, instance=client)
		if form.is_valid():
			form.save()
			return redirect('/bda/gestion_bancaires/clients/')
		else:
			return errors.server_error(request, "Erreur inattendu du serveur, Echec de l'enregistrement")
	else:
		return errors.server_error(request, "Cette page n'est pas accessible avec la methode 'GET'!")

#============ DELETE CLIENT ================#
def deleteClient(request, num_compte):
	client = Client.objects.get(num_compte=num_compte)
	client.delete()
	return redirect('/bda/gestion_bancaires/clients/')