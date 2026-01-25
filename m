Received: from forward501d.mail.yandex.net (forward501d.mail.yandex.net [178.154.239.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED3F2314D38;
	Sun, 25 Jan 2026 06:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769321087; cv=none; b=mhxCcv5yg4R0VPPO8Wp5GyrT2ZRQYnXMdARiKvgAxBtNb4ck16JyyycWIyHZs+C6/O4O5MED0viRDUG4ar1LYCNcSxuLl/1clSJfAOcyfhN3hI9YFOI60z2fdbvCGIrU2xZly+A3CQetLRVQd8j0c9XYz9G4PruO1NuscMCNWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769321087; c=relaxed/simple;
	bh=mKI65uQfdttck0XGI30sNZ6BzM9FkcJjqhaqTNZ6sHo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z4PBJOt9RIYB1qM/WbqnnPUDZpxUf0rl2npof9BCMPgroooZV+TcnT6qAwSQ7BZFH3x5emTNVu8ZKdtv1U9yvTMQODVqNMQWTKBCLkgFsgyTjHc+i2YD2K9Y7ziNRgvhgLwE6tPPYKHegfL6BW58Mrpu7mXNpiG06z1FZLqJoNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=IrmaiHLH; arc=none smtp.client-ip=178.154.239.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="IrmaiHLH"
Received: from mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:4f41:0:640:844:0])
	by forward501d.mail.yandex.net (Yandex) with ESMTPS id 93B97812A8;
	Sun, 25 Jan 2026 09:04:35 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id N4Y6YlRG7Gk0-1rjyqfXE;
	Sun, 25 Jan 2026 09:04:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1769321074;
	bh=WCbFfuaV77j/v1KBYTwDQyBmZgDQ8KWwbEnrRUWnlzk=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=IrmaiHLHU3XSU+/MDKHt0bYpDj4vimuqu8HnDRUbDBkiFXNoby/C4Y0yP7dXsBhWc
	 +QcmFXo/k/+Bg8e8wMew2TtUC1EY80YLyu+UdW8hkZQokekfrHrmDQCo7Z3xs5LEKE
	 1klTxQZm7Vl7FZ8wg1rRn4Y/QzEN8M9RT6NMoyYI=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Sun, 25 Jan 2026 09:04:21 +0300
From: Onur =?UTF-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, =?UTF-8?B?Qmo=?=
 =?UTF-8?B?w7Zybg==?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] rust: sync: atomic: Provide stub for `rusttest` 32-bit
 hosts
Message-ID: <20260125090421.0b09ae21@nimda>
In-Reply-To: <20260123233432.22703-1-ojeda@kernel.org>
References: <20260123233432.22703-1-ojeda@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, 24 Jan 2026 00:34:32 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> For arm32, on a x86_64 builder, running the `rusttest` target yields:
>=20
>     error[E0080]: evaluation of constant value failed
>       --> rust/kernel/static_assert.rs:37:23
>        |
>     37 |         const _: () =3D ::core::assert!($condition $(,$arg)?);
>        |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> the evaluated program panicked at 'assertion failed:
> size_of::<isize>() =3D=3D size_of::<isize_atomic_repr>()',
> rust/kernel/sync/atomic/predefine.rs:68:1 | :::
> rust/kernel/sync/atomic/predefine.rs:68:1 | 68 |
> static_assert!(size_of::<isize>() =3D=3D size_of::<isize_atomic_repr>());
> |
> --------------------------------------------------------------------
> in this macro invocation | =3D note: this error originates in the macro
> `::core::assert` which comes from the expansion of the macro
> `static_assert` (in Nightly builds, run with -Z macro-backtrace for
> more info)
>=20
> The reason is that `rusttest` runs on the host, so for e.g. a x86_64
> builder `isize` is 64 bits but it is not a `CONFIG_64BIT` build.
>=20
> Fix it by providing a stub for `rusttest` as usual.
>=20
> Fixes: 84c6d36bcaf9 ("rust: sync: atomic: Add Atomic<{usize,isize}>")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> I kept the `cfg`s separated instead of using `all` so that, when we
> get to remove this (since these tests will eventually be moved to
> KUnit), it will just be line deletions (and I find it easier to read,
> too).
>=20
>  rust/kernel/sync/atomic/predefine.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/rust/kernel/sync/atomic/predefine.rs
> b/rust/kernel/sync/atomic/predefine.rs index
> 45a17985cda4..0fca1ba3c2db 100644 ---
> a/rust/kernel/sync/atomic/predefine.rs +++
> b/rust/kernel/sync/atomic/predefine.rs @@ -35,12 +35,23 @@ fn
> rhs_into_delta(rhs: i64) -> i64 { // as `isize` and `usize`, and
> `isize` and `usize` are always bi-directional transmutable to //
> `isize_atomic_repr`, which also always implements `AtomicImpl`.
> #[allow(non_camel_case_types)] +#[cfg(not(testlib))]
>  #[cfg(not(CONFIG_64BIT))]
>  type isize_atomic_repr =3D i32;
>  #[allow(non_camel_case_types)]
> +#[cfg(not(testlib))]
>  #[cfg(CONFIG_64BIT)]
>  type isize_atomic_repr =3D i64;
>=20
> +#[allow(non_camel_case_types)]
> +#[cfg(testlib)]
> +#[cfg(target_pointer_width =3D "32")]
> +type isize_atomic_repr =3D i32;
> +#[allow(non_camel_case_types)]
> +#[cfg(testlib)]
> +#[cfg(target_pointer_width =3D "64")]
> +type isize_atomic_repr =3D i64;
> +
>  // Ensure size and alignment requirements are checked.
>  static_assert!(size_of::<isize>() =3D=3D size_of::<isize_atomic_repr>());
>  static_assert!(align_of::<isize>() =3D=3D
> align_of::<isize_atomic_repr>());
>=20
> base-commit: a44bfed9df8a514962e2cb076d9c0b594caeff36
> --
> 2.52.0

Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>
