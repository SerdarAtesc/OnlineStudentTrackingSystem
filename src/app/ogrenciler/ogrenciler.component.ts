import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-ogrenciler',
  templateUrl: './ogrenciler.component.html',
  styleUrls: ['./ogrenciler.component.css']
})




export class OgrencilerComponent implements OnInit {

  totalAngularPackages='';
    

  constructor(private http:HttpClient) {

      

   }



   ngOnInit() {
    this.http.get<any>('http://localhost:3000/student/List/0').subscribe(data => {
        this.totalAngularPackages = data;
        console.log(this.totalAngularPackages);
    })        
}



}
