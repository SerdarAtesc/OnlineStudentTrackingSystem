import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { UserService } from '../user.service';

@Component({
  selector: 'app-odevteslim',
  templateUrl: './odevteslim.component.html',
  styleUrls: ['./odevteslim.component.css']
})
export class OdevteslimComponent implements OnInit {
  odevid;
  students={};
  student_id='';
  constructor(private route:Router,private http:HttpClient,private cookie:CookieService,private user:UserService) {
    const urlParams = new URLSearchParams(window.location.search); const myParam = urlParams.get('id');
    this.odevid = myParam;
    //console.log(myParam);
    this.students = JSON.parse(cookie.get("login"));
    this.student_id = this.students["student_id"];
    this.fonksiyon();
    
   }

   teslimetForm :FormGroup = new FormGroup({
    publisherid:new FormControl(null,[Validators.required]),
    homeworkid:new FormControl(null, Validators.required),
    detail: new FormControl(null,Validators.required)
  })

  fonksiyon(){
    
    //console.log(this.teslimetForm)

  }
  ngOnInit(): void {
    this.teslimetForm.setValue({ publisherid: this.student_id , homeworkid : this.odevid, detail : ""     });
    //console.log(this.teslimetForm)
  }
  teslimet(){
    console.log(this.teslimetForm.value);
    if(!this.teslimetForm.valid){
      console.log('Invalid'); 
      return ;
    }
    this.user.odevteslim(this.teslimetForm.value);
    this.route.navigate(["odevlerim"]);
  }

}
