# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Auth'
        db.create_table('pfc_auth', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('token', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('expires', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal('pfc', ['Auth'])

        # Adding model 'User'
        db.create_table('pfc_user', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('username', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('password', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=255)),
        ))
        db.send_create_signal('pfc', ['User'])

        # Adding model 'Query'
        db.create_table('pfc_query', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['pfc.User'])),
            ('database', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('dataset', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('neighbourhood', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('date', self.gf('django.db.models.fields.DateTimeField')(default=datetime.datetime(2013, 6, 9, 0, 0))),
        ))
        db.send_create_signal('pfc', ['Query'])

        # Adding model 'Preference'
        db.create_table('pfc_preference', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['pfc.User'])),
            ('type', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('subtype', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('value', self.gf('django.db.models.fields.CharField')(max_length=255)),
        ))
        db.send_create_signal('pfc', ['Preference'])


    def backwards(self, orm):
        # Deleting model 'Auth'
        db.delete_table('pfc_auth')

        # Deleting model 'User'
        db.delete_table('pfc_user')

        # Deleting model 'Query'
        db.delete_table('pfc_query')

        # Deleting model 'Preference'
        db.delete_table('pfc_preference')


    models = {
        'pfc.auth': {
            'Meta': {'object_name': 'Auth'},
            'expires': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'token': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'pfc.preference': {
            'Meta': {'object_name': 'Preference'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'subtype': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'type': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['pfc.User']"}),
            'value': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        },
        'pfc.query': {
            'Meta': {'object_name': 'Query'},
            'database': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'dataset': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'date': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime(2013, 6, 9, 0, 0)'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'neighbourhood': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'user': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['pfc.User']"})
        },
        'pfc.user': {
            'Meta': {'object_name': 'User'},
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '255'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '255'}),
            'username': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['pfc']