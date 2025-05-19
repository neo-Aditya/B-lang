
multiplyDoubles(d1, d2) {
    auto mant, exp, sign;

    sign = ((d1 < 0) ? -1 : 1) * ((d2 < 0) ? -1 : 1);
    mant = (d1 & 1048575) * (d2 & 1048575);
    exp = ((d1 >> 20) & 2047) + ((d2 >> 20) & 2047);

    return (((exp << 20) + mant) * sign);
}

divideDoubles(numerator, denominator) {
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

addDoubles(d1, d2) {
    auto mant, exp, sign, move;
    extrn pow;

    if ((d1 < 0) != (d2 < 0)) {

    }
    else {
        sign = (d1 < 0) ? -1 : 1;
        move = (((d1 >> 20) & 2047) < ((d2 >> 20) & 2047)) ? ((d1 >> 20) & 2047) : ((d2 >> 20) & 2047);

        mant = ((d1 & 1048575) << (move - ((d1 >> 20) & 2047))) 

    }
    mant = 
    exp = 

    return (((exp << 20) + mant) * sign);
}