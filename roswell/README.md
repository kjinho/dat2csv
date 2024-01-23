
## How to use Roswell to build and share binaries

From the project root:

Run as a script:

    chmod +x roswell/dat2csv.ros
    ./roswell/dat2csv.ros

Build a binary:

    ros build roswell/dat2csv.ros

and run it:

    ./roswell/dat2csv

Or install it in ~/.roswell/bin:

    ros install roswell/dat2csv.ros

It creates the binary in ~/.roswell/bin/
Run it:

    ~/.roswell/bin/dat2csv [name]~&

Your users can install the script with ros install jking/dat2csv

Use `+Q` if you don't have Quicklisp dependencies to save startup time.
Use `ros build --disable-compression` to save on startup time and loose on application size.


## See

- https://github.com/roswell/roswell/wiki/
- https://github.com/roswell/roswell/wiki/Reducing-Startup-Time
