from flask import Flask
from flask.ext import restful
from resources.seasons import Seasons

app = Flask(__name__)
api = restful.Api(app)

api.add_resource(Seasons, '/seasons', '/seasons/', '/seasons/<int:id>')
