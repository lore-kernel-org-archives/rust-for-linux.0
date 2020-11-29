Return-Path: <me@kloenk.de>
Subject: Re: module as seperate crate
References: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
 <CANiq72kKthjwUvBpHHPbhFsE555DriFVTtm2ziFTjwnPH_aA=A@mail.gmail.com>
From: Finn Behrens <me@kloenk.de>
Message-ID: <cc71bee3-32e7-f3a5-8afa-a373438e5b36@kloenk.de>
Date: Sun, 29 Nov 2020 18:54:43 +0100
MIME-Version: 1.0
In-Reply-To: <CANiq72kKthjwUvBpHHPbhFsE555DriFVTtm2ziFTjwnPH_aA=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org
List-ID: <rust-for-linux@vger.kernel.org>

Oh, I see the problem. Ok, will try some more on how to create a mutex
value.

I'm currently trying to implement pr_*.

As we cannot define stuff easily, I would create a set_pr_fmt macro,
which stores some fmt info globaly. This is where I would like to use a
mutex.


Finn

On 11/29/20 6:51 PM, Miguel Ojeda wrote:
> On Sun, Nov 29, 2020 at 6:38 PM Finn Behrens <me@kloenk.de> wrote:
>> What is the reason for module being an extra crate? I would have to run
>> some generic setup code for kernel/printk, but as the module macro being
>> from an extra crate, I cannot easily run some code there. Should we
>> maybe move module into the kernel crate, to make this easier?
> It is because it is a proc macro. Otherwise, if Rust supported proc
> macros in the same crate, we could do it, yeah.
>
> Cheers,
> Miguel
