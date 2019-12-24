% function [nRows, nCols] = subplotArrange(n)

function [nRows, nCols] = subplotArrange(n)

switch n
    case 1, nRows = 1; nCols = 1;
    case 2, nRows = 1; nCols = 2;
    case 3, nRows = 1; nCols = 3;
    case 4, nRows = 2; nCols = 2;
    case 5, nRows = 2; nCols = 3;
    case 6, nRows = 2; nCols = 3;
    case 7, nRows = 2; nCols = 4;
    case 8, nRows = 2; nCols = 4;
    case 9, nRows = 3; nCols = 3;
    case 10, nRows = 2; nCols = 5;
    case 11, nRows = 3; nCols = 4;
    case 12, nRows = 3; nCols = 4;
    case 13, nRows = 3; nCols = 5;
    case 14, nRows = 3; nCols = 5;
    case 15, nRows = 3; nCols = 5;
    case 16, nRows = 4; nCols = 4;
    case 17, nRows = 3; nCols = 6;
    case 18, nRows = 3; nCols = 6;
    case 19, nRows = 3; nCols = 5;
    case 20, nRows = 4; nCols = 5;
    case 21, nRows = 3; nCols = 7;
    case 22, nRows = 4; nCols = 6;
    case 23, nRows = 4; nCols = 6;
    case 24, nRows = 4; nCols = 6;
    case 25, nRows = 5; nCols = 5;
    case 26, nRows = 4; nCols = 7;
    case 27, nRows = 4; nCols = 7;
    case 28, nRows = 4; nCols = 7;
    case 29, nRows = 5; nCols = 6;
    case 30, nRows = 5; nCols = 6;
    case 31, nRows = 5; nCols = 7;
    case 32, nRows = 5; nCols = 7;
    case 33, nRows = 5; nCols = 7;
    case 34, nRows = 5; nCols = 7;
    case 35, nRows = 5; nCols = 7;
    case 36, nRows = 6; nCols = 6;
    case 37, nRows = 4; nCols = 10;
    case 38, nRows = 4; nCols = 10;
    case 39, nRows = 4; nCols = 10;
    case 40, nRows = 4; nCols = 10;
    case 41, nRows = 7; nCols = 7;
    case 42, nRows = 6; nCols = 7;
    case 43, nRows = 5; nCols = 9;
    case 44, nRows = 5; nCols = 9;
    case 45, nRows = 5; nCols = 9;
    case 46, nRows = 6; nCols = 8;
    case 47, nRows = 6; nCols = 8;
    case 48, nRows = 6; nCols = 8;
    case 49, nRows = 7; nCols = 7;
    case 50, nRows = 5; nCols = 10;
    case 51, nRows = 6; nCols = 9;
    case 52, nRows = 6; nCols = 9;
    case 53, nRows = 6; nCols = 9;
    case 54, nRows = 6; nCols = 9;
    case 55, nRows = 7; nCols = 8;
    case 56, nRows = 7; nCols = 8;
    case 57, nRows = 6; nCols = 10;
    case 58, nRows = 6; nCols = 10;
    case 59, nRows = 6; nCols = 10;
    case 60, nRows = 6; nCols = 10;
    case 61, nRows = 8; nCols = 8;
    case 62, nRows = 8; nCols = 8;
    case 63, nRows = 8; nCols = 8;
    case 64, nRows = 8; nCols = 8;
    otherwise, nRows = ceil(.7*sqrt(n)); nCols = ceil(n/nRows);
end;

