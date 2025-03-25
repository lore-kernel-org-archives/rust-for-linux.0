Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1B1269816
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Mar 2025 22:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742941208; cv=none; b=oMLJ6JBUZlnB0krhk/keOsxKM+dpbhNPnROIZ10Rj5vW2NEzegoTJwHGr4Rjb+nWxV5OLRGiqFNWVFfersvY9+FE4TIKLomMkwzPokd8cWErB+8de94bFfntyOx9eRQqFc+8zK5MshOwK1AR/C2ute+Ygpyf3dt3WPxnpkdhSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742941208; c=relaxed/simple;
	bh=cLfEeqF2gzWa9oEAMs/bhSMsTtM0eILPSoAwOscoVW8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nx1XM8eYPlypMubo664dmUcqYQ0zM+/ujCWnu1SRoA1ntTVvrBc7luNdINYbZpPCyjAT80j1hvYxV2SHFFSLG1tlHYBwZBm26uLhlA7XgjLWT+KqccZ8pDWE6W5XvxfgLZ9TjOD916L1ct+PWohJhMReOgph3VCmPeP473AnjEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=RlaXR5KC; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="RlaXR5KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742941204; x=1743200404;
	bh=AfdXMxItz7ASl7AeFoi1i2leDmwj1yIRITbSzxorUWk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=RlaXR5KCsFySc42ECFIngkUtYuViRit+FrK+Ag05uW+j4L9NrkR+IZgIR6AwE8OvE
	 /xKbpLzSbsi0RyV2V528m1gXlsR0vA9iwD0k/2V6oZImgpOx7ZokHcceEo9IL5mJoG
	 9ZgiTSc98071gboC/V6SESgoSpkaqkbFjAp5W690aVhCogO92fXl6mrO8tlP1IL4+A
	 ZQtt7tKEqcOzpkevztXHmW8ZSVqc1aDUOZQ+nqj4KmPloHMBh3zWFzqF1Do7iZ239f
	 alS6AHdET5agkHl48dL0+dFDqcZbSn34TTRQXZpwhVFWLsVPoYwP8zlldO6EnIbRIs
	 Ccmf0GW76h66w==
Date: Tue, 25 Mar 2025 22:20:00 +0000
To: Altan Ozlu <altan@ozlu.eu>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3] rust: static_assert: add optional message
Message-ID: <D8PP38NJHQ9D.3RPW5BNXLF96L@proton.me>
In-Reply-To: <20250325211011.1093374-2-altan@ozlu.eu>
References: <20250325211011.1093374-2-altan@ozlu.eu>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4f706695ea6f620dff95f73b1a64573e7b2dbe26
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue Mar 25, 2025 at 10:10 PM CET, Altan Ozlu wrote:
> Add an optional panic message for `static_assert!` macro.

s/for/to the/

> It doesn't support argument formatting, because currently `assert!`
> doesn't allow formatting in const contextes.

I would make it even more clear:

    The panic message doesn't support argument formatting, because the
    `assert!` macro only supports formatting in non-const contexts.

>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1149
> Signed-off-by: Altan Ozlu <altan@ozlu.eu>
>
> ---
> Link to v2: https://lore.kernel.org/rust-for-linux/20250324210005.990827-=
2-altan@ozlu.eu/
> ---
>  rust/kernel/static_assert.rs | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/static_assert.rs b/rust/kernel/static_assert.rs
> index 3115ee0ba8e9..b0569dccfb76 100644
> --- a/rust/kernel/static_assert.rs
> +++ b/rust/kernel/static_assert.rs
> @@ -6,6 +6,9 @@
>  ///
>  /// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
>  ///
> +/// It supports an optional argument for custom panic messages.
> +/// The panic message doesn't support formatting.

Similarly here I think this fits better:

    You can supply an optional panic message after the expression. Currentl=
y only a string literal
    without formatting is supported due to constness limitations of the [`a=
ssert!`] macro.

---
Cheers,
Benno

> +///
>  /// The feature may be added to Rust in the future: see [RFC 2790].
>  ///
>  /// [`_Static_assert`]: https://en.cppreference.com/w/c/language/_Static=
_assert

