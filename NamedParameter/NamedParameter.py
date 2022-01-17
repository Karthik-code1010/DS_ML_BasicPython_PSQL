def fv(r=1,h=1): #if not passed, assume this value for the param.
    print("r=",r)
    print("h=",h)
    vol = 22/7*r*r*h
    print("f100", vol)
fv(10, 4)
fv(5,6)
fv(h=5, r=6) #name of param and value = name = value
fv(7)
def fr(r=1,h=1): #if not passed, assume this value for the param.
    print("r=",r)
    print("h=",h)
    val = 22/7*r*r*h
    return val
x=fr(5,6)
print(x)
#no return means procedure
# return means fuction
def p1():
    global a
    print("p1")
    a=10 #local scope
    print(a)
def p2():
    print("p2")
    a=20 #local scope
    print(a)
a=99 #global scope
print("outside =",a)
p1()
p2()
print("outside",a)
    
