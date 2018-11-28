### we prepend t_ to tablenames and f_ to fieldnames for disambiguity


########################################
db.define_table('t_parental_ratings',
    Field('f_name', type='string', notnull=True,
          label=T('Name')),
    Field('f_description', type='string', notnull=True,
          label=T('Description')),
    auth.signature,
    format='%(f_name)s',
    migrate=settings.migrate)

db.define_table('t_parental_ratings_archive',db.t_parental_ratings,Field('current_record','reference t_parental_ratings',readable=False,writable=False))

########################################
db.define_table('t_tracks',
    Field('f_name', type='string', notnull=True,
          label=T('Name')),
    Field('f_parental_rating', type='reference t_parental_ratings', notnull=True,
          label=T('Parental Rating')),
    Field('f_description', type='text', length=2500, notnull=True,
          label=T('Description')),
    Field('f_owner', type='reference auth_user', notnull=True,
          label=T('Owner'), default=auth.user_id, writable=False),
    Field('f_create_date', type='datetime', notnull=True,
          label=T('Create Date'), default=request.now, writable=False),
    Field('f_icon', type='upload', notnull=False,
          label=T('Icon'), default="static/images/default_icon_track.png"),
    auth.signature,
    format='%(f_name)s',
    migrate=settings.migrate)

db.define_table('t_tracks_archive',db.t_tracks,Field('current_record','reference t_tracks',readable=False,writable=False))

########################################
db.define_table('t_track_ratings',
    Field('f_score', type='string', notnull=True,
          label=T('Score'), default="0"),
    Field('f_feedback', type='string', notnull=False,
          label=T('Feedback')),
    Field('f_track', type='reference t_tracks', notnull=True,
          label=T('Track')),
    Field('f_email', type='string', notnull=True,
          label=T('Email')),
    auth.signature,
    format='%(f_score)s',
    migrate=settings.migrate)

db.define_table('t_track_ratings_archive',db.t_track_ratings,Field('current_record','reference t_track_ratings',readable=False,writable=False))

########################################
db.define_table('t_tags',
    Field('f_name', type='string', notnull=True,
          label=T('Name')),
    auth.signature,
    format='%(f_name)s',
    migrate=settings.migrate)

db.define_table('t_tags_archive',db.t_tags,Field('current_record','reference t_tags',readable=False,writable=False))

########################################
def advanced_editor(field, value):
    return TEXTAREA(_id = str(field).replace('.','_'), _name=field.name, _class='text ckeditor', value=value, _cols=80, _rows=10)
from plugin_ckeditor import CKEditor
ckeditor = CKEditor(db)
########################################
db.define_table('t_pois',
    Field('f_track', type='reference t_tracks', notnull=True,
          label=T('Track')),
    Field('f_name', type='string', notnull=True,
          label=T('Name')),
    Field('f_content', type='text', notnull=True,
          label=T('Content'), widget=ckeditor.widget),
    Field('f_latitude', type='string', notnull=True,
          label=T('Latitude')),
    Field('f_longitude', type='string', notnull=True,
          label=T('Longitude')),
    Field('f_placing', type='integer', notnull=True,
          label=T('Placing')),
    auth.signature,
    format='%(f_name)s',
    migrate=settings.migrate)

db.define_table('t_pois_archive',db.t_pois,Field('current_record','reference t_pois',readable=False,writable=False))

########################################
db.define_table('t_track_pois',
    Field('f_track', type='reference t_tracks', notnull=True,
          label=T('Track')),
    Field('f_poi', type='reference t_pois', notnull=True,
          label=T('Poi')),
    Field('f_order', type='integer',
          label=T('Order')),
    auth.signature,
    format='%(f_track)s',
    migrate=settings.migrate)

db.define_table('t_track_pois_archive',db.t_track_pois,Field('current_record','reference t_track_pois',readable=False,writable=False))

########################################
db.define_table('t_track_tags',
    Field('f_track', type='reference t_tracks', notnull=True,
          label=T('Track')),
    Field('f_tag', type='reference t_tags', notnull=True,
          label=T('Tag')),
    auth.signature,
    format='%(f_track)s',
    migrate=settings.migrate)

db.define_table('t_track_tags_archive',db.t_track_tags,Field('current_record','reference t_track_tags',readable=False,writable=False))

########################################
db.define_table('t_reports',
    Field('f_description', type='text', length=2500, notnull=True,
          label=T('Description')),
    Field('f_email', type='string', notnull=True,
          label=T('Email')),
    Field('f_track', type='reference t_tracks', notnull=True,
          label=T('Track')),
    Field('f_poi', type='reference t_pois', notnull=False,
          label=T('Poi')),
    auth.signature,
    format='%(f_description)s',
    migrate=settings.migrate)

db.define_table('t_reports_archive',db.t_tracks,Field('current_record','reference t_reports',readable=False,writable=False))

########################################