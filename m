Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1F1353A70
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 01:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787016925; cv=none; b=eCz2XFdLLKnlZWIJOhB0dSxg3w4gqmmqiaOxIYXIPdkHr2vp1ORuDLcZARSmKf87oi3TdibJOiy5xQ3HJ8OvJ5eIeZhhhPElEOWnSJwFWlK9K677+37sfofHVw/AxWOe4itBJwGRKZl3CTd6WGgOXFvhlkzr1x8i2ZnOJoXy4fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787016925; c=relaxed/simple;
	bh=y/P4LblDp61HXe5UQUctWnGhlfp/92SaHPOoWyM5sys=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=I1WiCT2G0N8QxgVXSzQ7lcceuXyDvMLMxnHwWfX5eL8D+IkXGTz4whXMZ77an00Bb32tOLeeYQ15k4d2ZxnY/RHoxFZ1jcbMXZmjGFoLlgw9d11fyLF2aCmZ5vAgJHGgeJt4p5cv+eLYidbrMtaoUAGF1CFb959AYtk200QOC4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=KWX2pgxN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=H+AFDf8F; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="KWX2pgxN";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="H+AFDf8F"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id A6A3B130062E;
	Mon, 17 Aug 2026 21:35:20 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 17 Aug 2026 21:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787016920;
	 x=1787020520; bh=2IAVNVAe809Cm7CA4sF9ndKc9xuNRahWZSVN/P63swc=; b=
	KWX2pgxNJtu4GvSU8Av8j4aJQOUrX9NtPt83ywZkE3jn1Zqg7fbUKaRuP46F3tUo
	nW6b4n7+93FCZWGykIGdDnpL1AXrB3ITCMtHPPsHm+Jemkywkoj61yT+kDZLE3xT
	vUaD2l4b765ZzMRtILQ8tcxUM5bijSvlUPf1YyZuVZ4kvMFSmUMOz+yuxXlsT3ab
	IQ/1y4nUGvRI6rhyMxoknBDwZYlkkEf/QJZ9zPT25psd0yNGbeilN5/dBT/ttLPV
	xuiqdooEzZdTKXFoq2RQVdPJfxs5w5h538dnasXWrDdYB78X04Grzb8hbzf8AAwR
	Gn8VGPm3hhQ5YBPKw1+CjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787016920; x=
	1787020520; bh=2IAVNVAe809Cm7CA4sF9ndKc9xuNRahWZSVN/P63swc=; b=H
	+AFDf8F/F+zY/FnK31yN6KUdyoV3YxPvglsGP3lrtxBzYqk1+/zPKqDVIcFTV13b
	ecgSc3olT7plC43dmcptFI0nq2SATqW9F9qX0tFwPoepoafzjogmSLuLHBcZpfrR
	Q0T6mu+/BDI/40qdfBkE+t2WnV6SscLk24EHeViCcWf7m8fQgnqyauXJFaie9XcX
	qe2g+SzJubLetxDoq9ZNlqi8QsQXFJXdzSLf+1cHfO8zLLowhVWTCjMD02YC3LIS
	41n2Qmy7040xquCZ7QQfVzImae7CacNZ8JZdUjm6+4MLl/lB3Fphi9Iv/RHoyyxH
	SqLrRhbW9wrJuCrIPY2rg==
X-ME-Sender: <xms:17aDauesrJikRqY8-KA4QjFcHGuNL2KBr0IHqonpArWnr81fxIsyFQ>
    <xme:17aDaonc36UoFmbH7LCsDZ7BGSs3NvOI2czqQNo2Ily1eEYGqG2s3M9M0HtpGt5Ob
    keGRWw1bTPVhwzo5jY5bHdS2hUH28L1735VS--3R2dnSS4YBJgioO82>
X-ME-Received: <xmr:17aDagoKelsA6GKzVKQFLgwvfjaPTGNMMedlT_qwtFcpowXcsFuPoSDFUEaoTAFcxtQj3VWmXD-_zOZ1LED-aEoy>
X-ME-Proxy-Cause: dmFkZTE4Vj1ohbXoJ8aodp37uKSVf9qtj2QcngQj3e/qQQYL+tlIfwkHkNJi2mQc5wndKO
    SZdLuf3hZZnFSjdDfYCRUIUYD9LTaYizSnMShRh9yNQoHoR6e3TQx7wohlR/+bRbFD/NTU
    ynJlgN/50he1kaf+cMlGAfWv68ybfuFrMmN9QVutUc21Q8cHxGA+WO/oj4q52bqaZLmEXB
    69IA+aQ8gc0d0BY39nBEume4IAZ5raiNh+29WP14M3fEnan+hWE5oRFm18+XWErBhbIeAD
    pWetjh4iV79OAmYMODMwXcPZCC7iy5jyz78yHjIxDhb6Yj+lXWmOTPwZaDjLkTt+uxB2WH
    qfBGgHFUyyDg+lmfLcHAGNunbIa5393cNZbm6iWf3FQG0ea+EGcqs7YUzXxRhr3Bwnc1jQ
    ZXhB81zl/pPtfNMQoXuK6fEh4UOPe3zaqRbTXbYfAWBvrzc/tf5Se4kPQ1D+OWiR0YkJcf
    /RyIa8P7H+MU/YNJ2Aa8pv58gzmsk6izPTyeG80pgBdug320lWVgiqIqwOFx4/OCVsY3pD
    FfW5JZmFQeDdBg5A3hkdOuhykF5KDqJaIbzp5iMQ8xOM539M8xEJTxlv//M+mP7JvupjCQ
    KzFMQVW2YcPsHEsaB9EgC8g23WcLUoG4uWIC+YOZfZHbEnUhyIkgp9yByI2Q
X-ME-Proxy: <xmx:17aDan_zBCPBh8oR3VwOsDUh5pkbj6Sssv9SyEx8TXTl9ECMFQ56AQ>
    <xmx:17aDap3LIpLSWmW763e3IAHA9JzaylTyZvs-kE3yBnA_iZt7P5Ui2Q>
    <xmx:17aDaqlnNwHCBdmjRxwtL1WGIBqvlV3C7F8Ufh5d6Ua-7tNbv_YZZg>
    <xmx:17aDam2Wqq8t46P3U5f2ZXw49HD8a5x_IuZ7PrbMyQMSubzuGi3D8A>
    <xmx:2LaDahr1Li9v5_4j9ibz4BL1zbI6Dew9DZB-7xH0_FWMOrMVrjfMYvpJ>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Aug 2026 21:35:15 -0400 (EDT)
Date: Tue, 18 Aug 2026 10:35:13 +0900 (JST)
Message-Id: <20260818.103513.1684801352907009336.tomo@flapping.org>
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
In-Reply-To: <DKRBZK4LSHUB.1DWO0TH9QXO4R@garyguo.net>
References: <DKO995UPAESG.UQNZ5G92HCPQ@garyguo.net>
	<20260814.224838.67768463960169120.tomo@flapping.org>
	<DKRBZK4LSHUB.1DWO0TH9QXO4R@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 17 Aug 2026 16:40:56 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Fri Aug 14, 2026 at 2:48 PM BST, FUJITA Tomonori wrote:
>> On Fri, 14 Aug 2026 01:54:25 +0100
>> "Gary Guo" <gary@garyguo.net> wrote:
>>
>>>>> But further complicating the type system to prevent concurrent restart sounds
>>>>> like a bad approach to me.
>>>>
>>>> My intent is the opposite: I think this makes the design simpler.
>>>>
>>>> All four implementations of start() already take self by value. For
>>>> Pin<Box<T, A>> and Pin<&mut T> that means what it says -- the box is moved
>>>> into the handle, the exclusive borrow is consumed -- so "no arming while
>>>> armed" is already the design there. For Arc<T> and Pin<&T> the same
>>>> signature meant nothing, because Clone and Copy let you build another
>>>> pointer and call start() again.
>>>>
>>>> So the contract depended on which pointer type you picked, and the module
>>>> documentation had to spell that out: "When a type implements both
>>>> HrTimerPointer and Clone, it is possible to issue the start operation
>>>> while the timer is in the started state." After the series there is one
>>>> rule for all four types, and that paragraph is gone together with the
>>>> restart operation it described.
>>> 
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
>>
>> v1 is missing the ability to restart a stopped timer: once the
>> callback has returned NoRestart, the handle owns the right to arm and
>> never gives it back. I'll add it in v2, including a non-blocking
>> variant built on hrtimer_try_to_cancel(), so that a caller which
>> cannot sleep can re-arm the way perf does. That makes perf's model
>> expressible in the Rust abstraction.
> 
> I should also add that cancel and then restart can be problematic from a lock
> order POV.
> 
> If there is a shared lock between the handler and the restart like the perf
> core's case, this lock cannot be held when cancelling the hrtimer. Otherwise you
> can have a deadlock by having
> 
>     restart (with lock held) --wait--> handler --wait--> lock
> 
> which can be quite subtle.
> 
> Of course, there is an argument that by cancelling and restart, locks as seen in
> perf core's use case wouldn't be necessary as the cancellation becomes the
> synnchronization mechanism.

Right, hrtimer_try_to_cancel() does not have that restriction but
hrtimer_cancel() must not be called while holding a lock that the
callback takes.

