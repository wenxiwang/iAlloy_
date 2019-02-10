open util/ordering [State] as so
open util/ordering [Mutex] as mo
pred test66 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process1->Mutex0 + State0->Process1->Mutex1 + State0->Process1->Mutex2 + State1->Process0->Mutex2 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State2->Process0->Mutex2 + State2->Process1->Mutex0
waits = State0->Process1->Mutex0 + State0->Process1->Mutex1 + State0->Process1->Mutex2 + State1->Process0->Mutex0 + State2->Process0->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State1,Process1,Mutex1,State2]
}}}
}
run test66 for 3 expect 1
pred test101 {
some disj Process0: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State2->Process0->Mutex0
no waits
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabOrRelease[]
}}}
}
run test101 for 3 expect 1
pred test4 {
some disj Process0: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process0->Mutex0 + State2->Process0->Mutex1 + State2->Process0->Mutex2
waits = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process0->Mutex0 + State2->Process0->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
}}}
}
run test4 for 3 expect 1
pred test48 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex1 + State0->Process0->Mutex2 + State0->Process1->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State1->Process1->Mutex0 + State2->Process1->Mutex0 + State2->Process1->Mutex1 + State2->Process1->Mutex2
waits = State0->Process0->Mutex0 + State1->Process1->Mutex1 + State2->Process1->Mutex0 + State2->Process1->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabMutex[State0,Process1,Mutex1,State1]
}}}
}
run test48 for 3 expect 0
pred test90 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process1->Mutex1 + State0->Process1->Mutex2 + State1->Process0->Mutex2 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process1->Mutex0 + State2->Process1->Mutex1 + State2->Process1->Mutex2
waits = State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex1 + State2->Process1->Mutex0 + State2->Process1->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State1,Process1,Mutex0,State0]
}}}
}
run test90 for 3 expect 0
pred test59 {
some disj Process0, Process1, Process2: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1 + Process2
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process1->Mutex1 + State0->Process2->Mutex0 + State0->Process2->Mutex1 + State0->Process2->Mutex2 + State1->Process0->Mutex0 + State1->Process2->Mutex1 + State1->Process2->Mutex2 + State2->Process0->Mutex0 + State2->Process1->Mutex0 + State2->Process2->Mutex1 + State2->Process2->Mutex2
waits = State0->Process2->Mutex0 + State0->Process2->Mutex1 + State0->Process2->Mutex2 + State1->Process1->Mutex0 + State2->Process0->Mutex0 + State2->Process1->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State2,Process2,Mutex0,State1]
}}}
}
run test59 for 3 expect 0
pred test22 {
some disj Process0: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2
waits = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabMutex[State2,Process0,Mutex0,State0]
}}}
}
run test22 for 3 expect 0
pred test96 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process1->Mutex0 + State0->Process1->Mutex1 + State0->Process1->Mutex2 + State1->Process0->Mutex1 + State1->Process1->Mutex0 + State1->Process1->Mutex2 + State2->Process0->Mutex1 + State2->Process1->Mutex0
waits = State0->Process1->Mutex0 + State0->Process1->Mutex1 + State0->Process1->Mutex2 + State1->Process0->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State1,Process1,Mutex2,State2]
}}}
}
run test96 for 3 expect 0
pred test13 {
some disj Process0: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process0->Mutex0 + State2->Process0->Mutex1 + State2->Process0->Mutex2
waits = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process0->Mutex0 + State2->Process0->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
IsFree[State2,Mutex2]
}}}
}
run test13 for 3 expect 0
pred test95 {
some disj Process0, Process1, Process2: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1 + Process2
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process2->Mutex0 + State0->Process2->Mutex1 + State0->Process2->Mutex2 + State1->Process1->Mutex0 + State1->Process2->Mutex1 + State1->Process2->Mutex2 + State2->Process0->Mutex1 + State2->Process1->Mutex0 + State2->Process2->Mutex1
waits = State0->Process2->Mutex0 + State0->Process2->Mutex1 + State0->Process2->Mutex2 + State1->Process1->Mutex0 + State2->Process1->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State1,Process2,Mutex2,State2]
}}}
}
run test95 for 3 expect 0
pred test20 {
some disj Process0: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process0->Mutex0 + State2->Process0->Mutex1
waits = State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process0->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabMutex[State2,Process0,Mutex2,State0]
}}}
}
run test20 for 3 expect 0
pred test64 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process1->Mutex1
waits = State0->Process0->Mutex0 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State2,Process1,Mutex1,State0]
}}}
}
run test64 for 3 expect 1
pred test49 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex2 + State0->Process1->Mutex0 + State0->Process1->Mutex1 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State1->Process1->Mutex0 + State2->Process0->Mutex1 + State2->Process0->Mutex2 + State2->Process1->Mutex0
waits = State0->Process0->Mutex0 + State1->Process0->Mutex2 + State2->Process1->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabMutex[State1,Process1,Mutex1,State2]
}}}
}
run test49 for 3 expect 0
pred test85 {
some disj Process0, Process1, Process2: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1 + Process2
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process1->Mutex2 + State0->Process2->Mutex1 + State1->Process0->Mutex0 + State1->Process2->Mutex1 + State2->Process2->Mutex0 + State2->Process2->Mutex1
waits = State2->Process0->Mutex0 + State2->Process1->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State2,Process2,Mutex0,State1]
}}}
}
run test85 for 3 expect 0
pred test63 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex2 + State0->Process1->Mutex0 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex2 + State2->Process1->Mutex0 + State2->Process1->Mutex2
waits = State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex2
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State2,Process1,Mutex2,State0]
}}}
}
run test63 for 3 expect 1
pred test104 {
some disj Process0: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
no holds
no waits
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabOrRelease[]
}}}
}
run test104 for 3 expect 1
pred test109 {
some disj Process0, Process1, Process2: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1 + Process2
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State1->Process1->Mutex1 + State1->Process2->Mutex1 + State2->Process1->Mutex2 + State2->Process2->Mutex1
waits = State1->Process2->Mutex0 + State1->Process2->Mutex1 + State2->Process2->Mutex0 + State2->Process2->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabOrRelease[]
}}}
}
run test109 for 3 expect 0
pred test72 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex0 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex0 + State2->Process1->Mutex0
waits = State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex0 + State2->Process0->Mutex1 + State2->Process0->Mutex2
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State2,Process1,Mutex0,State0]
}}}
}
run test72 for 3 expect 1
pred test120 {
some disj Process0, Process1, Process2: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1 + Process2
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State1->Process2->Mutex2 + State2->Process2->Mutex2
waits = State2->Process1->Mutex2
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ShowDijkstra[]
}}}
}
run test120 for 3 expect 0
pred test50 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex0 + State0->Process0->Mutex2 + State0->Process1->Mutex0 + State0->Process1->Mutex1 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex1
waits = State0->Process0->Mutex0 + State0->Process0->Mutex1 + State0->Process1->Mutex2 + State1->Process0->Mutex0 + State2->Process0->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabMutex[State2,Process1,Mutex2,State1]
}}}
}
run test50 for 3 expect 0
pred test84 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process1->Mutex0 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex0
waits = State0->Process0->Mutex0 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State1->Process1->Mutex2 + State2->Process0->Mutex0
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State0,Process1,Mutex0,State2]
}}}
}
run test84 for 3 expect 0
pred test93 {
some disj Process0, Process1, Process2: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1 + Process2
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex2 + State0->Process1->Mutex2 + State0->Process2->Mutex0 + State1->Process1->Mutex2 + State1->Process2->Mutex0 + State1->Process2->Mutex1 + State2->Process2->Mutex0 + State2->Process2->Mutex1 + State2->Process2->Mutex2
waits = State0->Process1->Mutex0 + State1->Process1->Mutex0 + State2->Process2->Mutex0 + State2->Process2->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State1,Process2,Mutex1,State0]
}}}
}
run test93 for 3 expect 0
pred test55 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process0->Mutex1 + State0->Process0->Mutex2 + State0->Process1->Mutex0 + State1->Process0->Mutex0 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process0->Mutex1 + State2->Process0->Mutex2 + State2->Process1->Mutex0
waits = State0->Process0->Mutex0 + State2->Process0->Mutex0 + State2->Process0->Mutex1 + State2->Process1->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
GrabMutex[State0,Process1,Mutex1,State2]
}}}
}
run test55 for 3 expect 0
pred test89 {
some disj Process0, Process1: Process {some disj Mutex0, Mutex1, Mutex2: Mutex {some disj State0, State1, State2: State {
Process = Process0 + Process1
Mutex = Mutex0 + Mutex1 + Mutex2
State = State0 + State1 + State2
holds = State0->Process1->Mutex1 + State1->Process1->Mutex0 + State1->Process1->Mutex1 + State2->Process1->Mutex0 + State2->Process1->Mutex1 + State2->Process1->Mutex2
waits = State0->Process0->Mutex1 + State0->Process0->Mutex2 + State1->Process0->Mutex1 + State1->Process0->Mutex2 + State2->Process1->Mutex0 + State2->Process1->Mutex1
so/first = State0
so/next = State0->State1 + State1->State2
mo/first = Mutex0
mo/next = Mutex0->Mutex1 + Mutex1->Mutex2
ReleaseMutex[State1,Process1,Mutex0,State0]
}}}
}
run test89 for 3 expect 1
