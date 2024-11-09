Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DB5233D6B
	for <rust-for-linux@vger.kernel.org>; Sat,  9 Nov 2024 21:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731188035; cv=none; b=GKzNHxtpOJ7eXv7TEQ+duV/PLnmq9g4Ovic6wGyrAB/bC4Mer2aHJJ0d38zbyAyHOx0EGTv8vDsumtJmv/PxNc8ew3s+DXQXYsGvFCvQpT7Po4zkJAtXd5MXY9/NPlw1k/PDqUGZVJ5NaVXysYvMhd0GpHjpqgigSxGKLhgRt6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731188035; c=relaxed/simple;
	bh=MhYdiGHjHdNIQ4IxGy4vB4eJN52GoFj5CcS7/6Ew6rE=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ez7zbPRsWr067s+6RLt31J9VqkXA8x2WuGJUhhBim0ju0P3yaSTuHRBuQSNYRgQIh5MBiKx6A/9g1NQ+XQz66C00N3oYEGylOw7ocYERC4lQ/05d36qlv/HFUxwbIXqf9eDSrJ/hzwL7iS3Ipj7w7bm6eiKmhhqrKniVjaPM2xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io; spf=pass smtp.mailfrom=tuta.io; dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b=ClFF8J6+; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuta.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuta.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuta.io header.i=@tuta.io header.b="ClFF8J6+"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 92D22379B40B;
	Sat,  9 Nov 2024 22:33:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731188025;
	s=s1; d=tuta.io;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
	bh=MhYdiGHjHdNIQ4IxGy4vB4eJN52GoFj5CcS7/6Ew6rE=;
	b=ClFF8J6+wlpQMVrt1MNoyIXSSLcacg1hNc7D+tmWZjkIRnH/iatW4ik7Y+1xGeWK
	gv6MPWiEhjez01KUesSRU2fHOMAP5nIQbEM+b1Bp0LPvI3eM+vj8KFE69Q3dQ4FDUD5
	GpJoeEWTagXRWF5dbNqybvuGc/wGaY7OxzDcrOZdzWjbgthNfro+DvxABZjI9cMMe85
	yb1KZnINaRUXPZAGFc/KZdfc56m7d/VDGACUdHU1peixfii3/RbPoHIOc/PuPZ0tBQt
	5a4W5Lk7Y60FSDefv4bcaytGHxIGHSJ52kM7EYrMXkSZCc4YY0yem9uf686TcNEixy0
	5fAMCNUObw==
Date: Sat, 9 Nov 2024 22:33:45 +0100 (CET)
From: jens.korinth@tuta.io
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Rust For Linux <rust-for-linux@vger.kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@gmail.com>
Message-ID: <OBHnCkU--B-9@tuta.io>
In-Reply-To: <CANiq72kUAOX5girN+07e+R0OHuwJX_XRJCW0yQPpbBLmaP0wng@mail.gmail.com>
References: <20241109-pr_once_macros-v3-0-6beb24e0cac8@tuta.io> <20241109-pr_once_macros-v3-1-6beb24e0cac8@tuta.io> <CANiq72kUAOX5girN+07e+R0OHuwJX_XRJCW0yQPpbBLmaP0wng@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: print: Add do_once_lite macro
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> In addition, the intra-doc link does not really work in commit
> messages :) You probably want to either remove the link, or use an
> actual Link: tag, e.g.
>
> ...to replace `do_once_lite_if` [0] in...
> ...
> Link: https://... [0]
>
Yes, you're right, I also just noticed that the C macro is of course called
`DO_ONCE_LITE_IF`. Will fix this and the rustdoc issues in the next
revision.

> Since we will have `pr_warn_once!` for this, could we perhaps come up
> with another example? i.e. to avoid users thinking that they should
> use it this way.
>
> Also, you could use `assert*!` (possibly hidden, depending on what you
> want the user to see) since it doubles as a test.
>
There aren't many other uses of `DO_ONCE_LITE_IF` in the kernel, that's
why I kept it in `print.rs` and hidden. I didn't quite understand what you
meant with `assert*!` - can you give me an example?

>> +#[doc(hidden)]
>>
>
> Do we want it to be hidden? I guess this could be useful for other
> abstractions etc.
>
> In addition, if we unhide it, should we move it into its own file?
> Just like C has `once_lite.h` etc.
>
Good point, but I'd only do that if it has at least one other use from
somewhere else. I was considering to implement `WARN_*_ONCE`, the
C implementations also use `DO_ONCE_LITE_IF`? But as far as I can tellthere is no implementation of `WARN`, or `__WARN_printf` yet and that
won't be trivial.
Jens
