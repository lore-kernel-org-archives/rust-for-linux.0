Received: from flow-b7-smtp.messagingengine.com (flow-b7-smtp.messagingengine.com [202.12.124.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172DD384244
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 14:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643140; cv=none; b=NWox59HBEJc2rfZsFAGYJtYvpVrYtEROk8DrQTdqOnrGvnna/Zs0xO7ltfGccHvd4AtHbQgQN8fbRlgVywJWEQZubq00CpnSAXeS1WKThTwvAuyShgDTa5NyNP7szizubqkIPiYNYkuw6DW0V3/mwqmUvvJLQR8IL19nyMrrnhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643140; c=relaxed/simple;
	bh=bev1sfr2FJCxydoZoHRx5TydTHgooAqQJ6d61kRwErY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=r5N4UPsiiNvqSwCBP/AAVOuU+WWhawUoLpzp53+bGV5Nfrsf+Gnz8FtqTruGTRiJDYlki2NzgJDPqiqewPy5eL7/qETSnefGuXHcokCdrY5kXKRztAacrH4CMYv4BXMgJd3TifwYca2X1PHFnUehZzAiXbGm13kGkLuVbARhA14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=A2H3Vv3Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RxDtU88m; arc=none smtp.client-ip=202.12.124.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="A2H3Vv3Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RxDtU88m"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 9BB9313000ED;
	Tue, 21 Jul 2026 10:12:16 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 21 Jul 2026 10:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784643136;
	 x=1784646736; bh=ICMkJMrrmDaHPrXT+0imrp7eiqk2P2glkgLYQBsy4fo=; b=
	A2H3Vv3YRpOUZMrLorAVQdF8K0Gp9HikuqRBoYBBPoRGbe//sAena0Yho9ZoLtdk
	GyI6XVODItkqySOQp4sB+okjPVGEnYShFX+14sfyLbSlNfPwdtp1O/p1Mi8/zRP4
	ieaG1Ka0uFwI3wvOoRCqKzyPRr2UQBriQKobzeqaH8x8xp5vTNa/JrKg1JnWdLug
	FGo7hFJo7cVG73mTQanbMyeaDEAlkd95ufpjKvoBt2Tq/XA5W8IHuN/vffSH4Oep
	BBeYb47Bfd7sH6GaTPv3/zPoW/gWddZakw7vFAnsEtBpwa/KINw7HEPYlAP74XmK
	zrQgSxDuv6HcNhJCbp+Dqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784643136; x=
	1784646736; bh=ICMkJMrrmDaHPrXT+0imrp7eiqk2P2glkgLYQBsy4fo=; b=R
	xDtU88mwnA7XZQRGvnghlCRKaVs1wEM+LK6tkx8wjPF8JayAB6ELEzyQu7Xa/67j
	2wSHIbiVu+mTntGx8YH1UDm0UmMfGKajO7sVSHt7X+w6/oDoauUgoItSr+YpdsxW
	Idlk1r9bwyFb0YdAih4KzfF9Z7QMyzSsP4pV+29bYzNtbZxNGUud4eZ6ygfDBbje
	ksAMXliv8kqY6RlyWl7/88UKXDT35sOezQZ4dV+M3HRHPFehb5sFIhmMbzsljk+o
	Cn2ble9zrbjX4lqjV0Lj1mVwIpGUE0UZ8rvV5ZZU7QMTY+KilqPPH4P3TGA2N9ak
	jFlvUx/XW225fQkd9kCMg==
X-ME-Sender: <xms:P35favsBdx5lo-pliUGj0iz-bYJ8-MYzdhCOQcBpPXjzorsFXCGyUA>
    <xme:P35fagXZuYLBGhdQM53hElY4Tw1HA38yH59QI33qGPW_j0YjufPPd9hG_2tbw_YbZ
    j6FIIq_rLRzErf0X9i0vcZv6JuDqBKqmMuGfa1AC6ZtT2Cs5YJt49w>
X-ME-Received: <xmr:P35fagHsj1-ag_WpxIW1SUW9dSss7TtuadFQC7Ep63TZkNBsOEVPEenlZZnQgiR8U1ldXCV7WfDz5q-t8iNis6C1>
X-ME-Proxy-Cause: dmFkZTFwS3kD6mZx+QUTc9wFcPzoXf+1deLaHhoMqP3mjqUTj4I6TJ37VQwVnXrQsijsJb
    N+U8v5jCcEIxnkHeHoTrOmvayX4eYzn85lw03ZGImRxelueJH72RFIH3S4ax6x+XfU50x6
    3hC4aIfaKwjOCSPnFKEgQOnSScwQ0y4jlEbmUAPYtpKSlxu7FtqguaSEEXZNmP2TJty77P
    pqs9ObE4gHH76cezQvZccFEVTA/LnmO0QbTcTciISWwWWIolm5OPBkBX5Y4O+3g9wlLwIS
    5QjazfBsRAiJSmISRAM0aDTfAx3imsmJ5S1bm3HB7JY78l9/t02wxLXiykwyqvxu8eyQji
    ySlAIBJkMiqtoyhWYbfXvJO9M81ZqEoi7khnNJJ1PjY8/kiAx6L3aSNNEQrsJIAtuO/G8Y
    dRvJx+ayyls+19yV+SFrh0DjQ/VizXJdawAhUbL0GpPDo7TckaREJH+DYRuUGpilGFAkkd
    XUVzh53Ik1YacpDxxbZHrI6PWCNDpL5+yQDcWgW3q0pzRRnDuKPamy+RYS4Tw7sgxgV8QC
    GfYD10KMBInYMiZ57P/YlKjJft99NjpqpXBeGOeszLTW4pFsHwTbfPkrKHEDGtkkf0y9/p
    Gj5xU6V7SOHxqDhACbksLo2flerP61Fo/4XcbDUrQFUr3ylUSh8UcFcLi/WQ
X-ME-Proxy: <xmx:P35faqYZ7VTVd469iQPw2FlfKdIk73aneJdrvLSySnlBNFzKNOgWxA>
    <xmx:P35fatHkjv1tQfKKYDIkio-w-qujpyRIzueo93ht4gAQOp6t4Dlg-A>
    <xmx:P35favx48diNvDx5xOcI-FTpBABXS0bxpj7NniOtS4Clhy9FwgCU4w>
    <xmx:P35favGmI4AdeUmaIZj-XL9vN0sbnGlkDvbbuL5en6eQUEXRuRWxKw>
    <xmx:QH5fao5EHJzxZsNAd8MJAjdOVAN80SywgTWDUy5JB5E1MFYFseyukCkK>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jul 2026 10:12:09 -0400 (EDT)
Date: Tue, 21 Jul 2026 23:12:06 +0900 (JST)
Message-Id: <20260721.231206.472691511886776965.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, a.hindborg@kernel.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v3 2/2] rust: use Delta and a Jiffies newtype for
 timeouts and delays
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DK3DUPV7BIQD.2OCUGHIA583HB@garyguo.net>
References: <DK1SRBA3315M.32N4T8QQBUOER@garyguo.net>
	<20260720.184751.938933263969124163.tomo@flapping.org>
	<DK3DUPV7BIQD.2OCUGHIA583HB@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 20 Jul 2026 13:04:40 +0100
"Gary Guo" <gary@garyguo.net> wrote:

>>> I wonder if we should have time types being generic over units. So you can have
>>> `Delta<Nsec>` and `Delta<Jiffy>` and `Instant<Nsec>`, `Instant<Jiffy>`, with the
>>> generic default being set to `Nsec`.
>>> 
>>>     Delta::new(42) // Delta<Nsec>
>>>     Delta::new_jiffies(42) // Delta<Jiffy>
>>> 
>>> Thoughts?
>>
>> I think making Delta generic over the time unit makes sense; Delta
>> <Nsec> and Delta<Jiffy>.
>>
>> However, I don't think making Instant generic over the time unit is a
>> good idea, even though it clearly is for Delta.
>>
>> Instant is already generic over ClockSource, and jiffies is not a
>> clock source: it has no clockid_t, it is read via get_jiffies_64()
>> rather than ktime_get(), and it cannot be armed through hrtimer. That
>> leaves two ways to force a jiffies Instant, both looks wrong:
>>
>> a) Add a second unit parameter, Instant<C, Unit>. But then the type
>> admits meaningless combinations - there is no Instant<Monotonic,
>> Jiffy> - and jiffies still has no ClockSource to put in the C slot, so
>> (a) really collapses into (b).
> 
> We could split the `ClockSource` trait to be a generic `ClockSource` that
> supports everything and a `HrClockSource` that provides ID.

After John's point, the current ClockSource trait is exactly C's
clockid_t; ID is the clockid_t and ktime_get*() is that clockid's
accessor returning ktime_t. So it should be renamed to ClockId.

Your split; a general readable-source abstraction for Instant,
separate from ClockId, looks like a reasonable direction to revisit
when there's a user for it. Let's finish Delta<Jiffy>/Delta<Nsec>
first, since we already have in-tree users for those.


>> b) Make jiffies a fake ClockSource. But ClockSource::ID is passed
>> straight to hrtimer_setup(), so a fabricated clockid_t would make
>> HrTimer over jiffies type-check even though there is no corresponding
>> C operation.
>>
>> This matches the C world: for deltas, jiffy and nsec interconvert
>> (nsecs_to_jiffies() and friends), which is exactly what Delta<Unit>
>> with conversions models. But the jiffies counter and ktime_get()
>> values are never mixed - there isn't even an API to compare or convert
>> between them - so there is no unit-generic notion of an instant to
>> represent. A jiffies point in time, should be its own concrete type
>> rather than a specialization of Instant.
> 
> Well, `Instant` never inter-converts with anything, so a `Instant<Jiffies>`
> would be fine too. That said, we can delay making the change until we have a
> user that needs to get jiffies count. So far it seems that people just use it as
> a delta only.

Fair enough.

>>>> -/// The millisecond time unit.
>>>> -pub type Msecs = crate::ffi::c_uint;
>>>> +impl Jiffies {
>>>> +    /// A jiffies value of zero.
>>>> +    pub const ZERO: Self = Self(0);
>>>>  
>>>> -/// Converts milliseconds to jiffies.
>>>> -#[inline]
>>>> -pub fn msecs_to_jiffies(msecs: Msecs) -> Jiffies {
>>>> -    // SAFETY: The `__msecs_to_jiffies` function is always safe to call no
>>>> -    // matter what the argument is.
>>>> -    unsafe { bindings::__msecs_to_jiffies(msecs) }
>>>> +    /// Create a new [`Jiffies`] from the C side's `jiffies` value.
>>>> +    #[inline]
>>>> +    pub const fn new(jiffies: crate::ffi::c_ulong) -> Self {
>>> 
>>> Given that this is a public API not just for binding code, I think it's better
>>> to use `usize`.
>>
>> Good point, I'll use usize.
>>
>>
>>> This function can be `pub`.
>>> 
>>>> +    #[inline]
>>>> +    pub(crate) const fn as_raw(self) -> crate::ffi::c_ulong {
>>>> +        self.0
>>>> +    }
>>>> +
>>
>> I'd prefer to keep this pub(crate) until there's an in-tree user,
>> following the usual practice of not exposing public API without a
>> user. Also, if we do make it pub, it should return usize rather than
>> ffi::c_ulong, to stay consistent with the constructor change above. Do
>> you have a specific use case in mind that needs it public?
> 
> I think knowing how many jiffies are there in a `Delta<Jiffy>` is a reasonable
> need while getting a raw pointer type from other abstractions are more
> suspicious for drivers.

Makes sense. I'll make it a public as_jiffies(self) -> isize then,
instead of exposing as_raw(). Note that isize since Delta<Jiffy> is a
signed span, consistent with Delta<Nsec>.
