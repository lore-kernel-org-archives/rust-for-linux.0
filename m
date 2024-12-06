Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD91DDA0F
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 08:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733472661; cv=none; b=MqvSsHNxyMBr7Qqwg9cupQ+QfLtw+gkhyPq5LRGNmugfGrco/47vDpKUE6jb5z1zvdtyPQc79633GthFZClxNOM/kW61GmsGZrkye/hAceAX46Q46jb2dzX8dLd3L8X+YuSPrTja1K34fEnGj2LlHFpRW70WS0DdnwEOQMqAPPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733472661; c=relaxed/simple;
	bh=lmFGJd2Xqrs/MH4+do/m1chTI6RYr3jn0im/pd2cJUU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abrtOwZAj/EZ7opilxxmPYgwqGpRSDQnADvSFffqlNP9RabvRf0eY7Lu3HNi3WPgWRL+rzaCoSEEzOOUQzrravfAEon+9DMusdSyNH8E8a7Jb2AKyigvPbU9I6nlab8f1+2AXA6bud4Cbw9Ecl1V+j0ReYN3gb2EAekG0b5mvf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fK9nif6s; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fK9nif6s"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e25c5d75so997727f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 00:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733472658; x=1734077458; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aad+99YqFvgU4m6vSdZibZAV4sqIGKiKMjv1PgKDzmE=;
        b=fK9nif6sPNMYOIgSvyBqYikLXKSbXs+ofeRdZYaeOvjWlmxYV0WfuSHYq/EEyPLMf+
         OwzmieXD88DmD9eLkwdAF5fHY71p40RAyDfXXMz3B0gqO2zpwM7IKsiuMOjB3JO6phjO
         YnEt2F8TeUsfmoNxMSicNcqJDcMrr//rjkW+vrIm74jXk3CZwPpikMiJR4RMWnZTjnF/
         /zAAq89z3eGt8njvycplhbZon3ilfR+aL6P5f5GhGrnTmAaZu7JPZJ5E4BtW7AB4w0oe
         rFsiBaW/+nhuARz8sr1EbYNpC8B/0UTZbBmC7UjtP3ZQ0bgCQT/NYwe6FsI7/R3PxHgr
         57yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733472658; x=1734077458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aad+99YqFvgU4m6vSdZibZAV4sqIGKiKMjv1PgKDzmE=;
        b=d9f09sRS/0dmF+y3siqnB6IvjyiiN34P1/EOXpyPqjd23dRKVzkmNs4QmZyCBVQF8Z
         i+znc41z82K2oAmep/5KZAgjCrrP/snSacxFg4fEC2TVhaDEoyIuihUDAUDE4MeMYTPr
         3t8wWdzvoDkczgwOrqDl69EoEbHR6BXqIwhRk7Xnqw3vBH0+MdvGRAKksB2/V7tcwY5F
         ZdTzWxtBkJ8sJ49cqYAlcUkOELOzP3b6r/G5V70T03Ojb9oUUSzZRkal5jyFLQZ0nxyv
         T2U2NGldIggzrdiah9W6VyCckq/hhJ9pzO6BSVt2MJIiioDr2rUWJjmh0BFeVOzzGRk6
         RhZw==
X-Forwarded-Encrypted: i=1; AJvYcCXjp/vEqay+E1P64pbGGPI9UUIC6iBGEX8diREnLbnhHaSj2NXLnQAiSqInAeORABhfza+KqqTy5KOfH18hbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYcXFzLKDswqe7vXpwiDOxE+X6UMKQSbfr+xqw1H5iogM8kwhr
	Slzpz97vLaPsUkUUZq9Af2Z4l13bCN8OMAfPLoJnkc/Fn/eMO1/wgaZBAsDxlxXn8GITHdwLC2z
	unO3ey6Zr77IHRN6/KEsWSOkF2GXPhPLNf+nR
X-Gm-Gg: ASbGnctavkA3cjsyYgp3G+OlXlINEyrLElHmc0fQ3qGlBPrALDdbVslRmR5j1h44wHe
	Ry5Wg1ZjTHbM3dU4IeiYOBkzn8yL2pLu3
X-Google-Smtp-Source: AGHT+IHSUNmu0x5twQWzMYE07NjUUK5N7I4JbR57kNLF/pE+2Z4WmMcruwV6xNFlS3jP1u4t7TzGWvXJT/U4DtifFhY=
X-Received: by 2002:a05:6000:789:b0:385:fcfb:8d4f with SMTP id
 ffacd0b85a97d-3862b35fc5fmr1361458f8f.21.1733472657893; Fri, 06 Dec 2024
 00:10:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205162531.1883859-1-lee@kernel.org> <20241205162531.1883859-2-lee@kernel.org>
 <2024120648-finch-shrubbery-c6f5@gregkh> <20241206071646.GE8882@google.com>
 <20241206073309.GG8882@google.com> <2024120616-endanger-strangely-62b4@gregkh>
In-Reply-To: <2024120616-endanger-strangely-62b4@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 09:10:45 +0100
Message-ID: <CAH5fLghxQ724+aZh4B0UJJ40ut7iS1grs2CAkH-wjWVmt0om7w@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] rust: miscdevice: Provide accessor to pull out miscdevice::this_device
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2024 at 8:46=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Dec 06, 2024 at 07:33:09AM +0000, Lee Jones wrote:
> > On Fri, 06 Dec 2024, Lee Jones wrote:
> >
> > > On Fri, 06 Dec 2024, Greg KH wrote:
> > >
> > > > On Thu, Dec 05, 2024 at 04:25:18PM +0000, Lee Jones wrote:
> > > > > There are situations where a pointer to a `struct device` will be=
come
> > > > > necessary (e.g. for calling into dev_*() functions).  This access=
or
> > > > > allows callers to pull this out from the `struct miscdevice`.
> > > > >
> > > > > Signed-off-by: Lee Jones <lee@kernel.org>
> > > > > ---
> > > > >  rust/kernel/miscdevice.rs | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.r=
s
> > > > > index 7e2a79b3ae26..55340f316006 100644
> > > > > --- a/rust/kernel/miscdevice.rs
> > > > > +++ b/rust/kernel/miscdevice.rs
> > > > > @@ -10,11 +10,13 @@
> > > > >
> > > > >  use crate::{
> > > > >      bindings,
> > > > > +    device::Device,
> > > > >      error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
> > > > >      prelude::*,
> > > > >      str::CStr,
> > > > >      types::{ForeignOwnable, Opaque},
> > > > >  };
> > > > > +
> > > > >  use core::{
> > > > >      ffi::{c_int, c_long, c_uint, c_ulong},
> > > > >      marker::PhantomData,
> > > > > @@ -84,6 +86,13 @@ pub fn register(opts: MiscDeviceOptions) -> im=
pl PinInit<Self, Error> {
> > > > >      pub fn as_raw(&self) -> *mut bindings::miscdevice {
> > > > >          self.inner.get()
> > > > >      }
> > > > > +
> > > > > +    /// Returns a pointer to the current Device
> > > > > +    pub fn device(&self) -> &Device {
> > > > > +        // SAFETY: This is only accessible after a successful re=
gister() which always
> > > > > +        // initialises this_device with a valid device.
> > > > > +        unsafe { Device::as_ref((*self.as_raw()).this_device) }
> > > >
> > > > A "raw" pointer that you can do something with without incrementing=
 the
> > > > reference count of it?  Oh wait, no, it's the rust device structure=
.
> > > > If so, why isn't this calling the get_device() interface instead?  =
That
> > > > way it's properly incremented and decremented when it "leaves the s=
cope"
> > > > right?
> > > >
> > > > Or am I missing something here as to why that wouldn't work and thi=
s is
> > > > the only way to get access to the 'struct device' of this miscdevic=
e?
> > >
> > > Fair point.  I'll speak to Alice.
> >
> > Alice isn't available yet, so I may be talking out of turn at this
> > point, but I just found this is the Device documentation:
> >
> >   /// A `Device` instance represents a valid `struct device` created by=
 the C portion of the kernel.
> >   ///
> >   /// Instances of this type are always reference-counted, that is, a c=
all to `get_device` ensures
> >   /// that the allocation remains valid at least until the matching cal=
l to `put_device`.
> >
> > And:
> >
> >   // SAFETY: Instances of `Device` are always reference-counted.
> >
> > Ready for some analysis from this beginner?
> >
> > Since this impl for Device is AlwaysRefCounted, when any references are
> > taken i.e. in the Device::as_ref line above, inc_ref() is implicitly
> > called to increase the refcount.  The same will be true of dec_ref()
> > once it goes out of scope.
> >
> >   // SAFETY: Instances of `Device` are always reference-counted.
> >   unsafe impl crate::types::AlwaysRefCounted for Device {
> >       fn inc_ref(&self) {
> >           // SAFETY: The existence of a shared reference guarantees tha=
t the refcount is non-zero.
> >           unsafe { bindings::get_device(self.as_raw()) };
> >       }
> >
> >       unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
> >           // SAFETY: The safety requirements guarantee that the refcoun=
t is non-zero.
> >           unsafe { bindings::put_device(obj.cast().as_ptr()) }
> >   }
>
> Ick, really?  So as_ref() implicitly calles inc_ref() and dec_ref()?
> Ah, ok, in digging into AlwaysRefCounted I now see that seems to be
> true.

It doesn't increment the refcount because it uses the reference type
&_ and not the ARef<_> pointer type. References enforce correctness
using the borrow-checker. For example, consider this attempt to UAF:

#[derive(Debug)]
struct Inner {}

struct Outer {
    inner: Inner,
}

impl Outer {
    fn as_ref(&self) -> &Inner {
        &self.inner
    }
}

fn main() {
    let inner;
    {
        let outer =3D Outer { inner: Inner {} };
        inner =3D outer.as_ref();
    }
    println!("{:?}", inner);
}

This fails to compile:

error[E0597]: `outer` does not live long enough
  --> src/main.rs:19:17
   |
18 |         let outer =3D Outer { inner: Inner {} };
   |             ----- binding `outer` declared here
19 |         inner =3D outer.as_ref();
   |                 ^^^^^ borrowed value does not live long enough
20 |     }
   |     - `outer` dropped here while still borrowed
21 |     println!("{:?}", inner);
   |                      ----- borrow later used here

The same logic applies to the device() accessor. That is, it ensures
that you can only use the pointer to access the `struct device` when
the `struct miscdevice` is still valid, which should be okay.

To grab a refcount, you need the ARef<_> pointer type. Callers can do

let device =3D ARef::from(miscdevice.device());

and now device is a value of type ARef<Device> which owns a refcount
and drops it when the destructor runs.

Alice
