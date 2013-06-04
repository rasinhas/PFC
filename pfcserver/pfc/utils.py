# -*- coding: utf-8 -*-

from pfc.models import Auth

import requests
import urllib
import json

def request_info(db="infraestruturas",dataset="delegacias-policiais",query_dict={}, response_format="json"):
    '''request_info(String, String, dict, String)
        This method performs a request to the Rio DataMine API and returns a dict of the results
        The first parameter is the database where the query will be applied on;
        The second parameter is the dataset where the query will be applied on;
        The third parameter is the dict containing the query parameters;
        The last parameter is the desired format of the response (json/kml).
    '''

    token = Auth.get_token().token
    headers = {'Authorization': token}

    query = urllib.urlencode(query_dict).replace("+"," ")

    url = "http://api.riodatamine.com.br/rest/{0}/{1}?format={2}&{3}".format(db,dataset,response_format,query)

    req = requests.get(url,headers=headers)
    return json.loads(req.content)
