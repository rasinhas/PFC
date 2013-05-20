//
//  ShowResultViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/8/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "ShowResultViewController.h"
#import "TDBadgedCell/TDBadgedCell.h"
#import "MapViewController.h"

@interface ShowResultViewController ()

@end

@implementation ShowResultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.resultsTable.delegate = self;
    self.resultsTable.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

// TODO : Melhorar
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([ self.results count] == 0) {
        return 100.0;
    }
    
    NSString *description = [[self.results objectAtIndex:indexPath.row] objectForKey:@"description"];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@":" options:NSRegularExpressionCaseInsensitive error:nil];
    NSInteger n = [regex numberOfMatchesInString:description options:0 range:NSMakeRange(0, [description length])];
    n = MAX(n, 4);
    return (n+1) * 50.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if ([self.results count] == 0) {
        return 1;
    }
    return [self.results count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"Results";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    TDBadgedCell *cell = (TDBadgedCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[TDBadgedCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    
    if ([self.results count] == 0) {
        
        cell.textLabel.text = @"Error";
        cell.detailTextLabel.text = @"No results found for your search";
        
    } else {
        
        cell.textLabel.text = [[self.results objectAtIndex:indexPath.row] objectForKey:@"name"];
        cell.detailTextLabel.text = [[self.results objectAtIndex:indexPath.row] objectForKey:@"description"];
        cell.textLabel.numberOfLines = 1;
        cell.detailTextLabel.numberOfLines = 0;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.badgeString = @"Map";
    }
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.results.count > 0)
    {
        MapViewController *map = [[MapViewController alloc] initWithNibName:@"MapViewController" bundle:nil];
        map.data = [self.results objectAtIndex:indexPath.row];
        [self presentViewController:map animated:YES completion:nil];
    }
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
