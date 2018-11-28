response.title = settings.title
response.subtitle = settings.subtitle
response.meta.author = '%(author)s <%(author_email)s>' % settings
response.meta.keywords = settings.keywords
response.meta.description = settings.description
response.menu = [
(T('Minhas Trilhas'),URL('default','index')==URL(),URL('default','index'),[]),
(T('Nova Trilha'),URL('default','nova_trilha')==URL(),URL('default','nova_trilha'),[])
]
if (auth.user_id != None) and ((auth.has_membership(role = 'manager')) or (auth.has_membership(role = 'admin'))) :
    response.menu += [
(T('Administrar usuários'),URL('default','manage_users')==URL(),URL('default','manage_users'),[]),
(T('Trilhas Poéticas'),URL('default','tracks_manage')==URL(),URL('default','tracks_manage'),[]),
(T('Pontos Poéticos'),URL('default','pois_manage')==URL(),URL('default','pois_manage'),[])
]
if (auth.user_id != None) and ((auth.has_membership(role = 'admin'))) :
    response.menu += [
(T('Novo Ponto Debug'),URL('default','form2')==URL(),URL('default','form2'),[]),
(T('list_Tracks'),URL('default','list_Tracks')==URL(),URL('default','list_tracks'),[]),
#(T('Form3'),URL('default','form3')==URL(),URL('default','form3'),[]),
(T('Track list'),URL('default','track_list')==URL(),URL('default','track_list'),[]),
(T('Track Ratings'),URL('default','track_ratings_manage')==URL(),URL('default','track_ratings_manage'),[]),
(T('Tags'),URL('default','tags_manage')==URL(),URL('default','tags_manage'),[]),
(T('Parental Ratings'),URL('default','parental_ratings_manage')==URL(),URL('default','parental_ratings_manage'),[]),
(T('Track Pois'),URL('default','track_pois_manage')==URL(),URL('default','track_pois_manage'),[]),
(T('Track Tags'),URL('default','track_tags_manage')==URL(),URL('default','track_tags_manage'),[])
]
