Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B97F23D281
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 14:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764080576; cv=none; b=Z4ov2sGcNwxTBgS7+6hhcYB6fnLix05QHqQE06PzKXFmnGZt3otInL3M9d9DqX7fLvuGYvYWKNzOvyx9G855i5d9JR8w/a1N2YvdWgR6HxtBQxhTU68lEJSEbBAKn0mACnhU18WBlknv1qu85ZFMrq6AFH7aXv4OL5tx4PGgVK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764080576; c=relaxed/simple;
	bh=SRKoFuOUD1fJozvJfcfLCTLodVX08ExcSJJP8gTJJ/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SbPlUvlQxSyJ2YDvEbLQJuOM7a2PrDXcv8ZjKymCdJRHd+5IDYLDTHx1BtFmEWtz6sanRmy4W/9b7iBUQ9dA/70FeHIKJbfSt90ofn54zK8ajvP/ErwRrxdzFtEDjTOsrGYMcKuq2UrTxlbvwRf4GuFKycYDZJipvfD36ZS+LLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uzDulWQU; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uzDulWQU"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b2dc17965so5272330f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 06:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764080572; x=1764685372; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LYT1VtoVlzvOZrdkNdZF/nKv9vz8mfrTW6PpEO5ou4E=;
        b=uzDulWQUPB+mcW9QhemP5iU4/sdww10YbFrg0ysNetRDGMiBakrXkDJY2Hkk2h4Kwn
         l5t/7ddwgpOkX4OPOyXnhQtNx5lg0VSWoHgBB3CUnnotCaWMx2BeDa5XXFN9HNSCC0nG
         skUnxMECSgzNyzXgpv1cjNQzoH8J/V5EJ3gcjTQjGCNiGhHAbof40MyTfyilU/T6c3r9
         VGSiFI3cnOa0zpJn0xPn9mTIRtSDXGTG1gZkEnfXjO+ZI1tWLrFfgbUS45q+9cAmWuz1
         XAG0+4KniVrpQIIpcodPTwP0ycafpI8lIBaVg9r3OO5Ejkh9jR8cXUhSFELU8RYAA3wn
         KYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764080572; x=1764685372;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LYT1VtoVlzvOZrdkNdZF/nKv9vz8mfrTW6PpEO5ou4E=;
        b=u1bbhHjUnsmk+bzpPiBPwHL3MTA+dABvb1Yao1AIbzaz/tTTOhGV2JiUGwdaoglj78
         Vwty5DzTOb3Bq3Q3NbnXsSALJH+vnRImEbTYQx1DTwv7RVPGkDaikUVHX0mxF4GS+gL9
         Bs5KB/4lET9GnJCOBtljyM0MJPi5d/gH1u7Zod4RqgawpZApSsATMHwxAbXUi/Y1luLu
         jhzf+GZf2PDnRICUGaXfygcSRxSGJP2dV2SMymAn4DqfsLdvOm85nq5oW8wvlH22EV0R
         lrrUmrGUVFhfISG9do3NdbPPt9pm8I6WrMi375RaLupVgFas85MjBcBZaf2Tfol1mgWP
         4FiA==
X-Forwarded-Encrypted: i=1; AJvYcCVP0BX+TvzoemFV+C5FygEKliqKvMrGn2/fGex4ZFmYqABKEhi4HH3H/vDbOZMxXvGQcECGHFAJNEdNVk+5Gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5PzmN8l8aPKjRJiLiishxLtEKME3JXfpwwd+A/B0XnG9KT36o
	DhHsHwgu7AkbuXj1BUGyw4TiwOgPVb7tGOpTYhsW54fqkjNnixp75sRuz0rRFOYPojaQjrbddBG
	jRAHkQpgcgLBkk1px0V9aF+V8ArlRZOwBpcGtK+hr
X-Gm-Gg: ASbGncswKJEAuTcbu+aGAzLKxm0s31nYPkkZd8ZG8h0pJU+pf9JezMfA2UmhL3Gv7rq
	cTeEU3I+jyVNvCk7n3465cARzI4XAtptCOv1ait9gcp7CopOSgUKTYXRBGk7KX7rwcJ/iuFgfij
	gTs6ijc8v6b+Qfl26YVOtMT5SFnR2rcB+Hny0wMB+AsJ1tEvgEOuVjlrsCWtRszMFkquUHJTOKT
	PRp3mXJeO/G0oZx/cvF4Ny95yOfJUTeASVnuhBSkRfx5vQRtkRA2N4SuR4FJXERPSB0ED3sG3bR
	SXH61PMrw1E=
X-Google-Smtp-Source: AGHT+IH2MYO2xalTpJnW5pkTtgy3I5HydZt5liuweeYqfukYO9an6xcfvAyiUF1iJKqDv9hzAKbiFMbEsz451F/xstY=
X-Received: by 2002:a05:6000:1445:b0:42b:3ed2:c08a with SMTP id
 ffacd0b85a97d-42cc1cbd06dmr17365312f8f.13.1764080571675; Tue, 25 Nov 2025
 06:22:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119112117.116979-1-zhiw@nvidia.com> <20251119112117.116979-4-zhiw@nvidia.com>
 <DEHU2XNZ50HW.281CCT1CZ79CF@nvidia.com> <DEHU7A4DWOSX.PZ4CCKLAH9QV@nvidia.com>
In-Reply-To: <DEHU7A4DWOSX.PZ4CCKLAH9QV@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Nov 2025 15:22:39 +0100
X-Gm-Features: AWmQ_bnmcUvz0D0w8i5WIfKnJ-siR4BLsptNpV2Tb4YAf1c-9xeQGVhAxsn-1ec
Message-ID: <CAH5fLgiCgMse0-L9Fb_r=3umucTqNosfO4R+1YVzOqavo07zMg@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] rust: io: factor common I/O helpers into Io trait
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, dakr@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, markus.probst@posteo.de, helgaas@kernel.org, 
	cjia@nvidia.com, smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, zhiwang@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:15=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Nov 25, 2025 at 11:09 PM JST, Alexandre Courbot wrote:
> > On Wed Nov 19, 2025 at 8:21 PM JST, Zhi Wang wrote:
> > <snip>
> >> -impl<const SIZE: usize> Io<SIZE> {
> >> -    /// Converts an `IoRaw` into an `Io` instance, providing the acce=
ssors to the MMIO mapping.
> >> -    ///
> >> -    /// # Safety
> >> -    ///
> >> -    /// Callers must ensure that `addr` is the start of a valid I/O m=
apped memory region of size
> >> -    /// `maxsize`.
> >> -    pub unsafe fn from_raw(raw: &IoRaw<SIZE>) -> &Self {
> >> -        // SAFETY: `Io` is a transparent wrapper around `IoRaw`.
> >> -        unsafe { &*core::ptr::from_ref(raw).cast() }
> >> +/// Checks whether an access of type `U` at the given `offset`
> >> +/// is valid within this region.
> >> +#[inline]
> >> +const fn offset_valid<U>(offset: usize, size: usize) -> bool {
> >> +    let type_size =3D core::mem::size_of::<U>();
> >> +    if let Some(end) =3D offset.checked_add(type_size) {
> >> +        end <=3D size && offset % type_size =3D=3D 0
> >> +    } else {
> >> +        false
> >>      }
> >> +}
> >> +
> >> +/// Represents a region of I/O space of a fixed size.
> >> +///
> >> +/// Provides common helpers for offset validation and address
> >> +/// calculation on top of a base address and maximum size.
> >> +///
> >> +pub trait Io {
> >> +    /// Minimum usable size of this region.
> >> +    const MIN_SIZE: usize;
> >
> > This associated constant should probably be part of `IoInfallible` -
> > otherwise what value should it take if some type only implement
> > `IoFallible`?
> >
> >>
> >>      /// Returns the base address of this mapping.
> >> -    #[inline]
> >> -    pub fn addr(&self) -> usize {
> >> -        self.0.addr()
> >> -    }
> >> +    fn addr(&self) -> usize;
> >>
> >>      /// Returns the maximum size of this mapping.
> >> -    #[inline]
> >> -    pub fn maxsize(&self) -> usize {
> >> -        self.0.maxsize()
> >> -    }
> >> -
> >> -    #[inline]
> >> -    const fn offset_valid<U>(offset: usize, size: usize) -> bool {
> >> -        let type_size =3D core::mem::size_of::<U>();
> >> -        if let Some(end) =3D offset.checked_add(type_size) {
> >> -            end <=3D size && offset % type_size =3D=3D 0
> >> -        } else {
> >> -            false
> >> -        }
> >> -    }
> >> +    fn maxsize(&self) -> usize;
> >>
> >> +    /// Returns the absolute I/O address for a given `offset`,
> >> +    /// performing runtime bound checks.
> >>      #[inline]
> >>      fn io_addr<U>(&self, offset: usize) -> Result<usize> {
> >> -        if !Self::offset_valid::<U>(offset, self.maxsize()) {
> >> +        if !offset_valid::<U>(offset, self.maxsize()) {
> >>              return Err(EINVAL);
> >>          }
> >
> > Similarly I cannot find any context where `maxsize` and `io_addr` are
> > used outside of `IoFallible`, hinting that these should be part of this
> > trait.
> >
> >>
> >> @@ -239,50 +240,190 @@ fn io_addr<U>(&self, offset: usize) -> Result<u=
size> {
> >>          self.addr().checked_add(offset).ok_or(EINVAL)
> >>      }
> >>
> >> +    /// Returns the absolute I/O address for a given `offset`,
> >> +    /// performing compile-time bound checks.
> >>      #[inline]
> >>      fn io_addr_assert<U>(&self, offset: usize) -> usize {
> >> -        build_assert!(Self::offset_valid::<U>(offset, SIZE));
> >> +        build_assert!(offset_valid::<U>(offset, Self::MIN_SIZE));
> >>
> >>          self.addr() + offset
> >>      }
> >
> > ... and `io_addr_assert` is only used from `IoFallible`.
> >
> > So if my gut feeling is correct, we can disband `Io` entirely and only
>
> ... except that we can't due to `addr`, unless we find a better way to
> provide this base. But even if we need to keep `Io`, the compile-time
> and runtime members should be moved to their respective traits.

If you have IoInfallible depend on IoFallible, then you can place
`addr` on IoFallible.

(And I still think you should rename IoFallible to Io and IoInfallible
to IoKnownSize.)

Alice
