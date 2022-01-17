t = ("tn","ap","gj","mh",0,45,"tn") #duplicates allowed, no change allowed
print(type(t))
print(t)
print(len(t))
print(t[2])
t[2]="mp"   #cannot assign in tuple
del(t[2])  #cannot delete in tuple
