import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OdevlerimComponent } from './odevlerim.component';

describe('OdevlerimComponent', () => {
  let component: OdevlerimComponent;
  let fixture: ComponentFixture<OdevlerimComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OdevlerimComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OdevlerimComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
