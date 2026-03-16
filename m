Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BD3557F3
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 21:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773697878; cv=none; b=Q/Tg0dXLESAC5FkoLVhffkRGEo1yMojfkEwKhO9NH2uIVguPBDNLAosEjwl7xrRmJ4d/25rw+7yef1lh7rkMmyODmkl+Jso5/0+joUtMEpnnaG4lOKpmd7S42oZyYjei5e+lf5utRH/uJFVRiobzU+6fU+1/DVvxU6Ql4J1qVT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773697878; c=relaxed/simple;
	bh=kP5N1/IAK7QvPGJUIVMiXoLgrQoIsJQUUL4F8SU7wyo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dcrS2rUgRxVpzEyJ6mKHXrMUtjpA2uxCjRfD/LxN5BJJNt563T9SqCa+Yz5flmyD2odKZmUAlD9UXuxiHo+IMZR8FF5EqGTRtX4XVipnhhl7XgrCcIOmSUxiP/Vi4QNqxC6GVVNFUVmm9tcct95fGlU6G4QltzVD1tKH++Mk37A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kPnfapBf; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kPnfapBf"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-b941d4b7f2cso511083866b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 14:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773697875; x=1774302675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2/tZIe+BPoFvmilCuBDIILyAAAE/8kY1OOmSixpK45Y=;
        b=kPnfapBfHZql+JDTE7858vyTOsQ2InSfcBbgD7URqucoqgY7d+utxlss1c6QuQKgw7
         4DFGsDme/Ks376SSjs108VEV0WBkwcRQNcWH5PSyNvwh18zFZNq3AZgbH8zMRhRqlA6C
         h6cR9BdkZbLyBuzZwdHGxZQy/zzQvHzYGB5+4QeYfM5BvFtx2WCbgc7UHA8jmRfoQ+NE
         c/B425qWCj8ElFCGPaenEpGUXvi9foSp9KrOGscC8Q/DHDld4mPrkU8Mtcw+x6chMD8N
         4V7ZyYsOYwVwhY/SRDYkdRjjiS3zrwNpxyT5eKa7XPNSvWZvgPsioSHFQSLuGCAA9xt+
         MZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773697875; x=1774302675;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2/tZIe+BPoFvmilCuBDIILyAAAE/8kY1OOmSixpK45Y=;
        b=cNN7v6hYzl9RogTPCWFTcM5IHpvqWKv6dWHZXPi/v76CcFBj/+shtx1PipTauSudCY
         P1Zvb0myfnR89aKrgFqEIfgfRrnQIAX9wozoGdKJ7Kmda2CyBu6W4fb+pMztCSUHZxFq
         1pmr1R1pOFwpX/eW8zsyszUFP/g0feabtNz/IvLpRyO+v6Y1nOgoliAjNYb4K4aEo51o
         mS4v8zOMxJHnmfae75HlxduA6BU1zd4I/v4kci5ZZrKBXYlRhTu554DcALgn82gO+ZBP
         Kf4Nzvt8o4mqCjLliacUgdIkiPxjxPAFMmtfdRkjQBJhTXb5hXos4RFRiHKGtIO0IXgH
         Kwsw==
X-Forwarded-Encrypted: i=1; AJvYcCVvIKrzJZzvF3AwpAGW/gVDxymLfozr9uWyUOpD4y0rKzUlZF6I923LWXb7SEVlgctNSB9+N+/n0gY7d3/DvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ6N1J4O7WMvGAK6L8JSLki6YpVRKNN7QR0cNPWoydz3Z5AWSd
	Kxo1znx32Pm8KbGcdTiAu5Q93jUDnkp5+T8KOPeYESFTPto3eYn9o4SxX0ApQU89QLejnGt0Uwv
	jEo9k9wTozmoFiXgRKw==
X-Received: from ejdf22.prod.google.com ([2002:a17:906:856:b0:b97:73c7:6049])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d90:b0:b97:b03d:d264 with SMTP id a640c23a62f3a-b97b03dd8d2mr399815166b.4.1773697875178;
 Mon, 16 Mar 2026 14:51:15 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:51:13 +0000
In-Reply-To: <e47d8712100d8aba2b77425cb4912cb2c3966e19.camel@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260316055736.1690546-1-ttabi@nvidia.com> <20260316055736.1690546-3-ttabi@nvidia.com>
 <abhrJgPEiIRCvmwe@google.com> <e47d8712100d8aba2b77425cb4912cb2c3966e19.camel@nvidia.com>
Message-ID: <abh7UWSgRHtQlAxI@google.com>
Subject: Re: [PATCH v9 2/6] rust: uaccess: add write_dma() for copying from
 DMA buffers to userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"mmaurer@google.com" <mmaurer@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, Eliot Courtney <ecourtney@nvidia.com>, 
	"nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"dakr@kernel.org" <dakr@kernel.org>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 09:42:44PM +0000, Timur Tabi wrote:
> On Mon, 2026-03-16 at 20:42 +0000, Alice Ryhl wrote:
> > On Mon, Mar 16, 2026 at 12:57:32AM -0500, Timur Tabi wrote:
> > > Add UserSliceWriter::write_dma() to copy data from a CoherentAllocati=
on<u8>
> > > to userspace. This provides a safe interface for copying DMA buffer
> > > contents to userspace without requiring callers to work with raw poin=
ters.
> > >=20
> > > Because write_dma() and write_slice() have common code, factor that c=
ode
> > > out into a helper function, write_raw().
> > >=20
> > > The method handles bounds checking and offset calculation internally,
> > > wrapping the unsafe copy_to_user() call.
> > >=20
> > > Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> > > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> >=20
> > > +=C2=A0=C2=A0=C2=A0 /// # Safety
> > > +=C2=A0=C2=A0=C2=A0 ///
> > > +=C2=A0=C2=A0=C2=A0 /// The caller must ensure that `ptr` points to a=
 valid slice of `len` bytes (i.e., it is
> > > +=C2=A0=C2=A0=C2=A0 /// valid for reads of `len` bytes).
> >=20
> > I don't know how I feel about this 'valid slice' thing. The memory migh=
t
> > be dma memory after all ... just say it's valid for reads of `len`
> > bytes.
>=20
> Shouldn't the safety comment also say that `len` is valid for writes to s=
elf.ptr, not just reads for
> `ptr`?  I know there is a "if len > self.length" check.  Does that check =
obviate the need for a
> safety comment that references self.ptr?

You do not need the caller to do anything special about the userspace
part of the write. That's just safe because 'copy_to_user' either
succeeds safely or returns an error. Only reading from `ptr` is
dangerous here.

> Maybe I should rename `ptr`, to avoid confusion with self.ptr.  Would be =
okay to rename it to
> `from`, since it's copying from that kernel address?

Yes, that is a good suggestion.

> > After all, in below SAFETY: comments, you also argue that it's valid fo=
r
> > reads, not that it points at a valid slice.
> >=20
> > > +=C2=A0=C2=A0=C2=A0 unsafe fn write_raw(&mut self, ptr: *const u8, le=
n: usize) -> Result {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if len > self.length=
 {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 return Err(EFAULT);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY: `data_ptr` poi=
nts into an immutable slice of length `len`, so we may read
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // that many bytes from i=
t.
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let res =3D unsafe { bind=
ings::copy_to_user(self.ptr.as_mut_ptr(), data_ptr, len) };
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // SAFETY:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `self.ptr` is a user=
space pointer, and `len <=3D self.length` is checked above to
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 ensure we =
don't exceed the caller-specified bounds.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `ptr` is valid for r=
eading `len` bytes as required by this function's safety
> > > contract.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // - `copy_to_user` valid=
ates the userspace address at runtime and returns non-zero on
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 //=C2=A0=C2=A0 failure (e=
.g., bad address or unmapped memory).
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let res =3D
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u=
nsafe { bindings::copy_to_user(self.ptr.as_mut_ptr(), ptr.cast::<c_void>(),=
 len)
> > > };
> >=20
> > Points 1 and 3 in this bulleted list do not seem to address any actual
> > safety requirements of `copy_to_user`. Yes, the function validates
> > userspace addresses at runtime, and this is part of why its
> > implementation is safe, but it's not a precondition on the caller.
> > There's no way to call `copy_to_user` where it would not validate the
> > userspace address at runtime.
>=20
> Fair enough, but I'm struggling to come up with a safety comment that doe=
sn't just repeat what's in
> the function comment:
>=20
>     /// The caller must ensure that `ptr` is valid for reads of `len` byt=
es.
>=20
> (and maybe also valid for writes to self.ptr).
>=20
> It seems to me that we're just extending the safety conditions copy_to_us=
er() directly to
> write_raw().  That is, the reason write_raw() is unsafe is because copy_t=
o_user() is unsafe.=20
> Therefore, shouldn't the safety comment for copy_to_user just be:
>=20
> // SAFETY: Caller guarantees `ptr` is valid for `len` bytes (see this fun=
ction's safety contract).

Yes, that's a good safety comment for copy_to_user(). I think most
commonly it is worded like this: "By this methods safety requirements,
the caller guarantees that `ptr` is valid for reading `len` bytes."

Alice
