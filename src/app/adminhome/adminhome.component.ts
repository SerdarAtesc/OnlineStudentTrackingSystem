import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';
import {CommonModule} from '@angular/common'
@Component({
  selector: 'app-adminhome',
  templateUrl: './adminhome.component.html',
  styleUrls: ['./adminhome.component.css']
})
export class AdminhomeComponent implements OnInit {


   teacher={};
   teacher_name='';
  constructor(private cookie:CookieService) {
    
    const allCookies: {} = cookie.getAll();
    this.teacher = JSON.parse(cookie.get("login"));
    console.log(this.teacher);
    this.teacher_name=this.teacher["teacher_name"] + "  "     + this.teacher["teacher_lastname"];


   }


   
  



  ngOnInit(): void {
    

  }

}
