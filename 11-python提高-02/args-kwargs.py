def test2(a, b, *args, **kwargs):
    print("------")
    print(a)
    print(b)
    print(args)
    print(kwargs)


def test1(a, b, *args, **kwargs):
    print(a)
    print(b)
    print(args)
    print(kwargs)

    # test2(a, b, args, kwargs)  # 相当于test2(11, 22, (33, 44, 55, 66), {"name":"laowang", "age":18})
    # test2(a, b, *args, kwargs)  # 相当于test2(11, 22, 33, 44, 55, 66, {"name":"laowang", "age":18})
    test2(a, b, *args, **kwargs)  # 相当于test2(11, 22, 33, 44, 55, 66, name="laowang", age=18)


test1(11, 22, 33, 44, 55, 66, name="laowang", age=18)
