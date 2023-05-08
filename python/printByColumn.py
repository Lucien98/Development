def print_by_col(string, n_row):
    s = ""
    l = len(string)
    n_column = int(l / n_row) + 1
    for i in range(n_row):
        remain = l % n_row
        if i < remain:
            for j in range(n_column):
                index = i + j*n_row
                s += string[ i + j*n_row]
            s += "\n"
        else:
            for j in range(n_column-1):
                index = i + j*n_row
                s += string[index]
            s += "\n"

    print(s)

if __name__ == "__main__":
    print_by_col("", 4)
