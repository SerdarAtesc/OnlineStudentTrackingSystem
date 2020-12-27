import { Message } from '@angular/compiler/src/i18n/i18n_ast';
import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../user.service';

@Component({
  selector: 'app-sifremiunuttum',
  templateUrl: './sifremiunuttum.component.html',
  styleUrls: ['./sifremiunuttum.component.css']
})
export class SifremiunuttumComponent implements OnInit {

    passwordUpdateForm :FormGroup = new FormGroup({
    mail:new FormControl(null,[Validators.required]),
    username: new FormControl(null,Validators.required),
    code: new FormControl(null,Validators.required),
    password: new FormControl(null,Validators.required),
  })
  constructor(private _user:UserService,private _router:Router) { }

  ngOnInit(): void {
  }

  
  update(){

    console.log(this.passwordUpdateForm.value);

    if(!this.passwordUpdateForm.valid){
      console.log('Invalid');
      return ;
    }
    
      this._user.passwordUpdate(this.passwordUpdateForm.value)
     // this._router.navigate(['login']);
  
    
  
  }


}
