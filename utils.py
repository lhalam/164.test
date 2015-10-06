
def reduce_seq(seq):
    res = []
    for item in seq:
        if hasattr(item, '__iter__'):
            for x in item:
                res.append(x)
        else:
            res.append(item)
    return res


def make_dict(keys, vals):
    result = dict(zip(keys, vals))
    extra_keys = set(keys) - set(result.iterkeys())
    if extra_keys:
        for key in extra_keys:
            result[key] = None
    return result


