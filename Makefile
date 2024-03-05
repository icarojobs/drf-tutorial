.PHONY:	default
default:
	@echo "--> Installing all dependencies..."
	@python3 -m venv env
	@source env/bin/activate
	@pip install django
	@pip install djangorestframework
	@pip install jupyterlab
	@django-admin startproject core .
	@django-admin startapp quickstart

.PHONY:	run
run:
	@echo "--> Opening Jupyter Notebook"
	source env/bin/activate
	@jupyter lab

.PHONY:	migrate
migrate:
	@echo "--> Creating and making migrations..."
	source env/bin/activate
	@python manage.py makemigrations
	@python manage.py migrate

.PHONY: createsuperuser
createsuperuser:
	@echo "--> Creating new super user for django admin"
	@python manage.py createsuperuser --username admin --email admin@admin.com