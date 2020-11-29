import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-usernavbar',
  templateUrl: './usernavbar.component.html',
  styleUrls: ['./usernavbar.component.css']
})
export class UsernavbarComponent implements OnInit {

  username = '';
  student={};

  constructor(private cookie:CookieService) { 

    const allCookies: {} = cookie.getAll();
    this.student = JSON.parse(cookie.get("login"));
    //console.log(this.student);
    this.username=this.student["student_name"] + "  "     + this.student["student_lastname"];

  }


  deletecookies(){
    this.cookie.deleteAll();
  }
  ngOnInit(): void {
  }

}
