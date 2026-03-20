Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB55637DEBF
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 08:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996274; cv=pass; b=dC4ukEfsJtpfXaW8YPea5Nd0gN+kKiQUIPkIK5d/2iLBSjsrO2miKstTR0r7H1zTveLIJ8nk2+Efm45UNmafytB0FT1S4qT4c6u+jY1H/Xu2fbA0BuNB52DS4lNd9PQREBDvqrUeETOBZ27kO/1n0am7+j+VXSVawKAkpZ/Impo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996274; c=relaxed/simple;
	bh=rqZrEuJgF3VxMFc6OCFM0ZsE6eIN4GqMFHcMnEa0UvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsIWDchDSQWUh/sG+lLcQZ2HFiRu5NoTKNULDFJ3ATqaIGWvg4qIuTvduKjjQ257x6nID9oJ3Jx9BAIqZAKXmk4aWgT1QApr/sm9HVANDMXyLUm/AgnY/xzQ55hvJ9EC6XVAccKg7Ce7z6e/knv0xImfOvDB7C5+Pb+aJTs56wg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g65Q0ZFe; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g65Q0ZFe"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso2774155e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Mar 2026 01:44:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773996271; cv=none;
        d=google.com; s=arc-20240605;
        b=jkjkt0PoFi+d3UO8iCzmpWSNCykF8pdVO8S4fQGDtOaDYBWbTI/ojO3TwD6jGSBiyf
         xJ1Ikthf5tenShSymozLwWczJkO0WkqB2Zbw0LqXLLQ4xR0BTBlnFYChWrpf1VfKBEG3
         mUtj3ko+lLll+HJFq99+xIk4ly0YbCeHUcBBZRnXmqfycjylrGp0gw0acLYWKMSq3FzQ
         CxFvt7VBGh8DWdiOwbeRvuWiB/gZbwN16b7wFFfvfM4bi8cdNEEHYkbtLyytfX96XFr4
         v4UtId/B9C7V2KW/AeqVtcfiBn0owZALjueuRAOk3K3wWoedkHX1+lt4DwXBzDJU71sO
         vixg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbUkI3L+YFiwZ6VYMHk7xYGBRDS4ffibIwZTj94p91Q=;
        fh=0Q61SrhpSJw2TQ66Z4Btw74bK1IlYLxwY+Ebz8RvVeA=;
        b=FsZU8JfqjuHH0ePC2FN+8u08CyWSOCyF/SLWi4OKah2JE7I3CCPuXR9tJN9dPUUmT3
         oXxyWz6DaUJmAXtCv5REYmJnBtUPgemQKz/Db4x3j156uoKxDxcJYwR3ZUnl7q5o9AyN
         0P7Ic+PYITZVAGsTQM8ZxElWEIGB4m4BXQu1YZ0cbhBNXfx89s/RQh1BhFZjl2X4Qt5r
         Lwjgp9a0eciRHH8rPl2/2tpk6jBowTpEX6f04CvnwnInbk2ubX093G1jK5NA29UIAkjG
         kqKHgsWtjtYrSJ6G+FNtLmuG2U1ONXnOfJbR+KEVsQYeiJvQ7BtvFg/wl9b7mgl2OWyN
         DfEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773996271; x=1774601071; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbUkI3L+YFiwZ6VYMHk7xYGBRDS4ffibIwZTj94p91Q=;
        b=g65Q0ZFew5ZNdv10B2/uR645tKLiW4lt5Y8OpWK19TrYuuqHsCgqMUFLArc1KeLnRg
         ANVFlCT3N0HZ5F37/wUV8a/kJ8ayBYkhkiexmWkGyJE0869tXDuNOAAAjoXZ7NVrArjs
         Pce6s/ZNboQSo1wUYPEg7CkBPkJ/UKuNvFykLhCJnYaLCKe+4+ySTEHwVF0dVKCXbnE3
         9EUFMI3bzc+TRTowFn+sjTmfBiTMuQR43X4ucZiwIRW7rRb6LwltQZu9b/akTRA8CwCF
         UPjNEjvuxKbKqSy00oX+5OaZUzLBFtBi1J0oPmTUKgYZ7yOIdJoWUbC6QwJOmRC0RRhj
         F//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996271; x=1774601071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qbUkI3L+YFiwZ6VYMHk7xYGBRDS4ffibIwZTj94p91Q=;
        b=ZJ0xJOPxd6sKleFzZMdga//cqQcOFEEDpwEtxvw4eU48ZXBXY0TAWQrOCHZW7ACwo3
         LVdc9WnXiVeYcsPoPWnmV3E8QzPz7LHG3i4cmT3V69QH17rLHRnnAqieo4xtdFROB/kC
         bcC4BF4SLhxTLnb49s9n4j802DeSgcCK0M3ejzJ1iXwArZQf0TtS1f0OKz1SUwrRn6Yx
         SUpLjEPZ4lQPyoOnyIxRvta25sjZ+PFXsvCyASrhz/VKVegVxn0QjiowX3kBs8XgZdA6
         IAE0Yu5HNrJPKzaxax2PeIvQJ91ms09t5CebHTVTlqDpp+Ll9Qcw1DSxEeanc5KVAZkg
         ZyLw==
X-Forwarded-Encrypted: i=1; AJvYcCWX+RTz8kHRBkFQ9zpL24+/bp77WLJmhtr/OIuQk5ETswyFs0KvuauJy70h49dWSxJztYXQ6wXO43DGP3qXQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhXRF+NMgYn05hN+C7GqzdHIWpgz0Qu+goXfWT7Egho2+4R+5H
	qd0kY75FJsX2fsBH2cMBxp+p1ja01pcMPWYFr3yaayPCpVZNbBFmQ2RneECY4DeSby5efDeKngd
	TEswBxPdSAnBXmfsGLFqgBUU5elwrjqnkDVeR2qua
X-Gm-Gg: ATEYQzzUb2JK/KoFqZpwaIIMk4VJRDmy4eu7nN6E7kjDDIBOTgHsM0r8E1+vFDYKN1G
	splDGnZOIQAsE6jm8cV6e/X/FFchBaX3Rl15soJnTF9MVVsUheutgURwJPNa+rGoJpgFQ/D8mFL
	zXAE5nZvdHP/1tEjP8Aj74Ggvo7KDMcsJJI+taZmFSeOZK12w6LgiiRgplpMXdFaVoPuZv2MLfa
	0rGTTxHtpnNXuKSk3knVYuSOIbLkVzX9+e5/HvExVS+XZsCzF4+hMWMSfafj3GX252N7UqGFErq
	7HT9pKP3Fwp71tISi0rxPpsU5xRYfCjGkr4nleL4S7U3Cvm8CEEngqn+DS1BrZUWjHfHzuF8
X-Received: by 2002:a05:600c:1d0c:b0:483:6d4a:7e6d with SMTP id
 5b1f17b1804b1-486fee2ff25mr32934315e9.30.1773996270660; Fri, 20 Mar 2026
 01:44:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317225355.549853-1-jhubbard@nvidia.com> <20260317225355.549853-17-jhubbard@nvidia.com>
 <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com>
In-Reply-To: <125cb5fd-55fe-4c54-bdda-0478f5a8aabd@app.fastmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Mar 2026 09:44:18 +0100
X-Gm-Features: AaiRm51XzjfVgQtD5weg9z6ftYDNiAoIzL8VkJ018M9MLOaHZzzeyJGeQTdGyH4
Message-ID: <CAH5fLgieAZz4YAp4-Y1240mVt2V_Pu3TJ8YZyMkP1ZG_neafwA@mail.gmail.com>
Subject: Re: [PATCH v7 16/31] rust: ptr: add const_align_up()
To: David Rheinsberg <david@readahead.eu>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 9:38=E2=80=AFAM David Rheinsberg <david@readahead.e=
u> wrote:
>
> Hi
>
> On Tue, Mar 17, 2026, at 11:53 PM, John Hubbard wrote:
> > Add const_align_up() to kernel::ptr as the const-compatible equivalent
> > of Alignable::align_up().
> >
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>
> > Suggested-by: Gary Guo <gary@garyguo.net>
> > Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> > Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> > ---
> >  rust/kernel/ptr.rs | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
> > index bdc2d79ff669..7e99f129543b 100644
> > --- a/rust/kernel/ptr.rs
> > +++ b/rust/kernel/ptr.rs
> > @@ -253,3 +253,27 @@ fn size(p: *const Self) -> usize {
> >          p.len() * size_of::<T>()
> >      }
> >  }
> > +
> > +/// Aligns `value` up to `align`.
> > +///
> > +/// This is the const-compatible equivalent of [`Alignable::align_up`]=
.
> > +///
> > +/// Returns [`None`] on overflow.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::ptr::{const_align_up, Alignment};
> > +/// use kernel::sizes::SZ_4K;
> > +///
> > +/// assert_eq!(const_align_up(0x4f, Alignment::new::<16>()), Some(0x50=
));
> > +/// assert_eq!(const_align_up(0x40, Alignment::new::<16>()), Some(0x40=
));
> > +/// assert_eq!(const_align_up(1, Alignment::new::<SZ_4K>()), Some(SZ_4=
K));
> > +/// ```
> > +#[inline(always)]
> > +pub const fn const_align_up(value: usize, align: Alignment) -> Option<=
usize> {
> > +    match value.checked_add(align.as_usize() - 1) {
> > +        Some(v) =3D> Some(v & align.mask()),
> > +        None =3D> None,
> > +    }
>
> This would return `None` if the value is already aligned, but the additio=
n overflows `usize`, right? For instance, this would incorrectly return `No=
ne`: `const_align_up(usize::MAX - 1, 2.into())`

No, in that case it computes `usize::MAX-1 + (2-1)` which is just
usize::MAX and does not overflow. After applying the mask, it returns
`usize::MAX-1` as the return value.

> FYI, `core` provides `usize::checked_next_multiple_of()` ((const-)stable =
since 1.73). So an alternative would be:
>
> pub const fn const_align_up(value: usize, align: Alignment) -> Option<usi=
ze> {
>     value.checked_next_multiple_of(align.as_usize())
> }

That would return value+align when value is already aligned, which is wrong=
.

Alice
