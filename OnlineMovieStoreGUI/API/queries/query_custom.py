import cx_Oracle

class query_custom:

    def __init__(self):
        dsn = cx_Oracle.makedsn('oracle.scs.ryerson.ca', '1521', 'orcl')
        #Password hidden since the repository is public
        self.conn = cx_Oracle.connect(user=r'jsma', password='********', dsn=dsn)

    def run(self, command):
        c = self.conn.cursor()
        try:
            type = command.upper().split(' ')[0]
            c.execute(command)

            self.conn.commit()

            if type == 'SELECT':
                columns = [col[0] for col in c.description]
                rows = [[cell for cell in row] for row in c]
            
            self.conn.close()
        except Exception as e:
            error_obj, = e.args
            self.conn.rollback()
            self.conn.close()
            return ("Error: " + error_obj.message)
        if type == 'SELECT':
            return (columns, rows)
        return "Successfully executed " + str(type) + " statement"