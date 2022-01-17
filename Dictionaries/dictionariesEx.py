# dictionaries is key-value pair
d = {
    "TN":"Tamil Nadu",
    "AP":"Andhra Pradesh",
    "MP":"Madhya Pradesh",
    "Population_cr":133,
    "Covid_recov_rate":95.2,
    "covid_stats":{
        "inf":1.1,
        "rec":1,
        "dead":0.15
        },
    "Population_cr":135,
    }
print(d)
print(len(d))
print(d.keys())
print(d.values())

print(d["MP"])
print(d["Covid_recov_rate"])
print(d["covid_stats"]["inf"])

d["newkey"] = 100
print(d)
