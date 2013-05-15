# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.http import HttpResponse
import json

def index(request):
    return render_to_response('index.html', {})

def query(request):


    db = request.GET.get('db')
    dataset = request.GET.get('dataset')
    query_string = request.GET.get('query_dict').replace("'",'"')
    query_dict = json.loads(query_string)

    from utils import request_info
    dic = request_info(db, dataset, query_dict)

    ret = []
    #FIXME: formatar direito a saida
    for d in dic['results']:
        aux = {}
        aux['latitude'] = str(d['geoResult']['point']['lat'])
        aux['longitude'] = str(d['geoResult']['point']['lng'])
        aux['description'] = u'teste: lalala'
        aux['name'] = d['name']
        ret.append(aux)

    return HttpResponse(json.dumps(ret), mimetype='application/json')
