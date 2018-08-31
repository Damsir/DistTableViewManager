//
// DistTableViewCellStyle.m
// DistTableViewManager
//
// Copyright (c) 2013 Roman Efimov (https://github.com/romaonthego)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "DistTableViewCellStyle.h"

@implementation DistTableViewCellStyle

- (id)init
{
    self = [super init];
    if (!self)
        return nil;
    
    self.backgroundImages = [[NSMutableDictionary alloc] init];
    self.selectedBackgroundImages = [[NSMutableDictionary alloc] init];
    self.cellHeight = 44.0;
    self.defaultCellSelectionStyle = UITableViewCellSelectionStyleBlue;
    
    return self;
}

- (id)copyWithZone:(NSZone *)zone
{
    DistTableViewCellStyle *style = [[self class] allocWithZone:zone];
    if (style) {
        style.backgroundImages = [NSMutableDictionary dictionaryWithDictionary:[self.backgroundImages copyWithZone:zone]];
        style.selectedBackgroundImages = [NSMutableDictionary dictionaryWithDictionary:[self.selectedBackgroundImages copyWithZone:zone]];
        style.cellHeight = self.cellHeight;
        style.defaultCellSelectionStyle = self.defaultCellSelectionStyle;
        style.backgroundImageMargin = self.backgroundImageMargin;
        style.contentViewMargin = self.contentViewMargin;
    }
    return style;
}

- (BOOL)hasCustomBackgroundImage
{
    return [self backgroundImageForCellType:DistTableViewCellTypeAny] || [self backgroundImageForCellType:DistTableViewCellTypeFirst] || [self backgroundImageForCellType:DistTableViewCellTypeMiddle] || [self backgroundImageForCellType:DistTableViewCellTypeLast] || [self backgroundImageForCellType:DistTableViewCellTypeSingle];
}

- (UIImage *)backgroundImageForCellType:(DistTableViewCellType)cellType
{
    UIImage *image = self.backgroundImages[@(cellType)];
    if (!image && cellType != DistTableViewCellTypeAny)
        image = self.backgroundImages[@(DistTableViewCellTypeAny)];
    return image;
}

- (void)setBackgroundImage:(UIImage *)image forCellType:(DistTableViewCellType)cellType
{
    if (image)
        [self.backgroundImages setObject:image forKey:@(cellType)];
}

- (BOOL)hasCustomSelectedBackgroundImage
{
    return [self selectedBackgroundImageForCellType:DistTableViewCellTypeAny] ||[self selectedBackgroundImageForCellType:DistTableViewCellTypeFirst] || [self selectedBackgroundImageForCellType:DistTableViewCellTypeMiddle] || [self selectedBackgroundImageForCellType:DistTableViewCellTypeLast] || [self selectedBackgroundImageForCellType:DistTableViewCellTypeSingle];
}

- (UIImage *)selectedBackgroundImageForCellType:(DistTableViewCellType)cellType
{
    UIImage *image = self.selectedBackgroundImages[@(cellType)];
    if (!image && cellType != DistTableViewCellTypeAny)
        image = self.selectedBackgroundImages[@(DistTableViewCellTypeAny)];
    return image;
}

- (void)setSelectedBackgroundImage:(UIImage *)image forCellType:(DistTableViewCellType)cellType
{
    if (image)
        [self.selectedBackgroundImages setObject:image forKey:@(cellType)];
}

@end
