import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { UserService } from '../user.service';
import { FormControl, FormGroup, Validators } from '@angular/forms';

@Component({
  selector: 'app-ogretmenekle',
  templateUrl: './ogretmenekle.component.html',
  styleUrls: ['./ogretmenekle.component.css']
})
export class OgretmenekleComponent implements OnInit {

  constructor(private _router:Router,private _user:UserService) { }

  ngOnInit(): void {
  }


  ogretmenekleForm :FormGroup = new FormGroup({
    username:new FormControl(null,[Validators.required]),
    password:new FormControl(null, Validators.required),
    name:new FormControl(null, Validators.required),
    lastname:new FormControl(null, Validators.required),
    mail:new FormControl(null, Validators.required),
    phone:new FormControl(null, Validators.required),
    detail:new FormControl(null, Validators.required)
  })

  ogretmenekle(){
    if(!this.ogretmenekleForm.valid){
      console.log('Invalid');
      return ;
    }
    
    this._user.ogretmenekle(this.ogretmenekleForm.value)
    this._router.navigate(["ogrenciler"]);



}}
