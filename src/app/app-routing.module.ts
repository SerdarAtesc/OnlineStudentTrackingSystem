import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminhomeComponent } from './adminhome/adminhome.component';
import { AppComponent } from './app.component';
import { BilgilerimComponent } from './bilgilerim/bilgilerim.component';
import { LoginComponent } from './login/login.component';
import { OgrenciekleComponent } from './ogrenciekle/ogrenciekle.component';
import { OgrencilerComponent } from './ogrenciler/ogrenciler.component';
import { RegisterComponent } from './register/register.component';
import { UserhomeComponent } from './userhome/userhome.component';

const routes: Routes = [
  {path:'',redirectTo:'login',pathMatch:'full'},
  {path:"",component:AppComponent},
  {path: "login", component:LoginComponent},
  {path: "register", component:RegisterComponent},
  {path:"userhome",component:UserhomeComponent},
  {path: "adminhome",component:AdminhomeComponent},
  {path: "ogrenciler", component:OgrencilerComponent},
  {path:"bilgilerim",component:BilgilerimComponent},
  {path:"ogrenciekle",component:OgrenciekleComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
