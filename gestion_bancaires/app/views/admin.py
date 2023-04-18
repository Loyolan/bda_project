from django.shortcuts import render, redirect
from app.models import AuditOperation, AuditVersement, AuditRetrait, AuditCompte


def audit_operation(r):
	data = {
		"title": "AUDIT OPERATION",
		"audits" : AuditOperation.objects.all()
	}
	return render(r, 'audit_operation.html', data)


def audit_versement(r):
	data = {
		"title": "AUDIT VERSEMENT",
		"audits" : AuditVersement.objects.all()
	}
	return render(r, 'audit_versement.html', data)


def audit_retrait(r):
	data = {
		"title": "AUDIT RETRAIT",
		"audits" : AuditRetrait.objects.all()
	}
	return render(r, 'audit_retrait.html', data)


def audit_compte(r):
	data = {
		"title": "ADMINISTRATION",
		"audits" : AuditCompte.objects.all()
	}
	return render(r, 'audit_compte.html', data)