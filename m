Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B9262BE
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838309; cv=none; b=NS6D1UbD19/f8EPSqQl6ePWoG4j+1/LMbyKMOWcpTYwPHp6RTheCWR/hww4Fz8DLsF9T8bQAZk8s6X/0SRHRPID/WhivoqjJpHEdysH543+rTJpXKdJds+6VlsfthK7wQXK+t9gac8vsBWitogW2n1l8E8omXJlD2vWmP5YrC2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838309; c=relaxed/simple;
	bh=tmkUTCeitcxj2HeFbnojuBpPs/wri1ouVQFjpm2pgbA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OCg8R2t/YFy7zVYKJ3x3vS199F0JsiSIpbiOdCRouQwHAIe/vgN/bS1o2xG2/+Zp3hqUIkwRT7J+5RZaTeSm3F46KsgH4exyveOZPgvOAxtCwxl2h5iMjxgxrGj6Izi+mxvamKsrmnfSz05qp0rSttontpVVHzvXuhyMng0kaiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=acN0KhfZ; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="acN0KhfZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1716838306; x=1717097506;
	bh=tmkUTCeitcxj2HeFbnojuBpPs/wri1ouVQFjpm2pgbA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=acN0KhfZi2L/z0HB7QErK0P/70EGaVy252FZ72aFQm0o+qkD19SBwZTyz+0BfMKzi
	 B2mzmUgCrXE8MO2YJ31bz9Sy1Ps773b43/r7uJMrRQIbwseVCHvZuiTe1s/uxKF/iD
	 3nMS6uuEnlJuoCb1FVXhfr/x0oM/k314nnLDoriWcyzTbwGLC1QnegDFhqiBrX3hPI
	 cUcpcBhEUiBydF2xF4BXMUy9lcMEm/2YKr/SJ9GHwPq0/tZ55GFqhr3AMAv61J1bJG
	 85y8vXn8LN7H+tNWTX4qqNY2Q3FImSLuxF1zeU/Wlqk+Xn7cRsT1n8bBHfcSCR0o0o
	 5QhzgMHsRklEA==
Date: Mon, 27 May 2024 19:31:40 +0000
To: Aswin Unnikrishnan <aswinunni01@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: fix datatype in docs for `module` macro arguments
Message-ID: <4c32dc65-8664-459a-997b-65ed5ed2d884@proton.me>
In-Reply-To: <20240512112324.8514-2-aswinunni01@gmail.com>
References: <20240512112324.8514-1-aswinunni01@gmail.com> <20240512112324.8514-2-aswinunni01@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: d1a034b0b9eb7e53c54bfd85f4f2e0697e2a81e6
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 12.05.24 13:23, Aswin Unnikrishnan wrote:
> Remove the mention of byte array as datatype for `module` macro arguments
> since the arguments are defined as string, and `alias` is a string array.
>=20
> Signed-off-by: Aswin Unnikrishnan <aswinunni01@gmail.com>

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

---
Cheers,
Benno

