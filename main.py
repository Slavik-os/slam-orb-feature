#!/usr/bin/env python3
import cv2
import numpy as np
import sdl2
import sdl2.ext
from display import Display
from extractor import Extractor


W , H = 1920//2 ,1080//2

display = Display(W,H)
fe = Extractor()

def proccess_frame(img):
  img = cv2.resize(img,(W,H))

  # Extract points 
  matches = fe.extract(img)
 
  # Escape empty points 
  if matches is None :
    return 
 
  # Brute-Force Matching 
  for pt1,pt2 in matches :
   u1,v1 = map(lambda x: round(int(x)),pt1)
   u2,v2 = map(lambda x: round(int(x)),pt2)
   cv2.circle(img,(u1,v1),color=(0,255,0),radius=3)
   cv2.line(img,(u1,v1),(u2,v2),color=(255,0,0))

  display.paint(img) 



  # Don't need 
  events = sdl2.ext.get_events()
  for event in events :
   if event.type == sdl2.SDL_QUIT:
      exit(0)

if __name__ == '__main__':
  cap = cv2.VideoCapture("test_countryroad.mp4")

  while cap.isOpened() :
    ret,frame = cap.read() 

    if ret == True :
      proccess_frame(frame)

cap.release()
cv2.destroyAllWindows()
