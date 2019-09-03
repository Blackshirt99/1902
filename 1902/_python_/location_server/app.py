from flask import Flask, render_template, request, session, Response, redirect,jsonify
import db 
from datetime import timedelta
import random
import math


app = Flask(__name__)

app.config['SECRET_KEY']='123456'   #设置为24位的字符,每次运行服务器都是不同的，所以服务器启动一次上次的session就清除。
app.config['PERMANENT_SESSION_LIFETIME']=timedelta(minutes=60) #设置session的保存时间。

@app.route('/', methods=['GET'])
def index():
    code = getcode()
    session['code']=code
    return render_template('/login.html', code=code)


@app.route('/main')
def main():
    userInfo = session.get('userInfo')
    if userInfo:
        return render_template('/main.html')
    else:
        return redirect('/')

@app.route('/type', methods=['GET'])
def typehtml():
    types = db.listtypes()
    return render_template('/type.html', types=types)


@app.route('/addtype', methods=['POST'])
def addtype():
    typename = request.values.get('type')
    parent = request.values.get('parent')
    if parent:
        array = parent.split(':')
        if array[1]:
            parent = int(array[1])
        else:
            parent = None
    else:
        parent = None
    # add to DB
    data = db.addType(typename, parent)
    if data:
        return jsonify({'result':"ok", 'typeName':data[1], 'id':data[0]})
    else:
        return jsonify({'result':'fald'})



@app.route('/searchTypeList', methods=['POST'])
def searchTypeList():
    key = request.values.get('key')
    page = request.values.get('page')
    size = request.values.get('size')
    data = None
    if key:
        data = db.searchTypes(key)
        count= 1
        totalpage = 1
        currentPage = 1
    else:
        data = db.listAllTypes(int(page), int(size))
        count = db.allcount()
        totalpage = math.ceil(count/int(size))
        currentPage = int(page)
        
    return jsonify({"data":data, "count":count, "currentPage":currentPage, "totalPage":totalpage})


@app.route('/login', methods=['POST'])
def login():
    try:
        print('login-----------')
        code = request.values.get('code')
        scode = session.get('code')
        if code == scode:
            userName = request.values.get('userName')
            pwd = request.values.get('pwd')
            data = db.login(userName, pwd)
            print('*'*30)
            print(data)
            print('*'*30)
            if data:
                session['userInfo']=data
                return redirect('/main')
            else:
                return render_template('/login.html', msg='登录失败，重试。')
        else:
            code = getcode()
            session['code']=code
            return render_template('/login.html', msg='校验码不正确。', code=code)
    except Exception as ex:
        print(ex)
        return 'error'
    

@app.route('/delType')
def delType():
    id = request.values.get('id')
    #删除
    if db.delType(id):
        return jsonify({'result':'ok'})
    else:
        return jsonify({'result':'fald'})


@app.route('/updateType', methods=['POST'])
def updateType():
    id = int(request.values.get('id'));
    typename = request.values.get('typeName')
    if db.updateTypeName(typename, id):
        return jsonify({'result':'ok'})
    else:
        return jsonify({'result':'nook'})


@app.route('/exit', methods=['GET'])
def exit():
    del(session['userInfo'])
    return redirect('/')


def getcode():
    ran = random.randint(10000,100000)  
    return str(ran)  


if __name__ == "__main__":
    app.run(debug=True)