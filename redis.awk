
# error(CODE, MSG, STREAM = "/dev/stderr")
function error(code, msg, stream) {
    if (length(stream) == 0)
        stream = "/dev/stderr"

    printf "%s: %s\n", ARGV[0], msg > stream
    if (code)
        exit code
}


function debug(msg, stream) {
    if (REDIS["debug"]) {
        if (length(stream) == 0)
            stream = "/dev/stderr"

        printf "%s: %s\n", ARGV[0], msg > stream
    }
}

function args2array(array, num, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, 
                    i_) {
    delete array

    if (num == 0 || num == "0")
        return 0;

    if (num > 0) {
        for (i_ = 0; i_ < num; ) {
            array[i_++] = a;  if (i_ >= num) break
            array[i_++] = b;  if (i_ >= num) break
            array[i_++] = c;  if (i_ >= num) break
            array[i_++] = d;  if (i_ >= num) break
            array[i_++] = e;  if (i_ >= num) break
            array[i_++] = f;  if (i_ >= num) break
            array[i_++] = g;  if (i_ >= num) break
            array[i_++] = h;  if (i_ >= num) break
            array[i_++] = i;  if (i_ >= num) break
            array[i_++] = j;  if (i_ >= num) break
            array[i_++] = k;  if (i_ >= num) break
            array[i_++] = l;  if (i_ >= num) break
            array[i_++] = m;  if (i_ >= num) break
            array[i_++] = n;  if (i_ >= num) break
            array[i_++] = o;  if (i_ >= num) break
            array[i_++] = p;  if (i_ >= num) break
        }
    }
    else {
        i_ = 0
        while (1) {
            if (length(a) <= 0) break; array[i_++] = a;
            if (length(b) <= 0) break; array[i_++] = b;
            if (length(c) <= 0) break; array[i_++] = c;
            if (length(d) <= 0) break; array[i_++] = d;
            if (length(e) <= 0) break; array[i_++] = e;
            if (length(f) <= 0) break; array[i_++] = f;
            if (length(g) <= 0) break; array[i_++] = g;
            if (length(h) <= 0) break; array[i_++] = h;
            if (length(i) <= 0) break; array[i_++] = i;
            if (length(j) <= 0) break; array[i_++] = j;
            if (length(k) <= 0) break; array[i_++] = k;
            if (length(l) <= 0) break; array[i_++] = l;
            if (length(m) <= 0) break; array[i_++] = m;
            if (length(n) <= 0) break; array[i_++] = n;
            if (length(o) <= 0) break; array[i_++] = o;
            if (length(p) <= 0) break; array[i_++] = p;
            break
        }
    }
    return i_
}

function array2str(array, sep,     s_, i_) {
    s_ = ""
    for (i_ = 0; i_ < length(array); i_++) {
        s_ = (s_ sep array[i_])
    }
    return substr(s_, 1 + length(sep))
}


function args2cmdv(array, idx, num,
                   a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, 
                   i_) {
    if (idx == 0)
        delete array

    if (num == 0 || num == "0")
        return 0;

    if (num > 0) {
        i_ = idx
        array[i_++] = ("*" num)
        num = 1 + num * 2 + idx
        for (; i_ < num; ) {
            array[i_++] = ("$" length(a))
            array[i_++] = a;  if (i_ >= num) break
            array[i_++] = ("$" length(b))
            array[i_++] = b;  if (i_ >= num) break
            array[i_++] = ("$" length(c))
            array[i_++] = c;  if (i_ >= num) break
            array[i_++] = ("$" length(d))
            array[i_++] = d;  if (i_ >= num) break
            array[i_++] = ("$" length(e))
            array[i_++] = e;  if (i_ >= num) break
            array[i_++] = ("$" length(f))
            array[i_++] = f;  if (i_ >= num) break
            array[i_++] = ("$" length(g))
            array[i_++] = g;  if (i_ >= num) break
            array[i_++] = ("$" length(h))
            array[i_++] = h;  if (i_ >= num) break
            array[i_++] = ("$" length(i))
            array[i_++] = i;  if (i_ >= num) break
            array[i_++] = ("$" length(j))
            array[i_++] = j;  if (i_ >= num) break
            array[i_++] = ("$" length(k))
            array[i_++] = k;  if (i_ >= num) break
            array[i_++] = ("$" length(l))
            array[i_++] = l;  if (i_ >= num) break
            array[i_++] = ("$" length(m))
            array[i_++] = m;  if (i_ >= num) break
            array[i_++] = ("$" length(n))
            array[i_++] = n;  if (i_ >= num) break
            array[i_++] = ("$" length(o))
            array[i_++] = o;  if (i_ >= num) break
            array[i_++] = ("$" length(p))
            array[i_++] = p;  if (i_ >= num) break
        }
    }
    else {
        i_ = idx
        array[i_++] = "*"       # bogus

        while (1) {
            if (length(a) <= 0) break; 
            array[i_++] = ("$" length(a));  array[i_++] = a;
            if (length(b) <= 0) break;
            array[i_++] = ("$" length(b));  array[i_++] = b;
            if (length(c) <= 0) break;
            array[i_++] = ("$" length(c));  array[i_++] = c;
            if (length(d) <= 0) break;
            array[i_++] = ("$" length(d));  array[i_++] = d;
            if (length(e) <= 0) break;
            array[i_++] = ("$" length(e));  array[i_++] = e;
            if (length(f) <= 0) break;
            array[i_++] = ("$" length(f));  array[i_++] = f;
            if (length(g) <= 0) break;
            array[i_++] = ("$" length(g));  array[i_++] = g;
            if (length(h) <= 0) break;
            array[i_++] = ("$" length(h));  array[i_++] = h;
            if (length(i) <= 0) break;
            array[i_++] = ("$" length(i));  array[i_++] = i;
            if (length(j) <= 0) break;
            array[i_++] = ("$" length(j));  array[i_++] = j;
            if (length(k) <= 0) break;
            array[i_++] = ("$" length(k));  array[i_++] = k;
            if (length(l) <= 0) break;
            array[i_++] = ("$" length(l));  array[i_++] = l;
            if (length(m) <= 0) break;
            array[i_++] = ("$" length(m));  array[i_++] = m;
            if (length(n) <= 0) break;
            array[i_++] = ("$" length(n));  array[i_++] = n;
            if (length(o) <= 0) break;
            array[i_++] = ("$" length(o));  array[i_++] = o;
            if (length(p) <= 0) break;
            array[i_++] = ("$" length(p));  array[i_++] = p;
            break
        }
        array[idx] = ("*" (i - 1)/2)
    }
    return i_
}

# redis_open(HOST = "localhost", PORT = 6379)
#
# Return the connection string of the Redis server; Consider this as
# opening connection to the Redis server.  You may close the
# connection with redis_close().
#
# HOST and PORT will be used for the endpoint to the Redis server.
# "localhost" and 6379 will be used as the default values, if either of
# HOST and PORT is not provided.
#
# Note that the environment variable, REDIS_ENDPOINT will override
# HOST and PORT.  It should have the value in the form of "HOST:PORT".
#
function redis_open(host, port) {
    if ("REDIS_ENDPOINT" in ENVIRON) {
        if (match(ENVIRON["REDIS_ENDPOINT"], /^([^:]+)(:([0-9]+))?$/, m))
            sock = sprintf("/inet/tcp/0/%s/%s", m[1], m[3] ? m[3] : "6379")
    }

    if (length(sock) == 0) {
        if (length(host) == 0)
            host = "localhost"
        if (length(port) == 0)
            port = 6379
        sock = sprintf("/inet/tcp/0/%s/%d", host, port)
    }
    return sock
}

# redis_close(CONN)
#
# Close the connection to the redis server.
#
function redis_close(conn) {
    close(conn)
}

# redis_dump(RESP, STREAM = "/dev/stderr", LEV = 0)
#
# Dump RESP to STREAM (for debugging purpose)
#
# If STREAM is not provided, "/dev/stderr" will be used by default
# LEV is the indentation level, and the default value will be 0.
#
function redis_dump(resp, stream, lev,    rsp_, i_) {
    if (length(lev) == 0)
        lev = 0
    if (length(stream) == 0)
        stream = "/dev/stderr"

    #print "resp: ", resp
    switch (resp[1]) {
    case "e":
        printf "%*s[ERR] |%s|\n", lev * 2, "", resp[0] > stream
        break
    case "s":
        printf "%*s[STR] |%s|\n", lev * 2, "", resp[0] > stream
        break
    case "i":
        printf "%*s[STR] |%d|\n", lev * 2, "", resp[0] > stream
        break
    case "a":
        printf "%*s[ARR]\n", lev * 2, "" > stream
        for (i_ = 0; i_ < length(resp[0]) / 2; i_++) {
            rsp_[0] = resp[0][i_ * 2]
            rsp_[1] = resp[0][i_ * 2 + 1]
            redis_dump(rsp_, stream, lev + 1)
        }
        break
    default:
        return 0
    }
    return 1
}

# redis__get_resp(CONN, [out] RESP)
#
# Get the response from the stream, CONN.
#
# RESP will be set by this function to the response form the Redis
# server.  RESP should be either an uninitialized variable name or the
# name of the array name, which will be erased by this function.
#
# resp[0] contains the response from the redis server, and
# resp[1] has the type of resp[0], in one of these strings:
#  - "s": string type
#  - "e": error type
#  - "i": integer type
#  - "a": array type
#
function redis__get_resp(c, resp,   resp_, oldRS_, ln_, ret_,
                                    first_, i_, size_, read_) {
    oldRS_ = RS
    RS = "\r\n"

    ret_ = (c |& getline ln_)
    if (ret_ <= 0) {           # EOF(0) or an error(-1) 
        debug(sprintf("redis__get_resp: getline returns %d, ERRNO=%s",
                      ret_, ERRNO))
        return 0
    }
    first_ = substr(ln_, 1, 1)

    delete resp
    switch (first_ = substr(ln_, 1, 1)) {
    case "+":                   # simple string
        resp[0] = substr(ln_, 2)
        resp[1] = "s"
        break
    case "-":                   # error
        resp[0] = substr(ln_, 2)
        resp[1] = "e"
        RS = oldRS_
        return 0
    case ":":                   # number
        resp[0] = strtonum(substr(ln_, 2))
        resp[1] = "i"
        break
    case "*":
        size_ = strtonum(substr(ln_, 2))
        if (size_ < 0) {        # Null array
            resp[0] = ""
            resp[1] = "n"
            break
        }
        else
            resp[1] = "a"
        for (i_ = 0; i_ < size_; i_++) {
            redis__get_resp(c, resp_)
            resp[0][i_ * 2] = resp_[0]
            resp[0][i_ * 2 + 1] = resp_[1]
        }
        break
    case "$":                   # bulk string
        size_ = strtonum(substr(ln_, 2))
        read_ = 0

        resp[0] = ""
        if (size_ < 0) {        # Null string
            resp[1] = "n"
            break
        }
        else
            resp[1] = "s"

        while ((ret_ = (c |& getline ln_)) > 0) {
            resp[0] = (resp[0] ln_)
            read_ += length(ln_)

            if (read_ >= size_) {
                RS = oldRS_
                return 1
            }
            resp[0] = (resp[0] RS)
            read_ += length(RS)
        }
        debug(sprintf("redis__get_resp: getline returns %d, ERRNO=%s",
                      ret_, ERRNO))
        return 0;
        
    default:
        error(1, sprintf("unrecognized RESP, %0o", first_))
    }
    RS = oldRS_
    return 1
}


# redis_command(CONN, [out] RESP, NARGS, ARG...)
# 
# Execute redis command in ARG... and set RESP to the response from the
# Redis server.  NARGS must be set to the number of ARG...
#
# RESP should be either a name of uninitialized variable or a name of
# an array variable, which will be erased by this function.  Using
# existing scala variable will raise an error.
#
# When this function is finished, RESP[0] will be set to the value of
# the returned value, and RESP[1] will be set to the type of the
# RESP[0], as one of "i", "s", "a", or "e".  These means an integer, a
# string, an array, and an error respectively.
#
# NARGS is an unfortunate remnant, because I couldn't find the better
# design to implement a function with variable-length parameters.
#
function redis_command(conn, resp, num, 
                       a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, 
                       v_, c_, oldRS_, i_) {
    oldRS_ = ORS
    ORS = "\r\n"
    c_ = args2cmdv(v_, 0, num, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)

    if (_REDIS_DEBUG) {
        for (i_ = 0; i_ < c_; i_++) {
            debug(sprintf("REQ[%d] = |%s|", i_, v_[i_]))
        }
    }

    print array2str(v_, "\r\n") |& conn
    i_ = redis__get_resp(conn, resp)

    ORS = oldRS_

    return i_
}

# redis_pipe(CONN, NREQ, NARG, ARG...)
# 
# Send the redis request in ARG..., and not waiting for the response.
# NARG should be set to the number of ARG.   NREQ is the number of
# response that should be received.   Normally when you call redis_pipe()
# first time, NREQ is zero.
#
# This function will return the updated NREQ, that is, the number of
# response that should be received.  To receive the response, you need
# to call redis_resp() one or multiple times.
#
function redis_pipe(conn, nreq, num, 
                    a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, 
                    v_, c_, oldRS_, i_) {
    oldRS_ = ORS
    ORS = "\r\n"
    c_ = args2cmdv(v_, 0, num, a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)

    if (_REDIS_DEBUG) {
        for (i_ = 0; i_ < c_; i_++) {
            debug(sprintf("REQ[%d] = |%s|", i_, v_[i_]))
        }
    }

    print array2str(v_, "\r\n") |& conn

    ORS = oldRS_

    return nreq + 1
}

# redis_resp(CONN, RESP)
#
# Get the response from the CONNection.
#
# Be sure to call redis_resp() the same times that you called
# redis_pipe() or redis_append().  The returned value from last
# redis_pipe() will be helpful to decide how many times that you need
# to redis_resp().  For example:
#
#     nreq = redis_pipe(conn, nreq, ...)
#     for (i = 0; i < nreq; i++)
#         redis_resp(conn, resp)
#
function redis_resp(conn, resp) {
    return redis__get_resp(conn, resp)
}

# redis_flush(CONN, [in/out] REQS)
#
# Flush the remaining Redis commands that have not sent to the redis
# server.  You'll need to call this function after the last
# redis_append() call.  See redis_append() for the usage.
#
function redis_flush(conn, reqs,      i_, t_) {
    if (reqs["size"] > 0) {
        for (i_ = 0; i_ < reqs["size"]; i_++) {
            # TODO: is it necessary to check the return value of "|& conn"?
            printf "%s\r\n", reqs[i_] |& conn
        }
        t_ = reqs["nreq"]
        delete reqs
        reqs["nreq"] = t_
        reqs["size"] = 0
    }
    return reqs["nreq"]
}

# redis_append(CONN, [in/out] REQS, NARG, ARG...)
#
# Create and optionally send one or more pipelined Redis command(s).
# Unlike redis_command(), this function will not wait for the response
# from the server, but just send the request specified by ARG... and
# NARG.  You'll need to retrieve the response with redis_resp() or
# redis_ignore_resp().
#
# You'll pass an empty array to REQS unless you have the array value
# from the previous redis_append().  See redis_command() for the meaning
# of other parameters, such as CONN, NARG, and ARG...
# 
# Typical usage of this function looks like this:
#
#     redis_append(conn, reqs, 2, "GET", "name")
#     redis_append(conn, reqs, 2, "INCR", "count")
#     ...
#     redis_flush(conn, reqs)
#
#     for (i = 0; i < reqs["nreq"]; i++) {
#       redis_resp(conn, resp)    # Get response Nth command
#       # process 'resp' if needed
#     }
#
# Currently, redis_append() will convert the received Redis command to
# the RESP lines of the Redis protocol, then it will store the
# converted RESP into REQS argument.  Basically, the number of RESP
# lines matches NARG+1.  If RESP lines exceeded REDIS["pipesize"],
# redis_append() will flush REQS, sending the RESP lines to the
# socket.
#
function redis_append(conn, reqs, num, 
                      a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, 
                      v_, c_, i_, t_) {
    if (!("size" in reqs)) {
        reqs["size"] = 0
        reqs["nreq"] = 0
    }
    c_ = args2cmdv(reqs, reqs["size"], num,
                   a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p)
    if (_REDIS_DEBUG) {
        for (i_ = reqs["size"]; i_ < c_; i_++) {
            debug(sprintf("REQ[%d] = |%s|", i_, reqs[i_]))
        }
    }
    reqs["size"] = c_
    reqs["nreq"]++
    
    if (reqs["size"] >= REDIS["pipesize"]) {
        for (i_ = 0; i_ < reqs["size"]; i_++) {
            # TODO: is it necessary to check the return value of "|& conn"?
            printf "%s\r\n", reqs[i_] |& conn
        }
        t_ = reqs["nreq"]
        delete reqs
        reqs["nreq"] = t_
        reqs["size"] = 0
    }
    return reqs["nreq"]
}

# redis_ignore_resp(CONN, REQS)
#
# If you don't care about the response from the pipelined commands of
# redis_append(), you may call this function to receive responses and
# to ignore them.
#
function redis_ignore_resp(conn, reqs,     i_, resp_, n_) {
    n_ = reqs["nreq"]
    for (i_ = 0; i_ < n_; i_++) {
        if (!redis_resp(ctx, resp_))
            return 0
    }
    delete resp
    return 1
}


BEGIN {
    if ("REDIS_DEBUG" in ENVIRON)
        REDIS["debug"] = 1
    else
        REDIS["debug"] = 0

    REDIS["pipesize"] = 64
    if ("REDIS_PIPESIZE" in ENVIRON)
        REDIS["pipesize"] = strtonum(ENVIRON["REDIS_PIPESIZE"])
}
