Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F1121ABC1
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 22:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769208727; cv=none; b=VP0I2haRu5CBdu/YUqtQrVGKCTvR3+sbfzNLFqOBd51iX0yoLkzg22FbJCZT/ORu7HBBpTsXFBTb60RgCg9burjcUscvy3X9KOXLeQAf7sdU9U8JB6d/xgrMDW5DSjOZgSjQJQQKfvFTYC/OKNHK+x7fIpH8RFJPug1rIElXGnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769208727; c=relaxed/simple;
	bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lxdRtLzr59U+drlRlmMzWSk8LJzEK4riXAGxHb1r34pExYgU+kFu7xY6JNNAIbTDNspcPGbH77GgrpimM6i1X46Qu9jZWxvhZLzYvqTBbbH93LJdXyoGVkVPtg3fVHh2Yk71QpjxqN9vVOpoBw92Io/5MmMrLiKdMWMCgWPYNqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eKbKgfvd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eKbKgfvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769208724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
	b=eKbKgfvdhi8+yN+YRpFhNS9YJMCuZfJE/zVcO1dPVZhDpiaMLrm2Uoc1ewwDS0pZOfIrfv
	gHsbAf6miLNAGrlP3GyPk7j3hC6XGxbtkxD9cf6M6LDho+Z+Wq3kHPwIijMsJIQbyc8P3N
	NLIykB8CixZe0s+UlyLB8T6q+yMTUCk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-s6BRCOJuOteJzrPkJsV78w-1; Fri, 23 Jan 2026 17:52:03 -0500
X-MC-Unique: s6BRCOJuOteJzrPkJsV78w-1
X-Mimecast-MFC-AGG-ID: s6BRCOJuOteJzrPkJsV78w_1769208723
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5014936958cso93460261cf.2
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 14:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769208723; x=1769813523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hr+K0/x9vYaZJhaVKfaj8TuReLDryhxjoKzint7DlB8=;
        b=nXccni9R0p4yvHwyE1InRlr9SaPa6AWo1Rs4Y5uf9fvkcwAOQXFvksBJrEjMLp44k7
         IzVfDRu9fTzLHOrCMdRUmowZ7kV3hrGiufKWFHhkVDZ8xBzLlCwaDIw0Zdnv4C9Sb2L9
         md9cZKyqA7By4SuPnfQxDeD0WXM3FRHd7PPpF9RFhkfoAEGt/qK9EfkNvt0eNyRJN56l
         I5ZWMC5hIf+iBIBQrPBPn3rfCjbGL4WB4tGL0UMMbT1twsq5ZFpcqJcjHjNhftDyij12
         V1a/HjKN4DQyMCX1NGQtgOzgLb4HNVqSOe1qDO2K0K3ZFM2ljsRMFqrcUXS6THkuj8dy
         saxg==
X-Forwarded-Encrypted: i=1; AJvYcCWlDPyer3L0rtOfl3TkY8LLRX4/93r2R11SnwQsaXqoHwIbMAd2GD7Sp5I60TAYwX3TfwNeMlnib+FVvGNc4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxFEqTbwoXRgSjvvoV/xxJ0TbeJPfuwMLRwM8PFPV2RGW9UNUN
	p8PZF0dcbGhO+82gq/2ZGH76XMpAvbNEHxeJ49utXqP/qCyFXJuam9zDR0rY05uNwAZmxJIz7WU
	iCQgD1b5MZf8v9yBZN1StpI4lGskO95mm88syL0Ms1pLRRK9I4oi6sC2gQSBy8cjWOgjS
X-Gm-Gg: AZuq6aJhH9n/tvvQ/CD6EevQGYv1zTZC5wPtUW5V1ssKEejqwvq+hwJTRyXdf7SLIZH
	3yKOqkJBmAeazLmBMeTUJAygCcwk2GXMNoZkKxDNKCrdwuZjRt3QyvDfybj/b5QHvEJ0n9veiu4
	Nhs9hQB4KIAPKOqYZyTOXzd+aGcXJ09M2U0LR5BYhV/tce5LM252j8b4SQpJOHbcVgmFMCq+3fT
	NMOvBufmsBhcqJJ6gBRhVNcIca8dwYx4bNdM7uBt0Qe5r+e533sa9rUh72bmwWVJEGRZbiXLS0N
	nELG2avGOWP+QLkN6j2vcwW4l34R/CKW40zxcK15M09Z8W3esMmTy+Wv2PNwPaSUTlmaaudTsup
	p14NFDg==
X-Received: by 2002:a05:622a:19a1:b0:501:147a:a215 with SMTP id d75a77b69052e-502f77d0621mr57859511cf.73.1769208722985;
        Fri, 23 Jan 2026 14:52:02 -0800 (PST)
X-Received: by 2002:a05:622a:19a1:b0:501:147a:a215 with SMTP id d75a77b69052e-502f77d0621mr57859261cf.73.1769208722588;
        Fri, 23 Jan 2026 14:52:02 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8949bdd0a5asm13002476d6.9.2026.01.23.14.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 14:52:01 -0800 (PST)
Message-ID: <4b46771349a474a3d81c29a6b0cd946071c58d7b.camel@redhat.com>
Subject: Re: [PATCH v3 3/3] rust/drm/gem: Use DeviceContext with GEM objects
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno
 Lossin	 <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Date: Fri, 23 Jan 2026 17:52:00 -0500
In-Reply-To: <EEE2F67E-7F61-44B3-805B-0794C9BB02F6@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
	 <20260122225057.3589500-4-lyude@redhat.com>
	 <EEE2F67E-7F61-44B3-805B-0794C9BB02F6@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RWhIiG65w5urxPoJAwDRBKo_OO0ayeS0UNLXDc3esQ8_1769208723
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-22 at 22:56 -0300, Daniel Almeida wrote:
> > =C2=A0=C2=A0=C2=A0 }
> > }
> > diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
> > index 0e81957cf8c28..4c03105e6a817 100644
> > --- a/rust/kernel/drm/device.rs
> > +++ b/rust/kernel/drm/device.rs
> > @@ -163,13 +163,13 @@ impl<T: drm::Driver> UnregisteredDevice<T> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master_set: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 master_drop: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debugfs_init: None,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_create_object: T::Objec=
t::ALLOC_OPS.gem_create_object,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_handle_to_fd:
> > T::Object::ALLOC_OPS.prime_handle_to_fd,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_fd_to_handle:
> > T::Object::ALLOC_OPS.prime_fd_to_handle,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import: T::Object=
::ALLOC_OPS.gem_prime_import,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import_sg_table:
> > T::Object::ALLOC_OPS.gem_prime_import_sg_table,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_create: T::Object::ALL=
OC_OPS.dumb_create,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_map_offset: T::Object:=
:ALLOC_OPS.dumb_map_offset,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_create_object:
> > T::Object::<Uninit>::ALLOC_OPS.gem_create_object,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_handle_to_fd:
> > T::Object::<Uninit>::ALLOC_OPS.prime_handle_to_fd,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prime_fd_to_handle:
> > T::Object::<Uninit>::ALLOC_OPS.prime_fd_to_handle,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import:
> > T::Object::<Uninit>::ALLOC_OPS.gem_prime_import,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gem_prime_import_sg_table:
> > T::Object::<Uninit>::ALLOC_OPS.gem_prime_import_sg_table,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_create: T::Object::<Un=
init>::ALLOC_OPS.dumb_create,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dumb_map_offset:
> > T::Object::<Uninit>::ALLOC_OPS.dumb_map_offset,
>=20
> Why are we specifically going with Uninit here?

I think this was just an assumption that similarly to KMS callbacks,
gem callbacks can also happen before registration. except, that some of
these clearly can't happen before registration - whoops.

But this being said - it doesn't really make any difference what the
DeviceContext is here. The DeviceContext generic here isn't actually
used in any way, nor is it used by the C callback, it's just here
because we have to specify it on the associated type.

>=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 show_fdinfo: None,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fbdev_probe: None,
> >=20
> > diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
> > index a16605b407159..94ebaf19ac069 100644
> > --- a/rust/kernel/drm/driver.rs
> > +++ b/rust/kernel/drm/driver.rs
> > @@ -110,7 +110,7 @@ pub trait Driver {
> > =C2=A0=C2=A0=C2=A0 type Data: Sync + Send;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// The type used to manage memory for this driver.
> > -=C2=A0=C2=A0=C2=A0 type Object: AllocImpl;
> > +=C2=A0=C2=A0=C2=A0 type Object<Ctx: drm::DeviceContext>: AllocImpl;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// The type used to represent a DRM File (client)
> > =C2=A0=C2=A0=C2=A0 type File: drm::file::DriverFile;
> > diff --git a/rust/kernel/drm/gem/mod.rs
> > b/rust/kernel/drm/gem/mod.rs
> > index b4199945db378..3af9f52f8eda4 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -8,6 +8,10 @@
> > =C2=A0=C2=A0=C2=A0 bindings,
> > =C2=A0=C2=A0=C2=A0 drm::{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device::{
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Dev=
iceContext,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Reg=
istered, //
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver::{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allo=
cImpl,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Allo=
cOps, //
> > @@ -22,6 +26,7 @@
> > =C2=A0=C2=A0=C2=A0 types::Opaque,
> > };
> > use core::{
> > +=C2=A0=C2=A0=C2=A0 marker::PhantomData,
> > =C2=A0=C2=A0=C2=A0 ops::Deref,
> > =C2=A0=C2=A0=C2=A0 ptr::NonNull, //
> > };
> > @@ -33,21 +38,30 @@
> > /// [`DriverFile`]: drm::file::DriverFile
> > pub type DriverFile<T> =3D drm::File<<<T as DriverObject>::Driver as
> > drm::Driver>::File>;
> >=20
> > +/// A type alias for retrieving the current [`AllocImpl`] for a
> > given [`DriverObject`].
> > +///
> > +/// [`Driver`]: drm::Driver
> > +pub type DriverAllocImpl<T, Ctx =3D Registered> =3D
> > +=C2=A0=C2=A0=C2=A0 <<T as DriverObject>::Driver as drm::Driver>::Objec=
t<Ctx>;
>=20
> Should this be a follow up patch instead?
>=20
> > +
> > /// GEM object functions, which must be implemented by drivers.
> > pub trait DriverObject: Sync + Send + Sized {
> > =C2=A0=C2=A0=C2=A0 /// Parent `Driver` for this object.
> > =C2=A0=C2=A0=C2=A0 type Driver: drm::Driver;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Create a new driver data object for a GEM object=
 of a given
> > size.
> > -=C2=A0=C2=A0=C2=A0 fn new(dev: &drm::Device<Self::Driver>, size: usize=
) -> impl
> > PinInit<Self, Error>;
> > +=C2=A0=C2=A0=C2=A0 fn new<Ctx: DeviceContext>(
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev: &drm::Device<Self::Dri=
ver, Ctx>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size: usize,
> > +=C2=A0=C2=A0=C2=A0 ) -> impl PinInit<Self, Error>;
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Open a new handle to an existing object, associa=
ted with a
> > File.
> > -=C2=A0=C2=A0=C2=A0 fn open(_obj: &<Self::Driver as drm::Driver>::Objec=
t, _file:
> > &DriverFile<Self>) -> Result {
> > +=C2=A0=C2=A0=C2=A0 fn open(_obj: &DriverAllocImpl<Self>, _file:
> > &DriverFile<Self>) -> Result {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(())
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Close a handle to an existing object, associated=
 with a
> > File.
> > -=C2=A0=C2=A0=C2=A0 fn close(_obj: &<Self::Driver as drm::Driver>::Obje=
ct, _file:
> > &DriverFile<Self>) {}
> > +=C2=A0=C2=A0=C2=A0 fn close(_obj: &DriverAllocImpl<Self>, _file:
> > &DriverFile<Self>) {}
> > }
> >=20
> > /// Trait that represents a GEM object subtype
> > @@ -73,9 +87,12 @@ extern "C" fn open_callback<T: DriverObject>(
> > =C2=A0=C2=A0=C2=A0 // SAFETY: `open_callback` is only ever called with =
a valid
> > pointer to a `struct drm_file`.
> > =C2=A0=C2=A0=C2=A0 let file =3D unsafe { DriverFile::<T>::from_raw(raw_=
file) };
> >=20
> > -=C2=A0=C2=A0=C2=A0 // SAFETY: `open_callback` is specified in the Allo=
cOps
> > structure for `DriverObject<T>`,
> > -=C2=A0=C2=A0=C2=A0 // ensuring that `raw_obj` is contained within a
> > `DriverObject<T>`
> > -=C2=A0=C2=A0=C2=A0 let obj =3D unsafe { <<T::Driver as drm::Driver>::O=
bject as
> > IntoGEMObject>::from_raw(raw_obj) };
> > +=C2=A0=C2=A0=C2=A0 // SAFETY:
> > +=C2=A0=C2=A0=C2=A0 // * `open_callback` is specified in the AllocOps s=
tructure
> > for `DriverObject`, ensuring that
> > +=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 `raw_obj` is contained within a `Dri=
verAllocImpl<T>`
> > +=C2=A0=C2=A0=C2=A0 // * It is only possible for `open_callback` to be =
called
> > after device registration, ensuring
> > +=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 that the object's device is in the `=
Registered` state.
> > +=C2=A0=C2=A0=C2=A0 let obj: &DriverAllocImpl<T> =3D unsafe {
> > IntoGEMObject::from_raw(raw_obj) };
> >=20
> > =C2=A0=C2=A0=C2=A0 match T::open(obj, file) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err(e) =3D> e.to_errno(),
> > @@ -92,12 +109,12 @@ extern "C" fn close_callback<T: DriverObject>(
> >=20
> > =C2=A0=C2=A0=C2=A0 // SAFETY: `close_callback` is specified in the Allo=
cOps
> > structure for `Object<T>`, ensuring
> > =C2=A0=C2=A0=C2=A0 // that `raw_obj` is indeed contained within a `Obje=
ct<T>`.
> > -=C2=A0=C2=A0=C2=A0 let obj =3D unsafe { <<T::Driver as drm::Driver>::O=
bject as
> > IntoGEMObject>::from_raw(raw_obj) };
> > +=C2=A0=C2=A0=C2=A0 let obj: &DriverAllocImpl<T> =3D unsafe {
> > IntoGEMObject::from_raw(raw_obj) };
> >=20
> > =C2=A0=C2=A0=C2=A0 T::close(obj, file);
> > }
> >=20
> > -impl<T: DriverObject> IntoGEMObject for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> IntoGEMObject for
> > Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 fn as_raw(&self) -> *mut bindings::drm_gem_object {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.obj.get()
> > =C2=A0=C2=A0=C2=A0 }
> > @@ -105,7 +122,7 @@ fn as_raw(&self) -> *mut
> > bindings::drm_gem_object {
> > =C2=A0=C2=A0=C2=A0 unsafe fn from_raw<'a>(self_ptr: *mut bindings::drm_=
gem_object)
> > -> &'a Self {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `obj` is guarante=
ed to be in an `Object<T>` via
> > the safety contract of this
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // function
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T>, obj)
> > }
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > &*crate::container_of!(Opaque::cast_from(self_ptr), Object<T, Ctx>,
> > obj) }
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > @@ -122,7 +139,7 @@ fn size(&self) -> usize {
> > =C2=A0=C2=A0=C2=A0 fn create_handle<D, F>(&self, file: &drm::File<F>) -=
>
> > Result<u32>
> > =C2=A0=C2=A0=C2=A0 where
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self: AllocImpl<Driver =3D D=
>,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object =3D S=
elf, File =3D F>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object<Regis=
tered> =3D Self, File =3D F>,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F: drm::file::DriverFile<Dri=
ver =3D D>,
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let mut handle: u32 =3D 0;
> > @@ -137,7 +154,7 @@ fn create_handle<D, F>(&self, file:
> > &drm::File<F>) -> Result<u32>
> > =C2=A0=C2=A0=C2=A0 fn lookup_handle<D, F>(file: &drm::File<F>, handle: =
u32) ->
> > Result<ARef<Self>>
> > =C2=A0=C2=A0=C2=A0 where
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Self: AllocImpl<Driver =3D D=
>,
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object =3D S=
elf, File =3D F>,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 D: drm::Driver<Object<Regis=
tered> =3D Self, File =3D F>,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 F: drm::file::DriverFile<Dri=
ver =3D D>,
> > =C2=A0=C2=A0=C2=A0 {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The arguments are=
 all valid per the type
> > invariants.
> > @@ -177,16 +194,18 @@ impl<T: IntoGEMObject> BaseObject for T {}
> > ///
> > /// # Invariants
> > ///
> > -/// - `self.obj` is a valid instance of a `struct drm_gem_object`.
> > +/// * `self.obj` is a valid instance of a `struct drm_gem_object`.
> > +/// * Any type invariants of `Ctx` apply to the parent DRM device
> > for this GEM object.
> > #[repr(C)]
> > #[pin_data]
> > -pub struct Object<T: DriverObject + Send + Sync> {
> > +pub struct Object<T: DriverObject + Send + Sync, Ctx:
> > DeviceContext =3D Registered> {
> > =C2=A0=C2=A0=C2=A0 obj: Opaque<bindings::drm_gem_object>,
> > =C2=A0=C2=A0=C2=A0 #[pin]
> > =C2=A0=C2=A0=C2=A0 data: T,
> > +=C2=A0=C2=A0=C2=A0 _ctx: PhantomData<Ctx>,
> > }
> >=20
> > -impl<T: DriverObject> Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 const OBJECT_FUNCS: bindings::drm_gem_object_funcs =
=3D
> > bindings::drm_gem_object_funcs {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free: Some(Self::free_callba=
ck),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 open: Some(open_callback::<T=
>),
> > @@ -206,11 +225,12 @@ impl<T: DriverObject> Object<T> {
> > =C2=A0=C2=A0=C2=A0 };
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Create a new GEM object.
> > -=C2=A0=C2=A0=C2=A0 pub fn new(dev: &drm::Device<T::Driver>, size: usiz=
e) ->
> > Result<ARef<Self>> {
> > +=C2=A0=C2=A0=C2=A0 pub fn new(dev: &drm::Device<T::Driver, Ctx>, size:=
 usize) ->
> > Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let obj: Pin<KBox<Self>> =3D=
 KBox::pin_init(
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 try_=
pin_init!(Self {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 obj:
> > Opaque::new(bindings::drm_gem_object::default()),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 data <- T::new(dev, size),
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 _ctx: PhantomData,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GFP_=
KERNEL,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 )?;
> > @@ -219,6 +239,8 @@ pub fn new(dev: &drm::Device<T::Driver>, size:
> > usize) -> Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { (*obj.as_raw()).fun=
cs =3D &Self::OBJECT_FUNCS };
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The arguments are=
 all valid per the type
> > invariants.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // INVARIANT: We use `dev` =
for creating the GEM object,
> > which is known to be in state `Ctx` -
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // ensuring that the GEM ob=
ject's pointer to the DRM
> > device is always in the same state.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to_result(unsafe {
> > bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size)
> > })?;
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: We will never mov=
e out of `Self` as `ARef<Self>`
> > is always treated as pinned.
> > @@ -232,13 +254,15 @@ pub fn new(dev: &drm::Device<T::Driver>,
> > size: usize) -> Result<ARef<Self>> {
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > =C2=A0=C2=A0=C2=A0 /// Returns the `Device` that owns this GEM object.
> > -=C2=A0=C2=A0=C2=A0 pub fn dev(&self) -> &drm::Device<T::Driver> {
> > +=C2=A0=C2=A0=C2=A0 pub fn dev(&self) -> &drm::Device<T::Driver, Ctx> {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `struct drm_gem_object.=
dev` is initialized and valid
> > for as long as the GEM
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 object lives.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - The device we used for =
creating the gem object is
> > passed as &drm::Device<T::Driver> to
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 Object::<T>::=
new(), so we know that `T::Driver` is the
> > right generic parameter to use
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 here.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - Any type invariants of=
 `Ctx` are upheld by using the
> > same `Ctx` for the `Device` we
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 return.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { drm::Device::from_r=
aw((*self.as_raw()).dev) }
> > =C2=A0=C2=A0=C2=A0 }
> >=20
> > @@ -264,7 +288,7 @@ extern "C" fn free_callback(obj: *mut
> > bindings::drm_gem_object) {
> > }
> >=20
> > // SAFETY: Instances of `Object<T>` are always reference-counted.
> > -unsafe impl<T: DriverObject> crate::sync::aref::AlwaysRefCounted
> > for Object<T> {
> > +unsafe impl<T: DriverObject, Ctx: DeviceContext> AlwaysRefCounted
> > for Object<T, Ctx> {
> > =C2=A0=C2=A0=C2=A0 fn inc_ref(&self) {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The existence of =
a shared reference guarantees
> > that the refcount is non-zero.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe { bindings::drm_gem_o=
bject_get(self.as_raw()) };
> > @@ -279,9 +303,9 @@ unsafe fn dec_ref(obj: NonNull<Self>) {
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > -impl<T: DriverObject> super::private::Sealed for Object<T> {}
> > +impl<T: DriverObject, Ctx: DeviceContext> super::private::Sealed
> > for Object<T, Ctx> {}
> >=20
> > -impl<T: DriverObject> Deref for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> Deref for Object<T, Ctx>
> > {
> > =C2=A0=C2=A0=C2=A0 type Target =3D T;
> >=20
> > =C2=A0=C2=A0=C2=A0 fn deref(&self) -> &Self::Target {
> > @@ -289,7 +313,7 @@ fn deref(&self) -> &Self::Target {
> > =C2=A0=C2=A0=C2=A0 }
> > }
> >=20
> > -impl<T: DriverObject> AllocImpl for Object<T> {
> > +impl<T: DriverObject, Ctx: DeviceContext> AllocImpl for Object<T,
> > Ctx> {
> > =C2=A0=C2=A0=C2=A0 type Driver =3D T::Driver;
> >=20
> > =C2=A0=C2=A0=C2=A0 const ALLOC_OPS: AllocOps =3D AllocOps {
> > --=20
> > 2.52.0
> >=20
> >=20

