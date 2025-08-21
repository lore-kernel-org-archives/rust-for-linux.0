Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008352BDC33
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Aug 2025 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755769527; cv=none; b=bxONshmJwJrhpOBNlfuMtaZWLBTweGV6n3VLLlCdZ0Q8cSFGW08aZfTK+dt9Yi1EvRJCC4poF2HO1fVXnSOURQOWMnr+RIQBR/QIcFwc63qq9t3GfFN6ybP6veGgzLyEN//NI1XuSoMnSFhbb1Bv4GnTYblDPzJOENZkUlZs+Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755769527; c=relaxed/simple;
	bh=+KxGB/dKJ4pb+tY+o0803YJCfK/BgA6DR2F3Eml0X7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LxGXb8i36NjL00jhad0HmiVuUg7q/SDhZkHVKsct5lDKwiAHqOJXVQGSCqfTBgshxXwhTqal9yTFU24TvZluif8jdQXbnHCc2Pj6eQu/hlD41Lz00DPtFTXHFPfp9jcwpPB3HTC17y0oqTFsh436K3UUhqRi/2iQ6pX5K8m/bh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I3M3RD8T; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I3M3RD8T"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b916fda762so832731f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Aug 2025 02:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755769524; x=1756374324; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYYHIISUuCy2JfQNPh+L51Upj+t6+AJZfjbcWAfxVxk=;
        b=I3M3RD8TSi3NMGsheq8q8Al1puWs9W3t63Cl27Arf3dNwQQK7GtaduGQHEgt46YDHA
         9xX2hfIVjXngTseehuNGZXp/YdgMu0LqXBlPnhTjC86+YgeYVagMBlN+TE+kuqJRUc8X
         RZiqkhmEncZI4RXf/JJhyKtjselwx3Mp6QouNAKanbKdjW0obSzF+fgHhM6hA89Ve9kz
         8cKjc1olS1rjL4Xf6Bg0Az1pwlSrdL1zPeUQutMY32mie5u0pcRQ6V0wiJ1mhkts3LgU
         oqBvGQ8x9VO9Knd7DJBpcRoIzL9vFu1lxeskCVJjNtTJnoZWWOgA+Md7FU42U7sigwOc
         HOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755769524; x=1756374324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYYHIISUuCy2JfQNPh+L51Upj+t6+AJZfjbcWAfxVxk=;
        b=Y+56vFISJEnFADl+IkNba8jvzUd/gOGkiJn01meKY4+rsnOq933KQBdhI0DAFHgsQF
         UzEuBd2fWMigJRymApM+A5XuTCWlGAArOyOnHEt7L0nZK4y8ofcI+hAvY1J6DXEN7lq1
         vEc801GsZi8vzMWL4a81vukLo1M0k1iR2KQM2YwH/3bGlC3tS6YnCKD/e5EE4fBrqlaN
         pqpBT+uH19OY08/C5eJ89BcBtXJhEeHDv0Wqb4hLYvdg9UkIIy0ZFvnQBdKPaFm7Ak8d
         tQsG3AMaTRGVu4azTlJwpcCGEUgmOtMpp64mksRsJfcXJmDr/GTVpzvzNJ+a6JvcuYcG
         iHAg==
X-Forwarded-Encrypted: i=1; AJvYcCV9hWa8tGUz08d0JirRZ/1a3Nq947XW0D4WopgxMzUeBI9rQvbPQha/LykKFNk10Y0Ze1Q6ZwaWb3zdOmNvtg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoI8samXU5WlPbSjBN4taDKb3yQS13djewyUk+uzwCHTb7+s6u
	Da83BPTgt54h8bfaSvVnPYP9VxSQSUNXe922tiFQiP9J3iIY4I3SVl7PF1lzleOLJ0GZRPi3UV3
	H4JxhTTfDxrb6nesKJJ+Cwao6Z4a8xAVs3vc57pyh
X-Gm-Gg: ASbGncvJfKul2IgL0JfNopxf1N8CWB0Va5PWC6bCLHesKutBJehLndcebEkJqqdrvtr
	y7YHgdzJQBTCzEvVzvDLPsQRr/VdBfKRaNDzdZiM3CjOi/U6VC+EUkbjbx/uvAgrTjFqqws1kTE
	3oPNEz9gOdwRXbUCb9Jqldw3XSHnoKIe7UOX7xudIMJNWhrYF8LvgHtKqmdhFJX63Fx6z46vEhN
	HHXVI4+P6dGStUXpezbEBtspQ+hrWHkdoO+itm/+ia9
X-Google-Smtp-Source: AGHT+IGn/wQOgVGJFmdB5PCUsV9/j1HIemTZs47Lm99Ax8kZZi+0rJsXvH9qzrIslE8FnssJag3hkMGPPm2tMopx1XE=
X-Received: by 2002:adf:a19c:0:b0:3a4:e231:8632 with SMTP id
 ffacd0b85a97d-3c4b4c0f1c4mr1130278f8f.12.1755769523630; Thu, 21 Aug 2025
 02:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812132712.61007-1-baptiste.lepers@gmail.com> <20250820162927.34201cfb395ec7319b15920a@linux-foundation.org>
In-Reply-To: <20250820162927.34201cfb395ec7319b15920a@linux-foundation.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 21 Aug 2025 11:45:11 +0200
X-Gm-Features: Ac12FXwc6xuQOhVNEpGEy9nGpcxRQ0IxCgJJo1p3FE9jDQG2LnUgqbP8cpbBPG0
Message-ID: <CAH5fLghx7K1fsdx15VsaTT1i3DRQD8zH2Yd-sEwumiByefTVAQ@mail.gmail.com>
Subject: Re: [PATCH] rust: mm: Mark VmaNew as transparent
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Baptiste Lepers <baptiste.lepers@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 1:29=E2=80=AFAM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 12 Aug 2025 15:26:56 +0200 Baptiste Lepers <baptiste.lepers@gmail=
.com> wrote:
>
> > Unsafe code in VmaNew's methods assumes that the type has the same
> > layout as the inner `bindings::vm_area_struct`. This is not guaranteed =
by
> > the default struct representation in Rust, but requires specifying the
> > `transparent` representation.
> >
> > ...
> >
> > +++ b/rust/kernel/mm/virt.rs
> > @@ -209,6 +209,7 @@ pub fn vm_insert_page(&self, address: usize, page: =
&Page) -> Result {
> >  ///
> >  /// For the duration of 'a, the referenced vma must be undergoing init=
ialization in an
> >  /// `f_ops->mmap()` hook.
> > +#[repr(transparent)]
> >  pub struct VmaNew {
> >      vma: VmaRef,
> >  }
>
> Alice suggests that I add a cc:stable to this.  But I see nothing in
> the changelog which explains why we're proposing a backport.
>
> So please send us a description of the userspace-visible runtime
> impact of this flaw and I'll paste it into the changelog, thanks.

I don't think it has any userspace-visible runtime impact. But I've
seen many things get backported when they are incorrect even if it
works in practice, so that is why I suggested to backport it anyway.

The annotation makes it so that VmaNew is guaranteed to have the same
layout and ABI as struct vm_area_struct, which is required for
correctness. Without the annotation, rustc doesn't *guarantee* that
the layout/ABI is identical, but in this case, they are identical in
practice even if the annotation is missing.

Alice
