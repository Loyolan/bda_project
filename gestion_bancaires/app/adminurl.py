from django.urls import path
from app.views import admin

urlpatterns = [
	path('audit_operation/', admin.audit_operation),
	path('audit_versement/', admin.audit_versement),
	path('audit_retrait/', admin.audit_retrait),
	path('audit_compte/', admin.audit_compte)
]