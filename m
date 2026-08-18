Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D446838F226
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043759; cv=none; b=SW2qn1CQH1Lai6T0K4rGQkAaG1x5WFnGKfn00SN4tVCeq5e3KuEJfNZ3S9QlOzQYC5aCh1sdVcAwhxk1ifGfyNtXDTZgLjSfjQLetUPxU7jhA5g7o8hqESjSxDYazmLm3geUDwnYCeTuesdlbMO9h4FGKrTIH975jJFJthD9eQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043759; c=relaxed/simple;
	bh=lASukHDQpWME1cL0HrPjFOVFPAEnGDSM4DrZrm9S9Ns=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cZpKrAOMkD84hhyz66EfBoxYUUbfR11ruXXP3Qv3eR2CV2kKrFqGjfuD3A35ilHaefQkpuRAeWOuiI5ZUZzIQiucoydAfo7ei9bzHASkwgA+rZc74h8pM/d5t0FyXL+q3MNlkdLz+Ib+C3u1lEt8aNC/06zae+4ZvyuzgIWdQyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dz4c6LbG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dz4c6LbG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 333C81F000E9;
	Tue, 18 Aug 2026 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787043757;
	bh=Qzj0yiDhDiSjBCR2gw8Fx8o1YxLTTP5klVOfqN9JafY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Dz4c6LbGIFE8uI/04wkAtHE0GmqBjagDBx2g4E5hlyl5X/743Y85tja1n7yV62cew
	 5fcjnZiPKJEXF62zhrNSHADPuPuNsFcJ3qun0Ve3+4fDZsl7bhBO+CLKxKOEmKweBq
	 EnlFN3kCjXUWXOcUR4K+biztOft2syCHbZKgzx/QdLA0vjCMbiZOIFa88n4eq1qfOK
	 XmSwZHQL8Qm5CHeH4KYgi+hnO5uYLkQsoewLIuNrmY6y+gsKazcSnSMkXAd1QCmg/Z
	 Uof9j14mssp+VWW8I7lviPBsaHSDdqzawBiTbG/UjXYrmYjAMCVk1W+u4MVlPf6OOT
	 wH8H4EPYzWcUw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: gary@garyguo.net, tomo@flapping.org, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent arming
In-Reply-To: <20260818.112656.263099326344775009.tomo@flapping.org>
References: <20260813134834.1562995-1-tomo@flapping.org>
 <DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
 <875x18ahu6.fsf@t14s.mail-host-address-is-not-set>
 <20260818.112656.263099326344775009.tomo@flapping.org>
Date: Tue, 18 Aug 2026 11:02:27 +0200
Message-ID: <8733wbajj0.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Mon, 17 Aug 2026 17:26:41 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "Gary Guo" <gary@garyguo.net> writes:
>> 
>>> On Thu Aug 13, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
>>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>
>>>> This series started from the review of patches 3 and 4 [1]: a hrtimer
>>>> can be armed from any CPU at any time, including while its callback
>>>> runs, so restricting HrTimer::expires() to the callback context is not
>>>> by itself enough to remove the race.
>>>>
>>>> It turned out that expires() is not the only problem. A callback may
>>>> also change its expiry time with hrtimer_forward(), which is sound
>>>> only because __run_hrtimer() dequeues the timer for the duration of
>>>> the callback. Arming the same timer from another CPU puts it back into
>>>> the rbtree while the callback runs, so hrtimer_forward() then changes
>>>> the expiry of a timer that is queued, without the base lock and
>>>> without re-checking the ordering, which leaves the tree unsorted.
>>>>
>>>> Two of the four pointer types cannot construct that
>>>> situation. Starting a Pin<Box<T, A>> moves the box into the handle,
>>>> and starting a Pin<&mut T> consumes the exclusive borrow, so in both
>>>> cases nothing is left to arm the timer with. Arc<T> is Clone and
>>>> Pin<&T> is Copy, and both of their start functions are reachable from
>>>> safe code, so safe Rust could arm a timer whose callback was running.
>>>>
>>>> "No arming while the callback runs" cannot be expressed in the type
>>>> system, because the callback begins when the timer expires rather than
>>>> at any point in the Rust program, so patches 1 and 2 use the stronger
>>>> "no arming while armed" instead. hrtimer_cancel() waits for the
>>>> handler to return, which makes that the point where the right to arm
>>>> can be handed back. The right to arm is split out of Arc<T> into
>>>> HrTimerArc<T> and out of Pin<&T> into HrTimerPin<'a, T>, both
>>>> non-clonable and consumed by start, modelled on ListArc; the object
>>>> itself stays shareable through plain Arc references and shared pinned
>>>> references respectively.
>>>>
>>>> Patches 3 and 4 are the previously posted expires() and
>>>> repr(transparent) patches, unchanged. With patches 1 and 2 in place,
>>>> the callback context has no concurrent writer of node.expires. So
>>>> HrTimerCallbackContext::expires() is sound.
>>>
>>> I am thinking about this and I wonder about a different approach: the only
>>> reason that we're having this issue, is that `expires()` call and
>>> `forward`/`forward_now` is executed outside the protection of the base lock.
>>>
>>> The fix is easy -- to ensure that they are executed with the base lock held.
>>> The callback wants either:
>>> * Do not restart the timer
>>> * Call hrtimer_forward[_now] and restart the timer
>>>
>>> So, if we change the order from
>>>
>>>     unlock base
>>>     restart = fn(timer)
>>>     lock base
>>>     if restart {
>>>         queue
>>>     }
>>>
>>> to
>>>
>>>     get expires
>>>     unlock base
>>>     restart = fn(timer, expires)
>>>     lock base
>>>     match restart {
>>>         Restart(now, interval) => {
>>>             hrtimer_forward(timer, now, interval);
>>>             queue
>>>         }
>>>         NoRestart => (),
>>>     }
>>>
>>> then we completely eradicate this issue.
>>>
>>> Alternatively, we can add another spinlock to protect `expires` from race
>>> condition from within callback and concurrent restart -- that is what perf core
>>> does: perf_mux_hrtimer_handler and perf_mux_hrtimer_restart uses the same
>>> hrtimer_lock to prevent race.
>> 
>> With this solution we would have to restrict calls to `forward` and
>> `expires`. Maybe that would be OK, but it would be restricting the API
>> further.
>> 
>> As I understand the problem space, we have (on Rust side):
>> 
>>  - `start` and `forward` may race. `forward` is callable on exclusive
>>    reference to HrTimer or in callback context, but otherwise lacks
>>    synchronization. `start` is serialized on the base lock but is
>>    callable at any time.
>>  - `start` and `expires` may race because `start` writes the expiration and
>>    `expires` reads it. The latter has no synchronization and is callable
>>    on shared reference to `HrTimer`.
>>  - `forward` and `expires` may race because `HrTimer::expires` takes a
>>    shared reference and is callable at any time concurrently.
>> 
>> I think the solution suggested by Tomo is OK, but we could also add
>> synchronization to `start`, `forward` and `expires` on the rust side.
>> Would that not solve the problem for us?
>> 
>> This way we can still run the handler without lock. Only if we call
>> `forward` or read the expiry in the handler would we take the lock.
>> 
>> This would allow the API as originally described on the rust side.
>
> That would work, but I think it needs more than the lock. The lock makes
> start and forward safe against each other, but one of them still loses. If
> start runs first, hrtimer_forward() returns 0 and does nothing, so the
> overrun it would have returned is lost. Some callers use that return
> value.

We can put the lock on the rust side of things. Existing C callers would
not be affected. Calling `forward` from the handler and racing a `start`
from outside needs handling anyway. The zero return value would be an
indicator.

> perf and CFS bandwidth have a flag as well as a lock. The flag is "do
> not arm while armed", which is the same rule the types enforce
> here. rtc and the softlockup watchdog look like they cancel first and
> then start instead. None of them arms a timer that is active, so I
> would rather the abstraction did not allow it either. Does that seem
> reasonable?

I am fine with preventing starting a timer that is Started or Running,
but I am not liking the `UniqueArc` requirement.

I have a use case in `rnull` where I have to start a timer behind an
`Arc` with no way to obtain a `UniqueArc`, so I would prefer if that use
case keeps on working. Without this, I would have to allocate a box and
put it behind a lock, leading to double indirection.

If we can fold in this logic into the API, callers can be simpler.

Best regards,
Andreas Hindborg


