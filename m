Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3D11F9F7D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 13:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736343771; cv=none; b=PudBCTbY2SsK7W13Ma+ZHCAmYN89GL3S4apg6gIDeslb3MczCU25xFdtH+UOlUjzB/3Ms3TE5TW3NJNtUnFm0G+RdySuwDnAuurwpB3DvvUKxdh/Pm17f463s/i4gPTkVk2IhWvUhwl660f91b+HC74mStF+2zolz/DAoxXPfs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736343771; c=relaxed/simple;
	bh=MRpq/+SA7iXM6RcBC1IgyGCkzCP4QQ2/TD8XNnMatBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=fmjOVZPN8fijg3ZgVRpRNwRIRYS0sYO5RLtduc/o9EfVidcf6h2R/NJPhNvnommeWwe5i35FvhcCZe7BfZrbhJNVIp2570887Sul+PVmR3mydKGUQwdioNho3N/6hkn6ljjXHHZooT6ULDP5QoVmcu4qEgVL+Mrgy/JRymXE9f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fHR9UUtJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fHR9UUtJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736343768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ihvbv82+RdRwTRUbUOAT3MrioMMatOFaSAlH7HGxVM=;
	b=fHR9UUtJSlwhW8vZsKKNcx64etAcR6iCA45SjEJoKckKgtnyKZe04LeWHCChUUPenhH7IK
	By7ClTemwUvk4aVYm5KhuwNJaxQUHakM0dzlju4Wk5zoXHDzUJiw/GRpdzg7DH8nocaYnY
	u2dQrgLhhlJyLoFw8joc3Qu1bpmiX5w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-i4ZyEz66ODq1mq8ZawToNQ-1; Wed, 08 Jan 2025 08:42:47 -0500
X-MC-Unique: i4ZyEz66ODq1mq8ZawToNQ-1
X-Mimecast-MFC-AGG-ID: i4ZyEz66ODq1mq8ZawToNQ
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385e03f54d0so7580230f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 05:42:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736343766; x=1736948566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ihvbv82+RdRwTRUbUOAT3MrioMMatOFaSAlH7HGxVM=;
        b=rohTUWJPMoBn+0sJ8ALDwoSlR/gDkS9B9nh1z9mau3EHCCO2DSKtI0+bH5bXFsiXiu
         vvKDTYHtt7t8qGqRA/mcHwPaAcUDQ5lvxPSGqgdlS5M9mJE6SegmevbnqO3suxJOVL39
         GKUwayu8bq2arcakIq6u0Y6pIpXzGWc1fjGeoLzbk3+tplLW0UOxhlu8ep92RdtyKFMh
         iaeyBY8L2/DrfcOsA2T3RNA5j4rz6C2PVsKAdzS5c6Iz7/EBV9AkIiqfxxLETe0MZmR3
         9dOtUBYTYbx5klBohE32N5VsFq8rqV4xh6Sxc2rZ1ggU5KathTyPgg3AdogFT6wkQUxp
         Ixiw==
X-Forwarded-Encrypted: i=1; AJvYcCXbMw4vsqrMcqPOMDnqOmMi+u496KG9to5wKcCON/lQWfLBg2LTJdlXBbuZT8U1HbrC1g/eP4FGD83S8EGtWg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy/JMQ0tNi6Mx4zwYrz4Ivl9cJ8KfQvW8D5p0zAQkZEq1yiR1n
	oCo6iZUl3QpOH6Xp4u9l50vtAO056h4D2dlA0KyXBFyb2jCNHUW7LygG5R3ql9aPNJIEK9q7UeC
	7DvNrL2NpENZPuC+wjuZrH3PkUyZomJmg824h94E8G4WxM3qhEK0dwEwOgmlf1IA+
X-Gm-Gg: ASbGncsybR9hkehE13VSIZk2485CY4FPxbDUsB7pn+MOqC6xdhGptoXf1lUQ8jy8yyw
	Ovd4A9JF9QGtuGweB5uAIuX0/tl5PKecD8Az6+P+FLeQIqqPpaDeNaoopkMGFNCYIRBFvh4xo6o
	wvSFdILH2yc6ou34n92TN5H69cQJrJkGZoTaF090Cy2EBb4ecEXYfzmo+caXjzB7OYYZNMAyfc5
	3oxZoYWnRC5WVmfBUnr+OUDLeHvKbJER8OvRh/BjRG0tw==
X-Received: by 2002:a05:6000:18ac:b0:385:ef39:6cd5 with SMTP id ffacd0b85a97d-38a872f6ed5mr2475720f8f.1.1736343766215;
        Wed, 08 Jan 2025 05:42:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5Ck6Qa9Y/G4V6PSLpc+GPlb+MkstmuA44/qCtdLMqpRoYijty1LnDRVFQARcJyuTB9SaxCQ==
X-Received: by 2002:a05:6000:18ac:b0:385:ef39:6cd5 with SMTP id ffacd0b85a97d-38a872f6ed5mr2475681f8f.1.1736343765655;
        Wed, 08 Jan 2025 05:42:45 -0800 (PST)
Received: from pollux ([2a00:79c0:618:8300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8475cesm52644149f8f.57.2025.01.08.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 05:42:45 -0800 (PST)
Date: Wed, 8 Jan 2025 14:42:42 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V6 04/15] rust: device: Add few helpers
Message-ID: <Z36A0g9g6qkRZSjh@pollux>
References: <cover.1736248242.git.viresh.kumar@linaro.org>
 <429b7539f787ad360cd28fd1db6dc3d6c1fe289d.1736248242.git.viresh.kumar@linaro.org>
 <2025010734-march-cultivate-bd96@gregkh>
 <20250108110242.dwhdlwnyjloz6dwb@vireshk-i7>
 <2025010835-uncover-pamphlet-de5b@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <2025010835-uncover-pamphlet-de5b@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FsgjeoiUEFr9-0OF1YNEabtoy-afiQ12IVNzo_HM_YY_1736343766
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 08, 2025 at 12:52:54PM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jan 08, 2025 at 04:32:42PM +0530, Viresh Kumar wrote:
> > On 07-01-25, 12:56, Greg Kroah-Hartman wrote:
> > > On Tue, Jan 07, 2025 at 04:51:37PM +0530, Viresh Kumar wrote:
> > > > +    /// Creates a new ref-counted instance of device of a CPU.
> > > > +    pub fn from_cpu(cpu: u32) -> Result<ARef<Self>> {
> > > 
> > > Why is this a reference counted device, yet the C structure is NOT
> > > properly reference counted at all?
> > 
> > Ahh, I completely missed that it is not reference counted at all.
> > 
> > > Are you _sure_ this is going to work properly?
> > > 
> > > And really, we should fix up the C side to properly reference count all
> > > of this.  Just read the comment in cpu_device_release() for a hint at
> > > what needs to be done here.
> > > 
> > > > +        // SAFETY: It is safe to call `get_cpu_device()` for any CPU number.
> > > 
> > > For any number at all, no need to say "CPU" here, right?
> > > 
> > > > +        let ptr = unsafe { bindings::get_cpu_device(cpu) };
> > > > +        if ptr.is_null() {
> > > > +            return Err(ENODEV);
> > > > +        }
> > > > +
> > > > +        // SAFETY: By the safety requirements, ptr is valid.
> > > > +        Ok(unsafe { Device::get_device(ptr) })
> > > 
> > > So why is this device reference counted?  I get it that it should be,
> > > but how does that play with the "real" device here?
> > 
> > How about this:
> > 
> > Subject: [PATCH] rust: device: Add from_cpu()
> > 
> > This implements Device::from_cpu(), which returns a reference to
> > `Device` for a CPU. The C struct is created at initialization time for
> > CPUs and is never freed and so `ARef` isn't returned from this function.
> 
> How about fixing the reference count of the cpu device?  :)

I think that's really what is needed, otherwise it'll never work with the
guarantees the Rust `Device` abstraction provides.

The patch below is still not valid I think. It assumes that a CPU device never
becomes invalid, but that isn't true.

There's a hotplug path [1] where the device is unregistered.

[1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/base/cpu.c#L94

> 
> But seriously, this is NOT a generic 'struct device' thing, it is a 'cpu
> device' thing.  So putting this function in device.rs is probably not
> the proper place for it at all, sorry.  Why not put it in the cpu.rs
> file instead?
> 
> > The new helper will be used by Rust based cpufreq drivers.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  rust/kernel/device.rs | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > index 66ba0782551a..007f9ffab08b 100644
> > --- a/rust/kernel/device.rs
> > +++ b/rust/kernel/device.rs
> > @@ -6,6 +6,8 @@
> >  
> >  use crate::{
> >      bindings,
> > +    error::Result,
> > +    prelude::ENODEV,
> >      str::CString,
> >      types::{ARef, Opaque},
> >  };
> > @@ -60,6 +62,20 @@ pub unsafe fn get_device(ptr: *mut bindings::device) -> ARef<Self> {
> >          unsafe { Self::as_ref(ptr) }.into()
> >      }
> >  
> > +    /// Creates a new instance of CPU's device.
> > +    pub fn from_cpu(cpu: u32) -> Result<&'static Self> {
> > +        // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
> > +        // a `struct device` and is never freed by the C code.
> > +        let ptr = unsafe { bindings::get_cpu_device(cpu) };
> > +        if ptr.is_null() {
> > +            return Err(ENODEV);
> > +        }
> > +
> > +        // SAFETY: The pointer returned by `get_cpu_device()`, if not `NULL`, is a valid pointer to
> > +        // a `struct device` and is never freed by the C code.
> > +        Ok(unsafe { Self::as_ref(ptr) })
> > +    }
> > +
> >      /// Obtain the raw `struct device *`.
> >      pub(crate) fn as_raw(&self) -> *mut bindings::device {
> >          self.0.get()
> > 
> > -------------------------8<-------------------------
> > 
> > > > +    /// Checks if property is present or not.
> > > > +    pub fn property_present(&self, name: &CString) -> bool {
> > > > +        // SAFETY: `name` is null-terminated. `self.as_raw` is valid because `self` is valid.
> > > > +        unsafe { bindings::device_property_present(self.as_raw(), name.as_ptr() as *const _) }
> > > 
> > > is "self.as_raw()" a constant pointer too?
> > 
> > Subject: [PATCH] rust: device: Add property_present()
> > 
> > This implements Device::property_present(), which calls C APIs
> > device_property_present() helper.
> > 
> > The new helper will be used by Rust based cpufreq drivers.
> > 
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > ---
> >  rust/bindings/bindings_helper.h | 1 +
> >  rust/kernel/device.rs           | 7 +++++++
> >  2 files changed, 8 insertions(+)
> > 
> > diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> > index 43f5c381aab0..70e4b7b0f638 100644
> > --- a/rust/bindings/bindings_helper.h
> > +++ b/rust/bindings/bindings_helper.h
> > @@ -31,6 +31,7 @@
> >  #include <linux/pid_namespace.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/poll.h>
> > +#include <linux/property.h>
> >  #include <linux/refcount.h>
> >  #include <linux/sched.h>
> >  #include <linux/security.h>
> > diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> > index d5e6a19ff6b7..66ba0782551a 100644
> > --- a/rust/kernel/device.rs
> > +++ b/rust/kernel/device.rs
> > @@ -6,6 +6,7 @@
> >  
> >  use crate::{
> >      bindings,
> > +    str::CString,
> >      types::{ARef, Opaque},
> >  };
> >  use core::{fmt, ptr};
> > @@ -180,6 +181,12 @@ unsafe fn printk(&self, klevel: &[u8], msg: fmt::Arguments<'_>) {
> >              )
> >          };
> >      }
> > +
> > +    /// Checks if property is present or not.
> > +    pub fn property_present(&self, name: &CString) -> bool {
> > +        // SAFETY: By the invariant of `CString`, `name` is null-terminated.
> > +        unsafe { bindings::device_property_present(self.as_raw() as *const _, name.as_ptr() as *const _) }
> 
> I hate to ask, but how was this compiling if the const wasn't there
> before?  There's no type-checking happening here?  If not, how are we
> ever going to notice when function parameters change?  If there is type
> checking, how did this ever build without the const?
> 
> confused,
> 
> greg k-h
> 

