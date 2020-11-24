import { ComponentFixture, TestBed } from '@angular/core/testing';

import { OgrencilerComponent } from './ogrenciler.component';

describe('OgrencilerComponent', () => {
  let component: OgrencilerComponent;
  let fixture: ComponentFixture<OgrencilerComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ OgrencilerComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(OgrencilerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
