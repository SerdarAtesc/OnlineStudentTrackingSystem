import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BilgilerimComponent } from './bilgilerim.component';

describe('BilgilerimComponent', () => {
  let component: BilgilerimComponent;
  let fixture: ComponentFixture<BilgilerimComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BilgilerimComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BilgilerimComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
