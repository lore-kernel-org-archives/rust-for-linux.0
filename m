Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17483451C6
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787144478; cv=none; b=Kvna7Yp5jA3BcL+P2C1Smr+m7ZMd2CuzAIjVsV4J5kggEsA6TZTnsnCIr11Q+Bie+8FjissvmqkF7n8JTmlahx/cKFIrmSWw8Rfdtd9bHn3wwEl1A08F4ZtYHciT8BkwfDOgqqF3NukWcZ+5aIiCXjOL+3Rgkgbe/ijkTata0rA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787144478; c=relaxed/simple;
	bh=QtGbJ04y6+5U+fCifeswP4gFGkJ3Gm62fBvFHAY80ho=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pvlHPyYIQxnaSNtZU341ZcOKRdzXp1jAZgSX+k0d90xnTacPIz9w/i75xf6x8+ESKjfEKsOaZ1222LnO6qJcW8HGEpyvydSQZxbotRuaacBfdDY8lKyPqH5eUFxEgnIG1dlDSNXEhZ6VYaeQsUWqjV4WnNldlSKL3K9vEj4PL78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=oQHW0dtE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ty86Zl2P; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="oQHW0dtE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ty86Zl2P"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 42E3513000D9;
	Wed, 19 Aug 2026 09:01:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 19 Aug 2026 09:01:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787144475;
	 x=1787148075; bh=ko4SXG98a7xqE6B2QdIzELBbHwIyfKkFOxP4U26IyDI=; b=
	oQHW0dtEGsk7oUzHtrNDZwW2v+e34yojBjHaZ9cDrvpmw3Vl0ju0zJ1H0FidTbLK
	xKszSdGEokMzXYYlC3ZPFyYaVLckJpRQ6xNpe4zCvLhasz/Pwx1FQWeOc3ksCKnL
	1VfJm+oo/yFlpFrIxu82WEZ0ytfCHdZdBa1A8Kx9wCUpE8RNF2lSzzaoJBdDWk7n
	KbrH76dAvhkpsSs2AbtfSKss3hF5p+LjzijuhgjSI4Z2y74siyEJPmjauZkx/r7h
	Yzeg3nVuWKegtQQMJuL/NPxAsmGegHKzwEm3lj38j87W1BqC88lfX0u8z8RPYLkr
	/bp2SNjFPkFExcBwDmyMcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787144475; x=
	1787148075; bh=ko4SXG98a7xqE6B2QdIzELBbHwIyfKkFOxP4U26IyDI=; b=T
	y86Zl2PxWW1IyYJ9MfFAOESk25Fbx7HQQEc9l5JxGY1dRdQVKhkh4k+Q4fd/o9+H
	OS47TsjJ52zV8DpKxKfq18QP6GbVZ3xCt9WcM8XIU+BuUM3AYirtamtEg429m28o
	b6h9j799SiBVAccnNj8+GeNCA8iDEReky2nggTKoLwxzzk1veup39CyfP8DsakoX
	SBhbz5ohC4H8D7TxAn8dIqUD/yHeh/lbUQvNVJIwSW87zQEUiRvsnQUymH5uKp0/
	J1icm3kvqVneRj6U34TWaAMt/4DWMoSvO9KMTrtEp8+6QmngUW+PaheCkvWfEaC1
	nytks+8IyAEPFz2O0PBdA==
X-ME-Sender: <xms:GqmFajtUQjDOaaSG579Lxy7kh_L0f6gAmzydUNnc8OYjuGJ2nb7SQg>
    <xme:GqmFak2TXb486CGIWNRg2LOtaE_V-ubvXO-qQNQ3KuWFazRY-8bAQdknYiSoduhb5
    -ZEM4FanBGlJ1UwQIG14fdg1QZQWC-Buegq4X8b9cr42J3kLJ4rpZo>
X-ME-Received: <xmr:GqmFan7z5C-NBOKt0p5awMl1V3BRApXzST7qpmNcPxz5RW3klDRq5sMhKCRkAjE3Ov_YbFyFvqX0sOTo7S0Y8Vfu>
X-ME-Proxy-Cause: dmFkZTEHbLzbVC/SccI56gbjZJLWcGToDcmFagp/JUK7zdOysBTe8Z7f1Ig9WU3i25XhVL
    zTC9BW0cxj+N5tCzig8u9uqST/o/Fx25umgrXpEWspefCGOPSYykZR4ZoRs7fAvfHx5Tka
    OJhgF8FtQSRZ2nwN8s3Mu6crfp8ruGeE3QgI8qTJztg1ei9MKur4Q4HEDOe4Xz5h8Vt4DJ
    IxmiN/ljGEDOqmA5PWaNcKWtf5AXCjHYulZ8asNLHCOTM50hMrPrWOedxaBizEyuFeKWFD
    URptI2MiyQ2NmpojVrZqC3ckasnCGMO7LQeQ7gKmE0rtD24Y5eeyddKQ07KR4tHk+XJaNt
    qWt+wWlmxmxj7hFPBh+/XHrr2RkvflyVI2UIDwweqKLxjyaErk71yawnZyDy0LD4AEeq4u
    oD80//NXf/Uj7ud+N3Wp0lc0A8xv4zGnyhbOUavfa/isHI9owSu5uT8L7HcAo0+BYQiobQ
    yd+DTWozEijdeTua99vitDFxIKa32kHWf9CUbH/EVlfscZNAkz8IK7ZsPAxrSjDNzg8EA8
    lE+SByjhjRaHIQRWVC6FVAzB8xwjz/jzR5TdRIrNHo8/gupr+TaToeVsscaSGsGrtJuk4x
    FE6t8ntE6eoVVOl12P62WI8Df4lNS5UpMJeNkwEZp2or5zd7D879aVyeWV0Q
X-ME-Proxy: <xmx:GqmFauOROHElZP3LZklEhLkpkHSpoZqg8SxrQxXwZ9BzbDk4UiwE0w>
    <xmx:GqmFajEUm_pY9nu_jPoe0m2vPGkHpU55jDg8IEjQ0Or2w30EofrHKA>
    <xmx:GqmFaq1GE87yTDjmMvqh9FYun-vEv6KkE20IpsCSae6OZHEc6ZA0-A>
    <xmx:GqmFaiEjVoPn9rpBS_GOWhgHY-Z_iLuWcEkrXAcKf54tjTcm2rwQJw>
    <xmx:GqmFalYN8kkvC_U-pPFaYgsE3-eCp7SRaPmZEZ6aGggblFQQQkJ0yg5u>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Aug 2026 09:01:10 -0400 (EDT)
Date: Wed, 19 Aug 2026 22:01:06 +0900 (JST)
Message-Id: <20260819.220106.1561543001385383760.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, gary@garyguo.net, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87pkzf8wrh.fsf@kernel.org>
References: <bAoCglwDHEBnzbZXVYa9FIwZTfbJ_4lMqFz-20jmYhwlUf7y6s8L5ev0Ezf3wc4r9HkvrqfnVY1LotFV6NwWfw==@protonmail.internalid>
	<20260818.202111.221982706607091751.tomo@flapping.org>
	<87pkzf8wrh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 13:59:30 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> On Tue, 18 Aug 2026 11:02:27 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>>> perf and CFS bandwidth have a flag as well as a lock. The flag is "do
>>>> not arm while armed", which is the same rule the types enforce
>>>> here. rtc and the softlockup watchdog look like they cancel first and
>>>> then start instead. None of them arms a timer that is active, so I
>>>> would rather the abstraction did not allow it either. Does that seem
>>>> reasonable?
>>>
>>> I am fine with preventing starting a timer that is Started or Running,
>>> but I am not liking the `UniqueArc` requirement.
>>>
>>> I have a use case in `rnull` where I have to start a timer behind an
>>> `Arc` with no way to obtain a `UniqueArc`, so I would prefer if that use
>>> case keeps on working. Without this, I would have to allocate a box and
>>> put it behind a lock, leading to double indirection.
>>
>> Before the UniqueArc requirement, I would like to check which timer
>> you have in mind? The bandwidth timer, the per-command timer, or
>> something else? The two seem to need different things, so I would
>> rather not guess.
> 
> The bandwidth timer. It is started from an `Arc<NullBlkDevice>:
> HasHrTimer`. If we make the suggested change to `ArcTimerHandle`, I
> think I would need to change the `NullBlkDevice::bandwidth_timer` from
> an embedded `HrTimer` to a `SpinLock<Box<HrTimer>>` or something like
> that.
> 
> Maybe this is fine. I don't think it will affect performance for `rnull`
> - this is already a throttled path. But it gives slightly more
> convoluted code in the caller by reducing the way we can use the API.

I think we can allow creating HrTimerArc<T> from Arc<T>, so that UniqueArc is
not required. ListArc does the same with AtomicTracker, an atomic bool in the
object that records whether a ListArc exists:

    HrTimerArc::try_from_arc(Arc<T>) -> Result<HrTimerArc<T>, Arc<T>>

It fails when there is already another HrTimerArc for the object.

> For the completion timer, the change you propose would work fine I
> think. I would just start the timer via the unique request reference
> rather than the shared one. This is probably a better way to do it
> anyway.

Agreed.

