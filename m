Received: from flow-b6-smtp.messagingengine.com (flow-b6-smtp.messagingengine.com [202.12.124.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BD13CF212
	for <rust-for-linux@vger.kernel.org>; Wed, 15 Jul 2026 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784114585; cv=none; b=DdhbYnbdrzENTKQ112vjSxcuOUssF2/XYr8fxO9FqeCnHpZTLhSDW/xiJ9ShJR9NNjZRPB289JcONOAp6b3zMd/4r4Z9J3JOhSF7cbrLc3Hq9PzwnekYHwNEKaxPYV9xk7n7JplPwBrfyADV8yEtpy6H8gIKenn/MxaO6dvBm8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784114585; c=relaxed/simple;
	bh=RJ4GMvgHUEjMt1h+1dIeJFIcmItdoeU2PrmOdj9ktn8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U2/ZMvYZ4gJWPD48XSlsdq4aU3UNogiIMlttjBZ1t61dtYPpTLgL1kEq+MQgFI3ie1GfF16qoMvJe9vojIaw95AL4AszLab3X2JRBiR4Q0P5ZXYBxo/EZYFBKsmOMxnTj5Nldl8UB6QyjF7BiVYTio+Yp+l6cqsfgtYvTkUOMeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=lhRleoyz; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VEVr/mEX; arc=none smtp.client-ip=202.12.124.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="lhRleoyz";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VEVr/mEX"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.stl.internal (Postfix) with ESMTP id 4AC03130009A;
	Wed, 15 Jul 2026 07:23:02 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Wed, 15 Jul 2026 07:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784114582;
	 x=1784118182; bh=CI8TvT9WeH5WeYauNk8nvqcgjGVjpLD/kx3YeTQ1+IY=; b=
	lhRleoyzElmt6O7a1k/inDsJVv2+4FhOutHZ6xX8LGFSgGLPieZ6GIgO3pJtFJqc
	3zA7dcNApbxZcCbyuZUiDefe5gquABw5NWGm+7yWwxN1JaEWBQVnQU2FujRgr/U1
	VvPoSkI+rSQ6yUno08f4nHr3Hx0771dYCrcHcTjDoQSJRozxKdj2fomq2415L1ql
	ILMWZy1YcQoGVa1ZFVCs4XKLgmkvkM8LHUgDa6dLMn2iOoo7nUQ/REFgCAKNwutB
	PGVhFY3C6jVwHA7ZjSuvD5e63/Afmt0l0ZRhhhjpvLvzp/Odljl5XXua3o1rjFBW
	B00r9PSyizZCAhHpYCJggQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784114582; x=
	1784118182; bh=CI8TvT9WeH5WeYauNk8nvqcgjGVjpLD/kx3YeTQ1+IY=; b=V
	EVr/mEXjuza5A4fg5IvizQ4IKuqigVA9J+UUkVV0ii/EUxzV09Y3Oh/qwYHg6juK
	Q0jK7s/r3hRkMIIZM4HsdufgiFNs8/Gp5AM2t80/6xmvwkuNTPOrNSlM4mBXUQTL
	Gjm7BUFjg2DrMz+Suig7M+GvrDI43vF4XO0DZJYjE6wuSntuIew3SEN43ZB8QGEO
	QtcTQ2vwSd33TF9Mhtnpp3M7wJSMNiophL0gDPiAzORXWFPUq7GdjWhvZGse59md
	/SGYPkDtmbrnU+vtXAVp/tAmZ4a2/39g6XqXsBXIQ9SpokLQ+St3k1vgB22Vu/bd
	H4U08UPsHyP1gpeHT5CgQ==
X-ME-Sender: <xms:lW1XaiNtNEz6poFi4Zo01oF3vRHoKo4CIt8ZqNRUw65_ugvsFQO6ow>
    <xme:lW1XaiWBvuTHdXgG90puQu3tHxqh1jwvIVSgkMnqJXe9cdMjnhBup8eLGIuhqo-GE
    tmHndWw_1OYjVFoztwCq2w7hEMS4zIrDqTvbigfgZhdGwdBaeYrQ-qC>
X-ME-Received: <xmr:lW1Xaij69kxmQu-FXXqyLAx7_veVmRffIUohTvSTato_Kst26RYs3CEhj5ig0-naHbUVKgDRjXFmwLMTKy3E6MK2>
X-ME-Proxy-Cause: dmFkZTF9e/UQaVHUhRka8NwMIrg22vBt0TLfXmQdS16Cj0/tYkmnLRxtjCMbUrGcaZyoYy
    wDLtbIL4zTU5f5okCmSmFYTLlc9nFg6+YQECLzThTq/TTevhIRcaBuvESWhqLMNaIUINsm
    Q2gtLqLrh8BymuqtHg2yl93SQZpoT9BRVzsqQB0OfecLqC1quKBwJEQWvAevqJL1skRfKz
    Q/2YZp/1UcRsuPyk5yCReDzWkYpUhGNeFzyL1iwLb8Q5eyvVF3KYtQ5xGtuVRLDGIr1w0A
    WtbaQNpIBiZAqaVWOoajTz7mLv9cndgh8w0d+cO4cBy2hJdVTo8+Bexn32XRq1OQgZH0bB
    2dEAZh0Qk3kd5pa05+doMDskTGVC5el2hWtMgdhY7V7OvOovpIgE+p1Np3TtL1jabPb7jC
    0q/NXLVX0b2qAEGvXft/4PI4kfqmDJLh74gf6tfG/o7HjbiBZyCVtzKMywt2UL6YslRp4I
    KGq4L+v7NV3mvCZHHWaxqCgMQiR5/2qjCscGcY3Vj9QLinpiOgPutKXcuqOnMJqO2TH4+B
    7tChn0muPFz22BBSx6NcZj7bx6P0R+8TE7lGP4IYqevx6MpvnSkJ35VcYQ2FF1Eu1XB73k
    G2M8+iUHG+eN+gfIbfX7lvkeYRcFhrKWMxg7iXmdyTlkanMw5oM3JW7TTW9w
X-ME-Proxy: <xmx:lW1Xaq8pv_q-CZ39Bb5BF6rMQbb4EFNOF_WjmKJsxEIGVTsUfwrjLg>
    <xmx:lW1XahQD0sex_QZiu4VyQzmINEdzbSoCYU3PCjICj0HlHfDfVhj4HQ>
    <xmx:lW1XahulggZDTrbff5YbnrnjSBRx9I8apw5WppD5aE3-N9RoxW12-g>
    <xmx:lW1Xar7gyXaXcLiU5guhkZUn__0H4DAvFPhMae27vCpZRtZA5poDxw>
    <xmx:lW1Xaov9oc5mhDGt65V5iL9AvV4cWP1sLYPJkgQjj_5GqTQXqAYQk6K8>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 07:22:57 -0400 (EDT)
Date: Wed, 15 Jul 2026 20:22:54 +0900 (JST)
Message-Id: <20260715.202254.38223441240127219.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@aliasing.net, ojeda@kernel.org, gary@garyguo.net,
 dirk.behme@de.bosch.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
References: <hGNrgHLZgzaLAav_TQCJaAHYX3aWSPyoHeXEf7u3ioJunfoFTIPF9Q8PnCvfRKXq2SS-fNdOn35uMiTaF90nKA==@protonmail.internalid>
	<20260303061000.73970-1-tomo@aliasing.net>
	<87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 18 Jun 2026 11:56:59 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@aliasing.net> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> HrTimer::expires() previously read node.expires via a volatile load, which
>> can race with C-side updates. Rework the API so it is only callable with
>> exclusive access or from the callback context.
>>
>> Introduce expires_unchecked() with an explicit safety contract, switch
>> HrTimer::expires() to Pin<&mut Self>, add
>> HrTimerCallbackContext::expires(), and route the read through
>> hrtimer_get_expires() via a Rust helper.
>>
>> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
>> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

One thing I'd like to double check before merging this,
HrTImerCallbackContext::expires() now does:

unsafe { self.0.as_ref().expires_unchecked() }

which briefly makes a &HrTimer<T> from the NonNull<HrTimer<T>>.

This is only sound today because `HrTimer<T>`'s sole field is
`Opaque<bindings::hrtimer>`. As you pointed out earlier, if we add a
field to HrTimer, "stuff breaks".

Should `expires_unchecked` just keep taking `self_ptr: *const Self`,
like `raw_forward()` (and like v2 did), so
`HrTimerCallbackContext::expires()` can stay on `self.0.as_ptr()` and
never form the reference at all?
