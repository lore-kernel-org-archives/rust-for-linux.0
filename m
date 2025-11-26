Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF802E62B7
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 09:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764150878; cv=none; b=p0olBN7Bg6jXjZGUQtjFPYE8OUZydXBb/wG/qtN564gyvchxibTkfx2iWYE63TO8fPeP8c2LqC2oOQcTWitNUKJHio6i2jAepBrT23a868qxv4fVANyn4Si8g37U9LGFRhWai4RFjXDfFnmBMPFN7GclzYGyxyJdtknWxzHG694=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764150878; c=relaxed/simple;
	bh=S4gugaTmO7lQuqbumhmX4KYCkjFRndNnqv9R/Q0VtAY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=h2MK4zn4id/usSHr9lvC/51z8BPea/sIgivRK9H5E+wx4lDW8e94pDH/3kaYTrNInTXdZbK5NqTp5yRSt21b1aTiofRJ6h6e9UUgMVodew9bkn9P7o18jksRQ2r7KErHhKo+urIEVbrCGni5LQae5e/egYaWx17AUu9Sg+6q6bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=noHnTMvX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="noHnTMvX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477a0ddd1d4so59876005e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 01:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764150875; x=1764755675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P4pWV52Y/VlAYshTv/rppE52D3hyLd2Ys7b3DAPCZVk=;
        b=noHnTMvXGZaR5th2H8eJ/GMiC5XbTy+AC5wDi5d7jlMKvYfTHybiVCbiPKDcUUoFbY
         ZOJnDB5ovENy8yBZIsUOFyjsTeI21v24DNj2UjDaa1VbUWd8Pvg1ON3zEVNr43Bvks+6
         poh4cVw0Xti/AGXcf5IAZtTgnSAnD4ToOcmU1PIK1dnO0GqH0sbAaikamQCeeTVRmncA
         qxou+j2LH93RTHRIwvUVXc8DEZciGcDC+6oNLI9y94QaSBDDDivj1bh57Jn2P6/XsUzB
         uzh59ouVii6u/W53AQgcKbMtKJF2KIIATqKB773+AeTl015mN7BmGRIjMSX5FHotQJ1k
         tXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764150875; x=1764755675;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=P4pWV52Y/VlAYshTv/rppE52D3hyLd2Ys7b3DAPCZVk=;
        b=sIQ/ytHQPAFUq6AwBbwlWgAqGnbLdtJALMxw/B6o2L1wgBg4MBxohIgzz0tDZeHq5p
         5E6yX4Yk42c6KWejHH0RG/W4Z7L7Ezshi47NFNMwGYRQS3y44AJpC1o9oC1ho23BRgh9
         2wXcAR7mEfv/mqyftopYQC11k2JwvJQfPJSxH4B+CiIypHU0xTvqMj8oxtYXgXy0MUhr
         ncd0Znm7t36utHu6p3Jrd/83TwKx405oNWc4iiirtGO5ldxxn3GHDgsHBN3SKC4p+Gax
         nDDBrPn4ppCg93lcxrxnKtPs5mgCt5cwfJ3OtyzN32w7ldwjECnnJPQYLoztY2oIzMkz
         HhrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+tdCAWMndFw82+ETV+0+dCdwN3JG/AEOMDhZNxdrSqQV6klMCJ1zA9TTA4hWA34iguwdq4NovHBufc/yWIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTh7tx6Xv9BB4TkarIx/2UZ6Orpjzij1x6hsDuZIo8PKDHO+89
	pLGwCZ9ysXb3g2VuPsBCv0NLYv/80bMltC7/ZvOEFgyRz806QkvEW5YIL+Lq2QTcpG+MaBnbZqO
	u3NTKS1ohlRvWJu9Amg==
X-Google-Smtp-Source: AGHT+IG/3B9kpEdz3dehtGK7evQWMTHrI4wGty5GonhDLixPcoHZ9HaKZwpzZ8t04fw05yHSRgs2R0qwKzxHGLg=
X-Received: from wmri27-n2.prod.google.com ([2002:a05:600c:8a1b:20b0:477:9d5d:3b50])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f85:b0:477:7b30:a6fe with SMTP id 5b1f17b1804b1-477c1116013mr170632525e9.18.1764150875157;
 Wed, 26 Nov 2025 01:54:35 -0800 (PST)
Date: Wed, 26 Nov 2025 09:54:34 +0000
In-Reply-To: <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com> <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com> <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com>
Message-ID: <aSbOWhKIpCBm0NKL@google.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, brendan.shephard@gmail.com, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
> >>
> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@=
nvidia.com> wrote:
> >> >>
> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> >> > Use page::page_align for GEM object memory allocation to ensure t=
he
> >> >> > allocation is page aligned. This ensures that the allocation is p=
age
> >> >> > aligned with the system in cases where 4096 is not the default.
> >> >> > For example on 16k or 64k aarch64 systems this allocation should =
be
> >> >> > aligned accordingly.
> >> >> >
> >> >> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> >> >> > ---
> >> >> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
> >> >> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >> >> >
> >> >> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/g=
em.rs
> >> >> > index 2760ba4f3450..a07e922e25ef 100644
> >> >> > --- a/drivers/gpu/drm/nova/gem.rs
> >> >> > +++ b/drivers/gpu/drm/nova/gem.rs
> >> >> > @@ -3,6 +3,10 @@
> >> >> >  use kernel::{
> >> >> >      drm,
> >> >> >      drm::{gem, gem::BaseObject},
> >> >> > +    page::{
> >> >> > +        page_align,
> >> >> > +        PAGE_SIZE, //
> >> >> > +    },
> >> >> >      prelude::*,
> >> >> >      sync::aref::ARef,
> >> >> >  };
> >> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> im=
pl PinInit<Self, Error> {
> >> >> >  impl NovaObject {
> >> >> >      /// Create a new DRM GEM object.
> >> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<A=
Ref<gem::Object<Self>>> {
> >> >> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
> >> >> > -
> >> >> > -        if size =3D=3D 0 || size > aligned_size {
> >> >> > +        // Check for 0 size or potential usize overflow before c=
alling page_align
> >> >> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
> >> >>
> >> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - =
well,
> >> >> I'll admit it looks better as a placeholder. :) But the actual alig=
nment
> >> >> will eventually be provided elsewhere.
> >> >
> >> > What about kernels with 16k pages?
> >>
> >> The actual alignment should IIUC be a mix of the GPU and kernel's
> >> requirements (GPU can also use a different page size). So no matter wh=
at
> >> we pick right now, it won't be great but you are right that PAGE_SIZE
> >> will at least accomodate the kernel.
> >
> > In that case, is PAGE_SIZE not the wrong constant? What's the actually
> > correct constant here?
> >
> >> >> >              return Err(EINVAL);
> >> >> >          }
> >> >> >
> >> >> > +        let aligned_size =3D page_align(size);
> >> >>
> >> >> `page_align` won't panic on overflow, but it will still return an
> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let=
's
> >> >> you return an error when an overflow occurs.
> >> >
> >> > The Rust implementation of page_align() is implemented as (addr +
> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflo=
w
> >> > if the appropriate config options are enabled.
> >>
> >> That's right, I skimmed its code too fast. ^_^; All the more reason to
> >> use `Alignment`.
> >
> > Alignment stores values that are powers of two, not multiples of PAGE_S=
IZE.
>=20
> Isn't PAGE_SIZE always a power of two though?

Yes it is. Maybe you can elaborate on how you wanted to use Alignment?
It sounds like you have something different in mind than what I thought.

Alice
