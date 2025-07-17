#import "ViewController.h"
#import <NeonLabel/NeonLabel.h>
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIButton *initialText;
@property (nonatomic, strong) UIButton *changeText;
@property (nonatomic, strong) UIButton *initialFont;
@property (nonatomic, strong) UIButton *changeFont;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)setupView {
    [self.view addSubview:self.neonLabel];
    [self.neonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    [self.view addSubview:self.changeText];
    [self.changeText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.inset(50);
        make.leading.inset(30);
    }];
    
    [self.view addSubview:self.initialText];
    [self.initialText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.changeText.mas_top).offset(-20);
        make.centerX.equalTo(self.changeText);
    }];
    
    [self.view addSubview:self.changeFont];
    [self.changeFont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.changeText);
        make.trailing.inset(30);
    }];
    
    [self.view addSubview:self.initialFont];
    [self.initialFont mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.initialText);
        make.centerX.equalTo(self.changeFont);
    }];
}

- (NeonLabel *)neonLabel {
    if (!_neonLabel) {
        _neonLabel = [[NeonLabel alloc] init];
        _neonLabel.text = @"Hello World!";
        _neonLabel.accessibilityIdentifier = @"neonLabel";
    }
    return _neonLabel;
}

- (UIButton *)changeText {
    if (!_changeText) {
        _changeText = [[UIButton alloc] init];
        [_changeText setTitle:@"ChangeText" forState:UIControlStateNormal];
        [_changeText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_changeText addTarget:self action:@selector(actionForButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeText;
}

- (UIButton *)initialText {
    if (!_initialText) {
        _initialText = [[UIButton alloc] init];
        [_initialText setTitle:@"InitialText" forState:UIControlStateNormal];
        [_initialText setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_initialText addTarget:self action:@selector(actionForButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _initialText;
}

- (void)actionForButton:(UIButton *)sender {
    if ([sender isEqual:self.changeText]) {
        self.neonLabel.text = @"what can i say";
    }
    else if ([sender isEqual:self.initialText]) {
        self.neonLabel.text = @"Hello World!";
    }
    else if ([sender isEqual:self.changeFont]) {
        self.neonLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:30];
    }
    else if ([sender isEqual:self.initialFont]) {
        self.neonLabel.font = [UIFont systemFontOfSize:17];
    }
}

- (UIButton *)changeFont {
    if (!_changeFont) {
        _changeFont = [[UIButton alloc] init];
        [_changeFont setTitle:@"ChangeFont" forState:UIControlStateNormal];
        [_changeFont setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_changeFont addTarget:self action:@selector(actionForButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _changeFont;
}

- (UIButton *)initialFont {
    if (!_initialFont) {
        _initialFont = [[UIButton alloc] init];
        [_initialFont setTitle:@"InitialFont" forState:UIControlStateNormal];
        [_initialFont setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_initialFont addTarget:self action:@selector(actionForButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _initialFont;
}

@end
