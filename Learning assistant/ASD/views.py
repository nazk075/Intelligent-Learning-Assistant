import json
from datetime import datetime

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.http.response import JsonResponse
from django.shortcuts import render

# Create your views here.
from ASD.models import *


def login(request):
    return render(request,"loginindex.html")

def login_code(request):
    username=request.POST['textfield']
    password=request.POST['textfield2']
    print(request.POST)
    try:
        Ob=login_table.objects.get(username=username,password=password)
        if Ob.type=="admin":
            return HttpResponse('''<script>alert("Login Successfull");window.location='/adminhome'</script>''')
        elif Ob.type == "expert":
            request.session["lid"]=Ob.id
            return HttpResponse('''<script>alert("Welcome to Expert Home");window.location='/experthome'</script>''')
        else:
            return HttpResponse('''<script>alert("Invalid");window.location='/'</script>''')
    except Exception as e:
        print("00000000000",e)

        return HttpResponse('''<script>alert("Invalid");window.location='/'</script>''')


def viewcomplaint(request):
    ob=complaint_table.objects.all()
    return render(request,"ADMIN/VIEW COMPLAINTS.html",{'val':ob})
def viewcomplaint_search(request):
    name = request.POST["date"]
    ob=complaint_table.objects.filter(date__exact=name)
    return render(request,"ADMIN/VIEW COMPLAINTS.html",{'val':ob})




def reply(request):
    reply=request.POST['textfield']

    ob=complaint_table.objects.get(id=request.session['ll'])
    ob.reply=reply
    ob.save()
    return HttpResponse('''<script>alert("Reply sent");window.location='/viewcomplaint#about'</script>''')


def sendreply(request,id):
    request.session['ll']=id
    return render(request,"ADMIN/sendreply.html")

def viewexpert(request):
    ob=expert_table.objects.all()
    return render(request,"ADMIN/VIEW EXPERT & VERIFY.html",{'val':ob})
def viewexpert_search(request):
    name=request.POST["textfield"]
    ob=expert_table.objects.filter(name__contains=name)
    return render(request,"ADMIN/VIEW EXPERT & VERIFY.html",{'val':ob})

def viewparents(request):
    ob=parent_table.objects.all()
    return render(request,"ADMIN/VIEW PARENT.html",{'val':ob})

def viewparents_search(request):
    name = request.POST["textfield"]
    ob=parent_table.objects.filter(name__contains=name)
    return render(request,"ADMIN/VIEW PARENT.html",{'val':ob})


def adminhome(request):
    return render(request,"ADMIN/adminindes.html")

def accept_expert(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="expert"
    ob.save()
    return HttpResponse('''<script>alert("Accepted");window.location='/viewexpert'</script>''')

def reject_expert(request,id):
    ob=login_table.objects.get(id=id)
    ob.type="reject"
    ob.save()
    return HttpResponse('''<script>alert("Rejected");window.location='/viewexpert'</script>''')

def addtips(request):
    ob = Tips_table.objects.filter(EXPERT__LOGIN=request.session["lid"])
    return render(request,"EXPERT/ADD TIPS.html",{'val':ob})
def addtips_post(request):
    reply=request.POST['textfield']
    ob=Tips_table()
    ob.EXPERT=expert_table.objects.get(LOGIN=request.session["lid"])
    ob.tips=reply
    ob.save()
    return HttpResponse('''<script>alert("Tips Added");window.location='/addtips'</script>''')


def viewaddtips(request):
    ob = Tips_table.objects.filter(EXPERT__LOGIN=request.session["lid"])
    return render(request,"EXPERT/ADD TIPS.html",{'val':ob})


def sendtips(request):
    return render(request,"EXPERT/SEND TIPS.html")


def childassmnt(request):
    ob=child_assessment.objects.filter(EXPERT__LOGIN=request.session["lid"])
    return render(request,"EXPERT/CHILD ASSMNT RPRT.html",{'val':ob})




def doubtandreply(request):
    ob = doubt_table.objects.filter(EXPERT__LOGIN=request.session["lid"])
    return render(request,"EXPERT/DOUBT AND REPLY.html",{'val':ob})

def sendreply(request,id):
    request.session['did']=id
    return render(request,"EXPERT/SEND REPLY.html")

def reply(request):
    reply=request.POST['textfield']
    ob=doubt_table.objects.get(id=request.session['did'])
    ob.reply=reply
    ob.save()

    return HttpResponse('''<script>alert("Reply sended");window.location='/doubtandreply'</script>''')




def experthome(request):
    return render(request,"EXPERT/expertindex.html")

def guidancetoparent(request):
    ob=guidance_table.objects.filter(EXPERT__LOGIN=request.session["lid"])
    return render(request,"EXPERT/GUIDANCE TO PARENT.html",{'val':ob})

def studymaterial(request):
    ob=parent_table.objects.all()
    return render(request,"EXPERT/STUDY MATERIAL.html",{"val":ob})

def addguidance(request):
    ob=parent_table.objects.all()
    return render(request,"EXPERT/ADD GUIDANCE.html",{'val':ob})


def addassement(request):
    ob=parent_table.objects.all()
    return render(request,"EXPERT/ADD ASSESTEMT.html",{'val':ob})




def sendassestmentcode(request):
    guidance=request.POST['textfield']
    pid=request.POST['select']
    ob=child_assessment()
    ob.EXPERT=expert_table.objects.get(LOGIN__id=request.session['lid'])
    ob.PARENT=parent_table.objects.get(id=pid)
    ob.report=guidance
    ob.save()
    return HttpResponse('''<script>alert("Assesment Added");window.location='/childassmnt#about'</script>''')


def EDITassement(request,id):
    request.session['pp']=id
    obb=child_assessment.objects.get(id=id)
    return render(request,"EXPERT/EDIT ASSESTEMT.html",{'val1':obb})

def deleteassesment(request,id):
    ob=child_assessment.objects.get(id=id)

    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/childassmnt'</script>''')



def editassestmentcode(request):
    guidance=request.POST['textfield']
    ob=child_assessment.objects.get(id=request.session['pp'])
    ob.report=guidance
    ob.save()
    return HttpResponse('''<script>alert("Assesment Edited");window.location='/childassmnt#about'</script>''')






def sendguidance(request):
    guidance=request.POST['textfield']
    pid=request.POST['select']
    ob=guidance_table()
    ob.EXPERT=expert_table.objects.get(LOGIN__id=request.session['lid'])
    ob.PARENT=parent_table.objects.get(id=pid)
    ob.guidance=guidance
    ob.save()
    return HttpResponse('''<script>alert("Guidance Added");window.location='/guidancetoparent#about'</script>''')

# def sendreply(request):
#     return render(request,"EXPERT/SEND REPLY.html")



def delete(request,id):
    ob=Tips_table.objects.get(id=id)

    ob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/addtips'</script>''')


def addmaterial(request,id):
    ob=study_material.objects.filter(EXPERT__LOGIN__id=request.session['lid'])
    request.session['pp']=id



    s = ["1.mp4", "2.mp4", "3.mp4"]
    data=[]
    for i in s:
        per = 0.0
        ob2=video_frame_table.objects.filter(Student=id,video=i)
        for ij in ob2:
            per=per+ij.ratio
        row={"video":i,"per":per}
        data.append(row)






    return render(request,"EXPERT/ADD MATERIAL.html",{"val":ob,"data":data})

def addmatrialcode(request):
    mtrl=request.FILES['file']
    fs=FileSystemStorage()
    fp=fs.save(mtrl.name,mtrl)
    dtls=request.POST['fil1']

    ob=study_material()
    ob.PARENT=parent_table.objects.get(id=request.session['pp'])
    ob.EXPERT=expert_table.objects.get(LOGIN__id=request.session["lid"])
    ob.material=fp
    ob.date=datetime.today()
    ob.discription=dtls
    ob.save()
    return HttpResponse('''<script>alert("Added");window.location='/studymaterial'</script>''')


def newregistration(request):
    return render(request,"registerindex.html")


def reg_code(request) :
    nm=request.POST['name']
    img=request.FILES['img']
    fs = FileSystemStorage()
    imgnm=fs.save(img.name,img)
    plc=request.POST['place']
    pn=request.POST['pin']
    db=request.POST['dob']
    gndr=request.POST['radio']
    phn=request.POST['phone']
    ml=request.POST['email']
    expnce=request.POST['exp']
    prf=request.FILES['pf']
    prfnm=fs.save(prf.name,prf)
    usrnm=request.POST['uname']
    psswrd=request.POST['password']

    ob=login_table()
    ob.username=usrnm
    ob.password=psswrd
    ob.type="pending"
    ob.save()

    ok=expert_table()
    ok.LOGIN=ob
    ok.name=nm
    ok.image=imgnm
    ok.place=plc
    ok.pin=pn
    ok.DOB=db
    ok.gender=gndr
    ok.phone_no=phn
    ok.mail_id=ml
    ok.experience=expnce
    ok.proof=prfnm
    ok.username=usrnm
    ok.password=psswrd
    ok.save()
    return HttpResponse('''<script>alert("REGISTERED SUCCESSFULLY");window.location='/'</script>''')








# webservice



def login_code1(request):
    username = request.POST['uname']
    password = request.POST['pass']
    try:
        users = login_table.objects.get(username=username, password=password)
        if users is None:
            data = {"task": "invalid"}

        else:
            ob=parent_table.objects.filter(LOGIN=users.id)
            if len(ob)>0:

                data = {"task": "valid", "id": users.id}
                r = json.dumps(data)
                return HttpResponse(r)
            else:
                data = {"task": "invalid"}
                r = json.dumps(data)
                print(r)
                return HttpResponse(r)

    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)




def feedback(request):
    fbk=request.POST['parentfb']
    lid=request.POST['userid']
    exp=request.POST['exp']
    ob=feedback_table()
    ob.PARENT=parent_table.objects.get(LOGIN__id=lid)
    ob.EXPERT=expert_table.objects.get(id=exp)
    ob.feedback=fbk
    ob.date=datetime.today()
    ob.save()

    return JsonResponse({"task":"success"})


def  sendcomplaint(request):
    cmplnt=request.POST['complaint']
    lid = request.POST['userid']
    eid = request.POST['eid']
    ob = complaint_table()
    ob.PARENT = parent_table.objects.get(LOGIN__id=lid)
    ob.EXPERT = expert_table.objects.get(id=eid)
    ob.issue = cmplnt
    ob.reply = 'pending'
    ob.date = datetime.today()
    ob.save()

    return JsonResponse({"task": "success"})


def studentRegistration(request):
    name = request.POST['name']
    stdname = request.POST['sname']
    phone = request.POST['ph']
    email = request.POST['email']
    usrname = request.POST['uname']
    psswrd = request.POST['pss']

    ob1=login_table()
    ob1.username=usrname
    ob1.password=psswrd
    ob1.type='parent'
    ob1.save()

    ob = parent_table()
    ob.LOGIN=ob1
    ob.name = name
    ob. child_name =stdname
    ob.phone_no = phone
    ob.mail_id = email
    ob.save()

    return JsonResponse({"task": "success"})


def doubt(request):
    user = request.POST['userid']
    exprt = request.POST['expid']
    doubt = request.POST['questions']
    ob = doubt_table()
    ob. EXPERT = expert_table.objects.get(id=exprt)
    ob.PARENT = parent_table.objects.get(LOGIN__id=user)
    ob.date = datetime.today()
    ob.reply = 'pending'
    ob.doubt=doubt
    ob.save()
    return JsonResponse({"task": "success"})



def reply_app_complaint(request):
    print(request.POST,"pppppppppppp")
    user_id = request.POST['lid']
    complaint_obj = complaint_table.objects.filter(PARENT__LOGIN__id=user_id)
    data = []
    for i in complaint_obj:
        row = {'expert':i.EXPERT.name,'Complaint': i.issue, 'Reply': i.reply, 'Date': str(i.date)}
        data.append(row)
        print(row, "oooooooooo")

    r = json.dumps(data)
    return HttpResponse(r)


def StudyMaterial1(request):
    user_id = request.POST['lid']
    complaint_obj = study_material.objects.filter(PARENT__LOGIN__id=user_id)
    data = []
    for i in complaint_obj:
        row = {'expertname': i.EXPERT.name, 'material': i.material.url, 'Date': str(i.date)}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def viewguidance(request):
    user_id = request.POST['lid']
    complaint_obj =guidance_table.objects.filter(PARENT__LOGIN__id=user_id)
    data = []
    for i in complaint_obj:
        row = {'expertname': i.EXPERT.name, 'guidance': i.guidance}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def ViewReply_doubt(request):
    user_id = request.POST['lid']
    complaint_obj =doubt_table.objects.filter(PARENT__LOGIN__id=user_id)
    data = []
    for i in complaint_obj:
        row = {'question': i.doubt, 'reply': i.reply,'exp':i.EXPERT.name}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)

def Viewtips(request):
    complaint_obj =Tips_table.objects.all()
    data = []
    for i in complaint_obj:
        row = {'tips': i. tips, 'expertname': i.EXPERT.name}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)


def viewexpert1(request):
    complaint_obj =expert_table.objects.all()
    data = []
    for i in complaint_obj:
        row = {'id': i.id, 'exp': i.name}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)



def assesment_report(request):
    lid=request.POST['lid']
    complaint_obj = child_assessment.objects.filter(PARENT__LOGIN__id=lid)
    data = []
    for i in complaint_obj:
        row = {'expertname': i.EXPERT.name , 'material': i.report}
        data.append(row)
    r = json.dumps(data)
    return HttpResponse(r)




def in_message2(request):
    fromid = request.POST['fid']
    message=request.POST['msg']
    ob=chatbot_table()
    ob.USER=parent_table.objects.get(LOGIN__id=fromid)
    ob.question=message
    ob.answer=reply
    ob.date=datetime.today()
    ob.save()


    return JsonResponse({"status":'send'})




def view_message2(request):
    complaint_obj = question_table.objects.all()
    data = []
    for i in complaint_obj:
        row = {'name': i.question, 'id': i.id,"ans":i.answer}
        data.append(row)
    r = json.dumps(data)

    print(data)
    return HttpResponse(r)





def attent(request):
    ans = request.POST['data']
    qid = request.POST['qid']
    lid = request.POST['lid']
    obx=question_result.objects.filter(Question=qid,Parent__LOGIN=lid)
    if (len(obx)>0):
        ob = question_result.objects.get(id=obx[0].id)
        ob.Parent = parent_table.objects.get(LOGIN__id=lid)
        ob.Question_id = qid
        ob.ans = ans
        ob.date = datetime.now().date()
        ob.save()

    else:

        ob = question_result()
        ob.Parent=parent_table.objects.get(LOGIN__id=lid)
        ob.Question_id = qid
        ob.ans = ans
        ob.date=datetime.now().date()
        ob.save()

    return JsonResponse({"task": "success"})
def parent_view_result(request):
    lid=request.POST["lid"]
    data=[]
    datamain=[]
    ob=question_result.objects.filter(Parent__LOGIN=lid)
    tottal=0
    pers=0

    review=""
    totalcount=len(ob)
    for i in ob:
        if  i.ans=="1":
            row = {'question': i.Question.question, 'id': i.id, "yans":"yes","org_ans":i.Question.answer}
            data.append(row)
        else:
            row = {'question': i.Question.question, 'id': i.id, "yans": "no","org_ans":i.Question.answer}
            data.append(row)

    # datamain.append(data)
    for i in ob:
        if i.ans == "1":
            tottal = tottal + 1
        else:
            pass
    pers=(tottal/totalcount)*100

    print("total---",tottal)
    print("totalcount---",totalcount)
    print("persne---",pers)

    if pers<=40.0:
        review="The child shows autistic conditions, Hence need for consultation is mandatory."
    elif pers>=41.0 and pers<=79.0:
        review="It shows slight changes from normal behaviour of children, need for consultation is necessery"
    elif pers >=80.0:
        review="The child is in normal state, similar to other children."
    r={"review":review,"data":data}
    # datamain.append(r)





    x = json.dumps(r)

    print(datamain)
    return HttpResponse(x)









