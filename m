Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909243BE148
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 16:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813075; cv=none; b=pkLvlKkljWEZpq7NWlzmOaSm91n98vaGjmFoo2cK0p//dzxb3z9fFE69y0ToyEzMfKSD6GeUrzjStUPYAyL1nGf4sw72Zr1qIdXvVzKmZYB3sT2VrlBDs1u/6fnkPUL9wI2kYFKA1z0HvRPzholyxbXC3C3sg+x99CSl5XhF1zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813075; c=relaxed/simple;
	bh=MFv8kFid21/1/0czyyuzYNhDUqTrXVn/l1Ppjm6K3es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ieNEfCQI9NtR+7r9+XG/i4yV4FoNALPqtMputI6P+WO0GSRPqlNWFAh1hR5DW76DMQQiJRYK7gvgQoN2WY/uTdUykrHVzi7FP3tqwaubIHi8Xz+zZ7JsZqUv3aNX2VU4/O2oCPfQElDwvRLIDAhr/5wlVPAihpmZ8Zchxdz+jb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BPYebXLS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BPYebXLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF3B1F00A3D
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813074;
	bh=91BSx+OFRdcmeM3b2OikyHDL1f2QuVDAd0wpqJaqHl0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BPYebXLSH6WnQw13gt2OIIfVdC9QT8eo46QduR06DqLFZ8lbvU6XRwcklX9vt/oqz
	 zNNkDK5LXZ1nAS80soThLfRH+p27rhpDZAXRwn4mtWlH0TVJ6IGCinULV5BIPaSmj4
	 WUd7YVog6jE4Demvmi9ErBJit3cwX0u1QCSnrm+WnI1MCKT0Eop7uY2J2Wl2Y/GMwv
	 sGpyofRnwwxVoTzCdxKTKgDL5n2VNoB4S6ko8MxgujQgzyrmBti0fu883jLiBdwlJ5
	 ksDXw2GvkvJzPofpuxD5UGO8Sfe6nZmb3gEohN8lgVPurW8t7Eva7b2MLYE++YfEZa
	 2FzvyNfsQpnfw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38be5e86918so13881371fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 09:31:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8gmuSVyrBlaURSpkbqJ1ACtUeOE/Oow86pjj/nDwnwJZE6/RRj8N4OOLGJZDhTUUUdqbPuClfLfC4rlWpzFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTI4D+QkZh40GtNfP+5cm2bVO24CjkRrTl4RUEslU8id0WKNrS
	jm2hVXRHYYIpUOoP1E9SS5xKHTTmchQQrcUKBcYBqwcLfzzteLI9XS1MJHs4wOUWU+A3MFKAU91
	OyDZBd5+QMYFLtNHKEw1IiZE+haS3TXM=
X-Received: by 2002:a2e:bd06:0:b0:38e:a00e:2bb5 with SMTP id
 38308e7fff4ca-395d8d1d1e5mr61023541fa.19.1779813073172; Tue, 26 May 2026
 09:31:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522-binder-strict-provenance-v1-0-3d6e9406e864@kernel.org>
 <20260522-binder-strict-provenance-v1-2-3d6e9406e864@kernel.org>
 <ahWTBbLpYEDlPTr2@google.com> <CAJ-ks9kdwuO=wmjmfhHMOOSG6cuEs7hnVVActxP5DSHTRFfX7A@mail.gmail.com>
 <CAH5fLggtyjE8utcGfESCGKPTyqpdbPsKCvpJX6x1yBKUYywW5A@mail.gmail.com>
 <CAJ-ks9=8GSw4sZxy_Vm8VW5j8n02yxr6eDSX3TA7VrnBo5pCDg@mail.gmail.com> <CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com>
In-Reply-To: <CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 18:30:36 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9=Mzqff50B3EtJdeDNAULO_tOkdYWW+OsCNXtfasqpdoA@mail.gmail.com>
X-Gm-Features: AVHnY4L2Oyga9l9DrvCXdImu2zUwUARJA8a177aYK9HDi02rA2DB0lzgY2ftmJI
Message-ID: <CAJ-ks9=Mzqff50B3EtJdeDNAULO_tOkdYWW+OsCNXtfasqpdoA@mail.gmail.com>
Subject: Re: [PATCH 2/6] rust: binder: transmute transaction data
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 9:42=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, May 26, 2026 at 3:39=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > On Tue, May 26, 2026 at 9:36=E2=80=AFAM Alice Ryhl <aliceryhl@google.co=
m> wrote:
> > >
> > > On Tue, May 26, 2026 at 3:34=E2=80=AFPM Tamir Duberstein <tamird@kern=
el.org> wrote:
> > > >
> > > > On Tue, May 26, 2026 at 8:33=E2=80=AFAM Alice Ryhl <aliceryhl@googl=
e.com> wrote:
> > > > >
> > > > > On Fri, May 22, 2026 at 07:12:47PM +0200, Tamir Duberstein wrote:
> > > > > > `BinderTransactionData` is a transparent wrapper around
> > > > > > `binder_transaction_data`. Use a transmute to view the transact=
ion data in
> > > > > > `BinderTransactionDataSecctx` through that wrapper, matching th=
e safety
> > > > > > argument at the conversion site and avoiding the raw pointer ro=
und trip.
> > > > > >
> > > > > > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> > > > >
> > > > > I think it is an anti-pattern to transmute references. Please kee=
p the
> > > > > raw pointer cast.
> > > >
> > > > Can you please elaborate? We already have this for kernel::io::Mmio=
:
> > > >
> > > > ```
> > > >   rust/kernel/io.rs-    pub fn relaxed(&self) -> &RelaxedMmio<SIZE>=
 {
> > > >   rust/kernel/io.rs-        // SAFETY: `RelaxedMmio` is
> > > > `#[repr(transparent)]` over `Mmio`, so `Mmio<SIZE>` and
> > > >   rust/kernel/io.rs-        // `RelaxedMmio<SIZE>` have identical l=
ayout.
> > > >   rust/kernel/io.rs:        unsafe { core::mem::transmute(self) }
> > > >   rust/kernel/io.rs-    }
> > > > ```
> > >
> > > I also think that code is using the same anti-pattern.
> >
> > As in previous email: please elaborate. Why is casting through pointers=
 better?
>
> The reasoning is similar to the reasoning against `as` casts. In this
> particular case, it may be okay, but it's not always okay because if
> the reference is a wide ptr, then the layout of whether the data or
> vtable pointer is stored first is not defined by Rust, and a transmute
> assumes that this layout is unchanged between the two reference types.
> With a cast, this potential layout divergence does not matter, as the
> cast will do the right thing.

Thanks for explaining. There is already a clippy lint for this, which
I'm looking into enabling.
