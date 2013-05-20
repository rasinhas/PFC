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
