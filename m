Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403EE3AB490
	for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 20:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779826726; cv=pass; b=fA7vPtqDvM9YHwVXQ1H1Ln2BiY/O+kkKuIv/+te5nKPofO55rfDr6biErNhL7E7XcVTIJQAHLYQYV8nYOPfs03huS0Q4GarlddwBBJ92jgfYRnSeTJqaKBD2zsNT8Mt/uVC9gmXFuz9OrMNcz/wF9hmEdodk8tuk+kToxz8IAo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779826726; c=relaxed/simple;
	bh=2EfW5FJiLUMdxFZx0t3GAXCm7D9MDorB8Rk3fnu3n2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9oIVU4KuOZBlLyapAfq9ZVeXbtI99q9usjAivoPJE/V3JCDTv31xuBFXknCRWSlf3/Fa8/pIPdeMEKLEC8mYkqCV6O7U7TOi1QbnJAOKKQOiR9vtmDFYfAGm7OUVaS4YKntL5GxGmjcr7o0f4y+CKRGdSzOJqWMvzKj8IBJqwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+a3R2BJ; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+a3R2BJ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67c1eea6b4dso545a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 26 May 2026 13:18:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779826724; cv=none;
        d=google.com; s=arc-20240605;
        b=ZAT1QR2GMDPUySBb8WZITUYg3VlAwS8CbcKOQljPsdJJ0Vy2Ued74yYJjgCx1Dd099
         hnr5k6s04FQMFhyzns+5omhetgR4A0W80RkYRWPFhcEcO800bfKoja0Z2/6fPixHO4UK
         8qpt8JW+VDoeQsy66yhWthVe9QhvcvYYs2RNGGcXfiBFb/xHKggHz0ON/aUNy7z7LEEB
         DMrsyzY2tAVgJREPnmHL28Uo3qDr6T8wcJ2GucjiEs4DLCHhQY8pT/AdjYXyWykCBC36
         wHo8q5F12jh31P8TS8UCMdA6uwu+IK65bjSvDtbOcqNXmsrf9DcNowpZxSGgp4sZq8Up
         7T/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aJlM3BAYDrmo3DwancX1ED2w1utQAochXYkQZkRqHXo=;
        fh=CU3thqSgo8BuFWXG/GOAgN4QLZPSKE6rKqrzP2fSRPY=;
        b=Bdbi90ApsroieveltGg+fRlIv60pO7lojAOBJCQB6VEoqHCh4wpMPxkVm40tW2Z/Js
         Z6G1NylkUTPKaaLRO8UH1ESu155f6VU2IIxoh/HMLk4tL3U4H8PNyBYyu7TYSCB0h0vv
         1y/Ea96zMqu82/LdPyLMHYX3DJVS2ZF6awomrZq2hMaZa6UNG0OzNDHBOlAEuZFzD5AF
         YHCgZJKFSe5N1ktalWeyfZ0cnJssaiGH95ptjfzI1DoZzgqJuOqUUCzC4R6kFoHVmFpr
         nMob7+nHYI0k3ytrKlbN9mQUXLLHYWFFZZIx/8fS1y4/5bXD0TZCczpj8x1d2UxkqRZq
         3GQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779826724; x=1780431524; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aJlM3BAYDrmo3DwancX1ED2w1utQAochXYkQZkRqHXo=;
        b=k+a3R2BJUerkJ8Wsjtxv/34QcMl7yoFaP2EE4fdMatPkJq/ESVe4ny5E/sIG7i1Mc0
         8vhhN5YlN9uCRGigNw4RzmpsyVGjvscYOEpv+oG3wiD4uhAYiFq4rA1KAis+rGDTT5ZL
         7jKYLvL/6+wa2IqaoGEPVRt2iyDnWZkzfnujL05tYiXTLt93DSDwdwNE3y0L7NljPtWL
         jiUClP9eZsxMwFhPAUSl5lL9uKFqTrzVdTS3VOXVv6g5Z5glEXbUcxVbr0bof4yglnqA
         qLDdkerdKDJDYsUM1NHfMYzCRyvaldfTUNrpMGbxb9eCLpgguGrTSko6dUIqiTDCI3rs
         ShWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779826724; x=1780431524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aJlM3BAYDrmo3DwancX1ED2w1utQAochXYkQZkRqHXo=;
        b=rgkYnE/1P5d8xTeTYYD5IZgNnVi/LRCjkpjLR0xcbvk8L+/5FqVxR0FAlYFLm4dPAu
         0XJHYvLwLYD6wAI61WkBd4AzgfuHoFijGWvT9pi/IwwM7wFoZMrA1xAwpIhj41FiSLyY
         DZNmmQ5Ewi7jinSQ47l1Uff4nNoeMRa+cm/X6uo8skmaxi+SkEZoXCYkLmlC2HnoYAIX
         neYk2JzbD4QZDRIMCQbNqE2WMHe8rbe+30QkuksDO+xjMvVWI6N/niF9ZRKor+2SAn8k
         VQRGrw6Y4kHN+Q2w2C1/Ab1ZEXAyINFeg0z3b/8q4NnGCeKGWL3D1hJg+lgXD9uK4dKK
         +fzg==
X-Forwarded-Encrypted: i=1; AFNElJ8xCLAh5xZr/YtYDR4uRQY/081bRgj5m3ysV2ZLXuzeR7r8QRyU5XpIcgPZ8w+MZ85viE4J5uUQ5kUfUlQWHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfenO9U6j3Mhz7jhfvCi/gSFSw/CDhKzqpEQu5VMlt/z30egS
	FQagAEQpz8tL55I5D3RRhZ4pn+T5ZuS+AfHYqZYQfoFFosT8e1oFuQcLd1p5OEuRiV7QVNAQO5m
	ZMyXsDAbFguH2bFzDvgrSmotxcB++gwWaLgZKLPJJ
X-Gm-Gg: Acq92OFz8tQDoRezHbG4Hwldw+7guQwIxfJ0cm4bUi5vfgJInMcTxHmG+oUODFjTrLO
	pdhgAGFxGDb6GVs5SNPxRWtzQK8L773xfxBxuz11ezYlMiW36eeQvo/qZ023p3lGDDdKvuj6gzX
	Un63tKWTUL1Kzkheww+yv8yXFsaDuBzCz4qDlJO/PLPamerWGEUZu7el17AZiY/EKvAwFKL1HMd
	kvTYB1ykdU63Xtc2qOR2KtyGPVQpkiqASukG10491Yd4ueGXC/Koj33G68Z2pCdxABY6y0RDSz+
	GeV3v6ySx6b20DGoEpBoHMrTbsd7qUqPV/BymbiehtTM1Nk=
X-Received: by 2002:a05:6402:100e:b0:67c:f3b6:5fef with SMTP id
 4fb4d7f45d1cf-688fd13675cmr181352a12.6.1779826723187; Tue, 26 May 2026
 13:18:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org> <20260526-fileops-unsound-redesign-v2-2-6fc11066b530@kernel.org>
In-Reply-To: <20260526-fileops-unsound-redesign-v2-2-6fc11066b530@kernel.org>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 26 May 2026 13:18:31 -0700
X-Gm-Features: AVHnY4JZHjLPzhwx15C8hQq2kw1MyRAsEHnLXCiNNpE1KCJ7vZ6SPIU_N1J_OZU
Message-ID: <CAGSQo03Fv_qqGTxugL1eddby4wfiUm9MHevnNxyg1dVXAfCA4Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: debugfs: avoid transmuting FileOps
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:08=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
> `FileOps` has the default Rust representation, which does not guarantee
> the same layout for different generic instantiations [1]. Thus the
> reference created by `adapt()` is not justified.

This is correct, though I'll note for the sake of anyone concerned
with an existing kernel that this can only break with
`-Zrandomize-fields` in the current compiler - the layout engine only
examines layout data + an optional random seed when that flag is set,
so swapping out a ZST, no-alignment-requirement field for another ZST,
no-alignment-requirement field will never result in a mismatch unless
you are actively randomizing fields.

> The callback operations do need to access private data through one of
> the transparent adapter types. Express that relationship directly: make
> `Adapter<D>` the unsafe proof that operations implemented for an adapter
> may access stored `D`, and instantiate the corresponding operations
> tables as `FileOps<D>`. The adapter implementations are justified by
> their transparent representations [2].

I think your approach here may need to be adjusted because:
1. `Adapter` requires additional knowledge at the trait usage site
(that the invariants of the target are upheld - specifically
type-inhabitedness).
2. You now access `FILE_OPS` directly off the type, rather than off a
value, so you no longer have any proof that types are inhabited that
you require.

You might be able to rework this so that you can track inhabitedness
properly, but maybe a simpler resolution might work - what if we just
add `#[repr(C)]` onto `FileOps`? The addition of an unaligned ZST
field to a `#[repr(C)]` struct should never change its representation.

> +/// Operations may reconstruct a shared reference to `Self` from a point=
er to

I think this is the crux of the problem with this approach. Users of
the trait can't really know the invariants are upheld as-is. See later
comments.

> +/// `D`. Implementers must also arrange for any additional invariants of=
 `Self`
> +/// to hold whenever such an operation is called.
> +pub(super) unsafe trait Adapter<D> {}
> +

>  ///
>  /// # Invariants
>  ///
> -/// If an instance for `WritableAdapter<_, W>` is constructed, `W` is in=
habited.
> +/// When `WritableAdapter<_, W>` is used for file operations, `W` is inh=
abited.

I don't think this works. `WritableAdapter<Foo, Bar>` can be crated
for any D and W at compile time, there's nothing stopping it. That
means that the `FILE_OPS` constant produced must be valid or fail to
compile. Invariants on types are runtime statements about the object
level. You cannot check for `W` to be inhabited at compile time, so
this isn't a valid invariant.

>  #[repr(transparent)]
> -pub(crate) struct WritableAdapter<D, W> {
> +pub(super) struct WritableAdapter<D, W> {
>      inner: D,
>      _writer: PhantomData<W>,
>  }
>
> -// SAFETY: Stripping off the adapter only removes constraints
> -unsafe impl<D, W> Adapter for WritableAdapter<D, W> {
> -    type Inner =3D D;
> -}
> -
>  impl<D: Writer, W> Writer for WritableAdapter<D, W> {
>      fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
>          self.inner.write(fmt)
> @@ -58,19 +58,20 @@ impl<D: Deref, W> Reader for WritableAdapter<D, W>
>      W: Fn(&D::Target, &mut UserSliceReader) -> Result + Send + Sync + 's=
tatic,
>  {
>      fn read_from_slice(&self, reader: &mut UserSliceReader) -> Result {
> -        // SAFETY: WritableAdapter<_, W> can only be constructed if W is=
 inhabited

I don't think this is valid - you don't know that `read_from_slice` is
only called after creation through the callback API. If that's what we
want, then we need to make the trait method `read_from_slice` unsafe
and tell the caller they need to make sure that's how this was
constructed, and things will get out of hand. This is what I was
referring to earlier - we want to use the presence of a
`WritableAdapter<_, W>` as evidence that `W` is inhabited, but we no
longer can because of the invariant change.

> +        // SAFETY: The callback API obtains this implementation only aft=
er
> +        // receiving a `&'static W`, so `W` is inhabited.
>          let w: &W =3D unsafe { materialize_zst() };
>          w(self.inner.deref(), reader)
>      }
>  }
>
> -/// Adapter to implement `Writer` via a callback with the same represent=
ation as `T`.
> +/// Adapter to implement `Writer` via a callback with the same represent=
ation as `D`.
>  ///
>  /// # Invariants
>  ///
> -/// If an instance for `FormatAdapter<_, F>` is constructed, `F` is inha=
bited.
> +/// When `FormatAdapter<_, F>` is used for file operations, `F` is inhab=
ited.

As above - access to FILE_OPS is not unsafe, so you cannot make the
caller required to prove something to access it. (And you certainly
can't do it here - such a declaration would need to be in the trait
defining the `FILE_OPS` constant at a minimum.)

>  #[repr(transparent)]
> -pub(crate) struct FormatAdapter<D, F> {
> +pub(super) struct FormatAdapter<D, F> {
>      inner: D,
>      _formatter: PhantomData<F>,
>  }
> @@ -87,27 +88,22 @@ impl<D, F> Writer for FormatAdapter<D, F>
>      F: Fn(&D, &mut fmt::Formatter<'_>) -> fmt::Result + 'static,
>  {
>      fn write(&self, fmt: &mut fmt::Formatter<'_>) -> fmt::Result {
> -        // SAFETY: FormatAdapter<_, F> can only be constructed if F is i=
nhabited
> +        // SAFETY: The callback API obtains this implementation only aft=
er
> +        // receiving a `&'static F`, so `F` is inhabited.
>          let f: &F =3D unsafe { materialize_zst() };
>          f(&self.inner, fmt)
>      }
>  }

> +// SAFETY: `FormatAdapter<D, F>` is transparent over `D`. The callback A=
PI
> +// receives a `&'static F`, which establishes its inhabitation invariant=
.

This is the problem - the impl itself can't know that we got a
`&'static F`. You'd have to demonstrate that at every cast site, and
the knowledge isn't there anymore because you removed the construction
invariant.

> +unsafe impl<D, F> Adapter<D> for FormatAdapter<D, F> {}
