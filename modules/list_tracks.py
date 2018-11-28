# -*- coding: utf-8 -*-
def list_tracks():
    tracks = db.t_tracks
    crud = Crud(db)

    grid = webgrid.WebGrid(crud)
    #grid.datasource = db(db.t_tracks.is_active==True)
    grid.datasource = db(db.t_tracks.is_active==True).select()
    grid.pagesize = 10

    grid.enabled_rows = ['header','filter', 'pager','footer']

    grid.fields = ['t_tracks.id','t_tracks.f_owner','t_tracks.f_name','t_tracks.f_description','t_tracks.f_parental_rating']

    grid.field_headers = ['ID','Criador','Titulo','Descrição','Classificação']

    grid.action_links = ['view','edit','delete']
    grid.action_headers = ['Visualizar','Editar','Remover']

    grid.filters = ['t_tracks.f_owner','t_tracks.f_parental_rating']

    grid.allowed_vars = ['pagesize','pagenum','sortby','ascending','groupby']

    grid.filter_query = lambda f,v: f==v

    grid.view_link = lambda row: A(IMG(_src='http://4.bp.blogspot.com/-BhR-9_MSDIk/VDPZPagk5RI/AAAAAAAAD8I/YvEOEyzVymA/s1600/Search%2BIcon.png',_alt='test', _width='12px', _height='12px'),
                                   _href=URL('show_track',args=row.id))
    grid.edit_link = lambda row: A('Edit', _href=URL('#', args=row.id))
    grid.delete_link = lambda row: A('Delete', _onclick="return confirm('Tem certeza bro?')", _href=URL('#', args=row.id))
    grid.row_created = links_right
    #query = tracks.is_active==True
    #rows = db(tracks.is_active==True).select()
    #table = TABLE()
    #table.append(TR(TH("ID"), TH("TITULO"), TH("DESCRIÇÃO"), TH("CLASSIFICAÇÃO"), TH("CRIADOR"), TH("VISUALIZAR")))
    #if len(rows)>0:
    #    for row in rows:
    #        table.append(TR(TD(row.id), TD(row.f_name), TD(row.f_description), TD(row.f_parental_rating), TD(row.f_owner), TD(A("visualizar",_href="show_track/" +str(row.id)))))
    #return dict(rows=rows, tracks=tracks, table=table, update=crud.update(tracks,17), list=crud.select(tracks,query), create=crud.create(tracks), grid=grid())
    return dict(grid=grid())
