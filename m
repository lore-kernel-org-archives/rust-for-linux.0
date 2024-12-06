Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993151EF097
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478040; cv=none; b=s2zVANe7Hq3o8NeWQ1vCPym7pPHWvlVKR7JTYGNYl9iPctsmy6eDzw2h6BIGeeseTIh4RdyIlQjKb1Ge/pqVVappo1fRiL6LFZwqh5ZvWMVYBAJ5jVPu0D5u+29vBGmsVTijtLY6cbKhoHENwzKSgdlRMtltuym+g7xfMoWd1iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478040; c=relaxed/simple;
	bh=TWS54qtWOUt4tbtkhVNM5u8s8m+lfvjSfdulgwfehLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhZ9bNIaVSqY6g+RC7rLDyKEx5jsXoNK4hv2N3qNdHcPGkArmV3hXjJwI39h4BeHQY016rpuXu4vs2mJt8Jt9qhlUKvjOzq6KxqsoXbDeMVo/0EWOzhBSd2J+0Vt5KRnVxHwJ1SRCf+0n4XwJ2zlAoZN7JZZRatiAIe94+l/vFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EVoth1r+; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EVoth1r+"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4349f160d62so12912675e9.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 01:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733478036; x=1734082836; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roDsf5JZ69Vb0EVMiFOCplKdqH1R39suO8gspINBAFY=;
        b=EVoth1r+EngQHyeBKzqdF2ba4dNWoeWjblIfn+14BjwS66sBNHaZ8DiYRoDrvrRmNj
         wQliKUTfzWAk0ZK/0/4klWu1qQhY0OszO5LciQYmCkCmoMyLaGRKqzadAE0gKVPN/4Yn
         CbGPdlDx01xphe4bWdi3e6W5CCGh+8DBLGiYrjBUM8mWkFSfxORWOhLpW2TgZ8qsvm6+
         BT0Zu/Ax+ZVIOIq9dg8pwm/dX+HAB6hKL8uxrCD+g5aEDkoeS+kpXvSl0O8eJih7oxEn
         +n7Gtp/lbWozq5PEl63o9ychjckhj46sNvpoK0EQNDdQuq5ZcnlL65xOxCbVj5nQxY8Y
         8BqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478036; x=1734082836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roDsf5JZ69Vb0EVMiFOCplKdqH1R39suO8gspINBAFY=;
        b=JFx5u32gQb+KLqGDGQ+WOSCLrgbqXKQUe21KXe69HaLNPwUcgwvwmWL/F6REYFGOUf
         LKR0xGbRen2jPwhmF66ym1m6ol/QQecFmTfwRwjqnSb3RAbP+tS8ShiaT17CmODCHgK8
         VQ1sPdnt8jjuK5v9G1jtkXoxsQkgCGyDcSFufgzZNDCqcYTG5Ovk7VyDK5SVEXnAh81R
         yLhakdQsgRJ3mSJEsVS2GQ1Ue7Is6bCqMCpiOWut88RAsmv5/KVig4QH++9DP4lXCEFa
         EDUCHVOz1rx//EK9j+BiPJwtnU6PryRjeip/cBCa56KP/JY6pil5sIY1pQu307i1UFin
         Z1HA==
X-Forwarded-Encrypted: i=1; AJvYcCUG8slql2gg0z1bzEkPpIdQX807OyYI1QgNaOVrVaV/T/LDmObN0iy7//M5uUlmMv5o6qa8OkItZsEuZbChEg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPx5lbRI3mgDMbda0NBaFZFJcesW4M/G1jTycbEZo1uSRZ8AT2
	ITh1wJ59TyaX+v5BbwIz7SAwuYuKNm1GDJ0T9edzcVjwPH5n6O1gV/VkzTrBaYEUFOD4ZS8w0va
	kH6rlEkf+KTY5GmGoVzUZtxS9QKeAlqw3Z7mi
X-Gm-Gg: ASbGnctmOn3kIX4hnFhRdIogAQwjc8XpH9wGjgt/rAFqz1vy5o1pvf9qNoqi76YflNn
	kS66CDwItHL8+7p/UIIZOu3vP6mUlpPLZ
X-Google-Smtp-Source: AGHT+IFsWWSvAWLzPdhJb+M+fGJXNYBcqly8mjWF2TdF0iIoCLduCHfJWFjNVoFpOFvhxKnrXSbxSDlzlgGS+l5y3wE=
X-Received: by 2002:a05:600c:450b:b0:434:a7b6:10e9 with SMTP id
 5b1f17b1804b1-434ddeb9b73mr22189395e9.17.1733478035843; Fri, 06 Dec 2024
 01:40:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206090515.752267-1-lee@kernel.org> <20241206090515.752267-5-lee@kernel.org>
 <Z1LD42UsCvtAhluY@pollux>
In-Reply-To: <Z1LD42UsCvtAhluY@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 10:40:23 +0100
Message-ID: <CAH5fLghS+foEe7mFVDpr+AbHkQmdkx-EH0jnq2SzH+rYQPiS2A@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] samples: rust: Provide example using the new Rust
 MiscDevice abstraction
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 10:29=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri, Dec 06, 2024 at 09:05:06AM +0000, Lee Jones wrote:
> > This sample driver demonstrates the following basic operations:
> >
> > * Register a Misc Device
> > * Create /dev/rust-misc-device
> > * Provide open call-back for the aforementioned character device
> > * Operate on the character device via a simple ioctl()
> > * Provide close call-back for the character device
> >
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > ---
> >  samples/rust/Kconfig             | 10 ++++
> >  samples/rust/Makefile            |  1 +
> >  samples/rust/rust_misc_device.rs | 80 ++++++++++++++++++++++++++++++++
> >  3 files changed, 91 insertions(+)
> >  create mode 100644 samples/rust/rust_misc_device.rs
> >
> > diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
> > index b0f74a81c8f9..df384e679901 100644
> > --- a/samples/rust/Kconfig
> > +++ b/samples/rust/Kconfig
> > @@ -20,6 +20,16 @@ config SAMPLE_RUST_MINIMAL
> >
> >         If unsure, say N.
> >
> > +config SAMPLE_RUST_MISC_DEVICE
> > +     tristate "Misc device"
> > +     help
> > +       This option builds the Rust misc device.
> > +
> > +       To compile this as a module, choose M here:
> > +       the module will be called rust_misc_device.
> > +
> > +       If unsure, say N.
> > +
> >  config SAMPLE_RUST_PRINT
> >       tristate "Printing macros"
> >       help
> > diff --git a/samples/rust/Makefile b/samples/rust/Makefile
> > index c1a5c1655395..ad4b97a98580 100644
> > --- a/samples/rust/Makefile
> > +++ b/samples/rust/Makefile
> > @@ -2,6 +2,7 @@
> >  ccflags-y +=3D -I$(src)                                # needed for tr=
ace events
> >
> >  obj-$(CONFIG_SAMPLE_RUST_MINIMAL)            +=3D rust_minimal.o
> > +obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)                +=3D rust_misc_de=
vice.o
> >  obj-$(CONFIG_SAMPLE_RUST_PRINT)                      +=3D rust_print.o
> >
> >  rust_print-y :=3D rust_print_main.o rust_print_events.o
> > diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_=
device.rs
> > new file mode 100644
> > index 000000000000..3837532d259e
> > --- /dev/null
> > +++ b/samples/rust/rust_misc_device.rs
> > @@ -0,0 +1,80 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +// Copyright (C) 2024 Google LLC.
> > +
> > +//! Rust misc device sample.
> > +
> > +use kernel::{
> > +    c_str,
> > +    ioctl::_IO,
> > +    miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration=
},
> > +    prelude::*,
> > +};
> > +
> > +const RUST_MISC_DEV_HELLO: u32 =3D _IO('|' as u32, 9);
> > +
> > +module! {
> > +    type: RustMiscDeviceModule,
> > +    name: "rust_misc_device",
> > +    author: "Lee Jones",
> > +    description: "Rust misc device sample",
> > +    license: "GPL",
> > +}
> > +
> > +struct RustMiscDeviceModule {
> > +    _miscdev: Pin<KBox<MiscDeviceRegistration<RustMiscDevice>>>,
> > +}
> > +
> > +impl kernel::Module for RustMiscDeviceModule {
> > +    fn init(_module: &'static ThisModule) -> Result<Self> {
> > +        pr_info!("Initialising Rust Misc Device Sample\n");
> > +
> > +        let options =3D MiscDeviceOptions {
> > +            name: c_str!("rust-misc-device"),
> > +        };
> > +
> > +        Ok(Self {
> > +            _miscdev: KBox::pin_init(
> > +                MiscDeviceRegistration::<RustMiscDevice>::register(opt=
ions),
> > +                GFP_KERNEL,
> > +            )?,
> > +        })
>
> Since this v4 was sent just when I was commenting on v3:
>
> Why do we add examples where we ask people to allocate those structures w=
ith
> kmalloc()?
>
> `MiscDevice` should switch to the generic `Registration` type in [1] and =
use
> `InPlaceModule`, such that those structures land in the .data section of =
the
> binary.
>
> [1] https://lore.kernel.org/rust-for-linux/20241205141533.111830-3-dakr@k=
ernel.org/
>
> > +    }
> > +}
> > +
> > +struct RustMiscDevice;
> > +
> > +#[vtable]
> > +impl MiscDevice for RustMiscDevice {
> > +    type Ptr =3D KBox<Self>;
> > +
> > +    fn open() -> Result<KBox<Self>> {
> > +        pr_info!("Opening Rust Misc Device Sample\n");
>
> This should be `dev_info!`, but I see why you don't have access to the de=
vice
> structure here...
>
> @Greg: How do miscdev drivers do this in C? I looked at a couple of them,=
 but
> all of those seem to use pr_* macros. They can't get the device pointer f=
rom
> the inode or file pointer.
>
> However, C drivers could refer to the struct miscdevice directly since it=
's
> almost always a static variable in the file scope.
>
> In Rust we do the static allocation part with `InPlaceModule` as mentione=
d
> above. However, this still doesn't let us refer to the underlying struct
> miscdevice.
>
> This all would be much cleaner if there'd be a "fake" probe() callback fo=
r a
> struct miscdevice. This way we could perfectly align the miscdevice abstr=
action
> with the abstractions for all other drivers, such as PCI, platform, etc.

It turns out that the file private data is a pointer to the `struct
miscdevice` in fops->open(), so we can access it in open. To access it
in other fops hooks, we need to take a refcount on the device in open
and stash it.

Alice
