# My take on the famous brackets problem

def isValid(s: str) -> bool:
    """
    :type s: str - String to be tested for validity
    :rtype: bool - Returns true if the string is valid else false
    """
    result = None


    open_brackets = []

    # {()[][()]()} valid

    # {()[][()]}()} invalid
    # {()[][()][()} invalid
    counter = 0
    for bracket in s:
        print(bracket)
        if bracket == "(":
            open_brackets.append(0)
        elif bracket == "[":
            open_brackets.append(1)
        elif bracket == "{":
            open_brackets.append(2)

        if bracket == ")":
            if len(open_brackets) > 0:
                if open_brackets[-1] == 0:
                    del open_brackets[-1]
            else:
                result = False
                return result
        elif bracket == "]":
            if len(open_brackets) > 0:
                if open_brackets[-1] == 1:
                    del open_brackets[-1]
            else:
                result = False
                return result
        elif bracket == "}":
            if len(open_brackets) > 0:
                if open_brackets[-1] == 2:
                    del open_brackets[-1]
            else:
                result = False
                return result
        print(open_brackets)

    if len(open_brackets) == 0:
        result = True

    return result


if __name__ == "__main__":
    line = input()
    if isValid(line):
        print("valid")
    else:
        print("invalid")
