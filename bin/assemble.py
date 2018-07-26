# this is supposed to take some ICBM assembly style text and assemble it into machine code

## opcode human readable
# 0 halt
# 1 io
# 	1000 - read hex
# 	1400 - read ascii
# 	1800 - write hex
# 	1c00 - write ascii
# 2 shift
# 	280x - rotate right x bits
# 	2C0x - rotate left x bits
# 	200x - shift right x bits
# 	240x - shift left x bits
# 3 - load
# 4 - store
# 5 - add
# 6 - sub
# 7 - and
# 8 - or
# 9 - xor
# A - not
# B - nop
# C - jmp
# D - jmpe
# E - jmpl
# F - brl

# need to develop new names for inputs and shifts
# inputs:
	# readh - read hex; 1000
	# reada - read ascii; 1400
	# writeh - write hex; 1800
	# writea - write ascii; 1c00
# shifts
	# rotl x - rotate left x bits; 2C0x
	# rotr x - rotate right x bits; 280x
	# shiftl x - shift left x bits; 240x
	# shiftr x - shift right x bits; 200x

# need a way to declare variables
# use `dw` for declare word:
	# dw <name> <hex> - declare variable with a 4 digit hex


import sys
import re

def toHexStr(i):
	return hex(i)[2:]

def pad(si, l):
	s = str(si)
	while (len(s) < l):
		s = "0" + s
	return s

def findIndex(key, l):
	try:
		for i in range(len(l)):
			if (l[i][0] == key):
				return pad(l[i][2], 3)
		raise KeyError("Variable was not found, make sure you aren't using variables before they are declared")
		return "0000"
	except KeyError as error:
		print('caught this error: ' + repr(error))

def findLabel(key, l):
	try:
		for i in range(len(l)):
			if (l[i][0] == key):
				return pad(l[i][1], 3)
		raise KeyError("Variable was not found, make sure you aren't using variables before they are declared")
		return "0000"
	except KeyError as error:
		print('caught this error: ' + repr(error))

# set up regexes
labelProfile = re.compile(r'\b[a-zA-Z]+[\:]')
dwProfile = re.compile(r'\bdw\b')					# match variabl;e decleration
vnameProfile = re.compile(r'\b[a-zA-Z]+\b')			# match variable names to follow dw
hexProfile = re.compile(r'\b[0-9a-fA-F]{1,4}\b')		# match 4 digit hex number
oneHexProfile = re.compile(r'\b[0-9a-fA-F]{1}\b')	# match just one hex digit
haltProfile = re.compile(r'\b(halt)\b')
loadProfile = re.compile(r'\b(load)\b')
storeProfile = re.compile(r'\b(store)\b')
andProfile = re.compile(r'\b(and)\b')
addProfile = re.compile(r'\b(add)\b')
subProfile = re.compile(r'\b(sub)\b')
orProfile = re.compile(r'\b(or)\b')
xorProfile = re.compile(r'\b(xor)\b')
notProfile = re.compile(r'\b(not)\b')
nopProfile = re.compile(r'\b(nop)\b')
jmpProfile = re.compile(r'\b(jmp)\b')
jmpeProfile = re.compile(r'\b(jmpe)\b')
jmplProfile = re.compile(r'\b(jmpl)\b')
brlProfile = re.compile(r'\b(brl)\b')
readhProfile = re.compile(r'\b(readh)\b')
readaProfile = re.compile(r'\b(reada)\b')
writehProfile = re.compile(r'\b(writeh)\b')
writeaProfile = re.compile(r'\b(writea)\b')
rotlProfile = re.compile(r'\b(rotl)\b')
rotrProfile = re.compile(r'\b(rotr)\b')
shiftlProfile = re.compile(r'\b(shiftl)\b')
shiftrProfile = re.compile(r'\b(shiftr)\b')

variables = []
commands = []
labels = []
comments = []

with open(sys.argv[1]) as iacmfile:
	for line in enumerate(iacmfile):
		comments.append(pad(toHexStr(line[0]), 3) +  "\t" + line[1])
		if (labelProfile.search(line[1]) != None):
			match = labelProfile.search(line[1])
			labels.append((line[1][match.start():match.end() - 1], toHexStr(line[0])))
	iacmfile.close()

with open(sys.argv[1]) as iacmfile:
	for line in enumerate(iacmfile):
		if (dwProfile.search(line[1]) != None):
			#try:
				match = dwProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				key = remain[match.start():match.end()]
				remain = remain[match.end():]
				match = hexProfile.search(remain)
				variables.append([key, pad(remain[match.start():match.end()], 4), toHexStr(line[0])])
			#except:
				#print("Problem reading a declare word statement on line", line[0])
	iacmfile.close()

# first get and open file
with open(sys.argv[1]) as iacmfile:
	for line in enumerate(iacmfile):	
		if(haltProfile.search(line[1])):
			try:
				commands.append("0000")
			except:
				print("Problem reading a halt on line", line[0])
		elif(loadProfile.search(line[1])):
			try:
				match = loadProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("3" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a load on line", line[0])
		elif(storeProfile.search(line[1])):
			try:
				match = storeProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("4" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a store on line", line[0])
		elif(andProfile.search(line[1])):
			try:
				match = andProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("7" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a and on line", line[0])
		elif(addProfile.search(line[1])):
			try:
				match = addProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("5" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a add on line", line[0])
		elif(subProfile.search(line[1])):
			try:
				match = subProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("6" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a sub on line", line[0])
		elif(orProfile.search(line[1])):
			try:
				match = orProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("8" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a or on line", line[0])
		elif(xorProfile.search(line[1])):
			try:
				match = xorProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("9" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a xor on line", line[0])
		elif(notProfile.search(line[1])):
			try:
				match = notProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("A" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a not on line", line[0])
		elif(nopProfile.search(line[1])):
			try:
				commands.append("B000")
			except:
				print("Problem reading a nop on line", line[0])
		elif(jmpProfile.search(line[1])):
			try:
				match = jmpProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				#print(remain[match.start():match.end()])
				commands.append(("C" + findLabel(remain[match.start():match.end()], labels)))
			except:
				print("Problem reading a jmp on line", line[0])
		elif(jmpeProfile.search(line[1])):
			try:
				match = jmpeProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("D" + findLabel(remain[match.start():match.end()], labels)))
			except:
				print("Problem reading a jmpe on line", line[0])
		elif(jmplProfile.search(line[1])):
			try:
				match = jmplProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("E" + findLabel(remain[match.start():match.end()], labels)))
			except:
				print("Problem reading a jmpl on line", line[0])
		elif(brlProfile.search(line[1])):
			try:
				match = brlProfile.search(line[1])
				remain = line[1][match.end():]
				match = vnameProfile.search(remain)
				commands.append(("F" + findIndex(remain[match.start():match.end()], variables)))
			except:
				print("Problem reading a brl on line", line[0])
		elif(readhProfile.search(line[1])):
			try:
				commands.append("1000")
			except:
				print("Problem reading a readh on line", line[0])
		elif(readaProfile.search(line[1])):
			try:
				commands.append("1400")
			except:
				print("Problem reading a reada on line", line[0])
		elif(writehProfile.search(line[1])):
			try:
				commands.append("1800")
			except:
				print("Problem reading a writeh on line", line[0])
		elif(writeaProfile.search(line[1])):
			try:
				commands.append("1C00")
			except:
				print("Problem reading a writea on line", line[0])
		elif(rotlProfile.search(line[1])):
			try:
				match = rotlProfile.search(line[1])
				remain = line[1][match.end():]
				match = oneHexProfile.search(remain)
				commands.append(("2C0" + remain[match.start():match.end()]))
			except:
				print("Problem reading a rotl on line", line[0])
		elif(rotrProfile.search(line[1])):
			try:
				match = rotrProfile.search(line[1])
				remain = line[1][match.end():]
				match = oneHexProfile.search(remain)
				commands.append(("280" + remain[match.start():match.end()]))
			except:
				print("Problem reading a rotr on line", line[0])
		elif(shiftlProfile.search(line[1])):
			try:
				match = shiftlProfile.search(line[1])
				remain = line[1][match.end():]
				match = oneHexProfile.search(remain)
				commands.append(("240" + remain[match.start():match.end()]))
			except:
				print("Problem reading a shiftl on line", line[0])
		elif(shiftrProfile.search(line[1])):
			try:
				match = shiftrProfile.search(line[1])
				remain = line[1][match.end():]
				match = oneHexProfile.search(remain)
				commands.append(("200" + remain[match.start():match.end()]))
			except:
				print("Problem reading a shiftr on line", line[0])

	#print(variables)
	#print(labels)
	#print(commands)
	iacmfile.close()	

# now that we have all the pieces in their respective orders, we can put them in one big list
colate = []
v = 0
l = 0
c = 0
tot = len(variables) + len(labels) + len(commands)

colate.append(commands[c])
c += 1

for i in range(1, tot):
	#print(toHexStr(i))
	#print((l < len(labels) and labels[l][1] == toHexStr(i)))
	if (v < len(variables) and variables[v][2] == toHexStr(i)):
		print(toHexStr(i), variables[v][1])
		colate.append(variables[v][1])
		v += 1
	elif (l < len(labels) and labels[l][1] == toHexStr(i)):
		#print(toHexStr(i), "B000")
		colate.append("B000")
		l += 1
	elif (c < len(commands)):
		#print(toHexStr(i), commands[c])
		colate.append(commands[c])
		c += 1

outfile = "out.ibcm"
try:
	if (sys.argv[2] != None or argv[2] != ""):
		outfile = sys.argv[2]
except IndexError:
	print("assembling to 'out.icbm'")

with open(outfile, "w") as out:
	for i in range(len(colate)):
		temp = colate[i] + " " + comments[i]
		out.write(temp)
	out.close()