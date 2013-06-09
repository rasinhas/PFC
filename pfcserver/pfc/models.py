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
            # request to the server
            auth_url = "http://api.riodatamine.com.br/rest/request-token?app-id={0}&app-secret={1}".format(settings.APP_ID, settings.APP_SECRET)
            try:
                request = requests.get(auth_url, timeout=1)
                token = request.headers["x-access-token"]
                expires = datetime.datetime.fromtimestamp(float(request.headers["x-access-token-expires"]))
                obj = cls()
                obj.token = token
                obj.expires = expires
                obj.save()
            except requests.Timeout:
                ## FIXME -- tratar melhor isso. Se não conseguir se comunicar com o datamine e o banco tiver vazio da merda
                ## workaround -- se n tiver objeto no banco eu crio um carteado
                if cnt > 0:
                    return q[cnt-1]
                else:
                    obj = cls()
                    obj.token = '0'
                    obj.expires = datetime.datetime.now()
                    obj.save()
        return obj

class User(models.Model):

    username = models.CharField(max_length=255)
    password = models.CharField(max_length=255)
    email = models.EmailField(max_length=255)
    
    preference_utility_neighbourhood = models.CharField(max_length=255, default="")
    
    preference_restaurant_neighbourhood = models.CharField(max_length=255, default="")
    preference_restaurant_price = models.CharField(max_length=255, default="$")
    preference_restaurant_type = models.CharField(max_length=255, default="")
    
    preference_inn_neighbourhood = models.CharField(max_length=255, default="")
    preference_inn_price = models.CharField(max_length=255, default="$")
    
    preference_entertainment_neighbourhood = models.CharField(max_length=255, default="")
    preference_entertainment_price = models.CharField(max_length=255, default="$")


class Query(models.Model):
    
    user = models.ForeignKey(User)

    database = models.CharField(max_length=255)
    dataset = models.CharField(max_length=255)
    neighbourhood = models.CharField(max_length=255)
    
    date = models.DateTimeField(default=datetime.datetime.now())
