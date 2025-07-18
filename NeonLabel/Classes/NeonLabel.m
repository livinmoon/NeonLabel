#import "NeonLabel.h"
#import <CoreText/CoreText.h>

@interface NeonLabel ()

@property (nonatomic, strong) CATextLayer *textLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;

@end

@implementation NeonLabel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.gradientLayer.frame = self.bounds;
    self.textLayer.frame = self.bounds;
}

- (CGSize)intrinsicContentSize {
    if (!self.text || self.text.length == 0) return CGSizeZero;
    NSDictionary *attrs = @{NSFontAttributeName: self.font};
    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    return textSize;
}

- (void)commonInit {
    _font = [UIFont systemFontOfSize:17];
    [self setupLayers];
    [self setupAnimations];
}

- (void)setupLayers {
    // TODO: Add a shadow?? ShadowTextLayer
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.startPoint = CGPointMake(0, 0.5);
    self.gradientLayer.endPoint = CGPointMake(1, 0.5);
    self.gradientLayer.colors = @[
        (id)[UIColor redColor].CGColor,
        (id)[UIColor orangeColor].CGColor,
        (id)[UIColor yellowColor].CGColor,
        (id)[UIColor greenColor].CGColor,
        (id)[UIColor cyanColor].CGColor,
        (id)[UIColor blueColor].CGColor,
        (id)[UIColor purpleColor].CGColor
    ];
    
    [self.layer addSublayer:self.gradientLayer];

    self.textLayer = [CATextLayer layer];
    self.textLayer.alignmentMode = kCAAlignmentCenter;
    self.textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    self.gradientLayer.mask = self.textLayer;
}

- (void)setupAnimations {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"startPoint"];
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-0.5, 0.5)];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 0.5)];
    animation.duration = 3.0;
    animation.repeatDuration = HUGE_VALF;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    
    [self.gradientLayer addAnimation:animation forKey:@"neon"];
}

- (void)setText:(NSString *)text {
    if (![_text isEqualToString:text]) {
        _text = text;
        [self updateTextLayerText];
    }
}

- (void)setFont:(UIFont *)font {
    if (![_font isEqual:font]) {
        _font = font;
        [self updateTextLayerText];
    }
}

- (void)updateTextLayerText {
    NSDictionary *attributes = @{
        NSFontAttributeName: self.font
    };
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:self.text attributes:attributes];
    self.textLayer.string = text;
    
    [self invalidateIntrinsicContentSize];
}

@end
