Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BCCF33F377
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 10:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786358887; cv=none; b=IcuyWU6q9SF48S1O2M2x5r7BShkH7XNO3tWPZEewN5XtXO6K3HFTejMg9mnGsBN708157Z3yCoBnuy3cxiNi8zPVqG5V9+wtua05PUrn93+Qk3EmzLlrDqOrap/O6ep00ImNjpx3APwlPT2XuZ7klhHHEmUApUJkPNEyKseIgNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786358887; c=relaxed/simple;
	bh=k/LH7iZ1vCxbAiUCSrhjnXTCyhqepbdp7rCcY6/BHbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gVkpTbLJBjnXa46Qf0fRkYAacwt1xy0L5b1xdRXRRnPXzEoz+jyLBvhU4UjAP+POMsqj3vqxJbIVTNI1dOVUKHufkpuM3SWr1kw+rOeTVXtWjC1PshfWqAbM14OtG+jTO979Y66b7WLLFVpzOn7PAaBpuLQgmV0zrUSMmziQ094=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0oLG9aD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0oLG9aD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BD21F000E9;
	Mon, 10 Aug 2026 10:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786358885;
	bh=k/LH7iZ1vCxbAiUCSrhjnXTCyhqepbdp7rCcY6/BHbc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=k0oLG9aDTCIb5iJORGWJCLVM2sYn6EeRKd7jnR6lEkoTMQAwW3668Jaj6rWeL5w4u
	 aWjDOGCANYn1mojUnEJ8rFpgdlT25VJYQs+kFt4cBceex2T9UpnqpuIglf0b9qCIH9
	 1XmbEvgNWJWqjzMVJ2XH+n7Kp2D62xrdfasojQTSFDo6GnMv/8rE3rZ8y6Ukg7Hbfr
	 cidywugh/zctI/VsBnlwY30sUhxyfM1zt0WYX1j3wIvmm/960EN3Q0BpXXMu4qTpRC
	 856yyBQrEWrC9xoSAY7nxu1ALDPLLIXrJC5Mnqgfqn9CLdArs02di7uaBFAPdW+HNV
	 6eDKwK5bIpDAQ==
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
Subject: Re: [PATCH v2] rust: time: fix as_micros_ceil() rounding near i64::MAX
In-Reply-To: <20260807130531.1056209-1-tomo@flapping.org>
References: <ljD6_kVHL_o6cG-Ct2gESNL_yHHcjtbcyKO7YrLDsgx0aPesopKonQsTjbbzWn-ZC-iVgOQ9Ig1jepifNTfFmA==@protonmail.internalid>
 <20260807130531.1056209-1-tomo@flapping.org>
Date: Mon, 10 Aug 2026 12:47:51 +0200
Message-ID: <87pkzq2qw8.fsf@kernel.org>
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
> bias and can yield a result one microsecond too small.
>
> Fixes: fae0cdc12340 ("rust: time: Introduce Delta type")
> Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Closes: https://lore.kernel.org/rust-for-linux/CANiq72mtS0ABA2JnT5tpz6J9c_mnxY+vyPvghV_ukngWvN8F2w@mail.gmail.com/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>


Acked-by: Andreas Hindborg <a.hindborg@kernel.org>

@Miguel, can you take this one through rust or rust-fixes?


Best regards,
Andreas Hindborg



