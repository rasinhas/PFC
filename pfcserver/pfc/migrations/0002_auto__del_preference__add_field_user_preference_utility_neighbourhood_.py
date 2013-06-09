# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'Preference'
        db.delete_table('pfc_preference')

        # Adding field 'User.preference_utility_neighbourhood'
        db.add_column('pfc_user', 'preference_utility_neighbourhood',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=255),
                      keep_default=False)

        # Adding field 'User.preference_restaurant_neighbourhood'
        db.add_column('pfc_user', 'preference_restaurant_neighbourhood',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=255),
                      keep_default=False)

        # Adding field 'User.preference_restaurant_price'
        db.add_column('pfc_user', 'preference_restaurant_price',
                      self.gf('django.db.models.fields.CharField')(default='$', max_length=255),
                      keep_default=False)

        # Adding field 'User.preference_restaurant_type'
        db.add_column('pfc_user', 'preference_restaurant_type',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=255),
                      keep_default=False)

        # Adding field 'User.preference_inn_neighbourhood'
        db.add_column('pfc_user', 'preference_inn_neighbourhood',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=255),
                      keep_default=False)

        # Adding field 'User.preference_inn_price'
        db.add_column('pfc_user', 'preference_inn_price',
                      self.gf('django.db.models.fields.CharField')(default='$', max_length=255),
                      keep_default=False)

        # Adding field 'User.preference_entertainment_neighbourhood'
        db.add_column('pfc_user', 'preference_entertainment_neighbourhood',
                      self.gf('django.db.models.fields.CharField')(default='', max_length=255),
                      keep_default=False)

        # Adding field 'User.preference_entertainment_price'
        db.add_column('pfc_user', 'preference_entertainment_price',
                      self.gf('django.db.models.fields.CharField')(default='$', max_length=255),
                      keep_default=False)


    def backwards(self, orm):
        # Adding model 'Preference'
        db.create_table('pfc_preference', (
            ('value', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('subtype', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('user', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['pfc.User'])),
            ('type', self.gf('django.db.models.fields.CharField')(max_length=255)),
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
        ))
        db.send_create_signal('pfc', ['Preference'])

        # Deleting field 'User.preference_utility_neighbourhood'
        db.delete_column('pfc_user', 'preference_utility_neighbourhood')

        # Deleting field 'User.preference_restaurant_neighbourhood'
        db.delete_column('pfc_user', 'preference_restaurant_neighbourhood')

        # Deleting field 'User.preference_restaurant_price'
        db.delete_column('pfc_user', 'preference_restaurant_price')

        # Deleting field 'User.preference_restaurant_type'
        db.delete_column('pfc_user', 'preference_restaurant_type')

        # Deleting field 'User.preference_inn_neighbourhood'
        db.delete_column('pfc_user', 'preference_inn_neighbourhood')

        # Deleting field 'User.preference_inn_price'
        db.delete_column('pfc_user', 'preference_inn_price')

        # Deleting field 'User.preference_entertainment_neighbourhood'
        db.delete_column('pfc_user', 'preference_entertainment_neighbourhood')

        # Deleting field 'User.preference_entertainment_price'
        db.delete_column('pfc_user', 'preference_entertainment_price')


    models = {
        'pfc.auth': {
            'Meta': {'object_name': 'Auth'},
            'expires': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'token': ('django.db.models.fields.CharField', [], {'max_length': '255'})
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
            'preference_entertainment_neighbourhood': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '255'}),
            'preference_entertainment_price': ('django.db.models.fields.CharField', [], {'default': "'$'", 'max_length': '255'}),
            'preference_inn_neighbourhood': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '255'}),
            'preference_inn_price': ('django.db.models.fields.CharField', [], {'default': "'$'", 'max_length': '255'}),
            'preference_restaurant_neighbourhood': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '255'}),
            'preference_restaurant_price': ('django.db.models.fields.CharField', [], {'default': "'$'", 'max_length': '255'}),
            'preference_restaurant_type': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '255'}),
            'preference_utility_neighbourhood': ('django.db.models.fields.CharField', [], {'default': "''", 'max_length': '255'}),
            'username': ('django.db.models.fields.CharField', [], {'max_length': '255'})
        }
    }

    complete_apps = ['pfc']