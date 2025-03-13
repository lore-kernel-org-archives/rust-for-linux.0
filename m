Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch [79.135.106.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DB61EF09A
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Mar 2025 11:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741866046; cv=none; b=rw62yyY61Nu7/f1ZEtNvFQdyzm3B6R3ZMzMLeM4NUb0tldJhSsiV2rDb6p22R1IZUluF8LgSbQrhBrQtcIJrVDnAas0TUgJacnZHoPslorbw90X/GM0TA2wTDvb5i4mSuxcGtygQqp6u/MrzrMGZAWQ4K6LC7shpqEqferpbizA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741866046; c=relaxed/simple;
	bh=dADYmb8K9GgDNXQ67bqleLeuvIh2tnN2E1VMVQi0ipQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sV4RmxBMGBV9PFkMPGXDUcbahq9OwiEYGTciKVB7iJc4aklKHzKlqXQV+GUKQLytlKwhWibKFY11ndFhHEjfTt3d+0g2gPO/5s4hmaQTAqUeeIDIMdYzQhuqd9quY1w8pmGtx1jAzD53eaMX1KjVuOcVuBUHhKpeopiMsMXjqS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=W2uSraNg; arc=none smtp.client-ip=79.135.106.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="W2uSraNg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741866042; x=1742125242;
	bh=5GnIOlqHCM0sUxmxAzlqwN2j3skyVfL4xNHDIOjyddM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=W2uSraNgBIieSuO6/GlKw/pmpX7M/dfqpiMhk95SMcT4yESAA1nRCLeaWlXhv/3DM
	 itsXBS92ev8jn7IDnRHqnUSAfThZ4YLKWf1hNzIpM4zVkauWCW8BELF2IKVoj1xOVW
	 OhBE4b1BOv2zTE0xby5PWOF5Qcs/y0lOyYZIvL1twsPr/E7TOH8TDHkVe8bc62f1UY
	 +/XYNP3/wIE8I9lpDJrhH9I9Q5A1f0CLDQF4iQWUeB5Od6tx56G9J6bhCuVqudsnMl
	 j8mw01o/KDl99mWCwi0ROwz/eLRKunE57mnrXFxNi41T7yx9YYIF7LkgCJQWrd0Vlu
	 0rkipZSFel1Qg==
Date: Thu, 13 Mar 2025 11:40:34 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Benno Lossin <y86-dev@protonmai.com>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] rust: enable `raw_ref_op` feature
Message-ID: <D8F3Z37118Y6.QO0BF41MVCU2@proton.me>
In-Reply-To: <010001958dfeacb5-9039aaab-6114-494a-9f1d-f13982091169-000000@email.amazonses.com>
References: <20250313053340.405979-1-contact@antoniohickey.com> <010001958dfeacb5-9039aaab-6114-494a-9f1d-f13982091169-000000@email.amazonses.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 4f6bdb05c03d50b522e9bc0f97bda7718c72ac8a
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 13, 2025 at 6:33 AM CET, Antonio Hickey wrote:
> Since Rust 1.82.0 the `raw_ref_op` feature is stable.
>
> By enabling this feature we can use `&raw place` and `&raw mut place`
> instead of using `addr_of!(place)` and `addr_of_mut!(place)` macros.
>
> This will allow us to reduce macro complexity, and improve consistency
> with existing reference syntax as `&raw`, `&raw mut` is very similar to

One more thing, it has to be `&raw const` instead of `&raw`, I missed
that in the original issue, sorry!

This also needs to be fixed in the other two patches.

---
Cheers,
Benno

> `&`, `&mut` making it fit more naturally with other existing code.
>
> Suggested-by: Benno Lossin <y86-dev@protonmai.com>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
> ---
>  rust/kernel/lib.rs | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 398242f92a96..1d078f69bb19 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -19,6 +19,8 @@
>  #![cfg_attr(not(CONFIG_RUSTC_HAS_COERCE_POINTEE), feature(unsize))]
>  #![feature(inline_const)]
>  #![feature(lint_reasons)]
> +// Stable in Rust 1.82
> +#![feature(raw_ref_op)]
>  // Stable in Rust 1.83
>  #![feature(const_maybe_uninit_as_mut_ptr)]
>  #![feature(const_mut_refs)]


