Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08B13B791
	for <rust-for-linux@vger.kernel.org>; Sun,  3 Nov 2024 20:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730666805; cv=none; b=jfQKKJpi/zGl6jyl0YiqVzbF9oU+omiw+veewuEP34lXCWkdDrKh3sasonVOQWbK1Q2Kyk68NN9OtKVvynruFg8IpTTtgL1wdtkbgYel/rM8hgjxK2io4CYcsLJ1pDdbcgAuZ/tamuP6SQsIbwnIhgUd7phDtt2GX03uAHzwReQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730666805; c=relaxed/simple;
	bh=jgKiFMaD8xJWPO5F4jQXX0pEB7iX0SdGvxrCA/nGFNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KfzXe9J74b5QH9SXlpv8CEc4QJ2XulOgAg/TFZkKc7sVy4uBMZzgfiOiw/iq88oQdiUG7AQgMpMykw1LdKii3wQbYN/yJ9h+WhkdUqsrh6A4lUwb3GKqJulpUzIpBQ/aHpAAyEYwf+8ZePsYEq/2pPmFXDyecrNAvXycBsO2LpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiPgcg54; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiPgcg54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE4E3C4CECD;
	Sun,  3 Nov 2024 20:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730666805;
	bh=jgKiFMaD8xJWPO5F4jQXX0pEB7iX0SdGvxrCA/nGFNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tiPgcg54ieYHuVOqKACpyJ5SOzz1hgF5H3OK4QFnpEfF4fjMaIxuMpCAt9CR+PL6G
	 uOYx225kHXojZtRdomi8MA841fs2u1jPxRHy/N2MRefaYKtdexjI02bqFpvZASU049
	 mNSEAZQUMdVgVArfS/E+XKWk+sDRct5SJQBfE6drEIfIVh9K0HuFrA491XXeFcLcAG
	 9PwmXd9ZGq3kJnN3P9iewOSeXhsWfmta9iRFeAQw8hVvO1QvRPlXERR915IiFbPh1Q
	 hYVzt2fwZUOkYuJ9G7FLlgHzmjt0/dkGVoUJkSTXpcHcGXS+J1/RIdVfZNenUnl8oI
	 ST/0AHYLAgZww==
Date: Sun, 3 Nov 2024 21:46:40 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Guangbo Cui <2407018371@qq.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: Implement Display for Box
Message-ID: <ZyfhMKAjFgEm6rTO@pollux.localdomain>
References: <tencent_CC0134B8E94CCD93D347DAB9ACAB48652F09@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_CC0134B8E94CCD93D347DAB9ACAB48652F09@qq.com>

On Tue, Oct 29, 2024 at 10:28:38PM +0800, Guangbo Cui wrote:
> Currently `impl Display` is missing for `Box<T, A>`, as a result,
> things like using `Box<..>` directly as an operand in `pr_info!()`
> are impossible, which is less ergonomic compared to `Box` in Rust
> std.
> 
> Therefore add `impl Display` for `Box`.
> 
> Suggested-by: Boqun Feng <boqun.feng@gmail.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1126
> Signed-off-by: Guangbo Cui <2407018371@qq.com>
> ---
> Changes in v3:
> - Update `fmt` implementation to clarify that it does not call itself infinitely.
> - Link to v2: https://lore.kernel.org/rust-for-linux/tencent_F71CE9D125A8C6191D8CF95B3A4F3BB2F506@qq.com
> Changes in v2:
> - Add missing tag: Suggested-by.
> - Update the patch title and the changelogs.
> - Link to v1: https://lore.kernel.org/rust-for-linux/tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com
> 
>  rust/kernel/alloc/kbox.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
> index d69c32496..a496a866d 100644
> --- a/rust/kernel/alloc/kbox.rs
> +++ b/rust/kernel/alloc/kbox.rs
> @@ -427,6 +427,16 @@ fn deref_mut(&mut self) -> &mut T {
>      }
>  }
>  
> +impl<T, A> fmt::Display for Box<T, A>
> +where
> +    T: ?Sized + fmt::Display,
> +    A: Allocator,
> +{
> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
> +        <T as fmt::Display>::fmt(&**self, f)

Since you went with this variant,

> +    }
> +}
> +
>  impl<T, A> fmt::Debug for Box<T, A>

please also change it for `Debug` in a separate patch, as requested in [1].

With that,

Acked-by: Danilo Krummrich <dakr@kernel.org>

[1] https://lore.kernel.org/all/a335869c-6bc4-49c1-b6a8-1c4ca4e98b20@kernel.org/

>  where
>      T: ?Sized + fmt::Debug,
> -- 
> 2.34.1
> 
