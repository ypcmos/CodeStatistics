#import "CodeStatistics.h"

int main(int argc, char * argv[]) {
	if (argc < 2) {
		return 1;
	}
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	CodeStatistics * cs = [[CodeStatistics alloc] initWithPath: [NSString stringWithUTF8String:argv[1]]];
	[cs enumerator];
	printf("Rows count:%d", [cs count]);
	[pool release];
	return 0;
}
