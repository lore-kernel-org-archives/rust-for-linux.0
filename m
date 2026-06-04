Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630B13BFAD3
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Jun 2026 18:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780598948; cv=none; b=p9Ki9cqthCCTZuBxMlxVOcegIUco8UHPlvyFO0hC1tSsvzP1VZxt8yMuy8SDRfmkZ0VB4Vl4uYxY5xUU5SjgZfEgPRQjAeh94PuIsSy7skRrBBLzQiazf+7Tf3oFgtlY5m6lQSGHdRG65nzALjLq44Bdf2i6UhN+ffJqXWEjbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780598948; c=relaxed/simple;
	bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JBMVlpx+vYUdLb6hSqwqTmi596tU0S/MWfpM/UWISWLnUpH6NbLw5DZLFVsK4kaTo2UrBKAUZY8yy2ufMBe3Yq8dY6ACCEQxcP1U9IV6iCUpBpmqVn+XahPYer4KXH+Ne7xHdW1Vh2L2SIi7OaHMUwW5OXCxHlE0EpEuqGshf8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PSbb7SOb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PSbb7SOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780598945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
	b=PSbb7SObVM5nZdYrjtxzPjiV/PWbSZf6AJPko1z1A8q2EkfM9DCLyox47Na+y47KoSyFH1
	v2HIgC9texiDZkweVlQFlI18rGH3KXMaVQTWhNEtHjGoYg7YYVLelcy85AmTVmvjGcX4m2
	ULnnjN5y+J8Y98vtwI0rBIiHtjteoKU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-399-RwGynqDCPr6AVtX1jvFKfA-1; Thu, 04 Jun 2026 14:49:02 -0400
X-MC-Unique: RwGynqDCPr6AVtX1jvFKfA-1
X-Mimecast-MFC-AGG-ID: RwGynqDCPr6AVtX1jvFKfA_1780598942
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cceb5a9686so5761246d6.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Jun 2026 11:49:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780598942; x=1781203742;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSOB8kwgdkJuUcuvvGWTTy+0BwGIhrEyhn+sNY27Rlk=;
        b=cfxz8951Iy3DeGuCvZA4OjR/3RfsNMrQZ5sou1WYF+3wP+fpKkMdjf3gYghvXE3BXp
         hghfXWFkGxHWK76pbvSfHY97a6gMV6gqBa45TfmSnIcHxP/XWQIHu+cPq4RfomK2WENe
         fatZshCxQYuWTrcakSpgHQNnLP79aWbjavd8T/l+iKJvUFQKhFSXHB51glFBCz8Mpyer
         u4E5OIaACOylFRKEW/qUg8Ejw3dadiwS+eK+YSKRYwHAo30jzJRI3tWv19ZF4ontQZWY
         SlB72pA3yz9W8FyG8fsy6zmesYqwSqDtd2JtZu3Uv/xxr0ftN+TfuOEVRoUAdtpsqZ6c
         KZvw==
X-Forwarded-Encrypted: i=1; AFNElJ/Drwi6dqVwOzgPeo+a22Cuto2ceyyMHIhc3mud1pNcxUzvHwziFWlVtwWkNj0fC3MbU1rPEXkiRR5iZJFeWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl55ubYeWK7qy64KuA9zCMMEkLFj84PnxsHNlHGZhUgJGkA+Q9
	DKdYLri1tU5g67lGw9XHglHH62ENalNCz6coQtzNcDQciavDlO+RQvJd3xfka25xjzatFyQp2BO
	J2WWa5dQrq5GNZ+9CLWZtH9MdPzvK+nYa4LpLk7gP68JGdhFADPXXwPB0QFSV9F9FfK/X
X-Gm-Gg: Acq92OEYW2b4pHVk1NbCTN5oM4rTwKMSJ6Wc2Tcn1X8ojERU5Eod29HeJI/2Ee5d47i
	ocTUoIpJP3Zd0XmGoYM2qDbvplN63jRRi4/RSee6lskbPzFqDSg+YKNhV5TJq3OAA8ckPWOxnwg
	F84ydzEymYyIoEY0UpXNvC1PI9PwfTsklR8Sj/Ey8thqGV6jyBD15JFjDCdn4/USwhAkbg9f+cg
	v0uT4uChcg6XRe8Q67bBoyCOvqxBS1WSIRFadIGQQ8WrgRjtE0mWyjDLt0OVLmitdtJ1tJlQvR7
	z9BAMADv/EMbcPTqN7QDUV4xq3Hxk8U3QXtFYzQ1jYivQIcmj1ae425auqjUqRRl0x6uYVspHZv
	5An2QKE1mC7DNqv1I11ynnP8dtf9O
X-Received: by 2002:ad4:4e09:0:b0:8cc:dd12:a545 with SMTP id 6a1803df08f44-8cee5f9e8c3mr5117576d6.8.1780598941790;
        Thu, 04 Jun 2026 11:49:01 -0700 (PDT)
X-Received: by 2002:ad4:4e09:0:b0:8cc:dd12:a545 with SMTP id 6a1803df08f44-8cee5f9e8c3mr5117046d6.8.1780598941090;
        Thu, 04 Jun 2026 11:49:01 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccd9fda2sm60367866d6.2.2026.06.04.11.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:49:00 -0700 (PDT)
Message-ID: <f8a49ca906428f6190f5df2ae93a7966b7734199.camel@redhat.com>
Subject: Re: [PATCH v17 4/6] rust: faux: Allow retrieving a bound Device
From: lyude@redhat.com
To: Danilo Krummrich <dakr@kernel.org>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo	 <gary@garyguo.net>, Christian =?ISO-8859-1?Q?K=F6nig?=	
 <christian.koenig@amd.com>, driver-core@lists.linux.dev, Miguel Ojeda	
 <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org,  Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard
 <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin
 <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org, Mukesh Kumar
 Chaurasiya	 <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida	 <daniel.almeida@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 04 Jun 2026 14:48:59 -0400
In-Reply-To: <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
References: <20260603195210.693856-1-lyude@redhat.com>
	 <20260603195210.693856-5-lyude@redhat.com>
	 <DJ0AREWNNJPT.9XEZC98B76II@kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nu2Z9o1bHGObEvBacOF2lK_M3q_3pPjUTdTKIOEl7YE_1780598942
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I mentioned this already to Danilo via alternate channels, but to
clarify - this patch -is- actually needed, as we make use of
`AsRef<Device<Bound>>` in the kunit test for SGTable

On Thu, 2026-06-04 at 15:25 +0200, Danilo Krummrich wrote:
> On Wed Jun 3, 2026 at 9:42 PM CEST, Lyude Paul wrote:
> > When writing up some rust code that used faux devices for unit
> > testing, I
> > noticed that we never actually added the Bound device context to
> > faux::Registration's AsRef<device::Device> implementation. This
> > being said:
> > the Registration object itself is proof that a driver is bound to
> > the
> > device - so this should be safe.
>=20
> Yes, it should be, but the reasons are non-trivial and should be part
> of the
> safety comment below.
>=20
> =C2=A0 - faux_match() always returns 1, and probe runs synchronously
> =C2=A0=C2=A0=C2=A0 (PROBE_FORCE_SYNCHRONOUS)
>=20
> =C2=A0 - suppress_bind_attrs =3D true on faux_driver prevents userspace-
> triggered
> =C2=A0=C2=A0=C2=A0 unbind via sysfs
>=20
> =C2=A0 - mem::forget(Registration) is not a problem; if the Registration
> is leaked,
> =C2=A0=C2=A0=C2=A0 the faux device stays bound forever
>=20
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
>=20
> I can pick this through the driver-core tree already, as it seems
> this it not
> needed by this series. Feel free to resend as individual patch for
> thus purpose.
>=20
> > ---
> > =C2=A0rust/kernel/faux.rs | 7 ++++---
> > =C2=A01 file changed, 4 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/rust/kernel/faux.rs b/rust/kernel/faux.rs
> > index 43b4974f48cd2..e0856b2964a2c 100644
> > --- a/rust/kernel/faux.rs
> > +++ b/rust/kernel/faux.rs
> > @@ -25,7 +25,8 @@
> > =C2=A0///
> > =C2=A0/// # Invariants
> > =C2=A0///
> > -/// `self.0` always holds a valid pointer to an initialized and
> > registered [`struct faux_device`].
> > +/// - `self.0` always holds a valid pointer to an initialized and
> > registered [`struct faux_device`].
> > +/// - This object is proof that the object described by this
> > `Registration` is bound to a device.
> > =C2=A0///
> > =C2=A0/// [`struct faux_device`]: srctree/include/linux/device/faux.h
> > =C2=A0pub struct Registration(NonNull<bindings::faux_device>);
> > @@ -59,8 +60,8 @@ fn as_raw(&self) -> *mut bindings::faux_device {
> > =C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0}
> > =C2=A0
> > -impl AsRef<device::Device> for Registration {
> > -=C2=A0=C2=A0=C2=A0 fn as_ref(&self) -> &device::Device {
> > +impl AsRef<device::Device<device::Bound>> for Registration {
> > +=C2=A0=C2=A0=C2=A0 fn as_ref(&self) -> &device::Device<device::Bound> =
{
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: The underly=
ing `device` in `faux_device` is
> > guaranteed by the C API to be
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // a valid initialized=
 `device`.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsafe {
> > device::Device::from_raw(addr_of_mut!((*self.as_raw()).dev)) }
> > --=20
> > 2.54.0

