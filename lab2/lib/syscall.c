#include "lib.h"
#include "types.h"
#include <stdarg.h>
/*
 * io lib here
 * 库函数写在这
 */
void printc(const char c);
void prints(const char *s);
void printd(int d);
void printx(unsigned int x);

int32_t syscall(int num, uint32_t a1,uint32_t a2,
		uint32_t a3, uint32_t a4, uint32_t a5)
{
        uint32_t ret = 0;
	
	/* 内嵌汇编 保存 num, a1, a2, a3, a4, a5 至通用寄存器*/
	
	asm volatile("int $0x80":"=a"(ret):"a"(num),"b"(a1),"c"(a2),"d"(a3),"D"(a4),"S"(a5));

	return ret;
}
char res[1000];
int pos = 0;
void printf(const char *format,...){
	va_list ap;
	pos = 0;
	va_start(ap, format);//mov address of format to ap
	while(*format != '\0') {
		if(*format != '%') 
			res[pos++] = *format;
		else {
			format++;
			switch(*format)	{
				case 'c': {
					char ch = va_arg(ap, int);
					printc(ch);
					  }	
					break;
		       		case 's': {
					char *s = va_arg(ap, char *);
					prints(s);
					  }
					break;
				case 'd': {
					int d = va_arg(ap, int);
					printd(d);
					  }
					 break;
				case 'x': {
					unsigned int x = va_arg(ap, int);
					printx(x);
					  }
					 break;
				default:
					 break;
			}
		}
		format++;
	}
	res[pos] = *format;					
	syscall(4, 1, (uint32_t)res, pos + 1, 0, 0);		
	va_end(ap);
}
		

//char r[1000];
//int i = 0;

void printc(const char c) {
	res[pos++] = c;
	//syscall(4, 1, (uint32_t)&c, 1, 0, 0);
	//return;
}

void prints(const char* s) {
	int si = 0;
	while(s[si] != '\0') {
		printc(s[si]);
		si++;
	}
}

void printd(int d) {
    char buf[100];
    if (d == 0) {
        printc('0');
        return;
    }
    if (d < 0) {
	if(d == -2147483648) {
	    prints("-2147483648");
	    return;
	}
        printc('-');
        d = -d;
    }
    int temp = d, count = 0;
    while(temp) {
	count++;
	temp /= 10;
    }
    buf[count] = '\0';
    count--;
    while(d) {
	    buf[count--] = d%10 + '0';
	    d /= 10;
    }
    prints(buf);
}

void printx(unsigned int x) {
    char buf[100];
    if (x == 0) {
	printc('0');
	return;
    }
    unsigned int temp = x;
    int count = 0;
    while(temp) {
	count++;
	temp /= 16;
    }
    buf[count] = '\0';
    count--;
    while(x) {
	    if(x%16 < 10)
	    	buf[count--] = x%16 + '0';
	    else
		buf[count--] = x%16 - 10 + 'a';
	    x /= 16;
    }
    prints(buf);
}

/*
void printx(unsigned int x) {
	if(x == 0) {
		//printc('0');
		return;
	}
	printx(x/16);
	x%=16;
	if(x < 10)
		printc(x%16 + '0');
	else
		printc(x%16 - 10 + 'a');
}

	

void printf(const char *format,...){
	va_list ap;
	i = 0;
	va_start(ap, format);
	while(*format) {
		if(*format != '%')
		{
			//r[i++] = *format;
			printc(*format);
			format++;
		}
		else {
			format++;
			switch(*format){
			case 'c': printc(va_arg(ap, int));break;
		       	case 's': prints(va_arg(ap, char*));break;
			case 'd': 
				  if(!va_arg(ap, int))
					  printc('0');
				  else
				  	printd(va_arg(ap, int)); 
				  break;
			case 'x': 
				  if(!va_arg(ap, int))
					  printc('0');
				  else
				  	printx(va_arg(ap, int));
				  break;
			default:break;
			}
			format++;
		}
	}
	//r[i] = *format;					
	va_end(ap);
	int len = i + 1;
	syscall(4, 1, (uint32_t)r, len, 0, 0);		
}
*/		
