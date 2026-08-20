Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A2A43E067
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 12:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229272; cv=none; b=XvUTZfYRdHKQpnPUTu7dKW/Lzj/O4Gx0Uu9HuDt7l1igYMq87ZLHMWTdO+IYDByFuqHqYNBmowAcp6Ra40IHbAoMS7uqMpR+gDnMDCdnGIJ0C8mN+tZX1qIUCiEw2/rwArdZBqes2QGUSOCfaF+9JGWM23zBsvnDu9bto0A8UWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229272; c=relaxed/simple;
	bh=JnNsIZ1Gqu0FixG9eDvmakWd9Xx0X5u8x7SaDi67hdM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j3tNXwXvqTat4QhjRpV/MwtVHo9jJHRwwMHLjSSyKiNUiqYRoar53nTAtY1KGsm/+/zSbilt0njtji+Y2UHH3fTiCGkflbKWZZVjVXOoaDH7NZipQCvqsTtnZyCEM3TbVKaXYfDnbVWhF5b0eOQL19QPjSRRn6HOLTds6Wljon0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7mAn6H7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7mAn6H7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5052B1F00A3A;
	Thu, 20 Aug 2026 12:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787229271;
	bh=q9Ej7H2F39PfgeWeOyap8sUbX04PjKCTBGqmWazxFlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=G7mAn6H7zuoy8wpkO9mQqvDpu5CtEAwsSLbXDoEH2Lb6RjqTC60PIdigc1G6Sp2Vp
	 Ixsj/bz8uzbut5e97aCk52RMgNHaaWWfJPb85c3WimuTxaO9UaxewGqss6vbFDythn
	 cYTgF4ULw33hwSguBGxaCS6ZbFnaKF8umCmCtu4B1TPQBtLUp7ltIYfGTWaGmIjkdU
	 dpyQQmqqdamnUOvu8mhuv7+rDDtr1Th65YI4Mzd9XbCBAUroSZ9s4t2AcY1IRx/rsy
	 fdf232VrtrljGxMmpYHkT3iwX2mAS8Hkqm+nMzO/Q1SDHxo/8r9BpzvBT0pMExzuPc
	 p6ur9mxOd67+Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: FUJITA Tomonori <tomo@flapping.org>
Cc: tomo@flapping.org, gary@garyguo.net, ojeda@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org,
 tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH 0/4] Fix forward()/expires() racing with concurrent arming
In-Reply-To: <20260820.182114.956582163653669626.tomo@flapping.org>
References: <87pkzf8wrh.fsf@kernel.org>
 <20260819.220106.1561543001385383760.tomo@flapping.org>
 <87h5kp88uy.fsf@kernel.org>
 <20260820.182114.956582163653669626.tomo@flapping.org>
Date: Thu, 20 Aug 2026 14:34:16 +0200
Message-ID: <87ecft7yyf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Thu, 20 Aug 2026 11:00:21 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> FUJITA Tomonori <tomo@flapping.org> writes:
>> 
>>> On Tue, 18 Aug 2026 13:59:30 +0200
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>>>> 
>>>>> On Tue, 18 Aug 2026 11:02:27 +0200
>>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>>
>>>>>>> perf and CFS bandwidth have a flag as well as a lock. The flag is "do
>>>>>>> not arm while armed", which is the same rule the types enforce
>>>>>>> here. rtc and the softlockup watchdog look like they cancel first and
>>>>>>> then start instead. None of them arms a timer that is active, so I
>>>>>>> would rather the abstraction did not allow it either. Does that seem
>>>>>>> reasonable?
>>>>>>
>>>>>> I am fine with preventing starting a timer that is Started or Running,
>>>>>> but I am not liking the `UniqueArc` requirement.
>>>>>>
>>>>>> I have a use case in `rnull` where I have to start a timer behind an
>>>>>> `Arc` with no way to obtain a `UniqueArc`, so I would prefer if that use
>>>>>> case keeps on working. Without this, I would have to allocate a box and
>>>>>> put it behind a lock, leading to double indirection.
>>>>>
>>>>> Before the UniqueArc requirement, I would like to check which timer
>>>>> you have in mind? The bandwidth timer, the per-command timer, or
>>>>> something else? The two seem to need different things, so I would
>>>>> rather not guess.
>>>> 
>>>> The bandwidth timer. It is started from an `Arc<NullBlkDevice>:
>>>> HasHrTimer`. If we make the suggested change to `ArcTimerHandle`, I
>>>> think I would need to change the `NullBlkDevice::bandwidth_timer` from
>>>> an embedded `HrTimer` to a `SpinLock<Box<HrTimer>>` or something like
>>>> that.
>>>> 
>>>> Maybe this is fine. I don't think it will affect performance for `rnull`
>>>> - this is already a throttled path. But it gives slightly more
>>>> convoluted code in the caller by reducing the way we can use the API.
>>>
>>> I think we can allow creating HrTimerArc<T> from Arc<T>, so that UniqueArc is
>>> not required. ListArc does the same with AtomicTracker, an atomic bool in the
>>> object that records whether a ListArc exists:
>>>
>>>     HrTimerArc::try_from_arc(Arc<T>) -> Result<HrTimerArc<T>, Arc<T>>
>>>
>>> It fails when there is already another HrTimerArc for the object.
>>>
>>>> For the completion timer, the change you propose would work fine I
>>>> think. I would just start the timer via the unique request reference
>>>> rather than the shared one. This is probably a better way to do it
>>>> anyway.
>>>
>>> Agreed.
>> 
>> We discussed this at the call last night. We came to the conclusion that
>> we would like to experiment with the solution outlined by Gary, where we
>> inject `expires` into the callback handler, and the callback handler
>> returns a forward duration in addition to a restart value. Because with
>> that approach, we can avoid adding complexity to the Arc end of the API.
>> 
>> For the best implementation of this scheme, we probably need to change
>> some bits in the C code, add an additional path. Down the line, we could
>> also see how man callers of the C code can be changed to use this
>> pattern.
>> 
>> Do you want to send a patch based on this solution Tomo?
>
> https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/
>
> The solution that we discussed before, right? It changes how the
> hrtimer core calls the callback. If the C maintainers take that, I
> will do the Rust side for it.

Yes this one. We don't know if C maintainers will like it. We were
discussing having a separate path on the C side just for just,
alternatively converting C side callers.

I think we should be able to reach some kind of agreement with C
timekeeping. But if not, we can solve it on rust side only, but less
efficient. We can grab the base lock again, read expires, then drop the
lock. But better to do it in the C code.

> So we leave this race as it is until we know whether the solution is
> accepted?

I guess so. There are no in-tree users that trigger this anyway.

Best regards,
Andreas Hindborg


