from tkinter import *

from GUI.main_menu_frame import main_menu_frame
from GUI.query_menu_frame import query_menu_frame

class GUI:

    def __init__(self):
        self.main = Tk()
        self.currentFrame = None
        self.childrenFrames = {
            "main_menu": main_menu_frame,
            "query_menu": query_menu_frame
        }

    def switchFrame(self, frameName):
        f = self.childrenFrames[frameName]
        if self.currentFrame is not None:
            self.currentFrame.pack_forget()
        self.currentFrame = f(self)
        self.currentFrame.pack()

    def createMainWindow(self):
        self.main.title("Online Movie Store DBMS")

        w = 1280
        h = 720
        ws = self.main.winfo_screenwidth()
        hs = self.main.winfo_screenheight()
        x = (ws/2) - (w/2)
        y = (hs/2) - (h/2)
        self.main.geometry('%dx%d+%d+%d' % (w, h, x, y))
        self.main.resizable(False,False)

        self.currentFrame = main_menu_frame(self)
        self.currentFrame.pack()
        self.main.mainloop()