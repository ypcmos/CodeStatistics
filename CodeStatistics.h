#import <Foundation/Foundation.h>

@interface CodeStatistics: NSObject
{
	NSString * path;
	NSArray * exts;
	int count;
}

-(id) initWithPath: (NSString *) p;

-(void) dealloc;

-(void) enumerator;

-(int) count;
@end
