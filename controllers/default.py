# -*- coding: utf-8 -*-
#imports
import datetime
from gluon.tools import Crud
import list_tracks as list_t
import edit_track as edit_t
import json

### required - do no delete
def user(): return dict(form=auth())
def download(): return response.download(request,db)
def call(): return service()
### end requires

@auth.requires_login()
def index():
    return list_my_tracks(auth.user_id)

def error():
    return dict()

@auth.requires_login()
def tracks_manage():
    form = SQLFORM.smartgrid(db.t_tracks,onupdate=auth.archive)
    return locals()

@auth.requires_login()
def pois_manage():
    form = SQLFORM.smartgrid(db.t_pois,db.t_tags,onupdate=auth.archive)
    return locals()

@auth.requires_login()
def track_ratings_manage():
    form = SQLFORM.smartgrid(db.t_track_ratings,onupdate=auth.archive)
    return locals()

@auth.requires_login()
def tags_manage():
    form = SQLFORM.smartgrid(db.t_tags,onupdate=auth.archive)
    return locals()

@auth.requires_login()
def parental_ratings_manage():
    form = SQLFORM.smartgrid(db.t_parental_ratings,onupdate=auth.archive)
    return locals()

@auth.requires_login()
def track_pois_manage():
    form = SQLFORM.smartgrid(db.t_track_pois,onupdate=auth.archive)
    return locals()

@auth.requires_login()
def track_tags_manage():
    form = SQLFORM.smartgrid(db.t_track_tags,onupdate=auth.archive)
    return locals()

@auth.requires_login()
def nova_trilha():
    form = SQLFORM(db.t_tracks,submit_button=T('Criar'))

    #add tag input
    tag_label = LABEL(XML('<b>Tag Label</b>'),_id='tagFormLabel', _name='tagLabel',_class='control-label col-sm-3')
    my_extra_element = INPUT(_id='tagForm', _name='tag', _class='tagsInputClass', _placeholder='Escreva ao menos uma tag', _style='width:70%,right:0;', **{'_data-role': 'tagsinput'})
    my_extra_element_container = DIV(tag_label,my_extra_element, _id='tagFormContainer', _name='tag',_class='form-group',_style='height:auto;')
    form[0].insert(-1,my_extra_element_container)

    def adding_tag(form):
        tags = form.vars.tag
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

    if form.process().accepted:
        adding_tag(form)
        response.flash = "form accepted"
        redirect(URL('form2',args=(form.vars.id)))
    elif form.errors:
        response.flash = "form errors"
    ###else :
       ### response.flash = "Please fill the form"
    return locals()

@auth.requires_login()
def form2():
    buttons=[]
    buttons.append(TAG.button('Concluir',_name="end", _type="submit", _class="btn-primary"))
    buttons.append(TAG.button('Concluir e Add Prox',_name="next", _type="submit", _class="btn-primary"))
    form = SQLFORM(db.t_pois, buttons=buttons)
    #add map element
    map_label = LABEL(XML('<b>Map Label</b>'),_id='mapFormLabel', _name='mapLabel',_class='control-label col-sm-3')
    my_extra_element = DIV(_id='mapForm', _name='map',_style='height:400px;width:70%,right:0;')
    my_extra_element_container = DIV(map_label,my_extra_element, _id='mapFormContainer', _name='map',_class='form-group',_style='height:400px;')
    form[0].insert(-1,my_extra_element_container)
    if len(request.args) == 1:
        form.vars.f_track = request.args[0]
        form.element('#t_pois_f_track')['_disabled'] = 'disabled'
        my_extra_element = INPUT(_name='f_track',value=form.vars.f_track, _type='text', _hidden=True)
        form[0].insert(0,my_extra_element)

        form.vars.f_placing = 0;

    if len(request.args) == 2:
        form.vars.f_track = request.args[0]
        form.element('#t_pois_f_track')['_disabled'] = 'disabled'
        my_extra_element = INPUT(_name='f_track',value=form.vars.f_track, _type='text', _hidden=True)
        form[0].insert(-1,my_extra_element)

        form.vars.f_placing = int(request.args[1]) + 1

        ## Quando submeter o form, testar se o valor recebido através de f_track é igual ao valor que veio via URL, para evitar a url injection
    if form.process().accepted:
        if request.vars.end != None:
            session.flash = "form accepted"
            redirect(URL('default','index'))
        elif request.vars.next != None:
            response.flash = "form accepted"
            redirect(URL('form2',args=(form.vars.f_track,form.vars.f_placing)))
        #response.flash = "form accepted"
        #redirect(URL('form2',args=(form.vars.f_track,form.vars.f_placing)))
        session.flash = "Algum erro aconteceu!"
        redirect(URL('default','index'))
    elif form.errors:
        response.flash = "form errors"
    else :
        response.flash = "Please fill the form"
        ##session.flash = "Para criar um ponto, primeiro você deve criar uma trilha."
        ##redirect(URL('form1'))
    return dict(form=form, f_track=form.vars.f_track, f_placing=form.vars.f_placing)

@auth.requires_login()
def form3():
    from gluon.tools import geocode
    latitude = longtitude = ''
    form=SQLFORM.factory(Field('search'), _class='form-search')
    form.custom.widget.search['_class'] = 'input-long search-query'
    form.custom.submit['_value'] = 'Search'
    form.custom.submit['_class'] = 'btn'
    if form.accepts(request):
        address=form.vars.search
        (latitude, longitude) = geocode(address)
    else:
        (latitude, longitude) = geocode('UNB')
    return dict(form=form, latitude=latitude, longitude=longitude)

##fazendo testes
@auth.requires_login()
def track_list():
    grid = SQLFORM.smartgrid(db.t_tracks,linked_tables=['child'])
    #grid = SQLFORM.grid(db.auth_user,
    #editable = auth.has_membership('managers'),
    #deletable = auth.has_membership('managers'))
    return locals()


@auth.requires_login()
def list_tracks():
    db = current.db
    tracks = db.t_tracks
    crud = Crud(db)

    grid = webgrid.WebGrid(crud)
    grid.datasource = db(db.t_tracks.is_active==True)

    grid.pagesize = 5

    grid.enabled_rows = ['header', 'pager','footer']

    grid.fields = ['t_tracks.id','t_tracks.f_owner','t_tracks.f_name','t_tracks.f_description','t_tracks.f_parental_rating']

    grid.field_headers = ['ID','Criador','Titulo','Descrição','Classificação']

    grid.action_links = ['view','edit','delete']
    grid.action_headers = ['Visualizar','Editar','Remover']

    grid.filters = ['t_tracks.f_owner','t_tracks.f_parental_rating']

    grid.allowed_vars = ['pagesize','pagenum','sortby','ascending','groupby']

    grid.filter_query = lambda f,v: f==v

    grid.view_link = lambda row: A(IMG(_src=URL('static','images/search-icon.png'),_alt='test', _width='12px', _height='12px'),
                                   _href=URL('show_track',
                                   args=row.id))
    grid.edit_link = lambda row: A(IMG(_src=URL('static','images/backend_EDIT.png'),_alt='test', _width='12px', _height='12px'), _href=URL('edit_track', args=row.id))
    grid.delete_link = lambda row: A(IMG(_src=URL('static','images/backend_DEL.png'),_alt='test', _width='12px', _height='12px'), _onclick="return confirm('Tem certeza bro?')", _href=URL('remove_track', args=row.id))
    grid.row_created = webgrid.links_right
    
    return dict(grid=grid())

@auth.requires_login()
def list_my_tracks(user_id):
    db = current.db
    tracks = db.t_tracks
    crud = Crud(db)

    grid = Webgrid2(crud)
    #grid.datasource = db(db.t_tracks.is_active==True)
    grid.datasource = db((db.t_tracks.is_active==True) & (db.t_tracks.f_owner==user_id))
    grid.pagesize = 10



    grid.enabled_rows = ['header', 'pager','footer']

    grid.fields = ['t_tracks.f_icon','t_tracks.f_parental_rating','t_tracks.f_name','t_tracks.f_description']

    grid.field_headers = ['IMAGEM','CLASSIFICAÇÃO','TÍTULO','DESCRIÇÃO','CLASSIFICAÇÃO']

    grid.action_links = ['view','edit','delete']
    grid.action_headers = ['VER','EDITAR','TIRAR']

    #grid.filters = ['t_tracks.f_owner','t_tracks.f_parental_rating']
    grid.filters = []
    grid.allowed_vars = ['pagesize','pagenum','sortby','ascending','groupby']

    grid.imagem = lambda fields : TFOOT(TD("This is my image" , 
                                                      _colspan=len(grid.action_links)+len(fields),
                                                      _style="text-align:center;"),
                                               _class=grid.css_prefix + '-webgrid imagem')

    grid.filter_query = lambda f,v: f==v

    grid.view_link = lambda row: A(IMG(_src=URL('static','images/search-icon.png'),_alt='test', _class="action-icon"),
                                   _href=URL('show_track',
                                   args=row.id))
    grid.edit_link = lambda row: A(IMG(_src=URL('static','images/backend_EDIT.png'),_alt='test', _class="action-icon"), _href=URL('edit_track', args=row.id))
    grid.delete_link = lambda row: A(IMG(_src=URL('static','images/backend_DEL.png'),_alt='test', _class="action-icon"), _onclick="return confirm('Tem certeza que deseja exluir esta trilha?')", _href=URL('remove_track', args=row.id))
    grid.row_created = webgrid.links_right
    return dict(grid=grid())

@auth.requires_login()
def show_track():
    track_id = request.args(0) or redirect(URL('default','index'))
    if not is_my_track(track_id):
        session.flash="Esta Trilha parece não pertencer a você.";
        redirect(URL('default','index'))
    crud = Crud(db)
    #getting list of tags
    tags = ""
    for row in db(db.t_track_tags.f_track==track_id).select():
        tags += db(db.t_tags.id==row.f_tag).select(db.t_tags.f_name)[0].f_name +"; "
    #adding button for edit
    buttons=[]
    #b_editar_trilha = INPUT(_value="Editar Trilha", _type="button", _class="btn-primary", _onclick="javascript:window.location.href = '/default/edit_track/'"+track_id)
#    b_editar_trilha = TAG.button('Editar Trilha',_name="edit", _type="submit", _class="btn-primary")
    b_editar_trilha = A("editar trilha", _class='editar-trilha btn btn-primary', _href=URL("edit_track", args=track_id))
    b_add_poi = A("adicionar ponto", _class='editar-ponto btn btn-primary', _href=URL("form2", args=[track_id,getLastPlacing(track_id)]))
    #create a static path of pois
    #path = '[[-12.044012922866312, -77.02470665341184], [-12.05449279282314, -77.03024273281858], [-12.055122327623378, -77.03039293652341], [-12.075917129727586, -77.02764635449216], [-12.07635776902266, -77.02792530422971], [-12.076819390363665, -77.02893381481931], [-12.088527520066453, -77.0241058385925], [-12.090814532191756, -77.02271108990476]]'

    f_track = db(db.t_tracks.id==track_id).select()[0]
    f_name = f_track.f_name
    f_description = f_track.f_description
    f_parental_rating = f_track.f_parental_rating
    f_owner = f_track.f_owner
    f_create_date = f_track.f_create_date
    f_icon = f_track.f_icon
    f_id = f_track.id

    return dict(f_id=f_id, f_name=f_name, f_description=f_description, f_owner=f_owner, f_parental_rating=f_parental_rating, f_create_date=f_create_date, f_icon=f_icon, show=crud.read(db.t_tracks,track_id),tags=tags, grid=list_points(track_id), path=makePathPois(track_id,False), b_editar_trilha=b_editar_trilha, b_add_poi=b_add_poi, lista = db((db.t_pois.is_active==True) & (db.t_pois.f_track==track_id)).select())

@auth.requires_login()
def list_points(track_id):
    tracks = db.t_pois
    crud = Crud(db)

    grid = webgrid.WebGrid(crud)
    #grid.datasource = db(db.t_tracks.is_active==True)
    grid.datasource = db((db.t_pois.is_active==True) & (db.t_pois.f_track==track_id)).select(orderby=db.t_pois.f_placing)

    grid.pagesize = 10

    grid.enabled_rows = ['pager']

    grid.fields = ['t_pois.id', 't_pois.f_name', 't_pois.f_content', 't_pois.f_placing']

    grid.field_headers = ['id', 'nome', 'descição', 'posição']


    grid.action_links = ['edit','delete']
    grid.action_headers = ['edit','delete']

    grid.filter_query = lambda f,v: f==v

    grid.edit_link = lambda row: A(IMG(_src=URL('static','images/backend_EDIT.png'),_alt='test', _class='btn-edit'), _href=URL('edit_poi', args=(request.args(0),row.id)))
    grid.delete_link = lambda row: A(IMG(_src=URL('static','images/backend_DEL.png'),_alt='test', _class='btn-edit'), _onclick="return confirm('Tem que deseja excluir este ponto?')", _href=URL('remove_point', args=[row.id,track_id]))

    grid.row_created = links_right_2
    
    return grid()

# see edit_poi
@auth.requires_login()
def edition():
    crud = Crud(db)
    form=crud.update(db.t_pois, request.args(0))
    #add map element
    map_label = LABEL(XML('<b>Map Label</b>'),_id='mapFormLabel', _name='mapLabel',_class='control-label col-sm-3')
    map_td_label = TD(map_label, _class='w2p_fl')
    my_extra_element = DIV(_id='mapForm', _name='map',_style='height:400px;width:70%,right:0;')
    my_extra_element_container = TR(map_td_label,my_extra_element, _id='mapFormContainer', _name='map',_class='form-group',_style='height:400px;')
    form.element(_id="t_pois_f_placing")['_readonly'] = 'True'
    form.element('tr', _id='delete_record__row',replace=None)
    form[0].insert(-1,my_extra_element_container)
    return dict(form=form)

import edit_poi as edit_p
@auth.requires_login()
def edit_poi():
#     fake track_id for test
    track_id = request.args(0) or redirect(URL('index'))
    if not is_my_track(track_id):
        session.flash="Esta Trilha parece não pertencer a você.";
        redirect(URL('default','index'))
    poi_id = request.args(1) or redirect(URL('show_track', args=track_id))
    form = edit_p.edit_poi_ctrl(track_id, poi_id)

    #add map element
    map_label = LABEL(XML('<b>Map Label</b>'),_id='mapFormLabel', _name='mapLabel',_class='control-label col-sm-3')
    my_extra_element = DIV(_id='mapForm', _name='map',_style='height:400px;width:70%,right:0;')
    my_extra_element_container = DIV(map_label,my_extra_element, _id='mapFormContainer', _name='map',_class='form-group',_style='height:400px;')
    form[0].insert(-1,my_extra_element_container)

    return dict(form=form)

@auth.requires_login()
def makePathPois(track_id,justTitles):
        #create path of pois from rows of points
#        rows = db(db.t_pois.f_track==track_id).select()
        rows = db((db.t_pois.is_active==True) & (db.t_pois.f_track==track_id)).select()
        path = '['
#         pathTitles = "["
        for row in rows:
            path = path + '[' + row.f_latitude + ','
            path = path + row.f_longitude + '], '
#             pathTitles = pathTitles + "[" + row.f_name + "], "
        path = path + ']'
#         pathTitles = pathTitles + "]"
#         if(justTitles):
#             return pathTitles
        return path

@auth.requires_login()
def getLastPlacing(track_id):
        rows = db((db.t_pois.is_active==True) & (db.t_pois.f_track==track_id)).select()
        placing = len(rows)-1
        return placing

def links_right_2(tablerow,rowtype,rowdata):
    if rowtype != 'pager':
        links = tablerow.components[:2]
        del tablerow.components[:2]
        tablerow.components.extend(links)   

@auth.requires_login()
def edit_track() :
    track_id = request.args(0) or redirect(URL('default','index'))
    if not is_my_track(track_id):
        session.flash="Esta Trilha parece não pertencer a você.";
        redirect(URL('default','index'))
    crud = Crud(db)
    f_track = db(db.t_tracks.id==track_id).select()[0]
    form = edit_t.edit_track_ctrl(track_id)
    tagValues = edit_t.getTagsByTrackID(track_id)
    f_create_date = f_track.f_create_date

    return locals()

@auth.requires_login()
def remove_track() :
    track_id = request.args(0) or redirect(URL('default','index'))
    if not is_my_track(track_id):
        session.flash="Esta Trilha parece não pertencer a você.";
        redirect(URL('default','index'))
    track = db(db.t_tracks.id == track_id).select().first();

    #track.update_record(is_active==False)
    track.is_active = False
    if (track.update_record()):
        session.flash="Track removed!";
    else:
        session.flash="Track not removed!";
    redirect(URL('default','index'))
    ##return track;

@auth.requires_login()
def remove_point() :
    track_id = request.args(1) or redirect(URL('default','index'))
    if not is_my_track(track_id):
        session.flash="Esta Trilha parece não pertencer a você.";
        redirect(URL('default','index'))
    poi_id = request.args(0) or redirect(URL('show_track', args=track_id))

    poi = db(db.t_pois.id == poi_id).select().first();

    poi.is_active = False
    if (poi.update_record()):
        rows = db((db.t_pois.f_track==track_id)&(db.t_pois.f_placing > poi.f_placing)).select();
        if(db((db.t_pois.f_track==track_id)&(db.t_pois.f_placing >= poi.f_placing)).update(f_placing=db.t_pois.f_placing-1)):
            session.flash="POI removed!";
            db.commit()
        else:
            db.rollback()
            session.flash="POI not removed!!"
    else:
        session.flash="POI not removed!!!!"
    redirect(URL('show_track', args=track_id))
    # return rows
    ##return track;

@auth.requires(auth.has_membership('manager') or auth.has_membership('admin'))
def organize_pois_placing() :
    id_list = ''
    index = 0
    # return db(db.t_tracks.is_active==True).select()
    for track_db in db(db.t_tracks.is_active==True).select():
        id_list = id_list + str(track_db.id) + ';'
        for poi in db((db.t_pois.is_active==True)&(db.t_pois.f_track==track_db.id)).select(orderby=db.t_pois.f_placing):
            poi.f_placing = index
            poi.update_record()
            index = index+1
        index = 0;
    return id_list

def is_my_track(track_id):
    if "manager" in auth.user_groups.values():
        session.flash='Esta Trilha não é sua, você está acessando ela porque é um Gerente ou Administrador'
        return True
    elif "admin" in auth.user_groups.values():
        session.flash='Esta Trilha não é sua, você está acessando ela porque é um Gerente ou Administrador'
        return True
    else:
        if(db((db.t_tracks.id==track_id) & (db.t_tracks.f_owner==auth.user_id)).select()):
            return True 
        else:
            return False
    return False



import manage_users as m_users
@auth.requires_login()
@auth.requires(auth.has_membership('manager') or auth.has_membership('admin'))
def manage_users() :
    btn = lambda row: A("Edit", _href=URL('manage_user', args=row.auth_user.id))
    db.auth_user.edit = Field.Virtual(btn)
    rows = db(db.auth_user).select()
    headers = ["ID", "Name", "Last Name", "Email", "Edit"]
    fields = ['id', 'first_name', 'last_name', "email", "edit"]
    table = TABLE(THEAD(TR(*[B(header) for header in headers])),
                  TBODY(*[TR(*[TD(row[field]) for field in fields]) \
                        for row in rows]))
    table["_class"] = "table table-striped table-bordered table-condensed"
    return dict(grid=table)
#    return dict(grid=m_users.list_users())

@auth.requires_login()
@auth.requires(auth.has_membership('manager') or auth.has_membership('admin'))
def manage_user():
    user_id = request.args(0) or redirect(URL('list_users'))
    form = SQLFORM(db.auth_user, user_id).process()
    membership_panel = LOAD(request.controller,
                            'manage_membership.html',
                             args=[user_id],
                             ajax=True)
    return dict(form=form,membership_panel=membership_panel)

@auth.requires_login()
@auth.requires(auth.has_membership('manager') or auth.has_membership('admin'))
def manage_membership():
    user_id = request.args(0) or redirect(URL('list_users'))
    db.auth_membership.user_id.default = int(user_id)
    db.auth_membership.user_id.writable = False
    form = SQLFORM.grid(db.auth_membership.user_id == user_id,
                       args=[user_id],
                       searchable=False,
                       deletable=False,
                       details=False,
                       selectable=False,
                       csv=False,
                       user_signature=False)
    return form


def get_tracks():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'
   
    rows = db(db.t_tracks).select(
        db.auth_user.id, db.auth_user.first_name, db.auth_user.last_name, db.t_tracks.ALL,
        orderby=db.t_tracks.id,
        join=db.auth_user.on(db.t_tracks.f_owner==db.auth_user.id),
        cache=(cache.ram, 43200),
        cacheable=True
    )
##    return json.dumps([[r.id, r.f_name, r.f_parental_rating, r.f_description, r.f_owner, r.f_create_date] for r in rows])
    return rows.as_json()

def get_tags():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    rows = db(db.t_tracks).select(
        db.auth_user.id, db.auth_user.first_name, db.auth_user.last_name, db.t_tracks.ALL, db.t_tags.f_name,
        orderby=db.t_tracks.id,
        left=db.auth_user.on(db.t_tracks.f_owner==db.auth_user.id),
        join=db.t_track_tags.on(db.t_tracks.id==db.t_track_tags.f_tag),
        cache=(cache.ram, 43200),
        cacheable=True
    )
##    return json.dumps([[r.id, r.f_name, r.f_parental_rating, r.f_description, r.f_owner, r.f_create_date] for r in rows])
    return rows.as_json()



def get_tracks_by_autor():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    author_id = request.args(0) or redirect(URL('index'))
    rows = db((db.t_tracks.f_owner==author_id)).select(
        db.auth_user.id, db.auth_user.first_name, db.auth_user.last_name, db.t_tracks.ALL,
        orderby=db.t_tracks.id,
        join=db.auth_user.on((db.t_tracks.f_owner==db.auth_user.id)),
        cache=(cache.ram, 43200),
        cacheable=True
    )
##    return json.dumps([[r.id, r.f_name, r.f_parental_rating, r.f_description, r.f_owner, r.f_create_date] for r in rows])
    return rows.as_json()

def get_tracks_by_tag():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    tag = request.args(0) or null
    return null

def get_tracks_by_parental_rating():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    parental_id = request.args(0) or redirect(URL('index'))
    rows = db((db.t_tracks.f_parental_rating==parental_id)).select(
        db.auth_user.id, db.auth_user.first_name, db.auth_user.last_name, db.t_tracks.ALL,
        orderby=db.t_tracks.id,
        join=db.auth_user.on((db.t_tracks.f_owner==db.auth_user.id)),
        cache=(cache.ram, 43200),
        cacheable=True
    )
##    return json.dumps([[r.id, r.f_name, r.f_parental_rating, r.f_description, r.f_owner, r.f_create_date] for r in rows])
    return rows.as_json()

##return tags by track
def get_tags_by_track():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    track_id = request.args(0) or redirect(URL('index'))
    rows = db((db.t_track_tags.f_track==track_id)).select(db.t_tags.f_name,
        #orderby=db.t_tracks.id,
        join=db.t_tags.on(db.t_track_tags.f_tag==db.t_tags.id),
        cache=(cache.ram, 43200),
        cacheable=True,
        distinct = True
        )

    return rows.as_json()

def get_active_pois():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    rows = db(db.t_pois.is_active==True).select(
        db.t_pois.ALL,
        orderby=db.t_pois.f_track,
        cache=(cache.ram, 43200),
        cacheable=True
    )
    return rows.as_json();

def get_points():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    ##verificar se veio argumento
    track_id = request.args(0)

    rows = db(db.t_pois.f_track==track_id).select(
        db.t_pois.ALL,
        orderby=db.t_pois.f_placing,
        cache=(cache.ram, 43200),
        cacheable=True
        #join=db.t_tracks.on(db.t_tracks.f_owner==db.auth_user.id)
    )
##    return json.dumps([[r.id, r.f_name, r.f_parental_rating, r.f_description, r.f_owner, r.f_create_date] for r in rows])
    return rows.as_json();

def get_poi():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    poi_id = request.args(0)
    poi = db(db.t_pois.id==poi_id).select(
        db.t_pois.ALL
    )
    return poi.as_json();

def get_score_by_track():
    track_id = request.args(0) or redirect(URL('index'))
    liked_rows = db((db.t_track_ratings.f_track==track_id)&(db.t_track_ratings.f_score==1)).select();
    return len(liked_rows)

def set_like_track():
    track_id = request.args(0) or redirect(URL('index'))
    track_rate = request.args(1) or redirect(URL('index'))
    user_email = request.args(2) or redirect(URL('index'))

    track_rating_row = db((db.t_track_ratings.f_track==track_id)&(db.t_track_ratings.f_email==user_email)).select()
    if len(track_rating_row) > 0:
        track_rating_row[0].f_score = track_rate
        track_rating_row[0].update_record()
    else:
        db.t_track_ratings.update_or_insert(f_score=track_rate,f_track=track_id,f_email=user_email)
    liked_rows = db((db.t_track_ratings.f_track==track_id)&(db.t_track_ratings.f_score==1)).select(
        cache=(cache.ram, 0)
    );

def set_report():
    post_vars = request.post_vars
    description = post_vars['reportMsg']
    user_email  = post_vars['userEmail']
    track_id    = post_vars['trackID']
    poi_id      = post_vars['poiID']

    if(poi_id):
        db_return = db.t_reports.update_or_insert(f_description=description,f_email=user_email,f_track=int(track_id),f_poi=int(poi_id))
    else:
        db_return = db.t_reports.update_or_insert(f_description=description,f_email=user_email,f_track=int(track_id))

    return db_return

def register():
     return dict(form=auth.register());


def request_reset_password():
    return dict(form=auth.request_reset_password());

def profile():
    return dict(form=auth.profile());

def change_password():
    return dict(form=auth.change_password());

def get_full_set():
    tracks = db(db.t_tracks.is_active==True).select(
        db.auth_user.id, db.auth_user.first_name, db.auth_user.last_name, db.t_tracks.ALL,
        orderby=db.t_tracks.id,
        join=db.auth_user.on(db.t_tracks.f_owner==db.auth_user.id),
        cache=(cache.ram, 43200),
        cacheable=True
    )
    pois = db(db.t_pois.is_active==True).select(
        db.t_pois.ALL,
        orderby=db.t_pois.f_track,
        cache=(cache.ram, 43200),
        cacheable=True
    )
    full_set = {}
    full_set['tracks'] = {}
    full_set['pois'] = {}

    for idx, track in enumerate(tracks):
        full_set['tracks'][idx] = {}
        full_set['tracks'][idx]['ID'] = track.t_tracks.id
        full_set['tracks'][idx]['IS_ACTIVE'] = track.t_tracks.is_active
        if full_set['tracks'][idx]['IS_ACTIVE'] == True:
            full_set['tracks'][idx]['TRACK_NAME'] = track.t_tracks.f_name
            full_set['tracks'][idx]['DESCRIPTION'] = track.t_tracks.f_description
            full_set['tracks'][idx]['ICON'] = track.t_tracks.f_icon
            full_set['tracks'][idx]['A_F_NAME'] = track.auth_user.first_name
            full_set['tracks'][idx]['A_L_NAME'] = track.auth_user.last_name
            full_set['tracks'][idx]['A_ID'] = track.auth_user.id
            full_set['tracks'][idx]['PARENTAL_RATING'] = track.t_tracks.f_parental_rating
            full_set['tracks'][idx]['SCORE'] = len(db((db.t_track_ratings.f_track==track.t_tracks.id)&(db.t_track_ratings.f_score==1)).select())
            full_set['tracks'][idx]['TAGS'] = parse_tags_to_tag_string_by_track(track.t_tracks.id);
            full_set['tracks'][idx]['MODIFIED_ON'] = str(track.t_tracks.modified_on)

    for idx, poi in enumerate(pois):
        full_set['pois'][idx] = {}
        full_set['pois'][idx]['ID'] = poi.id
        full_set['pois'][idx]['IS_ACTIVE'] = poi.is_active
        if full_set['pois'][idx]['IS_ACTIVE'] == True:
            full_set['pois'][idx]['TRACK'] = poi.f_track
            full_set['pois'][idx]['PLACING'] = poi.f_placing
            full_set['pois'][idx]['LATITUDE'] = poi.f_latitude
            full_set['pois'][idx]['LONGITUDE'] = poi.f_longitude
            full_set['pois'][idx]['NAME'] = poi.f_name
            full_set['pois'][idx]['CONTENT'] = poi.f_content
            full_set['pois'][idx]['MODIFIED_ON'] = str(poi.modified_on)

    return json.dumps(full_set)

def get_full_set_after_date():
    date = request.args(0) or 0
    if date == '0':
        convertedDatetime = datetime.datetime.fromtimestamp(0).strftime("%Y-%m-%d_%H_%M_%S")
    else:
        date = float(date) / 1000.0
        convertedDatetime = datetime.datetime.fromtimestamp(date).strftime("%Y-%m-%d_%H_%M_%S")
        
    tracks = db((db.t_tracks.modified_on >= convertedDatetime)|(db.t_track_ratings.modified_on>=convertedDatetime),(db.t_track_tags.modified_on>=convertedDatetime)).select(
        db.auth_user.id, db.auth_user.first_name, db.auth_user.last_name, db.t_tracks.ALL, db.t_track_ratings.modified_on, db.t_track_tags.modified_on,
        orderby=db.t_tracks.id,
        groupby=db.t_tracks.id,
        left=[db.auth_user.on(db.t_tracks.f_owner==db.auth_user.id), db.t_track_ratings.on(db.t_track_ratings.f_track==db.t_tracks.id), db.t_track_tags.on(db.t_track_tags.f_track==db.t_tracks.id)],
        cache=(cache.ram, 43200),
        cacheable=True
    )

    pois = db(db.t_pois.modified_on >= convertedDatetime).select(
        db.t_pois.ALL,
        orderby=db.t_pois.f_track,
        cache=(cache.ram, 43200),
        cacheable=True
    )

    auth_users = db(db.auth_user >= convertedDatetime).select(
        db.auth_user.ALL,
        orderby=db.auth_user.id,
        cache=(cache.ram, 43200),
        cacheable=True
    )

    full_set = {}
    full_set['datetime'] = ""
    full_set['tracks'] = {}
    full_set['pois'] = {}
    full_set['users'] = {}
    last_modified_on = 0
    if len(tracks) > 0:
        last_modified_on = tracks[0].t_tracks.modified_on
        
    for idx, track in enumerate(tracks):
        full_set['tracks'][idx] = {}
        full_set['tracks'][idx]['ID'] = track.t_tracks.id
        full_set['tracks'][idx]['IS_ACTIVE'] = track.t_tracks.is_active
        if full_set['tracks'][idx]['IS_ACTIVE'] == True:
            full_set['tracks'][idx]['TRACK_NAME'] = track.t_tracks.f_name
            full_set['tracks'][idx]['DESCRIPTION'] = track.t_tracks.f_description
            full_set['tracks'][idx]['ICON'] = track.t_tracks.f_icon
            full_set['tracks'][idx]['A_F_NAME'] = track.auth_user.first_name
            full_set['tracks'][idx]['A_L_NAME'] = track.auth_user.last_name
            full_set['tracks'][idx]['A_ID'] = track.auth_user.id
            full_set['tracks'][idx]['PARENTAL_RATING'] = track.t_tracks.f_parental_rating
            full_set['tracks'][idx]['SCORE'] = len(db((db.t_track_ratings.f_track==track.t_tracks.id)&(db.t_track_ratings.f_score==1)).select())
            full_set['tracks'][idx]['TAGS'] = parse_tags_to_tag_string_by_track(track.t_tracks.id);
            full_set['tracks'][idx]['MODIFIED_ON'] = str(track.t_tracks.modified_on) 
            if (track.t_tracks.modified_on > last_modified_on):
                last_modified_on = track.t_tracks.modified_on
            # return (track.t_track_ratings.modified_on is not None)
            if (track.t_track_ratings.modified_on is not None):
                if (track.t_track_ratings.modified_on > last_modified_on):
                    last_modified_on = track.t_track_ratings.modified_on
            if(track.t_track_tags.modified_on is not None):
                if (track.t_track_tags.modified_on > last_modified_on):
                    last_modified_on = track.t_track_tags.modified_on > last_modified_on
    
    if last_modified_on != 0:
        full_set['datetime'] = str(last_modified_on)

    for idx, poi in enumerate(pois):
        full_set['pois'][idx] = {}
        full_set['pois'][idx]['ID'] = poi.id
        full_set['pois'][idx]['IS_ACTIVE'] = poi.is_active
        if full_set['pois'][idx]['IS_ACTIVE'] == True:
            full_set['pois'][idx]['TRACK'] = poi.f_track
            full_set['pois'][idx]['PLACING'] = poi.f_placing
            full_set['pois'][idx]['LATITUDE'] = poi.f_latitude
            full_set['pois'][idx]['LONGITUDE'] = poi.f_longitude
            full_set['pois'][idx]['NAME'] = poi.f_name
            full_set['pois'][idx]['CONTENT'] = poi.f_content
            full_set['pois'][idx]['MODIFIED_ON'] = str(poi.modified_on)
            if(poi.modified_on is not None):
                if last_modified_on != 0:
                    if(last_modified_on < poi.modified_on):
                        last_modified_on = poi.modified_on
                        full_set['datetime'] = str(last_modified_on)
                else:
                    last_modified_on = poi.modified_on
                    full_set['datetime'] = str(last_modified_on)

    for idx, user in enumerate(auth_users):
        full_set['users'][idx] = {}
        full_set['users'][idx]['ID'] = user.id
        full_set['users'][idx]['F_NAME'] = user.first_name
        full_set['users'][idx]['L_NAME'] = user.last_name
        full_set['users'][idx]['DESCRIPTION'] = user.descricao
        full_set['users'][idx]['AVATAR'] = user.avatar
        full_set['users'][idx]['MODIFIED_ON'] = str(user.modified_on)
        if(user.modified_on is not None):
            if(last_modified_on != 0):
                if(last_modified_on < user.modified_on):
                    last_modified_on = user.modified_on
                    full_set['datetime'] = str(last_modified_on)
            else:
                last_modified_on = user.modified_on
                full_set['datetime'] = str(last_modified_on)


    # return json.dumps(full_set)
    # return full_set['tracks']

    #verify if has some modified track_tag
    # 
        # return tracks[0]
    return json.dumps(full_set)

def parse_tags_to_tag_string_by_track(track_id):
    tags = db((db.t_track_tags.is_active==True)&(db.t_track_tags.f_track==track_id)).select(
        db.t_tags.f_name, 
        orderby=db.t_tags.f_name,
        join=db.t_tags.on(db.t_track_tags.f_tag==db.t_tags.id),
        cache=(cache.ram, 43200),
        cacheable=True
    )
    tagsString = ""
    for tag in tags:
        tagsString = tag.f_name +";"+tagsString
    return tagsString


def get_new_tracks_after_date():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    date = request.args(0) or redirect(URL('index'))
    date = float(date) / 1000.0
    convertedDatetime = datetime.datetime.fromtimestamp(date).strftime("%Y-%m-%d_%H_%M_%S")
    rows = db(db.t_tracks.modified_on >= convertedDatetime).select(
        db.auth_user.id, db.auth_user.first_name, db.auth_user.last_name, db.t_tracks.ALL,
        orderby=db.t_tracks.id,
        join=db.auth_user.on(db.t_tracks.f_owner==db.auth_user.id),
        cache=(cache.ram, 43200),
        cacheable=True
    )
    return rows.as_json();


def get_active_pois_after_date():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'

    date = request.args(0) or redirect(URL('index'))
    date = float(date) / 1000.0
    convertedDatetime = datetime.datetime.fromtimestamp(date).strftime("%Y-%m-%d_%H_%M_%S")
    rows = db((db.t_pois.is_active==True) & (db.t_pois.modified_on >= convertedDatetime)).select(
        db.t_pois.ALL,
        orderby=db.t_pois.f_track,
        cache=(cache.ram, 43200),
        cacheable=True
    )
    return rows.as_json();

def get_author_info_by_id():
    ## fallback for IOS emulator run on localhost
    # response.view = 'generic.json'
    # response.headers["Access-Control-Allow-Origin"] = '*'
    # response.headers['Access-Control-Max-Age'] = 86400
    # response.headers['Access-Control-Allow-Headers'] = '*'
    # response.headers['Access-Control-Allow-Methods'] = '*'
    # response.headers['Access-Control-Allow-Credentials'] = 'true'
    
    author_id = request.args(0) or redirect(URL('index'))
    row = db(db.auth_user.id==author_id).select(
        db.auth_user.first_name, db.auth_user.last_name, db.auth_user.descricao, db.auth_user.avatar
    )
    return row.as_json();

#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
   WebGrid for web2py 
   Developed by Nathan Freeze (Copyright � 2009)
   Email <nathan@freezable.com>
   License: GPL v2
   
   This file contains code to build a table that supports
   paging, sorting, editing and totals.
"""


##################--CLASSE GRID PARA USAR NA PAGINA MINHAS TRILHAS--##############


from gluon.sql import Rows, Field, Set
from gluon.sqlhtml import *
from gluon.html import *
from gluon.storage import *

class Webgrid2(object):    
    def __init__(self, crud, name=None, datasource=None):
        self.crud = crud
        self.environment = crud.environment
        self.name = name
        self.css_prefix = None
        self.id = None

        self.datasource = datasource
        self.crud_function = 'data'
        self.download_function = 'download'
        
        self.messages = Messages(self.crud.environment.T)
        self.messages.confirm_delete = 'Are you sure?'
        self.messages.no_records = 'No records'
        self.messages.add_link = '[add %s]'
        self.messages.edit_link = 'edit'
        self.messages.delete_link = 'delete'
        self.messages.view_link = 'view'
        self.messages.file_link = 'anexo'
        self.messages.page_info = 'page %(pagenum)s of %(pagecount)s (total records: %(total)s)'
        self.messages.page_total = "Total:"
        self.messages.filter = 'Filtrar'
        self.messages.pagesize = ' pagesize: '  
        self.messages.previous_page = '<-prev-'
        self.messages.next_page = '-next->'
        
        self.action_links = ['view', 'edit', 'delete']
        self.action_headers = ['view', 'edit', 'delete'] 
               
        self.field_headers = self.fields = self.totals = []     
        self.enabled_rows = ['header', 'filter', 'pager', 'totals', 
                             'footer', 'add_links']
        self.allowed_vars = ['pagesize', 'pagenum', 'sortby', 
                             'ascending', 'groupby', 'totals']
        
        self.pagenum = self.pagecount = self.pagesize = 0
        self.sortby = self.groupby = self.page_total = self.filters = None
        
        self.view_link = self.edit_link = self.delete_link = None
        self.add_links = self.action_header = None
        self.header = self.filter = self.footer = None
        self.pager = self.datarow = None
        self.pageinfo_separator = ' - '
        self.pagesizes = [10,20,30,40,50]

        self.ascending = False
        self.row_created = None
        self.filter_query = lambda field,value: field==value
        self.filter_items_query = lambda field: field['id'] > 0
        self.filter_cache = None
        self.total_function = lambda fieldvalues: sum(fieldvalues)
    
    def get_header(self, c):
        try:
            return self.field_headers[self.fields.index(c)]
        except:
            return c

    def get_value(self, f, r):
        (_t, _f) = f.split('.')
        v = r[_t][_f] if self.joined else r[_f]
        return v
    
    def update_filters(self,vrs,flt):
        if not flt:
             return
        for k, v in flt.items():
            vrs[self.name + '_filter-'+k] = v        
    
    def __call__(self):
           
        request = self.crud.environment.request
        db = self.crud.db
        datasource = self.datasource
        
        if not self.name:
            self.name = self.crud.environment.request.function
        if not self.css_prefix:
            self.css_prefix = self.name
        if not self.id:
            self.id = self.name
        
        # Set defaults
        vars = request.get_vars
        allowed = self.allowed_vars
        name = self.name
        
        if getattr(vars,name+'_pagesize') and 'pagesize' in allowed: 
            self.pagesize = int(vars[name+'_pagesize'])            
        if not self.pagesize:
            self.pagesize = 10
        
        if getattr(vars,name+'_pagenum') and 'pagenum' in allowed: 
            self.pagenum = int(vars[name+'_pagenum'])
        if not self.pagenum:
            self.pagenum = 1
        
        if getattr(vars,name+'_sortby') and 'sortby' in allowed:
            self.sortby = vars[name+'_sortby']
        
        if getattr(vars,name+'_groupby') and 'groupby' in allowed: 
            self.groupby = vars[name+'_groupby']
        
        if getattr(vars,name+'_totals') and 'totals' in allowed:
            self.totals = vars[name+'_totals']
        
        if getattr(vars,name+'_ascending') and 'ascending' in allowed:
            self.ascending = vars[name+'_ascending'] == "True"
        
        page = sortby = groupby = query = None
        filters = dict()
        
        #Build filters
        if 'filter' in self.enabled_rows:
            if request.post_vars:
                request.vars.update(request.post_vars)
            for k, v in request.vars.items():
                if isinstance(v,list):
                    v = v[0]
                if name + '_filter-' in k:
                    tf = k.split('-')[-1]
                    filters[tf] = v                                        
            for k, v in filters.items():
                if v=='0': continue
                (ft,ff) = k.split('.')
                fld = db[ft][ff]
                if query:
                    query &= self.filter_query(fld,v)
                else:
                    query = self.filter_query(fld,v)
            if filters and request.vars.get(name+'_submit_filter'):                
                self.pagenum = 1
                        
        # Build limitby
        if self.pagesize > 0:
            pagenum = self.pagenum - 1
            page = (self.pagesize * pagenum, 
                    self.pagesize * pagenum + self.pagesize)
        else: 
            self.pagenum = 0
 
        # Build sortby
        if self.sortby:
            if isinstance(self.sortby, Field):
                (ts, fs) = (self.sortby._tablename, self.sortby.name)
            else:
                (ts, fs) = self.sortby.split('.')
            if self.ascending:
                sortby = db[ts][fs]
            else:
                sortby = ~db[ts][fs]
            
        if self.groupby: 
            if isinstance(self.groupby, Field):
                (tg, fg) = (self.groupby._tablename, self.groupby.name)
            else:
                (tg, fg) = self.groupby.split('.')
            groupby = db[tg][fg]
            
        # Get rows
        rows = total = None        
        if isinstance(datasource, Rows):            
            rows = datasource
            joined = len(set(map(lambda c: c.split('.')[0], rows.colnames))) > 1            
            for k,v in filters.items():
                if v=='0': continue
                (flt_t,flt_f) = k.split('.')
                if joined:
                    rows = rows.find(lambda row: row[flt_t][flt_f]==v)
                else:
                    rows = rows.find(lambda row: row[flt_f]==v)
            total = len(rows)     
            if sortby and joined:
               rows = rows.sort(lambda row: row[ts][fs], reverse=self.ascending)
            elif sortby:
               rows = rows.sort(lambda row: row[fs], reverse=self.ascending)
            if self.pagesize > 0:
                rows = rows[page[0]:page[1]]            
        elif isinstance(datasource, Set):
            if query:
                datasource = datasource(query)
            id_in_fields = [f for f in self.fields if 
                               f.split('.')[-1] == 'id']
            idfield = self.fields[0].split('.')[0] +'.id'
            if not id_in_fields:
                self.fields.append(idfield)
            rows = datasource.select(limitby=page, orderby=sortby, 
                                     groupby=groupby, *self.fields)
            if not id_in_fields:
                self.fields.remove(idfield)
            total = datasource.count()
        elif isinstance(datasource, Table):
            rows = db(query).select(datasource.ALL, limitby=page, 
                                     orderby=sortby, groupby=groupby) 
            total = db(datasource.id > 0).count()
        elif isinstance(datasource, list) and isinstance(datasource[0], Table):
            rows = db(query).select(limitby=page, orderby=sortby, groupby=groupby,
                                    *[t.ALL for t in datasource])
            total = db(datasource[0].id > 0).count()
        else: 
            raise AttributeError("Invalid datasource for WebGrid")        
        
        self.tablenames = list(set(map(lambda c: c.split('.')[0], rows.colnames)))
        joined = len(self.tablenames) > 1        
        self.response = rows
        self.colnames = rows.colnames        
        self.joined = joined
        self.total = total
        
        if not self.fields:
            self.fields = rows.colnames
        
        if isinstance(self.fields[0], Field):
            self.fields = ['%s.%s' % (f._tablename, f.name) for f in self.fields]
            
        if self.filters and isinstance(self.filters[0],Field):
            self.filters = ['%s.%s' % (f._tablename, f.name) for f in self.filters]
            
        if self.totals and isinstance(self.totals[0], Field):
            self.totals = ['%s.%s' % (f._tablename, f.name) for f in self.totals]
            
        if not self.filters:
            self.filters = self.fields
            
        if not self.field_headers:
            self.field_headers = []
            for f in self.fields:
                (t,f) = f.split('.')
                field = db[t][f]
                if hasattr(field,'label'):
                    self.field_headers.append(field.label)
                else:
                    lbl = f.split('.')[1].replace("_", " ").capitalize()
                    self.field_headers.append(lbl)              
            
        if not self.action_headers:
            self.action_headers = self.action_links
       
        if not self.view_link and 'view' in self.action_links:            
            self.view_link = lambda row: A(self.messages.view_link, _href=self.crud.url(f=self.crud_function, 
                                                       args=['read', self.tablenames[0], 
                                                             row[self.tablenames[0]]['id'] \
                                                              if self.joined else row['id']]))          
        if not self.edit_link and 'edit' in self.action_links:             
            self.edit_link = lambda row: A(self.messages.edit_link, _href=self.crud.url(f=self.crud_function, 
                                                       args=['update', self.tablenames[0],
                                                             row[self.tablenames[0]]['id'] \
                                                              if self.joined else row['id']]))
        if not self.delete_link and 'delete' in self.action_links:            
            self.delete_link = lambda row: A(self.messages.delete_link, _href=self.crud.url(f=self.crud_function,
                                                       args=['delete', self.tablenames[0],
                                                             row[self.tablenames[0]]['id'] \
                                                              if self.joined else row['id']]),
                                                                 _onclick="return confirm('%s');" % \
                                                                    self.messages.confirm_delete)
        if not self.add_links and 'add_links' in self.enabled_rows:            
            self.add_links = lambda tables: TR(TD([A(self.messages.add_link % t,
                                                         _href=self.crud.url(f=self.crud_function, 
                                                       args=['create', t])) for t in self.tablenames],
                                                       _colspan=len(self.action_headers)+
                                                                len(self.field_headers)),
                                                                _class='-webgrid add_links')           

        if not self.header and 'header' in self.enabled_rows:
            def header(fields):
                thead = TR([TH(c) for c in self.action_headers],
                              _class='-webgrid header')
                for f in fields:
                    vars = dict(request.get_vars)
                    self.update_filters(vars,filters)
                    vars[name+'_pagenum'] = 1
                    vars[name+'_sortby'] = f
                    vars[name+'_ascending'] = not self.ascending
                    href = URL(r=request,vars=vars,args=request.args)
                    th = TH(A(self.get_header(f),_href=href))
                    thead.components.append(th)
                return thead
            
            self.header = header
            
        if not self.filter and 'filter' in self.enabled_rows:
            def filter(fields):
                tr = TR([TD('') for c in self.action_links],
                        _class='-webgrid filter')
                if self.action_links:
                    tr.components[-1] = TD(INPUT(_type='submit',
                                                 _value=self.messages.filter,
                                                 _name=name+'_submit_filter',
                                                 _class="btn-sm")) #fix this
                for f in fields:
                    if not f in self.filters:
                        tr.components.append(TD(''))
                        continue
                    (tf,ff) = f.split('.')
                    curfld = db[tf][ff]
                    if curfld.type=='upload' or curfld.type=='blob':
                            continue
                    vals = db(self.filter_items_query(db[tf])).select(db[tf]['id'],curfld,
                                                     cache=self.filter_cache)
                    dval = filters.get(f)
                    prev = []
                    opts = []
                    for v in vals:
                        opt = None               
                        if curfld.type.startswith('reference '):
                            if curfld.represent:
                                rp = curfld.represent(v[ff])
                                if rp and not rp in prev:
                                    opt = OPTION(rp, _value=v[ff])
                                    prev.append(rp)
                            else:
                                v = v[ff]
                                if v and not v in prev:
                                    opt = OPTION(v,_value=v)
                                    prev.append(v)                                                                
                        elif curfld.represent:                            
                            rp = curfld.represent(v[ff])
                            if rp and not rp in prev:
                                opt = OPTION(rp, _value=rp) 
                                prev.append(rp)
                        else:
                            if v[ff] and not v[ff] in prev:
                                opt = OPTION(v[ff], _value=v[ff]) 
                                prev.append(v[ff])
                        if opt:
                            opts.append(opt)
                    opts.sort(key=lambda x: x.components[0])
                    inp = SELECT(opts, _name = name+'_filter-'+f,value=dval)
                    inp.components.insert(0,OPTION('',_value='0'))                    
                    tr.components.append(TD(inp))
                return tr
            self.filter = filter
            
        if not self.footer and 'footer' in self.enabled_rows:
            def footer(fields):                  
                pageinfo = pagesize = ''
                pagelinks = SPAN(self.messages.pagesize)
                if not self.groupby:
                    vars = dict(request.get_vars)
                    self.update_filters(vars,filters)
                    for p in self.pagesizes:
                        vars[name+'_pagesize'] = p
                        vars[name+'_pagenum'] = 1
                        lnk = A(str(p),' ',_href=URL(r=request,args=request.args,
                                                           vars=vars))
                        pagelinks.components.append(lnk)
                    pageinfo = self.messages.page_info % {'pagenum':self.pagenum,
                                                'pagecount':self.pagecount,
                                                'total':self.total}
                tr = TR(_class='-webgrid footer')
                td = TD(pageinfo,self.pageinfo_separator,pagelinks,
                        _colspan=len(self.fields) + len(self.action_links))
                tr.components.append(td)
                return tr
            self.footer = footer
                                   
        if not self.pager and 'pager' in self.enabled_rows:
            def pager(pagecount):
                vars = dict(request.get_vars)
                self.update_filters(vars,filters)              
                prev = A(self.messages.previous_page, _href="#")
                next = A(self.messages.next_page, _href="#")
                if self.pagesize > 0 and pagenum > 0:
                    vars[name+'_pagenum'] = self.pagenum - 1
                    prev = A(B(self.messages.previous_page), 
                             _href=URL(r=request,vars=vars,args=request.args))
                if self.pagesize > 0 and self.pagenum < pagecount and \
                                len(self.response) >= self.pagesize:
                    vars[name+'_pagenum'] = self.pagenum + 1
                    next = A(B(self.messages.next_page), 
                             _href=URL(r=request,vars=vars,args=request.args))
                tr = TR(_class='-webgrid pager')
                td = TD(prev,_colspan=len(self.fields) + len(self.action_links) )
                for x in xrange(1, pagecount + 1):
                    if not self.groupby:
                        vars[name+'_pagenum'] = x
                        href = URL(r=request,vars=vars,args=request.args)
                        td.components.append(A(x,'-',_href=href))
                td.components.append(next)
                tr.components.append(td)                
                return tr
            self.pager = pager
            
        if not self.page_total and 'totals' in self.enabled_rows:
            def page_total():
                pagetotal = TR(['' for l in self.action_links],
                               _class='-webgrid totals')
                if self.action_links:
                    pagetotal.components[-1] = TD(self.messages.page_total)
                for f in self.fields:
                    if f in self.totals:
                        fieldvalues = [self.get_value(f, r) for r in self.response]
                        fieldtotal = self.total_function(fieldvalues) 
                        pagetotal.components.append(TD(fieldtotal)) 
                    else:
                        pagetotal.components.append(TD()) 
                return pagetotal                       
            self.page_total = page_total 
            
        if not self.action_links:
            if self.totals or self.filters:
                self.action_links = ['delete']
                self.action_headers = ['']
                self.delete_link = lambda row: ' '
          
        table_field = re.compile('[\w_]+\.[\w_]+')
        table = TABLE(_id=self.id, _class="table-striped")        
        if 'header' in self.enabled_rows:
            _row = self.header(self.fields)
            if self.row_created:
                self.row_created(_row,'header',None)
            table.components.append(THEAD(_row))
        if 'filter' in self.enabled_rows:
            _row = self.filter(self.fields)
            if self.row_created:
                self.row_created(_row,'filter',None)
            table.components.append(_row)
        if len(rows) == 0:
            table.components.append(TR(TD(self.messages.no_records,
                                       _colspan=len(self.fields) + len(self.action_links),
                                       _style="text-align:center;")))
        for (rc, row) in enumerate(rows):            
            if self.datarow:
                _row = self.datarow(row)
                if self.row_created:
                    self.row_created(_row,'datarow',row)
                table.components.append(_row)
                continue
            _class = 'even' if rc % 2 == 0 else 'odd'
            tr = TR(_class='-webgrid-row %s' % _class) 
            if 'view' in self.action_links:
                tr.components.append(TD(self.view_link(row), 
                                        _class='-webgrid view_link'))
            if 'edit' in self.action_links:
                tr.components.append(TD(self.edit_link(row), 
                                        _class='-webgrid edit_link'))
            if 'delete' in self.action_links:
                tr.components.append(TD(self.delete_link(row), 
                                        _class='-webgrid delete_link'))

            for colname in self.fields:
                if not table_field.match(colname):
                    r = row._extra[colname]
                    tr.components.append(TD(r))
                    continue
                (tablename, fieldname) = colname.split('.')
                field = rows.db[tablename][fieldname]
                r = row[tablename][fieldname] if joined else row[fieldname]
                if field.represent:
                    r = field.represent(r)
                    tr.components.append(TD(r, _class="classificacao"))
                    continue
                if field.type == 'blob' and r:
                    tr.components.append(TD('DATA'))
                    continue
                r = str(field.formatter(r))
                if field.type == 'upload':
                    if r:
                        tr.components.append(TD(IMG(_src=URL(r=self.environment.request,
                                                            f=self.download_function, args=r), _class="icon")))
                    else:
                        tr.components.append(TD(self.messages.file_link))
                    continue
                tr.components.append(TD(r))            
            if self.row_created:
                self.row_created(tr,'datarow',row)
            table.components.append(tr)
            
        if self.pagesize > 0:
            pagecount = int(total / self.pagesize)
            if total % self.pagesize != 0: pagecount += 1
        else:
            pagecount = 1
            
        self.pagecount = pagecount
        
        footer_wrap = TFOOT()
        if 'totals' in self.enabled_rows and len(rows):
            _row = self.page_total()
            if self.row_created:
                self.row_created(_row,'totals',None) 
            footer_wrap.components.append(_row)
        if 'add_links' in self.enabled_rows: 
            _row = self.add_links(self.tablenames)
            if self.row_created:
                self.row_created(_row,'add_links',None)
            footer_wrap.components.append(_row)        
        if 'pager' in self.enabled_rows and len(rows):
            _row = self.pager(pagecount)
            if self.row_created:
                self.row_created(_row,'pager',None)
            footer_wrap.components.append(_row)        
        if 'footer' in self.enabled_rows and len(rows): 
            _row = self.footer(self.fields)
            if self.row_created:
                self.row_created(_row,'footer',None)
            footer_wrap.components.append(_row)                    

        table.components.append(footer_wrap)
        
        return FORM(table,_class='webgrid',_name=name+'-webgrid-form')

def links_right(tablerow,rowtype,rowdata):
    if rowtype != 'pager':
        links = tablerow.components[:3]
        del tablerow.components[:3]
        tablerow.components.extend(links)