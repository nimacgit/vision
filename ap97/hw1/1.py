import time
from matplotlib import pyplot as plt
import cv2 as cv
import numpy as np


lady = cv.imread("lady-gaga.jpg", cv.IMREAD_ANYCOLOR)
cv.imshow("lady", lady)
plt.imshow(lady)
#plt.show()
cv.rectangle(lady, (0, 0), (200, 200), (0, 0, 255), 10)
cv.circle(lady, (450, 160), 100, (0, 0, 255), 10)

pts = np.array([[10, 5], [20, 30], [70, 40], [90, 120], [50, 5]], np.int32)
cv.polylines(lady, [pts], True, (0, 255, 255), 5)
font = cv.FONT_HERSHEY_COMPLEX
cv.putText(lady, "I LOVE CV", (200, 200), fontFace=font, fontScale=3, color=(0,0,0))


cv.imwrite("laddy-2ga.jpg", lady)

cv.imshow("2ga", lady)

k = cv.waitKey(0)
