import cx_Oracle

class drop_tables:

    def __init__(self):
        dsn = cx_Oracle.makedsn('oracle.scs.ryerson.ca', '1521', 'orcl')
        #Password hidden since the repository is public
        self.conn = cx_Oracle.connect(user=r'jsma', password='********', dsn=dsn)

    def run(self):
        c = self.conn.cursor()
        try:
            commands = """
DROP TABLE ASSIGN_AGE_RATING cascade constraints purge;
DROP TABLE CREATES_CUSTOMER cascade constraints purge;
DROP TABLE DIRECTORY cascade constraints purge;
DROP TABLE MOVIE_HAS_GENRE cascade constraints purge;
DROP TABLE PURCHASE_MOVIE cascade constraints purge;
DROP TABLE REVIEW cascade constraints purge;
DROP TABLE SUBSCRIPTION_RATE cascade constraints purge;
DROP TABLE UPDATE_CATALOGUE cascade constraints purge;
DROP TABLE USER_ACCOUNT cascade constraints purge;
DROP TABLE ADMIN_ACCOUNT cascade constraints purge;
DROP TABLE AGE_RATING cascade constraints purge;
DROP TABLE CUSTOMER cascade constraints purge;
DROP TABLE GENRE cascade constraints purge;
DROP TABLE MOVIE cascade constraints purge;
"""
            for command in commands.replace('\n','').replace('    ','').split(';'):
                if command != '':
                    c.execute(command)

            self.conn.commit()
            self.conn.close()
        except Exception as e:
            error_obj, = e.args
            self.conn.rollback()
            self.conn.close()
            return ("Error " + error_obj.message)
        return "Successfully dropped all 14 tables"