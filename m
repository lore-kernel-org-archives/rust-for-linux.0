Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380D5329365
	for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 16:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767024446; cv=none; b=CQ9g9ZoSet3LLlq1jqHLLMEgrlCC11alenapQXh6rdONznnKSZWlCV2Arx0D5TzNcJFdGO+nI3gykDU5yugsuQDZ60kb85xElDR8uvhlxq0Rv2wKkAmMd7tRjH2KmU1NJF2qCJMTiX3xVHERKeiBV5b32aN8WxMTQ6l8NKGbCx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767024446; c=relaxed/simple;
	bh=4Udc90xKA69CVn7Um/gl7i2XmLh6B6dU+iY38ezM6FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ORj8gHFoOcQG07fN7hTcmCCq8DNfbWUC0D7qEtmQ9w+ee3QTWMWRQFSFTjaSqtoATX6IHcrtWLqUsnd9CACT70cyVK8MfI8KTVgvCE8vNDU1F6zDyCTEtw220paj+tZIznZSJEXqYKMOn/dA2idgO5vUTQxUG7YPiqfMH72YnSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1upPGwu; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1upPGwu"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3825ae23d95so23480621fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 29 Dec 2025 08:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767024442; x=1767629242; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4f+VaUREAokeuI/rlnWPh+sE4WF8IbfXbo6+kslGWsM=;
        b=D1upPGwuiZj4kbGmCxXpO2TjhoPWLXlYB0w78+crylkp/QRhTsPXCgpieSAM/MVSk/
         S81wBbyZTTwJLpQDcBOjxvSSEsv/7TW3gljX9KDsEmUT+i/7cyC15rVsG0vtNnJ0gpzU
         ymsS6vztkMYUo29kY9FQBXFwKB9EKfh8vPiqCiuYeB/4kjGj7dFRmgU60FNyBcwf+3+s
         PXXivRK194KBOHILMLC9/pz6ISwH98KZjlXQm7s5Lkmdaa6EcGImcyaWkH/AEv8axNH7
         jqwqq75xy+8QQeZkyTcFDP6rTtV3trGOrwOcumo+GsMiWPjsJmes5cAOdo+eXWYK54C8
         ZOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767024442; x=1767629242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4f+VaUREAokeuI/rlnWPh+sE4WF8IbfXbo6+kslGWsM=;
        b=FFOoN3A+qFb3a3gkKw1eqThl3QaulEPysUcdLHicKtZ0KgUGeB5wyJOBGOx9RYtIQ1
         p0p5qRQ08Xbz2ybi/EYFekbN+6/cvD9jBSw/zJdTpuX3k2BgN2SzhQVFTxo7dCbi1Vwt
         0Yro6kfUtk6pLi58ZfzkLhuEWLfDR1i+XBwHxFZei4PzIVBpTuiiW8ne0RxuYY5cypW5
         QOmBBUpfDFqYphPkvsuofLnXFQwoMr3W4j4PowVEDCBWp8wQ+wMQJBgf8o5XjwSAovBt
         WESHEopdpqZLAyMtl/jJ1lqr8h1BeR+16B4zogOUmT48Vqhs64jBUPFJLjiRpp4wiF3U
         lCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfEijy0ssBv3gOJIvrzaeSb+5IGJC7dFiWrByqab0tF5Tq9Id/YWJAAzzC7d7L4lGOuhy1G6T8hz6e4MFCLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy843/fUmrkDdRoei+EJl0gVaRMz628GwvqQLHVr5McIjDARNSD
	KdcA4k2MyZ/p5A5Xrai9ubazuHi+C3zFVjUrmdcfV0vt1v5wcAqiK9DABdhm7oOYDK8ngptyN38
	THZEnNSJqLsSzLKhyLts4vlwRjYvNfnM=
X-Gm-Gg: AY/fxX7zG9JsmeN58xwjLlTnZ7vMGjmS5P2YYbnaHmnlJ0btxciZ0LYAzqtwxkZS2+q
	A919Ia5WXw7M/0yEtpxv0sqlYmzQINWaUV+Kd1xSRCzq9bQ2xeb6xZp/rAWP7WdYlKqByp55T5V
	i1MsTd9iJU2zDOQEBMWOoHw0iEwwgHFEmsDeQ2LA+6kGT2WMw99tgvM1cHITokVTX5UBO7wpxRk
	1zeHliD33/3Hubx25dnhvX6cVk7kMf/S+H/9pG2ljp75AbbjgiQDr7UpoG9R70kgrZYLP5/rxag
	ae6/PYATqkCchjMRu8b8MdWoocGrImWNSnI66iGXq8UfVwxxxXkxAu7XBFVy6J0P+TooFQCY6oq
	JP4EM31Jx1/pHYavLA6NGOkypCawrHd/w8oLBk4GjPFiLSMWjnV7Y
X-Google-Smtp-Source: AGHT+IEOZfd9DfAvLFUM1AtaSXPGJmnn7UaGAO/pgm32ZQd8fVSZo+7BSBNhUJVMh0I0CT5JzHyltg4MxjKGTmTtgTM=
X-Received: by 2002:a2e:a552:0:b0:37f:8d02:4f52 with SMTP id
 38308e7fff4ca-381216887bemr120117541fa.40.1767024442144; Mon, 29 Dec 2025
 08:07:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203-xarray-entry-send-v1-0-9e5ffd5e3cf0@kernel.org> <20251203-xarray-entry-send-v1-5-9e5ffd5e3cf0@kernel.org>
In-Reply-To: <20251203-xarray-entry-send-v1-5-9e5ffd5e3cf0@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 29 Dec 2025 11:06:45 -0500
X-Gm-Features: AQt7F2pRjhjvMxRgEyprBObO2UVkra9wPU9fOZmv15YaWuCOt-tDNqwXPCx9RFg
Message-ID: <CAJ-ks9mXoTdOO+Zb9F=cpTrwa+XZ2mLb3NDH9pyd_GZhD2TVRQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] rust: xarray: use `xas_load` instead of `xa_load`
 in `Guard::load`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 5:27=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> Replace the call to `xa_load` with `xas_load` in `Guard::load`. The
> `xa_load` function takes the XArray lock internally, which would cause
> a double lock since the `Guard` already holds the lock.

This is not correct. `xa_load` takes and releases the RCU lock only,
not the XArray lock.

> The `xas_load`
> function operates on XArray state and assumes the lock is already held,
> which is the correct API to use when holding a `Guard`.
>
> This change also removes the `#[expect(dead_code)]` annotation from
> `XArrayState` and its constructor, as they are now in use.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index f6e610b059625..0f69a523b72bf 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -215,8 +215,10 @@ fn load<F, U>(&self, index: usize, f: F) -> Option<U=
>
>      where
>          F: FnOnce(NonNull<c_void>) -> U,
>      {
> -        // SAFETY: `self.xa.xa` is always valid by the type invariant.
> -        let ptr =3D unsafe { bindings::xa_load(self.xa.xa.get(), index) =
};
> +        let mut state =3D XArrayState::new(self, index);
> +        // SAFETY: `state.state` is always valid by the type invariant o=
f
> +        // `XArrayState`.
> +        let ptr =3D unsafe { bindings::xas_load(&raw mut state.state) };

Can this be a method on XArrayState?

>          let ptr =3D NonNull::new(ptr.cast())?;
>          Some(f(ptr))
>      }
> @@ -327,7 +329,6 @@ pub fn store(
>  /// # Invariants
>  ///
>  /// - `state` is always a valid `bindings::xa_state`.
> -#[expect(dead_code)]
>  pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnable> {
>      /// Holds a reference to the lock guard to ensure the lock is not dr=
opped
>      /// while `Self` is live.
> @@ -336,7 +337,6 @@ pub(crate) struct XArrayState<'a, 'b, T: ForeignOwnab=
le> {
>  }
>
>  impl<'a, 'b, T: ForeignOwnable> XArrayState<'a, 'b, T> {
> -    #[expect(dead_code)]
>      fn new(access: &'b Guard<'a, T>, index: usize) -> Self {
>          let ptr =3D access.xa.xa.get();
>          // INVARIANT: We initialize `self.state` to a valid value below.
>
> --
> 2.51.2
>
>
