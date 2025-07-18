from flask import Flask, request, send_from_directory, render_template_string
import os

app = Flask(__name__)
UPLOAD_FOLDER = 'uploads'
os.makedirs(UPLOAD_FOLDER, exist_ok=True)

HTML_TEMPLATE = '''
<!DOCTYPE html>
<html>
<head>
  <title>Termux Web Server</title>
  <style>
    body { font-family: Arial; padding: 10px; background: #f4f4f4; }
    textarea { width: 100%; height: 400px; font-family: monospace; }
    input[type=file] { margin-bottom: 10px; }
    input, button { padding: 8px; }
    ul li { margin-bottom: 5px; }
  </style>
</head>
<body>
  <h2>📤 Upload File</h2>
  <form action="/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="file" />
    <input type="submit" value="Upload">
  </form>

  <h2>📝 Edit File</h2>
  <form method="post" action="/save">
    <input type="text" name="filename" placeholder="filename.txt" required><br><br>
    <textarea name="content">{{ content }}</textarea><br>
    <input type="submit" value="Save File">
  </form>

  <h2>📁 Files in Uploads</h2>
  <ul>
    {% for f in files %}
      <li><a href="/edit/{{ f }}">{{ f }}</a> | <a href="/uploads/{{ f }}">🔗 Download</a></li>
    {% endfor %}
  </ul>
</body>
</html>
'''

@app.route('/')
def index():
    files = os.listdir(UPLOAD_FOLDER)
    return render_template_string(HTML_TEMPLATE, files=files, content='')

@app.route('/edit/<filename>')
def edit_file(filename):
    path = os.path.join(UPLOAD_FOLDER, filename)
    content = ''
    if os.path.exists(path):
        with open(path, 'r', encoding='utf-8') as f:
            content = f.read()
    files = os.listdir(UPLOAD_FOLDER)
    return render_template_string(HTML_TEMPLATE, files=files, content=content)

@app.route('/save', methods=['POST'])
def save_file():
    filename = request.form['filename']
    content = request.form['content']
    with open(os.path.join(UPLOAD_FOLDER, filename), 'w', encoding='utf-8') as f:
        f.write(content)
    return '✅ File saved. <a href="/">Back</a>'

@app.route('/upload', methods=['POST'])
def upload_file():
    file = request.files['file']
    if file:
        file.save(os.path.join(UPLOAD_FOLDER, file.filename))
    return '✅ File uploaded. <a href="/">Back</a>'

@app.route('/uploads/<filename>')
def uploaded_file(filename):
    return send_from_directory(UPLOAD_FOLDER, filename)

app.run(host='0.0.0.0', port=5000)
