import cx_Oracle

from GUI.gui import GUI

if __name__ == "__main__":
    cx_Oracle.init_oracle_client(lib_dir=r"C:\Users\jma\Desktop\instantclient_21_7")
    gui = GUI()
    gui.createMainWindow()