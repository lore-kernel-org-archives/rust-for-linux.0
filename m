Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F70327C1E
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 14:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764082787; cv=none; b=YlG1WwXBTtM3P1cIJyimNeW804OjJrQ1bq0yYXUFQmt2TASTy3CIMOMGPHiT32eKnQqsoqH0icadOeb9QJiCLka3bSafy1xt6U6kHSSSL/9WlXevy8XOU2zgt4N6x3yBL8pYwfCkPOiPogaJeJNBAOZkWkfxyjOG62z/7hmk8Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764082787; c=relaxed/simple;
	bh=3nCp6GWILozKSAO/o7iqDk9S31b/aO50grT0opR1frE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVpP4XhbcMuG3YatDtYghJAIfrWiF7yAzdlLSgIGCcfcVYuEBf4jHqR3FcurduzfRHMHG4IIxNDE80UgtIjxF8ZAS/SeDYwT9ySwIZGXhP2a/nGye1uwHNnbAsKXkEDz70FiFrbcc2Zn6Azmd1THAtbf41uQzjk9bl9vS66EDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tliqIBsT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tliqIBsT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso35036865e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 06:59:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764082784; x=1764687584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVagC+UMR5yq8ETeNg34KLN87w696g4GRpmIO4FmPyQ=;
        b=tliqIBsTqBkJCOKTvuLqvUyJYjMa6K68oqiautMOkV4RRFByEtpi1q+icGS+G+ZhKY
         CpYT7iVePRFM32uybFOfP3Lh1ElKx74/td3DWtgu7iiLTc3P1iL/4qGobkKMqx0mqS/u
         Y81OTUcQY3kuG1C5z9PDKFEV+EBL4NKh2auZffzocI9lPjPZ7A8Rm0I69I0jnRDpXq8G
         0mS3fV/jvX9FO4lu2BVY1a6lF4UdfqfkKvgUtuksm9Gym9/Yoz0FFH1Ibngiac4+Beh3
         fjIy7yL6MgOL7CMfILVdpIB6arjaeI2xdeax2Cd5h9DfDBMCyopBHCGbJnyT2lxTSyP6
         cVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764082784; x=1764687584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wVagC+UMR5yq8ETeNg34KLN87w696g4GRpmIO4FmPyQ=;
        b=XoKlMFLyjUuhtJsmzZHtvyHC8eQOQ7uxfujID8OaCIU89ZoY3paQ2DdCTGZRbqxyCj
         JgcHQcanatDtduot4mpKrA2ydJ9ivEfZHmRtwtFme2PFwioKWmpZwBR/0mlQYLhwGkef
         ubddUUN2sax5NFM8cJ2oKkL3UK1M23meFkL0G4MOO/PezXOcAaHC3DE3iwet+mGciwM2
         Deo1dedeaJ7qZer5Br+d2FNvKqc0/PVXuUEpgPoQnXn1WDVat/W/DNp6THe7c5eAg5l+
         CVG3HTeXQBEhTRt62kiFKIEIry+8VWcR8nGCsHNtq4eDPcdCzW0vo5ruCzNZlYzH7lYR
         Wcgg==
X-Forwarded-Encrypted: i=1; AJvYcCVZpj14IyPmFeVq2kF+3VWqTKJcQokRdx+AdQImrtI4Yjq+IrYOWAX5Qajrjvp6arYHHNZstOGLEvX3vafcxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzql5MGQkmaLbLnnlSeoHRrc7c5Lz+hD2k376BYNievDwvF/B3i
	2XOMwi0pOiqTI86naVHYxnuoshigSjuw9WZhCRJ1OXorcgH2nPCkfoG3fHA4tw4c8XCpFPf47HZ
	iR2+WVmov5jYVB9rAXzTb2uZ1IZhZxtdjfbjSyFHB
X-Gm-Gg: ASbGncsfSUvYKFZMHzAQoYXY3/RFr36wyW1iZi5b4+n2En7BmtsJHC3SDVdgLYiSI35
	EgR4xEUiKWE2vnzPNkUlKaiy8q5sm4kGBoktEoVOP9mcVLZDe8nBZnHsk1+3yw6w/FAArSNipaz
	5Ih+wSFKJ6VSbVYDbj+kBlFo5cVhVwSHlSlej49olI29GI3SMNoLgNQ24JZzdJHdj2u0+up3XPH
	SZngOCzYFlBZ28O2ywZ99UXwLxc6kmSlJFNLNNQ5Fdm2T2eUF7+8p7SE9KVdh7DuXJpHSkalPFM
	C3qGC+p/X3wYJ8IHYZSbzw==
X-Google-Smtp-Source: AGHT+IGkJd1H6nFr3Y+NpL3Q4jL39vazsIi/C69U9vhgk38tOat9OMAKfcLlUtxyzxsSslltth5ttiPh5ErFrT8805Y=
X-Received: by 2002:a05:600c:4746:b0:477:a289:d854 with SMTP id
 5b1f17b1804b1-477c04cfa31mr163605255e9.5.1764082784106; Tue, 25 Nov 2025
 06:59:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com> <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
In-Reply-To: <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 25 Nov 2025 15:59:32 +0100
X-Gm-Features: AWmQ_bndHTe5QCQ088hdVQsq2DsGQ4RRnTSFaROGBSL304Eztip9Q7IRWvmenF0
Message-ID: <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, brendan.shephard@gmail.com, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <acourbot@nvi=
dia.com> wrote:
> >>
> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> > Use page::page_align for GEM object memory allocation to ensure the
> >> > allocation is page aligned. This ensures that the allocation is page
> >> > aligned with the system in cases where 4096 is not the default.
> >> > For example on 16k or 64k aarch64 systems this allocation should be
> >> > aligned accordingly.
> >> >
> >> > Signed-off-by: Brendan Shephard <bshephar@bne-home.net>
> >> > ---
> >> >  drivers/gpu/drm/nova/gem.rs | 11 ++++++++---
> >> >  1 file changed, 8 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/nova/gem.rs b/drivers/gpu/drm/nova/gem.=
rs
> >> > index 2760ba4f3450..a07e922e25ef 100644
> >> > --- a/drivers/gpu/drm/nova/gem.rs
> >> > +++ b/drivers/gpu/drm/nova/gem.rs
> >> > @@ -3,6 +3,10 @@
> >> >  use kernel::{
> >> >      drm,
> >> >      drm::{gem, gem::BaseObject},
> >> > +    page::{
> >> > +        page_align,
> >> > +        PAGE_SIZE, //
> >> > +    },
> >> >      prelude::*,
> >> >      sync::aref::ARef,
> >> >  };
> >> > @@ -27,12 +31,13 @@ fn new(_dev: &NovaDevice, _size: usize) -> impl =
PinInit<Self, Error> {
> >> >  impl NovaObject {
> >> >      /// Create a new DRM GEM object.
> >> >      pub(crate) fn new(dev: &NovaDevice, size: usize) -> Result<ARef=
<gem::Object<Self>>> {
> >> > -        let aligned_size =3D size.next_multiple_of(1 << 12);
> >> > -
> >> > -        if size =3D=3D 0 || size > aligned_size {
> >> > +        // Check for 0 size or potential usize overflow before call=
ing page_align
> >> > +        if size =3D=3D 0 || size > usize::MAX - PAGE_SIZE + 1 {
> >>
> >> `PAGE_SIZE` here is no more correct than the hardcoded `1 << 12` - wel=
l,
> >> I'll admit it looks better as a placeholder. :) But the actual alignme=
nt
> >> will eventually be provided elsewhere.
> >
> > What about kernels with 16k pages?
>
> The actual alignment should IIUC be a mix of the GPU and kernel's
> requirements (GPU can also use a different page size). So no matter what
> we pick right now, it won't be great but you are right that PAGE_SIZE
> will at least accomodate the kernel.

In that case, is PAGE_SIZE not the wrong constant? What's the actually
correct constant here?

> >> >              return Err(EINVAL);
> >> >          }
> >> >
> >> > +        let aligned_size =3D page_align(size);
> >>
> >> `page_align` won't panic on overflow, but it will still return an
> >> invalid size. This is a job for `kernel::ptr::Alignment`, which let's
> >> you return an error when an overflow occurs.
> >
> > The Rust implementation of page_align() is implemented as (addr +
> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on overflow
> > if the appropriate config options are enabled.
>
> That's right, I skimmed its code too fast. ^_^; All the more reason to
> use `Alignment`.

Alignment stores values that are powers of two, not multiples of PAGE_SIZE.

Alice
