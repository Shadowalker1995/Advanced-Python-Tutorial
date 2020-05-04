import time


def sing():
    """唱歌 5秒钟"""
    for i in range(5):
        print("----正在唱:菊花茶----")
        time.sleep(1)


def dance():
    """跳舞 5秒钟"""
    for i in range(5):
        print("----正在跳舞----")
        time.sleep(1)


def main():
    sing()
    dance()


if __name__ == "__main__":
    main()

