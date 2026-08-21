Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D6B47668C
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 09:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306006; cv=none; b=JCQSlKVEaaFETJAGKoz9sVdkR0eXNHeoQKAUdtyghfxv8ObWgKfl0qA8tlunEHz0gM/NRWf+ah3ZqawZdtNaSav9X+n8541q+kVZFk3xoBmm/t+yxNsLqXs0z9WBzIrqPC2emFA0mNmro/vPOj2winkeJQM0HbdtKucIL/525Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306006; c=relaxed/simple;
	bh=7t7yylssaIYf2y/kCN5PHttfIUxIj9zPRSCEjd4QLQ8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=JpPp7sd9ezuRQq1Nh3oUNbTVsRD/QFMt1tYv2yIF4KSe4eHBoBMotC1pMVlmF9dZDELShO2CbEC17/GpYEJgDHb+h6k1UaxJDfkArJ25TlU8m4DKy3h44nzmPVMqUH5F1CtDHiY5wgayRw0F3G1J2HAqIK/wnhhFa/J4Q58phZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=OzTn1bR3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LgvLiial; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="OzTn1bR3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LgvLiial"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id CE9D81380151;
	Fri, 21 Aug 2026 05:53:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 21 Aug 2026 05:53:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787305996;
	 x=1787309596; bh=3n3+4MuqXdCKkDTKNSX3OyeqEWCK1Mn6MhIU12yEgvk=; b=
	OzTn1bR3fKWec25hTSpYkNew/G5jTfF5dOpLBRxz53GnhC0aUhluSD8hggOvZzmn
	FvZF+WVc7M35IjDgYKG3/sNE7MegmToghnPS4rWVsm7KAqhpylrqpH2Thu1u6Zap
	3PQ61iBMRYviTRDmrcU6jAsvuMHujxBY3qXFuq12uKmMCivHIojeJsfFTul0GD5K
	sL78AOSHxQhUO38fpfNEj0Mb7GfF5YpfzBQzUAO0npJu+67R/JRlkUJMgK3GJta8
	joDuSjbQpZ/50iA8axS89PZJ3YxLLGZ/3dlchHRXaLatfnx0uTUa35p8UBiXDtry
	Fpp/z/GLWvBvZeWSzVIOCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787305996; x=
	1787309596; bh=3n3+4MuqXdCKkDTKNSX3OyeqEWCK1Mn6MhIU12yEgvk=; b=L
	gvLiialFTybcEX7PyF8fVvpouaXZsDTiIl/GXoZuTuWrDIrVr/kSD2cDDKr2/8ka
	4bnDxq8ek6skJrlnlyw0yiZcSpONwwLLLvmsnVnydkp0/haHTlTN1hyTgkYpS8d5
	cuzlXtrx9vAEZstUAw6ajea181R8FJazyx2c7Qt0pZEtsU4HptvdFZvN7wzjS73G
	oqGoqMhAsX1CZNQd88L+xcQPoXYjXwoNQcp8bZWRU5EicH+45zxZW4mePIDSudjS
	ChcyL1v7ueMn140x2z7JzKggQwL9aZUyiPUKUD+vTj5v6PNRZCKvulG10hedffP8
	Gtl+ammWNbqYAGIrwBZew==
X-ME-Sender: <xms:DCCIahrDtdfvs-U4Cz6_Ss2kWwgy56uYzTqeDnVXnLXST4-_7QHxwg>
    <xme:DCCIakAitFcVFRXKqdX7dWA72p4tjrzgRApXr7-PQNzl5Tv6sU4KJlob-sA16dHUR
    r4FvAEO7S8u8eeRed5T1bq4gBAPJHSP8ZF5XDl616h7CMuKi88thXkl>
X-ME-Received: <xmr:DCCIavUiMsC9FxFrZb_Ugv9s1TKa_kCv1i7ZtM5P5IWKAamIupR8_F2D5TN3hYA4TNmTVPI7WDXjLQ-lDHeBqk78>
X-ME-Proxy-Cause: dmFkZTF7Pg40JA1kpOEEKHbPxP8eKbxpFGsZmsI1+c2vY/1bh2Npp5IhYiOQxDW1tooBkp
    edmitpejQWi6e//1OqzJL/D4wuWs9tJ0TlIt4kgWs2S9K0dHnGfFzbZOBnIUsZHeyscTrg
    D4H7CqkmeJm4JREMCOuZqCQhB/ZGh1Lk112xn4A8Z1PfT5aJhvv7Gvmlp0BWl0bWrA96Mf
    w5YOTVw1Mhv+7hXwhpkimZ03t7Gf7esPQTqUZP5HTinAXE7qPxqaFPk+vlyLLZnLTBTALH
    eirHlo1rt/zZ3D1MSY6K4W0nc2xI7TGEeOQb2Dq4/l9Ab+aQL2Iw8f9KVOycvhBp7eiOIn
    6OGGiaQ1O2t/lfTi+iWGQJ3YwzBlkFmNh5sYv11eUYiEIKLJR6mh8waF3h3lotGr4Cg2De
    FpuKsT5bYuiKZb2mWK3/torvNCGoN+tv+aSh+ExiMheeLH7NjcKIfrWmryHjZUIB37VWPt
    XiD0C+AhWUQxtkpK4cRzwg3JoEddVTjd3k7jgQCTNfWIVxJFS68YsA8MRkBrx1YGAVS9Z1
    6UcRFXBxZrYiDYMXjEZENMt+he/R3CnywaQ+jWbz5jnrhzTgvYQQ/bWcALRrGv2uT0VbCI
    l7Y9+GkHkuXVMnZavPTimE0pl7gzWSJDBiM8ZXXyvL7+mGLkx5aDQYeDhq9w
X-ME-Proxy: <xmx:DCCIao6xbi6JNQCQoYGP4pNxIbUBfBtqASepVlWtE_e74-U_3bJ8kw>
    <xmx:DCCIagAyvqbzPp_DH5WFl4iHA6YuaD6BjpH0dryOPNffcyQ0Pk36AA>
    <xmx:DCCIatDxoqLvEAIepQQ2PdjkE6rQ3zZZxfYH6beY18yK1z1Zebg_mA>
    <xmx:DCCIaghzhza3ru1N1OQKxyGvk38WQ0zcyNdvhM0LV54OSOrSfVC_RA>
    <xmx:DCCIaukJF7RB40sfxmRb7s4DxDMejkz8okKg0z1cbICVwHULrgg9POAz>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Aug 2026 05:53:11 -0400 (EDT)
Date: Fri, 21 Aug 2026 18:53:08 +0900 (JST)
Message-Id: <20260821.185308.614720109603525569.tomo@flapping.org>
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
In-Reply-To: <87bjaw7xqa.fsf@kernel.org>
References: <87ecft7yyf.fsf@kernel.org>
	<20260820.215332.1257209020327006274.tomo@flapping.org>
	<87bjaw7xqa.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 21 Aug 2026 09:13:01 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
> 
>> On Thu, 20 Aug 2026 14:34:16 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>>>> We discussed this at the call last night. We came to the conclusion that
>>>>> we would like to experiment with the solution outlined by Gary, where we
>>>>> inject `expires` into the callback handler, and the callback handler
>>>>> returns a forward duration in addition to a restart value. Because with
>>>>> that approach, we can avoid adding complexity to the Arc end of the API.
>>>>> 
>>>>> For the best implementation of this scheme, we probably need to change
>>>>> some bits in the C code, add an additional path. Down the line, we could
>>>>> also see how man callers of the C code can be changed to use this
>>>>> pattern.
>>>>> 
>>>>> Do you want to send a patch based on this solution Tomo?
>>>>
>>>> https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/
>>>>
>>>> The solution that we discussed before, right? It changes how the
>>>> hrtimer core calls the callback. If the C maintainers take that, I
>>>> will do the Rust side for it.
>>> 
>>> Yes this one. We don't know if C maintainers will like it. We were
>>> discussing having a separate path on the C side just for just,
>>> alternatively converting C side callers.
>>> 
>>> I think we should be able to reach some kind of agreement with C
>>> timekeeping. But if not, we can solve it on rust side only, but less
>>> efficient. We can grab the base lock again, read expires, then drop the
>>> lock. But better to do it in the C code.
>>
>> The Rust side cannot take the base lock: lock_hrtimer_base() is static
>> in kernel/time/hrtimer.c, internal to the core. So that way needs some
>> agreement with the C maintainers as well.
> 
> Right, we would have to export the symbol, or a function for this
> purpose. But it is a smaller change to C code. I would prefer we solve
> it properly though, not with hacks.

Could you propose the solution to the C maintainers? I will do the
Rust side, whichever way it goes.

