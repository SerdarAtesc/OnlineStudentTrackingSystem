import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PublishsComponent } from './publishs.component';

describe('PublishsComponent', () => {
  let component: PublishsComponent;
  let fixture: ComponentFixture<PublishsComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PublishsComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PublishsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
