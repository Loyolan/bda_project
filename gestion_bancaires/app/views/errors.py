from django.shortcuts import render, redirect

def not_found(response, message):
	data = {"title": "NOT FOUND", "error_type": "404 NOT FOUND", "message": message}
	return render(response, "not_found.html", data)

def server_error(response, message):
	data = {"title": "SERVER ERROR", "error_type": "500 SERVER ERROR", "message": message}
	return render(response, "server_error.html", data)