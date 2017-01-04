//
//  ViewController.m
//  HTML解析
//
//  Created by 魏琦 on 16/12/25.
//  Copyright © 2016年 com.drcacom.com. All rights reserved.
//

#import "ViewController.h"
#import "HTMLNode.h"
#import "HTMLParser.h"
#import "HTMLNode+UI.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *htmlPath = [[NSBundle mainBundle]pathForResource:@"content" ofType:@"html"];
    NSString *htmlString = [[NSString alloc] initWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    
    HTMLParser *parser = [[HTMLParser alloc] initWithString:htmlString error:nil];
    
    HTMLNode *htmlNode = parser.body;
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] init];
    
    for (HTMLNode *childerNode in htmlNode.children) {
        if ([childerNode.tagName isEqualToString:@"text"]) {
            NSString *content = childerNode.contents;
            if (content != nil){
                NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                
                [attributedString appendAttributedString:contents];
                [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
                
            }
           
            
            
        }
        else if ([childerNode.tagName hasPrefix:@"h"]) {
          
            if ([childerNode.className isEqualToString:@"bodycontent-first-title"]) {
              //  NSLog(@"%@",childerNode.contents);
                NSString *content = childerNode.contents;
                if (content != nil){
                    NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                    
                    [attributedString appendAttributedString:contents];
                    [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
                    
                }
            }
            
            
            
        }
        else if([childerNode.tagName isEqualToString:@"p"]){
            if ([childerNode.className isEqualToString:@"bodycontent-text_center"]) {
           //     NSLog(@"%@",childerNode.contents);
                NSString *content = childerNode.contents;
                if (content != nil){
                    NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                    
                    [attributedString appendAttributedString:contents];
                    [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
                    
                }
            }
            else if ([childerNode.className isEqualToString:@"bodycontent-text"]){
             //    NSLog(@"%@",childerNode.contents);
                NSString *content = childerNode.contents;
                if (content != nil){
                    NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                    
                    [attributedString appendAttributedString:contents];
                    [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
                    
                }
            }
            else if ([childerNode.className isEqualToString:@"bodycontent-second-title sigil_not_in_toc"]){
                // NSLog(@"%@",childerNode.contents);
                NSString *content = childerNode.contents;
                if (content != nil){
                    NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                    
                    [attributedString appendAttributedString:contents];
                    [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
                    
                }
            }
            else if ([childerNode.className isEqualToString:@"bodycontent-text_yinwen1"]){
                NSArray *childrenArray = childerNode.children;
                for (HTMLNode * node in childrenArray) {
                    if ([node.tagName isEqualToString:@"text"]) {
                        NSString *content = node.content;
                        if (content != nil){
                            NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                            
                            [attributedString appendAttributedString:contents];
                            [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
                    }
                }
                    else if ([node.tagName isEqualToString:@"b"]){
                        for (HTMLNode * bChildrenNode in node.children) {
                            if ([bChildrenNode.tagName isEqualToString:@"text"]) {
                                NSString *content = bChildrenNode.content;
                                if (content != nil){
                                    NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                                    
                                    [attributedString appendAttributedString:contents];
                                    [attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:@"\n"]];
                                }
                            }
                        }
                    }
                    else if ([node.tagName isEqualToString:@"span"]){
                        for (HTMLNode *sChildrenNode in node.children) {
                            if ([sChildrenNode.tagName isEqualToString:@"a"]) {
                                for (HTMLNode *aChildrenNode in sChildrenNode.children) {
                                    if ([aChildrenNode.tagName isEqualToString:@"text"]) {
                                        NSString *content = aChildrenNode.content;
                                        if (content != nil){
                                            NSAttributedString * contents = [[NSAttributedString alloc] initWithString:content];
                                            
                                            [attributedString appendAttributedString:contents];
                                        }
                                    }
                                }
                            }
                        }
                    }
                
            }
                
        }
            
           
        }
    }
    
    NSLog(@"%@",attributedString);
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
