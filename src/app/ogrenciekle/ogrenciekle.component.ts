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
    alert("Şifre Önerisi:  "+this.genpass);
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
      alert("Eksik Bilgi");

      //console.log(this.ogrenciekleForm);
      return ;
    }
       
    if (this.ogrenciekleForm.value["name"].match(/[^a-zA-Z ğüşıöçĞÜŞİÖÇ.,]/g)) {
      alert ("isminiz hatalı")
      return   
  }
   else if (this.ogrenciekleForm.value["lastname"].match(/[^a-zA-Z ğüşıöçĞÜŞİÖÇ.,]/g)) {
    alert ("soyisim hatalı")
    return   
}
  else if (!this.ogrenciekleForm.value["phone"].match(/[^a-zA-Z ğüşıöçĞÜŞİÖÇ.,]/g)) {
  alert ("telefon hatalı")
  return   
}
    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
    if(!regex.test(this.ogrenciekleForm.value["mail"]))
    {
      alert("Email Hatalı")
      return 
    }


    this._user.ogrenciekle(this.ogrenciekleForm.value)
    this._router.navigate(["ogrenciler"]);

  
}




}
