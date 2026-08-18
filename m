Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94971463B98
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054382; cv=none; b=WVXNdUh6mKlHwRItlf6KqBpuO2S3FTmgdAyX57gCIRCU+80NqFH2z/YJabP753tN9CvU9Cp8jiFvpVjKtvdK2sPTiymMyliiPWDJX0O8fgl0x12WJS6hTTI9PfvipnP2ch+lIdsSqnoqpWUBT+oVXpgSvm0n8Mgi0eHMI/0Fo+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054382; c=relaxed/simple;
	bh=6RFn7eHHXWSv8fOIkxqqzHscgAQgJZqogOCgJkIvgiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=vGWny+b2vSP1dNMOwx0Y43qo37QQCPdjC/5dpWS5myCl+FU6nG7jWj3ro63CxiCtKKYCeSiSRsNaClJhJbq1oZ0OIkIzD5juCMQT+AV0wZq0hQ+iQs22gbI4em1jv6vQCsgy0B2yerc1va3AB9NnUgm6j7coHnpQNY+pv3xBpU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoI7tLk6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoI7tLk6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59661F000E9;
	Tue, 18 Aug 2026 11:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787054381;
	bh=6RFn7eHHXWSv8fOIkxqqzHscgAQgJZqogOCgJkIvgiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=AoI7tLk6K6/Nif0csbVWVLAYZqLF8VmsgEYanKIRux0G4qCD6B+K/d4M+X3UQy2oi
	 w6GghztFTwaRBCwJVZKrMm0QjFCjwZ4X0KyWw3Xa37HA0HFokgpV5K5ZqgNEgFS/M4
	 roe4kzaemguzyEMkdELLJbanV6RofkDrZcR6l4FeZp1wPExGel/xrxXJIGemumxPPN
	 qK0RO83nEr8bR2+fT6aw9xQFWYd/pkpewEOmoMsQ3NjXEUmvoSixdad5tLi0y4yW8q
	 g3RZjvb1P8HGuTZen0zsadNJHn80ICseO03y/GZ8KalIIW4rcfpja397c7ZwYM7uYH
	 ySKx2rs7RghIQ==
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
In-Reply-To: <20260818.202111.221982706607091751.tomo@flapping.org>
References: <875x18ahu6.fsf@t14s.mail-host-address-is-not-set>
 <20260818.112656.263099326344775009.tomo@flapping.org>
 <8733wbajj0.fsf@t14s.mail-host-address-is-not-set>
 <bAoCglwDHEBnzbZXVYa9FIwZTfbJ_4lMqFz-20jmYhwlUf7y6s8L5ev0Ezf3wc4r9HkvrqfnVY1LotFV6NwWfw==@protonmail.internalid>
 <20260818.202111.221982706607091751.tomo@flapping.org>
Date: Tue, 18 Aug 2026 13:59:30 +0200
Message-ID: <87pkzf8wrh.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"FUJITA Tomonori" <tomo@flapping.org> writes:

> On Tue, 18 Aug 2026 11:02:27 +0200
> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>
>>> perf and CFS bandwidth have a flag as well as a lock. The flag is "do
>>> not arm while armed", which is the same rule the types enforce
>>> here. rtc and the softlockup watchdog look like they cancel first and
>>> then start instead. None of them arms a timer that is active, so I
>>> would rather the abstraction did not allow it either. Does that seem
>>> reasonable?
>>
>> I am fine with preventing starting a timer that is Started or Running,
>> but I am not liking the `UniqueArc` requirement.
>>
>> I have a use case in `rnull` where I have to start a timer behind an
>> `Arc` with no way to obtain a `UniqueArc`, so I would prefer if that use
>> case keeps on working. Without this, I would have to allocate a box and
>> put it behind a lock, leading to double indirection.
>
> Before the UniqueArc requirement, I would like to check which timer
> you have in mind? The bandwidth timer, the per-command timer, or
> something else? The two seem to need different things, so I would
> rather not guess.

The bandwidth timer. It is started from an `Arc<NullBlkDevice>:
HasHrTimer`. If we make the suggested change to `ArcTimerHandle`, I
think I would need to change the `NullBlkDevice::bandwidth_timer` from
an embedded `HrTimer` to a `SpinLock<Box<HrTimer>>` or something like
that.

Maybe this is fine. I don't think it will affect performance for `rnull`
- this is already a throttled path. But it gives slightly more
convoluted code in the caller by reducing the way we can use the API.

>
> For the bandwidth timer I do not see where the handle would live, and that
> is independent of UniqueArc. start() returns a handle that cancels the
> timer when it is dropped, so it has to be kept somewhere, and the current
> hrtimer API is the same. queue_rq() only gets a shared borrow of the queue
> data, and the handle owns an Arc<T>, so putting it inside T means T holds a
> refcount on itself and is never freed.

The storage of the handle would not change.

Circular references to keep things alive can be fine.

For the completion timer, the change you propose would work fine I
think. I would just start the timer via the unique request reference
rather than the shared one. This is probably a better way to do it
anyway.


Best regards,
Andreas Hindborg


