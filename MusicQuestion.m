//
//  MusicQuestion.m
//  MusicQuizV2
//
//  Created by Luca Gramaglia on 07/05/14.
//  Copyright (c) 2014 Luca Gramaglia. All rights reserved.
//

#import "MusicQuestion.h"

@implementation MusicQuestion

#pragma mark - Init Methods

-(instancetype)initWithType:(enum musicQuizMode)type correctAnswer:(int)correctA numberOfAnswers:(int)numOfAnswers
{
    self = [super init];
    
    if (self) {
                
        _answers = [self getRandomSongs:numOfAnswers];
        _correctAnswer = correctA;
        
        NSLog(@"Correct Answer: %d", correctA);
        
        if (type == 1 ) {
            _text = @"Chi è l'artista ?";
        } else if (type == 2) {
            _text = @"Qual'è il titolo ?";
        } else if (type == 3) {
            _text = @"L'artista ? Il titolo ?";
        } else {
            _text = @"Testo della domanda";
        }
    }
    
    return self;
}


#pragma mark - Music Library Query
/**
 *  This method is used to randomize a number of songs (MPMediaItems)
 *
 *  @param numOfSongs - number of songs to randomize
 *
 *  @return NSArray with a number of randomize MPMediaItems
 */
// TODO: Check that I don't generate the same title/artist for a single question
-(NSMutableArray*) getRandomSongs:(int) numOfSongs
{
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    // Ottengo tutte le canzoni della libreria
    NSArray *itemsFromGenericQuery = [everything items];
    // Questo array conterrà le canzoni da mettere in coda di riproduzione
    NSMutableArray *songsToPlay = [[NSMutableArray alloc] init];
    
    // Qui vengono estratte le canzoni
    for (int i=0; i<numOfSongs; i++) {
        int randomNumber = arc4random() % itemsFromGenericQuery.count;
        [songsToPlay addObject:itemsFromGenericQuery[randomNumber]];
        //NSLog(@"%@", [songsToPlay[i] valueForProperty:MPMediaItemPropertyTitle]);
    }
        
    return songsToPlay;
}

@end
