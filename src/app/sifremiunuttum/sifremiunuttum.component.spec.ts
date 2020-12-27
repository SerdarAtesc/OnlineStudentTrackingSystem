import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SifremiunuttumComponent } from './sifremiunuttum.component';

describe('SifremiunuttumComponent', () => {
  let component: SifremiunuttumComponent;
  let fixture: ComponentFixture<SifremiunuttumComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SifremiunuttumComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SifremiunuttumComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
