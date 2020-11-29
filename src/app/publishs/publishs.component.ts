import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { UserService } from '../user.service';

@Component({
  selector: 'app-publishs',
  templateUrl: './publishs.component.html',
  styleUrls: ['./publishs.component.css']
})
export class PublishsComponent implements OnInit {

  teachers={};
  publishs={};
  teacher_id='';
  constructor(private cookie:CookieService, private http:HttpClient,private _user:UserService,private route:Router) {
    this.teachers = JSON.parse(cookie.get("login"));
    this.teacher_id = this.teachers["teacher_id"];
    //console.log(this.studentsc)
   }
   ngOnInit() {

    this.http.get<any>('http://localhost:3000/homework/Publishs/'+ this.teacher_id).subscribe(data => {
        this.publishs = data;
        //console.log(data);
    })        
}
}
