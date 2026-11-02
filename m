Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793631371;
	b=CNU58P8EML5TTtP6XQOplO8WxwTIp0SaaoUoNyUPz2YiHaa9kCDmqJ58lih+x2Wi8SXH
	 IUU+OTNRq0V/JnQ77F2B29NjCTk5bmjND0NnP/NG267O3wLSAc6Ri+wMKzVc1ALVnNQAA
	 W2UvFi/4V/6pfgWtUL+JBVbQckallJDy1OjfFhoOQNloxpQfAfEf6APR912Xh4Mvnc4GN
	 GtGgonXzWpssEwL85YpbK56G/y/aCdRFM9ZrJl/KGZHG/vh+DndNRP0MA5yxOiBFbJA0F
	 XIf1VUJ/pgot84+cN2RtB5xGOFHhbGwaJ0iDodDIyweXwpoZd1b0kFvLdTj5LgJMQcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793631371;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=2IPIWy9I0vE5GPIf6uEQ6zgCm4Zsx0kemN0YKTf10KQ=;
	b=BkYoUsMLDQqdtrZ+/6whjTvMAxzHiK2+aeKwU2u3fpmQxnt8wrG0jn7pVwuNXWQFArIj
	 fwqPlg2T7rEJca1upVU2OqiK3gNwds2j9OnZ6Wpqp4AMhzUoWGncId7AtZpgRc4HGr8Wy
	 guWa9Hkhui74VWlWZQtcZjig5vyfpOHw2AnxIljuW9w7FVc4qCsGwqved1m9To0mgut2/
	 buvTrdLSDFZODCllqrds+i6rtfZTb8ak8cXuDrmMyht4ROGNGkq3lajhnccm/hO0lZ7U5
	 73LAWk/5VzP6Q2Fm8fMmdDEj6gfxqSdkLAUPWBl0mm5so5GWr5uJvAA8Y1b6SkeHq2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WkkfdZkk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D4D606F202;
	Mon,  2 Nov 2026 14:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WkkfdZkk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 146F81F00A1B;
	Mon,  2 Nov 2026 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793631370;
	bh=2IPIWy9I0vE5GPIf6uEQ6zgCm4Zsx0kemN0YKTf10KQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=WkkfdZkk3ycEZtywnaAxgCUSUINaQjeD4FESHEWQWXkC/WLecVrYdTxKSAOAPvbtZ
	 18gY2haAOYjKaUJUxfIPohrEScMhtBUIvVhjN/wbXC6ETxrz5GeS47pcGH4yP3ot6j
	 a1T1PP7anHvnSSNaeNOgvWVB8//a+lHeu8xrIJJwHQgp5Yh8ZZdwwIMSSNLoX0/ITo
	 JqsGqALUshs8LTqifGY4mML9Ab31FAmrABCFtE3DcxVQ2mfhv9vOfSsycDB5njHuEF
	 MUxYDIEEK377cfih212PnHCXFI3jI66HwC5Er1+m6KKgaQFie3WqvVt334EOMAhyuC
	 cpk+U+Nl2G44A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: chenhan <chenhan0017.work@gmail.com>, rust-for-linux@vger.kernel.org
Cc: boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 miguel.ojeda.sandonis@gmail.com, tomo@flapping.org,
 georgeandrout13@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] rust: math: add signed division and remainder
 helpers
In-Reply-To: <20261031103206.24051-4-chenhan0017.work@gmail.com>
References: <20261031103206.24051-1-chenhan0017.work@gmail.com>
 <Y-EqypVezoFd-BnUk0jjd5h1QB2s3MHhUfStybSc81ZfRbE8QI2hlTs3WhFYHTROrzxPaImTNHvhm-3_3H2_tQ==@protonmail.internalid>
 <20261031103206.24051-4-chenhan0017.work@gmail.com>
Date: Mon, 02 Nov 2026 15:55:47 +0100
Message-ID: <87jymvmgek.fsf@t14s.mail-host-address-is-not-set>
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

"chenhan" <chenhan0017.work@gmail.com> writes:

> Delta's division and remainder implementations operate on integers and
> do not depend on time units. Move them into a math module to provide a
> common home for arithmetic helpers, with Delta as the initial user.
>
> Expose div64_s64() for an i64 dividend and divisor, and div_s64_rem()
> for an i64 dividend and an i32 divisor. The latter returns an i64 quotient
> and an i32 remainder, matching the results of the C helper without
> exposing its output pointer. Delta's rem_nanos() uses the remainder and
> converts it to i64. Both helpers retain Rust's signed operator semantics
> and unconditional panic checks, using the existing C helpers on 32-bit.
>
> Keep the Delta API and its panic conditions unchanged. Document the
> quotient and remainder semantics and link to the corresponding C header.
> This is separate from the preceding behavior fix so that introducing
> the math module is not required for a backport.
>
> Assisted-by: LLM
> Signed-off-by: chenhan <chenhan0017.work@gmail.com>

Please add a doctest with a few asserts that demonstrate the use.

Best regards,
Andreas Hindborg


