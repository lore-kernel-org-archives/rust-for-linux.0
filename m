Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CB01A7F73
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 12:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722429040; cv=none; b=F0HUKnNxEPmfTbavyDLpGbNRHKwvIIlA2jhC1L0TPP8oWR8yUVCg/0mU0el75h5wonLYB4Pje2wp92boUeRqM/VB21hjMOxurwDC+ci4Vm0kSWg7ql2CJbzqXWfMokiEZShmphCzE5XU/7VSIWWn9pv55J8IwcPKUaVILiw3Lao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722429040; c=relaxed/simple;
	bh=0GgrZWHinxvvMoGWFnmB+thda/1qbiKhQ6cZ1ZfHbZc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LK7Om1JksxjMZsiT2nruOxVbRmJq3ISX/UQmLLsiZFABRR8km0ENzzZz66nZtL8aHtPQjtHokgrLEizoW8OuLSY0Ki2G9451eu9wE8GwKIZEnXpMq9LhUCHJv8rXIf6qXHhAEzRhkzeHQxrn3fR1M/J8YMZrHGi3UT+fJ88vAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ht6psynZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ht6psynZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4281d812d3eso34951875e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jul 2024 05:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722429037; x=1723033837; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zg+iaWLKXy+7i0/Z5ruNxOtrMiwweM8XLHk8AS+UR+A=;
        b=Ht6psynZPYcRYURu4MWBWN2lgzrqeu3/vSNQZ/cE/rFjr5H1Na0sBbqIX/WzmxnMFe
         Xx2GCHs3nANPBTPjFqQFZzVbYcGJAakcFHsFjsR2kTUKtwel4Fe0fV2fuHOhjT1drmWK
         Q3MCp+/afbZbOX8PxyAx9q4xSkiDlCsSXralUP6REI5omIO/XS9e1WvDphfE/joW+wLI
         hfAEng6H9Yao61wNos57jO+i2DV1OCs69Gse+UbFUZPpgzUfOwTJxBN0ggQiQAkPDys4
         mG7CoqQCHow84Wfh5f/MJi0dOLz2DzlXZJKJKf5ll7mRZE+5iNcCiMA1jZ8OfEcqAogk
         a+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722429037; x=1723033837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zg+iaWLKXy+7i0/Z5ruNxOtrMiwweM8XLHk8AS+UR+A=;
        b=CUYhrgfpOCr98Jk5HK404018TIppRcUjsdojBW4WYkJHnwpNR8yaf+8ALp3aAvnHzP
         sEBB3vTE0FBwWpgftsujZRKNt21QQYObapFAeU/5XirjlEovTYFb9UXr4LR4BzxeQbvL
         mHOR5RTzJuSQ0M4IQ9KaRvPTe3r9JqbG4D9xcxxnkVk9KOVhN688Zp2k2XkuQ9vPwe4U
         qLbtsBwl4WFa/P6pPBC/WIxZjiYxA/IA6RsplchmxhFpwz+uYGznOfd+52gP/PGlS2O4
         VwSgOfZpN9ldJ17pFBOzBK94gIE417rVAkLGmO3Zv+gjZnZDmLj+i5GB02uzXQx1XVuA
         5fjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrow2pzKL/UKoADaoj0VUYxD2w3KEpodYMTttvg4YQYoFs06mDucoY5V0uKFR2jEgwItjv5FTS9Bvfs5t8rDgXSJ+kDJxljMNrYM6zrnk=
X-Gm-Message-State: AOJu0YzKe8rYkLztVf+lsOWx56PgvOnJ2yFYaIVLkBG4eHpoVlN/b4oR
	OYJb0qjs449ogwTIyfL8p1FgIGLB8al2Shkf0ec8NGummFT9BsCth0M3SyUXeMUmThFErhzm9Z8
	HM6KV9oB+U9XuFe4Fy6qW17jZJRqFWg4uKXCw
X-Google-Smtp-Source: AGHT+IHRaCMcyu+XeRk0MTgMnend7w+x774/tlOFA6HabiDQT2g8cWiepzILJJARIdOoSfYXjDPRoJjVmOlBDrRNIEM=
X-Received: by 2002:a05:6000:1203:b0:368:6564:751b with SMTP id
 ffacd0b85a97d-36b5d07bec5mr10703106f8f.32.1722429036248; Wed, 31 Jul 2024
 05:30:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731042136.201327-1-fujita.tomonori@gmail.com>
 <20240731042136.201327-2-fujita.tomonori@gmail.com> <6749fc34-c4e0-4971-8ab8-7d39260fc9bb@lunn.ch>
In-Reply-To: <6749fc34-c4e0-4971-8ab8-7d39260fc9bb@lunn.ch>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 31 Jul 2024 14:30:23 +0200
Message-ID: <CAH5fLgiGAqMTL9mRA_3RXZULV06KF+FJRxYMHC5xsE_=od3Azg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/6] rust: sizes: add commonly used constants
To: Andrew Lunn <andrew@lunn.ch>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 2:17=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Jul 31, 2024 at 01:21:31PM +0900, FUJITA Tomonori wrote:
> > Add rust equivalent to include/linux/sizes.h, makes code more
> > readable. This adds only SZ_*K, which mostly used.
> >
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> >  rust/kernel/lib.rs   |  1 +
> >  rust/kernel/sizes.rs | 26 ++++++++++++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 rust/kernel/sizes.rs
> >
> > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > index e6b7d3a80bbc..ba2ba996678d 100644
> > --- a/rust/kernel/lib.rs
> > +++ b/rust/kernel/lib.rs
> > @@ -42,6 +42,7 @@
> >  pub mod net;
> >  pub mod prelude;
> >  pub mod print;
> > +pub mod sizes;
> >  mod static_assert;
> >  #[doc(hidden)]
> >  pub mod std_vendor;
> > diff --git a/rust/kernel/sizes.rs b/rust/kernel/sizes.rs
> > new file mode 100644
> > index 000000000000..834c343e4170
> > --- /dev/null
> > +++ b/rust/kernel/sizes.rs
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Commonly used sizes.
> > +//!
> > +//! C headers: [`include/linux/sizes.h`](srctree/include/linux/sizes.h=
).
> > +
> > +/// 0x00000400
> > +pub const SZ_1K: usize =3D bindings::SZ_1K as usize;
>
> 1K is 1K, independent of it being C 1K or Rust 1K. In this case, does
> it makes sense to actually use the C header? I don't know? But the
> Rust people seems to think this is O.K.

Shrug. I don't think it really matters.

If using the C header required adding constants in
rust/bindings/bindings_helper.h to actually make the constants usable
from Rust, then I would say we should just set the constants from the
Rust side. But in this case using the C header just works so I don't
think it's an issue.

Alice
