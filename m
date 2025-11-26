Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47FA30BBAB
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174257; cv=none; b=RrhKjDJeEuj11u12bkiLtJXV0CrD08y7nRlenZrjMi/zVKo3hMxRVfQZREQ3lF1BVyNB1+zmIqGWreI0YATG601YtIaubLJMdC2ZCqSt2ICRN+Mjnpe3frOUUCsrQxuDUAMChuDlGy0qtop9lUpY141PsZggPq9EM4tXaVilHfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174257; c=relaxed/simple;
	bh=Ft61V0ALnViwCwbnBEavVu89583dUPth/oiKOJIZupA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D4mw+boNXKrZtG2+G95ioxfbvGQacP85IMgIsdId/v0q7FXeKEc6K2vD5dp17QgotrDidvZPD0v2gbgn+ZfzRaKhMN8/ZvPMUJ5p7FzA0f7Hsu62YmThT4y5lZlfCvH09pMSSy+4asysXRnYtz9VJN4GWKnRI9tmqgzMZ44qeDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DvIjG+cu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DvIjG+cu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so5251f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 08:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764174254; x=1764779054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ+MnFmvxcbGj8gDvckdvmeN/yN5otOzT9lT2F+v6UQ=;
        b=DvIjG+cujzvoFRwdEXzFD69PMJi8UvjDr+Rr2+Qdktia82JpJqNawBZGRM8i8vP6Zc
         mhhYtPSUBjvfqbFE2qmjWTfggFj/Fk1lGx99NOvsroY3vMR6gk3udK1xdgdvS/yNSCxF
         JhHjJLDxCgvZc2wy7t6rgmg3BIzzX6pXpceHyDorffEzoiFvBu27ZHVKrQt+BbcLThbx
         J3rSbS6Ftjk4pMb2JHfaXGZRk6Ewm7Ue+CInfgvdEHqYvOoxLUsN+BErQpDkD+6d7WKN
         nhFVRP3xFwMUfYkZw5GompP38kdHX9AwiM7hWl19J4TCWLblRUGYgqHCbwhTzWIt9a1l
         KxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764174254; x=1764779054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZ+MnFmvxcbGj8gDvckdvmeN/yN5otOzT9lT2F+v6UQ=;
        b=iBDJn6rCzdd7Qwmae5j6bN8xf2JX02vXUT7oqCCuw3Q2TwhdyDwRwqufo92Q9VZmLL
         vIEZhokFqO5OkQJFytbeEJdl6GtobEIA750Jqj2HvkcQJBHW4tPR81qMLlvAXKk8piV/
         B2zadOmjrv0ZXBVPAuKjw5Zy9OwSaXvausqDwR8uVN35VxvMekScBGsWNONfSTTOeeN1
         c+7rQvpAHxKSI5Ybux9NooqJSBBhy4xS4NhFoZ5ynUYKtFQOWUoKykrAGMZ1mL4mKOTz
         VGw8KDGIGGyw+mtSm+rJaodr4P4kaxmpYH5M7wt1GiJxu0ZRMjXi8g/dcXgKirhA0pXP
         6z0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjUzmgpyHOTMpoHncJhCTP9kqvoZmJfPYZ6hyU/FRSieftdfZxbCLxLmWYghZoDpi1OqD0nGDjksCwPbvMlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7JU0v1wBwFP/6jlHAO7YpiLQqvdh8EakyVj9DeXlO9Y0PFCf6
	ebfVnK+jozrk7z4UgnaRAc/b5FF7GX23TSkCW+ZISxQzW2PwhbU2Pf42XuKTnD+C22XHTWZZ1cF
	mtXKId9DyPbWQ/4yfFxjQU153X1lIYVbNcHfxfK3k
X-Gm-Gg: ASbGncuGOX1Yo5FJas79vMwF71wKMhaOQWgk5V6A/koiQPWz7UxRfsRNMxUnK0DD+9I
	uIZGe1sGr9mZSg77wvHalZbvYiX8pI8hfEKXkn36H2jsIiX6NGtxsbIQKPm094+pQCFKNb0OuN7
	1IrZQ8lJv8GAj2fJ59QjGypOyCDwThrLu9DfTwAHBf/FyjFZ1PERRPQEnX1G1DWeM2EU0cKuCm3
	auoZOAeAgj5uxD/BqbWmSE0N9GuapCyI7JtLpZognz4Qd+dm9ESyUqFubWPab/cSVmGyBubv0tp
	0GVP0j8Jftar0y7VIRXN9g1whuy3NDIaBL6A
X-Google-Smtp-Source: AGHT+IH4RMT7QSLZ+vsE/OssFv9i0v+eE5reG4sjgmK1aZIhLLyMlxIjDy3M64DhaIpcihnqFxQMf+vBCBuh4vh6OYs=
X-Received: by 2002:a5d:5f54:0:b0:425:742e:7823 with SMTP id
 ffacd0b85a97d-42e0f1fbd71mr8118952f8f.12.1764174253750; Wed, 26 Nov 2025
 08:24:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <98227EBD-92F7-40FC-A5A4-3FF3780FB2CB@bne-home.net>
 <DEHUHPU6WQ1E.J19KGDPIHN09@nvidia.com> <CAH5fLgipNtk7=ad1dFYMDEdKL5b4LxnewU1w+WgAU0QLa-3C6w@mail.gmail.com>
 <DEHV24KY55H3.16CA6ALYGJ68A@nvidia.com> <CAH5fLgjUzryZubjfUPfNc_beE80iiptebAcTyFi25OzZkTKR8g@mail.gmail.com>
 <DEI7BMSG3JTC.1Q0OZIUHCK4ZM@nvidia.com> <aSbOWhKIpCBm0NKL@google.com>
 <DEINPJHY45GS.2K2COMBPAT7B3@nvidia.com> <aScCSnRIsRjLrccU@google.com> <DEIOIGNYXG3C.39IML6BFML3DE@nvidia.com>
In-Reply-To: <DEIOIGNYXG3C.39IML6BFML3DE@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 26 Nov 2025 17:24:00 +0100
X-Gm-Features: AWmQ_bmXv_KvskYx-qDLeZZWteMmdhGMSozdROh2oDdxwE6bbsKdeE4_XoFfqJQ
Message-ID: <CAH5fLgh+KZ4Fu23S9=O0e00v+iHc2t5oOhNvkEBBjAN6UtCYQA@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm: nova: Align GEM memory allocation to system page size
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: bshephar@bne-home.net, dakr@kernel.org, joelagnelf@nvidia.com, 
	jhubbard@nvidia.com, airlied@gmail.com, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, brendan.shephard@gmail.com, 
	Nouveau <nouveau-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 3:00=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Wed Nov 26, 2025 at 10:36 PM JST, Alice Ryhl wrote:
> > On Wed, Nov 26, 2025 at 10:22:14PM +0900, Alexandre Courbot wrote:
> >> On Wed Nov 26, 2025 at 6:54 PM JST, Alice Ryhl wrote:
> >> > On Wed, Nov 26, 2025 at 09:31:46AM +0900, Alexandre Courbot wrote:
> >> >> On Tue Nov 25, 2025 at 11:59 PM JST, Alice Ryhl wrote:
> >> >> > On Tue, Nov 25, 2025 at 3:55=E2=80=AFPM Alexandre Courbot <acourb=
ot@nvidia.com> wrote:
> >> >> >>
> >> >> >> On Tue Nov 25, 2025 at 11:41 PM JST, Alice Ryhl wrote:
> >> >> >> > On Tue, Nov 25, 2025 at 3:29=E2=80=AFPM Alexandre Courbot <aco=
urbot@nvidia.com> wrote:
> >> >> >> >>
> >> >> >> >> On Fri Nov 21, 2025 at 1:04 PM JST, bshephar wrote:
> >> >> >> >> >              return Err(EINVAL);
> >> >> >> >> >          }
> >> >> >> >> >
> >> >> >> >> > +        let aligned_size =3D page_align(size);
> >> >> >> >>
> >> >> >> >> `page_align` won't panic on overflow, but it will still retur=
n an
> >> >> >> >> invalid size. This is a job for `kernel::ptr::Alignment`, whi=
ch let's
> >> >> >> >> you return an error when an overflow occurs.
> >> >> >> >
> >> >> >> > The Rust implementation of page_align() is implemented as (add=
r +
> >> >> >> > (PAGE_SIZE - 1)) & PAGE_MASK, which definitely will panic on o=
verflow
> >> >> >> > if the appropriate config options are enabled.
> >> >> >>
> >> >> >> That's right, I skimmed its code too fast. ^_^; All the more rea=
son to
> >> >> >> use `Alignment`.
> >> >> >
> >> >> > Alignment stores values that are powers of two, not multiples of =
PAGE_SIZE.
> >> >>
> >> >> Isn't PAGE_SIZE always a power of two though?
> >> >
> >> > Yes it is. Maybe you can elaborate on how you wanted to use Alignmen=
t?
> >> > It sounds like you have something different in mind than what I thou=
ght.
> >>
> >> I thought we could just do something like this:
> >>
> >>     use kernel::ptr::{Alignable, Alignment};
> >>
> >>     let aligned_size =3D size
> >>         .align_up(Alignment::new::<PAGE_SIZE>())
> >>         .ok_or(EOVERFLOW)?;
> >>
> >> (maybe we could also have that `Alignment<PAGE_SIZE>` stored as a cons=
t
> >> in `page.rs` for convenience, as it might be used often)
> >
> > If you're trying to round up a number to the next multiple of PAGE_SIZE=
,
> > then you should use page_align() because that's exactly what the
> > function does.
> >
> > If you think there is something wrong with the design of page_align(),
> > change it instead of reimplemtning it.
>
> In that case I would suggest that `page_align` returns an `Option`
> instead of potentially panicking. Does that sound reasonable? I cannot
> find any user of it in the Rust code for now.

That sounds reasonable enough to me.

Alice
