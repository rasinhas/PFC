# -*- coding: utf-8 -*-
from django.db import models

import requests
import datetime
import settings

class Auth(models.Model):
    
    token = models.CharField(max_length=255)
    expires = models.DateTimeField()

    @classmethod
    def get_token(cls):
        q = cls.objects.all()
        cnt = q.count()
        if cnt > 0 and q[cnt-1].expires > datetime.datetime.now():
            #get the token in the database
            obj = q[cnt-1] 
        else:
            #request to the server
            auth_url = "http://api.riodatamine.com.br/rest/request-token?app-id={0}&app-secret={1}".format(settings.APP_ID, settings.APP_SECRET)
            request = requests.get(auth_url)
            token = request.headers["x-access-token"]
            expires = datetime.datetime.fromtimestamp(float(request.headers["x-access-token-expires"]))
            obj = cls()
            obj.token = token
            obj.expires = expires
            obj.save()
        return obj

class User(models.Model):

	username = models.CharField(max_length=255)
	password = models.CharField(max_length=255)
	email = models.EmailField(max_length=255)

class Query(models.Model):
    
    user = models.ForeignKey(User)

    database = models.CharField(max_length=255)
    dataset = models.CharField(max_length=255)
    neighbourhood = models.CharField(max_length=255)
    
    date = models.DateTimeField(default=datetime.datetime.now())

class Preference(models.Model):
    
    user = models.ForeignKey(User)
    
    VALID_TYPES = [
        ('global', 'global'),
        ('restaurant', 'restaurant'),
        ('utility', 'utility'),
        ('inn', 'inn'),
        ('entertainment', 'entertainment'),
    ]
    type = models.CharField(max_length=255, choices=VALID_TYPES)

    VALID_SUBTYPES = [
        ('neighbourhood', 'neighbourhood'),
        ('price', 'price'),
        ('inn_type', 'inn_type'),
        ('food_type', 'food_type'),
        ('entertainment_type', 'entertainment_type'),
    ]
    subtype = models.CharField(max_length=255, choices=VALID_SUBTYPES)
    
    value = models.CharField(max_length=255)
