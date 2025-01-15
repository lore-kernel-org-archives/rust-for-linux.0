Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561B1D6DA1
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 19:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736967682; cv=none; b=dk3tJv24Vmw7xf8kZOcxawBQ7bVb+a24BsOCANhFCuRdc2rUJZXbYwK1Vx6AKnoe+80GZMhCw20uhh0cmiXEZ/r/Yhmf/WmF48UHl8LsCkslkzYDSIVAto7WQgA88jhRZumte71JPCcsrZrBUA8PERLaoppn3NjrmIuGeXF81dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736967682; c=relaxed/simple;
	bh=z+F0K6zpGAY6m64tbqwJUCSdmoEwd5tbbTNZenDMxAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0XxLUB10fW6hRJTFTpScURC4UyeMoF0H7mJbBpVHkqH5/s/JrIK0+S6U5Oqh1jQuFeDXpUz3jWzZ+U5nv3wYV6eqCFtXqA9WRW2a/NL/6kAANo0Udm2bkur0MyLOOxbME1A8F2m1LZk0guINmS1umjR8CHG2DcD9y1IiDbnijA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C4OB3Ull; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C4OB3Ull"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so96286f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 15 Jan 2025 11:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736967678; x=1737572478; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RQoZ89wygUmQPDQumFzGgrFUnZf1tx1WhZ3rTHnw9U=;
        b=C4OB3Ull26HjRyWJISgPbW6R97oHaR+SpdvxIe9L4WPTUKKKln/k95rGp9iY0q35Ba
         qD5lTvVcmDAuSQpqbP369KRn1ReZIC/Abg2Ij/i+kNDKVYtt+jvmRUWgkcKh9W+Zc4oi
         JWzcj1u5pACM8G9sf3R+CcTv37dLSBTybGTyA4+AO255gubfCqoE7BrJ9uhBpyjFVFLT
         AZJTA/LVcL69uWxQx4fVCRqRWmuyDwTGE5ZnBtQlG5InG3SimsmZKibq/qf+qzr3mHnD
         +rzjPNonXgiwUQ5cWMDt1RvF/1qd4IP4svd6dG+SO8WcOOqau5dPDAGYVuEFAd4EmyD4
         156w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736967678; x=1737572478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RQoZ89wygUmQPDQumFzGgrFUnZf1tx1WhZ3rTHnw9U=;
        b=o6M+YwEZyCyd8enuJpKGs8Q4Xx6bu3/rrVMR8l+hQ+uLtSwy/a6j62+ceEfN/CRobP
         JIXU2kjadooUiiQhCQp8Ma3RVPcGkXOYjtL/p427xoCNr2sovApm9arZmxWG8R50oMrS
         iGPs3vkMveq8DmF89fe3sq+S7AJESDnvncCB9IOpbseN4emeXUfbp/O9kPI2wa0JCnS4
         3mfDup9hJkKoMI/YFUqqfSiUJHQMlMyIt2UEEX8ij9VupCt5ZxSbd1xaS89c/CGi6aNb
         hiEROr3sS6E2fV3Y/kTjzCcQSR5gsPZZDqDyoBcjbNuEyJyes2mnge1JRA3f6qI7Gfi6
         Uhgg==
X-Forwarded-Encrypted: i=1; AJvYcCWRVUeMTjmgrqZeobj5jZjrOfrLzVuhwFoq81b+o1zZ4sj1b7xlkw5biGjki6thQjqumRdFcom6GaYIZSLNgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+OvyxbngB9G2RVHMhaU1DNNkPs3zM3b0+zlly2qMqfuUQf4C9
	pfQ8AvuxZ3w/BPHuaTmrHsmjGau/jSc5LeJN+U1cEsHdFsTDgZsRFN2VD1zhlcnwZMJ/TYMttNl
	N7QLlHxP4JDuDBbNmSmlagrwoeq7M7h8Xcwsw
X-Gm-Gg: ASbGncu+jUzWMydD/21h+X2wODBtY54TbuSBL4u/gNPp2GzhYbsMpXkGf7m9NOo9UQk
	LQ29E0p88Heu2TISMDORawbluttq/lmBtrtl4Twc=
X-Google-Smtp-Source: AGHT+IE8vT+zrOIqo/JciTsuo+w9AeFMv8A6T7qu11MmfE2XYjG6cUx4dJ9/wXEhElSQW39GBzvAOSD1UDLbhEDx14k=
X-Received: by 2002:a05:6000:144d:b0:38a:615b:9ec0 with SMTP id
 ffacd0b85a97d-38a873122edmr27844243f8f.54.1736967677806; Wed, 15 Jan 2025
 11:01:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241221183024.3929500-1-gary@garyguo.net> <20241221183024.3929500-3-gary@garyguo.net>
 <CAH5fLgjOfw2otu4FJ1XHhjsSx3Fj3iQA25Hh-Anz5jXaLamrAQ@mail.gmail.com> <20250115123234.6d3bba78.gary@garyguo.net>
In-Reply-To: <20250115123234.6d3bba78.gary@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 15 Jan 2025 20:01:06 +0100
X-Gm-Features: AbW1kvYYHqLER1cSh0xW_2W5YPOBbC9XI3CC9PU2VzJrsQdS-3wkrTDtwgFyDzA
Message-ID: <CAH5fLgg3+15i3jOuviQ6JVdT1sVVipUzO-sBLb0AsZQeQ2PXJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] rust: convert `Arc` to use `Refcount`
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	Valentin Obst <kernel@valentinobst.de>, Alex Mantel <alexmantel93@mailbox.org>, 
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 1:32=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue, 14 Jan 2025 11:02:25 +0100
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Sat, Dec 21, 2024 at 7:31=E2=80=AFPM Gary Guo <gary@garyguo.net> wro=
te:
> > >
> > > With `Refcount` type created, `Arc` can use `Refcount` instead of
> > > calling into FFI directly.
> > >
> > > Signed-off-by: Gary Guo <gary@garyguo.net>
> >
> > [...]
> >
> > > -    pub fn into_unique_or_drop(self) -> Option<Pin<UniqueArc<T>>> {
> > > +    pub fn into_unique_or_drop(this: Self) -> Option<Pin<UniqueArc<T=
>>> {
> > >          // We will manually manage the refcount in this method, so w=
e disable the destructor.
> > > -        let me =3D ManuallyDrop::new(self);
> > > +        let this =3D ManuallyDrop::new(this);
> > >          // SAFETY: We own a refcount, so the pointer is still valid.
> > > -        let refcount =3D unsafe { me.ptr.as_ref() }.refcount.get();
> > > +        let refcount =3D unsafe { &this.ptr.as_ref().refcount };
> > >
> > > -        // If the refcount reaches a non-zero value, then we have de=
stroyed this `Arc` and will
> > > -        // return without further touching the `Arc`. If the refcoun=
t reaches zero, then there are
> > > -        // no other arcs, and we can create a `UniqueArc`.
> > > -        //
> > > -        // SAFETY: We own a refcount, so the pointer is not dangling=
.
> > > -        let is_zero =3D unsafe { bindings::refcount_dec_and_test(ref=
count) };
> > > +        if !refcount.dec_not_one() {
> >
> > This is wrong. The into_unique_or_drop function must establish an
> > acqrel ordering when a UniqueArc is created, but dec_not_one() does
> > not do so. You need to use refcount_dec_and_test() instead.
> >
> > Alice
>
> Ah, good catch. In this case I think an acquire fence in the unique
> path would be sufficient? Or would you prefer to use `dec_and_test` and
> `set`?

The existing approach is what I prefer.

Alice
