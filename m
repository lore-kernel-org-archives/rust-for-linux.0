Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB6926E70E
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 17:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187649; cv=none; b=jocLRqBt7nVIkFnXUu3c/xsVKA8kXFuLSbqsNCr4H35GcuY/RkcJbdwfucKDWoh0qU7SL6BFkYZ2Mdkcx/mhnCkE7kraxE74a9Fu62KXw4VAEIcKSRfA9DZSy+STfVcnfKv5w6yUT//gHC+r3LT9D8y/CECpYsehg0AGDjUPC58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187649; c=relaxed/simple;
	bh=DijAIRvrqnHXdfVzYnWWMhE2olDPZM678iAAtRN9RNI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xzu7xEfw4raQlz9wpr1RH0Fv8DyacweZZXojkSk2XtM/jbyF2rTk39ZnlVsqGp1iQBM/cF9z7i5eIEeIQnYMaGos1r+prKHs6QfzhWvMKwSYB0zCDCsE1Bi4bRGjSptq1R/1kA5VzzGdzodcr+6oxyUzcqXnuqTTon10u8twq/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AvF0RuIz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AvF0RuIz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769187647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oYRZQtOI+KB8tYFyNN3GRXz5SFLWYG0fejboN/bZV20=;
	b=AvF0RuIz7dmt7/HIS1WbKqIjoqXzBI02OL8Q4gBmHRRMgaYNJtpT900+L2Olq+LMdX2jFr
	ODWzhW/ESarEw/umKrSctBJObVCKBIcm4hUVeC02S7ni7CiAREY93VRD+2lfLBaFOU8jld
	B5OD55RioffdRmpZweevYn3dpxSyrG8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-245-t2muKaQtNS6o2XcP0TFy-g-1; Fri, 23 Jan 2026 12:00:45 -0500
X-MC-Unique: t2muKaQtNS6o2XcP0TFy-g-1
X-Mimecast-MFC-AGG-ID: t2muKaQtNS6o2XcP0TFy-g_1769187645
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6a341ac9fso600964185a.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 09:00:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769187645; x=1769792445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYRZQtOI+KB8tYFyNN3GRXz5SFLWYG0fejboN/bZV20=;
        b=YbGBlZaWeJxZl6fvU2PYfq9KlpYN6ZnU617P5Cjie1e2t6jeSIfm/XlqUbyn6fg9ak
         As2YPTaxPMhkm7U4Piu8dFvHEEIvLPjwSGpUVBxlxhfXkCGeUdvS/0aNOGrdqKZAKHHe
         IdSbIEBULnUnW5KB9DPMp3/HrRhmhjtuCyJUsUylJNHgIQgavSp+d5kvVKp3CXuZQtDE
         zvbb23qFRD505/EAbJl89qYKg2n4ne9n8ZlxdxvAfMgYEbUHiEGSw5aIC4MFPKjTwKO+
         yd3qWzenyK+/4xqKNa5KDcSheNY/yQrdIY04xmdcjHeDjuUYP3GrkU2OojS+zpKy4OO3
         HupA==
X-Forwarded-Encrypted: i=1; AJvYcCWGn7VrZ3afLavXlGS+ZZDn1+XqoiZLL7V3LtYzLQ9HNosrCKz2k4sEhYRugcAGWIj078fgANiO1GXnBg3swg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzP5SoCKN+uUFjCA+ZACL43WL1LM1NMJjYUEye0NKwihoaCZY38
	w/LaApwHUZOftEKOnp5qfj3tTP4eZBZdlu1Da43G9yTCI/1zQ67f76qV+LzGJreSG5Ad6Fq0xas
	qKlDp6W+mj97oqGVnXxCq/xKtKSv+1aZDJpg1uC8zhJsLkSUsg1Yc6mxsHkLX6Oq3F1FO
X-Gm-Gg: AZuq6aK9J9LkMdeCRS58tGo5/uX/sXC8kBkiQHj4k1fwa5XwdsPUUWYaxBdTaTiqGHq
	IiV+GZU1DcpiboqN7AHwiLCSTnHNrW9KBvXdAn76PPulwL2BkAuMLM1uvLvLW+F6ctzkA/yBpci
	60qmWHndZE7Z/NGIe7SEHuNnXyhSbbykPROonq1vhUCquZk6SKfVbGdIym4hIeWP9ag1eyC5Hw2
	bPq+GkNQJBLqfbvEvPe2Hlg37nQWMSIfyMRgMvFYj0fHFbRoIqVfo+rB2e2nlalIZH9X8QKy3S3
	ORmHPQ04Svfl7xw9QvyusBAzO+G6GdjhX9UNhz2VjBFhpnUfREtmEEU1oTzSRwVs9W+nNWIcpWm
	x2xoBww==
X-Received: by 2002:a05:620a:40cd:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c6e2e4c7cbmr393960085a.79.1769187637913;
        Fri, 23 Jan 2026 09:00:37 -0800 (PST)
X-Received: by 2002:a05:620a:40cd:b0:8c5:38b3:fefa with SMTP id af79cd13be357-8c6e2e4c7cbmr393887885a.79.1769187633428;
        Fri, 23 Jan 2026 09:00:33 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8949193add8sm22302406d6.45.2026.01.23.09.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 09:00:31 -0800 (PST)
Message-ID: <47cbb2bb4462331e5ffa56da488d8ffab9a5fcd7.camel@redhat.com>
Subject: Re: [PATCH v3 2/3] rust/drm: Don't setup private driver data until
 registration
From: lyude@redhat.com
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	nouveau@lists.freedesktop.org, Miguel Ojeda <ojeda@kernel.org>, Simona
 Vetter	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Shankari
 Anand	 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno
 Lossin	 <lossin@kernel.org>, Asahi Lina <lina+kernel@asahilina.net>
Date: Fri, 23 Jan 2026 12:00:28 -0500
In-Reply-To: <E3CBBAB1-4EED-4052-B9DC-AAEB58D67265@collabora.com>
References: <20260122225057.3589500-1-lyude@redhat.com>
	 <20260122225057.3589500-3-lyude@redhat.com>
	 <E3CBBAB1-4EED-4052-B9DC-AAEB58D67265@collabora.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yD7XbDgsW5MUhLVV-W9xrLneuAG1EWMIPOkm3LcNhNE_1769187645
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-01-22 at 22:52 -0300, Daniel Almeida wrote:
> > @@ -254,7 +240,15 @@ pub fn new(dev: &device::Device, data: impl
> > PinInit<T::Data, Error>) -> Result<S
> > #[repr(C)]
> > pub struct Device<T: drm::Driver, C: DeviceContext =3D Registered> {
> > =C2=A0=C2=A0=C2=A0=C2=A0 dev: Opaque<bindings::drm_device>,
> > -=C2=A0=C2=A0=C2=A0 data: T::Data,
> > +
> > +=C2=A0=C2=A0=C2=A0 /// Keeps track of whether we've initialized the de=
vice data
> > yet.
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data_is_init: AtomicBool,
>=20
> Why don=E2=80=99t we make the data a member of the Registered context?

A couple of different reasons. For one: not having it embedded as part
of Device would complicate trying to go from the device's private data
using container_of! to the actual Device struct, which isn't great for
workqueues.

The other much more important reason is that Registered isn't going to
be the only typestate that has access to the driver's private data in
the future.=C2=A0With KMS, nearly all of the modesetting callbacks for a
driver can be invoked before userspace registration. E.g. consider a
modesetting driver that needs to perform a modeset pre-registration so
that the hardware is in a known good state before being exposed to
userspace.

To clarify what this looks like: you'll recall that I made a diagram
showing a high-level overview of the DRM initialization process for the
documentation for DeviceContext. The second stage in that diagram,
which I'm currently calling Init, is the context that we're going to
need to eventually add a typestate for.

FWIW, this is more or less what the flow will look like with this new
context. Indenting indicates calling down to a function from within the
function above

 * UnregisteredDevice::new(d: device::Device) -> UnregisteredDevice<T>
    - // Creates Crtcs, Connectors, etc.
      KmsDriver::probe(d: &UninitializedKmsDevice)
 * // The driver sets stuff up
 * Registration::new_foreign_owned(
   =C2=A0 dev: UnregisteredDevice,
   =C2=A0 data: impl PinInit<T::Data>
   ):
    - // Initialize `data`, so driver data is ready at this point
    - KmsDriver::pre_registration_init(d: &Device<T, Init>)
    - // Perform actual userspace registration

If it wasn't clear too: this means tyr won't really need to do anything
when we add the new DeviceContext typestate :)

>=20
> > +
> > +=C2=A0=C2=A0=C2=A0 /// The Driver's private data.
> > +=C2=A0=C2=A0=C2=A0 ///
> > +=C2=A0=C2=A0=C2=A0 /// This must only be written to from
> > [`drm::Registration::new`].
> > +=C2=A0=C2=A0=C2=A0 pub(crate) data: UnsafeCell<MaybeUninit<T::Data>>,
> > +
> > =C2=A0=C2=A0=C2=A0=C2=A0 _ctx: PhantomData<C>,

