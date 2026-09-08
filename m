Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C013952B1FB;
	Tue,  8 Sep 2026 11:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788866061; cv=none; b=aCHvL/m4LS5D+88Awvcu7iHkQ3ayJQ4HAHoauz5izRN6S85cK7+5/lRdQ8MWn3vZZMJ1Cl2dNWhz/P+MOcK2wKX0z/hqvKxYFCKCUld5QJ3/+jy8xdNbvDS2pn2ELY2iFdd95fyCVyikbHGeXZZWJAuObKoELpGcJGuL1mBiSnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788866061; c=relaxed/simple;
	bh=36ZUTC+wOyLILm1JmFV6KfW80HMCBRqmg9QX12+pres=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=M/un72TTkcfeY1fBGv7hDuHYXr8GvNgCi4xSYy+mu4lR8cOXI9rnBx2OUC/qZkgIlHypgEgInm/B7A8KrmgZ6C4fveBjpeb7wjWiy1z0LHNA3hWsEev6mTv9vXVUsy7i67ew/aau7WAY0dJCHQLMmHQvWWI6Owo65X2Q6CDLuq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=odcEVQhb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Pc2aoiVN; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="odcEVQhb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Pc2aoiVN"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EAC2D7A00EA;
	Tue,  8 Sep 2026 07:14:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 08 Sep 2026 07:14:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1788866049;
	 x=1788952449; bh=5qmHj4kxUir+AQue4QISqSFurMKIW3UuGg7zJ7IYMgU=; b=
	odcEVQhb9C7TQvwQkAU9qux3vBTtjuMYKlyvzFFEBrpEVyIPpMCFeZaGvQLM0hGY
	CBGQjK/AoF5VkQoZy2g0jsq5vNAK9OnMQqzEqUxaw30IlbPN/7+oTUdq8KuTDtzq
	8uxgpWLZrelVfFSZ85YLNOuR5cLcZlgpD+/j/tovemg/TYaAPmdnD3slb9W5tnBI
	tPADR56xlHa9jaPdmxXN2cPq2md6ZBhDDPfFecQZD4VWhZa1dJL2PsjnRN2qbk/l
	N7RmiYMiwJtVhuNXpGV8pANyta7R6jtNFGwcnezJxW7/l59aLR/3KEXMJNN1mXFE
	cuLYmy+hmN41o5lkQiD2hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788866049; x=
	1788952449; bh=5qmHj4kxUir+AQue4QISqSFurMKIW3UuGg7zJ7IYMgU=; b=P
	c2aoiVNYG15p1L7bYjKk4Q/DqbawjuhAsD+r9VfCjr/BF+J/IIXhWP34rpIFZvov
	aEo0cxw6X6MhDgfkj3ZIbTKbUlY1O7jCpXlryz9ErC7pNN+piDqjzBjappUPlC7E
	Z8WwkMTLowM3mV+ON7K5nvoutltbgzzkpjQvIvVktq++2ENS91PPVHWYptLO3Sah
	cnPbFVQW41Vg/5+qcXKmG/h6ta/P1+APQENMJ8TJImEaKS2whHXkMIQxHgYB1ys7
	EfoaoDfX+zHCNzcpTuqxvp3mdJJIv/zY1bJ9a1aFl3eVm9uVxOahN1eUJyxvw/hT
	ZJFEOw0Drge2HDWekUl+Q==
X-ME-Sender: <xms:Ae6faiQDDC2ucbuyyB8oE2Dib1_5NFrIW3atO1c9ATb2VlqB7aHJDg>
    <xme:Ae6fapa16Ctaewz1unD6J4t4wZ-1350RVn9uG4V1LaSb_mwb-K06K1f8iSJ6cNmbU
    6MXazg_vd2TSqe2uYNO5LOGsb2IrCBC6b_vazSL_ISrDDqIHC3mdEVk>
X-ME-Received: <xmr:Ae6faj76Q6Z5lFHjgos-PAY6PCaBT6U5OeGN6mGe7QboMg7vYGVzEwbd53HuDxaBHqMa8QSwLl-Azd-EsS56PIB6>
X-ME-Proxy-Cause: dmFkZTE847dkQ2RnAhoEBiNLPCGY+6ZrGPBO+rjoDh8iYwze1IA9Xe/21J/+IfSrmRABzF
    DE9lm2YeZbDvDUudvOJyKmw+K1/VP1AaSGN3dkuuTM60Km3SLSqQDLwt5AYO6K6INMDYiK
    bvlJoLNYZdIeD6xQoHyQm7A//oeWFKMtWFvh4tyQfF2WOWYRpHmWFdvLU/0H0vyJgtfqDk
    XZ4kiW7Dc6Se2hi/fsmrCE9Yie4AyoDosaSBM2PRf8P/VTbnPFU/0rgNq54IkUg+9uifcX
    3EzjX93/IrYHer8QXziWFw9TPkI//8uHxNgeKoyxa/fBqkz2ffA4P4fpYAZYLndEmbuCN8
    Z07ZtrzQ9BgVqW//Si4xYtseQsm8ukKyUWIX4U7hM6rprSsQdhPS6W6SLyIhAcwhyCFdfi
    jgq+SvUC7v3z19yQsa5zrPlGmU9jJ2BAPCN9qfpQA/catp8YVoUDfn4rvJvs99NPXosk91
    UnrQU4S2tE52gVgaoKcQBX5nuAolwberWjZPMRpfJjYGkgQBs2Ma4gKtP/MnCJSPm+n+7m
    lUL52jOgU0wKtesoOBCfdEETM1FqmVeOpUBUC7CSZl+eLC0y0ZKnHa/Joh3BTxJCekv+c5
    R3dBkoxH1Ulx2cB5ZfN+ZMK3zORPpvhtAS178DI41QjRVKyvWTZ5/7skaAgw
X-ME-Proxy: <xmx:Ae6fakfn_hjs9a3bPEvRH3fF4ESsqSFHjWfVQAbZKHQOt7eOu2gNWg>
    <xmx:Ae6faqffwD2XQS31ubR2Y1jn1XnMvA04n-17XARKBJ3Ps28YslyrZg>
    <xmx:Ae6fapE3VJbZ6SzRI8Ft29X6dc56ZfwGAO1Qb5H89SoIRpu6dMDGkQ>
    <xmx:Ae6fapH_n_tK1A6wUW3sjvlVursrn3-YEMuvZNfwsT8ZHCb5GExIUQ>
    <xmx:Ae6far-56Q2DWHr4ReN9WEEHf-7J-F9GckzfL6YgMgpTyosvsQjeXhtj>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 07:14:04 -0400 (EDT)
Date: Tue, 08 Sep 2026 20:14:00 +0900 (JST)
Message-Id: <20260908.201400.2113025819273270637.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: mike@fireburn.co.uk, rust-for-linux@vger.kernel.org, boqun@kernel.org,
 fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com,
 tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <877blb1y3a.fsf@kernel.org>
References: <-MGvfW7sYYLrXTWvmTSX5lTwjEMfK97Q5QgNWBrHikC8aI_fyF3Sa3qzN4A9Th5lK46jMOYU4KjO59m00z4P9A==@protonmail.internalid>
	<20260826162851.2497-10-mike@fireburn.co.uk>
	<877blb1y3a.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 27 Aug 2026 15:39:53 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Mike Lothian" <mike@fireburn.co.uk> writes:
> 
>> Reading an `Instant<RealTime>` is the wrong tool for a caller that only
>> wants a calendar time in seconds: it takes a full nanosecond timestamp and
>> then needs a 64-bit division to get back to what the timekeeping core
>> already maintains as a plain seconds field.
>>
>> Wrap `ktime_get_real_seconds()`, which is that field. Document the property
>> that matters at the call site and that the type cannot express: the value
>> follows CLOCK_REALTIME, so it is not monotonic and can move in either
>> direction.
> 
> We recently added the concept of `TimeUnit`. For now it is exposed via
> `Delta<U: TimeUnit>`. We could extend this to `Instant` as well to have
> a seconds based `Instant`.

I don't think that is a good idea.

`Instant` is a point in time that exists to produce a `Delta`: `now()` is its
only constructor, and what you do with it is `elapsed()` or `Instant -
Instant`. So a seconds based `Instant` has to define what `Instant - Instant`
returns, and `Delta<Sec>` would have no consumer. Every interface that takes a
span takes a `Delta<Nsec>`: `fsleep()`, `udelay()`, `HrTimer::forward()`,
`read_poll_timeout()`. `Delta` also already treats seconds as an input format
rather than a unit, since `Delta::from_secs()` returns a `Delta<Nsec>`. That is
the difference from `Delta<Jiffy>`, which earned a type because the C side takes
jiffies at the boundary and the conversion is lossy; `time64_t` is an `i64` and
seconds to nanoseconds is exact.

And that is not how `ktime_get_real_seconds()` is used in the first place. Its
callers need a calendar value in seconds because something outside the kernel
fixes the format: an on-disk field, a value passed to firmware, or a userspace
ABI field. Many of them compare it against an expiry time that came from the
wire or from disk.

Does that make sense?

