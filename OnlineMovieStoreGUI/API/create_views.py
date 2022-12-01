import cx_Oracle

class create_views:

    def __init__(self):
        dsn = cx_Oracle.makedsn('oracle.scs.ryerson.ca', '1521', 'orcl')
        #Password hidden since the repository is public
        self.conn = cx_Oracle.connect(user=r'jsma', password='********', dsn=dsn)

    def run(self):
        c = self.conn.cursor()
        try:
            commands = """CREATE VIEW movie_tier_bronze AS
(SELECT title, release_date, review_score, price
FROM movie
WHERE subscription_tier = 'Bronze')
WITH READ ONLY;

CREATE VIEW movie_tier_silver AS
(SELECT title, release_date, review_score, price
FROM movie
WHERE subscription_tier = 'Bronze'
OR subscription_tier = 'Silver')
WITH READ ONLY;

CREATE VIEW movie_tier_gold AS
(SELECT title, release_date, review_score, price
FROM movie
WHERE subscription_tier = 'Bronze'
OR subscription_tier = 'Silver'
OR subscription_tier = 'Gold')
WITH READ ONLY;"""
            for command in commands.replace('\n',' ').replace('    ','').split(';'):
                if command != '':
                    c.execute(command)

            self.conn.commit()
            self.conn.close()
            #columns = [col[0] for col in c.description]
            #rows = [[cell for cell in row] for row in c]
        except Exception as e:
            error_obj, = e.args
            self.conn.rollback()
            self.conn.close()
            return ("Error: " + error_obj.message)
        return "Successfully created 3 views"