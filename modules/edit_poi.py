#!/usr/bin/env python
# -*- coding: utf-8 -*-
from gluon import *

def edit_poi_ctrl(track_id, poi_id):
    db = current.db
    poi = db(db.t_pois.id == poi_id).select().first()
    form = SQLFORM(db.t_pois, poi)

    form.element("#t_pois_f_track")['_disabled'] = "disabled"
    for val in form.element("#t_pois_f_track"):
        if (val['_selected'] == 'selected'):
            x = val['_value']
    my_extra_element = INPUT(_name='f_track',value=x, _type='text', _hidden=True)
    form[0].insert(0,my_extra_element)
    form.element("#t_pois_f_placing")['_readonly'] = True
    if form.process().accepted:
        current.session.flash = "form accepted"
        redirect(URL('show_track', args=track_id))
    elif form.errors:
        current.response.flash = "form errors"
    else :
        current.response.flash = "Please fill the form"

    return form
