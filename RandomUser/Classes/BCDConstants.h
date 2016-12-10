//
//  BCDConstants.h
//  Pods
//
//  Created by Brandt Daniels on 12/9/16.
//
//

#ifndef BCDConstants_h
#define BCDConstants_h

static NSString *const BCDRandomUserAPIOneHundredResultsFilter = @"results=100";

#define FILTERED_PATH(path, filter) [NSString stringWithFormat:@"%@?%@", path, filter]

static NSString *const BCDRandomUserAPIResultsKey = @"results";


#endif /* BCDConstants_h */
