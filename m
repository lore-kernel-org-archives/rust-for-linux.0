Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC09743635D
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785929997; cv=none; b=M3TbUezRzQp+k+3cwAMbJtbfYX5cG4Khf1EiRwYWeFVn4xOiMmu6HmfXTgUeOO+gkb6E5R6iFkTeGTDgDGBiuoUTGCpbuw3neLXH+NsQhGhuMuOExBFP4fcZdxlGd+Cys6+oN0j/6+h78CtkEgTHYtrF8B2w4riKOWYzknymqO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785929997; c=relaxed/simple;
	bh=VEFwcZ21xiic6MI8wgk5wBFk74YRmeV9r9SHe4CHv7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jkg7DKDR9kjOUO75zentwLRFP4UxcA44g/tCLvPurZBNGVMzEnN4IzJvWOFILnFVTjnjNt1sYn4AnWTbqaWoqZSA6JiR2qLPlZjnl04zH4WLLRZB6JPji21owuvZ8tbThnQccR/72f6jOrLMsVOIAdxlyOgA/9Z5xrogz2O/n7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cdT9lTnG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cdT9lTnG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570501F000E9;
	Wed,  5 Aug 2026 11:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785929994;
	bh=VEFwcZ21xiic6MI8wgk5wBFk74YRmeV9r9SHe4CHv7s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cdT9lTnGOUXT9XbSJj/sItzd6wGVPpRv0BYpCT/yghQl0a6t4fITiOqBfrcmfyOMX
	 O54mQR5NZ81tacNmrRfzjZXV8npdj7IaEcaVuvHA9oDeTHUSrB+0m0Ywkywbwc+WJm
	 ICmU0vUG4JUKYTQ1mEd9H5r2p7IlPGEj0Rb5ALImEvu7kPcjilOaewokWMNPPdSCJ9
	 KhIV2WeSJ6/SiU9+eWkjP2Wof09108i+Xj0c/5yNEW+aBu8++kXz3wBvFWn8+dhFMG
	 zciRDcLn42YyXsC+z40j0anoe7yUjv+3bhAgkV9QTH05amQsDKpCuOXqRRXWcD98TF
	 +fcG/QS8zQaWA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>, ojeda@kernel.org
Cc: acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH v1] rust: time: fix as_micros_ceil() rounding near i64::MAX
In-Reply-To: <20260723120907.209643-1-tomo@flapping.org>
References: <pnFuloASX9OPRE4rxnDZmJLS4_GaTn6IAT2OPZgNSvUK8JSWvobnoTZr6EifpDauCqMlUcmFmi6zeLTeBxsYsw==@protonmail.internalid>
 <20260723120907.209643-1-tomo@flapping.org>
Date: Wed, 05 Aug 2026 13:39:43 +0200
Message-ID: <87a4r094ow.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> The ceiling adjustment used saturating_add(NSEC_PER_USEC - 1) before
> dividing. Once the nanosecond value gets within NSEC_PER_USEC - 1 of
> i64::MAX the addition saturates to i64::MAX, which drops the ceiling
> bias and yields a result one microsecond too small.
>
> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

It took me a little while to understand this one. Perhaps a few comments
explaining the boundary conditions could be warranted here?

Best regards,
Andreas Hindborg

