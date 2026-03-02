Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C173FB07B;
	Mon,  2 Mar 2026 14:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460684; cv=none; b=NxS7JEL0nxZkL2zHu8Zaw6yZl4dA9at2WF1ZH4MFDwkZ064pF24i6w3vlQecZEvJ+2Jj4J8diLwxBkWy0Gve/z8QLXWhEDtazPmRsJZWFvbDI2XU1MGZGT5tlVMGtOJrd5lspxHYu4GZ4sspbpLqX8QMRBv2BS/JFhixv82JY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460684; c=relaxed/simple;
	bh=uorX8mEk1frhC96c0XI3cc0859K1MdXiy3AiSnA5334=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=tOXL4YArTCxxTRDWUenkAr+VdgVofk63v2s2dcjrtysZ6uMhgUPhIneizgdK8/Nm/UKLV+ItwCZ9YNz5v2Q25B6Qmb/0Y3fA2tPYn07ew2W2R2dIuPoSqD9vZo8Uh7Kbgc97XWD4NAP8zTr46M9rkajgsH7h/D0B0/orFYgHF9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6i9LKUL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6i9LKUL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C30C19423;
	Mon,  2 Mar 2026 14:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772460683;
	bh=uorX8mEk1frhC96c0XI3cc0859K1MdXiy3AiSnA5334=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=e6i9LKULQbtEveZ9010+YINgvE2Z4xzhx0GCUNvQ8YLO1klJSlsAvYVwjfZS7wft2
	 DZWOoERcPrykyG3cIHxRKK7JxBUd6sIm/3f1XnFXnn0ukKu19AJTgeniwkH2XgdHrt
	 QgZMurmCMBf2sIzQ3xkw/1Z91uJnDCVqh4A6DpLmVapBlb5sbt+AGZdi58OLDzZ+XK
	 pj9hXXqnLMigvG+PHU8g/neWOelQF31qnguVxPgXEgZ7gpykKtvGFX5VTi6l448G/R
	 3XIoQFOhNoy+duns5CmbrfjONgBk8S0mqOptIopNpBFTQOghhuYAHaTtCbmM8I2og+
	 pjyaBpq69oebg==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 15:11:19 +0100
Message-Id: <DGSCVEZTZG4C.1IO3JGXYEHW7@kernel.org>
Cc: "Gary Guo" <gary@garyguo.net>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <asahi@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: pin-init: internal: init: remove
 `#[disable_initialized_field_access]`
From: "Benno Lossin" <lossin@kernel.org>
To: "Janne Grunau" <j@jannau.net>
X-Mailer: aerc 0.21.0
References: <20260228113713.1402110-1-lossin@kernel.org>
 <20260301171222.GA22561@robin.jannau.net>
In-Reply-To: <20260301171222.GA22561@robin.jannau.net>

On Sun Mar 1, 2026 at 6:12 PM CET, Janne Grunau wrote:
> On Sat, Feb 28, 2026 at 12:37:04PM +0100, Benno Lossin wrote:
>> @asahi folks, let me know if I should prioritize a solution for packed
>> structs. Otherwise I'd like not support it at the moment, as that
>> requires some deeper changes to the internals of pin-init. I'm tracking
>> the status of packed structs in:
>
> I have worked around this in the downstream AOP audio driver now. I did
> not do that initially since it looked more involved and we were planning
> to bring support back.
> These structs describe messages for communication with a coprocessor via
> shared memory. They are derived by observing messages by tracing. So
> there is only limited understanding how the messages are formated. Their
> layout has for obvious reason match exactly so `#[repr(C, packed)]` is
> the obvious choice.
> One of the structs had a size of N * 4 - 1 which results in a alignment
> of 1. Fortunately the struct could be padded to multiple of 4.
> Nevertheless it was required to replace a few u32 with an unaligned
> version.
>
> I'm not sure if there is a need to support unaligned fields in pin-init.
> The workarounds in the asahi GPU and AOP audio drivers are acceptable
> and could stay indefinitely.

Thanks for the quick work! Yeah that sounds like a good solution for the
problem. Adding unaligned pointer support to initialization is quite a
pain. If it comes up we can still do it of course (but I'd only do it if
we can't find a workaround).

Cheers,
Benno
