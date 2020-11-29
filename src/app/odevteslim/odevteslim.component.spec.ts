import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OdevteslimComponent } from './odevteslim.component';

describe('OdevteslimComponent', () => {
  let component: OdevteslimComponent;
  let fixture: ComponentFixture<OdevteslimComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OdevteslimComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OdevteslimComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
