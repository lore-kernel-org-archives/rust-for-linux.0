Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch [185.70.40.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FC618A6C4
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Mar 2025 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742725916; cv=none; b=GI6t/17sJDX1+6/MFifY1U8PLMKUISadPO1pjtKnLZKLYYD3lH0aXk8+IvE7WOJ1D5WTDrHF1LT6Jof5c1rUbUlcuRsBz4v8gsGIHdkjmsQIE3pnUGoCPasez/IENedTqGT8DTNO169xtsNzlk/7Cq/rijGJuEvhBF+FlFrtqc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742725916; c=relaxed/simple;
	bh=55nNheuxwighvJJtye1aLs775mgpl+RwATACEKBvtbw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PSxeuxomRpzYwHyM0uU8TCW3uoiXsYh/qcRD7Ty21WQsv1dF9GPL8NRcZsbOudhuccK0bs0gQHmjgzt2Jm44IKD/5DjHRFEMi+iLXJVcYsrqHHqVXt+2in4gUP2xrsOgPQe7dYDy0lgSRvwBIuNHhgldnL5lvDZY73AhfwMdPg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gtLjuS0O; arc=none smtp.client-ip=185.70.40.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gtLjuS0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742725911; x=1742985111;
	bh=3HnCqEYfVz9tGyk/ujqrF4/JHfRLbmYi1i3YjJoCR74=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gtLjuS0OrFvq9Pczol+eCXqqTrbVTG13dPwPf9FFDEUF8P0BTDZB1T0oy/uroaYgM
	 0NLUBVtJTJ3gftVIvwtwV5oDdxJkX5ZqqNXmoTsaXOYpv154mm/yi/qwCmXsBBQd1t
	 p6zIMGeJEwHYD12MPiiLkR3PyCfy+oM9hKiodSxXkjZF86rav8jZP3y+6vg6fxIoUK
	 C34fTp7Yj4AvtnvLAnkucyodU/zx8mFjsu9VnOcU4Clf3vrqYEbm9XtxUm8Ghah4gq
	 qHuIBTv3BoMRBtQYE7YhgNNJ0w1lO8+iVS7eKJ9G5s6vqmDE0CTiIVijaukPP0lXN/
	 oT2Noe63Rj2uA==
Date: Sun, 23 Mar 2025 10:31:44 +0000
To: Antonio Hickey <contact@antoniohickey.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 03/17] rust: list: refactor to use `&raw [const|mut]`
Message-ID: <D8NKRTW2HB2H.3PHK4DVWSV2OJ@proton.me>
In-Reply-To: <20250320020740.1631171-4-contact@antoniohickey.com>
References: <20250320020740.1631171-1-contact@antoniohickey.com> <20250320020740.1631171-4-contact@antoniohickey.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: b56a39f33cb2af22bcc38dff8d0c9121d28a7d0b
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu Mar 20, 2025 at 3:07 AM CET, Antonio Hickey wrote:
> Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
> with `&raw const place` and `&raw mut place` respectively.
>
> This will allow us to reduce macro complexity, and improve consistency
> with existing reference syntax as `&raw const`, `&raw mut` are similar
> to `&`, `&mut` making it fit more naturally with other existing code.
>
> Suggested-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://github.com/Rust-for-Linux/linux/issues/1148
> Signed-off-by: Antonio Hickey <contact@antoniohickey.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

> ---
>  rust/kernel/list.rs                    | 2 +-
>  rust/kernel/list/impl_list_item_mod.rs | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)

