//
//  ViewController.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"
#import "Board.h"
#import "Tile.h"
#import "MinesweeperTile.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButtons;

- (IBAction)tilePressed:(UIButton *)sender;

@end


@implementation ViewController

- (Board *)createBoard
{
    NSLog(@"view controller - create board method");
    return nil;
}

- (Game *)game
{
    if (!_game)_game = [[Game alloc]initWithTileCount:[self.tileButtons count]
                                           usingBoard:[self createBoard]];
    return _game;
}


- (void)newGame
{
    NSLog(@"view controller - creating new game");
    self.game = [[Game alloc]initWithTileCount:[self.tileButtons count] usingBoard:[self createBoard]];
//    [self updateUI];
}



- (IBAction)tilePressed:(UIButton *)sender
{
    NSUInteger tileIndex = [self.tileButtons indexOfObject:sender];
    NSLog(@"PRESSED TILE INDEX: %lu", (unsigned long)tileIndex);
    
//  [self.game chooseTileAtIndex:tileIndex];
    
    [self.game surroundingMines:tileIndex];
    [sender setTitle:[NSString stringWithFormat:@"%d", [self.game surroundingMines:tileIndex]] forState:UIControlStateNormal];
    [sender setBackgroundColor:[UIColor grayColor]];
//  [self updateUI];

}


- (void)updateUI
{
    for (UIButton *oneTileButton in self.tileButtons){
        NSInteger tileIndex = [self.tileButtons indexOfObject:oneTileButton];
        Tile *tile = [self.game tileAtIndex:tileIndex];
        [oneTileButton setBackgroundColor:[self backgroundColorForTile:tile]];
//        oneTileButton.enabled = !tile.isInactive;
    }
}

- (UIColor *)backgroundColorForTile:(Tile *)tile
{
    // Add additional logic for UIImage later -- see cardGame
    return [UIColor redColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    [Board createBoard];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
