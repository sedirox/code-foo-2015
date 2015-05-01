//
//  main.m
//  CodeFoo
//
//  Created by sedirox on 4/10/15.
//  Copyright (c) 2015 Spring. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "abcAppDelegate.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {
        
        
        // read txt file and load everything into a buffer
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"word-search" ofType:@"txt"];
        
        NSFileManager *filemgr;
        NSString *databuffer;
        
        filemgr = [NSFileManager defaultManager];
        
        databuffer = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding
                                                  error:NULL];
        NSArray *lines = [databuffer componentsSeparatedByString:@"\n"];
        NSMutableArray *grid = [NSMutableArray arrayWithCapacity: (20)];
        NSMutableArray *words = [NSMutableArray arrayWithCapacity:(25)];
       
        
        
        //separated the data into the grid and array of search words
        
        for(int i = 0; i < 20; i++){
            grid[i]= [lines[i] componentsSeparatedByString:@" "];
            
        }
        
        for(int j =0; j< 26; j++){
            words[j] = lines[j+24];
        }
        
        //main loop for word search
        //for each word, search the grid in the 8 different directions
        //if a starting letter is found, search the rest of the word in that direction, if not, continues searching the grid
        
        for(NSString *word in words){
            //left to right
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((j+k >= 20 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString: grid[i][j+k]]== FALSE)){
                            found = false;
                            break;
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading from left to right", word,i,j);
                    }
                }
            }
            
            
            //vertically down
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((i+k >= 20 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString:grid[i+k][j]]== FALSE)){
                            found = false;
                            break;
                            
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading vertically down", word,i,j);
                    }
                }
            }
            
            
            
            //right to left
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((j-k < 0 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString: grid[i][j-k]]== FALSE)){
                            found = false;
                            break;
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading from right to left", word,i,j);
                    }
                }
            }
            //vertically up
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((i-k < 0 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString: grid[i-k][j]]== FALSE)){
                            found = false;
                            break;
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading vertically up", word,i,j);
                    }
                }
            }
            
            //diagonally right up
            
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((i-k < 0 || j+k >=20 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString: grid[i-k][j+k]]== FALSE)){
                            found = false;
                            break;
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading diagonally right up", word,i,j);
                    }
                }
            }
            
            //diagonally right down
            
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((i+k >= 20 || j+k >= 20 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString: grid[i+k][j+k]]== FALSE)){
                            found = false;
                            break;
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading diagonally right down", word,i,j);
                    }
                }
            }
            //diagonally left down
            
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((i+k >= 20 || j-k <0 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString: grid[i+k][j-k]]== FALSE)){
                            found = false;
                            break;
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading diagonally left down", word,i,j);
                    }
                }
            }
            //diagonally left up
            
            for(int i = 0; i < 20; i++){
                for(int j = 0; j <20; j++){
                    bool found = TRUE;
                    for(int k =0; k <word.length; k++){
                        if((i-k < 0 || j-k <0 || [[word substringWithRange: NSMakeRange(k, 1)] isEqualToString: grid[i-k][j-k]]== FALSE)){
                            found = false;
                            break;
                        }
                    }
                    
                    if(found){
                        NSLog(@" %@ found at %d %d reading diagonally left up", word,i,j);
                    }
                }
            }
            
            
        }
    }

        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([abcAppDelegate class]));
    
}
