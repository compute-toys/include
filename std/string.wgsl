struct String {
    len: uint,
    chars: array<uint, STRING_MAX_LEN>,
}

fn strrev(s: String) -> String {
    var r = s;
    for (var i = 0u; i < s.len; i += 1) {
        r.chars[s.len - 1 - i] = s.chars[i];
    }
    return r;
}

fn itoa(i: int) -> String {
    var n = uint(abs(i));
    var digits = String();
    for (var i = 0; i < STRING_MAX_LEN; i += 1) {
        digits.chars[i] = 0x30 + (n % 10);
        digits.len += 1;
        n /= 10;
        if (n == 0) {
            break;
        }
    }
    if (i < 0) {
        digits.chars[digits.len] = 0x2d;
        digits.len += 1;
    }
    return strrev(digits);
}
