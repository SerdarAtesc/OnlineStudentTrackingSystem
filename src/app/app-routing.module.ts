import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminhomeComponent } from './adminhome/adminhome.component';
import { AdminnavbarComponent } from './adminnavbar/adminnavbar.component';
import { AppComponent } from './app.component';
import { BilgilerimComponent } from './bilgilerim/bilgilerim.component';
import { LoginComponent } from './login/login.component';
import { OdevekleComponent } from './odevekle/odevekle.component';
import { OdevlerimComponent } from './odevlerim/odevlerim.component';
import { OdevlistComponent } from './odevlist/odevlist.component';
import { OdevteslimComponent } from './odevteslim/odevteslim.component';
import { OgrenciekleComponent } from './ogrenciekle/ogrenciekle.component';
import { OgrencilerComponent } from './ogrenciler/ogrenciler.component';
import { PublishsComponent } from './publishs/publishs.component';
import { RegisterComponent } from './register/register.component';
import { UserhomeComponent } from './userhome/userhome.component';
import { UsernavbarComponent } from './usernavbar/usernavbar.component';

const routes: Routes = [
  {path:'',redirectTo:'login',pathMatch:'full'},
  {path:"",component:AppComponent},
  {path: "login", component:LoginComponent},
  {path: "register", component:RegisterComponent},
  {path:"userhome",component:UserhomeComponent},
  {path: "adminhome",component:AdminhomeComponent},
  {path: "ogrenciler", component:OgrencilerComponent},
  {path:"bilgilerim",component:BilgilerimComponent},
  {path:"ogrenciekle",component:OgrenciekleComponent},
  {path:"adminnavbar",component:AdminnavbarComponent},
  {path:"usernavbar",component:UsernavbarComponent},
  {path:"odevekle",component:OdevekleComponent},
  {path:"odevlerim",component:OdevlerimComponent},
  {path:"odevlist",component:OdevlistComponent},
  {path:"odevteslim",component:OdevteslimComponent},
  {path:"publishs",component:PublishsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
