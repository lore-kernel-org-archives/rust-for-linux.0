Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEBFEED6
	for <rust-for-linux@vger.kernel.org>; Wed,  1 May 2024 08:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714551636; cv=none; b=ptqhIwe4vrju46M1W/RRHWqI78x1p1zGkCNH9/rW8M8vfQm/zNZ1q+mxKQuWbIogl11x2OCfd9pS41X4BhfL4YpwPoWmyhmes71EdQgv1lKZxiJ5b2eukMNZ2BvBbVq6wjZZukb5Per4kGia2866RfLMmjp7cK0WD4IuKVn72Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714551636; c=relaxed/simple;
	bh=tPONQ8eVYDv1DgKhtF9Q9qCIdOnk1aTk9safZqVEBRc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H17IWo6YnjrVgAXrAhpSNqXmBW3vPsqmyyOaL3YlE5w97fvPSFD1Z55gBwAHE7+9M16+8J7Iot+HYN0gOQUE9dZa0fkyWdTRQ5wGchJ8WZ8wSo1SFt0W5iopISXZ37Xiu22OBTE7iR2AX8cjTAZiEz0XpdcGimwlFwkDyBGGJqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=W5L8s180; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="W5L8s180"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=kxvjwpnvrneu3jfubnbwr6hflq.protonmail; t=1714551625; x=1714810825;
	bh=tPONQ8eVYDv1DgKhtF9Q9qCIdOnk1aTk9safZqVEBRc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=W5L8s180jaCQMKEZiYVp9e8dAE4cLLzxY80IYJTKicFB8fuiYDHWK2ZgKDLFRr4rM
	 AI3TlKhNNrf0zKpCRKf0b8M+OIWx/SneBasfrio6GoYPIZvoABv9u2Xy5ga68ksjsn
	 jaUPHd/nO9OADLQ1RQTCJMop7QDKhFD4UtypnlYufeaD6dBw9/eXfhkhkvdPKbO6WG
	 ouJkJphuRFWgWem/0ItHTH2NC+/TutsMnnGLzFcV+sIJtJ76YujbtetlFG5LD1+0Ar
	 ZTv2+uiKxRDVg/6KR1zONvHYfwarlB0XjvpgvPI0ojmDfzr3CwcnGBdCbSU+7LxCPb
	 RHSsrVnM9a5IQ==
Date: Wed, 01 May 2024 08:20:19 +0000
To: Danilo Krummrich <dakr@redhat.com>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@samsung.com, aliceryhl@google.com
From: Benno Lossin <benno.lossin@proton.me>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
Message-ID: <2c69a6eb-67a2-439c-ad27-70be130436d4@proton.me>
In-Reply-To: <20240430121322.2660-1-dakr@redhat.com>
References: <20240430121322.2660-1-dakr@redhat.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 1fcb8281aeffa13ceb018172a513880212e88961
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 30.04.24 14:13, Danilo Krummrich wrote:
> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> passing a dangling pointer (instead of NULL) to krealloc() whenever a
> new Vec<T> is created through VecExt<T> extension functions.
>=20
> This only works as long as align_of::<T>(), used by Unique::dangling() to
> derive the dangling pointer, resolves to a value between 0x0 and
> ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
> pointer however.
>=20
> This isn't a case we should rely on, since there may be types whose
> alignment may exceed the range still covered by krealloc(), plus other
> kernel allocators are not as tolerant either.
>=20
> Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
> capacity is zero.
>=20
> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation fla=
gs")
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Nice find!

Reviewed-by: Benno Lossin <benno.lossin@proton.me>

I don't mind the `match`, but an `if` is also fine.

--=20
Cheers,
Benno

