Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF702BE7BE
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 00:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014592; cv=none; b=piIzrImBcIXStTlPDbeguKb8p8ZUzXZzzKX0ET8RpT2ng/T3eiLhplruHzHnwnCyDt192T//W+rAECU+IHLejdKKWEz9BzeuS9UA8x9t4fMmKWJlfoUmg+cguqTxPN2bX/IoD2OYglucEtsOqv+ueS17Z0uDBZkpeekMiwwk76g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014592; c=relaxed/simple;
	bh=c9Qbj6l9oEG1ndAkVa3Z4tfcDex9lhjtactohTHG35M=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Uj709g3rsVmVlV2F8xnNG09EPQ7iSB88HXR2Y2Xxa8A/Y/dPvWdMNzKIDmkSmnEUCO7u609JkYQ0TQTPX3Kg2cBrRH6f4dPrZJKzKYRei4iZDXarPQHMXplYExvgJy8FpyW/fjls49qcgv8zBCCS+nRpPU+LlJ1fhUu48PRyQmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=tHrfSjBb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=I9i6NzD2; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="tHrfSjBb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="I9i6NzD2"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 71CD7130013F;
	Mon, 17 Aug 2026 20:56:28 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 17 Aug 2026 20:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787014588;
	 x=1787018188; bh=Ct7DsSnE0SAirGkih6kKtMJNFhPjGUKv7tJsINYO240=; b=
	tHrfSjBbpTd/XPnChG+V2tEzbAXoM+CVTNnlCZfJyuWen+4hMwuHJTeGSPv9khxu
	x/wP69LuaigcQZczvZZN+vAQy1KMkuJeqejxtWJoyi2HvxO9jk9ZMLHz208F2SEr
	4xQLsP8ZZvQuDTYUYKG8TLgg6Yp+H1BbfjM6BSrd/KvHEy0t+v1T7HvUusjTDDPp
	cEhySGlfnvkDL3GEf7YaZUy3jLMR1m0pWBsxvXkXpvt6uEbgVcVp6AJTcGj+MsR8
	vrR9lecnFAkAtwbsxwYQtvx3XZp6MYwuEhUvflrrbJzr2FuDPahfb5FS+ZQ9MYMY
	qJPveSX94HIlE8wcUdzWVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787014588; x=
	1787018188; bh=Ct7DsSnE0SAirGkih6kKtMJNFhPjGUKv7tJsINYO240=; b=I
	9i6NzD2B3wkqGdUlAp2Ivdw2eEcclm91wxeq0AQKGTIdJ+ijlUuMo77a0z8XZE04
	wpW10XkHnI1nH8sdYvnJEM5IC2XnydZraK7y2hV9qfTpt8eCpmYjMIyF38yhFaQl
	w5ubZeTnJCoZADhJB/yTasys+vIc059IcB3lYnCo2kX3fG8SPCRDiJJLS7w4IjPY
	WajvQnskZiLTOb7X0eJvLdMpUCSIK8P0Ms5b0CEZ+ZBCkgUzygDjLowsD8ZVPnCt
	0NQt+Q6buP2yYbuG2giSSg0WZq3kWZr/pnFsnW14iUcZEyCyKxdAmXNE4D0yMjfa
	kPSPtR1y73+7S1Ajydb0A==
X-ME-Sender: <xms:u62Dam-xnCqkLhVGHB1kZHv0f68k_DPAA-F5HHJmvpwWdaCUP39OGQ>
    <xme:u62DanH6g4oH0okDWhL0xDxsjkeEdydfuGV5wcn2VYF0xMM5Drn4zDQogZwVbLEtN
    vw3_rvuVXtTTA5lVof1k5nW8mRL4Dq3H_pzvYT7KSZSX9FeQ5Kjd1YB>
X-ME-Received: <xmr:u62DatI1Geo9LnXWfaMU7u4CYU6GiXYmROyVUb-yOzsXX1FbBCRFveaqRs6pGiBjCrwQyjCKekX--GYzC8x7Qwjs>
X-ME-Proxy-Cause: dmFkZTEbUpH5hLHbCJ+hpTPZd2W3KRt3vERa5Ddu54ErVVCjmWeLTZPheCZfKx/TkeiFh4
    q9lMh0X0p6n3r4DFCTqf/mo1qkXpWZHvBKgsHix2JcuIEAvUBs6KYZGVfuyRUKQsjAxUoT
    Gl1OXLxo67aHSaEUvL2wOsVyuBV2E8Py9u3gkVZQAZJCWWbZwYDJIOZaZIXiZDN0EaH3pK
    zK8X8X216MsdtkhC2zPGf4EYTuj3F7t8+fR9hANflk4FAcKDXg2SakAqAk35qYsOA6U1/g
    d8zfCJly1L66r7f4uykbIPZ9K+2xCfoQDYRBI2p7zpzyqpK5hwuoDPQKhLB2ENe4tJNpV9
    8lDNw2SYuPFuKliz+53XS/y8iyfoUmAADPKI78NYHoguQIYq6C9H1JCG0b1NldJrkEHBL1
    A0NjWpsyf23hJLtMxj86TvEjAMV3i8CWoPi0hhdFyKAJFJQtddWVwueRv4buAqAiBLGbhM
    G6PgF/KLylsKnA4MTgywPFX0rt89pQBY46NENPrPwZcSGP4DIr6VI0wZvoBk7qKGHsWEvU
    PxwgVBk+EfV1qeIJsju0uWsKB1//gxCAu0qBsNUBTKgTwwcX2iSBpiNy83IGxolPA3qlrS
    myK08O4Sq6YVLVUvujeFazy2y7nXNNryh6oouHWOk4XYctCINn5j+cqM5JYw
X-ME-Proxy: <xmx:u62DaqdHgKqwxG9znVKJXIySsB0M2dVfmYA8MbAb1izpmxhFycO1mQ>
    <xmx:u62DaqWQIVRCEyJXBj1ZqoC7HFu6VNgECtXbWflPAPwv19gjKOCO7A>
    <xmx:u62DahF8FhMuS5GBY01uNNVqQ37NZIOkxAyT8seGuoxpb5pQ7KAeVg>
    <xmx:u62DarW227eb55w06iabz8pXZYRjABAlNXEqyIzJ4X2GIOSKrtzt6Q>
    <xmx:vK2DakLbmrWHj1ASGqJFFZW6M8UrbKRy3mA22V-56wq_F_GJzJuvfu07>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 20:56:22 -0400 (EDT)
Date: Tue, 18 Aug 2026 09:56:19 +0900 (JST)
Message-Id: <20260818.095619.1068441676765868843.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, anna-maria@linutronix.de, frederic@kernel.org,
 tglx@kernel.org, a.hindborg@kernel.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DKOQH5AD00IZ.2UHAO78NDFZZ6@garyguo.net>
References: <DKO995UPAESG.UQNZ5G92HCPQ@garyguo.net>
	<20260814.224838.67768463960169120.tomo@flapping.org>
	<DKOQH5AD00IZ.2UHAO78NDFZZ6@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Aug 2026 15:24:10 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Fri Aug 14, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
>> On Fri, 14 Aug 2026 01:54:25 +0100
>> "Gary Guo" <gary@garyguo.net> wrote:
>>> Let's ignore the implementation detail of all various Rust pointers. It is
>>> something that I plan to overhaul and doesn't matter to the core issue here.
>>> 
>>> The change you're making is to remove the ability to concurrently start a timer
>>> in Rust. So if you have a timer might be running, you'd need to first cancel it
>>> before you can arm it again.
>>> 
>>> I do think it is conceptually cleaner -- however given this is explicitly added
>>> in
>>> https://lore.kernel.org/all/tip-5de2755c8c8b3a6b8414870e2c284914a2b42e4d@git.kernel.org/
>>> and the pattern is what perf core uses; so I wouldn't just dismiss the existence
>>> of this pattern. Perhaps cancelling before restarting is considered too
>>> expensive and has to be avoided?
>>
>> The pattern perf core uses is "no arming while armed".
>>
>> While perf_mux_hrtimer_handler() returns HRTIMER_RESTART -- while the
>> timer is active -- perf_mux_hrtimer_restart() does nothing. Only once
>> the handler has cleared cpc->hrtimer_active and returned
>> HRTIMER_NORESTART does perf_mux_hrtimer_restart() arm it again.
>>
>> That flag was added precisely to implement "no arming while armed", in
>> 4cfafd3082af ("sched,perf: Fix periodic timers"):
>>
>>     We do not want to race such that the handler has already decided
>>     to stop, but the (external) restart sees the timer still active and we
>>     end up with a 'lost' timer.
>>
>>     The problem with the current code is that the re-start can come before
>>     the callback does the forward, at which point the forward from the
>>     callback will WARN about forwarding an enqueued timer.
>>
>>
>> With cpc->hrtimer_active in place, neither of the two conditions that
>> 5de2755c8c8b touches is reachable in perf's usage.
> 
> So are we okay saying that concurrent restart is problematic because apparently
> it cannot be used correctly (because you don't have a way to synchronize it)?
> Perhaps we should just revert 5de2755c8c8b or at least do
> 
>     if (restart != HRTIMER_NORESTART) {
>         WARN_ON(timer->state != HRTIMER_STATE_CALLBACK);
>         if (!(timer->state & HRTIMER_STATE_ENQUEUED))
>             enqueue_hrtimer(timer, base);
>     }
> 
> ?

HRTIMER_STATE_CALLBACK is gone; the state machine was reworked, so
that WARN is now WARN_ON(timer->is_queued): the timer was armed again
while the callback was running. And the

if (!(timer->state & HRTIMER_STATE_ENQUEUED))

part is what the tree does already; __run_hrtimer() checks
!timer->is_queued. So against current mainline the proposal is just
the WARN.

That is only a diagnostic and does not change behaviour, so I'm not
sure whether it is worth it.


> That said, the perf core's pattern is still different from the API that you're
> designing. When perf_mux_hrtimer_handler unlocks cpc->hrtimer_lock at that point
> perf_mux_hrtimer_restart can already kick in and restart the timer. From hrtimer
> core's perspective, it is starting a timer that is still have running callback
> -- but that callback shall only return NORESTART.

Yes. The difference is that perf can restart a timer that is stopped, and
also one that is still in its callback, before the callback returns
HRTIMER_NORESTART.

The second case is a short window, but if it matters, I think that
there are two ways to cover it. One is an unsafe restart, where the
user of the hrtimer synchronizes with a spinlock and a flag as perf
does. The other is to add a type that does that synchronization.

