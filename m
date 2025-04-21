Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74B421EF363
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Apr 2025 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745270633; cv=none; b=sj89EbikKPLLxG7+ne0prUiawJqN/R+ebxVA/LEWfiBadW8gzf5G6K1Fex9eWz3CFDl5DJFcoVuXTG4oIrRkntzqLSjRbVej9whJbSTvXMh4p4Tg0LDCzndjqRkoVtev6ajww7wfMPuKbRQkqL4PslHCUr93WdD50n+QdhthnlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745270633; c=relaxed/simple;
	bh=iHeTs5nXx3hTKme+zGF2ot2q40w0ixmu4t2pD5839pQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e9d2rAW/ASNya+UlMPA5MiNLg5TnL5W+oeBGv1QtgMtg1FaZdwSKxZm2KPCuv+EnZAaI8bRhnwcTjtvPOnr5OatNuKWtWlL60x5alD4kfkK43YQjxzPj4NQsbGUCVOeYIYKa1NJWrUDS/YIF1/TIBKzqEqcuohU/qNxinMj2S00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=dbiNi2zo; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="dbiNi2zo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=6tiwfbzhmzcg7loqctjiltp2oe.protonmail; t=1745270629; x=1745529829;
	bh=r8CRCxPCHdU58HTLnMLakplVEEKpqmsVjC+J31WwUIM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dbiNi2zoPKss9eceOr71d2rElOsumCZcJrB6GlcBM8aq0hAE8VKwZZxVTKYfmQLfS
	 i+FIJ3RDB4QEWiSY8WvTLiVooGAIBm/Zl3qq4FNtMRQRC7HnpKrlq853o2iiTy6bJ6
	 ZHEVi9IhI3HrVsf5bCWVYZVe9zpmQ/xLCmzD3pMqFwNyoOGtdEXKUZKRb+aT/RWOdq
	 fp7ccY7KW9j/N1tF8CVeTeGvLMxayen7UbjESNvePeqirO5vEaDNgoE574bv/6Myts
	 ltV6BGY0U49dZ9dE4OIvKZzUeabH665e9FvgGfTAewdzXIiCkQT0OlpM+7YFDFAUJB
	 Me3cYWNh5RD8A==
Date: Mon, 21 Apr 2025 21:23:43 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 0/3] pin-init: fix issues found with new CI
Message-ID: <D9CMSTK8576Z.3BM2AXWOX81L5@proton.me>
In-Reply-To: <20250414195928.129040-1-benno.lossin@proton.me>
References: <20250414195928.129040-1-benno.lossin@proton.me>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 03829fefc90fff1fd710adfaec3436cd56182a1d
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon Apr 14, 2025 at 9:59 PM CEST, Benno Lossin wrote:
> I changed the CI upstream [1] and found a couple of smaller issues. I
> again used my automatic sync script for this patch series, so if
> anything (even small things) looks off let me know!
>
> [1]: https://github.com/Rust-for-Linux/pin-init/pull/33
>
> Benno Lossin (3):
>   rust: pin-init: internal: skip rustfmt formatting of kernel-only
>     module
>   rust: pin-init: examples: conditionally enable `feature(lint_reasons)`
>   rust: pin-init: examples: use `allow` instead of `expect`
>
>  rust/pin-init/examples/linked_list.rs   | 1 +
>  rust/pin-init/examples/mutex.rs         | 1 +
>  rust/pin-init/examples/pthread_mutex.rs | 4 +++-
>  rust/pin-init/examples/static_init.rs   | 1 +
>  rust/pin-init/internal/src/lib.rs       | 1 +
>  5 files changed, 7 insertions(+), 1 deletion(-)
>
>
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8

Applied to pin-init-next -- thanks!

---
Cheers,
Benno

