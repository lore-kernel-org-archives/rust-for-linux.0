Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDE7149C76
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 22:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716330124; cv=none; b=tPTEec2nn3oLmqvPw15WhGocFE8iRYvq2IVOttOjF2ycKgnKcAYF+SMh6eIpCK6B0KlxXdMw2L0MszrrO5hXxtWcvPgyLes3PrEpIbEa9d3/mPGssXLGb0s4zo/Py0zapUmeE0VQWV6zFWq5+QQF8lUg1xAU1UVSaG5W77/MTY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716330124; c=relaxed/simple;
	bh=B33NpZj7A4Jpnd3WPtDCjbiFKg0xjZhWM678GrOmcVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bKL5I+18kbHnOKmpvzsRnZ8IjV1iRUJpAq36qhmglgZm4HSsaM4sWi4QwKuPD4chVblnzyPidk6YFxtYYjeS1vBmssZx9z0k5JVuD4zEVORlTUeaNbiobXcf5003lGkwriikSBVw6H3LimSWgR5qf5h/GxK1eTJio2M/AGCrOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D0k6tuVK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D0k6tuVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716330120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9lGCV9DynKL+l6IUBXO0rFNHS3xcMsObVT0GprfTKc=;
	b=D0k6tuVK3EEkvg3XV/KHe2Q07gtcZ6o3BrcllrxXOsCPj8jxiHGrQFrUFwNlog/Dp92Ke+
	SKMone4IChZKhWZIMPaKaSLaHcAd8Kxu7cLiwU652fDk7aDgrJqCJJpt5Frausx39cwndF
	8xP4hfxphKlbtnvgkbsqVepT70wjdLw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-tPDOEaOEMqu5FZcNHTJZsA-1; Tue, 21 May 2024 18:21:59 -0400
X-MC-Unique: tPDOEaOEMqu5FZcNHTJZsA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-351bf7f7f73so5641059f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 15:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716330117; x=1716934917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G9lGCV9DynKL+l6IUBXO0rFNHS3xcMsObVT0GprfTKc=;
        b=fl2cu7TETqiL/JgUQMOHN9wG+Zy+Nk4uUxdiJinI6Lm59bazPTLbjrDf09LzR2OVNz
         nE5dswYhnEZ2oJCVkf1GFmKQ2c3LF3GH46sphO7g33GocnkfKrMcEDN2/01YxsR/Hv65
         fpaPIreueAljhKoM3zkFF/W/XDr6qhhcpINTe3hP2liAaOUSVi8EdUnuz2EF9EEhLyMT
         72Y86zr9pxpAGn9oFSF2ThO4gSVmA0Zg4vJGZzmaakL5bI3ER9G0ZCKd7QV7cbO6GkJc
         uzA3awuziKp1NSdO2RSBzm40zQvmeTxUhY5GTFgYMHBZFG8UMvaNf9bWzpP9zPm+bo8R
         ioYg==
X-Forwarded-Encrypted: i=1; AJvYcCVimYcgMdZwTIFWX9WGTNzpICHmdzsoWwoLd94ZvZxzabxofnVuDyUAuF8HrHKtuuNtzvV/5yksJOXrcRHdVtRDJDIUBhYQ+ANz5s4ovb0=
X-Gm-Message-State: AOJu0Yx5jvxdMb923xComKI3kNTYxNkNwAfDUpfsdfjqLt4J5SdhqSQ3
	Cx8gmLLrPv6UZr204muLypLmJvEmoCUUqpclNL2BZYBFX9QJ+zlsxuMtfGD6r9i0iruiVv5xOa4
	FuY/udm8CbArelHySSVf7e7uakt3qzMxwtO/LaMbgH6mF1XQlHdLZGUwQD84wGQ6u
X-Received: by 2002:adf:ead0:0:b0:34d:7def:a2 with SMTP id ffacd0b85a97d-354d8db77e6mr173942f8f.68.1716330117130;
        Tue, 21 May 2024 15:21:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtZ1m13WUzqUDB16RLcCkc2sUVtqW+/WkwZM1+nlNzIlERHgmd0D35igSK/PtSUitNk7azXw==
X-Received: by 2002:adf:ead0:0:b0:34d:7def:a2 with SMTP id ffacd0b85a97d-354d8db77e6mr173918f8f.68.1716330116546;
        Tue, 21 May 2024 15:21:56 -0700 (PDT)
Received: from pollux ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502b896ab0sm33075121f8f.41.2024.05.21.15.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 15:21:55 -0700 (PDT)
Date: Wed, 22 May 2024 00:21:53 +0200
From: Danilo Krummrich <dakr@redhat.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rafael@kernel.org, bhelgaas@google.com, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, airlied@gmail.com,
	fujita.tomonori@gmail.com, lina@asahilina.net, pstanner@redhat.com,
	ajanulgu@redhat.com, lyude@redhat.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [RFC PATCH 02/11] rust: add driver abstraction
Message-ID: <Zk0egew_AxvNpUG-@pollux>
References: <20240520172554.182094-1-dakr@redhat.com>
 <20240520172554.182094-3-dakr@redhat.com>
 <2024052045-lived-retiree-d8b9@gregkh>
 <ZkvPDbAQLo2/7acY@pollux.localdomain>
 <2024052155-pulverize-feeble-49bb@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2024052155-pulverize-feeble-49bb@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 21, 2024 at 11:35:43AM +0200, Greg KH wrote:
> On Tue, May 21, 2024 at 12:30:37AM +0200, Danilo Krummrich wrote:
> > On Mon, May 20, 2024 at 08:14:18PM +0200, Greg KH wrote:
> > > On Mon, May 20, 2024 at 07:25:39PM +0200, Danilo Krummrich wrote:
> > > > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > 
> > > > This defines general functionality related to registering drivers with
> > > > their respective subsystems, and registering modules that implement
> > > > drivers.
> > > > 
> > > > Co-developed-by: Asahi Lina <lina@asahilina.net>
> > > > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > > > Co-developed-by: Andreas Hindborg <a.hindborg@samsung.com>
> > > > Signed-off-by: Andreas Hindborg <a.hindborg@samsung.com>
> > > > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > ---
> > > >  rust/kernel/driver.rs        | 492 +++++++++++++++++++++++++++++++++++
> > > >  rust/kernel/lib.rs           |   4 +-
> > > >  rust/macros/module.rs        |   2 +-
> > > >  samples/rust/rust_minimal.rs |   2 +-
> > > >  samples/rust/rust_print.rs   |   2 +-
> > > >  5 files changed, 498 insertions(+), 4 deletions(-)
> > > >  create mode 100644 rust/kernel/driver.rs
> > > > 
> > > > diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
> > > > new file mode 100644
> > > > index 000000000000..e0cfc36d47ff
> > > > --- /dev/null
> > > > +++ b/rust/kernel/driver.rs
> > > > @@ -0,0 +1,492 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +
> > > > +//! Generic support for drivers of different buses (e.g., PCI, Platform, Amba, etc.).
> > > > +//!
> > > > +//! Each bus/subsystem is expected to implement [`DriverOps`], which allows drivers to register
> > > > +//! using the [`Registration`] class.
> > > 
> > > Why are you creating new "names" here?  "DriverOps" is part of a 'struct
> > > device_driver' why are you separating it out here?  And what is
> > 
> > DriverOps is a trait which abstracts a subsystems register() and unregister()
> > functions to (un)register drivers. It exists such that a generic Registration
> > implementation calls the correct one for the subsystem.
> > 
> > For instance, PCI would implement DriverOps::register() by calling into
> > bindings::__pci_register_driver().
> > 
> > We can discuss whether DriverOps is a good name for the trait, but it's not a
> > (different) name for something that already exists and already has a name.
> 
> It's a name we don't have in the C code as the design of the driver core
> does not need or provide it.  It's just the section of 'struct
> device_driver' that provides function callbacks, why does it need to be
> separate at all?

I'm confused by the relationship to `struct device_driver` you seem to imply.
How is it related?

Again, this is just a trait for subsystems to provide their corresponding
register and unregister implementation, e.g. pci_register_driver() and
pci_unregister_driver(), such that they can be called from the generic
Registration code below.

See [1] for an example implementation in PCI.

Please also consider that some structures might be a 1:1 representation of C
structures, some C structures are not required at the Rust side at all, and
then there might be additional structures and traits that abstract things C has
no data structure for.

This is due to the fact that 1. we're not replicating the functionality on the C
side, but only make use of it, and 2. we're trying to abstract existing code to
make it work with a conceptually different language. Which means, if you find
something that's not on the C side, it doesn't (necessarily) mean we're making
something up that should either not exist or be on the C side as well.

I'm not saying don't question it, I appreciate that, and it's even the whole
reason for sending this RFC, but I ask you to consider this fact. :)

[1] https://lore.kernel.org/rust-for-linux/20240520172554.182094-10-dakr@redhat.com/

> 
> > > 'Registration'?  That's a bus/class thing, not a driver thing.
> > 
> > A Registration is an object representation of the driver's registered state.
> 
> And that representation should not ever need to be tracked by the
> driver, that's up to the driver core to track that.

The driver doesn't need it, the Registration abstraction does need it. Please
see my comments below.

> 
> > Having an object representation for that is basically the Rust way to manage the
> > lifetime of this state.
> 
> This all should be a static chunk of read-only memory that should never
> have a lifetime, why does it need to be managed at all?

What I meant here is that if a driver was registered, we need to make sure it's
going to be unregistered eventually, e.g. when the module is removed or when
something fails after registration and we need to unwind.

When the Registration structure goes out of scope, which would happen in both
the cases above, it will automatically unregister the driver, due to the
automatic call to `drop()`.

> 
> > Once the Registration is dropped, the driver is
> > unregistered. For instance, a PCI driver Registration can be bound to a module,
> > such that the PCI driver is unregistered when the module is unloaded (the
> > Registration is dropped in the module_exit() callback).
> 
> Ok, that's fine, but note that your module_exit() function will never be
> called if your module_init() callback fails, so why do you need to track
> this state?  Again, C drivers never need to track this state, why is
> rust requiring more logic here for something that is NOT a dynamic chunk
> of memory (or should not be a dynamic chunk of memory, let's get it
> correct from the start and not require us to change things later on to
> make it more secure).

That's fine, if module_init() would fail, the Registration would be dropped as
well.

As for why doesn't C need this is a good example of what I wrote above. Because
it is useful for Rust, but not for C.

In Rust we get drop() automatically called when a structure is destroyed. This
means that if we let drivers put the Registration structure (e.g. representing
that a PCI driver was registered) into its `Module` representation structure
(already upstream) then this Registration is automatically destroyed once the
module representation is destroyed (which happens on module_exit()). This leads
to `drop()` of the `Registration` structure being called, which unregisteres the
(e.g. PCI) driver.

This way the driver does not need to take care of unregistering the PCI driver
explicitly. The driver can also place multiple registrations into the `Module`
structure. All of them would be unregistered automatically in module_exit().

> 
> > > And be very careful of the use of the word 'class' here, remember, there
> > > is 'struct class' as part of the driver model :)
> > 
> > I think in this context "class" might be meant as something like "struct with
> > methods", not sure what would be the best term to describe this.
> 
> "struct with methods" is nice :)

Great, I will change that.

> 
> Again, 'class' means something different here in the driver model, so be
> careful with terms, language matters, especially when many of our
> developers do not have English as their native language.
> 
> > > > +/// The registration of a driver.
> > > > +pub struct Registration<T: DriverOps> {
> > > > +    is_registered: bool,
> > > 
> > > Why does a driver need to know if it is registered or not?  Only the
> > > driver core cares about that, please do not expose that, it's racy and
> > > should not be relied on.
> > 
> > We need it to ensure we do not try to register the same thing twice
> 
> Your logic in your code is wrong if you attempt to register it twice,
> AND the driver core will return an error if you do so, so a driver
> should not need to care about this.

We want it to be safe, if the driver logic is wrong and registers it twice, we
don't want it to blow up.

The driver core takes care, but I think there are subsystems that do
initializations that could make things blow up when registering the driver
twice.

> 
> > , some subsystems might just catch fire otherwise.
> 
> Which ones?

Let's take the one we provide abstractons for, PCI.

In __pci_register_driver() we call spin_lock_init() and INIT_LIST_HEAD() before
driver_register() could bail out [1].

What if this driver is already registered and in use and we're randomly altering
the list pointers or call spin_lock_init() on a spin lock that's currently being
held?

[1] https://elixir.bootlin.com/linux/latest/source/drivers/pci/pci-driver.c#L1447

> 
> > > > +impl<T: DriverOps> Drop for Registration<T> {
> > > > +    fn drop(&mut self) {
> > > > +        if self.is_registered {
> > > > +            // SAFETY: This path only runs if a previous call to `T::register` completed
> > > > +            // successfully.
> > > > +            unsafe { T::unregister(self.concrete_reg.get()) };
> > > 
> > > Can't the rust code ensure that this isn't run if register didn't
> > > succeed?  Having a boolean feels really wrong here (can't that race?)
> > 
> > No, we want to automatically unregister once this object is destroyed, but not
> > if it was never registered in the first place.
> > 
> > This shouldn't be racy, we only ever (un)register things in places like probe()
> > / remove() or module_init() / module_exit().
> 
> probe/remove never calls driver_register/unregister on itself, so that's
> not an issue.  module_init/exit() does not race with itself and again,
> module_exit() is not called if module_init() fails.

That's clear, I should mention that we can use the Registration abstraction also
for things that are typically registered in probe(), a DRM device for instance.

As mentioned above I'm aware that module_exit() is not called when module_init()
fails, in this case the Registration structure is dropped in module_init(),
hence it's fine.

> 
> Again, you are adding logic here that is not needed.  Or if it really is
> needed, please explain why the C code does not need this today and let's
> work to fix that.

Please see above, where I start with "As for why doesn't C need this..".

> 
> > > > +        }
> > > > +    }
> > > > +}
> > > > +
> > > > +/// Conversion from a device id to a raw device id.
> > > > +///
> > > > +/// This is meant to be implemented by buses/subsystems so that they can use [`IdTable`] to
> > > > +/// guarantee (at compile-time) zero-termination of device id tables provided by drivers.
> > > > +///
> > > > +/// Originally, RawDeviceId was implemented as a const trait. However, this unstable feature is
> > > > +/// broken/gone in 1.73. To work around this, turn IdArray::new() into a macro such that it can use
> > > > +/// concrete types (which can still have const associated functions) instead of a trait.
> > > > +///
> > > > +/// # Safety
> > > > +///
> > > > +/// Implementers must ensure that:
> > > > +///   - [`RawDeviceId::ZERO`] is actually a zeroed-out version of the raw device id.
> > > > +///   - [`RawDeviceId::to_rawid`] stores `offset` in the context/data field of the raw device id so
> > > > +///     that buses can recover the pointer to the data.
> > > > +pub unsafe trait RawDeviceId {
> > > > +    /// The raw type that holds the device id.
> > > > +    ///
> > > > +    /// Id tables created from [`Self`] are going to hold this type in its zero-terminated array.
> > > > +    type RawType: Copy;
> > > > +
> > > > +    /// A zeroed-out representation of the raw device id.
> > > > +    ///
> > > > +    /// Id tables created from [`Self`] use [`Self::ZERO`] as the sentinel to indicate the end of
> > > > +    /// the table.
> > > > +    const ZERO: Self::RawType;
> > > 
> > > All busses have their own way of creating "ids" and that is limited to
> > > the bus code itself, why is any of this in the rust side?  What needs
> > > this?  A bus will create the id for the devices it manages, and can use
> > > it as part of the name it gives the device (but not required), so all of
> > > this belongs to the bus, NOT to a driver, or a device.
> > 
> > This is just a generalized interface which can be used by subsystems to
> > implement the subsystem / bus specific ID type.
> 
> Please move this all to a different file as it has nothing to do with
> the driver core bindings with the include/device/driver.h api.

I don't think driver.rs in an unreasonable place for a generic device ID
representation that is required by every driver structure.

But I'm also not overly resistant to move it out. What do you think would be a
good name?

Please consider that this name will also be the namespace for this trait.
Currently you can reference it with `kernel::driver::RawDeviceId`. If you move
it to foo.rs, it'd be `kernel::foo::RawDeviceId`.

> 
> Let's keep it simple and obvious please, and separate out things into
> logical chunks, hopefully in the same way that the C apis are separated
> out into.  That way we can properly review, understand, and most
> importantly for all of us, maintain the code over the next 40+ years.
> 
> thanks,
> 
> greg k-h
> 

