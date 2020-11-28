import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-userhome',
  templateUrl: './userhome.component.html',
  styleUrls: ['./userhome.component.css']
})
export class UserhomeComponent implements OnInit {

  username = '';
  cookie: any;

  
  constructor(private _user:UserService, private _router:Router,cookie:CookieService) { 


    const allCookies: {} = cookie.getAll();
    this.username=cookie.get('student_name');
  }

  ngOnInit() {
  }


}