Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D669F19539F
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Mar 2025 19:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742844266; cv=none; b=USqQC6wRyTnfpfVuLFh94lr0EYYKX+Irvqa7LsWG+s/3uuJGUNT/E9fOzD4yLLJ43nAJYULjBmn93lbgczWsMmEAAmfoFL8WZEGr4WPSyNgJ3y/lu8iFyQRYy4NIgSGY00fqck6ML3B2jdQnztJ/4GASDlW/mMoWEK+C2ZSAu5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742844266; c=relaxed/simple;
	bh=nkTxu009NQ5UU3+dbsATisTlFzJnCqjnxTIxzlLicIY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mw/WgdM1YEsAaXnhTmhgqkIhXi7bLKEnSqJLoR5HO6lrVnbY99snS/MW/oCECDE/+UxiRIwSC7XYd9Kwj/kN9Hj9zVllT/yqhtNB8EWhBaTe4u5zhxZ6q6Jn2zeRzYb2aK0Ds3TCaLJwARVQtCW1tywlPpFovC2tDfIN/BgAUYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=LJZ96VBf; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="LJZ96VBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742844251; x=1743103451;
	bh=q97+feDpWPHKUFXD3RxpZ9EdhA3DXcJuxfG0IiWrx1Q=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=LJZ96VBfVgN9Y0rHcjb/tXDEcn2hQrraTR5d66PLN7s4vsFhyE9QADCu8DGkIgrQs
	 RdxUN1X59WLt/e3pAueleeClJjd6w3gExJ60kJwXqNdEPfZZzkvxFegGAX+BYXrYRF
	 fe4CXE2A+BNAK03CATOD6nnGMq6OkqnDiQXUGv2Oi7AKXTDQYb6ZrrBwJuYNyFMkUV
	 aEPq83YrWXh81xU7UvJlFcmbZ4zX2KLOflhwl/A6oytEWGF1cWt6Ork1rlZcrtWMNN
	 HpAdl7821BacFyVucXBSXWHVYEwT/9L4kiXtDFfuubenhSGRGA+ZCVAQuJ0kqpYu0u
	 HfT4urwQCRE1g==
Date: Mon, 24 Mar 2025 19:24:04 +0000
To: Altan Ozlu <altan@ozlu.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: static_assert: add optional message
Message-ID: <D8OQPZ158VUE.OXMRUZI9MJ3Q@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 721206748cfb63751a04d827e2367638fdc5ab83
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Mar 24, 2025 at 7:45 PM CET, Altan Ozlu wrote:
> Add optional panic message for `static_assert!` macro.
>
> It doesn't support argument formatting, due to `const_format_args`
> being experimental. It will fail to compile if a message with argument
> is given.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1149
> Signed-off-by: Altan Ozlu <altan@ozlu.eu>
> ---
>  rust/kernel/static_assert.rs | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
> index 3115ee0ba8e9..27771dc2988a 100644
> --- a/rust/kernel/static_assert.rs
> +++ b/rust/kernel/static_assert.rs
> @@ -6,6 +6,9 @@
>  ///
>  /// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
>  ///
> +/// It has optional argument for custom panic messages.
> +/// Panic message doesn't support formatting.
> +///
>  /// The feature may be added to Rust in the future: see [RFC 2790].
>  ///
>  /// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static=
_assert
> @@ -24,11 +27,11 @@
>  /// const fn f(x: i32) -> i32 {
>  ///     x + 2
>  /// }
> -/// static_assert!(f(40) =3D=3D 42);
> +/// static_assert!(f(40) =3D=3D 42, "f(x) must add 2 to the given input.=
");
>  /// ```
>  #[macro_export]
>  macro_rules! static_assert {
> -    ($condition:expr) =3D> {
> -        const _: () =3D core::assert!($condition);
> +    ($condition:expr $(,$arg:tt)?) =3D> {

Shouldn't `$arg` be a `literal` fragment?

---
Cheers,
Benno

> +        const _: () =3D core::assert!($condition $(,$arg)?);
>      };
>  }
>
> base-commit: a0b539ad369fe434fe488faf92d4ae770a27a90f


