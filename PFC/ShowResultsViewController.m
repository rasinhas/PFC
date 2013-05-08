//
//  ShowResultsViewController.m
//  PFC
//
//  Created by Felipe Rasinhas on 5/7/13.
//  Copyright (c) 2013 Felipe Rasinhas. All rights reserved.
//

#import "ShowResultsViewController.h"
#import "TDBadgedCell/TDBadgedCell.h"
#import "MapViewController.h"

@interface ShowResultsViewController ()

@end

@implementation ShowResultsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *test = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"Vialink", @"name",
                          @"Empresa: legal\nJonis: kibe\nTipo: merda\nComida: salgadinho\na:b\nc:d\ne:f\n", @"description",
                          @"-22.925657", @"latitude",
                          @"-43.240798", @"longitude",
                          nil];
    self.results = [[NSArray alloc] initWithObjects:test, nil];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *description = [[self.results objectAtIndex:indexPath.row] objectForKey:@"description"];
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@":" options:NSRegularExpressionCaseInsensitive error:nil];
    NSInteger n = [regex numberOfMatchesInString:description options:0 range:NSMakeRange(0, [description length])];
    n = MAX(n, 4);
    return (n+1) * 20.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (self.results.count == 0) {
        return 1;
    }
    return self.results.count;
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
    
    if (self.results.count == 0) {
        
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
