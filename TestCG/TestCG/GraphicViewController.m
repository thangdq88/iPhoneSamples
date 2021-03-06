//
//  GraphicViewController.m
//  TestCG
//
//  Created by matsuda on 12/07/25.
//
//

#import "GraphicViewController.h"

#import "MaskView.h"

@interface GraphicViewController ()
@property (nonatomic, weak) IBOutlet UIButton *button;
@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@end

@implementation GraphicViewController

@synthesize button = _button;
@synthesize imageView = _imageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    MaskView *m = [[MaskView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    [self.view addSubview:m];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convert:(id)sender
{
    NSLog(@"convert");
}

@end
