(
var numOuts = 6;

var firstNote = 60;
var lastNote = 24;
var freqs = (Array.fill(numOuts-1, { |i| firstNote + Scale.lydian.degrees.wrapAt(i) }) ++ lastNote).midicps;
var positions = Array.fill(numOuts, { |i| 0 + (i * 2/numOuts) });

// server settings
s = Server.local;
s.options.numInputBusChannels_(0);
s.options.numOutputBusChannels_(numOuts);

// start with a really low volume. you never know with different audio interfaces
s.volume = -60;

s.waitForBoot({
    SynthDef(\soundcheck, { |out, pos, freq=200, amp=0.01|
        var sig = Saw.ar(freq, mul: amp);
        var env = EnvGen.kr(Env.perc(0.01, 0.8), doneAction: 2);
        var pan = PanAz.ar(numOuts, sig*env, pos, orientation: 0);
        Out.ar(out, pan);
    }).add;

    SynthDef(\soundcheck2, { |out, freq=200, amp=0.01|
        var sig = Saw.ar(freq, mul: amp);
        Out.ar(out, sig);
    }).add;

    Pbind(
        \instrument, \soundcheck,
        \amp, 0.5,
        \freq, Pseq(freqs, inf),
        \pos, Pseq(positions, inf),
        \delta, 1,
    ).play;

});

)
