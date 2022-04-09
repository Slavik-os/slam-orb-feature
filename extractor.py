import cv2
import numpy as np

from skimage.measure import ransac
from skimage.transform import EssentialMatrixTransform
from skimage.transform import FundamentalMatrixTransform

class Extractor(object):
	def __init__(self) :
		self.orb = cv2.ORB_create()
		#clean points
		self.bf = cv2.BFMatcher(cv2.NORM_HAMMING) 
		self.last = None

	def extract(self,img):
		# detection
		feats = cv2.goodFeaturesToTrack(np.mean(img, axis=2).astype(np.uint8), 3000, qualityLevel=0.01, minDistance=7)

		# extraction 
		kps = [cv2.KeyPoint(x=f[0][0],y=f[0][1],size=20) for f in feats]
		kps,des = self.orb.compute(img,kps)

		# matching	
		ret = []
		matches = None
		if self.last is not None :
			matches = self.bf.knnMatch(des,self.last['des'],k=2)
			for m,n in matches:
		 	 if m.distance < 0.75 * n.distance:
			   kp1 = kps[m.queryIdx].pt
			   kp2 = self.last['kps'][m.trainIdx].pt
			   ret.append((kp1,kp2))
		
		# filter 
		if len(ret) > 0 :
			ret = np.array(ret)

			# Find the Center of cameta
			# Submtract to move to 0 
			ret[:,:,0] -= img.shape[0]//2
			ret[:,:,1] -= img.shape[1]//2
			model, inliers = ransac((ret[:,0],ret[:,1]),
						 #EssentialMatrixTransform,
						 FundamentalMatrixTransform,
       						 min_samples=8,
						 residual_threshold=1,
						 max_trials=100)
			ret = ret[inliers]
			s,v,d = np.linalg.svd(model.params)
		
		# return 
		self.last = {'kps':kps,'des':des}
		return ret
