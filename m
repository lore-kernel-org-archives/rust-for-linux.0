Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C103B19B9
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jun 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781776632; cv=none; b=FNUwIeg2+5i3R+3qXikb/7hi12t6lCzAoXeGUJBLR9LlXXReTx58p1a1L0p7lfpb4f0eWNbYC49+GiBYPJGr6PkGAuGco8jf6GhtHpLZzEUHcs/QTOANEbf/53bAS6F0pR7E0V4X3LycVirC8viq/diHxaKQg4+oF5zlkERtDxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781776632; c=relaxed/simple;
	bh=wlnOszqCIG3PNQxA44gwvGsTlBrPUHMea1uzcISIDi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fJKifWCN41kxAv/Wcdmxxvac3NxRQ42sLRCU7XfAKzE2OukbkrbBMEvhEcjy1X8/jw475WbeFclGuJFshxRiUMXVPtcUpDxroAxqwLzJCb8UynVVceinp1/LaFKqjs0yKO99K2ysN/4gkkO1lIMU7j36LJV/69PcfuysXhTG8nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hgqmURuf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hgqmURuf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8846C1F000E9;
	Thu, 18 Jun 2026 09:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781776631;
	bh=wlnOszqCIG3PNQxA44gwvGsTlBrPUHMea1uzcISIDi8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=hgqmURuf2qlEMh5Dx0beTLY9+RNJAM0xRhBOHFcvWVFvqgLwYySwy2jw2Tde35nSy
	 vNbFhae0/N4AxA1rvLdZPf0op+Rwcd+FijbSkegAeARwj7dgxPizunSTItnELT/pkz
	 bDXXsRayjBtF/lmAxgS161aH3i1+cL0uW3uKybkD4SDY9wI3BbxWBZSnBlhOdfz2oL
	 0lEosbIHe0z3feNGsNRSm1qtJ/rLsDHzfUngPoFYhu7/JKZb21sdrRXAVX/YVqgl6E
	 ddyQx3Tz4mm+ZZgZdeIFV2dCFDMpjMHH3BHg0Dwvh4Ea2NGLorWosT382NrFShnvTG
	 A6mGv4zPYgTpA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@aliasing.net>, ojeda@kernel.org, gary@garyguo.net
Cc: dirk.behme@de.bosch.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, FUJITA Tomonori
 <fujita.tomonori@gmail.com>
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
In-Reply-To: <20260303061000.73970-1-tomo@aliasing.net>
References: <hGNrgHLZgzaLAav_TQCJaAHYX3aWSPyoHeXEf7u3ioJunfoFTIPF9Q8PnCvfRKXq2SS-fNdOn35uMiTaF90nKA==@protonmail.internalid>
 <20260303061000.73970-1-tomo@aliasing.net>
Date: Thu, 18 Jun 2026 11:56:59 +0200
Message-ID: <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@aliasing.net> writes:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>
> HrTimer::expires() previously read node.expires via a volatile load, which
> can race with C-side updates. Rework the API so it is only callable with
> exclusive access or from the callback context.
>
> Introduce expires_unchecked() with an explicit safety contract, switch
> HrTimer::expires() to Pin<&mut Self>, add
> HrTimerCallbackContext::expires(), and route the read through
> hrtimer_get_expires() via a Rust helper.
>
> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg


