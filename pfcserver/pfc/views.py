# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.http import HttpResponse
import json

def index(request):
    return render_to_response('index.html', {})

def query(request):
    ret = {
        "name": "Vialink",
        "description": "TESTE: legal\nJonis: kibe\nTipo: merda\nComida: salgadinho\na:b\nc:d\ne:f\n",
        "latitude": "-22.925657",
        "longitude": "-43.240798",
    }
    return HttpResponse(json.dumps(ret), mimetype='application/json')
