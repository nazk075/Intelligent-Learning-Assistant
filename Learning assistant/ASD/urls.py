from django.conf import settings
from django.conf.urls.static import static
from django.urls import path

from ASD import views

urlpatterns = (
    path('', views.login, name="login"),
    path('login_code', views.login_code, name="login_code"),
    path('viewcomplaint', views.viewcomplaint, name="viewcomplaint"),
    path('sendreply/<int:id>', views.sendreply, name="sendreply"),
    path('viewexpert', views.viewexpert, name="viewexpert"),
    path('viewparents', views.viewparents, name="viewparents"),
    path('adminhome', views.adminhome, name="adminhome"),
    path('reg_code', views.reg_code, name="reg_code"),
    path('reply', views.reply, name="reply"),
    path('sendguidance', views.sendguidance, name="sendguidance"),

    path('viewexpert_search', views.viewexpert_search, name="viewexpert_search"),
    path('viewparents_search', views.viewparents_search, name="viewparents_search"),
    path('viewcomplaint_search', views.viewcomplaint_search, name="viewcomplaint_search"),

    path('addtips', views.addtips, name="addtips"),
    path('addtips_post', views.addtips_post, name="addtips_post"),

    path('childassmnt', views.childassmnt, name="childassmnt"),
    path('doubtandreply', views.doubtandreply, name="doubtandreply"),
    path('sendreply/<int:id>', views.sendreply, name='sendreply'),
    path('reply', views.reply, name="reply"),
    path('experthome', views.experthome, name="experthome"),
    path('guidancetoparent', views.guidancetoparent, name="guidancetoparent"),
    path('studymaterial', views.studymaterial, name="studymaterial"),
    path('sendtips', views.sendtips, name='sendtips'),
    path('newregistration', views.newregistration, name="newregistration"),
    path('accept_expert/<int:id>', views.accept_expert, name="accept_expert"),
    path('reject_expert/<int:id>', views.reject_expert, name="reject_expert"),
    path('addguidance', views.addguidance, name="addguidance"),
    path('addassement', views.addassement, name="addassement"),
    path('sendassestmentcode', views.sendassestmentcode, name="sendassestmentcode"),
    path('EDITassement/<int:id>', views.EDITassement, name="EDITassement"),
    path('deleteassesment/<int:id>', views.deleteassesment, name="deleteassesment"),
    path('editassestmentcode', views.editassestmentcode, name="editassestmentcode"),
    # path('sendreply1', views.sendreply1, name="sendreply1"),
    path('addmaterial/<int:id>', views.addmaterial, name="addmaterial"),
    path('delete/<int:id>', views.delete, name="delete"),
    path('addmatrialcode', views.addmatrialcode, name="addmatrialcode"),

    path('feedback', views.feedback, name="feedback"),
    path('sendcomplaint', views.sendcomplaint, name="sendcomplaint"),
    path('doubt', views.doubt, name="doubt"),
    path('reply_app_complaint', views.reply_app_complaint, name="reply_app_complaint"),
    path('StudyMaterial1', views.StudyMaterial1, name="StudyMaterial1"),
    path('viewguidance', views.viewguidance, name="viewguidance"),
    path('ViewReply_doubt',views.ViewReply_doubt, name= "ViewReply_doubt"),
    path('Viewtips', views.Viewtips, name="Viewtips"),
    path('viewexpert1', views.viewexpert1, name="viewexpert1"),
    path('studentRegistration', views.studentRegistration, name="studentRegistration"),
    path('attent', views.attent, name="attent"),

    path('assesment_report', views.assesment_report, name="assesment_report"),
    path('login_code1', views.login_code1, name="login_code1"),
    path('in_message2', views.in_message2, name="in_message2"),
    path('view_message2', views.view_message2, name="view_message2"),
    path('parent_view_result', views.parent_view_result, name="parent_view_result"),




)