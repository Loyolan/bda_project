from django.http import HttpResponse
from django.shortcuts import render, redirect
from app.models import *
def index_ver(reponse):
    all = Versement.objects.all()
    return render(reponse,"versement.html",{'title':"VERSEMENT", 'Versements':all});
def index_add_ver(reponse):
    all=Client.objects.all()
    
    if reponse.method=="GET":
        return render(reponse,"versement_add.html",{'title':"VERSEMENT",'clients':all})
    elif reponse.method=="POST":
        if 'add' in reponse.POST:
            numero=Versement.objects.filter(num_cheque=reponse.POST["num_chec"])
            if len(numero)==0:
                versement = Versement(num_cheque=reponse.POST['num_chec'],
                                montant=reponse.POST['montant'], num_compte_id=reponse.POST['num_compte'])
                versement.save()
                return redirect("/bda/gestion_bancaires/versement/")
            else:
                error="Le numero de cheque est deja utilisé!"
                return render(reponse, 'versement_add.html', {'error': error, 'title': "VERSEMENT",'clients':all})
        else:
            return redirect("/bda/gestion_bancaires/versement/add/")
        
def index_update_ver(reponse,id):
    all=Client.objects.all()
    if reponse.method=="GET":
        versement = Versement.objects.get(num_vers=id)
        return render(reponse,"versement_update.html",{'title':"VERSEMENT",'clients':all,'versement':versement})
    elif reponse.method=="POST":
        if 'update' in reponse.POST:
            numero=Versement.objects.filter(num_cheque=reponse.POST["num_chec"])
            # print(numero.count())
            if numero.count()==0:
                client=Client.objects.get(num_compte=reponse.POST['num_compte'])
                versement = Versement.objects.get(num_vers=id)
                versement.num_cheque=reponse.POST['num_chec']
                versement.num_compte_id=client
                versement.montant=reponse.POST['montant']
                versement.save()
                return redirect("/bda/gestion_bancaires/versement/")
            else:
                versement = Versement.objects.get(num_vers=id)
                error="Le numero de cheque est deja initié par autre cheque!"
                return render(reponse, 'versement_update.html', {'error': error, 'title': "VERSEMENT", 'clients': all, 'versement': versement})
        else:
            return redirect("/bda/gestion_bancaires/versement/add/")
 

def ajax_formVer(requete):
    html_to_return = ""
    if 'value' in requete.GET:
        idm = requete.GET["value"]
        sauve = Versement.objects.get(num_vers=idm)
        sauve.delete()
        html_to_return = "Le materiel a ete supprime avec succes"
        return redirect("/bda/gestion_bancaires/versement/")
    else:
        html_to_return = "Erreur"
        return HttpResponse(html_to_return)