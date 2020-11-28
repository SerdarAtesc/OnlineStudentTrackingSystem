import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-adminnavbar',
  templateUrl: './adminnavbar.component.html',
  styleUrls: ['./adminnavbar.component.css']
})
export class AdminnavbarComponent implements OnInit {

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
