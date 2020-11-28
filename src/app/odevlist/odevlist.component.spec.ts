import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OdevlistComponent } from './odevlist.component';

describe('OdevlistComponent', () => {
  let component: OdevlistComponent;
  let fixture: ComponentFixture<OdevlistComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OdevlistComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OdevlistComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
