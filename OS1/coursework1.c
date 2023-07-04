#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/miscdevice.h>
#include <linux/ioctl.h>


static int int_param1 = 0;
static int int_param2 = 0;
// Declare int_param1 as a module parameter of type int
module_param(int_param1, int, 0);
// Set int_param1 description to "An integer"
MODULE_PARM_DESC(int_param1, "An integer");
// Declare int_param2 as a module parameter of type int
module_param(int_param2, int, 0);
// Set int_param2 description to "An integer"
MODULE_PARM_DESC(int_param2, "An integer");

static struct miscdevice my_dev;

static int device_open(struct inode*, struct file*);
static int device_release(struct inode*, struct file*);
static long device_ioctl(struct file*, unsigned int cmd, unsigned long);

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


struct file_operations fops =
{
     // Set device owner
    .owner = THIS_MODULE,
    // Set open function
    .open = device_open,
    // Set release function
    .release = device_release,
    // Set unlocked ioctl function
    .unlocked_ioctl = device_ioctl

};



static int __init init_mod(void)
{
    int result;
  // Set minor of device to MISC_DYNAMIC_MINOR
    my_dev.minor = MISC_DYNAMIC_MINOR;
    // Give the device the name my_device
    my_dev.name = "my_device";
    // Set fops of device to fops
    my_dev.fops = &fops;
    // Set mode to allow all permissions
    my_dev.mode = S_IALLUGO;
    // Register the device getting the result
    result = misc_register(&my_dev);
    if (result) {
        printk(KERN_ERR "Creating device failed\n");
        return 0;
    }
    printk(KERN_INFO "Device %d created\n", my_dev.minor);
    return 0;
}




static void __exit exit_function(void)
{
    // Deregister the device
    misc_deregister(&my_dev);
    printk(KERN_INFO "Device removed\n");
}

static int device_open(struct inode *inode, struct file *file)
{
    printk(KERN_INFO "Device open function \n");
    return 0;
}

static int device_release(struct inode *inode, struct file *file)
{
    printk(KERN_INFO "Device release function \n");
    return 0;
}

static long device_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
{
    char *msg = "Hello, world!";
    
    int len = strlen(msg);
    
    

    switch (cmd)
    {
       // Respond to HELLO message
        case HELLO:
             printk(KERN_INFO "Hello,World!\n");
        // Respond to GOODBYE message
        case GOODBYE:
             printk(KERN_INFO"Goodbye, World!\n");
        // Respond to PRINT_1 message
        case PRINT_1:
             printk(KERN_INFO"Num1 = %d and Num1 increment by 1 is: %d\n", int_param1, int_param1+1);
        // Respond to PRINT_2 message
        case PRINT_2:
             printk(KERN_INFO"Num2 = %d and Num2 increment by 1 is: %d\n", int_param2, int_param2+1);

        // Respond to MY_WRITE message
        case MY_WRITE:
             printk(KERN_INFO "MY MODULE RECEIVED: Hello,World!  \n");

        // Respond to MY_READ message
        case MY_READ:
             printk(KERN_INFO "MY MODULE: %d and %d\n", int_param1, int_param2);
             copy_to_user((char*)arg, msg, len);
            
             
    }
    return 0;
 
}


// Set module initialisation function
module_init(init_mod);
// Set module exit function
module_exit(exit_function);

// Set module license to GPL
MODULE_LICENSE("GPL");
// Set module author
MODULE_AUTHOR("Nouha Lamrani ");
// Set module description
MODULE_DESCRIPTION("A simple module");
