Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7489E3590BF
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768820690; cv=none; b=NgbPHGaWEVLA/irXCBiD6Wsrl3znF45F0CERjRQu6qMuplKkAymR2PDUrnTodn3GwCVvTy0CqLEGWlP2nbohGqn/HB959qg65ws9nlaegt+rzw/EZnAG8v++cZK6D7QBP63wLF56wVVv2WUAubF1MloyPWBGmlXVXxW70tFoAXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768820690; c=relaxed/simple;
	bh=x3I73T+Kz31B0gAm1Z30TGcE3YkDX36QPo2/G6Dv35Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iIu5qFN7MWoBjCipXej7DXh40PrOJ/XO9sGUnzWsY1qzUcze7w4lmbOL/CGcM5bi/zzqAiq2uToYOWBN1i0oZEObgeUSpXDtRUpOIO+CBP+s31QGjANiXKBE21//r1LCd8wTOPDgdnXgPW39RyJTZn/PlA7GGBViCYpS5kaHy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEVDnZS8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEVDnZS8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD27C19422;
	Mon, 19 Jan 2026 11:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768820690;
	bh=x3I73T+Kz31B0gAm1Z30TGcE3YkDX36QPo2/G6Dv35Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YEVDnZS8IwtGe1X2f3mKbLdyVRp3pQJyJETUjMWHJUkgRJSFu/hfglqT86BV+dMxg
	 TMQubClFJONWk4Wr1gsMHD2NNDA3ZNxci/k/Xhff3u4fnIFMSvz4a99Vlpts7pOPCw
	 w60je7IrbJJq1f7spaV6E5wOQbSoDP6R7TRb3bRQ9Yvj3gIZG0qJtNNYYEaXJJtygY
	 4xfGbGVngfidUXI8fT04WxSmZpz0bIOSlNjs3VoQi7ZEpYOLZR3mb9Y7B2Wenm3N6j
	 5mA4LyjIXQb8tDeQfzbriJ76coXZ20CMmxjPKgQKPBDXH9MiGk+mTceERs7uAtnQgv
	 /Bqmt1BmInk0A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Ke Sun <sunke@kylinos.cn>, rust-for-linux@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Ke Sun <sunke@kylinos.cn>
Subject: Re: [PATCH v1 2/7] rust: block: mq: use pin_init::zeroed() for
 queue_limits
In-Reply-To: <20260119065859.1914178-3-sunke@kylinos.cn>
References: <20260119065859.1914178-1-sunke@kylinos.cn>
 <Z55sb2ThC6nBqfAaJu3YNGj3bYMrT9XHy63LEXLGqzPUsAFp-dS0O_usawylT8GR8QrXk8BazrYsOGXe1ax6qw==@protonmail.internalid>
 <20260119065859.1914178-3-sunke@kylinos.cn>
Date: Mon, 19 Jan 2026 12:03:57 +0100
Message-ID: <87jyxdq2xu.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Ke Sun" <sunke@kylinos.cn> writes:

> Replace unsafe core::mem::zeroed() with pin_init::zeroed() for
> queue_limits initialization.
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> ---
>  rust/kernel/block/mq/gen_disk.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
> index 1ce815c8cdab0..4620a86a88dd8 100644
> --- a/rust/kernel/block/mq/gen_disk.rs
> +++ b/rust/kernel/block/mq/gen_disk.rs
> @@ -107,8 +107,8 @@ pub fn build<T: Operations>(
>              drop(unsafe { T::QueueData::from_foreign(data) });
>          });
>
> -        // SAFETY: `bindings::queue_limits` contain only fields that are valid when zeroed.
> -        let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
> +        // `bindings::queue_limits` contain only fields that are valid when zeroed.
> +        let mut lim: bindings::queue_limits = pin_init::zeroed();

I think we can just drop the comment now that this operation is safe.


Best regards,
Andreas Hindborg


