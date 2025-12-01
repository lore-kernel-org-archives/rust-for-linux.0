Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B462F360A;
	Mon,  1 Dec 2025 16:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764607774; cv=none; b=SHCP/xTryzPllwFD7qOJ/ya7BVh0/PJuNnn54ERggugdXeN3iBDRxaIL+XeWGf9WnkStoQGc4MSwU2IyVz3ncDB5roYcW3dWcITxhUNmXCczsB+T5ni8BlkWe8+/aWEnG9F1ij2cpojMusKZCRsEI7jOz4U2yFd8dNfx6P/PQfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764607774; c=relaxed/simple;
	bh=4rniN19+VIt54ZDqj34HfJKKVZNL1IxXY4+h3o3RM70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly0Ee6lUwZghkxdxfHzH+u2yYIu17lJyn2xeMqu2s18Kzx1QNfK06bUlf6r43AAnx/cQavFJD6A2j9BTRCBZGY9AgJ5pbFOADaLto1TZfT6s/L8inURs60NasE+IIw+8UCfXRHmm6Z8eCRMAaK8pCBTOiokebuCiRFnKm+CAcfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=QBtMEwm3; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="QBtMEwm3"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dKqcm47SJz9spj;
	Mon,  1 Dec 2025 17:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764607768;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1Ug/VLXojyKxU88cARR1ncqFVOr2Z2B4IEU52BxXuo=;
	b=QBtMEwm3w9zVcsw38P4/rtyH/Fsp6EdtjuYfp0bjQmTuet90+9nhAGgNyvLBfMvU+lb6tl
	BjqioQTJNfeevbXDN0tlfbUnu+hJgZY6rIDw9ixCHpiwIGjdKjovMtpX7ZCjNkdIg/g9Ai
	Xc+7FmSSna7Mair2IjqDmaQq6ZWY62ubVassCcPJ5ulVpg9I+hSCDAXcgUpw+1h9ivZFDq
	QeXc6VA73WuQkXQEUIptMcvk4lmcTRIOZCYT5qSUOiWpMmP/+LJ2eDMvpLHHTK45AUYQph
	PM8cbcH1tMEKgqRYtJfq2YIrkU3RrbuADoXJy/Z6G0Znp9QlMUihgSFtjm4GlA==
Date: Mon, 1 Dec 2025 17:49:23 +0100
From: Maurice Hieronymus <mhi@mailbox.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scripts: generate_rust_analyzer: Add message to
 sysroot assertion
Message-ID: <h34vw3szyz4to52qzocor6qauz6gqqp47rvuqwam6m3kruwtzn@c6bralnkcjna>
References: <20251130191535.77498-1-mhi@mailbox.org>
 <CANiq72mTnNOfCHv0f_ByXV1UTgF1T3LiHU4vCTFPN5fsEniVGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mTnNOfCHv0f_ByXV1UTgF1T3LiHU4vCTFPN5fsEniVGA@mail.gmail.com>
X-MBO-RS-ID: 3742dd25b90f7d6032d
X-MBO-RS-META: 4mtyuitj75c91gep63wbehjwibaun4md

On Mon, Dec 01, 2025 at 12:50:44AM +0100, Miguel Ojeda wrote:

> On Sun, Nov 30, 2025 at 8:15 PM Maurice Hieronymus <mhi@mailbox.org>
> wrote:
>
> > - Send patch to all people received from scripts/get_maintainer.pl
>
> Thanks for that!

I’m still getting familiar with the mailing list workflow, so I have
Ia question regarding this. You mentioned that keeping or removing the
Icomment is fine. In cases like this, if I decide not to change the
Ipatch, should I still send a reply, or would it be picked up as-is
Ieventually? 'm just curious since I plan to contribute more in the near
Ifuture.

> >      # Making sure that the `sysroot` and `sysroot_src` belong to
> >      the same toolchain.
>
> I guess we could now remove the comment since it is a bit redundant,
> but it is fine either way.

Sure, I will resend a v3 in a moment.

> Cheers, Miguel
