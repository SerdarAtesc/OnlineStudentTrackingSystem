import { Component, OnInit } from '@angular/core';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-bilgilerim',
  templateUrl: './bilgilerim.component.html',
  styleUrls: ['./bilgilerim.component.css']
})
export class BilgilerimComponent implements OnInit {


  constructor(private cookie:CookieService) {

   }

  ngOnInit(): void {
  }

}
