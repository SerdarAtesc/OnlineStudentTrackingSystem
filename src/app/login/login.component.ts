import { JsonPipe } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';

import { UserService } from '../user.service';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  login_detail_type;



  loginForm : FormGroup=new FormGroup({
    username:new FormControl(null,[Validators.required]),
    password:new FormControl(null, Validators.required)
  });



  constructor(private _router:Router, private _user:UserService, private cookie: CookieService) {  }

  ngOnInit(): void {
   
  
  }
  moveToRegister(){
    this._router.navigate(['/register']);
  }


    



  login(){
    if(!this.loginForm.valid){
      console.log('Invalid');
      return ;
    }
    this._user.login(JSON.stringify(this.loginForm.value))
    .subscribe( 
      data=>{console.log(data);
        var cookieobj = this.cookie;

  
        cookieobj.set("login-type",data["login_type"]);
        if(data["login_type"]==1)
        {
          cookieobj.set("login",JSON.stringify(data));
          this._router.navigate(['userhome']);
        }
        else if(data["login_type"]==2){

          cookieobj.set("login",JSON.stringify(data));
          this._router.navigate(['adminhome']);
        }
        else{
          alert("Bilgileriniz Hatalı")
        }
        
      },
      error=>console.error(error),
    ) 
    
  }











}
