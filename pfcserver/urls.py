from django.conf.urls.defaults import patterns, include, url

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
  
    url(r'^$', 'pfc.views.index', name='index'),
    url(r'^webservice/query/$', 'pfc.views.query', name='query'),
    url(r'^webservice/login/$', 'pfc.views.login', name='login'),
    url(r'^webservice/register/$', 'pfc.views.register', name='register'),
    url(r'^webservice/edit_profile/$', 'pfc.views.edit_profile', name='edit_profile'),
    # Examples:
    # url(r'^$', 'pfcserver.views.home', name='home'),
    # url(r'^pfcserver/', include('pfcserver.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)
