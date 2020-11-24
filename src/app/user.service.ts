import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { UserhomeComponent } from './userhome/userhome.component';





@Injectable({
  providedIn: 'root'
})
export class UserService {
  logout() {
    throw new Error('Method not implemented.');
  }

  constructor(private _http: HttpClient) { }

  login(body: any){
    return this._http.post('http://localhost:3000/login', body, {
      observe: 'body',
      withCredentials: true,
      headers: new HttpHeaders().append('Content-Type', 'application/json')

    });

  }
  async ogrenciekle(postdata: any){
    const response = await fetch('http://localhost:3000/student/Add', {
      method: 'POST',
      body: JSON.stringify(postdata),
      headers: {'Content-Type': 'application/json; charset=UTF-8'} });

    if (!response.ok) { /* Handle */ }
    if (response.body !== null) {

      console.log(response);

      const promise = new Promise((resolve, reject) => {
        resolve(123);
      });
      promise.then((res) => {
        console.log('I get called:', res === 123); // I get called: true
      });
      promise.catch((err) => {
        // This is never called
      });
    }
  }









}
