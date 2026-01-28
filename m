Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C12215539A;
	Wed, 28 Jan 2026 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609779; cv=none; b=qRHE/ql7cIQUiL6pJajoXLKFPqlBz4Qjsy8xOlCvf4Og4quLS+N8pOiwv1ai4wmAaLBe+6rbojZDSPRaQaaeRe7ZHHNJW2YjIyVoXa0i/pm6K+ABEv3Wxu/00PKKmtrrW07Jh9d+fn6QtufZAq5oTOEy8bGSLX8jAk0mGWoVPxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609779; c=relaxed/simple;
	bh=hwRrSXg6/tAMhobrZXmus675azs8Wet/ERdAK1P5CWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DtKp5rI/Xmy4Sf/uG2sIwoNWTkQVaA+kj3C02p4NGNtwsd9uIczxR26tnJ5HO6yL37arBCOU0t2AXrkWpawYCmjwX6VIm9mzbnmsXgnYpuaY/loKDHb4U+UVS6YoKA9ZdaeBYFgiH0afZ9QK1U1CwG9q6LizCmpb0/RpnfqDZlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0wveM2J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0wveM2J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC0AC4CEF1;
	Wed, 28 Jan 2026 14:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769609778;
	bh=hwRrSXg6/tAMhobrZXmus675azs8Wet/ERdAK1P5CWE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n0wveM2J10SUez4AGK8o6DT166oAmyp5Op7C2flISFQUDd73I9+0buYMBrKA9TEe5
	 r6dBAuG0KTN9vXoZPMC5c2eLRFQ7SOWadNc4TnOzhv/Zh0kiRW73nyd6ldQiY8nMP+
	 ebmB93DT+PSno0zo9p8yHgsnAoZt2pGHA/qfFUdYYc80oDR7J0Wbj3BVYrrGsvn/uv
	 zvHqt0O5DbOJ8nzcqdz+FNmF3D/nSzZzgTE6xDCK4go5auotwb9dBu94RfnMae3k6T
	 iI062T6FNuOi6a3b1JOsIUMXA1DlRdpEOn/oLnobfTpFOm4yBYOwhYk/NxS8CV041B
	 B/1IB9cz82FPw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>,
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, =?utf-8?Q?B?=
 =?utf-8?Q?j=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: atomic: add fetch_sub
In-Reply-To: <aXoX5ixoQYs0cUU5@google.com>
References: <20260128-atomic-sub-v1-1-f8c6abcbb067@kernel.org>
 <Aov3lE9OEN6E4yOy9msTkiuujeOmTna28xag0imZcW9BVI9kX60dekWO_rwhuZpcnyG4BE8F77dh6ZFGuOq0pw==@protonmail.internalid>
 <aXoX5ixoQYs0cUU5@google.com>
Date: Wed, 28 Jan 2026 15:16:07 +0100
Message-ID: <87ms1xstzs.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Wed, Jan 28, 2026 at 01:47:11PM +0100, Andreas Hindborg wrote:
>> Add `Atomic::fetch_sub` with implementation and documentation in line with
>> existing `Atomic::fetch_add` implementation.
>>
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>
>> +    /// let x = Atomic::new(42);
>> +    ///
>> +    /// assert_eq!(42, x.load(Relaxed));
>> +    ///
>> +    /// assert_eq!(30, { x.fetch_sub(12, Acquire); x.load(Relaxed) });
>
> These asserts are a bit confusing to read. After all, the fetch_sub call
> also returns a value, so how about this?
>
> let x = Atomic::new(42);
> assert_eq!(42, x.load(Relaxed));
> assert_eq!(42, x.fetch_sub(12, Acquire));
> assert_eq!(30, x.load(Relaxed));

We can do that. I basically copied the docs from add. Should I change
those as well?


Best regards,
Andreas Hindborg



