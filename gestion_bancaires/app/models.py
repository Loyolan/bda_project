from django.db import models

# Create your models here.
class User(models.Model):
    username = models.CharField(max_length=8, unique=True)
    password = models.CharField(max_length=32)
    email = models.EmailField(max_length=50, unique=True)
    role = models.CharField(max_length=5)

class Client(models.Model):
    num_compte = models.CharField(primary_key=True, max_length=5)
    nom_client = models.CharField(max_length=255)
    solde = models.IntegerField()

class Versement(models.Model):
    num_vers = models.AutoField(primary_key=True)
    num_cheque = models.CharField(max_length=5)
    num_compte = models.ForeignKey(Client, on_delete=models.CASCADE, null=False)
    montant = models.IntegerField()

class Retrait(models.Model):
     num_ret = models.AutoField(primary_key=True)
     num_cheque = models.CharField(max_length=5)
     num_compte = models.ForeignKey(Client, on_delete=models.CASCADE, null=False)
     montant = models.IntegerField()

class AuditOperation(models.Model):
    id_ao = models.AutoField(primary_key=True)
    date = models.DateField()
    num_cheque = models.CharField(max_length=5)
    num_compte = models.CharField(max_length=5)
    nom_client = models.CharField(max_length=255)
    montant = models.IntegerField()
    utilisateur = models.CharField(max_length=12)

class AuditVersement(models.Model):
    id_av = models.AutoField(primary_key=True)
    type_action = models.CharField(max_length=12)
    date = models.DateField()
    num_vers = models.CharField(max_length=5)
    num_compte = models.CharField(max_length=5)
    nom_client = models.CharField(max_length=255)
    montant_anc = models.IntegerField()
    montant_nouv = models.IntegerField()
    utilisateur = models.CharField(max_length=12)

class AuditRetrait(models.Model):
    id_av = models.AutoField(primary_key=True)
    type_action = models.CharField(max_length=12)
    date = models.DateField()
    num_ret = models.CharField(max_length=5)
    num_compte = models.CharField(max_length=5)
    nom_client = models.CharField(max_length=255)
    montant_anc = models.IntegerField()
    montant_nouv = models.IntegerField()
    utilisateur = models.CharField(max_length=12)

class AuditCompte(models.Model):
    id_av = models.AutoField(primary_key=True)
    type_action = models.CharField(max_length=12)
    date = models.DateField()
    num_compte = models.CharField(max_length=5)
    nom_client = models.CharField(max_length=255)
    solde_anc = models.IntegerField()
    solde_nouv = models.IntegerField()
    utilisateur = models.CharField(max_length=12)
