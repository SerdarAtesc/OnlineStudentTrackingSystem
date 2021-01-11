import { Message } from '@angular/compiler/src/i18n/i18n_ast';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { UserService } from '../user.service';
@Component({
  selector: 'app-bilgilerim',
  templateUrl: './bilgilerim.component.html',
  styleUrls: ['./bilgilerim.component.css']
})
export class BilgilerimComponent implements OnInit {
  students={};
  login_name;
  login_password;
  student_class_id;
  student_name;
  student_lastname;
  student_mail;
  student_number;
  student_id;
  student_phone;
  constructor(private cookie:CookieService,private user:UserService,private route:Router,) {
  
    
    this.students = JSON.parse(this.cookie.get("login"));
    //console.log(this.students);
    this.student_id=this.students["student_id"];
    this.login_name=this.students["login_name"];
    this.login_password= this.students["login_password"];
    this.student_class_id=this.students["student_class_id"];
    this.student_name=this.students["student_name"];
    this.student_lastname=this.students["student_lastname"];
    this.student_mail=this.students["student_mail"];
    this.student_number=this.students["student_number"];
    this.student_phone=this.students["student_phone"];

    this.fonksiyon();

   }
   

   studentsUpdateForm :FormGroup = new FormGroup({
    
    mail:new FormControl(null,[Validators.required]),
    username: new FormControl(null,Validators.required),
    phone: new FormControl(null,Validators.required),
    password: new FormControl(null,Validators.required),
    id: new FormControl(null,Validators.required),

    
  })

  fonksiyon(){
    this.studentsUpdateForm.setValue({   mail: this.student_mail,username: this.login_name,phone: this.student_phone,password: this.login_password,id: this.student_id});
   // console.log(this.studentsUpdateForm);
  }
  

  ngOnInit(): void {
 
    
  }

  update(){

    console.log(this.studentsUpdateForm.value);
    if(!this.studentsUpdateForm.valid){
  
      console.log('Invalid');
      
      return ;
    }
    this.cookie.deleteAll();
    if(confirm("Bilgilerinizi güncellerseniz tekrar giriş yapın")) {
      this.user.update(this.studentsUpdateForm.value)
      this.route.navigate(['login']);
  }
    
  
  }
  
}
