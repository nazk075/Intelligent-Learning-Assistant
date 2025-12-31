from django.db import models

# Create your models here.

class login_table(models.Model):
    username=models.CharField(max_length=100)
    password=models.CharField(max_length=100)
    type=models.CharField(max_length=100)


class expert_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    image=models.FileField()
    place=models.CharField(max_length=100)
    pin=models.IntegerField()
    proof=models.FileField()
    DOB=models.DateField()
    experience=models.IntegerField()
    phone_no=models.BigIntegerField()
    mail_id=models.CharField(max_length=100)
    gender=models.CharField(max_length=100)


class parent_table(models.Model):
    LOGIN=models.ForeignKey(login_table,on_delete=models.CASCADE)
    name=models.CharField(max_length=100)
    child_name=models.CharField(max_length=100)
    phone_no=models.BigIntegerField()
    mail_id=models.CharField(max_length=100)

class complaint_table(models.Model):
    PARENT=models.ForeignKey(parent_table,on_delete=models.CASCADE)
    EXPERT=models.ForeignKey(expert_table,on_delete=models.CASCADE)
    issue=models.CharField(max_length=100)
    reply=models.CharField(max_length=100)
    date=models.DateField()


class feedback_table(models.Model):
    PARENT=models.ForeignKey(parent_table,on_delete=models.CASCADE)
    EXPERT=models.ForeignKey(expert_table,on_delete=models.CASCADE)
    feedback=models.CharField(max_length=100)
    date=models.DateField()


class doubt_table(models.Model):
    PARENT=models.ForeignKey(parent_table,on_delete=models.CASCADE)
    doubt=models.TextField()
    EXPERT=models.ForeignKey(expert_table, on_delete=models.CASCADE)
    date=models.DateField()
    reply=models.CharField(max_length=100)


class guidance_table(models.Model):
    PARENT=models.ForeignKey(parent_table, on_delete=models.CASCADE)
    EXPERT=models.ForeignKey(expert_table, on_delete=models.CASCADE)
    guidance=models.TextField()

class Tips_table(models.Model):
    EXPERT=models.ForeignKey(expert_table, on_delete=models.CASCADE)
    tips=models.TextField()


class child_assessment(models.Model):
    PARENT=models.ForeignKey(parent_table,on_delete=models.CASCADE)
    EXPERT=models.ForeignKey(expert_table, on_delete=models.CASCADE)
    reportipconfig=models.CharField(max_length=100)


class study_material(models.Model):
    PARENT=models.ForeignKey(parent_table,on_delete=models.CASCADE)
    EXPERT=models.ForeignKey(expert_table,on_delete=models.CASCADE)
    material=models.FileField()
    date=models.DateField()
    discription=models.TextField()

class assign_table(models.Model):
        PARENT=models.ForeignKey(parent_table, on_delete=models.CASCADE)
        EXPERT=models.ForeignKey(expert_table, on_delete=models.CASCADE)
        date=models.DateField()
        status=models.TextField()

class question_table(models.Model):
        question=models.TextField()
        answer=models.CharField(max_length=100)


class question_result(models.Model):
    Question=models.ForeignKey(question_table,on_delete=models.CASCADE)
    ans=models.CharField(max_length=10)
    date=models.DateField()
    Parent=models.ForeignKey(parent_table,on_delete=models.CASCADE)



#
#
# class chatbot_table(models.Model):
#     USER=models.ForeignKey(parent_table,on_delete=models.CASCADE)
#     question = models.TextField()
#     answer = models.TextField()





class video_frame_table(models.Model):
    video=models.CharField(max_length=100)
    ratio=models.FloatField()
    Student=models.ForeignKey(parent_table,on_delete=models.CASCADE)






