//
//  ViewController.m
//  单例
//
//  Created by 李小龙 on 2019/5/30.
//  Copyright © 2019 李小龙. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
NSString *ID = @"wine";
@interface ViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    for (int i=0; i < MAXFLOAT; i++) {
        @autoreleasepool {
            
        }
    }
    
    //注册ID 这个标识对应的cell类型为UITableViewCell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    NSSet *websiteDataTypes = [WKWebsiteDataStore allWebsiteDataTypes];
    //通过代码如何设置button的内边距
    self.btn.contentEdgeInsets = UIEdgeInsetsMake(30, 30, 0, 0);
    self.btn.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    self.btn.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    
    //如何处理图片拉伸问题?
    //创建可拉伸的图片对象
    UIImage *bg = [bg resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeTile];
    //定时器
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(run) userInfo:nil repeats:YES];
    //设置缩放比例
    self.scrollView.maximumZoomScale = 2.0;
    self.scrollView.maximumZoomScale = 0.2;
    
    //通过约束如何实现动画
    [UIView animateWithDuration:1.0 animations:^{
       // [添加了约束的view的父控件 layoutIfNeeded];
    }];
    
    //kvc底层实现
   // [flagItem setValue:obj forKeyPath:key];
}

//监听scrollView停止滚动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
}

//缩放代理方法
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return nil;
}

#pragma mark
// 多少组数据
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//每一组有多少行数据
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

// 每一行显示什么内容 每当一个cell要进入视野范围就会调用这个方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    /* 方法一
    // 1.定义一个重用标识
    static NSString *ID = @"tim";
    //2.去缓存池取可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //3.缓存池如果没有可循环利用的Cell，自己创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        //建议：所有cell都一样的设置，写在这个大括号中l；所有cell不都一样的设置写在外面
        cell.backgroundColor = [UIColor redColor];
    }
    
    //设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行数据",indexPath.row];
    
    return cell;
     
     */
    
    //方法二
    //1.先去缓存池中查找可循环利用的Cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //2.设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"%zd行的数据",indexPath.row];
    
    return cell;
}

@end
