#!/usr/bin/env python3
import pypangolin as pango
import numpy as np
import OpenGL.GL as gl
import time

def main():
 pango.CreateWindowAndBind('main',640,480)
 gl.glEnable(gl.GL_DEPTH_TEST)
 pm = pango.ProjectionMatrix(640, 480, 420, 420, 320, 240, 0.1, 1000)
 mv = pango.ModelViewLookAt(-0, 0.5, -3, 0, 0, 0, pango.AxisY)
 s_cam = pango.OpenGlRenderState(pm, mv)

if __name__ == '__main__' :
	main()
