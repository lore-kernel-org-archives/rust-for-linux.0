Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90673E833E
	for <rust-for-linux@vger.kernel.org>; Tue, 18 Aug 2026 11:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787052082; cv=none; b=AxDaokdhLk1qzf0dr4aRMCOGKTT2hjvzzLyKdGFo44cTGZOMdQxiHNjHLqQ/EvfNYSb7lU+0tshFC9RSn0yT/eFY+uOYtKKrSN6Q3x6NEVBxXYSsonPont3tdRVE0t+yHXijR2CgL9donibKa6mb4aMallVTrHzKalXXqbALvko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787052082; c=relaxed/simple;
	bh=IGrtC1+SNUwrnDBcaKLEQ3S9UYaOvGZ0lK5Q99erTC8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=tyEe2hgZk6FwM3QtoMsBFcJk+iBBlRDeFtzPZWC2o2/wDMF5xo+HQKp05giBFbmySmLlNIrXqqXUQPdGRFE0FINZ7+1A3NyhkS7n1Fz4VOirCtb9Mny7sNEepCt5R+g6seo9KVASjxZZZh6C96KgkhjJk8NSbwQZ5x6Z7m6Zr9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=V+cUHjcU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RbZT0mIe; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="V+cUHjcU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RbZT0mIe"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id C582D1380138;
	Tue, 18 Aug 2026 07:21:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 18 Aug 2026 07:21:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787052079;
	 x=1787055679; bh=iQ1KgyRAZpU+6IB/Rs7C4RWvfd8CPGzWcqcDiF2fEow=; b=
	V+cUHjcUVSj28SfNXSzam6DvtF6gJIzV6f/aQy/YOlXtrjSIZTdOEt9Uo2n7M+9b
	lw4r5hEOVKcK0I8exv3zhnNxUgOrzou7HhwWwyKTQl4jZ9oPmKlmeZDVu1rN5e/d
	ojct4yFm0WRL0ydetHvJS7TJZGqB771rECXFYEf9Yga26RC/wKGcv8YH+LPyBV0W
	yLgcevI4IC6SJrKTw4vhQx3z++E4/m4Rb9+kCALiee7apkDKqlOGBvHs3fH4PYFi
	/0aekfoxzcMNgbbATx+ReYA/X+tWxapzCYWnEC/CsL18Rz89NKjqraEblWzbfJwz
	ZqNDFRYtPLy7TEAco7GcqQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787052079; x=
	1787055679; bh=iQ1KgyRAZpU+6IB/Rs7C4RWvfd8CPGzWcqcDiF2fEow=; b=R
	bZT0mIe/6pKJa4d3SD68EujNE9chg3AGzfMLL3v574c42FQB7qs3MBAYOR+/AJ34
	KkpgLViBLHfBAzHOiiXLeDrjA3SUxLI9QOYmLw6AaK5Rtsd1GGs7+y1eGbJxh5CV
	4bhY/JrJJXFoztkI2K3ImggttUcNT52rsDjr7aigqB2ulCGsiMA6kgIuTTk4Vq6e
	t1hteWspayU369hC9vhfcX87hZiJTw1lX011mPYHf47iFvfeCOx326ynrks4yM/m
	dBmEhjRBfCozDJvCUq7tyC3E/VCdxVR+VDjrcWmXK5vA/2LXfJ1juPuxwoMplNUd
	Q6F6UegFPqE5/fqrSBLHA==
X-ME-Sender: <xms:L0CEanc7VzhbyXzjy11KirbNR2aB2-1hSXqvR_B3g2zh8pi4zAgWRw>
    <xme:L0CEamBJ_96RapKGnhmGt1yKJuhJgn4QtrdxlO2Agj3JlU-rs09DJLCNa_dr1x2Hu
    lyPHfL_yBTD1wgDDGw5L8heyAA-VkezK5chpsJ-cm8yiJ2OOakgrmqn>
X-ME-Received: <xmr:L0CEah0v8NAY7nVDeQ86dwvUvxUKEC8MvUG5smkjySNcjI0pFW_yxFe8HBb91lNbV2PlNlG_i8_4DIvxuElKU8Vw>
X-ME-Proxy-Cause: dmFkZTFmsXCuP+kaI08asx+SgNoSzxyRwx0iQwG/7hjkY05jKsy2mDYVE/t0PCCE/yIyPO
    12661q22yzM9C225MqRyFlBG7lHG/xHebrlfcRK8IYWkmsim3KivbIgQFLSUZFm2zaGkXE
    ndVEhf4DVr1DxMMiJ4Dayh1qVCcUpTYKFQLeRvYSiUPvZ9gTuXNELqVI6eFyV0URbVuchC
    ueDPEg3E92fBIimMJx2/llijz8K3k3+UPAKCjP5V1PMUYbK0WVxZU6KaZm/wKMmprTEGkl
    /2hc6SBT5BRdSt0dwo5KsCA6fKJttvfYjuqDu7M0iOarcUWRPz9SXpR0ggiqpg3fm/u3gF
    ixZ/UtKDb5lWIVqTdQo9zsWh1xDOM217w9AWSuZe4DRkJ7uQ+6GtJxh+enGuKet55wuzk4
    VSBU3+9VfweYbcz65Ictcjy3f4lKqvDvlNER/O/vdiIHzEqVjFoQsh8yr/cqvhGAhAsSkl
    B+HKU3SXpg2y7JiIkpBl7Q7FodSL7M0/Y2Rm4aLN1KnESkAUqLSRocJl+8RnIb07PD96XV
    tIE7s40x4L/Q2/eAbTViKQBc88IpoU/QsZ0HApIkNTsm6X7006ihfl97VAeuDiweDhe90w
    S8LulyNG6jdgoW8AqfjhoI0iPk0tr9Yza2NxTJN/8TCY4NBMbG3rnwMkyuIQ
X-ME-Proxy: <xmx:L0CEauMhg_CZoCZB-6LMm79hKzPkRVYDh9jiZaefeonnobeVu_7lSQ>
    <xmx:L0CEancHR_pdRZg8k8I885FF2v6iT1CDxVMQn30iTrHPSQcFvBJ6Og>
    <xmx:L0CEaiO1zLozKOSCWpkuOxQurcbmN801UbsJKkeDdLUkHepRiotchg>
    <xmx:L0CEahZZl-UahGgprcK1f8xNlLs3rUSh_vqcu7Rj4ruimjBU-OcERw>
    <xmx:L0CEakUbPpfk91jZUO7-6NzQMdUQEL-Mvd3ixvh7vrmjxjchTf6A069H>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Aug 2026 07:21:14 -0400 (EDT)
Date: Tue, 18 Aug 2026 20:21:11 +0900 (JST)
Message-Id: <20260818.202111.221982706607091751.tomo@flapping.org>
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
In-Reply-To: <8733wbajj0.fsf@t14s.mail-host-address-is-not-set>
References: <875x18ahu6.fsf@t14s.mail-host-address-is-not-set>
	<20260818.112656.263099326344775009.tomo@flapping.org>
	<8733wbajj0.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 18 Aug 2026 11:02:27 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> perf and CFS bandwidth have a flag as well as a lock. The flag is "do
>> not arm while armed", which is the same rule the types enforce
>> here. rtc and the softlockup watchdog look like they cancel first and
>> then start instead. None of them arms a timer that is active, so I
>> would rather the abstraction did not allow it either. Does that seem
>> reasonable?
> 
> I am fine with preventing starting a timer that is Started or Running,
> but I am not liking the `UniqueArc` requirement.
> 
> I have a use case in `rnull` where I have to start a timer behind an
> `Arc` with no way to obtain a `UniqueArc`, so I would prefer if that use
> case keeps on working. Without this, I would have to allocate a box and
> put it behind a lock, leading to double indirection.

Before the UniqueArc requirement, I would like to check which timer
you have in mind? The bandwidth timer, the per-command timer, or
something else? The two seem to need different things, so I would
rather not guess.

For the bandwidth timer I do not see where the handle would live, and that
is independent of UniqueArc. start() returns a handle that cancels the
timer when it is dropped, so it has to be kept somewhere, and the current
hrtimer API is the same. queue_rq() only gets a shared borrow of the queue
data, and the handle owns an Arc<T>, so putting it inside T means T holds a
refcount on itself and is never freed.

