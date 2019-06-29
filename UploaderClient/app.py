from flask import Flask, render_template, flash, request, redirect, url_for
from werkzeug.utils import secure_filename
import os 
import validation
from os import listdir

ALLOWED_EXTENSIONS = set(['csv', 'xls', 'xlsx'])
# UPLOAD_FOLDER = os.path.dirname(__file__) + "/Upload/"
UPLOAD_FOLDER = "/Projeto_Final/UploaderClient/files/"

app = Flask(__name__)

app.debug = True 

@app.route('/') # receive the request from user, similar to annotation java
def index(): # Function for Index, will return Index
    return render_template('home.html')

@app.route('/submit/<string:process>')
def article(process):
    fileList = []
    if process == "Aula1":
        fileList = listdir(UPLOAD_FOLDER + "Aula1/")
    elif process == "Aula2":
        fileList = listdir(UPLOAD_FOLDER + "Aula2/")
    elif process == "Aula3":
        fileList = listdir(UPLOAD_FOLDER + "Aula3/")
    
    print(fileList)
    return render_template('submit.html', process = process.replace("_", " "), fileList = fileList)

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/uploader', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        # check if the post request has the file part
        if 'upload' not in request.files:
            flash('Connection error, please try again', 'warning')
            return redirect(url_for('index'))
        file = request.files['upload']
        if file.filename == '':
            flash('No selected file', 'danger')
            return redirect(url_for('index'))
        if file:
            filename = secure_filename(file.filename)
            job = request.referrer.split('/')
            print(job[-1])
            if "Aula1" == job[-1]:
                upload_folder = UPLOAD_FOLDER + "Aula1/"
            elif "Aula2" == job[-1]:
                upload_folder = UPLOAD_FOLDER + "Aula2/"
            elif "Aula3" == job[-1]:
                upload_folder = UPLOAD_FOLDER + "Aula3/"
            else:
                flash('Please clean your cache and try again', 'danger')
                return redirect(url_for('index'))

            app.config['UPLOAD_FOLDER'] = upload_folder
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
            validator = validation.__validator__(upload_folder + filename)

            if validator[0]:
                flash('File Uploaded', 'success')
            else:
                flash(validator[1], 'danger')
                os.remove(upload_folder + filename)
            
            return redirect(url_for('index'))

@app.context_processor
def override_url_for():
    return dict(url_for=dated_url_for)

def dated_url_for(endpoint, **values):
    if endpoint == 'static':
        filename = values.get('filename', None)
        if filename:
            file_path = os.path.join(app.root_path,endpoint, filename)
            values['q'] = int(os.stat(file_path).st_mtime)
    return url_for(endpoint, **values)

if __name__ == '__main__':
    app.secret_key = 'knAOSd7*ASNDO*&Asndo8nd2k3jnrsd1a5s161d'
    app.run(host='0.0.0.0' port="5001") 
