/**
 * Module developed by Napp
 * Author Mads Møller
 * www.napp.dk
 */

#import "TiUIView+TiUIWindow+TiUITabGroup+TiUIiPadSplitWindow+Blurred.h"

@implementation TiUIView (WithShadow)

-(void)setBlur_:(id)value {
    CGFloat num = [TiUtils floatValue:value];
    [self.layer setRasterizationScale:num];
    
    if (num == 1.0f) {
        [self.layer setShouldRasterize:NO];
    } else {
        [self.layer setShouldRasterize:YES];
    }
}

-(void)setStaticBlur_:(id)args
{
    //Doesn't work on iOS 6 and below.
    if(![TiUtils isIOS7OrGreater])
    {
        return;
    }
    
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    BOOL enabled = [[args valueForKey:@"enabled"] boolValue];
    
    if(!enabled)
    {
        //We no longer need the blurred image
        [[self viewWithTag:200] removeFromSuperview];
    }
    else
    {
        
        //If we have a UIImageView in our view, don't add a new one
        if([self viewWithTag:200] == nil)
        {
            UIImageView *blurredImageView = [UIImageView new];
            blurredImageView.tag=200;
            blurredImageView.frame = self.frame;
            
            [self addSubview:blurredImageView];
        }
        
        NSString *type = [args valueForKey:@"type"];
        BOOL hasRadius = [args valueForKey:@"radius"] != nil ? YES : NO;
        CGFloat radius = [[args valueForKey:@"radius"] floatValue];
        
        // Create the image context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        
        [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
        
        // Get the snapshot
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        
        if(type != nil && type.length)
        {
            UIImage *blurredSnapshotImage;
            
            if([type isEqualToString:@"light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffect];
                }
            }
            else if([type isEqualToString:@"extra light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
                }
            }
            else if([type isEqualToString:@"dark"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffect];
                }
            }
            else if([type isEqualToString:@"tint"])
            {
                UIColor *tint = [[TiUtils colorValue:[args valueForKey:@"tint"]] _color];
                blurredSnapshotImage = [snapshotImage applyTintEffectWithColor:tint];
            }
            
            
            ((UIImageView *)[self viewWithTag:200]).image = blurredSnapshotImage;
            
        }
        else
        {
            ((UIImageView *)[self viewWithTag:200]).image = snapshotImage;
        }
        
        // Be nice and clean your mess up
        UIGraphicsEndImageContext();
        
    }
    
}

@end

@implementation TiUIWindow (WindowWithShadow)

-(void)setBlur_:(id)value {
    CGFloat num = [TiUtils floatValue:value];
    [self.layer setRasterizationScale:num];
    
    if (num == 1.0f) {
        [self.layer setShouldRasterize:NO];
    } else {
        [self.layer setShouldRasterize:YES];
    }
}

-(void)setStaticBlur_:(id)args
{
    //Doesn't work on iOS 6 and below.
    if(![TiUtils isIOS7OrGreater])
    {
        return;
    }
    
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    BOOL enabled = [[args valueForKey:@"enabled"] boolValue];
    
    if(!enabled)
    {
        //We no longer need the blurred image
        [[self viewWithTag:100] removeFromSuperview];
    }
    else
    {
        
        //If we have a UIImageView in our view, don't add a new one
        if([self viewWithTag:100] == nil)
        {
            UIImageView *blurredImageView = [UIImageView new];
            blurredImageView.tag=100;
            blurredImageView.frame = self.frame;
            
            [self addSubview:blurredImageView];
        }
        
        NSString *type = [args valueForKey:@"type"];
        BOOL hasRadius = [args valueForKey:@"radius"] != nil ? YES : NO;
        CGFloat radius = [[args valueForKey:@"radius"] floatValue];
        
        // Create the image context
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
        
        [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
        
        // Get the snapshot
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        
        if(type != nil && type.length)
        {
            UIImage *blurredSnapshotImage;
            
            if([type isEqualToString:@"light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffect];
                }
            }
            else if([type isEqualToString:@"extra light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
                }
            }
            else if([type isEqualToString:@"dark"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffect];
                }
            }
            else if([type isEqualToString:@"tint"])
            {
                UIColor *tint = [[TiUtils colorValue:[args valueForKey:@"tint"]] _color];
                blurredSnapshotImage = [snapshotImage applyTintEffectWithColor:tint];
            }
            
            
            ((UIImageView *)[self viewWithTag:100]).image = blurredSnapshotImage;
            
        }
        else
        {
            ((UIImageView *)[self viewWithTag:100]).image = snapshotImage;
        }
        
        // Be nice and clean your mess up
        UIGraphicsEndImageContext();
        
    }
    
}

@end

@implementation TiUITabGroup (WindowWithShadow)

-(void)setStaticBlur_:(id)args
{
    //Doesn't work on iOS 6 and below.
    if(![TiUtils isIOS7OrGreater])
    {
        return;
    }
    
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    BOOL enabled = [[args valueForKey:@"enabled"] boolValue];
    
    if(!enabled)
    {
        //We no longer need the blurred image
        [[controller.view viewWithTag:100] removeFromSuperview];
    }
    else
    {
        
        //If we have a UIImageView in our view, don't add a new one
        if([controller.view viewWithTag:100] == nil)
        {
            UIImageView *blurredImageView = [UIImageView new];
            blurredImageView.tag=100;
            blurredImageView.frame = self.frame;
            
            [controller.view addSubview:blurredImageView];
        }
        
        NSString *type = [args valueForKey:@"type"];
        BOOL hasRadius = [args valueForKey:@"radius"] != nil ? YES : NO;
        CGFloat radius = [[args valueForKey:@"radius"] floatValue];
        
        // Create the image context
        UIGraphicsBeginImageContextWithOptions(controller.view.bounds.size, NO, self.window.screen.scale);
        
        [self drawViewHierarchyInRect:controller.view.frame afterScreenUpdates:NO];
        
        // Get the snapshot
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        
        if(type != nil && type.length)
        {
            UIImage *blurredSnapshotImage;
            
            if([type isEqualToString:@"light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffect];
                }
            }
            else if([type isEqualToString:@"extra light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
                }
            }
            else if([type isEqualToString:@"dark"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffect];
                }
            }
            else if([type isEqualToString:@"tint"])
            {
                UIColor *tint = [[TiUtils colorValue:[args valueForKey:@"tint"]] _color];
                blurredSnapshotImage = [snapshotImage applyTintEffectWithColor:tint];
            }
            
            
            ((UIImageView *)[controller.view viewWithTag:100]).image = blurredSnapshotImage;
            
        }
        else
        {
            ((UIImageView *)[controller.view viewWithTag:100]).image = snapshotImage;
        }
        
        // Be nice and clean your mess up
        UIGraphicsEndImageContext();
        
    }
    
}

@end

@implementation TiUIiPadSplitWindow (WindowWithShadow)

-(void)setStaticBlur_:(id)args
{
    //Doesn't work on iOS 6 and below.
    if(![TiUtils isIOS7OrGreater])
    {
        return;
    }
    
    ENSURE_SINGLE_ARG(args, NSDictionary);
    
    BOOL enabled = [[args valueForKey:@"enabled"] boolValue];
    
    if(!enabled)
    {
        //We no longer need the blurred image
        [[controller.view viewWithTag:100] removeFromSuperview];
    }
    else
    {
        
        //If we have a UIImageView in our view, don't add a new one
        if([controller.view viewWithTag:100] == nil)
        {
            UIImageView *blurredImageView = [UIImageView new];
            blurredImageView.tag=100;
            blurredImageView.frame = self.frame;
            
            [controller.view addSubview:blurredImageView];
        }
        
        NSString *type = [args valueForKey:@"type"];
        BOOL hasRadius = [args valueForKey:@"radius"] != nil ? YES : NO;
        CGFloat radius = [[args valueForKey:@"radius"] floatValue];
        
        // Create the image context
        UIGraphicsBeginImageContextWithOptions(controller.view.bounds.size, NO, self.window.screen.scale);
        
        [self drawViewHierarchyInRect:controller.view.frame afterScreenUpdates:NO];
        
        // Get the snapshot
        UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        
        if(type != nil && type.length)
        {
            UIImage *blurredSnapshotImage;
            
            if([type isEqualToString:@"light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyLightEffect];
                }
            }
            else if([type isEqualToString:@"extra light"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyExtraLightEffect];
                }
            }
            else if([type isEqualToString:@"dark"])
            {
                if(hasRadius)
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffectWithRadius: radius];
                }
                else
                {
                    blurredSnapshotImage = [snapshotImage applyDarkEffect];
                }
            }
            else if([type isEqualToString:@"tint"])
            {
                UIColor *tint = [[TiUtils colorValue:[args valueForKey:@"tint"]] _color];
                blurredSnapshotImage = [snapshotImage applyTintEffectWithColor:tint];
            }
            
            
            ((UIImageView *)[controller.view viewWithTag:100]).image = blurredSnapshotImage;
            
        }
        else
        {
            ((UIImageView *)[controller.view viewWithTag:100]).image = snapshotImage;
        }
        
        // Be nice and clean your mess up
        UIGraphicsEndImageContext();
        
    }
    
}

@end