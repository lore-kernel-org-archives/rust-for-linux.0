Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A971DD9AC
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368687; cv=none; b=f4NKRscGoOgm1g0qLFANcOlpyPZDkAuNzodUYOQiZwcpXK8+KKZ+krS+mYwDUrgKHxaQy/qliGsUTD0fEuuY51gtt69UiKgsQeamL5rp9zl5qEpfaYYi2QH960IIV17fClAIb0NeeTD6Ks34tLcBqpKATd40p1T7c/WoYX/JRbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368687; c=relaxed/simple;
	bh=SfnI2OxG49XDzSD2dPD74xWDqixJ5z0Mp8NFLoLuwFA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PngbYjo8laMfCwU3QyTKpi2gn4Kz/PKI95X+dcAOUzngNxwTR29XWd/cSPK6wA19+w7GcTbIIwx/z8MoKwYdWgzf5NdLvF9nvmCCRPuQDs+sPeioL/UqOrcCAxv8s2MkyGQLKWrGpy47Rqulh8Yd2x/DszaJ/sWnLBe7joXrUDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Z61DOuJe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TPbUpwop; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Z61DOuJe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TPbUpwop"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id 2342C1380553;
	Mon, 10 Aug 2026 09:31:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Mon, 10 Aug 2026 09:31:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786368684;
	 x=1786372284; bh=yR3UNBcYED1C6JNTwdBc7WR8q/du1jzECjoFfmEll+U=; b=
	Z61DOuJeXeD+C0f6pTqYwBxbwV/Hsuu2ILalgL7YP0h+94v5PTtcM5NKr5k6UQEp
	T1tKAF+CmNXbXWfuPxMYTUjsgWirysQgK0uf4w6lkMnF8gCSpDxQIGNvTzDtNut7
	/Lf2eEwImMBRf/TXnpYF2ZUxTKQ0DmhIEkqJlsWQfuODpqNsnJ/52oMmr56/4agq
	GxiXTRt1ADXutpYmtEWRiaS9RwGeHO7WVwdksnMc95uEcAF2vabMGPm/2VTI5gwP
	ZpSLm38dqesw4MT5KsR4W6L7eLIptVdtZXA1+Zc2Spx+C8WgXD3i7l0SClSv3MdW
	ucxHKnt+M7V/ebucbh9Ctw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786368684; x=
	1786372284; bh=yR3UNBcYED1C6JNTwdBc7WR8q/du1jzECjoFfmEll+U=; b=T
	PbUpwop3QXifj1w9mGnv6yn3/5rUy91+DQ39Wnd4PcekVj+3JKNpQrPdtaTgzsT5
	rgfGlMFNCTYR76HFomjdNXPYHZns0dyJ4wB0/cM2irCriuLLWwAMocB3j3zlta7y
	YHo+Nx2K7FYSrUDzy6MnggUGZCr2rCu8PV2qVoKnBRqRbJnqPLI8MuQ/sbuwf/Xb
	opPT9XOLTKJ6tFLSiKsuMS5iit+XnX8thwIFpZ5zGTGL/DKNw9f+qZ1p+d0cKKtX
	i/DUuffSdUlgFTx5rrBrx2qBVv9sRL45VoHyR5YDKoe2z9Gt6bFHBL0g+/GCDuwi
	eHmR6mAyD63AiqZ14t0cA==
X-ME-Sender: <xms:q9J5auqvy5ZM1MEfKRUwF28WqqT-abtJito_k0vflQHuW1g3DRW7bw>
    <xme:q9J5atDWjBbdGiabUHQt25YTfh7ihJaI7PhPMEPDj6_FlPVDoY-91UQACK_KRCtQb
    VMdpABSHEezD1ywcTNrAz4Tq8u5egRRk4AEBfjYTBE9z6bldoMPx-w>
X-ME-Received: <xmr:q9J5akVkcAmubLxGBIArAUWFXlqisNu8qin2zbT0Gr26Qn4sKSBngUPRnUOU_RpNsf4xlWPE9kHiZocAkqUM3kai>
X-ME-Proxy-Cause: dmFkZTF4xRnlt6J5MeEefZ9k0j+YuAYjyN0QWm8Lmcn099UFzVK0XECOI01UaoMm6irtAY
    1BffrNe6XY2Vcm1NSv2uGdUoEmxQZHCs2vC2mqT8aVx7KXEadQfB/VXlnTnPnH5AxmUBIO
    aMjcwOF9ViUZyDCvroTizDJa7FZoAIDCyvUKCyCr79rjI+a9DP+eqzVYIuWbOr6/dIyiO4
    s74uqMhDcV+9BzGg1hua+f2Yzd2d/aCQGm4xqFhIQRStCC9nPm0MYcix+GUvPWoKTXf72s
    +ns0kJshx6NaMP1YkkbX+jBf+A9TrBWZK1fkS87TgU/xFsDfPyARY0xDQOEuCjcqwglAlc
    tIVYXdO7dKyah0AZ+2uP/1pxenzuf5yrOZEUwaPT3AzHf+q/Tcpa4hq+Q1jkbIKfIvccsJ
    UfMMYohoEAgEOPJ49wXrYF/2PtetVfSq1f0T9NE3Lr/awBtl8kTQyBh5yuAqEf7r6SBghE
    kYZdUnvZXxDU5B1KXMfgmQ2LwXGySEDgcruGcXEBEWrmMrUaaNloSpQ+U4alPqK/jlrjRa
    Bi1OVRgpux50KqT/auyyTI4gzN67oKHxXyyHXohegMglSuLVmci3ws+1i+Rs8BwEXhgH2P
    CHVNfm5gwSwgosCKBljgXG1RMIFuRbPgQ0SgRgYR1/dbU1VvK0kiBIKZ658g
X-ME-Proxy: <xmx:q9J5ap5gXuI66MRPYRDvPSjHqCHD5ELQ6CU9eti9Z8Av0XOpBNhzaw>
    <xmx:q9J5atAb1N0Y9Zziv53EUZEYv3-p-jCAj_4jtLPdGX4weBgImwtmBA>
    <xmx:q9J5amBfyLI6goBblbyILp2_Viz06FYnnNMyFqsGENkR-5i6Z0FbWA>
    <xmx:q9J5alh5ppeqEs22rL5vmDM9at_GodDcsRregqNb-SvsWiQxO4Ndpw>
    <xmx:rNJ5ask56EdqDxi3yxo4xuWVFtXdnsS8Jbp58iITmpA0V7ZqSyevlmyC>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 09:31:18 -0400 (EDT)
Date: Mon, 10 Aug 2026 22:31:16 +0900 (JST)
Message-Id: <20260810.223116.480833962545427592.tomo@flapping.org>
To: a.hindborg@kernel.org, ojeda@kernel.org
Cc: tomo@flapping.org, jstultz@google.com, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, gary@garyguo.net, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: time: rename ClockSource trait to ClockId
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87ecgc96gy.fsf@t14s.mail-host-address-is-not-set>
References: <Xb3BqlziN0dz1513y4Pf4QcsWU4wtV9yldqqJnRxpJpDfcu8sMggyUlvbLFPRAVBPyTI698uvBbWntyliXl7Qg==@protonmail.internalid>
	<20260722001050.4115708-1-tomo@flapping.org>
	<87ecgc96gy.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 05 Aug 2026 13:01:17 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> The `ClockSource` trait has nothing to do with the C `struct clocksource`
>> in `include/linux/clocksource.h`, which abstracts the hardware counter
>> used as a source of time for the majority of the clockids. The trait
>> instead carries a `clockid_t` `ID`, i.e. one of the IDs of "the various
>> system clocks (for POSIX.1b interval timers)" as described in
>> include/uapi/linux/time.h (CLOCK_MONOTONIC, CLOCK_REALTIME, ...). It thus
>> plays the role of a `clockid_t`, and the `ClockSource` name overlaps
>> confusingly with the C `clocksource` concept when reading across C and
>> Rust code.
>>
>> Rename the trait to `ClockId` to reflect that it represents a
>> `clockid_t`. This is a pure rename; there is no functional change.
>>
>> Suggested-by: John Stultz <jstultz@google.com>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> Link: https://lore.kernel.org/rust-for-linux/CANDhNCrKMdHCmL76LWCROVF2Ly-9NxmfmQ2T+P=iv34aVkO2uQ@mail.gmail.com/
> 
> Makes sense to me.
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks!

Miguel, Andreas, can we merge this via rust-next?


