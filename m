Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418415B998;
	Mon, 27 Apr 2026 07:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777275866; cv=none; b=TDCJN+RaPHQemUgRvE4W60PUHpELnbzAKZZ+8YCaeR6K8YJ2O4P9we7MJKCL/mKTMl7CjlKGhoyqHSbiFzbRLjaR/jyRcnIYqYdSYHYGxx7fTpN7kY2IFhbQfOvpUDWSel1ccH74oay1bjBsxWs2ytBEf35Y3IJ2jIu3ubxdgys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777275866; c=relaxed/simple;
	bh=UhvaxafvAV+ZY92qW1p4rqQSumkIHXI0RQwzke5UgDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WwbMQ1IKwrhzH4NqhDwLZsC3QlmdmH2u+2P3LJNQU86tbyzE+RiLODcRhatpQ7k+9t1AM385ZNNO0l//Nx6ryaMNdfaBNTe3Zjx+yHx0fV0Cqu3pGM84r9Fd3UwSUJT3Ba4REfA2NJu+amjd1cZqbdGHimC1822XtMjLvkImOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BW25sMZu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BW25sMZu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EA4C19425;
	Mon, 27 Apr 2026 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777275866;
	bh=UhvaxafvAV+ZY92qW1p4rqQSumkIHXI0RQwzke5UgDE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BW25sMZuhPdjNa+iM6VMCaTjMZD5Kev7T7jEtroyTfS2+f86qU70P9PmiZb2nsE9K
	 CHbm4UknzWpbPGmHIDKy2/mXdJZNj1p81lXtZ8TZyzbc63XrmW/Ztn09RTsfQacE5q
	 S21iB+vRtl3S3Qx5KlxHCdHBJua0C+5MUnEq5Tu/CGk2B7u1lWwkzDDTFte27gYpKH
	 DGCpXpfr2yD8c0f1QvWa6DAQn71OpkjJ2/F6i9MZptA9gmbKipGa3c+CWNDBldcnRz
	 OlcAgiVcch6SuTaVv5OjnfxWY3wRsUA3qiTcEwzcfY9edRNQ8dAffTZXqXdfl2EXlC
	 ted1yOxdHRADg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Deborah Brouwer <deborah.brouwer@collabora.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>, Danilo
 Krummrich <dakr@kernel.org>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Benno
 Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron
 <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, FUJITA
 Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker
 <frederic@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Anna-Maria
 Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, boris.brezillon@collabora.com,
 beata.michalska@arm.com, lyude@redhat.com, acourbot@nvidia.com,
 work@onurozkan.dev, alvin.sun@linux.dev, Deborah Brouwer
 <deborah.brouwer@collabora.com>
Subject: Re: [PATCH v4 19/20] rust: time: add arch_timer_get_rate wrapper
In-Reply-To: <20260424-b4-fw-boot-v4-v4-19-a5d91050789d@collabora.com>
References: <20260424-b4-fw-boot-v4-v4-0-a5d91050789d@collabora.com>
 <ZpKRFb-Ves9nQ6lMstVDx-dk-vA9CSQMUQDTgSz4zBssvYj06calaHWnfeBCR6Zv92SVSX3QohKqUcY1KpTzHA==@protonmail.internalid>
 <20260424-b4-fw-boot-v4-v4-19-a5d91050789d@collabora.com>
Date: Mon, 27 Apr 2026 09:42:52 +0200
Message-ID: <87wlxsrgqr.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Deborah Brouwer" <deborah.brouwer@collabora.com> writes:

> Provide a safe Rust wrapper for arch_timer_get_rate().
>
> The underlying C helper returns 0 when the ARM architectural timer
> is not available or not yet initialized. Map this to Option<u32> to
> make the absence of a valid rate explicit to Rust callers.
>
> This allows Rust drivers to query the system timer frequency and
> select appropriate time sources when programming hardware timeouts.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Looks good to me, but it is weird that this is defined for non-arm targets.

Even if this is available for all architectures in C code, would it make
sense to gate it on the target being Arm in Rust?


Best regards,
Andreas Hindborg

