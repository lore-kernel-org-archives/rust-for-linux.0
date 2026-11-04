Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786881;
	b=tAHaKOGnAZTzXkH+C9jaTR90uqQa2yK6VM5+LpXu2ZV+qryXn0nMJxCx/OlaA4UL817e
	 tifjsWwyF+YcEH7vJSl1zA3AzKsxdjacz7LgUA83klhCvIgI8b3Uyfvjq+p8F1043C3dk
	 +krBQMr4Qng0Ojsvz+kl2ALyQnf6x5bhb8Djl2LLv1GvcAzUY3kLzZCV1dwyZiDsjhl7r
	 UiTmXAM7wkyb1cIUnMQv7Y/NwIFRzHHrdzthtz5qJmFJTh7ltp7s/45tcGf1OaPmR2ODl
	 HyX3mExKLog4vp8AZyVx35fyrh6x8hOf2iQic1ItSTuQhIQu73v8eHettDFRMj5ivug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786881;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=C9DMJq3tsJ77ZIPXzbDKxng8P9QsY+nOHhg6+nnSuz0=;
	b=UcQ+zcXGn+7dXC+FxRZmNjZpGNpxKkTJ1Hpraspbfyuqv1dSo/Yvgpu7LqKUFJy77d7X
	 +CNMxzQ3hEGBM4cBid2feK82IVi8hD2fbx3Ggat0feEp2tZIf81oLbyT8MJ5LWIrhNGvz
	 +g8XTL0JV70RIDIDwIuEvA9S3dwgzDH8Nvc9c8tjOhBJd7RT2RiPnWMdyPS5SV1g+54Sj
	 +nNoOJ0RUUPuYTvPpISyylXJ6frmOdqjLBbmEqSQNmztzGLcySPCm1Mt/6wfb4QSOdgIC
	 YHq9jPOCUPevjMORnqfvgqNzKG0Ot2Nd3RKdU+/s7TMvqsln4LVZh3Gdj/Z9cV0X9tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ch6WkKbV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BD7606D811;
	Wed,  4 Nov 2026 10:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ch6WkKbV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 452481F00A21;
	Wed,  4 Nov 2026 10:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793786880;
	bh=C9DMJq3tsJ77ZIPXzbDKxng8P9QsY+nOHhg6+nnSuz0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Ch6WkKbVRCCjH3ShQvSYF9kq1AyXkGgzzBJhWpSynSDAt0WzAOtPZ+JyfE/P9pOQt
	 4CBEHb+XoJuBWTqbNty/MnRgELnX/reEIcm+QIWVDARVtr/2Zd1uUxnOYjyHC+r4fK
	 zR2epze+PrxECMysHt755SvHJBggj2PP0QKtyoi4UzMeY//EDQXKlS4q4cxx5NJQNq
	 c74otbUlopf+BaoRorPFSk/tAmmtUA/wI+1MoAbPcyLhYYNZ2gnNIFAffthrngET8I
	 Fjy1yg7zj4Ds960pFwm+oQMAXFV4o0H/AefRoN6evgVzTF7gFKRKlD44+pu980UbAA
	 wHtuhvSpMvDTQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: time: implement `Display` for `Delta`
In-Reply-To: <20261104.180854.547774168466136920.tomo@flapping.org>
References: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
 <I_BPRv0XwpoRCf2AG4Ot12JnHyqvdM9lb_wF0sZMixc0UIoaBb-aeNWYuff1oe4_X1m5SpCTcZp9woOg-dt9Eg==@protonmail.internalid>
 <20261104.180854.547774168466136920.tomo@flapping.org>
Date: Wed, 04 Nov 2026 11:07:42 +0100
Message-ID: <8733tgnc41.fsf@t14s.mail-host-address-is-not-set>
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

"FUJITA Tomonori" <tomo@flapping.org> writes:

> On Tue, 03 Nov 2026 16:23:40 +0100
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> Implement the `Display` trait for `Delta` so that it can be displayed by a
>> formatter.
>
> [...]
>
>> - Drop the `rnull` user, which will call `Delta::as_nanos` instead (Gary).
>
> Now that the rnull user has been dropped, I wonder if we need this
> now.
>
> If we want a readable format with a unit, Debug might be a better fit.
> core::time::Duration implements only Debug, not Display, and its Debug
> output includes the unit (e.g. 1.5s). Debug output is not expected to
> be stable, so we could change the format later. Users that need a
> fixed format can use as_nanos(), like rnull does.
>
> What do you think?

I think consensus on v1 was that a `Display` implementation would be
good to have even though no user, which is why I decided to send this
again.

I do think it is nice to have, but maybe we should consider doing some
kind of intelligent selection of the unit with rounding?

We can also change it to be a `Debug` implementation. I was not aware
about the stability requirement. But I guess that is mostly a user space
thing? In the kernel we can change stuff as we see fit, as long as we do
not interfere with the uapi.


Best regards,
Andreas Hindborg


