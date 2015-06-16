//
//  HBAuthViewController.m
//  HBWeibo
//
//  Created by bottle on 15/6/15.
//  Copyright (c) 2015年 bottle. All rights reserved.
//

#import "HBAuthViewController.h"
#import "AFNetworking.h"


#define Client_ID @"4289234531"
#define App_Secret @"b6a1e28208ee3cac4161866a246dda66"
#define Redirect_Url @"http://www.baidu.com"
#define AuthUrlStirng [NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",Client_ID,Redirect_Url]

@interface HBAuthViewController () <UIWebViewDelegate>

@property (nonatomic,strong) NSString *access_token;
@property (nonatomic,weak) UIWebView *webView;

@end

@implementation HBAuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] init];
    webView.frame = self.view.frame;
    webView.delegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    //加载微博登录页面
    NSURL *url = [NSURL URLWithString:AuthUrlStirng];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *urlString =  request.URL.absoluteString;
    NSRange range = [urlString rangeOfString:@"code"];
    if (range.length > 0){
        NSString *code = [urlString substringFromIndex:(range.location+5)];
        [self getAccessTokenWithCode:code];
        return NO;
    }
    return YES;
}

//利用code换取access_token
/*
 client_id 	true 	string 	申请应用时分配的AppKey。
 client_secret 	true 	string 	申请应用时分配的AppSecret。
 grant_type 	true 	string 	请求的类型，填写authorization_code
 
 grant_type为authorization_code时

 code 	true 	string 	调用authorize获得的code值。
 redirect_uri 	true 	string 	回调地址，需需与注册应用里的回调地址一致。
 */
- (void)getAccessTokenWithCode:(NSString*)code
{
    //https://api.weibo.com/oauth2/access_token
    //access_token
    //count
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *par = [NSMutableDictionary dictionary];
    par[@"client_id"] = Client_ID;
    par[@"client_secret"] = App_Secret;
    par[@"grant_type"] = @"authorization_code";
    par[@"code"] = code;
    par[@"redirect_uri"] = Redirect_Url;
    
    [mgr POST:@"https://api.weibo.com/oauth2/access_token" parameters:par success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        
        /*2015-06-15 14:54:52.626 ThinkingHellenWB[4052:109436] {
        "access_token" = "2.0023K1IGHqLRgE29f371b187a5dL8D";
        "expires_in" = 157679999;
        "remind_in" = 157679999
         uid = 5619814065;
         }
        */
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
}

@end
