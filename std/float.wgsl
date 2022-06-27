// https://git.musl-libc.org/cgit/musl/tree/include/float.h

#define FLT_RADIX 2

#define FLT_TRUE_MIN 1.40129846432481707092e-45
#define FLT_MIN 1.17549435082228750797e-38
#define FLT_MAX 3.40282346638528859812e+38
#define FLT_EPSILON 1.1920928955078125e-07

#define FLT_MANT_DIG 24
#define FLT_MIN_EXP (-125)
#define FLT_MAX_EXP 128
#define FLT_HAS_SUBNORM 1

#define FLT_DIG 6
#define FLT_DECIMAL_DIG 9
#define FLT_MIN_10_EXP (-37)
#define FLT_MAX_10_EXP 38

// https://git.musl-libc.org/cgit/musl/tree/include/math.h

fn isinf(x: f32) -> bool {
    return (bitcast<uint>(x) & 0x7fffffff) == 0x7f800000;
}

fn isnan(x: f32) -> bool {
    return (bitcast<uint>(x) & 0x7fffffff) > 0x7f800000;
}

fn isnormal(x: f32) -> bool {
    return ((bitcast<uint>(x) + 0x00800000) & 0x7fffffff) >= 0x01000000;
}

fn isfinite(x: f32) -> bool {
    return (bitcast<uint>(x) & 0x7fffffff) < 0x7f800000;
}
