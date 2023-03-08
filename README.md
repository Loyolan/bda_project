# BDA PROJECT
## CONFIGURATION DE BASE
### FIRST STEP
>git clone repository_link.git </br>

### VIRTUAL ENV
>cd bda_project/ </br>
>python -m venv env </br>
>source env/bin/activate </br>
(windows: env\Scripts\activate) </br>
>pip install -r requirements.txt

### LAST STEP
>cd gestion_bancaires </br>
>sudo systemctl mysql start
(windows: start your mysql server)
>python manage.py migrate
>python manage.py runserver


