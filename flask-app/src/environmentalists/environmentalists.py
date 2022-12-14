from flask import Flask
from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


environmentalists = Blueprint ("environmentalists", __name__)

@environmentalists.route ('/environmentalists')
def get_environmentalists():
    return '<h1> Imagine a list of environmentalists here <h1>'


@environmentalists.route ('/environmentalists/<id>', methods = ['GET'])
def get_environmentalists_detail():
    cursor = db.get_db().cursor()
    select_stmt = 'SELECT * FROM environmentalists where environmentalistID = {0}'.format(id)
    cursor.execute(select_stmt)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response