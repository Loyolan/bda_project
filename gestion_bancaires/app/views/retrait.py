from django.shortcuts import render, redirect
from django.contrib import messages
from app.models import *
from django.db import transaction


# Create your views here.
#def index(res):
#	return redirect('/bda/gestion_bancaires/home/')

def show_page_retrait(response):
	clients = Client.objects.all()
	data = {"title": "RETRAIT", "clients": clients}
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
	retraits = Retrait.objects.select_related('num_compte').all()	
	return render(request, "journalier.html", {'key1':retraits, 'title': "JOURNALIER"})


def index_update_ret(reponse,id):
    all=Client.objects.all()
    if reponse.method=="GET":
        retrait = Retrait.objects.get(num_ret=id)
        return render(reponse,"retrait_update.html",{'title':"RETRAIT",'clients':all,'retrait':retrait})
    elif reponse.method=="POST":
        if 'update' in reponse.POST:
            numero=Retrait.objects.filter(num_cheque=reponse.POST["num_chec"])
            #print(numero.count())
            if len(numero) == 1:
                client=Client.objects.get(num_compte=reponse.POST['num_compte'])
                retrait = Retrait.objects.get(num_ret=id)
                retrait.num_cheque=reponse.POST['num_chec']
                retrait.num_compte_id=client
                retrait.montant=reponse.POST['montant']
                retrait.save()
                return redirect("/bda/gestion_bancaires/showpagejournalier/")
            else:
                retrait = Retrait.objects.get(num_ret=id)
                error="Le numero de cheque est deja initié par autre cheque!"
                return render(reponse, 'retrait_update.html', {'error': error, 'title': "RETRAIT", 'clients': all, 'retrait': retrait})
        else:
            return redirect("/bda/gestion_bancaires/showpagejournalier/")

def delete_retrait(r, id):
	ret = Retrait.objects.get(num_ret=id)
	ret.delete()
	return redirect("/bda/gestion_bancaires/showpagejournalier/")