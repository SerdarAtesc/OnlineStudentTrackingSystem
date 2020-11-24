import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OgrenciekleComponent } from './ogrenciekle.component';

describe('OgrenciekleComponent', () => {
  let component: OgrenciekleComponent;
  let fixture: ComponentFixture<OgrenciekleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OgrenciekleComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OgrenciekleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
