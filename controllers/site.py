# -*- coding: utf-8 -*-
#imports
from gluon.tools import Crud
import json

### required - do no delete
def user(): return dict(form=auth())
def download(): return response.download(request,db)
def call(): return service()
### end requires

#@auth.requires_login()
def index():
    return dict(teste='teste')

def error():
    return dict()