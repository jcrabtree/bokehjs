import os
from os.path import join, dirname
import json
import pdb
from flask import Flask, request, render_template, send_from_directory, jsonify







app = Flask(__name__, #static_path='/bokehjs/static')
            static_url_path='/bokehjs/static')




@app.route('/bokehjs/demo')
def main():
    return render_template('demo.html')


if __name__ == "__main__":
    app.run(debug=True, host="0.0.0.0", port=5007)