import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OgretmenekleComponent } from './ogretmenekle.component';

describe('OgretmenekleComponent', () => {
  let component: OgretmenekleComponent;
  let fixture: ComponentFixture<OgretmenekleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OgretmenekleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OgretmenekleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
