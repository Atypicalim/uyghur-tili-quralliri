// converter







// enum of alphabets
enum NAMES {
    A;
    AE;
    B;
    DJ;
    CH;
    D;
    EE;
    F;
    G;
    GH;
    H;
    // I;
    I;
    J;
    K;
    L;
    M;
    N;
    NG;
    O;
    OO;
    P;
    Q;
    R;
    S;
    SH;
    T;
    // TS;
    U;
    UU;
    V;
    // W;
    X;
    Y;
    Z;
}

typedef Alphabet = {
    var uas : String; // uyghur arabic script
    var ucs : String; // uyghur cyrillic script
    var uns : String; // uyghur new script
    var uls : String; // uyghur latin script
}

var ALPHABETS : Map<NAMES, Alphabet> = [
    NAMES.A => {
        uas : ,
        ucs : "а",
        uls : "a",
        uns : "a",
    }
];


class Converter {


    static function main() {
        trace(ALPHABETS[NAMES.A]);
        trace("converter...");
    }

}
