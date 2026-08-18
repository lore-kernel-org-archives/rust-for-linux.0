Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7903E1F16B
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 02:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787020027; cv=none; b=shul8fi+hBGXVXXXS8SY3TCXY6yX0tAYoEEsLuTbGRiG/NOgpwwgoakrze2Brwco4PxMTdMiiQ4Rb1XQKwOtmGfCTHrmKVWsXlHbDDMzgyRxEUrJjs/YnkMZSgrsHZiBqLJhmxwYVP2KEZYdjQntHneu/D3tzFafGbFhK+UC1Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787020027; c=relaxed/simple;
	bh=v+1mUCNCG3j2KHXc+Sd3XKUONAJehFIqw5gEtqVE7Uw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=rV0gt64QOVGbmU95eEogDrBr77Yfm7I3HK1NHf8jyr07RCQmIWek4UrAJCEwRt6RAEZs8QD8PtQMAULcG6WHqG6xypaYe8S50IvEpPGMqkyhY1jAXF99WryMM1U6Jl98SZ13kb1O0BgVUvws1DP/dLbOGEYvLUcMoKuGWP4LNeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=a84f8+vG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CoI7aTSw; arc=none smtp.client-ip=202.12.124.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="a84f8+vG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CoI7aTSw"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.stl.internal (Postfix) with ESMTP id F127D1300786;
	Mon, 17 Aug 2026 22:27:03 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 17 Aug 2026 22:27:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787020023;
	 x=1787023623; bh=XiEUlvEmeWP6nh6dSZFRttY647EdBPZicexK9dCA9co=; b=
	a84f8+vGyIJ2oLJKl78QLCEh6o0XcHvEjY2SMggVuvOjTFlQJ8m2gboFNhbHuxpu
	BF8L2UWEIBEK++zUpGarloH36MSIfu4zfTQ2TOkuadZo47q/MG4QwCkRwrRsKRmM
	hs/6Sj5pU4t3CrbC0E8y4XUlTgEXC1IW0Gk5E1pZOyCmKD6OkpbTyrVj7DrFwQiZ
	F3OqRIkqiS0n95zcX0+aTuNLOyNGfXX5SDtSlFvm7EE7CmWAiA9KYTbnuFEYupTz
	Btt1OHDJNm9wR6dfnDWTXjQa1DZIS6klobqkHaaYZ5DjXmfy9HpLhskFupqEBzre
	Ej8jB8fR5d47dbkK4cjxEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787020023; x=
	1787023623; bh=XiEUlvEmeWP6nh6dSZFRttY647EdBPZicexK9dCA9co=; b=C
	oI7aTSwjdsWLSVPguwDtEC1y+cvPNXoprb8jvFzUNg92fj/dLxMH1INHpwzxOVB1
	q58m1HgPjNzxXv33tn6i9d1g8H3A7ORapA70JDNaYkgB1q0WBFOPoH4Hsv0yiKbm
	VFHPNLzINJ5NTT1StK1CgIn0L7pskHqCRb4/XR5lpzXmyGZ0ZSSKYD2IiGMeGgd6
	JGFSYEky9D0qDNAyloViOjn9ScGu6ixf1/WmVHR7aWPa9rnpdjtkR8txalEIKAC0
	ALBQJivVyCymDCglaZhuyaTwK8p0kApc/MNWtDGoqT4svNR8vVnk2oy8+lOrf2dV
	PbSR4oBFSvIe4un3/OuAQ==
X-ME-Sender: <xms:98KDapSQposAWC376Xh3OhtbabI6HsXNJs5dJBG7Ba1miwQhEDfu7A>
    <xme:98KDarmU-jqGrarObqXIsJtre4gLcdbT1X1rOxLR8lMnxPOLYY5pUU0vbPRqQC24F
    GehJydVeJArrZ5-miUtL30GG9MSZSP71u4xH4_K8hjczmteOUAptGs>
X-ME-Received: <xmr:98KDagI6rWTbj6DXP3HhBT40qPxLNusJmmH_RGmpQK8z4mJsRm8QtKqQ-KhihyKGXPtfYXf4AmqLBXbTy1DWLYq4>
X-ME-Proxy-Cause: dmFkZTE8tfDZNvyQYMwcuH586SFO+GnTrWud+XBMHjDGuXq38yhG4TaDP+s6a0R2mTd+lb
    0wlg2MfleOn3Qx5TPWOqnd5RWmXYf6FBQDI3sYjP9cFxbJzWAkbRG7qnAULAyAQrd3lAbc
    zCefyz2lWZevboIk9qtVk1zCdnZ4T3gCdtMkGlwjwz8IwyVy7Niesut+zioqkcItb+A999
    GUiqkCBmKvzE+apQu9FWtb100bTdRXtGb6StYcYIMj2sUatPk0iBiTQNcfYDPiwlUn8YKe
    2NfL06cuvM9LdoLfHZY49/jY6VL5ou9Qb8ph1rUY+9jaL0/2TOowtTqoWGrUyUKr1G/3Wp
    W6AFAAzSzDEWsyS0VhhgW+qdIwGooksGRFB42LTj/RX8ImoYkkpR1Iq1RuvMyF4QTCzvAn
    7yJz47wUWGAa2Ynu732R9jH7/PfwU7UypQIq0POOdWhzK0RjeStankBZq1DwKLEpUM9R20
    T1omuIvJ/7JJbSfhO68X7noAPPZot32BJiq6BXEUItS3SlvTfUUnqG2VuAHgJUf5YhhlMN
    SBsgXwDvUsP24feh51FrssAxFS9xCf7Jgr8fTsnUTF1b5JC5/M4nMOcaNB3lQTsBw3YGUk
    eU/jcV9M19c28e8AzTqHgbfLS4+7ru5pv7k29W3R80HCAtKi0Dfz4wRAW3ZA
X-ME-Proxy: <xmx:98KDamSD5lB55RVIUb8WoJU3XQRhJxFjqH3K8FJNt6NS9ZdmBtXO3A>
    <xmx:98KDamRxHQ_gDp-Tnnehe65v-cDkuKdQPd6TiWqGanqhr5V-lFCuRg>
    <xmx:98KDagy9vmnisJissN6FstKKGWJbARBA7oiLG7LdH1HqbDnvdvYjyQ>
    <xmx:98KDaksNjC7hyR_bccgbG3ASfmuO2nLja1y6z8P0rrcc-f70FtJ6sw>
    <xmx:98KDalwaWQmdkUxxAc4C-46obfWvkP9BUnYFqqjBstlzCLJG9ZD4Bwza>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 22:26:58 -0400 (EDT)
Date: Tue, 18 Aug 2026 11:26:56 +0900 (JST)
Message-Id: <20260818.112656.263099326344775009.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: gary@garyguo.net, tomo@flapping.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <875x18ahu6.fsf@t14s.mail-host-address-is-not-set>
References: <20260813134834.1562995-1-tomo@flapping.org>
	<DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
	<875x18ahu6.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 17:26:41 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Gary Guo" <gary@garyguo.net> writes:
> 
>> On Thu Aug 13, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>
>>> This series started from the review of patches 3 and 4 [1]: a hrtimer
>>> can be armed from any CPU at any time, including while its callback
>>> runs, so restricting HrTimer::expires() to the callback context is not
>>> by itself enough to remove the race.
>>>
>>> It turned out that expires() is not the only problem. A callback may
>>> also change its expiry time with hrtimer_forward(), which is sound
>>> only because __run_hrtimer() dequeues the timer for the duration of
>>> the callback. Arming the same timer from another CPU puts it back into
>>> the rbtree while the callback runs, so hrtimer_forward() then changes
>>> the expiry of a timer that is queued, without the base lock and
>>> without re-checking the ordering, which leaves the tree unsorted.
>>>
>>> Two of the four pointer types cannot construct that
>>> situation. Starting a Pin<Box<T, A>> moves the box into the handle,
>>> and starting a Pin<&mut T> consumes the exclusive borrow, so in both
>>> cases nothing is left to arm the timer with. Arc<T> is Clone and
>>> Pin<&T> is Copy, and both of their start functions are reachable from
>>> safe code, so safe Rust could arm a timer whose callback was running.
>>>
>>> "No arming while the callback runs" cannot be expressed in the type
>>> system, because the callback begins when the timer expires rather than
>>> at any point in the Rust program, so patches 1 and 2 use the stronger
>>> "no arming while armed" instead. hrtimer_cancel() waits for the
>>> handler to return, which makes that the point where the right to arm
>>> can be handed back. The right to arm is split out of Arc<T> into
>>> HrTimerArc<T> and out of Pin<&T> into HrTimerPin<'a, T>, both
>>> non-clonable and consumed by start, modelled on ListArc; the object
>>> itself stays shareable through plain Arc references and shared pinned
>>> references respectively.
>>>
>>> Patches 3 and 4 are the previously posted expires() and
>>> repr(transparent) patches, unchanged. With patches 1 and 2 in place,
>>> the callback context has no concurrent writer of node.expires. So
>>> HrTimerCallbackContext::expires() is sound.
>>
>> I am thinking about this and I wonder about a different approach: the only
>> reason that we're having this issue, is that `expires()` call and
>> `forward`/`forward_now` is executed outside the protection of the base lock.
>>
>> The fix is easy -- to ensure that they are executed with the base lock held.
>> The callback wants either:
>> * Do not restart the timer
>> * Call hrtimer_forward[_now] and restart the timer
>>
>> So, if we change the order from
>>
>>     unlock base
>>     restart = fn(timer)
>>     lock base
>>     if restart {
>>         queue
>>     }
>>
>> to
>>
>>     get expires
>>     unlock base
>>     restart = fn(timer, expires)
>>     lock base
>>     match restart {
>>         Restart(now, interval) => {
>>             hrtimer_forward(timer, now, interval);
>>             queue
>>         }
>>         NoRestart => (),
>>     }
>>
>> then we completely eradicate this issue.
>>
>> Alternatively, we can add another spinlock to protect `expires` from race
>> condition from within callback and concurrent restart -- that is what perf core
>> does: perf_mux_hrtimer_handler and perf_mux_hrtimer_restart uses the same
>> hrtimer_lock to prevent race.
> 
> With this solution we would have to restrict calls to `forward` and
> `expires`. Maybe that would be OK, but it would be restricting the API
> further.
> 
> As I understand the problem space, we have (on Rust side):
> 
>  - `start` and `forward` may race. `forward` is callable on exclusive
>    reference to HrTimer or in callback context, but otherwise lacks
>    synchronization. `start` is serialized on the base lock but is
>    callable at any time.
>  - `start` and `expires` may race because `start` writes the expiration and
>    `expires` reads it. The latter has no synchronization and is callable
>    on shared reference to `HrTimer`.
>  - `forward` and `expires` may race because `HrTimer::expires` takes a
>    shared reference and is callable at any time concurrently.
> 
> I think the solution suggested by Tomo is OK, but we could also add
> synchronization to `start`, `forward` and `expires` on the rust side.
> Would that not solve the problem for us?
> 
> This way we can still run the handler without lock. Only if we call
> `forward` or read the expiry in the handler would we take the lock.
> 
> This would allow the API as originally described on the rust side.

That would work, but I think it needs more than the lock. The lock makes
start and forward safe against each other, but one of them still loses. If
start runs first, hrtimer_forward() returns 0 and does nothing, so the
overrun it would have returned is lost. Some callers use that return
value.

perf and CFS bandwidth have a flag as well as a lock. The flag is "do
not arm while armed", which is the same rule the types enforce
here. rtc and the softlockup watchdog look like they cancel first and
then start instead. None of them arms a timer that is active, so I
would rather the abstraction did not allow it either. Does that seem
reasonable?
