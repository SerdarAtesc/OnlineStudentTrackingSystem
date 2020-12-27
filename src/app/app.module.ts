import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {CommonModule} from '@angular/common'
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import {HttpClientModule} from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';

import {UserService} from './user.service';
import { UserhomeComponent } from './userhome/userhome.component'
import { CookieService } from 'ngx-cookie-service';
import { AdminhomeComponent } from './adminhome/adminhome.component';
import { OgrencilerComponent } from './ogrenciler/ogrenciler.component';
import { BilgilerimComponent } from './bilgilerim/bilgilerim.component';
import { OgrenciekleComponent } from './ogrenciekle/ogrenciekle.component';
import { AdminnavbarComponent } from './adminnavbar/adminnavbar.component';
import { UsernavbarComponent } from './usernavbar/usernavbar.component';
import { OdevekleComponent } from './odevekle/odevekle.component';
import { OdevlerimComponent } from './odevlerim/odevlerim.component';
import { OdevlistComponent } from './odevlist/odevlist.component';
import { OdevteslimComponent } from './odevteslim/odevteslim.component';
import { PublishsComponent } from './publishs/publishs.component';
import { OgretmenekleComponent } from './ogretmenekle/ogretmenekle.component';



@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    UserhomeComponent,
    AdminhomeComponent,
    OgrencilerComponent,
    BilgilerimComponent,
    OgrenciekleComponent,
    AdminnavbarComponent,
    UsernavbarComponent,
    OdevekleComponent,
    OdevlerimComponent,
    OdevlistComponent,
    OdevteslimComponent,
    PublishsComponent,
    OgretmenekleComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    CommonModule
  ],
  providers: [UserService,CookieService,],
  bootstrap: [AppComponent]
})
export class AppModule { }
