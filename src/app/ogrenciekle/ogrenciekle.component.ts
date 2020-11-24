import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { UserService } from '../user.service';

@Component({
  selector: 'app-ogrenciekle',
  templateUrl: './ogrenciekle.component.html',
  styleUrls: ['./ogrenciekle.component.css']
})
export class OgrenciekleComponent implements OnInit {

  ogrenciekleForm :FormGroup = new FormGroup({
    username:new FormControl(null,[Validators.required]),
    password:new FormControl(null, Validators.required),
    name:new FormControl(null, Validators.required),
    lastname:new FormControl(null, Validators.required),
    mail:new FormControl(null, Validators.required),
    phone:new FormControl(null, Validators.required),
    class:new FormControl(null, Validators.required)
  })

  constructor(private _router:Router,private _user:UserService) { }

  ngOnInit(): void {
  }

  ogrenciekle(){
    if(!this.ogrenciekleForm.valid){
      console.log('Invalid');
      return ;
    }
    this._user.ogrenciekle(this.ogrenciekleForm.value)


    

}}
