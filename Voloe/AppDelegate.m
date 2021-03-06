//
//  AppDelegate.m
//  Voloe
//
//  Created by Jeremy Moyers on 8/15/14.
//  Copyright (c) 2014 Jeremy Moyers. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "VLColorManager.h"

#import "AWSCore.h"
#import "Cognito.h"

@interface AppDelegate ()
@property (nonatomic, strong) MMDrawerController *drawerController;
@end

@implementation AppDelegate

- (BOOL) application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];

    UINavigationController *centerController = [storyboard instantiateViewControllerWithIdentifier:@"LoungeNavController"];
    
    UINavigationController *rightController = [storyboard instantiateViewControllerWithIdentifier:@"RightNavController"];
    
    self.drawerController = [[MMDrawerController alloc] initWithCenterViewController:centerController rightDrawerViewController:rightController];
    
    [[self drawerController] setMaximumRightDrawerWidth:200.0];
    [[self drawerController] setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [[self drawerController] setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    
    
    //obtain AWS credentials
    AWSCognitoCredentialsProvider *credentialsProvider = [AWSCognitoCredentialsProvider
                                                          credentialsWithRegionType:AWSRegionUSEast1
                                                          accountId:@"603022141290"
                                                          identityPoolId:@"us-east-1:e8fc3065-e3f5-41c4-a3ed-998ee4d1c645"
                                                          unauthRoleArn:@"arn:aws:iam::603022141290:role/Cognito_voloe_com_v3Unauth_DefaultRole"
                                                          authRoleArn:@"arn:aws:iam::603022141290:role/Cognito_voloe_com_v3Auth_DefaultRole"];
    
    AWSServiceConfiguration *configuration = [AWSServiceConfiguration configurationWithRegion:AWSRegionUSWest1
                                                                          credentialsProvider:credentialsProvider];
    
    [AWSServiceManager defaultServiceManager].defaultServiceConfiguration = configuration;
    

    /*
    AWSCognito *syncClient = [AWSCognito defaultCognito];
    AWSCognitoDataset *dataset = [syncClient openOrCreateDataset:@"myDataset"];
    [dataset setString:@"myValue" forKey:@"myKey"];
    [dataset synchronize];
    */
    //initialize color manager
    VLColorManager *colorManager = [VLColorManager sharedInstance];
    [colorManager setColor:UIColorFromRGB(0x3D454F) forKey:@"DrawerHeader"];
    [colorManager setColor:UIColorFromRGB(0xDDEEFF) forKey:@"DrawerHeaderText"];
    [colorManager setColor:UIColorFromRGB(0x5D656F) forKey:@"DrawerCellBG"];
    [colorManager setColor:UIColorFromRGB(0x222222) forKey:@"DrawerCellSelectedBG"];
    [colorManager setColor:UIColorFromRGB(0xFFFFFF) forKey:@"ListItemGridViewBG"];
    [colorManager setColor:[UIColor lightGrayColor] forKey:@"ListItemGridViewSelectedBG"];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                UIColorFromRGB(0x00aabc),NSForegroundColorAttributeName,
                                nil];

    
    //Set up application appearance
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    //[[UIBarButtonItem appearance] setTitleTextAttributes:attributes
                                               // forState:UIControlStateNormal];
    
    [[self window] setRootViewController:[self drawerController]];
    [[self window] makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
