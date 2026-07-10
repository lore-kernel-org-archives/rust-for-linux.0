Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A75F2C0F93
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 14:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693418; cv=pass; b=EI6tu8l727yg5MvJMZgd8Aa1+X6/sNpYwXpIfWQKHZPCj+M1yvIeb9zVlGB3NcO77Yce3HmTltMUFEh8MYJhaNSwLDu2w+ZnPpf37ts2JnXEYJqjOtJ7gCxsrmwcBesu0p17CrjQtMajZx9EZYMpFCxGywZMlGylxOnxpWPfab4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693418; c=relaxed/simple;
	bh=GUhA3jFSbJcIsCXMljVbvLOXIxyxqgu1sDVkQU4+pPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgmJAhQtAWinY40RReHF77uJAgh8ahOh+u4vveKJKfWFrJoye3oqVbmXmpn2TqjxQz2kVkUzXLOKgk1qB/QwQ95giVlHrJFf8sk6cdBtZbS0zwB1XmCJD5eWDeyqvVHAqDL9u3QbefmgfEr/f7Buv7DOJOE7YXxyNTCzCn6y640=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T4rX6fU5; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T4rX6fU5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47640541585so516876f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 07:23:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783693414; cv=none;
        d=google.com; s=arc-20260327;
        b=nYhhcZn5VTNpsb3/Q1u98pDHnIIDLbVxcjKvtco+ki6IkeiJxPpoqgrF82837bMANz
         rRH5T8wKEgeMc03S/DhHlM6cjtJg0HLrs2mcC1wpYGSMJDKdTgZ/Fll4qhYoeaXjfUEc
         akXWtEwSlwOitQdNnz6xYpUCbOXBNXn4Wj3LWCuLxSTSa+VyYfOxsHQYxq+hKUN7uJsv
         S/KEiie8cWr29dq++j0N4Bw5XdI9pGs7zHCM0mh7ztZ1VEg9oPgGP2kWVmMm1C8fa8vU
         rLcgFTJ++WXp7roSJcjM2J/VdUTIAvEdV8KIyfie0nSjNcO/QAwWCfKul0g7X58rUofC
         pEyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZdEXK77UFhy/cOL68bwMcQ0ItCStn1PAee3xYDI8PJ0=;
        fh=viNhhezvS1+r3B5wV8gny4duxX4VxKEaHqrqWOstoX0=;
        b=PFga7CaiuB+ZsWwcCzKzhWjBW8cb0Z4FoxdM9txaHiskV8JSMo+JUBpWN2KckecJIE
         qYOpmeZaYqB6qPbIMVjQ+rJPAuVxV5DmTNJjjCeUtDKbqex3aBuoitxlz0d/Nsa5aHg9
         p/fRWaVmebySFhhgEouBgd+cUC6Xrr6EKrQoI0i46gwd+hpyMP351jW2naDg/y6eBq8I
         +uAB6jpDwulLJeyWFuvk/Otjbf7ZESJpCes3mAzUVH4VVHsGSoj8eh0c7kcAZdaX1SIf
         a/CMwRIi12cN/jeaLtlEPKuofEj92lGstkxFnimpzA3x/X/X3rXU+2MDwMx2bsRqCV9X
         nsDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783693414; x=1784298214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZdEXK77UFhy/cOL68bwMcQ0ItCStn1PAee3xYDI8PJ0=;
        b=T4rX6fU50zEpbf54KFDm72icY/54Ge8IHRMglm57o1fW/gJIKBRZgPXQ5O8KZhJAtI
         Jis5oK8x0RbJRticCEARU88uQPq5tDGJ0CoCJ119hnbmNonnejxfXU9E3RV2y5An0Wjp
         404eJyhZyp77mauBznzgDNKjP7lLcK5FjaTmLRuqd1UrtoilcSmYL/TiPa7gTVFb20W/
         Q1VoNlbMH88kOlxSVitAhODGaGgW8wDmNi/htcRZgyxIxYOuqtxygc+9qhi7Hd+NaniR
         Zy9nB4qKU9w25mU255CifR3/x7bHAf745vywdvIVtoQYjoc4ck/B4WvLURe4ICnvNJ6t
         FDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693414; x=1784298214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZdEXK77UFhy/cOL68bwMcQ0ItCStn1PAee3xYDI8PJ0=;
        b=Luq713I2gHVjhAmLkiHI3j9e++nC2+8SldEVd2BMcCWL67y5jSeqfJ/pY5xdmX2Yuj
         pXQCAeX0IvM72BPfWxGtDXQVQkuA0ANVrZWnHlZrQQ87lwayV2Plw+AKTT85AyZkcmLn
         F71RMv4wpKdujwiP20BMMhhBGXMKk4oTryQUt36VK4wSG+mV1JJFbD3dMVqj7SlX8XGr
         DvQp4foGKmfDegV+ZH8CdgigKWry7FNBr8wKXHFVzb6GGErczb51m62sMFUZmuoLFJIF
         EV5Y4vK6M+kNMxI1pMhIWP3ktbURf3dqqvyrHtOjIwY0kAV2Tkir2wGdW8OnrknuPdSC
         fjHw==
X-Forwarded-Encrypted: i=1; AHgh+RoS4QR9RCbGFATKy71147cici3zTYovsmoFvs9BZ04rn3sRMrDRwbsNxHjAt23+SU14iX9FUAvb+kS7xRTUeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnFBVLUWk2mPETLcNy9ZIF7MieIr8Aj0dR/spXZiNus0A99afQ
	oHyVi0loUj2ul5SKpUj7Ui3BKPJ/BHTw6WOT4MheTkpE8JOViEYaJALCA4vOuSHK1rLlNX1W89F
	ZfhT9hOqd41d/aXNiG52nN5g0rvC74ML9DQWjuPkL
X-Gm-Gg: AfdE7cmhk5pRV7tI9V/Hh9Wv9elQS4AF3zA+PD5AtLTftNr4ArRTu1Ao9JKvCp6fLNK
	IAnCnTjTUKNyBipCImr8UMXK3IyvMIMg6cGrBtlRg7gSAIM7apoUnjuaKEJSZWI0XbSDXLHNZfb
	zlnFEdkSJvuFeBszXcrYjvrWeeNHbQHaOf7mKzOqWCUAHdRndLtN9hZJRJvSqDlhJCUutH0Dpmx
	0hmikPsSnadVT5i1qssG5EyimPDEVBZzNvh4i9XZm8u7RQw/wz2sSB3UtoMSze3/t1ZpYX7CUFT
	OqkZ6URCkt/Kx6BcbBjzUqzjtySWoWI+xcGbgoZXasW0kuzqQpZdYwBF02A=
X-Received: by 2002:a05:6000:2482:b0:477:6874:5415 with SMTP id
 ffacd0b85a97d-47df074605amr12898798f8f.26.1783693413737; Fri, 10 Jul 2026
 07:23:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-chid-v1-0-84fe8259e46e@nvidia.com> <20260703-chid-v1-3-84fe8259e46e@nvidia.com>
 <2026070334-dollar-hexagram-e49c@gregkh> <DJSDFHOADWYL.V4WC2TI9UWYF@nvidia.com>
 <2026070745-unwired-maybe-769e@gregkh> <ak0pzDc69nAmnviD@yury>
 <2026070839-quadrant-gentleman-2334@gregkh> <DJUYI5EL9MCS.F6LWYD6821YM@nvidia.com>
In-Reply-To: <DJUYI5EL9MCS.F6LWYD6821YM@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 10 Jul 2026 16:23:20 +0200
X-Gm-Features: AUfX_mxGtzRTvhuK561wSbk819Xm8Or_NDy_i70dNzRqnXHoPTSZcfN6JkQkc_c
Message-ID: <CAH5fLgi3tndgpVc_qNMCxk4PCB57EZLf9X7OwpEr=mg8FwGf7Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] rust: id_pool: add contiguous area allocation
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, Yury Norov <ynorov@nvidia.com>, 
	Burak Emir <bqe@google.com>, Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 4:21=E2=80=AFPM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> On Wed Jul 8, 2026 at 2:33 PM JST, Greg KH wrote:
> > On Tue, Jul 07, 2026 at 12:31:08PM -0400, Yury Norov wrote:
> >> On Tue, Jul 07, 2026 at 04:13:30PM +0200, Greg KH wrote:
> >> > On Tue, Jul 07, 2026 at 10:25:27PM +0900, Eliot Courtney wrote:
> >> > > On Fri Jul 3, 2026 at 7:31 PM JST, Greg KH wrote:
> >> > > > On Fri, Jul 03, 2026 at 07:16:06PM +0900, Eliot Courtney wrote:
> >> > > >> Add support for contiguous area allocation. Add a new type,
> >> > > >> `UnusedArea`, following the same pattern as `UnusedId`.
> >> > > >>
> >> > > >> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> >> > > >
> >> > > > Why isn't the built-in idr library being used here instead of ro=
lling
> >> > > > your own data structure?
> >> > > >
> >> > > > thanks,
> >> > > >
> >> > > > greg k-h
> >> > >
> >> > > For nova-core in this series, we need allocation of a contiguous
> >> > > sequence of IDs with a specific length and sometimes a specific
> >> > > alignment. IIUC, IDA/xarray do not support that (I checked
> >> > > ida_alloc_range and it only allocates a single ID in a range, not =
a
> >> > > contiguous sequence).
> >> > >
> >> > > For IdPool before this series, I think it could have used IDA/xarr=
ay.
> >> > > See [1] where Alice has posted some more context.
> >> > >
> >> > > w.r.t. the structure choice, the IDs we need to allocate are chann=
el
> >> > > IDs, and the total range is limited to 2048 of them, so IMO bitmap=
s are
> >> > > a better fit than e.g. maple tree.
> >> >
> >> > But again, you are having to "roll your own" logic here, please reus=
e
> >> > the data structures we already have in the kernel for this type of
> >> > thing.  If a maple tree works, please use it.
> >>
> >> I asked exactly the same question when Alice and Burak added wrappers
> >> for bitmaps to implement their ID pool. This is the answer:
> >>
> >>   An alternative route of vendoring an existing Rust bitmap package wa=
s
> >>   considered but suboptimal overall. Reusing the C implementation is
> >>   preferable for a basic data structure like bitmaps. It enables Rust
> >>   code to be a lot more similar and predictable with respect to C code
> >>   that uses the same data structures and enables the use of code that
> >>   has been tried-and-tested in the kernel, with the same performance
> >>   characteristics whenever possible.
> >>
> >> And now it's in a commit message: 11eca92a2caeb
> >>
> >> They measured the affect of their wrapper on performance, and it appea=
rs
> >> to be ~5%. See lib/find_bit_benchmark_rust.rs.
> >
> > You are comparing the C vs. Rust data structures here, which is not wha=
t
> > I am proposing.
> >
> > Also, is this code being used on a "hot path" like the binder stuff is?
> >
> >> I didn't see any side-to-side comparison between any native Rust API v=
s
> >> imported C bitmaps. I'm sure, I asked for that, and I still believe
> >> it's the important piece of data to avoid this back-and-forth type of
> >> discussions. So, Alice, Burak or anybody...
> >
> > Again, I'm not talking about Rust API vs. imported C bitmaps, I'm askin=
g
> > to use the C structures like maple-tree and idr instead of open-coding
> > logic around the bitmap code.
>
> Yeah, I agree that using maple tree avoids piling on more ID allocation
> implementations.
>
> Channel ID allocation isn't on a hot path (absolute peak ~100 per
> second, on average < 1 per second, AFAICT).
>
> I prototyped the implementation using maple tree [1]. It has some
> awkward points:
> - Allocating aligned IDs needs a loop on top of
>   MapleTreeAlloc::alloc_range + erase, which essentially replicates the
>   logic in `bitmap_find_next_zero_area`
> - Since aligned allocation may take multiple tries we still need
>   exclusive access in `ChannelIdPool::alloc_area` to ensure an allocated
>   but about to be erased non-aligned alloc doesn't make it look like we
>   ran out of IDs. Alternatively, can do a try+restart kind of loop
>   instead (needs adding bindings for mas_empty_area). [1] is using the
>   extra Mutex.
> - The alloc_area and Drop path of `ChannelIdPool` now allocates memory.
>   I *think* this is okay but it is a consideration.
>
> These tradeoffs weren't obvious to readers because I didn't include
> enough context in the patch series (and was going to add actual usage of
> the aligned alloc later).
>
> Anyway, maple tree does work for this, so if you prefer I'm happy to go
> with it.
>
> Thanks~
>
> [1]: https://lore.kernel.org/all/20260710-chid-maple-v1-1-4ee869055268@nv=
idia.com/

If you need to make multiple allocation attemps to handle the
alignment requirement, then I don't think maple tree is a good fit for
your needs.

Alice
