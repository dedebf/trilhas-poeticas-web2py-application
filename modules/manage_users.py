#!/usr/bin/env python
# -*- coding: utf-8 -*-
from gluon import *
from gluon.tools import Crud
import webgrid as webgrid
#webgrid = local_import('webgrid')


def list_users():
    db = current.db
    tracks = db.auth_user
    crud = Crud(db)

    grid = webgrid.WebGrid(crud)
    grid.datasource = db.auth_user

    grid.pagesize = 10
    grid.filter_query = lambda f,v: f==v
    return grid()
