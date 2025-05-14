Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B732236F2
	for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 22:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747260865; cv=none; b=FmhW8153K3DspXGSB/MkEirY0ViT3vudkQGhov2hUiUSyq4SMlYuZuB1joe4Bqt03EFEJv7YSqDmWLmG1l2KsroAEVFeo3426j17te5m4yO5dgyzfg9wgetJ+wgZ96h5nqwA6YN5FcKuD2td8gY1KwNYyPfNS95anODS6iN1OKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747260865; c=relaxed/simple;
	bh=vfCC06ixRNlk2pd7gUGEdMph3wC9qBRy3knAP4+r+0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MI842WkGpeRlo+KtUkqhu7ONTxNeeULue/dNJB3v+upTjCFdXlqdyrt8XQI4RCZXZfppBGnQ+vqA7fbHuTqQWJTpP6H8RbhsNoJ2GOTWalvUI0EvYIlJFZQA44iV82EL1IdVrRgEhLxsu/0cynRgwx8nJzU4jby6hvchRBnKuKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PKIjiZvF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PKIjiZvF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fab85c582fso3999a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 14 May 2025 15:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747260861; x=1747865661; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+bVoz/aj0G+RR0lYiLH6ofgQM3MoLbgJ+Qa4BAK7Po=;
        b=PKIjiZvFH/HhZouJplr7s0TG7NoRz2fhG+/qlSEFbtOJR4X10Dyfe+8SwDg3LGsIoS
         Z9B6MkLr9Xze+s+REhu2vJCW2n+epSBQfK6J0frCQisB4QxlJqPtAaZ+1oVt34jDsG1X
         SK/K+AdBS/z9YfwfePWdqMis+jMZ4i9ZEIWtku0CLQD1N6GMCcTtIONUFijbYfP2NIK8
         vA2q0gXuDuqlj9vCg/0pi5xEiSAYSTdG4xNoOwA9oSYl2LBXA9AWnDvVXqchACFiYut3
         m1cMIOsmLgc63GWZmGMMiL++vmoOZRYxfMgCo7GLk7qDtMql2Pqnl8vqdQJbEMTPw+HT
         UkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747260861; x=1747865661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+bVoz/aj0G+RR0lYiLH6ofgQM3MoLbgJ+Qa4BAK7Po=;
        b=gYqekg1wSzJmnVys/bUJKHUU4X9TYGEj53jnkNK9CMhpVePt0PL55CYJdjoPkn/4Ui
         IHKAlC6o6y+dtZCApj35f13VBDNgJcfQqtNbnmR8xpHO2+UpzUzduHdR7Kx+aXlPddsM
         FE7535xiiil6TNIyuC2S+hewLIT/PojH/F0WmKyS6+var0aUJ2v9AG5ZSLxL71xqfcga
         5xUt1FzJE9AcVuvdJWAYs1hLHWAp7if0C+b7jOWjDjoQIcL46wTcm2ZfOEG7/9yvI0dN
         ed0m39fS63RxI0Rth3CE6eA0WUnH8iUp6iZZA7UmHh+mi34xed4hrjZjuhWwfVn5A3wT
         XpeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH3vNr4e2I2rAdXfxWoY1pAMrtJ/eiPsHb1faPcpeM+n9huV4ELyLtIwuTJINiuVaFGBL1C7ixQ6Lb/X3QHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwNtBheRjx8heF7CEu8Ed/rU8pzsiDHUDmZUdncsgwBTpSTBmFp
	1N0BBu/OVWYnwe6cr71MAWFw3jTwx2wM0RBD7SJUFRY83ZDhenarxW7DV2RlZgSatJ2rv6+cioE
	R6iH6wMgRuBDuFHDHr3tXABw9vWqWcPH1YkFZHVj+
X-Gm-Gg: ASbGnctC9LQjA0ZDig8N+k6q3jT1aQ8e+c6R87WI/CES24Ktxde57FkyI1sFnPwu7TF
	/i1l1h0K8iJQqAhmU0TCGuLPewAX9KawM7LatZLTyMYdqzCGXJauRbwZ9q3VjDq59u2Modqob6m
	/VY1cTLNaMt2wUv95OQTqtblj8ZD6yB5PRoQKXbZ4eQvFGwfXA9eIAe1zSF2Gx0mQ=
X-Google-Smtp-Source: AGHT+IFJF+6oOnV+yrFWcJ4TdgxsJzg7RjcmNi4KDxnJjy7aiUmsx0nSqaSD17A8OHVDIkrKuyLG1Irp11gYD5J3e+8=
X-Received: by 2002:a50:bacb:0:b0:5fc:b35f:1e7d with SMTP id
 4fb4d7f45d1cf-5ffce29ca9cmr11262a12.5.1747260861030; Wed, 14 May 2025
 15:14:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <D9VSJTPCSNXV.1LCXKGKVDGP96@kernel.org> <aCR9cD7OcSefeaUm@pollux>
In-Reply-To: <aCR9cD7OcSefeaUm@pollux>
From: Matthew Maurer <mmaurer@google.com>
Date: Wed, 14 May 2025 15:14:09 -0700
X-Gm-Features: AX0GCFtbPdzX7ARsgM6_ivP_rGN2Kr21C03tfS6osYETSo6ug6Hu1UX1_NWiH8A
Message-ID: <CAGSQo02S3z2oyaXkJdg6FjMOFL=0DZVK-gg=JrNOPS5TehkF-A@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 4:24=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, May 14, 2025 at 11:54:39AM +0200, Benno Lossin wrote:
> > On Wed May 14, 2025 at 11:07 AM CEST, Danilo Krummrich wrote:
> > > On Wed, May 14, 2025 at 09:20:49AM +0200, Benno Lossin wrote:
> > >> On Tue May 6, 2025 at 1:51 AM CEST, Matthew Maurer wrote:
> > >> > +impl kernel::Module for RustDebugFs {
> > >> > +    fn init(_this: &'static ThisModule) -> Result<Self> {
> > >> > +        // Create a debugfs directory in the root of the filesyst=
em called "sample_debugfs".
> > >> > +        let debugfs =3D Dir::new(c_str!("sample_debugfs"));
> > >> > +
> > >> > +        {
> > >> > +            // Create a subdirectory, so "sample_debugfs/subdir" =
now exists.
> > >> > +            // We wrap it in `ManuallyDrop` so that the subdirect=
ory is not automatically discarded
> > >> > +            // at the end of the scope - it will be cleaned up wh=
en `debugfs` is.
> > >> > +            let sub =3D ManuallyDrop::new(debugfs.subdir(c_str!("=
subdir")));
> > >>
> > >> I dislike the direct usage of `ManuallyDrop`. To me the usage of
> > >> `ManuallyDrop` signifies that one has to opt out of `Drop` without t=
he
> > >> support of the wrapped type. But in this case, `Dir` is sometimes
> > >> intended to not be dropped, so I'd rather have a `.keep()` function =
I
> > >> saw mentioned somewhere.
> > >
> > > I agree, if we really want to "officially" support to forget() (sub-)=
directories
> > > and files in order to rely on the recursive cleanup of the "root" dir=
ectory, it
> > > should be covered explicitly by the API. I.e. (sub-)directories and f=
iles should
> > > have some kind of keep() and / or forget() method, to make it clear t=
hat this is
> > > supported and by design and won't lead to any leaks.
> > >
> > > Consequently, this would mean that we'd need something like your prop=
osed const
> > > generic on the Dir type, such that keep() / forget() cannot be called=
 on the
> > > "root" directory.
> > >
> > > However, I really think we should keep the code as it is in this vers=
ion and
> > > just don't provide an example that utilizes ManuallyDrop and forget()=
.
> > >
> > > I don't see how the idea of "manually dropping" (sub-)directories and=
 files
> > > provides any real value compared to just storing their instance in a =
driver
> > > structure as long as they should stay alive, which is much more intui=
tive
> > > anyways.
> >
> > Yeah that's whats normally done in Rust anyways. But I think that
> > lifetimes bite us in this case:
> >
> >     let debugfs: Dir<'static> =3D Dir::new(cstr!("sample_debugfs"));
> >
> >     let sub: Dir<'a> =3D debugfs.subdir(cstr!("subdir"));
> >     // lifetime `'a` starts in the line above and `sub` borrows `debugf=
s`
> >
> >     /* code for creating the file etc */
> >
> >     Ok(Self { _debugfs: debugfs, _sub: sub })
> >     // lifetime `'a` has to end in the line above, since debugfs is mov=
ed but `sub` still borrows from it!
> >
> > This code won't compile, since we can't store the "root" dir in the sam=
e
> > struct that we want to store the subdir, because the subdir borrows fro=
m
> > the root dir.
> >
> > Essentially this would require self-referential structs like the
> > `ouroboros` crate [1] from user-space Rust. We should rather have the
> > `.keep()` function in the API than use self-referential structs.
>
> Fair enough -- I think we should properly document those limitations, rec=
ommend
> using keep() for those cases and ensure that we can't call keep() on the =
"root"
> directory then.
>
> Unless, we can find a better solution, which, unfortunately, I can't thin=
k of
> one. The only thing I can think of is to reference count (parent) directo=
ries,
> which would be contrary to how the C API works and not desirable.
>
> > [1]: https://docs.rs/ouroboros/latest/ouroboros/attr.self_referencing.h=
tml
> >
> > Another problem that only affects complicated debugfs structures is tha=
t
> > you would have to store all subdirs & files somewhere. If the structure
> > is dynamic and changes over the lifetime of the driver, then you'll nee=
d
> > a `Vec` or store the dirs in `Arc` or similar, leading to extra
> > allocations.
>
> If it changes dynamically then it's pretty likely that we do not only wan=
t to
> add entries dynamically, but also remove them, which implies that we need=
 to be
> able to drop them. So, I don't think that's a problem.
>
> What I see more likely to happen is a situation where the "root" director=
y
> (almost) lives forever, and hence subsequent calls, such as
>
>         root.subdir("foo").keep()
>
> effectively are leaks.
>
> One specific example for that would be usb_debug_root, which is created i=
n the
> module scope of usb-common and is used by USB host / gadget / phy drivers=
.
>
> The same is true for other cases where the debugfs "root" is created in t=
he
> module scope, but subsequent entries are created by driver instances. If =
a
> driver would use keep() in such a case, we'd effectively leak memory ever=
ytime a
> device is unplugged (or unbound in general).

Yes, this is one of the things I don't currently have a good safe
solution for without introducing something with similar power to
`self_cell` or a bespoke type implemented unsafely like the `Tree` I
mentioned earlier in the chain.

>
> >
> > > It either just adds complexity to the API (due to the need to disting=
ish between
> > > the "root" directory and sub-directories) or makes the API error pron=
e by
> > > providing a *valid looking* option to users to leak the "root" direct=
ory.
> >
> > I agree with this, I want that `ManuallyDrop` & `forget` are only used
> > rarely mostly for low-level operations.
> >
> > ---
> > Cheers,
> > Benno
