#import "CodeStatistics.h"

@interface CodeStatistics (Private) 
-(int) fileRowsWithName: (NSString *) n;
@end

@implementation CodeStatistics
-(id) initWithPath: (NSString *) p {
	NSAssert([p length] != 0, @"path can not be empty!");
	path = [p stringByExpandingTildeInPath];
	exts = [NSArray arrayWithObjects: @"c", @"cpp", @"h", @"m", @"cs", 
		@"java", @"php", @"go", @"asm", @"sql", @"html", @"htm", @"js", 
		@"css", @"aspx", @"master", @"ashx", @"asp", @"jsp", nil];
	count = 0;
	return self;
}

-(void) dealloc {
	[super dealloc];
}

-(void) enumerator {
	NSFileManager *manager = [NSFileManager defaultManager];
	NSDirectoryEnumerator *direnum = [manager enumeratorAtPath: path];
	NSString *filename ;
	int i;
    while ((filename = [direnum nextObject]) != nil) {
    	for (i = 0; i < [exts count]; i++) {
    		NSString* ext = [exts objectAtIndex:i];
    		if ([[filename pathExtension] isEqualToString:ext]) {
            	int cnt = [self fileRowsWithName:filename];
            	count += cnt;
            	printf("%s:%d\n",[filename UTF8String], cnt);
        	}
    	}
        
    }
}

-(int) fileRowsWithName: (NSString *) n {
	NSString *p;
	if ([path characterAtIndex:[path length] - 1] == '\\' || [path characterAtIndex:[path length] - 1] == '/' ) {
		p = [path stringByAppendingString: n];
		
	} else {
		p = [[path stringByAppendingString: @"\\"] stringByAppendingString: n];
	}
	NSString *str = [[NSString alloc] initWithContentsOfFile:p];
	int len = [str length];
	int cnt = 0;
	int i;

    for(i =0; i < len; i++)
    {
        char c = [str characterAtIndex:i];
        if (c == '\n') {
        	cnt++;
        }
    }

    if (len > 0 && [str characterAtIndex:len - 1] != '\n') {
    	cnt++;
    }

	[str release];
	return cnt;
}

-(int) count {
	return count;
}
@end
