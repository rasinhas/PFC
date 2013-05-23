# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.http import HttpResponse
from pfc.models import User, Query
import json

def index(request):
    return render_to_response('index.html', {})


def login(request):
    username = request.POST.get('username')
    password = request.POST.get('password')

   
    ret = {'success': False, 'errors': "", 'uid': 0}

    q = User.objects.filter(username=username, password=password)

    if len(q) == 1:
        ret['success'] = True
        ret['uid'] = q[0].id

    return HttpResponse(json.dumps(ret), mimetype='application/json')

def register(request):
    username = request.POST.get('username')
    password = request.POST.get('password')
    email = request.POST.get('email')

    q = User.objects.filter(username=username)
   
    ret = {'success': False, 'errors': ""}

    if len(q) == 0:
        User.objects.create(username=username, password=password, email=email)
        ret['success'] = True

    return HttpResponse(json.dumps(ret), mimetype='application/json')

def edit_profile(request):
    username = request.POST.get('username')
    new_password = request.POST.get('new_password')
    old_password = request.POST.get('old_password')
    email = request.POST.get('email')

    q = User.objects.filter(username=username, password=old_password)
   
    ret = {'success': False, 'errors': ""}

    if len(q) == 1:
        u = q[0]
        if new_password != "":
            u.password = new_password
        if email != "":
            u.email = email
        u.save()
        ret['success'] = True

    return HttpResponse(json.dumps(ret), mimetype='application/json')

def query(request):

    db = request.GET.get('db')
    dataset = request.GET.get('dataset')
    query_string = request.GET.get('query_dict').replace("'",'"')
    query_dict = json.loads(query_string)
    extras = json.loads(request.GET.get('extras'))

    user = User.objects.get(id=request.GET.get('uid'))
    Query.objects.create(**{
        'user': user,
        'database': db,
        'dataset': dataset,
        'neighbourhood': query_dict['neighbourhood'],
    })

    from utils import request_info
    dic = request_info(db, dataset, query_dict)

    ret = []
    #FIXME: formatar direito a saida
    for d in dic['results']:

        if 'price' in extras and d['characteristics']['price'] != extras['price']:
            continue

        if 'food_types' in extras and d['taxonomies'][0]['type'] not in extras['food_types']:
            continue

        aux = {}
        aux['latitude'] = str(d['geoResult']['point']['lat'])
        aux['longitude'] = str(d['geoResult']['point']['lng'])
        aux['description'] = parse_description(db, dataset, d)
        aux['name'] = d['name']
        ret.append(aux)

    return HttpResponse(json.dumps(ret), mimetype='application/json')

def parse_description(db, dataset, results):

    desc = ""
    if db == "infraestruturas":
        address = results['geoResult']['address']
        text = results['description']['text']
        desc = u"Address: {0}\n{1}".format(
            address, 
            text, 
        )
    elif dataset == "onde-comer":
        address = results['geoResult']['address']
        price = results['characteristics']['price']
        style = results['taxonomies'][0]['type']
        short_text = results['description']['short_text']
        desc = u"Type: {0}\nPrice: {1}\nAddress: {2}\nDescription: {3}".format(
            style,
            price,
            address,
            short_text,
        )

    return desc
