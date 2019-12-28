#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    FILE * f;
    FILE * fs;
    float left, right, top, bot, Aspect_Ratio, normalizar, Width, y0;
    int c, fall;
    char path[20];
    
    f=fopen(argv[1],"r");
    fs = fopen(argv[2],"w");
    
    while(1)
    {
        c = fscanf(f, "%d %f %f %f %f", &fall, &left, &right, &top, &bot);
        if(c<0)
            break;
        if(fall != 0)
        {
            Aspect_Ratio = (right-left)/(bot-top);
            Aspect_Ratio = Aspect_Ratio / 10;
            Width = (right-left)/640;
            y0 = 1-bot/480;
    
            fprintf(fs, "%d 1:%f 2:%f 3:%f\n", fall, Aspect_Ratio, Width, y0);
        }
	}	
    fclose(f);
    fclose(fs);
    return 0;
}
