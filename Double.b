
multiplyFloats(base, multiplier) {
    auto mant, exp, sign;

    sign = ((base < 0) ? -1 : 1) * ((multiplier < 0) ? -1 : 1);
    mant = (base & 1048575) * (multiplier & 1048575);
    exp = ((base >> 20) & 2047) + ((multiplier >> 20) & 2047);

    return (((exp << 20) + mant) * sign);
}

divideFloats(numerator, denominator) {
    auto mant, exp, sign, unoccupied;

    sign = ((numerator < 0) ? -1 : 1) * ((denominator < 0) ? -1 : 1);

    numerator = (numerator < 0) ? -numerator : numerator;
    denominator = (denominator < 0) ? -denominator : denominator;
    
    unoccupied = 0
    while (1) {
        if (((((numerator & 1048575) << unoccupied) >> unoccupied) != numerator)) {
            unoccupied--;
            goto break;
        }
        unoccupied++;
    }
    break:

    mant = ((numerator & 1048575) << unoccupied) / denominator;
    exp = ((numerator >> 20) & 2047) - ((denominator >> 20) & 2047) - unoccupied;

    return (((exp << 20) + mant) * sign);
}

addFloats(base, increment) {
    auto mant, exp, sign, move, temp;

    move = (((base >> 20) & 2047) < ((increment >> 20) & 2047)) ? ((base >> 20) & 2047) : ((increment >> 20) & 2047);
    if(((((base & 1048575) << (move - ((base >> 20) & 2047))) >> (move - ((base >> 20) & 2047))) != (base & 1048575)) || ((((increment & 1048575) << (move - ((increment >> 20) & 2047))) >> (move - ((increment >> 20) & 2047))) != (increment & 1048575))) {
        return;
    }

    if ((base < 0) != (increment < 0)) {
        if (((base >> 20) & 2047) > ((increment >> 20) & 2047)) {
            largeBase:
                sign = (base < 0) ? -1 : 1;
                mant = ((base & 1048575) << (move - ((base >> 20) & 2047))) - ((increment & 1048575) << (move - ((increment >> 20) & 2047)));
        }
        else if (((base >> 20) & 2047) < ((increment >> 20) & 2047)) {
            largeIncrement:
                sign = (increment < 0) ? -1 : 1;
                mant = ((increment & 1048575) << (move - ((increment >> 20) & 2047))) - ((base & 1048575) << (move - ((base >> 20) & 2047)));
        }
        else {
            if ((base & 1048575) > (increment & 1048575)) {
                goto largeBase;
            }
            else if ((base & 1048575) < (increment & 1048575)) {
                goto largeIncrement;
            }
            else return (0);
        }
    }
    else {
        sign = (base < 0) ? -1 : 1;
        mant = ((base & 1048575) << (move - ((base >> 20) & 2047))) + ((increment & 1048575) << (move - ((increment >> 20) & 2047)));
    }
    exp = move;
    temp = 0
    while (1) {
            if ((((mant << 1) >> 1) != mant)) {
                goto break;
            }
            exp++;
            mant = mant << 1;
        }
    break:
    return (((exp << 20) + mant) * sign);
}

subtractFloats(base, subtractor) {
    extrn addFloats;
    return (addFloats(base, -subtractor));
}

powFloats(base, exponent) {
    extrn multiplyFloats;
    auto i, result;

    i = 0;
    n = 1;
    while(i < exponent) {
        result = multiplyFloats(result, base);
        i++;
    }
    
    return result;
}

floatToString(float) {
    auto arr, i, output;
    arr = malloc(8);
    output = malloc(8);
    
    free(arr);
    return (output);
}
