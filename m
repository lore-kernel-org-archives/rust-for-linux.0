Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834494;
	b=RWzvHwG31QI7FuqRaX+9ANLDNhV3TBx1PAnwab6S45bsXpTDE7EBnDkb2oo86ZyNTl7J
	 D0Zc91cRYOUa3chMqiuGMycO1ysEPxQ/n7yASadcdRlaGxFTGRcNY5FT2wUcSmiW5UnDJ
	 PQnwTkOIehU830R7CXCaiVoDr7Jp+Bw7sMsVpr4VFTYN8X3d1Hz3LYeEIHoQM5hKMUCJp
	 mP9XTu0nlLHRmyUYbVl+baac6XUk0clJcDLljEYp1y8db1N/WzKZUQCd69SH1E3NtrYnV
	 r75wveNdjhtX8OnpWMVvvgHPAC909816/PVRtkVf0C5AwjVomrzFLLOwKKWuKS0AzDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834494;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=xr45Si1w2z26ucYgqlSqod6jX+jkOnM8jau00dSIMXY=;
	b=RA0CPO9TupXFTdMCL1RGLmSNcQ+jzvW0SKvMVQTHrv50ANKMqWakfoo0i5CrjK3mRJIj
	 wmXwNrlk/Gi11k/LVAChsGvhXig5CHWDn+U4gKH3o2RDb8qGaRfXz1kh9bvspo14t3NPh
	 BSffwAaR/e201uc2GzF3hIrb/kRi63z4aRHge24hyLvn1RA8Jht6bNBd1yrzYviqEfZVK
	 xnb9SaNY2N+2zqT+kA6I8q0ZhJya4tYqH6K4IjhK7jnuQ1DZ2lDikoFeBY/nWKpuU+ohk
	 oMkSIRtpef3W+qwn+ZgZ5S/a78SOnfUjIn8L+p+ldry7akLIeKhmRp+itUwGEdNrBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cAI/9JE0";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E12606A330;
	Mon, 16 Nov 2026 13:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cAI/9JE0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C0A1F000C6;
	Mon, 16 Nov 2026 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794834493;
	bh=xr45Si1w2z26ucYgqlSqod6jX+jkOnM8jau00dSIMXY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=cAI/9JE0ptmfJbSazcO1yDaZvdTITxM7bA0C0WfvQkQUCHd4Elzp3Tj4OgK6fy+dp
	 3Br8t2kTQwMKxB/VN9E1SPPe0Rh3F3x0VQwUCQRXDzigjjyQd1HK5uMwhWx2h3XNIa
	 8LAn+WzXsM782pS7+xxMRmT594UPSvAUFddUq+Iy8MH5hinGx6L0P8gr7a22ApkbVf
	 sCVof9YC5rjwp7kUnQeIV8uHKIjS/usUY6NtNFnyVRb2Kq16PgrmZh/v6m5w+UyqMb
	 LorfZ5OFZ8A1AXGjAYCE2nyJDxOKHvzQfWAQKzj02fG5vvd/v/xR1RJT4SpDktgyi9
	 XVH1U726Iy/yA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: peder.bergan@gmail.com, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau
 Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: check the length precondition in
 Vec::from_raw_parts
In-Reply-To: <20261116-vec-raw-parts-precondition-v1-1-8f633f66b4c1@gmail.com>
References: <Cr09eVvg5FecTvFRQ6ONjPHaWg--YJB_fcboFARKLEbwSllbd6wep9zKRdKcsOhp244ll6uaoT7qGtNK7FJgbw==@protonmail.internalid>
 <20261116-vec-raw-parts-precondition-v1-1-8f633f66b4c1@gmail.com>
Date: Mon, 16 Nov 2026 14:07:58 +0100
Message-ID: <87o6bovs9d.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Peder Bergan via B4 Relay" <devnull+peder.bergan.gmail.com@kernel.org>
writes:

> From: Peder Bergan <peder.bergan@gmail.com>
>
> Vec::from_raw_parts() requires length to be no greater than capacity for
> nonzero-sized elements. Check this precondition with
> unsafe_precondition_assert!() before constructing the vector so debug
> builds diagnose invalid raw parts at this boundary.
>
> Keep the check in the nonzero-sized branch because zero-sized vectors
> ignore the capacity argument. Add a KUnit test for reconstructing a
> nonempty zero-sized vector with a zero capacity argument.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1232
> Signed-off-by: Peder Bergan <peder.bergan@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg

