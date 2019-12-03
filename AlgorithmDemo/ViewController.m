//
//  ViewController.m
//  AlgorithmDemo
//
//  Created by fengbang on 2019/12/3.
//  Copyright © 2019 王颖博. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self n_array];
}

#pragma mark - algorithems
/**
 一个N*N的二维数组，每行每列只能取一个值，怎么取值让总和最小？
   一个n*n的二维数组，值为正整数，
   规则：每行每列只能取一个数，怎么取值让和最小？
   eg:
   ---------
   |3  8  5|
   |2  4  6|
   |7  9  1|
   ---------
 */
- (void)n_array {
    static NSArray *_n_array_total = nil;
    NSArray *line1 = @[@3,@8,@5];
    NSArray *line2 = @[@2,@4,@6];
    NSArray *line3 = @[@7,@9,@1];
    NSInteger squareN = MIN((MIN(line1.count, line2.count)), line3.count);
    NSArray *total = @[line1,line2,line3];
    _n_array_total = total;
    
    NSInteger min = 0xffff;
    NSNumber *minNum1, *minNum2, *minNum3;
    
    for (int i = 0; i<_n_array_total.count; i++) {
        NSArray *line = _n_array_total[i];
        for (int j = 0; j<squareN; j++) {
            NSNumber *num1 = line[j];
            NSNumber *num2;
            NSNumber *num3;
            for (int k = 0; k<squareN; k++) {
                if (k == i) { continue; }
                NSArray *perLine = _n_array_total[k];
                for (int l = 0; l<perLine.count; l++) {
                    if (l == j) { continue; }
                    num2 = perLine[l];
                    for (int m = 0; m<perLine.count; m++) {
                        if (m == i || m == k) { continue; }
                        NSArray *perLine2 = _n_array_total[m];
                        for (int n = 0; n<perLine2.count; n++) {
                            if (n == j || n == l) { continue; }
                            num3 = perLine2[n];
                            if (num1.integerValue+num2.integerValue+num3.integerValue<=min) {
                                minNum1 = num1;
                                minNum2 = num2;
                                minNum3 = num3;
                                min = num1.integerValue+num2.integerValue+num3.integerValue;
                            }
                        }
                    }
                    
                }
            }
        }
    }
    
    NSLog(@"\n最小:%ld\n数1：%@\n数2：%@\n数3：%@\n",(long)min,minNum1,minNum2,minNum3);
}


@end
