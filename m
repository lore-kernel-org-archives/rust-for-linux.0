Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C02417EF
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 11:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184087; cv=none; b=jlXbiUBzgj18ATLJBmkn62B3UuCotiloy5kQVZoK3gHB4WiyAlMEtS/N/u++cFDojCYtHo5RgqD6Ld7GmY+KbyvHVrvN0GDJhgZCj0QCvNGfgMRgpeWTtYfxiYN/07bmVWLsJNFYB4Lhj1KFLSAmCw0jL+1lx1+Y3LZMtL+6qgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184087; c=relaxed/simple;
	bh=IJcOlmtw/NnWcYNlHgTN6xStFqfXiMJp2oPUjlf6G1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFwUX9NfYLKHXPVQizBZ19BuBqCIMNMb1FBmrsvbNZDKOHGAXrHscVEeZFgf+xCXdL8jADZCanQtiFqF9kimDZVgCUKL2e9LjloKsQ97gtndc0+QjjrZN/5sPesYTmqaaAYB1Q4EXaKjMqbD0u5UmPoMka6MvpAA2IDQRlT7cbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E4clNe7s; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E4clNe7s"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45610582d07so42025525e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Jul 2025 04:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753184084; x=1753788884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZMPht7gkTTHVxsbBVjCpliqfu5/ygYf7gghg6pj8Lc=;
        b=E4clNe7s8ZUmzUDNnGuC5I80ZkDairVl9L57IF/BVfRJ9PYTZHeCth5fBWe1QvnmvY
         cUDegTlfDdvFAtn8ivPBvq+qC6JA2H7iccQO8wZelRPezSSbMfgsLnloHy4t4Dgq+rmB
         XwRrO2XBQgaVFv5pxafKT1PUfOacDBCM3mC6KnugIsCx7ZirKbFi+UXtZit7VdcF1E9N
         xflg+bvzq/YCPBRAXD5xy/FDHeA9pBS7HrEAWYsyQtGtL2EgygDz+QXsoqtSHbw/MM54
         r8/cY433KX6M3V1PgzUNojMyZdHFeU/xgcxCyqNwCRSX/DhD+LH0M1H/q0Z6e4bgaW3n
         f+5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753184084; x=1753788884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JZMPht7gkTTHVxsbBVjCpliqfu5/ygYf7gghg6pj8Lc=;
        b=ca6Aoq3QdI64uqVihmwTkDPi0TxGx/5wRtkVbgiyJdFXiMshfmYAgzJ/5deHyQLCkR
         cPidpl54e0ekzNYgxhjsBxsbfsuAlmVlaGwDvGxyru89tyf4FrVSEB2WIwfGNwth545M
         mTDFPl1n9V90eUtYNL5nJnlwuomnahTi/mZ4dw7qXirY8oJa6QyvBlGoys7rmtDZlyy9
         e4GOoRmYfTa17KwokNyJldEIjcHFrPsnP895LktazyxjwS99Gu2/5X754SeaXFtpmKcj
         YIpkflzpIdyUO4qy5uK9ce4lXW4ibtesQ4oyJlfe80uhcCS+/u0bpNN+s+bRPRxNYZsA
         azBA==
X-Forwarded-Encrypted: i=1; AJvYcCWVnevHdp+LozFZndaAwudHvzyJ/ELSLT1d+M1xLyisXrx7tHptGyBxm5ZG6ZCQnYrH7dmY2uFqxLS37XNcmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdEBAzeAZ5o4HJ8HAZYQslPLD1jAFvlPDeCullhBpfLUwYsu89
	61sNPXa3dT4I4TKVFYLFBYWsH7r2fXMTkEdj9ZdXxBmmvvFZXsD2L2LK1A3O9pPwOnJr3sjoNqO
	mtFCyKynyajDMPeUtBFn4u8uCamadSQhP3gkbZ9rW
X-Gm-Gg: ASbGncsII66Pz/TTqk34K41SoEoziUPzTA75t5a07WDnP6bLrvMj/CHB8uu5tCG/5Pn
	hh1L4P8XOnxi/ZJR9SHDu84O4ny0T8mS+JBmPKo5UvXHQanhAUCeNkOkwMJwOq/GrpSPDvzRHS0
	07kxRKN45Peirpuw+bPyvXvONx9gzA704EPguZPjxN/Cl/ZhyppRTht+xQfEfpdfhSqE8FtzVEv
	hgVJ8jIrCo5geYsYw0dNxZebaXqgSbfIfBjNA==
X-Google-Smtp-Source: AGHT+IGeBYHszJWBXESmP50bCsejIs3JvKygU35UM4Qg/ob8h3/kNTtSDZTbH5p3tZc7qBiTgE9jp/n1XIah4JTa+l8=
X-Received: by 2002:a05:600c:450a:b0:442:c993:6f94 with SMTP id
 5b1f17b1804b1-456352e8aa8mr210909705e9.12.1753184083614; Tue, 22 Jul 2025
 04:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520231714.323931-1-lossin@kernel.org> <DBIJLR7XNI6U.21PMPODHE83DZ@kernel.org>
In-Reply-To: <DBIJLR7XNI6U.21PMPODHE83DZ@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 22 Jul 2025 13:34:30 +0200
X-Gm-Features: Ac12FXxNuYgWIcswNv8WCkf9UX8cFJMqKP-_bEHztMIj8b3nC6J90x3Qbf1cNj0
Message-ID: <CAH5fLgh9aEF5V9rNq2a8utS=NxSU8rdxpKsNbsuPoMpDfHN0fg@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: fix safety comment for `static_lock_class`
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Mitchell Levy <levymitchell0@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 1:21=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> On Wed May 21, 2025 at 1:17 AM CEST, Benno Lossin wrote:
> > The safety comment mentions lockdep -- which from a Rust perspective
> > isn't important -- and doesn't mention the real reason for why it's
> > sound to create `LockClassKey` as uninitialized memory.
> >
> > Signed-off-by: Benno Lossin <lossin@kernel.org>
> > ---
> >
> > I don't think we need to backport this.
> >
> > ---
> >  rust/kernel/sync.rs | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/rust/kernel/sync.rs b/rust/kernel/sync.rs
> > index 36a719015583..a10c812d8777 100644
> > --- a/rust/kernel/sync.rs
> > +++ b/rust/kernel/sync.rs
> > @@ -93,8 +93,11 @@ fn drop(self: Pin<&mut Self>) {
> >  macro_rules! static_lock_class {
> >      () =3D> {{
> >          static CLASS: $crate::sync::LockClassKey =3D
> > -            // SAFETY: lockdep expects uninitialized memory when it's =
handed a statically allocated
> > -            // lock_class_key
> > +            // Lockdep expects uninitialized memory when it's handed a=
 statically allocated `struct
> > +            // lock_class_key`.
> > +            //
> > +            // SAFETY: `LockClassKey` transparently wraps `Opaque` whi=
ch permits uninitialized
> > +            // memory.
> >              unsafe { ::core::mem::MaybeUninit::uninit().assume_init() =
};
>
> Looking at this patch with fresh eyes (thanks for the bump, Alice :) I
> think we should rather have a public unsafe function on `LockClassKey`
> that creates an uninitialized lock class key. I'd like to avoid the
> `MaybeUninit::uninit().assume_init()` pattern, as it might confuse
> people & it looks very wrong.
>
> We can take this patch, as it definitely is an improvement, but I think
> we should also just fix this properly. Any thoughts?

Could that constructor be used in non-static cases?

Alice
