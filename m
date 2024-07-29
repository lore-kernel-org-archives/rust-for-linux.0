Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001A5266A7
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Jul 2024 11:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722252719; cv=none; b=t/yX+mEzqwOIzfwINSVP+5On2FomI+F54JYIF9zBxd2Go3IK7C09Ld9dr/nMNcKoe1N9tjFdEE5UUJ8nYpyATzOpOoPhOh6DYV/3u91u7fKj/qbdc1Usys1aCw9uSKMxkAWqh5g4Rf0n3uw3mmWEHsJMbam+rsE8Yp6qDS+6AeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722252719; c=relaxed/simple;
	bh=zRgsRQ0uomO17T2PCctDUFhNXglR9MEaJiFaxSxCTxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5ub+HwhY3cQ9EYbVbi3vmZZRC8lCDWWVf3KHaDzKdip/ym/fmfWHWIH/mcv3XB2wsfiOejipP03acl7bQAR3MCg36P7Hluh3UGVtOlZt3kKKem/oNJg2nzAthsjoyTtdGBNZo8N/k3hJWgtSegT3M3jU4WRRLhQNLaTEaIZ3RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=s8sulLsr; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="s8sulLsr"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280c493719so14142385e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Jul 2024 04:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722252716; x=1722857516; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gew36eeAUPQsBQz3aIc1k+AkxIEKTKyXQHEOw/2/kNA=;
        b=s8sulLsrI12fjIk01X08P8K/nBsSH3/3VQL0IPkRH9Sa1menEmvcvjdTIkE6s4Cy/c
         +NgNjczH9hLcCxWMxMxQ3KITYbt9YhhKayxmPzCOuMrlCEuxbIqpvPOTdB4N+wt9687y
         lxZBVPVuE9kzwGFxkruEjf7zjrLzo3xi6kfqSOcuDjUn+a8Gdjw5b34XH8wi4brxHwXB
         d4bT3aPPIyk6IfuqQMQk7UNfme1MW7uz/7J8JXObKaLSXDRFovA7ax+3u5dzA1mtSXfD
         9LYbBkTdwdVJJAqF4pyotMbL7168xtHvz7iPJDa7zpfbzqubLK4U21TFK2F46nCrOGLx
         ALHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722252716; x=1722857516;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gew36eeAUPQsBQz3aIc1k+AkxIEKTKyXQHEOw/2/kNA=;
        b=aq1RKhkk4uVZdPqGAvDMZhFRoPFn6dcQoTTXhfvwtQc1FyPvPMbiAICMoFieOm4rwa
         2Su86/u1NBEaNEdhCHXj+/ysjfxAzSkZ858U2zQK997t5QRfdAFl5+jdZzobD0tgzVHm
         KrlVumP3bwIJQLDM68F8smv0REMulvOp7NSnmJtEor4RZ4B6MZpcRuFfWLe8uEAS39Kg
         7vmWroEyQazgSc86v70ntbIPwvOH17d8ZqBpheI16xTX7LhCoi2lQv1Uae3k7klvb+ac
         iJxeMVa899o3A8dkk5uxEi18DwwbMiKIGp87cNvAJB0GRIeSl7KXND+mJXNJP0KL0qXs
         7w2w==
X-Forwarded-Encrypted: i=1; AJvYcCUIcD/n5rs4nExPq2WKojKscTwNWoIzBVpangI4xpumnqYNsui4tYyjTHM8uEYgx0oiaBWIkjVTg77sX1KCBmlh+GFn1BzqUNhMHfiheUo=
X-Gm-Message-State: AOJu0Yyf/uuYQqCGhoKpdyZIezaLzcOKoBmyYYBmT2VGUKFIg8FGgAIY
	zHgWCwJbQ1qHFgS56NkAEk6m4ApoUP9c3jtw8NNbohDDWOrBaXuOawstSfwh6TTapqWbGrr0qrN
	T095bTscNnomDibkDST9q/B5Vzx5+u5xscwfv9fzTcNnaXi74yWXSXsQ=
X-Google-Smtp-Source: AGHT+IHyxXa3qdLSuWKtrceeju8KVNs7tJYBxhJbpA2HDpL6vJr06mNsJv89cYL46cEm3z2rJP3RgYJXmPhoKde9JXE=
X-Received: by 2002:adf:e045:0:b0:369:c6ec:27d5 with SMTP id
 ffacd0b85a97d-36b5cf24914mr4571139f8f.30.1722252716042; Mon, 29 Jul 2024
 04:31:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240710032447.2161189-1-boqun.feng@gmail.com>
 <CAH5fLgjat2Y6RT957BhdOjJHt7rPs0DvZYC6JZ+pHFiP=yDNgA@mail.gmail.com>
 <ZqE9dzfNrE3Xg3tV@boqun-archlinux> <bcdd74f3-d0c0-4366-976a-5a935081a704@proton.me>
 <ZqK1l05zcCwGforV@boqun-archlinux> <beaf1fa3-eebe-443c-bc51-abd9348a411d@proton.me>
 <ZqOyMbi7xl67UfjY@Boquns-Mac-mini.home> <81ceeca9-8ae5-4a82-9a46-f47767e60f75@proton.me>
 <ZqO9j1dCiHm3r-pz@Boquns-Mac-mini.home> <8641453e-664d-4290-b9bc-4a2567ddc3fe@proton.me>
 <ZqPMpNNq0Q0S-M2P@cassiopeiae>
In-Reply-To: <ZqPMpNNq0Q0S-M2P@cassiopeiae>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 29 Jul 2024 13:31:44 +0200
Message-ID: <CAH5fLgijqHoKrWmHBb+FQntPDgR2qA_r4y0gyib21AHU+mscNw@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: types: Add explanation for ARef pattern
To: Danilo Krummrich <dakr@kernel.org>
Cc: Benno Lossin <benno.lossin@proton.me>, Boqun Feng <boqun.feng@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Jonathan Corbet <corbet@lwn.net>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@redhat.com>, 
	Trevor Gross <tmgross@umich.edu>, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 26, 2024 at 6:20=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri, Jul 26, 2024 at 03:54:37PM +0000, Benno Lossin wrote:
> > On 26.07.24 17:15, Boqun Feng wrote:
> > > On Fri, Jul 26, 2024 at 02:42:36PM +0000, Benno Lossin wrote:
> > >> On 26.07.24 16:26, Boqun Feng wrote:
> > >>> On Fri, Jul 26, 2024 at 01:43:38PM +0000, Benno Lossin wrote:
> > >>> [...]
> > >>>>>>
> > >>>>>> You can always get a `&T` from `ARef<T>`, since it implements `D=
eref`.
> > >>>>>>
> > >>>>>
> > >>>>> Yeah, but this is unrelated. I was talking about that API provide=
rs can
> > >>>>> decide whether they want to only provide a `raw_ptr` -> `ARef<Sel=
f>` if
> > >>>>> they don't need to provide a `raw_ptr` -> `&Self`.
> > >>>>>
> > >>>>>>> Overall, I feel like we don't necessarily make a preference bet=
ween
> > >>>>>>> `->&Self` and `->ARef<Self>` functions here, since it's up to t=
he users'
> > >>>>>>> design?
> > >>>>>>
> > >>>>>> I would argue that there should be a clear preference for functi=
ons
> > >>>>>> returning `&Self` when possible (ie there is a parameter that th=
e
> > >>>>>
> > >>>>> If "possible" also means there's going to be `raw_ptr` -> `&Self`
> > >>>>> function (as the same publicity level) anyway, then agreed. In ot=
her
> > >>>>> words, if the users only need the `raw_ptr` -> `ARef<Self>`
> > >>>>> functionality, we don't want to force people to provide a `raw_pt=
r` ->
> > >>>>> `&Self` just because, right?
> > >>>>
> > >>>> I see... I am having a hard time coming up with an example where u=
sers
> > >>>> would exclusively want `ARef<Self>` though... What do you have in =
mind?
> > >>>> Normally types wrapped by `ARef` have `&self` methods.
> > >>>>
> > >>>
> > >>> Having `&self` methods doesn't mean the necessarity of a `raw_ptr` =
->
> > >>> `&Self` function, for example, a `Foo` is wrapped as follow:
> > >>>
> > >>>   struct Foo(Opaque<foo>);
> > >>>   impl Foo {
> > >>>       pub fn bar(&self) -> Bar { ... }
> > >>>       pub unsafe fn get_foo(ptr: *mut foo) -> ARef<Foo> { ... }
> > >>>   }
> > >>>
> > >>> in this case, the abstration provider may not want user to get a
> > >>> `raw_ptr` -> `&Self` function, so no need to have it.
> > >>
> > >> I don't understand this, why would the abstraction provider do that?=
 The
> > >
> > > Because no user really needs to convert a `raw_ptr` to a `&Self` whos=
e
> > > lifetime is limited to a scope?
> >
> > What if you have this:
> >
> >     unsafe extern "C" fn called_from_c_via_vtable(foo: *mut bindings::f=
oo) {
> >         // SAFETY: ...
> >         let foo =3D unsafe { Foo::from_raw(foo) };
> >         foo.bar();
> >     }
> >
> > In this case, there is no need to take a refcount on `foo`.
> >
> > > Why do we provide a function if no one needs and the solely purpose i=
s
> > > to just avoid providing another function?
> >
> > I don't think that there should be a lot of calls to that function
> > anyways and thus I don't think there is value in providing two function=
s
> > for almost the same behavior. Since one can be derived by the other, I
> > would go for only implementing the first one.
>
> I don't think there should be a rule saying that we can't provide a wrapp=
er
> function for deriving an `ARef<T>`. `Device` is a good example:
>
> `let dev: ARef<Device> =3D unsafe { Device::from_raw(raw_dev) }.into();`
>
> vs.
>
> `let dev =3D unsafe { Device::get(raw_dev) };`
>
> To me personally, the latter looks quite a bit cleaner.
>
> Besides that, I think every kernel engineer (even without Rust background=
) will
> be able to decode the meaning of this call. And if we get the chance to m=
ake
> things obvious to everyone *without* the need to make a compromise, we sh=
ould
> clearly take it.

I think I've come around on this question. I think it's fine to have
raw_ptr->ARef methods that increment the refcount, but we should make
a naming convention clear. I propose:

* Functions named things like from_raw_file or from_raw_mm do not
increment the refcount.
* Functions named things like get_file or or mmget do increment the
refcount, just like the C function of the same name.

Alice
