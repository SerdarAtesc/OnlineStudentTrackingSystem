import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { UserService } from '../user.service';

@Component({
  selector: 'app-ogrenciler',
  templateUrl: './ogrenciler.component.html',
  styleUrls: ['./ogrenciler.component.css']
})




export class OgrencilerComponent implements OnInit {

  students='';
    

  constructor(private http:HttpClient,private _user:UserService) {

      

   }



   ngOnInit() {
    this.http.get<any>('http://localhost:3000/student/List/0').subscribe(data => {
        this.students = data;
       // console.log(this.students);
    })        
}
studentDelete(homework_id){
  this._user.deleteStudent(homework_id)
      .subscribe(response => {
        console.log(response)
      
      });
      
}



}
