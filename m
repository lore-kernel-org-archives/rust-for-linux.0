Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF68A24E4A8;
	Mon, 17 Nov 2025 12:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382420; cv=none; b=eXzYlkRW1cxFMR4d+Xidx+Pia2cCw2ocMWR/U7Kz0l30rMiCNoVFvtDGkb11k5MrbuEGgHkoMGTK40F2lDpdmq//I4CJ30N7nYZUq2MzIXmIWD/BM6i1c0AzePRBKL/mJT5Labp4CkibJriFq5HYQ1gcK3uYRdhC2L8YlNd8ZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382420; c=relaxed/simple;
	bh=MeuoirIgmouE5Bx8TWNiLcmxISOXSOTBGcV1B7AkttM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tqZLkYq5oNNBMu3/5H6JzxZ8yMN1OEqCx06B+PMamBI/tOJmETRAebfV1J1/ZZag0g4+4LdEGm2b48fjnQ+ftonw/5BW6E7C8C6hqFZRTwwUFztfqRhPX7ru+uRkkBTvCeXuUhD9ejj113T+9zAQmmlPwqh2xkBNZOQDvuWD+vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=idmhD+Zb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="idmhD+Zb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374F8C4CEF1;
	Mon, 17 Nov 2025 12:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763382419;
	bh=MeuoirIgmouE5Bx8TWNiLcmxISOXSOTBGcV1B7AkttM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=idmhD+Zb7aKgwLQw5oXkCz9nutxwnZcyk6CCza4jeaB10wOt7GJETTsBPG3OHeV0a
	 WvaLpj82ZfgSOhLAeHDxlraw/PuPc9l7LsuGge+BOZdtk3gnE2K2SlQw8wivXWkjdQ
	 2dPpWVXi0Qt0ILsdpojTuKPeWaIRUy0ErPyShJhVt14/Mq05CmueLy+sWgUvYvjXjA
	 ewDlaO5oo3Ew7Bl7LT+S+2Y1nwag7abQ2vjSVmxjE+45nclpC7F4ihAFlJHRIRYOt2
	 blCKyUMDDEybQel4SgWcP6EYGOdXX1/nn7dQ891xfuGymVFQsDxRSHS2g2GM0eBmck
	 YXvGnNI6AIEMw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: fujita.tomonori@gmail.com, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 boqun.feng@gmail.com, frederic@kernel.org, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH] rust/time: Add Delta::from_nanos()
In-Reply-To: <20251117.203843.1397954301918831869.fujita.tomonori@gmail.com>
References: <s3el1v7RYQ-WQ5Kp3rzmGOYYtb6no2PNpOwP5VaxXPRWxotPbXLlRNW4qPIf1eKTuq9WmhhwGhnE5Mjf3OLa9Q==@protonmail.internalid>
 <20251117.103923.1643210589533849785.fujita.tomonori@gmail.com>
 <87h5us3o5y.fsf@t14s.mail-host-address-is-not-set>
 <KxIP8FOqETwUXHVlZjc28JT3XTXmQ070M9tZKQnbHon6-9jB2Pu8zn1NbnQLcc5bxyHJd8f-UTUzN6AeL9-h6g==@protonmail.internalid>
 <20251117.203843.1397954301918831869.fujita.tomonori@gmail.com>
Date: Mon, 17 Nov 2025 13:26:44 +0100
Message-ID: <87qztw26bf.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:

> On Mon, 17 Nov 2025 12:15:53 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>>> index 6ea98dfcd0278..2b096e5a61cda 100644
>>>> --- a/rust/kernel/time.rs
>>>> +++ b/rust/kernel/time.rs
>>>> @@ -363,6 +363,12 @@ impl Delta {
>>>>      /// A span of time equal to zero.
>>>>      pub const ZERO: Self = Self { nanos: 0 };
>>>>
>>>> +    /// Create a new [`Delta`] from a number of nanoseconds.
>>>> +    #[inline]
>>>> +    pub const fn from_nanos(nanos: i64) -> Self {
>>>> +        Self { nanos }
>>>> +    }
>>>> +
>>>>      /// Create a new [`Delta`] from a number of microseconds.
>>>>      ///
>>>>      /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
>>>
>>> For consistency with the other methods, perhaps we should also mention
>>> the valid nanos range in the comment?
>>
>> But, please make it a constant instead of an integer literal.
>
> Do you mean making the comment of Delta's from_* methods like the
> following?
>
> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
> index 6ea98dfcd027..822746e552fb 100644
> --- a/rust/kernel/time.rs
> +++ b/rust/kernel/time.rs
> @@ -363,9 +363,14 @@ impl Delta {
>      /// A span of time equal to zero.
>      pub const ZERO: Self = Self { nanos: 0 };
>
> +    /// The minimum number of microseconds that can be represented by a [`Delta`].
> +    pub const MIN_MICROS: i64 = -9_223_372_036_854_775;
> +    /// The maximum number of microseconds that can be represented by a [`Delta`].
> +    pub const MAX_MICROS: i64 = 9_223_372_036_854_775;
> +
>      /// Create a new [`Delta`] from a number of microseconds.
>      ///
> -    /// The `micros` can range from -9_223_372_036_854_775 to 9_223_372_036_854_775.
> +    /// The `micros` can range from [`Delta::MIN_MICROS`] to [`Delta::MAX_MICROS`].
>      /// If `micros` is outside this range, `i64::MIN` is used for negative values,
>      /// and `i64::MAX` is used for positive values due to saturation.
>      #[inline]

Yes, I would prefer that. The numbers become much more useful like this.


Best regards,
Andreas Hindborg


