def main():
    inputFile = './input.txt'
    makeOutput(inputFile)


def makeOutput(inputFile):
    with open(inputFile) as fp:

        sum_of_mass = 0
        for line in fp:
            sum_of_mass += compute(line)
        print(str(sum_of_mass) + '\n')


def compute(line):
    return int(float(line.rstrip()) / 3 - 2)

if __name__ == '__main__':
    main()
