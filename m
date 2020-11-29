Return-Path: <me@kloenk.de>
Subject: Re: module as seperate crate
References: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
 <CANiq72kKthjwUvBpHHPbhFsE555DriFVTtm2ziFTjwnPH_aA=A@mail.gmail.com>
 <cc71bee3-32e7-f3a5-8afa-a373438e5b36@kloenk.de>
 <d417fec0-c5c6-edda-796e-a861f5518eed@kloenk.de>
 <CANiq72negqN+2eOjieYW1Zas1ays3t3W-+wZisXjF9q=kob3yw@mail.gmail.com>
From: Finn Behrens <me@kloenk.de>
Message-ID: <6c621482-94c7-b34b-6d46-5036df3fc1ff@kloenk.de>
Date: Sun, 29 Nov 2020 19:30:04 +0100
MIME-Version: 1.0
In-Reply-To: <CANiq72negqN+2eOjieYW1Zas1ays3t3W-+wZisXjF9q=kob3yw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org
List-ID: <rust-for-linux@vger.kernel.org>

I create a static mut Mutex<&str> (or similar) to contain the pr_fmt
string. I cannot init the mutex in a const fn, and so I cannot create an
static mut value which already contains a mutex. So I have to call an
init_printk functions which creates this mutex. That's all what I'm doing.

Will try to get something working the following days, and then send a
patch. Mayebe easier to decide then.

Finn

On 11/29/20 7:26 PM, Miguel Ojeda wrote:
> On Sun, Nov 29, 2020 at 7:11 PM Finn Behrens <me@kloenk.de> wrote:
>> Found a way! proc_macro is just a tokenstream, which gets substituted.
>> So I can just write what I want there, and it works.
>>
>> I would start implementing a Mutex<T> type with const and non const
>> functions now.
> I am not sure I understand why you want the Mutex in the module crate
> -- the module crate is only used to generate boilerplate code that
> needs to go copy-pasted into every module.
>
> Cheers,
> Miguel
