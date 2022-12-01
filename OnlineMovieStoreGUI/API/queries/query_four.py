import cx_Oracle

class query_four:

    def __init__(self):
        dsn = cx_Oracle.makedsn('oracle.scs.ryerson.ca', '1521', 'orcl')
        #Password hidden since the repository is public
        self.conn = cx_Oracle.connect(user=r'jsma', password='********', dsn=dsn)

    def run(self):
        c = self.conn.cursor()
        try:
            commands = """SELECT M_ID, COUNT(C_ID) as Sales
FROM Purchase_movie
GROUP BY M_ID
HAVING COUNT(C_ID) > (
    SELECT AVG(Sales)
    FROM ( SELECT COUNT (C_ID) AS Sales
          FROM Purchase_movie
          GROUP BY M_ID ))
ORDER BY Sales DESC;"""
            for command in commands.replace('\n',' ').replace('    ','').split(';'):
                if command != '':
                    c.execute(command)

            self.conn.commit()
            columns = [col[0] for col in c.description]
            rows = [[cell for cell in row] for row in c]
            self.conn.close()
        except Exception as e:
            error_obj, = e.args
            self.conn.rollback()
            self.conn.close()
            return ("Error: " + error_obj.message)
        return (columns,rows)