import sys
from flask import Flask, render_template
import pymysql

app = Flask(__name__)

try:  # connect to database
    mydb = pymysql.connect(host='localhost', user='bergencounty', password='bergencounty', db='bergencountydatabase', cursorclass=pymysql.cursors.DictCursor)
    print("* * * * * * * * * * * * * * * * * * * * * *")
    print("* Successfully connected to the database! *")
    print("* Remember to continue social distancing! *")
    print("* * * * * * * * * * * * * * * * * * * * * *")
except Exception as e:  # error if can't connect to database
    print("Error: could not connect to database")
    sys.exit(e)

@app.route("/")
# main page with number of cases
def cases():
    title = "COVID-19 cases* in Bergen County"
    print(title)
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM covid19")  # gets number of cases for each town from table
    result = cursor.fetchall()
    total = 0
    for row in result:
        town = row['town']
        cases = row['cases']
        total = total + cases  # adds cases together for bergen county total
        print("Municipality: ", town)
        print("Number of cases: ", cases)
    print("Total: ", total)
    date = "10 May 2020"  # date of latest data
    totalNJ = "138532"  # total cases in nj
    source = "Bergen County Official Website"  # data source link
    return render_template("cases.html", title=title, data=result, totalCases=total, date=date, totalNJ=totalNJ, source=source)

@app.route("/info")
# information page in english
def info():
    title = "Important COVID-19 Information"
    symptomInfo="May appear 2-14 days after exposure"
    # array of symptoms
    symptom = ["Cough", "Shortness of breath", "Difficulty breathing", "Persistent pain or pressure in chest", "Fever", "Sore throat", "Muscle pain", "Loss of taste and/or smell"]
    protectInfo="Help stop COVID-19"
    # array of protection measures/methods
    protect = ["Stay home as much as possible, especially if you are ill", "Practice social distancing - stay at least 6 feet apart from others",
             "Avoid large crowds and gatherings", "Wash your hands with soap and water frequently", "Use facial coverings, masks, etc to keep your face covered",
             "Cover your nose and mouth when sneezing and/or coughing"]
    spreadInfo="COVID-19 spreads easily and efficiently"
    # array of how COVID-19 is spread
    spread = ["Person-to-person contact", "Contaminated surfaces and/or objects"]
    source = "CDC"
    return render_template("info.html", title=title, symptomInfo=symptomInfo, data=symptom, protectInfo=protectInfo, data2=protect, spreadInfo=spreadInfo, data3=spread, source=source)

@app.route("/mandarin")
# information page in traditional chinese
def info_mandarin():
    title = "武漢病毒 - 重要信息"
    symptomInfo = "可能在接觸2-14天后出現"
    symptom = ["咳嗽", "氣短", "呼吸困難", "胸部疼痛或壓力", "發燒", "喉嚨痛", "肌肉疼痛", "喪失味覺或嗅覺"]
    protectInfo = "幫助停止COVID-19"
    protect = ["待在家裡，尤其是生病的時候",
               "避免近距离接触 - 至少理別人6尺距離",
               "避免大量人群和聚會", "勤洗手",
               "用布制面罩蒙住口鼻",
               "咳嗽及打喷嚏时掩住口鼻"]
    spreadInfo = "導致COVID-19的病毒非常容易且可持續地在人與人之間傳播"
    spread = ["人與人之間的傳播", "接觸污染表面或物體而傳播"]
    source = "CDC"
    return render_template("info-mandarin.html", title=title, symptomInfo=symptomInfo, data=symptom, protectInfo=protectInfo, data2=protect, spreadInfo=spreadInfo, data3=spread, source=source)

@app.route("/testing")
# testing centers and hospitals
def testing():
    title = "Testing Locations and Hospitals in Bergen County"
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM centers")  # gets testing centers and hospitals from table
    result = cursor.fetchall()
    return render_template("testing.html", title=title, data=result)

@app.route("/contact")
# contact information
def contact():
    title = "Who can you contact?"
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM contact")  # gets contact info from table
    result = cursor.fetchall()
    return render_template("contact.html", title=title, data=result)

@app.route("/otherplaces")
# page with number of cases in other states and countries
def other():
    title = "Cases* around the world (select countries listed)"
    cursor = mydb.cursor()
    cursor.execute("SELECT * FROM countriesinfo ORDER BY countriesinfo.cases DESC")  # gets number of cases from table and orders by descending number of cases
    result = cursor.fetchall()
    for row in result:
        country = row['country']
        cases = row['cases']
        print("Country: ", country)
        print("Number of cases: ", cases)
    worldwideTotal = "4,136,056"  # worldwide total
    date = "11 May 2020"  # date of latest data
    source = "CNN"  # data source link
    return render_template("otherplaces.html", title=title, data=result, worldwideTotal=worldwideTotal, date=date, source=source)

if __name__ == '__main__':
    app.run()