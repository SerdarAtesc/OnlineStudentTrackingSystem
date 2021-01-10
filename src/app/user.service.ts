import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import { UserhomeComponent } from './userhome/userhome.component';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';





@Injectable({
  providedIn: 'root'
})
export class UserService {
  logout() {
    throw new Error('Method not implemented.');
  }

  constructor(private _http: HttpClient , private _router:Router) {
    
   }

  login(body: any){
    console.log(body);
    
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
  async ogretmenekle(postdata: any){
    const response = await fetch('http://localhost:3000/teachers/Add', {
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

  async odevekle(postdata: any){
    const response = await fetch('http://localhost:3000/homework/Add', {
      method: 'POST',
      body: JSON.stringify(postdata),
      headers: {'Content-Type': 'application/json; charset=UTF-8'} });

    if (!response.ok) { /* Handle */ }
    if (response.body !== null) {

      //console.log(response);

      const promise = new Promise((resolve, reject) => {
        resolve(123);
      });
      promise.then((res) => {
        //console.log('I get called:', res === 123); // I get called: true
      });
      promise.catch((err) => {
        // This is never called
      });
    }
  }
  deleteHomeWork(id){
    return this._http.delete('http://localhost:3000/homework/Delete/'+ id);
  }
  deleteStudent(id){
    return this._http.delete('http://localhost:3000/student/Delete/'+ id);
  }
  
  async update(postdata: any){
    const response = await fetch('http://localhost:3000/student/Update', {
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
  async passwordUpdate(postdata: any){
    
    const response = await fetch('http://localhost:3000/student/UpdatePassword', {
      method: 'POST',
      body: JSON.stringify(postdata),
      headers: {'Content-Type': 'application/json; charset=UTF-8'} })
      


      .then(function(response) {return response.text();})
             .then(function(data) {if(data.toString()=="true"){
               alert("Başarılı");
               location.href="login";
               ;}
               else{
                 alert("Hatalı Bilgi");
               }; });
      

    
  }
  
  async odevteslim(postdata: any){
    const response = await fetch('http://localhost:3000/homework/Publish', {
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
