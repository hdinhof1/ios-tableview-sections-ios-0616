//
//  FISTableViewController.m
//  ios-tableview-sections
//
//  Created by Tom OMalley on 5/28/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISTableViewController.h"
#import "FISStudent.h"

@interface FISTableViewController ()

@end

@implementation FISTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FISStudent *studentOne = [[FISStudent alloc] initWithName:@"Henry" favoriteThings:@[@"baseball", @"soccer", @"kaskeset", @"game of thrones"]];
    FISStudent *studentTwo = [[FISStudent alloc] initWithName:@"Steve" favoriteThings:@[@"steve", @"steve", @"allen"]];
    FISStudent *studentThree = [[FISStudent alloc] initWithName:@"Claire" favoriteThings:@[@"riding bike around the city", @"sunshine", @"a glass of non-yellowtail wine with a great book"]];
    
    self.students = @[studentOne, studentTwo, studentThree];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //try using section# to set a different number of rows
    return section == 0 ? 4 : 3;
    //return 3;
}


/* Playing around with refactoring
 - (void)extractedSetCellToDisplayStudentsFavoriteThings {
    if (indexPath.section == 0) {
        FISStudent *one = self.students[0];
        cell.textLabel.text = one.favoriteThings[indexPath.row % one.favoriteThings.count ];
    }else if (indexPath.section == 1) {
        FISStudent *two = self.students[1];
        cell.textLabel.text = two.favoriteThings[favoriteItemIndex];
    }else if (indexPath.section == 2) {
        FISStudent *three = self.students[2];
        cell.textLabel.text = three.favoriteThings[favoriteItemIndex];
    }
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"expandingCell" forIndexPath:indexPath];
    
    FISStudent *currentStudent = self.students[(unsigned long)indexPath.section];
    NSUInteger favoriteItemNumber = indexPath.row % currentStudent.favoriteThings.count;
    cell.textLabel.text = currentStudent.favoriteThings[favoriteItemNumber];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)indexPath.row];
    // Configure the cell...
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return ((FISStudent *)self.students[section]).name;
}

-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 3;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
