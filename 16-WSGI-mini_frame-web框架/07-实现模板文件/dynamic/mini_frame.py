
def index():
    with open("./templates/index.html",encoding="utf-8") as f:
        content = f.read()
    return content

def center():
    with open("./templates/center.html") as f:
        return f.read()
     

def application(env, start_response):
    start_response('200 OK', [('Content-Type', 'text/html;charset=utf-8')])
    
    file_name = env['PATH_INFO']
    # file_name = "/index.py"

    if file_name == "/index.py":
        return index()
    elif file_name == "/center.py":
        return center()
    else:
        return 'Hello World! 我爱你中国....'