# Docker CTF

Super hacky dockerfile for that contains various tools that are useful for CTF challenges, especially binary exploitation / pwnable challanges.

## Running
`docker run -d --rm -v $PWD:/pwd --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -it ctf`
