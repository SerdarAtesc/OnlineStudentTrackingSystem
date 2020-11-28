import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../user.service';
import {HttpClient} from '@angular/common/http'
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-odevekle',
  templateUrl: './odevekle.component.html',
  styleUrls: ['./odevekle.component.css']
})

export class OdevekleComponent implements OnInit {

  
  students='';
  teacher_id="";
  teacher={};
  
   


  constructor(private http:HttpClient,private _user:UserService,private  cookie:CookieService) {
    const allCookies: {} = cookie.getAll();

    this.teacher = JSON.parse(cookie.get("login"));

    this.teacher_id = this.teacher["teacher_id"];
    //console.log(this.teacher_id);
    
   }


   odevekleForm :FormGroup = new FormGroup({
     
    title:new FormControl(null,[Validators.required]),
    detail:new FormControl(null, Validators.required),
    assignerid: new FormControl(null,Validators.required),
    lectureid:new FormControl(null, Validators.required),
    studentid:new FormControl(null, Validators.required),
  })
  ngOnInit() {
    this.odevekleForm.controls['assignerid'].setValue(this.teacher_id);
    this.http.get<any>('http://localhost:3000/student/List/0').subscribe(data => {
        this.students = data;
       // console.log(this.students);
    })        
}

odevekle(){

  console.log(this.odevekleForm.value);




  if(!this.odevekleForm.valid){

    console.log('Invalid');
    
    return ;
  }
  this._user.odevekle(this.odevekleForm.value)

}}
