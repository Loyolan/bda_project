from django.shortcuts import render, redirect
from django.contrib import messages
from app.models import *
from django.db import transaction


# Create your views here.
#def index(res):
#	return redirect('/bda/gestion_bancaires/home/')

def show_page_retrait(response):
	data = {"title": "RETRAIT"}
	return render(response, "retrait.html", data)

def retrait(request):
	if request.method == "POST":
		try:
			with transaction.atomic():
				num_compte = request.POST.get('num_compte')
				num_cheque = request.POST.get('num_cheque')
				montant = request.POST.get('montant')
				client = Client.objects.get(num_compte = num_compte)
				if client.solde >= int(montant):
					# client.solde -= int(montant)
					# client.save()

					obj_retrait = Retrait.objects.create(num_cheque = num_cheque, montant = montant, num_compte = client)
					obj_retrait.save()
					msg = "Vous avez fait un retrait de {} Ar".format(montant)
					messages.success(request, msg)
				else:
					msg = "Votre solde est insuffisant. Votre solde est de {} Ar".format(client.solde)
					messages.success(request, msg)
		except Exception as e:
			print(e)
			messages.success(request, "Quelque chose s'est mal passé")
	return redirect('showpageretrait')


def show_page_journalier(request):
	nombre_clients = Client.objects.count()
	nombre_retraits = Retrait.objects.count()
	nombre_versement = AuditVersement.objects.count()
	nombre_compte = AuditCompte.objects.count()
	retraits = Retrait.objects.select_related('num_compte').all()	
	return render(request, "journalier.html", {'nbr_cli':nombre_clients,'nbr_versement':nombre_versement,'nbr_retrait':nombre_retraits,'nbr_compte':nombre_compte,'key1':retraits, 'title': "JOURNALIER"})
