Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584731E22E6
	for <rust-for-linux@vger.kernel.org>; Tue, 28 Jan 2025 21:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738099460; cv=none; b=EV7KAnjk+pvH7PY2CGMpxc9edVeb74K1Orvt4oMbz68Xh212JrE5JbBvzF0a1ixy/xEH6nhikhvFrybFl1TVSbHdH7F71m/xNyrUhR41vsSPj1AHs1szAdECx0mmuaM/EBh009laSUAn3w0ZO5KAWkdCPosaVuI3blZe4ngDuKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738099460; c=relaxed/simple;
	bh=17s8GiGuXLHbRXZp9Yjq3vbc43VWuO/HTZOO3jqGc54=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gID6RkjQrldsieCnUrXB87TTPEVQRMotJsLlqECS/2Adh0DkIYyOmH81HiBpmXnM5ql4cegxJqCTbZ3X/9UxsD99A4fXyZJ1SKSvs17jXegN29GlRA47mfPZocAWWH3sSnR1Gc4xlZ4J4wWwiKFgeX4v6XE9sG/g9MIIdSuLMSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=ZHppgl1B; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="ZHppgl1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1738099449; x=1738358649;
	bh=17s8GiGuXLHbRXZp9Yjq3vbc43VWuO/HTZOO3jqGc54=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZHppgl1B6VpFXCDY6KNjv4oz0XMlH8KhB53X4Y/WvH2UnnOxSz3gUw+RjugPs6FtT
	 CArW1k31CnTA3XjUj1/vzIsf7OAARdW6hA9f+GJRy0CaXTdJr5ExUwvXBIBXahrCTJ
	 HtoOKajYg2FU0nFm0ef6eCGC5dGCEG1nXrA35DrEARBMEG99QaY8h22cRAzkN3qK2D
	 oi9baMa5HktMuFBsesTC38XszQSOoj6RWfsC85C/2jSbR2lqlyGsk8EeeD/JV5LVzF
	 YIaXCGkl5Xc11l1jnkK41/1UCXUL7Mj9WmNdyUJ3AdodPbvTmNY694nfI6pPc+uDlr
	 TLSKrSV8VwXyQ==
Date: Tue, 28 Jan 2025 21:24:03 +0000
To: Daniel Sedlak <daniel@sedlak.dev>
From: Timothy Garwood <gtimothy-dev@protonmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC WIP v2] rust: add bitfield_options macro to create bitfield wrapper types
Message-ID: <pm2SERyezYBsg6ObyoVI8L-aNe4GrIxxp7gEfrBPnOhtx3JNnaQrUXsNTq8sh9lumoPjlI2qwZ2edpEgyV3JxbBqIU9JWHPmaUJT_MosuFs=@protonmail.com>
In-Reply-To: <79283554-ce12-4812-be1d-af8b420c1053@sedlak.dev>
References: <20250128-add-bitfield-options-macro-v2-1-d65349b389fc@protonmail.com> <79283554-ce12-4812-be1d-af8b420c1053@sedlak.dev>
Feedback-ID: 126901959:user:proton
X-Pm-Message-ID: 7857eb443fc4fa2a5c6350de758b14e37a924f1c
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> What I think is actually missing is an another patch integrating this or
> showing usage of this somewhere, for example in samples/drivers.

I did just that here: [1]
Link: https://lore.kernel.org/rust-for-linux/20250128-add-bitfield-options-=
macro-v2-1-d65349b389fc@protonmail.com [1]

Maybe I should have made a second patch in this series instead of a new=20
series but since this usage example depends on the HrTimer patch series I
thought it best to separate. I am new here though, so I may very well be=20
wrong about that.
[1] depended on this v2 so I could not reference it in the v2, I think. I
will reference it in the v3.


> Missing period at the end.
Will fix, thanks.

> Capitalization of the first word.

Will fix thanks.

> This might be opinionated, but it may be better to use positional
> parameters [1] as it is not that noisy to read in the source code.

I have no opinion on this, I'll make the change for readability.

> > +///```rust
> The rust is implicit.

I'll remove them all then.

Thank you Daniel,
Timothy


