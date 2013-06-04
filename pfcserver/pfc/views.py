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

    args = {}
    if 'db' in request.GET:
        args['db'] = request.GET.get('db')
    if 'dataset' in request.GET:
        args['dataset'] = request.GET.get('dataset')
    if 'query_dict' in request.GET:
        query_string = request.GET.get('query_dict').replace("'",'"')
        args['query_dict'] = json.loads(query_string)

    if 'uid' in request.GET:
        user = User.objects.get(id=request.GET.get('uid'))
        Query.objects.create(**{
            'user': user,
            'database': args['db'],
            'dataset': args['dataset'],
            'neighbourhood': args['query_dict']['neighbourhood'],
        })

    keys = args['query_dict'].keys()
    for key in keys:
        if not args['query_dict'][key]:
            del args['query_dict'][key]
    

    from utils import request_info
    dic = request_info(**args)

    if 'extras' in request.GET:
        args['extras'] = json.loads(request.GET.get('extras'))

    ret = []
    #FIXME: formatar direito a saida
    if 'results' in dic:
        for d in dic['results']:
            
            if 'extras' in args:
                if 'price' in args['extras'] and d['characteristics']['price'] != args['extras']['price']:
                    continue

                if 'food_types' in args['extras'] and d['taxonomies'][0]['type'] not in args['extras']['food_types']:
                    continue

                if 'type' in args['extras']:
                    valid = 0
                    if (not 'taxonomies' in d) or (not 'type' in d['taxonomies'][0]):
                        continue
                    for t in args['extras']['type']:
                        if t in d['taxonomies'][0]['type']:
                            valid = 1
                    if not valid:
                        continue
                
                if 'remove_type' in args['extras']:
                    if (not 'taxonomies' in d) or (not 'type' in d['taxonomies'][0]):
                        continue
                    for t in args['extras']['remove_type']:
                        if t in d['taxonomies'][0]['type']:
                            continue

            aux = {}
            if 'geoResult' in d:
                aux['latitude'] = str(d['geoResult']['point']['lat'])
                aux['longitude'] = str(d['geoResult']['point']['lng'])
            params = {}
            params['results'] = d
            if 'db' in args:
                params['db'] = args['db']
            if 'dataset' in args:
                params['dataset'] = args['dataset']
            aux['description'] = parse_description(**params)
            if not aux['description']:
                print d
                continue
            aux['name'] = d['name']
            ret.append(aux)

    return HttpResponse(json.dumps(ret), mimetype='application/json')

def parse_description(results, db='infraestruturas', dataset='delegacias-policiais'):

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
    elif dataset == "o-que-fazer":
        address = results['geoResult']['address']
        style = results['taxonomies'][0]['type']
        price = results['characteristics']['price']
        short_text = ""
        if 'description' in results and 'short_text' in results['description']:
            short_text = results['description']['short_text']
        desc = u"Type: {0}\nPrice: {1}\nAddress: {2}\nDescription: {3}".format(
            style,
            price,
            address,
            short_text,
        )

    return desc
