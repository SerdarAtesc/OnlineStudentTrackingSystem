import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OdevekleComponent } from './odevekle.component';

describe('OdevekleComponent', () => {
  let component: OdevekleComponent;
  let fixture: ComponentFixture<OdevekleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OdevekleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OdevekleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
