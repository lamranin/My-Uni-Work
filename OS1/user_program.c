#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <unistd.h>

// Define the HELLO message
#define HELLO _IO('x', 0)
// Define the GOODBYE message
#define GOODBYE _IO('x', 3)
// Define the PRINT_1 message
#define PRINT_1 _IO('x', 4)
// Define the PRINT_2 message
#define PRINT_2 _IO('x', 5)
// Define the MY_WRITE message
#define MY_WRITE _IOW('x', 1, unsigned long)
// Define the MY_READ message
#define MY_READ _IOR('x' , 2, char*)
int main(int argc, char **argv)
{
    int fd;
    char *str[80];
    // Open thedevice in O_RDWR mode
    fd = open("/dev/my_device", O_RDWR);
    ioctl(fd, MY_WRITE, 54u);
    ioctl(fd, MY_READ,str);
    // Use ioctl to send different messages
    printf("Enter a command ");
    int a;
    scanf("%d", &a );
    if (a == 1){
        ioctl(fd, HELLO);
    } 
    else if (a == 2){
        ioctl(fd, GOODBYE);
    }
    else if (a == 3){
        ioctl(fd, PRINT_1);
    }
    else if (a == 4){
        ioctl(fd, PRINT_2);
    }
 
    else {
        printf("Error command, please try again\n" );
    }
    printf("Received %s from driver\n", str); 
    // Close the device
    close(fd);
    return 0;
}