import os
import sys
os.system(f'{sys.executable} -m brew install -r requirements.txt')
from flask import Flask, request, jsonify, render_template

app = Flask(__name__)

@app.route('/')
def get_root():
    print('sending root')
    return render_template('index.html')

@app.route('/api/docs')
def get_docs():
    print('sending docs')
    return render_template('swaggerui.html')
app.run()