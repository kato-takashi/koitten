//
//  ViewController.m
//  sampleMusicPlayer
//
//  Created by Kato Takashi on 2014/04/13.
//  Copyright (c) 2014年 Kato Takashi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property MPMusicPlayerController *player;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.player = [MPMusicPlayerController applicationMusicPlayer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)pick:(id)sender{
//    MPMediaPickerControllerのインスタンスを作成
    MPMediaPickerController *picker = [[MPMediaPickerController alloc] init];
//    ピッカーのデリゲードを設定
    picker.delegate = self;
//    複数選択を不可にする．（Yesにすると複数選択できる）
    picker.allowsPickingMultipleItems = NO;
//    ピッカーを表示する
    [self presentViewController:picker animated:YES completion:nil];
}

//メディアアイテムピッカーでアイテムを選択完了した時に呼びだされる
-(void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
//    選択した曲情報がmediaItemCollectionに入っているので，これをplayにセット
    [self.player setQueueWithItemCollection:mediaItemCollection];
    //再生開始
    [self.player play];
    //ピッカーを閉じ，破棄
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

//選択がキャンセルされた時に呼ばれる
-(void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    //ピッカーを閉じ破棄する
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)pushPlay:(id)sender{
    [self.player play];
}

-(IBAction)pushPause:(id)sender{
    [self.player pause];
}
-(IBAction)pushStop:(id)sender{
    [self.player stop];
}

@end
