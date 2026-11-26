Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699912;
	b=U9VI8/n47nEuyO09ZlKczboASjudyGqvEMkgEocq31vmYdv+EXQSG8gcmbXkFqxGvYY/
	 4o7BwLkUtd9ydYjICzp4Z+KI1ewXHoze1C32jmCX0eJwe1LLLIBtZFwvnrB/wPTxHhNvg
	 91ZS5ElYYZvuapUBH086oycY3Up/DRX2BKIg1E6P9ahowgTIa9nVkcAJ1veVd5VqptoXV
	 Z7xiClP7AhyOEsgSDNQ8rn5O5dtLrUPSGDXFhpCD7sHsbUzRbzKc1HpiH2CiaQEUDShdo
	 NUZryJFiPQkViCTPa8kUeCbQs4flkdbaEYP2/o8dPF2lMWoAuhJMfqkh541XHbv2jHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699912;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=3mGnAomhQ+L6zciHSyNf8bakRWUymFMpnjOMRSLguYg=;
	b=A+0828tgYBCleF3WFLwlt1YalL1p9tt+NqfqfhdyCGL+0bhhvWFIGtd76qEkrgTy0c7j
	 kbEu+gsJhmcE02dcpaOaoeyv38Q8Hny1gI781NIX1r6o7c3irmf3+7WdJizsufvK0ralm
	 s4rWtelN9rChW8B5yiuXn82ZyIGR+TtthE3oGzSt0Q654Z6d8PHkikKjjvV2TY7s1fuk5
	 t/4ydOLNwfCdloL1AMZg1jhnBI0zK7ZBz3/dV7ULFVozvXLVVQIZ9iMBWpKUiKDogPn8y
	 bP3j/Cy2SOfM5amBSPQezOcusD8wfLcKV3LWjHSKE63FyWYuwy3rqNhJerA52E8ZY9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+z2psRC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7782606A31C;
	Thu, 26 Nov 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c+z2psRC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06ACC1F000D3;
	Thu, 26 Nov 2026 13:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795699912;
	bh=3mGnAomhQ+L6zciHSyNf8bakRWUymFMpnjOMRSLguYg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=c+z2psRCoBKm9SEcVPumlE5/94/Yps1kS1NBhstYThQ+/yug6XbNHYvl2TEkqj8b9
	 1tRB/EEwYX8S3XCcHSofQmTYN+yT3q09LfHOpKPP5F1GE2gC+VtZNff+Ee/tqQhZSu
	 Ka2OJHXkF0D9oNmIbAS2/TPc/+/Z2O18KkMYSzuW4wIPiChgFcURHWRM4FtpQjpY/v
	 g99GOOLwJLZFzTv3fACu1Zb+JQsb8NAS58gSxCt9cIsxZjYfZjRWJRCskWOCwiULzm
	 OSdSj6ETIzNYsm8ADsXjVqFzfWqo7LM6zDY6Z8vSJECGRYw3x8upx/MP5oNcXzYoSR
	 mMYb4eNWFYFDA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz
 <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor Gross
 <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, Tamir
 Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: time: implement `Debug` for `Delta`
In-Reply-To: <20261126125937.3973192-1-aliceryhl@google.com>
References: <20261126-time-delta-display-v3-1-aeeecc72f3a8@kernel.org>
 <20261126125937.3973192-1-aliceryhl@google.com>
Date: Thu, 26 Nov 2026 14:31:41 +0100
Message-ID: <87ld6fu3b6.fsf@t14s.mail-host-address-is-not-set>
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

Alice Ryhl <aliceryhl@google.com> writes:

> On Thu, Nov 26, 2026 at 11:51:14AM +0100, Andreas Hindborg wrote:
>> Implement the `Debug` trait for `Delta` so that a span of time can be
>> printed by a formatter.
>> 
>> The span is printed as a count of the time unit it is stored in, suffixed
>> with that unit, and with each group of three digits separated by an
>> underscore the way Rust integer literals are written. A span of 12345
>> nanoseconds is printed as `12_345 ns`.
>> 
>> `Debug` is implemented rather than `Display`, because `Delta` has no single
>> obvious format and the other kernel types that carry a unit, `Hertz`,
>> `MicroVolt` and `MicroWatt`, implement `Debug` only. Callers that need a
>> specific format should use `Delta::as_nanos` and print the result
>> themselves.
>
> Thanks for addressing the earlier feedback! Aside from the 32-bit division
> issue that Tomonori already pointed out, this looks good to me.
>
>> +    #[inline]
>> +    fn repr_to_i64(repr: Self::Repr) -> i64 {
>> +        // CAST: `isize` is 32 or 64 bits wide on the architectures the kernel
>> +        // supports, so widening to `i64` preserves the value.
>> +        repr as i64
>> +    }
>
> Maybe we could add `impl FromSafeCast<isize> for i64` to
> `kernel::num::casts` and use `i64::from_safe_cast(repr)` here?

I can try to add that.

>
>> +        let mut groups = [0u64; 7];
>
> Minor nit: since each group is `< 1000`, this could be `[0u16; 7]` instead
> of `[0u64; 7]`.

I chose the u64 so I would not have to narrow from 64 to 16. I valued
the cleaner code over the wasted bits.

Best regards,
Andreas Hindborg


