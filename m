Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7AE146588
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768314258; cv=none; b=itIn1xQR9xcIyd4I+AElPzySk7XpWKc3C2OvdBvLnpU/cBElmiRovCB4cObso4EEXGdfAMYwmi7Y//fswnWtHJzz5q4fUfdNkFrgQxd7qzDZ0wlbKPaBZd6wuos7oa+rxpF+Qbpehb54cDuKiFJPhOGHH7SJ/Qr00lEAQJtDvT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768314258; c=relaxed/simple;
	bh=cP2gObY2Dy5i9R8YCEtS8EqXb+MuwLoPwtai699e7/4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QcCzRUNn4oqdoN2zVi9fSZQTyz4qEunJzGVO9yynoL56OZZNWelQCoOFS27LSbLRC4Szr6o3wLhKb9502w2aBswtHWT3ShSQFPhZ/DP89rDo808itlOMLL0aJS+aMHlNC0sLP4PU2gi1pxD91ilQAWqyMyPCOAxP65dnLzZxIZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jEHkjMoM; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jEHkjMoM"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3831ad8ae4eso32531111fa.1
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 06:24:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768314255; x=1768919055; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vGrBDeK7RHcNRwvMm8x4n6s08VtOTq8v6lLMtyqv9PM=;
        b=jEHkjMoM9I585d6bXHp1ctGKRFhD0b+mUPQ6h1t9whCMY5t0ZKbvrTUHwcu9KU4vge
         jZKJzla9kWWdbMk1dJF2EeGXNVs6rpadKZnb+mdtrKnfzvBnerB0RQiGriugdtu8Ia5A
         RkVxky4xlwUjXB27HPGhrKgHRKHqqQABCGQzlYOW7R1eOZWiNejPXED2XQGOQLlD1WuT
         iIh13PVPxP5ZsKAAc17CFAR36shcoc3YPHym51JFMJTDxXx9i3ow2YWbdXKjMT1FeGjG
         IbCw3leQT/qUA4S2ya88/AlyLGvPRDmbreqNgqUyBcZZnYFZmAHNArAl+nPMXCUCE4YO
         rVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768314255; x=1768919055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vGrBDeK7RHcNRwvMm8x4n6s08VtOTq8v6lLMtyqv9PM=;
        b=fO5iDFU3+r+luhr9QNj1CNMY3O86fN0JcffNl6NHkpiw0n+XqNoYUp9OP1Oo2oouzq
         YYHCFt811Nr7sCDl7I054afXgGgtcjdW0zNhWjtfdHtId1O2mwEA6NYXadUts6K+7y3c
         DZdMoEXXtQi4n0gWhxgNmbGniSGuhUb0JYEAE7g6A5c2UCPzrRv51Q9nme/rCzBTeho5
         HeDrCCWnkgaOarSUiChzFrCaPHDR1RZ3tpGrlQfygT5Vrd0xxohVnJFz9AVFiQxkVaRx
         CtTPOzxIxhYFlgvc5JXhp4hKv5aIHI9XoFJfE36QAQbqncVF2tWgp/wMe0ZHX3BIzDXM
         WOnw==
X-Forwarded-Encrypted: i=1; AJvYcCXfSsnt1HM4jftzDWxiskTYEMobUyjneUCYU0w45h8cLZd4NEI9j8hrzZsXutUc7ZHlvm4NEREhAy/UVf9/iA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1WmjKpYkxm5svqjPs3uu3DKdGlcv+K0FfEdzImu4JchwwXVqM
	U/XHklr2oH+uoK2+xARbQWjLJTEIFoFqnbhCSVkgwQeG0rbDJQCmKlgVR+l0cKJqlQzCZlfD3a+
	1TvSR7JQdYfognmChUj5RqlFVV0vMZWQ=
X-Gm-Gg: AY/fxX6sJCN6u0JCwD8NSTm30rFRql0I2SsBY+p/pwbXgWKWmGpiwtUx2pzK4qxNxRq
	mEMi7IKDc+DoZd1QoS/isCgHg7czkfSAWnXfULRYzUCY2sngY9sPwF52SCD/UiutmVxsFCJqTpf
	7rVvdF1fgbvWWMeWQcrHNpsF3ntYAY9eXonmJ8oKFrqdTzrus5yBtMD4WQJFHS6TudCS4lO2lCI
	UPtZLaLxAaNErjB5aL1/S58aJf8FYUr50UhkOK5PKteaxVTbbE4aXUbL6gGL8aZvrwLl3ul06pe
	LiczqjutyaPTprqJZT/gtGgyEzeoQ5z3N5alyeeOQORow5mCBB4fGrO4xn6bTrXiYvfB50CKYH7
	MJmvfmQ==
X-Google-Smtp-Source: AGHT+IH3JnmN7J98XbM9mNdta1o3/Hz62veXJhsF7zuhHzKxCChC9NoNT0t0Y7q4S/E7R7HHQXbDdfPZ1zglnKcir/A=
X-Received: by 2002:a05:651c:2119:b0:378:e097:e16e with SMTP id
 38308e7fff4ca-382ff8114e3mr53413901fa.36.1768314255165; Tue, 13 Jan 2026
 06:24:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9=UwOz=-NR0MJ3pjKZNGjb7+3R-shFqYKQF206s5Tp6ew@mail.gmail.com>
 <20260113131138.2155899-1-gary@kernel.org> <CAJ-ks9m4bCoQbrHeO14wXdFyMhkWf=SRzqkxY=gk9tpB594cCQ@mail.gmail.com>
 <DFNIS32ARBRQ.1842L2438YTMB@garyguo.net>
In-Reply-To: <DFNIS32ARBRQ.1842L2438YTMB@garyguo.net>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 13 Jan 2026 09:23:38 -0500
X-Gm-Features: AZwV_Qg_ihx0Bk-3AK9VqILoaHvlK6VwWThT_a1rZkR6ctMpo_NfD0yyubJMaPk
Message-ID: <CAJ-ks9=CXCuE+NDnu_SsFwQKLsc4yz+GuRh4pD=DQ-7KFdaOPA@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: support `#[cfg]` properly in `#[vtable]` macro.
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 9:09=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Jan 13, 2026 at 1:39 PM GMT, Tamir Duberstein wrote:
> > On Tue, Jan 13, 2026 at 8:11=E2=80=AFAM Gary Guo <gary@kernel.org> wrot=
e:
> >>
> >> From: Gary Guo <gary@garyguo.net>
> >>
> >> Currently, we generate `HAS_` constants as long as the definition exis=
ts in
> >> the source, regardless if it is cfg-ed out or not.
> >>
> >> Currently, uses of `#[cfg]` present in both trait and impl, so it is n=
ot a
> >> problem; however if only the impl side uses `#[cfg]` then `HAS_` const=
ants
> >> will incorrectly be true while it shouldnt't.
> >>
> >> With `syn` support, we can now implement `#[cfg]` handling properly by
> >> propagating the `#[cfg]` attributes to the constants.
> >>
> >> Signed-off-by: Gary Guo <gary@garyguo.net>
> >> ---
> >>  rust/macros/helpers.rs |  6 ++++++
> >>  rust/macros/vtable.rs  | 13 ++++---------
> >>  2 files changed, 10 insertions(+), 9 deletions(-)
> >>
> >> diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
> >> index adfa60d8f42d8..11117b4c95d25 100644
> >> --- a/rust/macros/helpers.rs
> >> +++ b/rust/macros/helpers.rs
> >> @@ -7,6 +7,7 @@
> >>          Parse,
> >>          ParseStream, //
> >>      },
> >> +    Attribute,
> >>      Error,
> >>      LitStr,
> >>      Result, //
> >> @@ -53,3 +54,8 @@ pub(crate) fn file() -> String {
> >>          proc_macro::Span::call_site().file()
> >>      }
> >>  }
> >> +
> >> +/// Obtain all `#[cfg]` attributes.
> >> +pub(crate) fn gather_cfg_attrs(attr: &[Attribute]) -> impl Iterator<I=
tem =3D Attribute> + '_ {
> >> +    attr.iter().filter(|a| a.path().is_ident("cfg")).cloned()
> >> +}
> >
> > There's also no need to clone; `ToTokens::to_tokens` takes `&self`.
> >
> > https://docs.rs/quote/latest/quote/trait.ToTokens.html#tymethod.to_toke=
ns
>
> Indeed. In that case I feel like the line is short enough and we can just=
 inline
> these and skip the helper function?

I think extracting the duplication is still worthwhile, and we might
need this elsewhere so I'd leave it in the helpers module. I don't
feel strongly though, so go with your preference.

>
> Best,
> Gary
