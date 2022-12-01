from tkinter import *
from tkinter import messagebox
from tkinter.ttk import Separator

from API.queries.query_one import query_one
from API.queries.query_two import query_two
from API.queries.query_three import query_three
from API.queries.query_four import query_four
from API.queries.query_five import query_five
from API.queries.query_custom import query_custom


class query_menu_frame(Frame):

    def make_table(self, data, container):
        for widget in container.winfo_children():
            widget.destroy()

        for i in range(len(data[0])):
            e = Entry(container,bg='lightgrey',font=('Arial',16,'bold'))
            e.grid(row=0, column=i)
            e.insert(END, data[0][i])
            e.config(state='disabled', disabledbackground='lightgrey', disabledforeground='black')

        for i in range(len(data[1])):
            for j in range(len(data[1][0])):
                e = Entry(container, width=20, font=('Arial',16))
                e.grid(row=(i+1), column=j)
                e.insert(END, data[1][i][j])
                e.config(state='disabled', disabledbackground='white', disabledforeground='black')
        
        container.pack(anchor='n',side=TOP, pady=50)

    def query_one(self, parent):
        ret = query_one().run()
        if isinstance(ret, str):
            messagebox.showerror("Non-Ontarian Customers", ret)
            return
        self.make_table(ret, parent)
    
    def query_two(self, parent):
        ret = query_two().run()
        if isinstance(ret, str):
            messagebox.showerror("Best/Worst Reviews", ret)
            return
        self.make_table(ret, parent)

    def query_three(self, parent):
        ret = query_three().run()
        if isinstance(ret, str):
            messagebox.showerror("Movie Sales", ret)
            return
        self.make_table(ret, parent)

    def query_four(self, parent):
        ret = query_four().run()
        if isinstance(ret, str):
            messagebox.showerror("Above-average-selling Movies", ret)
            return
        self.make_table(ret, parent)

    def query_five(self, parent):
        ret = query_five().run()
        if isinstance(ret, str):
            messagebox.showerror("Customers with Reviews", ret)
            return
        self.make_table(ret, parent)

    def query_custom(self, parent, query):
        ret = query_custom().run(query)
        if isinstance(ret, str):
            if ret.startswith('Error'):
                messagebox.showerror("Custom Query", ret)
            else:
                messagebox.showinfo("Custom Query", ret)
            return
        self.make_table(ret, parent)

    def __init__(self, parent):
        Frame.__init__(self, parent.main, name="query_menu")
        self.config(width=1280, height=720)
        self.parent = parent
        self.pack_propagate(False)

        logout = Button(self, text="Main Menu", command=lambda: parent.switchFrame("main_menu"))
        logout.pack(anchor='ne',side=TOP)

        heading = Label(self, text="Query Menu", font=("Arial Bold", 25), pady=10)
        heading.pack(anchor='n',side=TOP)

        tableContainer = Frame(self)

        nav = Frame(self)

        q1 = Button(nav, text="Non-Ontarian Customers", command=lambda: self.query_one(tableContainer))
        q1.grid(column=0,row=0)

        q2 = Button(nav, text="Best/Worst Reviews", command=lambda: self.query_two(tableContainer))
        q2.grid(column=1,row=0)

        q3 = Button(nav, text="Movie Sales", command=lambda: self.query_three(tableContainer))
        q3.grid(column=2,row=0)

        q4 = Button(nav, text="Above-average-selling Movies", command=lambda: self.query_four(tableContainer))
        q4.grid(column=3,row=0)

        q5 = Button(nav, text="Customers with Reviews", command=lambda: self.query_five(tableContainer))
        q5.grid(column=4,row=0)

        nav.pack(anchor='n',side=TOP)

        customContainer = Frame(self)

        ce = Entry(customContainer,font=('Arial',10))
        ce.pack(side=LEFT, fill=X, expand=1)

        qc = Button(customContainer, text="Run Custom Query", command=lambda: self.query_custom(tableContainer, ce.get()))
        qc.pack(side=RIGHT)

        customContainer.pack(anchor='n',side=TOP)