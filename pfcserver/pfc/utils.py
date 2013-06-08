# -*- coding: utf-8 -*-

from pfc.models import Auth

import requests
import urllib
import json

def request_info(db="infraestruturas",dataset="delegacias-policiais",query_dict={}, response_format="json"):
    '''request_info(String, String, dict, String)
        This method performs a request to the Rio DataMine API and returns a dict of the results
        In case of a timeout of more than 1s on the request, a backup system will be used to get the dict of results
        The first parameter is the database where the query will be applied on;
        The second parameter is the dataset where the query will be applied on;
        The third parameter is the dict containing the query parameters;
        The last parameter is the desired format of the response (json/kml).
    '''

    token = Auth.get_token().token
    headers = {'Authorization': token}

    query = urllib.urlencode(query_dict).replace("+"," ")

    url = "http://api.riodatamine.com.br/rest/{0}/{1}?format={2}&{3}".format(db,dataset,response_format,query)
    
    try:
        req = requests.get(url,headers=headers, timeout=1)
        return json.loads(req.content)
    except requests.Timeout:

        filename = "pfc/dumps/{0}_{1}.txt".format(db, dataset)
        with open(filename, "r") as f:
            response = json.loads(f.read())
            if query_dict:
                results = response['results'] 
                filtered_results = []
                # only by neighbourhood 
                # FIXME: nao funciona para Utility (os dados nao tem informacoes suficientes para serem filtrados)
                if 'neighbourhood' in query_dict:
                    for obj in results:
                        if 'geoResult' in obj and 'neighbourhood' in obj['geoResult']:
                            if obj['geoResult']['neighbourhood'].lower() == query_dict['neighbourhood'].lower():
                                filtered_results.append(obj)
                response['results'] = filtered_results
            return response
