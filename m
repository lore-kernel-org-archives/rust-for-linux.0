MIME-Version: 1.0
Date: Sun, 29 Nov 2020 18:51:24 +0100
References: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
In-Reply-To: <aa2ff401-d552-fd46-b2c3-2058af8226c3@kloenk.de>
Message-ID: <CANiq72kKthjwUvBpHHPbhFsE555DriFVTtm2ziFTjwnPH_aA=A@mail.gmail.com>
Subject: Re: module as seperate crate
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
To: Finn Behrens <me@kloenk.de>
Cc: rust-for-linux@vger.kernel.org
List-ID: <rust-for-linux@vger.kernel.org>

On Sun, Nov 29, 2020 at 6:38 PM Finn Behrens <me@kloenk.de> wrote:
>
> What is the reason for module being an extra crate? I would have to run
> some generic setup code for kernel/printk, but as the module macro being
> from an extra crate, I cannot easily run some code there. Should we
> maybe move module into the kernel crate, to make this easier?

It is because it is a proc macro. Otherwise, if Rust supported proc
macros in the same crate, we could do it, yeah.

Cheers,
Miguel
