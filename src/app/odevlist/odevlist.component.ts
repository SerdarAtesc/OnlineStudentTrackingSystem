import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { UserService } from '../user.service';

@Component({
  selector: 'app-odevlist',
  templateUrl: './odevlist.component.html',
  styleUrls: ['./odevlist.component.css']
})
export class OdevlistComponent implements OnInit {
  teachers={};
  teacher_id='';
  constructor(private cookie:CookieService, private http:HttpClient,private _user:UserService,private route:Router) {
    this.teachers = JSON.parse(cookie.get("login"));

    this.teacher_id = this.teachers["teacher_id"];
    //console.log(this.studentsc)
   }

  ngOnInit() {

    this.http.get<any>('http://localhost:3000/homework/teacherHomeworkList/'+ this.teacher_id).subscribe(data => {
        this.teachers = data;
        console.log(data);
    })        
}


homeworkDelete(homework_id){
  this._user.deleteHomeWork(homework_id)
      .subscribe(response => {
        console.log(response)
      
      });
      
}








}
