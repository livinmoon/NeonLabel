#import "NeonLabel.h"
#import <CoreText/CoreText.h>

@interface NeonLabel ()

@property (nonatomic, strong) CATextLayer *textLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, assign) NSUInteger colorsCount;

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
    
    NSMutableArray *locations = [NSMutableArray array];
    for (NSInteger i = 0; i < self.colorsCount; i++) {
        [locations addObject:@(i * self.colorsCount)];
    }
    self.gradientLayer.locations = locations;
    
    [self.layer addSublayer:self.gradientLayer];

    self.textLayer = [CATextLayer layer];
    self.textLayer.alignmentMode = kCAAlignmentCenter;
    self.textLayer.contentsScale = [UIScreen mainScreen].scale;
    self.textLayer.foregroundColor = UIColor.blackColor.CGColor;
    
    self.gradientLayer.mask = self.textLayer;
}

- (void)setupAnimations {
    NSMutableArray *fromValues = [NSMutableArray array];
    NSMutableArray *toValues = [NSMutableArray array];
    for (NSInteger i = 0; i < self.colorsCount; i++) {
        CGFloat f = i * 1.0 / self.colorsCount;
        [fromValues addObject:@(f)];
        [toValues addObject:@(f + 1.0)];
    }
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"locations"];
    animation.fromValue = fromValues;
    animation.toValue = toValues;
    animation.duration = 3.0;
    animation.repeatCount = HUGE_VALF;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    
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

- (NSUInteger)colorsCount {
    return self.gradientLayer.colors.count;
}

@end
