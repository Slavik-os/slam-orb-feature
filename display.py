import sdl2
import sdl2.ext
import cv2 
from matplotlib import pyplot as plt


class Display(object) :
  def __init__(self,W,H) :

    self.W,self.h = W,H
    self.window = sdl2.ext.Window("SLAM",size=(W,H))
    self.window.show()
  
  
  def paint(self,img):

    surf = sdl2.ext.pixels3d(self.window.get_surface())
    surf[:,:,0:3] = img.swapaxes(0,1)
    self.window.refresh()
    
    

