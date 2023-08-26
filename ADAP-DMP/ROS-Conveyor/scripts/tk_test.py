import Tkinter as tk
import tkFont
class Test():
    def __init__(self):
        self.main = tk.Tk()
        self.main.geometry('1500x500')
        button = tk.Button(self.main, 
                    text = '"Warning","Could not start service"', 
                    command=self.quit)
        #tkMessageBox.showwarning("Warning","Could not start service")
        button.pack()
        button['font'] = tkFont.Font(size=30)
        self.main.mainloop()

    def quit(self):
                self.main.destroy()

app = Test()