Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108773859CB;
	Fri, 27 Feb 2026 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219771; cv=none; b=QdtI9etnsmqqd+V6ErqaI67bZk1DMT2fOAk7Vkgp6TIj2dRwuWuSQoIVZ/jkfMJ2r2JC86vqwNgOOIWWuCLp+b8D9k5ES9I769YQYd4TFrxegEo6fGMADaT9z7aAX1Jyo9pdvP9Dt3g4KwTFy9UgRpUfMMAIKamPc3NRr/qTBzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219771; c=relaxed/simple;
	bh=8ObBO2tTOuu4dLA9Bp9aj3CteXPjUSK9TzFrrnn3sZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a4HOMQBNbCfJYKaedTq4On3NPOydxDz4Otr/1UdEdtmRAKMTxLPL7H76n6z8XqkN0E/Zo1pSQpmBeayVyKEv5n6WXslltHqrptQdnUcWaRNrqCM/NxfsV31+yFvqXTBYmpDx+7MjfYGM7GwE3A6cw5hh4BI1bBEYakdICfr9slc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FByQZsNc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FByQZsNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79390C116C6;
	Fri, 27 Feb 2026 19:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772219770;
	bh=8ObBO2tTOuu4dLA9Bp9aj3CteXPjUSK9TzFrrnn3sZ4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FByQZsNc735MF8ZlWN32cZ5m4wETpMZh2b+nvePGn24qY5SZyjUSzanMbY94Oh26h
	 ugMF3CLDdB/K1a+mDSFbc/5fqw0MkqdsLNIMET5X/Sr1B32ZL7EdG+iuFXJoz+7MkU
	 fPfTKaEa90QYrTug5adlrhX6cZbj1j9MODxjRXr+55D8ON08H2xYsyHkHERTfny5f/
	 lv4+QIxJxijgXPgsQYIYSabpvggIW76TsvzUe0wy6PMzRyo4H6ZxqEve3GT0SKzr1e
	 36ItVWjM0B4sc65IA+oeJhlIVgZH98hG8kuQJcEBgRobfgMG6x7ed0nesp4oJWCXhc
	 fTSmkQ/dMxeSg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: sync: add lazy initialization methods to SetOnce
In-Reply-To: <DGPTYBO26YBT.3S14I9F5YT1PW@garyguo.net>
References: <20260215-set-once-lazy-v1-1-6f5bd2efda11@kernel.org>
 <NEEh9XY18Nk7vKZB-Vz24V-2y3HYettAoZbomSB_Ml5KPx7kzR7hsLBSfRZbDRVM7XM3rowqFh0X0IIeuesa4Q==@protonmail.internalid>
 <DGPTYBO26YBT.3S14I9F5YT1PW@garyguo.net>
Date: Fri, 27 Feb 2026 20:15:59 +0100
Message-ID: <87o6laatg0.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Sun Feb 15, 2026 at 8:27 PM GMT, Andreas Hindborg wrote:
>> Add methods to get a reference to the contained value or populate the
>> SetOnce if empty. The new `as_ref_or_populate` method accepts a value
>> directly, while `as_ref_or_populate_with` accepts a fallible closure,
>> allowing for lazy initialization that may fail. Both methods spin-wait
>> if another thread is concurrently initializing the container.
>>
>> Also add `populate_with` which takes a fallible closure and serves as
>> the implementation basis for the other populate methods.
>
> Hi Andreas, in an earlier call I mentioned that I'm working on getting SetOnce
> to work with pin-init, the capability of which I think is a superset of you have
> here.
>
> The API I have is
>
> impl<T> SetOnce<T> {
>     pub fn init<E>(&self, init: impl Init<T, E>) -> Result<&T, InitError<E>>;
>     pub fn pin_init<E>(self, Pin<&Self>, init: impl PinInit<T, E>) -> Result<&T, InitError<E>>;
> }
>
> To achieve what you need with a function, you can simply write:
>
>     set_once.init(pin_init::init_scope(your_fn))
>
> The patch that implement the API is here:
> https://github.com/nbdd0121/linux/commit/4aabdbcf20b11626c253f203745b1d55c37ab2ee
> in tree
> https://github.com/nbdd0121/linux/tree/lazy_revocable_nova_wip/
>
> which I haven't submitted to the list as the user side of this API isn't ready.

I probably evicted that from cache.

It looks like that could replace the `populate` in my patch? We would
still need the synchronization in `as_ref_or_populate`, right? (or
`as_ref_or_init` if you will)


Best regards,
Andreas Hindborg


