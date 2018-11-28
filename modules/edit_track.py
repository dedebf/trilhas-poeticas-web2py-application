#!/usr/bin/env python
# -*- coding: utf-8 -*-
from gluon import *

def edit_track_ctrl(track_id):
    db = current.db
    track = db(db.t_tracks.id == track_id).select().first()
    form = SQLFORM(db.t_tracks, track)
    form.element("#t_tracks_f_name")['_value'] = track.f_name
    for val in form.element("#t_tracks_f_parental_rating"):
        if( val['_value'] == str(track.f_parental_rating)):
            val['_selected'] = True
    form.element("#t_tracks_f_description")['_value'] = track.f_description

    #add tag input with values
    tagValues = getTagsByTrackID(track_id)

    tag_label = LABEL(XML('<b>Tag Label</b>'),_id='tagFormLabel', _name='tagLabel',_class='control-label col-sm-3')
    my_extra_element = INPUT(_id='tagForm', _name='tag', _class='tagsInputClass', _style='width:70%,right:0;', _value=tagValues, **{'_data-role': 'tagsinput'})
    my_extra_element_container = DIV(tag_label,my_extra_element, _id='tagFormContainer', _name='tag',_class='form-group',_style='height:400px;')
    form[0].insert(-1,my_extra_element_container)

    if form.process().accepted:
        current.session.flash = "form accepted"
        clear_tags_and_add_tags(form)
        #redirect(URL('show_track', args=track_id))
    elif form.errors:
        current.response.flash = "form errors"
    else :
        current.response.flash = "Please fill the form"

    return form

def getTagsByTrackID(trackID):
    db = current.db
    tagValuesRows = db(db.t_track_tags.f_track==trackID).select()
    if tagValuesRows == None:
        return ""
    else:
        tags = "";
        for row in tagValuesRows:
            tagId = int(row.f_tag)
            tags += db(db.t_tags.id==tagId).select(db.t_tags.f_name)[0].f_name + ","
        return tags
def clear_tags_and_add_tags(form):
        db = current.db
        tags = form.vars.tag
        db(db.t_track_tags.f_track==form.vars.id).delete()
        if tags:
            #to lowercase
            tags = tags.lower()
            #transform tags in a string array
            tags = tags.split(',')
            for tag in tags:
                #insert only new tags on DB
                returnedID = db.t_tags.update_or_insert(f_name=tag)
                if returnedID == None:
                    tagRow = db(db.t_tags.f_name==tag).select().first()
                    returnedID = tagRow.id
                db.t_track_tags.update_or_insert(f_track=form.vars.id, f_tag=returnedID)
