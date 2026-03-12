import pymysql

conn = pymysql.connect(host='localhost', user='root', password='', database='ovadrugx')
cursor = conn.cursor()
cursor.execute("SELECT id, email, is_verified FROM users WHERE email='chaitanyaprakashkonisetty@gmail.com'")
users = cursor.fetchall()
print(users)

if users and users[0][2] == 0:
    print("User exists but is not verified. Deleting them so we can re-test.")
    cursor.execute("DELETE FROM users WHERE email='chaitanyaprakashkonisetty@gmail.com'")
    conn.commit()

conn.close()
