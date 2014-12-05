#!venv/bin/python
from flask.ext import restful
from flask.ext.restful import reqparse


########## Argument Parsing ##########
# POST
post_parser = reqparse.RequestParser()
post_parser.add_argument(
    'id', dest='id',
    type=int, required=True
)
post_parser.add_argument(
    'start_date', dest='start_date',
    type=str, required=True
)
post_parser.add_argument(
    'end_date', dest='end_date',
    type=str, required=True
)

# PUT
put_parser = reqparse.RequestParser()
put_parser.add_argument(
    'id', dest='id',
    type=int, required=True
)
put_parser.add_argument(
    'start_date', dest='start_date',
    type=str, required=False
)
put_parser.add_argument(
    'end_date', dest='end_date',
    type=str, required=False
)


class Seasons(restful.Resource):
    def get(self, id=None):
        if id == 1:
            return 'test'
        return None

    def post(self, id=None, start_date=None, end_date=None):
        args = post_parser.parse_args()
        return(args)
        pass

    def put(self, id=None, start_date=None, end_date=None):
        args = put_parser.parse_args()
        return(args)
        pass
