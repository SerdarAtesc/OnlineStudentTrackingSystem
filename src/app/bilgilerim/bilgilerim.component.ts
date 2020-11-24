import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-bilgilerim',
  templateUrl: './bilgilerim.component.html',
  styleUrls: ['./bilgilerim.component.css']
})
export class BilgilerimComponent implements OnInit {

  student ={};
  constructor(private cookie:CookieService) {

    const allCookies: {} = cookie.getAll();
    this.student = JSON.parse(cookie.get("login"));

   }

  ngOnInit(): void {
  }

}
