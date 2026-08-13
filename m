Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8893376A07
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 23:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786664833; cv=none; b=WZ1UQ0AdkBM1YY9/AkUElWL1/giF88D5IEFIu6Jmv5Vs9kYLPVs8K6EXxI3f/SWcu7KGUeYfxmg+6rxh1Sy0Vz8FLlFp37FiYbd5bReQIhF4Jyc5ZK8W1QfF+SKdvfSwJuN/52bi95gTTarkrexG+6FO/NcXxNQb3pj1ft4qDg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786664833; c=relaxed/simple;
	bh=soJmqp4rGHemVKOSuvUrgWb+xHnZSG9jg237kjHt/Q0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=Kgk9XqsvET+4eol3zC7XchiC6BpuaFKkvefZsNh12YmJoL3IBXmxpeIDIbj460ZWjfujJuD5A1HkTfEHzSIU2pRXVE57kzPN1zYPQ54fbUrvJXjGnvwxPcr9sxsQCxfoq7q/sUvefU2klJH/MYY7e1tS46C4buouJ7sqCXYiL/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=oao6PJx/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BngfGieF; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="oao6PJx/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BngfGieF"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailflow.stl.internal (Postfix) with ESMTP id 909BE13002FA;
	Thu, 13 Aug 2026 19:47:09 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-09.internal (MEProxy); Thu, 13 Aug 2026 19:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786664829;
	 x=1786668429; bh=RaGzvitUij7fx2pyse0v4yfZui12v4BZf0n5RjcwAQE=; b=
	oao6PJx/VJoX9nhkvkZTDfjNjETT/iGfuMjT2U1ZxrbYkPMxQEnZRxIl2WAM97fh
	W3oAIYFz4Rtu2MGoOSqjAKW5lACmtrcX7oXW4FmBXr2l/RNoyRxWuacA86HqFdyL
	8iDEBIeba22Ygc26MHARco7e8kcxQIeEPGYg8BAiY121v30RqiB9tj27nyYfpyfH
	8Og0KTf0Va05WSSTjENS2e2v2MKyPjEKLMb6/1zII2kSMmhKPw2yzlYQCtJ6TzDU
	NQvJRXU0ZMWcBDQBuJ6ofXw+SBUo5BfJgK7EwYAjB5KCjkNc4PC/75TfTxnv0pBa
	dpX3Cyw7Q6wVRPnBtMwdFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786664829; x=
	1786668429; bh=RaGzvitUij7fx2pyse0v4yfZui12v4BZf0n5RjcwAQE=; b=B
	ngfGieFrYOQbwcWCbfLaX2N9l2/qUfwZv4h7wfSRWFLcKGjzXk4cDPSf8Mhfi8dO
	OTmotYCqFO9aFByeuVWsJ2KYaxgGmfJN3RJpo0uyIs9rdSElP6j4Oa+BRYS+u9sb
	Njv7kkO6yWWtp1pEm8KOyVjJ4ij9/gpT8WN4isAPV8m4PVB845mW3TyJdlRLc66T
	MZIsVWnKv9QkHilPtosNqCGUdBCxeeT30+1GKWjyy+oeqlI9asG7dDKeysM4aUiK
	JGbKSROq32Q9ztag3iAv6CC3wsrR/tJX0M31dY/JVEaSi470gZALOvvA/9bU8MIl
	AETrYUH/32VL7L08PIGRg==
X-ME-Sender: <xms:fFd-alfH16dyeetpLPjeatb_HyJTgqx_NyanWZw3bewE1vwGVwWCnw>
    <xme:fFd-ajm-OlRV88e6YIqOco7mG8X7uTJYI6VGsukuCSjAddfa5cBwFt9lwm70MHQS2
    zCy9dcQUPhWywBTybGtsaYbdxAtMz5AOtP0r5FT9E9U-wWZWdFx0lk>
X-ME-Received: <xmr:fFd-avpBMO2lrT2hck4m_GajXq_uNjMNz6SPTve3dPIeGFTUdCmrC6FcIu1LG6ArMp_s89b8_8WD33X3uCPXNYAm>
X-ME-Proxy-Cause: dmFkZTFEzRbIn8dceyxH87qLf8vJQ1T0OR969MKV2IQKzoMPsPttzSaawT0suGQBzQq/EY
    piWjIjDWSeTY+dL4766sKrk/2azYj9GPNZ7daXwX7ouqqZ6+g+OCYYJhJqHOFUo5h8FSUo
    QxLmjgHOg8CmBuIVN5FQTtPuWLNI79L/TmVs1jwN7j0mlxC+xmoxvu/uWsTO5OCTE4GwBY
    f6OmITEqnclnbQ0RqlkllNIHjaIuxp67alvYo+pwuoQA/MrzZjYVZms5BMAr53JP8yb6i9
    iAxo/4Em2Tten2fZ7ZvugrYwatvAQIMd0vumR4GDnfzocwts/1/VIuZ9Zn/DCT9N25wmGK
    sVvlhVjaTk9LKik5Ezj/gzJvfahMsrX4e4q/IzUj+rsjgfw7oR+bWTsazG9o0ctI+NHwXK
    u8O/WOqW7+fY5NADjUqu78pOi66O5nxW2+8jBYIF+kLb9k/7s87lZaA7BUoXizLtg0laYp
    4m4753bGd4z+b7WhNJAA0r/Ko9wLv01zk10LseaJGwtIMOsnI+8k5NyELo3AHDCp6u2xkI
    KBrBqo80f1acqjyh548XEJpqg/sdgNccz3O/A3cTSh6AAPIib91z4tjwZM8kYma0w10wlJ
    1Ai3DPgnykcimDz7u7K1SIynEDgBLuxdUXgk7pWcAPjyPsytQte+/zNW4ttg
X-ME-Proxy: <xmx:fFd-aq9kHJX9RjfELI9By4RdjPzV5BuXAli8dsEI6BlD_Q4LOtjrFA>
    <xmx:fFd-ag0dDy62iCNMwx0Sjbm8cz26R5dgR0ZdP9nZ41J2l7kLqIB0uw>
    <xmx:fFd-alm0QOlpJXjUNDyMdptw6eGmDIXA128Gu6RdMAr4Jyb4Uh2ulA>
    <xmx:fFd-al1dxihrF3JduWAJSMCmEz0apFqgNypkso1ChnE6C1gxtgoMlw>
    <xmx:fVd-akoiH59a3zffn3z9SQpjjwp-UEBG_V0I6-N2ISbIFtjeHuxUkDpY>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 19:47:04 -0400 (EDT)
Date: Fri, 14 Aug 2026 08:47:00 +0900 (JST)
Message-Id: <20260814.084700.1697518597717457311.tomo@flapping.org>
To: gary@garyguo.net, anna-maria@linutronix.de, frederic@kernel.org,
 tglx@kernel.org
Cc: tomo@flapping.org, a.hindborg@kernel.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent
 arming
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
References: <20260813134834.1562995-1-tomo@flapping.org>
	<DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 13 Aug 2026 15:16:38 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Thu Aug 13, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> This series started from the review of patches 3 and 4 [1]: a hrtimer
>> can be armed from any CPU at any time, including while its callback
>> runs, so restricting HrTimer::expires() to the callback context is not
>> by itself enough to remove the race.
>>
>> It turned out that expires() is not the only problem. A callback may
>> also change its expiry time with hrtimer_forward(), which is sound
>> only because __run_hrtimer() dequeues the timer for the duration of
>> the callback. Arming the same timer from another CPU puts it back into
>> the rbtree while the callback runs, so hrtimer_forward() then changes
>> the expiry of a timer that is queued, without the base lock and
>> without re-checking the ordering, which leaves the tree unsorted.
>>
>> Two of the four pointer types cannot construct that
>> situation. Starting a Pin<Box<T, A>> moves the box into the handle,
>> and starting a Pin<&mut T> consumes the exclusive borrow, so in both
>> cases nothing is left to arm the timer with. Arc<T> is Clone and
>> Pin<&T> is Copy, and both of their start functions are reachable from
>> safe code, so safe Rust could arm a timer whose callback was running.
>>
>> "No arming while the callback runs" cannot be expressed in the type
>> system, because the callback begins when the timer expires rather than
>> at any point in the Rust program, so patches 1 and 2 use the stronger
>> "no arming while armed" instead. hrtimer_cancel() waits for the
>> handler to return, which makes that the point where the right to arm
>> can be handed back. The right to arm is split out of Arc<T> into
>> HrTimerArc<T> and out of Pin<&T> into HrTimerPin<'a, T>, both
>> non-clonable and consumed by start, modelled on ListArc; the object
>> itself stays shareable through plain Arc references and shared pinned
>> references respectively.
>>
>> Patches 3 and 4 are the previously posted expires() and
>> repr(transparent) patches, unchanged. With patches 1 and 2 in place,
>> the callback context has no concurrent writer of node.expires. So
>> HrTimerCallbackContext::expires() is sound.
> 
> I am thinking about this and I wonder about a different approach: the only
> reason that we're having this issue, is that `expires()` call and
> `forward`/`forward_now` is executed outside the protection of the base lock.
> 
> The fix is easy -- to ensure that they are executed with the base lock held.
> The callback wants either:
> * Do not restart the timer
> * Call hrtimer_forward[_now] and restart the timer
> 
> So, if we change the order from
> 
>     unlock base
>     restart = fn(timer)
>     lock base
>     if restart {
>         queue
>     }
> 
> to
> 
>     get expires
>     unlock base
>     restart = fn(timer, expires)
>     lock base
>     match restart {
>         Restart(now, interval) => {
>             hrtimer_forward(timer, now, interval);
>             queue
>         }
>         NoRestart => (),
>     }
> 
> then we completely eradicate this issue.

If I understood the proposal correctly: hrtimer_forward[_now]() would no
longer be called by drivers at all. It becomes internal to the core and
runs with the base lock held, and every hrtimer callback in the tree is
updated to take the expiry as an argument and return the interval, with
the ones that use the overrun computing it from what they were passed.

That could remove the need for the rule on the Rust side.

Anna-Maria, Frederic, Thomas: does this direction look reasonable to you?


> Alternatively, we can add another spinlock to protect `expires` from race
> condition from within callback and concurrent restart -- that is what perf core
> does: perf_mux_hrtimer_handler and perf_mux_hrtimer_restart uses the same
> hrtimer_lock to prevent race.

Right, with the lock and cpc->hrtimer_active flag together, perf
implements the same "do not arm while armed" rule that these patches
implement in the type system.


> But further complicating the type system to prevent concurrent restart sounds
> like a bad approach to me.

My intent is the opposite: I think this makes the design simpler.

All four implementations of start() already take self by value. For
Pin<Box<T, A>> and Pin<&mut T> that means what it says -- the box is moved
into the handle, the exclusive borrow is consumed -- so "no arming while
armed" is already the design there. For Arc<T> and Pin<&T> the same
signature meant nothing, because Clone and Copy let you build another
pointer and call start() again.

So the contract depended on which pointer type you picked, and the module
documentation had to spell that out: "When a type implements both
HrTimerPointer and Clone, it is possible to issue the start operation
while the timer is in the started state." After the series there is one
rule for all four types, and that paragraph is gone together with the
restart operation it described.

