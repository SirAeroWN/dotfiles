#!/usr/bin/env python3

import sys
from icecream import ic


def default_vfunc(v):
    return v


def default_cmp(v1, v2, vfunc=default_vfunc):
    if vfunc(v1) < vfunc(v2):
        return -1
    elif vfunc(v1) == vfunc(v2):
        return 0
    elif vfunc(v1) > vfunc(v2):
        return 1


def binary_search(lst, obj, cmp_func=default_cmp, vfunc=default_vfunc):
    li = -1
    hi = len(lst)
    mi = (hi + li) // 2
    while (hi > li):
        mi = (hi + li) // 2
        c = cmp_func(obj, lst[mi], vfunc)
        if c == 0:
            return mi
        elif c == -1:
            hi = mi - 1
        elif c == 1:
            li = mi + 1
        else:
            return -1
    # if here, then never found a match
    return -1

def basic_search(lst, obj, cmp_func=default_cmp, vfunc=default_vfunc):
    if len(lst) == 0:
        return -1
    if cmp_func(lst[-1], obj, vfunc) <= 0:
        return -1
    i = len(lst) - 1
    while (i - 1 >= 0 and cmp_func(lst[i-1], obj, vfunc) == 1):
        i -= 1
    return i


def min_binary_search(lst, obj, cmp_func=default_cmp, vfunc=default_vfunc):
    return basic_search(lst, obj, cmp_func, vfunc)


def spec_cmp(v1, v2, vfunc):
    if vfunc(v1) <= vfunc(v2):
        return 0
    elif vfunc(v1) > vfunc(v2):
        return 1


def access_link(v):
    return v.v

def patience_sort(lst, vfunc):
    stacks = []

    class Link:
        def __init__(self, v, n=None, p=None):
            self.v = v
            self.next = n
            self.prev = p

    links = []

    for l in lst:
        ind = min_binary_search(stacks, Link(l), spec_cmp, vfunc)
        if ind == -1 and len(stacks) == 0:
            stacks.append(Link(l))
        elif ind == -1:
            links.append(Link(l, n=None, p=stacks[-1]))
            stacks.append(links[-1])
        elif ind == 0:
            stacks[0] = Link(l)
        else:
            links.append(Link(l, n=None, p=stacks[ind-1]))
            stacks[ind] = links[-1]

    # now get longest sub
    chain = []
    curr = links[-1]
    chain.append(curr.v)
    while(curr.prev):
        curr = curr.prev
        chain.append(curr.v)

    return list(reversed(chain))

