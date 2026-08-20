Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE73C3C00
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787216433; cv=none; b=JQ6b/UtDVvMuTLlvi2IWj0vraBVB1ErrB7IeEKkSqzja8dm+LlL4tjiNSVYUFdN+lmNUyzKSgQ6Q0L8AkVqF7WKkTJYOQaNRxQEPK9OIqTz4EGJMpmt+MAptsqjV0MvcbFuHsCzx21QD7NjDpyV2vCdDV130BzfI13HojebWrn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787216433; c=relaxed/simple;
	bh=adm/s/+RtKBgaFVOLzTCJpZCTeeyaBngA24xtgfb6e8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P+00euDIAerHZLa25gmZqa/wjNeBfkUPaoKcC3W2auioY5w1AYf+dxLXedchyWtd+PrKvV10Xv4Y9A4rZrcKtIbATruUBnDomB16buYf60EYWaDRpRdRwWgLtei7M5FHoySj7zl79xxSEgpY7wNqI1H6fVLrTndQb/J4pfFondg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K6/So1bE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K6/So1bE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E631F000E9;
	Thu, 20 Aug 2026 09:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787216432;
	bh=Nat8vOtTANw66geXRChrTIxN8yU54BS99Wl+KdxNjQw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=K6/So1bEYOFzKY2kDRXhX5/SIu9YkDCC7pv+VYCkC3pQRGCnoK0PRnLg+YkvF2i+K
	 6kMyRY9pxIFZuAWAomy2oURRcZwNr6hqGyECYfqxlLD84PIB2bd2mECBJbELaJIhuv
	 DeCBQ04niTAhjTcs24hHCRfkZI/QvLZjAzLH7YnhcuU65Ntu01+fLOBwMKLJE0amxY
	 oV3Ptvhx5yTx+hjkiLOntFHWoUx57Fev0aWeN0dt3ZcwIWfVJvJexWwQagnZIiqipB
	 9wva66KndhBYJjSNlgkSm2QKV4Tm8J1cS4sdqRbuZERgM5H+Cnaul0VE+rM2bAcoQ1
	 g5Zd+GRQi0aLg==
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
In-Reply-To: <20260819.220106.1561543001385383760.tomo@flapping.org>
References: <bAoCglwDHEBnzbZXVYa9FIwZTfbJ_4lMqFz-20jmYhwlUf7y6s8L5ev0Ezf3wc4r9HkvrqfnVY1LotFV6NwWfw==@protonmail.internalid>
 <20260818.202111.221982706607091751.tomo@flapping.org>
 <87pkzf8wrh.fsf@kernel.org>
 <20260819.220106.1561543001385383760.tomo@flapping.org>
Date: Thu, 20 Aug 2026 11:00:21 +0200
Message-ID: <87h5kp88uy.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

FUJITA Tomonori <tomo@flapping.org> writes:

> On Tue, 18 Aug 2026 13:59:30 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>> 
>>> On Tue, 18 Aug 2026 11:02:27 +0200
>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>
>>>>> perf and CFS bandwidth have a flag as well as a lock. The flag is "do
>>>>> not arm while armed", which is the same rule the types enforce
>>>>> here. rtc and the softlockup watchdog look like they cancel first and
>>>>> then start instead. None of them arms a timer that is active, so I
>>>>> would rather the abstraction did not allow it either. Does that seem
>>>>> reasonable?
>>>>
>>>> I am fine with preventing starting a timer that is Started or Running,
>>>> but I am not liking the `UniqueArc` requirement.
>>>>
>>>> I have a use case in `rnull` where I have to start a timer behind an
>>>> `Arc` with no way to obtain a `UniqueArc`, so I would prefer if that use
>>>> case keeps on working. Without this, I would have to allocate a box and
>>>> put it behind a lock, leading to double indirection.
>>>
>>> Before the UniqueArc requirement, I would like to check which timer
>>> you have in mind? The bandwidth timer, the per-command timer, or
>>> something else? The two seem to need different things, so I would
>>> rather not guess.
>> 
>> The bandwidth timer. It is started from an `Arc<NullBlkDevice>:
>> HasHrTimer`. If we make the suggested change to `ArcTimerHandle`, I
>> think I would need to change the `NullBlkDevice::bandwidth_timer` from
>> an embedded `HrTimer` to a `SpinLock<Box<HrTimer>>` or something like
>> that.
>> 
>> Maybe this is fine. I don't think it will affect performance for `rnull`
>> - this is already a throttled path. But it gives slightly more
>> convoluted code in the caller by reducing the way we can use the API.
>
> I think we can allow creating HrTimerArc<T> from Arc<T>, so that UniqueArc is
> not required. ListArc does the same with AtomicTracker, an atomic bool in the
> object that records whether a ListArc exists:
>
>     HrTimerArc::try_from_arc(Arc<T>) -> Result<HrTimerArc<T>, Arc<T>>
>
> It fails when there is already another HrTimerArc for the object.
>
>> For the completion timer, the change you propose would work fine I
>> think. I would just start the timer via the unique request reference
>> rather than the shared one. This is probably a better way to do it
>> anyway.
>
> Agreed.

We discussed this at the call last night. We came to the conclusion that
we would like to experiment with the solution outlined by Gary, where we
inject `expires` into the callback handler, and the callback handler
returns a forward duration in addition to a restart value. Because with
that approach, we can avoid adding complexity to the Arc end of the API.

For the best implementation of this scheme, we probably need to change
some bits in the C code, add an additional path. Down the line, we could
also see how man callers of the C code can be changed to use this
pattern.

Do you want to send a patch based on this solution Tomo?


Best regards,
Andreas Hindborg


