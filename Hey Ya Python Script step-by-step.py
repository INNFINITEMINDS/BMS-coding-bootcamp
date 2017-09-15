#prints the bridge of "Hey Ya"
###run in command line: heyya()
def heyya():
    print("shake it, shake shake it")
    return

#prints the bridge of "Hey Ya"
def heyya():
    for i in range(0,4):
         print("shake it, shake shake it")
    return
	
#prints the bridge of "Hey Ya"
def heyya():
    for i in range(0,4):
        if i%4==3:						#every fourth line
            print("shake it like a polaroid picture")
        else:							#all other lines
            print("shake it, shake shake it")
    return
	
#prints the bridge of "Hey Ya"
#input: shakeitlike, a string to shakeitlike
###run in command line: heyya("a salt shaker")
def heyya(shakeitlike):
    for i in range(0,4):
        if i%4==3:				  	  #every fourth line
            print("shake it like " + shakeitlike)
        else:						  #all other lines
            print("shake it, shake shake it")
    return

#prints the bridge of "Hey Ya"
#input: array shakeitlike, a lits of string to shakeitlike
###run in command line: heyya(["a salt shaker","the vortex is broken", "a bottle of soda"])
def heyya(shakeitlike):
    length = len(shakeitlike)
    for i in range(0,4*length):
        if i%4==3:					  #every fourth line
            print("shake it like " + shakeitlike[(i+1)//4-1])
        else:						  #all other lines
            print("shake it, shake shake it")
    return "written by the BMS Bootcamp 2016 Class"