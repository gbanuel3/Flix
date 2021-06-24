//
//  DetailsViewController.m
//  Flix
//
//  Created by Gildardo Banuelos on 6/24/21.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSString *baseURLString = @"https://image.tmdb.org/t/p/original";
    NSString *posterURLSTRING = self.movie[@"poster_path"];
//    NSLog(@"%@", posterURLSTRING);
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLSTRING];
    
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    [self.posterView setImageWithURL:posterURL];
    
    NSString *backdropURLEnd = self.movie[@"backdrop_path"];
//    NSLog(@"%@", backdropURLEnd);
    NSString *backdropFullURL = [baseURLString stringByAppendingString:backdropURLEnd];
    
    NSURL *backDropPosterURL = [NSURL URLWithString:backdropFullURL];
    [self.backdropView setImageWithURL:backDropPosterURL];
    
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"overview"];
    
    [self.titleLabel sizeToFit];
    [self.synopsisLabel sizeToFit];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
