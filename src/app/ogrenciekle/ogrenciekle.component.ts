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
  
  genpass;
  passChange(){

    this.genpass=Math.random().toString(36).slice(2);
   // alert("Şifreniz:  "+this.genpass);
    
}





  ogrenciekleForm :FormGroup = new FormGroup({
    username:new FormControl(null,Validators.required),
    password:new FormControl(null, Validators.required ),
    name:new FormControl(null, Validators.required),
    lastname:new FormControl(null, Validators.required),
    mail:new FormControl(null, Validators.required),
    phone:new FormControl(null, Validators.required),
    class:new FormControl(null, Validators.required),
    code:new FormControl(null, Validators.required)
  })

  constructor(private _router:Router,private _user:UserService) { }

  ngOnInit(): void {
  }

  ogrenciekle(){
    //this.ogrenciekleForm.setValue({password:this.genpass});
    if(!this.ogrenciekleForm.valid){
      console.log('Invalid');
      console.log(this.ogrenciekleForm);
      return ;
    }
    
    this._user.ogrenciekle(this.ogrenciekleForm.value)
    this._router.navigate(["ogrenciler"]);

  
}




}
