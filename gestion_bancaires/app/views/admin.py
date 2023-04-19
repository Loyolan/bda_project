from django.shortcuts import render, redirect
from app.models import AuditOperation, AuditVersement, AuditRetrait, AuditCompte


def audit_operation(r):
	data = {
		"title": "OPERATION",
		"audits" : AuditOperation.objects.all()
	}
	return render(r, 'admin/audit_operation.html', data)


def audit_versement(r):
	data = {
		"title": "VERSEMENT",
		"audits" : AuditVersement.objects.all()
	}
	return render(r, 'admin/audit_versement.html', data)


def audit_retrait(r):
	data = {
		"title": "RETRAIT",
		"audits" : AuditRetrait.objects.all()
	}
	return render(r, 'admin/audit_retrait.html', data)


def audit_compte(r):
	data = {
		"title": "COMPTE",
		"audits" : AuditCompte.objects.all()
	}
	return render(r, 'admin/audit_compte.html', data)