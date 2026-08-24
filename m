Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249F33EDE7A
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Aug 2026 11:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787569657; cv=none; b=jvEkvSjVwWh9J0oH2JJR8/wxb/cAS38k7U9/tFzWw93hSbBXcIyKAK+uPFIWzs6Lk+xt0CfhTbtTqzyAg6IX1aiY0FC1xrMUHcTVXXvRhXyhYfuLXmyk44iUJlWsQc9eemLQ/MZPIzBMsrxsdvswhHMvOrX+jad3TNgBJINvrFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787569657; c=relaxed/simple;
	bh=vNZ1Wz4GYow4y4/xbIdjsRyroOILW33EL1UWLuLZomA=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ouR7Gu+T3J1nloH0hcYoI7jgageGNHh/lillo9wqiXH2PbXgjvNLoAGDHKeTcDEsnorzkIqoyBSBVJ1kWRi+QS5c7yYtbuNkv1gedugIMvmob1r097RHAIxY+tyFO+Z+G/1ay/wYrpFe3gLoMn9RKL0yNNcW+LnaBR9nZGrkCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Udn9+O08; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GY6i8R79; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Udn9+O08";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GY6i8R79"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C954F7A0075;
	Mon, 24 Aug 2026 07:07:33 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 24 Aug 2026 07:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787569653;
	 x=1787656053; bh=I+ZdNUiLy2/Ew1FGN6CCam5w7j4jxNIMgtcyZcz278A=; b=
	Udn9+O08Rw4wqctDEi0JH5WDFlcplulSw77PcNm1/u/0eo/OEv8gEDVSltG5L+Uh
	bjzRhsXh/U4tHCX9r3hLKxelyRm1uwLVDtdbUwSnh3vqTBff4TtO0B1pH/5FuYbR
	tzCzVhPi/xasGIr3YShKWFV7oXqXTr7ceg7OJKm/xOXIuFEzb0tG5n84wQEnWfWi
	Fzs7k8d1pG61IF8vm/1IyF9/Ah1NKQln68o/Po2XJ50cSA/DVBRhPGSbILeImwA6
	IUaHIyQ046SLbPNhPwbhKFBgCBTz8RJjNh38sTtx6BWLS7cZ7yy3Xt+xoD6aZenj
	DVVOxQmXNSQ2tKiCz/P6+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787569653; x=
	1787656053; bh=I+ZdNUiLy2/Ew1FGN6CCam5w7j4jxNIMgtcyZcz278A=; b=G
	Y6i8R79/FlDk9GRanAFqmWVmwBvbKQQ3W74DHAoppC7rtEWjwe0IKz6ovVqnry/B
	DtGJBhwEHiHCIyIKXnnAP0zaj770U2Yiwp6Ncs/59z/vISpKAoOXMJf12YyTA1pq
	TW7n1uaKxwmWF5Xi+Lzt2VDu/lHr8nwx+V7EXmBJmHfYg+9TLH+BAkp7x7/TVVfH
	OY2C+zwG94gPYFinW8BdfV6eHGddqf2TbkZTzdx1PXaleOz7+emzmS9vTWntvMNw
	WFZn8KpiiIkMdneARdxVLQnSZTZQrc0WkiG7IoCa/hvPAzz7ekw8vCDwqB8Qt4eR
	OXAbC4RomVRdc2Dne4UHQ==
X-ME-Sender: <xms:9SWMaqXlw2HKz-iAqQCFOit8fNDUctji1GYSafDYtfbU5o8EHsrwFw>
    <xme:9SWMam-55TTnYQudyQ8575qjy-s4isUhR4OSAapJwN2xpY2dk2cPxd7ayGUYf4mlK
    8DrekukGKM2hkrM_d_91Js9UZ06VHEHWg55bVIylGqM0ERl4l6fP_jw>
X-ME-Received: <xmr:9SWMavi7d52BrApj06tmhJcUsvK_9-fDWx5Mtlwfkjq3F21Sf-5jCE4odujivCSOx5fZ_eXS8lnVJMshQ6wF_Xb_>
X-ME-Proxy-Cause: dmFkZTF9qdJXSpXenLSwvXQDjQBA7YMjsK5uRTkP+sDLof/ikh8C1p35lhkMcQQJ4dDj2I
    ZorfQeanMcGCProqBT3k2esvpM9HdKgr8wRs0cJJ5S+NjCkiD7ABT29vJnfxvKK5+qWYOP
    HAEmJrlf6vTLKobZ9LqgRgE3nZD55MzgCEAybQWd94sD2jEmmsSDJr11g6bq6uwFvV56Mj
    7KxxEp47fqQ4YPliggk1k/EVGSbK6XrVlNS4G91bx2JU6IwyM0l2jDyQonkTn0GLqB7em0
    MJ6D4tWQQ1NIZll2QByrBxJ/2A16Cf+mFB7lCib2SPaUrtQqfNaURIdqB7+1+wpwatvfPi
    QhcTh09vk6YALqsrONfUsmGEp/PTtN07oEyMJmalSpYbvjdg5JwCpVN3zUhH/T4W2vBQAR
    mJYT+Yjtxoz/NA8RzF7ApxswlqRq8jf5gXCThJ6kEfrEz0IOWTHsEzBH8GvxGU2KCC33dy
    9wZgSXSLYPWeYT+9YOutmYz/kvjFP5G3yWriFduobCHRmUEOi2Hk2GQJlNE2GBRavt6kcw
    YIjHNiSq3n04eIyyyXc9nMlLIsVxbwQa2AOLQ28G8AiwDSj+9LkCgDI8CA5L/UeTquAVjk
    W1R38V6O/d6tEYy7bo1axst3wb9tCeH7AqBGgvV+JWSo6QS5g/Nn/BRoeCsw
X-ME-Proxy: <xmx:9SWMatWJTZUJyzdtDbQhQoB_1LjnbqOqU7OEFvVhphfNZcJyDV_oTw>
    <xmx:9SWMajsSZJ02clEXIC2fJpTNne7y_8ajSHVADdBJx2wbSdN2exJ45Q>
    <xmx:9SWMau9sHI-KRORERLHPvvUxHij6mfremoMG9YV2NfI562cE-zTPdA>
    <xmx:9SWMaju5cm0ATLI301dENfxqQ6RTXR1ooqZ92M-TlJBLWQ8Vax6GBQ>
    <xmx:9SWMavPZTmfmRucCGiBbSNwJnxI5shoM9RPHuMYsYtq4cMkVs9DU12l->
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Aug 2026 07:07:28 -0400 (EDT)
Date: Mon, 24 Aug 2026 20:07:25 +0900 (JST)
Message-Id: <20260824.200725.1646650851096110842.tomo@flapping.org>
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
In-Reply-To: <87se437q77.fsf@kernel.org>
References: <87bjaw7xqa.fsf@kernel.org>
	<20260821.185308.614720109603525569.tomo@flapping.org>
	<87se437q77.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 12:44:44 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
> 
>> On Fri, 21 Aug 2026 09:13:01 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> FUJITA Tomonori <tomo@flapping.org> writes:
>>> 
>>>> On Thu, 20 Aug 2026 14:34:16 +0200
>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>
>>>>>>> We discussed this at the call last night. We came to the conclusion that
>>>>>>> we would like to experiment with the solution outlined by Gary, where we
>>>>>>> inject `expires` into the callback handler, and the callback handler
>>>>>>> returns a forward duration in addition to a restart value. Because with
>>>>>>> that approach, we can avoid adding complexity to the Arc end of the API.
>>>>>>> 
>>>>>>> For the best implementation of this scheme, we probably need to change
>>>>>>> some bits in the C code, add an additional path. Down the line, we could
>>>>>>> also see how man callers of the C code can be changed to use this
>>>>>>> pattern.
>>>>>>> 
>>>>>>> Do you want to send a patch based on this solution Tomo?
>>>>>>
>>>>>> https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/
>>>>>>
>>>>>> The solution that we discussed before, right? It changes how the
>>>>>> hrtimer core calls the callback. If the C maintainers take that, I
>>>>>> will do the Rust side for it.
>>>>> 
>>>>> Yes this one. We don't know if C maintainers will like it. We were
>>>>> discussing having a separate path on the C side just for just,
>>>>> alternatively converting C side callers.
>>>>> 
>>>>> I think we should be able to reach some kind of agreement with C
>>>>> timekeeping. But if not, we can solve it on rust side only, but less
>>>>> efficient. We can grab the base lock again, read expires, then drop the
>>>>> lock. But better to do it in the C code.
>>>>
>>>> The Rust side cannot take the base lock: lock_hrtimer_base() is static
>>>> in kernel/time/hrtimer.c, internal to the core. So that way needs some
>>>> agreement with the C maintainers as well.
>>> 
>>> Right, we would have to export the symbol, or a function for this
>>> purpose. But it is a smaller change to C code. I would prefer we solve
>>> it properly though, not with hacks.
>>
>> Could you propose the solution to the C maintainers? I will do the
>> Rust side, whichever way it goes.
> 
> Not sure what you are asking. C people are CC in this thread. I think
> the best way to discuss is to write a patch that can be the basis of
> discussion. Do you want me to draft up something, or do you want to do
> that?

The former, please.

This thread has a lot of Rust-specific detail, so I think a new thread
with the patch would be a better basis for the discussion.

