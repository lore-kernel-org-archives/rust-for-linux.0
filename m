Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937BD30EF97
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Aug 2026 13:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786715329; cv=none; b=SPOUUziMPrwvUpa0QBzHQSt7JZHcrhrFMiAJwCtmMVdbXvz4SGu3P9jO3P3xxnddFtqc/PbkjINjopLId7l5YfmjAQvOKxqtNgSkMrlv39/r3IQu+K65nxQfLrrJXN0wlKd7uW4S0LVQzbNSG/spNw7ISjj/gi6dEKer+DhU74Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786715329; c=relaxed/simple;
	bh=O4bFivKTT3YJS3d1zdlCnHrhPKemHTtr+hWckkXtP3Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=hNS6RcM73BhGRPtwxu5dDcvhH0rKIANaX5lz2iO+1Kb9+VX56SFsNGUkwwPZiDrbaXT9ikVDEUNTSppW29CrX9NR1/YMfUMLHgfBHgzXndBtbqPuIfDK8+RG1X5UIhihBBXocdxix+p7Drwt3YpEOXZeSIJdFZvzEmrZzHeXLGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Ts3GWJUo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iqJ+wW17; arc=none smtp.client-ip=103.168.172.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Ts3GWJUo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iqJ+wW17"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 9C6EA13802F1;
	Fri, 14 Aug 2026 09:48:46 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 14 Aug 2026 09:48:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786715326;
	 x=1786718926; bh=liOCpc+Q+C0JMSTdiTUcxoWK3c6hbxKUr800jxZr2Hg=; b=
	Ts3GWJUoGhbD+AQqm63h6Sd8nQW6CIXX2pE5kaaV+3SncQaDgTnqtAu0KvGqh3QC
	2j1ZnJZTWWy4EDBhArSWTiqj1Tk2gMJeGxA612nZZxZbkzSiQ1ElyiwQpKVDl7TG
	9JIfZn/xSNSHvSmD4d4Wc1L7HBsWF2y7m6l1/R15VGr0OKlJnR+gywXESr/aL/zA
	u2IEF1yZHfi7kuYWaaAGNSNJlNKr8hKkl000pEral6WecnOQXepfzq8HBSnqQMx8
	jUhXYL5oMEAM1Yk3uNKgl4y1F6BLpBNFzrp0az3V9aXS59wnrorsvNK/fQytq6zT
	XToVa/+n5P0A8uSHVsD6jQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786715326; x=
	1786718926; bh=liOCpc+Q+C0JMSTdiTUcxoWK3c6hbxKUr800jxZr2Hg=; b=i
	qJ+wW17nk4Qq+QHOwzZSiTKKHXGpY0tXoSMxcQ74wkLTdDDDc8qRrBEN9E8kb3Q2
	8IXyVHZSN6e26K/sQ062fE23TRqNn1HatZbSe9xYJfiMoaZW7j5J+nBSpoK/1ww4
	gtfLUSH98I7DZCSD5boifhW7h3+ZlGPVZZuJjd7L8Euyg4/dd08nn3JCd35pEY8z
	GYlTPscPXDFz9/6p1ZAz0uIXPwYQehMkQ4B4U0JOibzzQlb6g72htqXzs8mNY5lx
	v5hvQXsxpmGdI2wEO2Nz2av/uWqRGlODBE1zpAGeRVvYb6imAe9MRa8GGd5ukjEa
	YOh0Q7FNH3ffwpbXxfERA==
X-ME-Sender: <xms:vhx_alGf4FNRibCBDZx_UvfgBi1NDPXxhKVobCpOjEwoEAS17Fdpkg>
    <xme:vhx_aqtPgWzY2DzHEVfK7no2Lhi1amuHflIK1qpPgCNOy2fWRB-BllaNtnTjzk-QO
    B5GZMKrke_YS7zPWUx3sIeNEtmSswD7_ev2tovRJ_FSQJ1-gk9uNcfX>
X-ME-Received: <xmr:vhx_aoSbAJta1ZBIuJnnoLYq-OgzYbG1iub5VSCQCia9aWDId7DpS9m8IKr83GwxBE-KmJOVDQZkPEMBkszLekJb>
X-ME-Proxy-Cause: dmFkZTG2eJnBm8ejVMLAVCI7parqX04e0c9m+Rph4NKmSu7Gk6X2rHZBIzpdqu+W+bwua9
    0zN3WQoJrgw3kg+9u8dJEveIHspbobmvwepIbvC/GGi01wsMxEsG2B05/XCxTrr4986u9u
    ntW/sgp4wpqoHy44cvH1P0z/v4oqovrU8kszhqzc5F2yJ4gDLys90H40Ta1XYL+51QK0TP
    qI2Sdw3k3KjCDNFocEv8aXyAJuu4907JG9u34W6QZ8O3ztEr4oQoPIZE+SK314ztHGgwDK
    BaadVgrS78goNGXfIY71Osn2i0H2Ij0OLTYCdEFVOForBoVPwwPMYKqN4YTc8Jn+UnH6i0
    CVOS+I3veEY8GWDmUwjTpD+y2FqPW6nK5NaBEORKR235jM6mpzOfz4vjr6m1wzEoGhX1bI
    KwS2+quA0fV7XrgraCs9ECzdj3Qmc3HF+SOW38rwLbG8284/UiQBYZXjIpyeedPezJXYTb
    puojm8ks4FLYWvdoYnLYiE9k/7RsGZLh1ho94B5Gst4HAwBd37XNSRutuEHMPoZtzaqKVk
    21cf/eAqQxfIhrgIrXsIaSaYXxJxZjD9kXDpxPoxYgGZEOZ4gxvHHd3TM+8oET62p7lqBq
    icD8KsJqoU56w2/opPrgCZJ5anYPoCMLUWlRQXd36k8Ifug8/HcXFw22UgpA
X-ME-Proxy: <xmx:vhx_anGAfP6KxIKac8fiJuX1YMnwhRbFXAhX6ItsuynUs35_EruOmg>
    <xmx:vhx_aqc6wzc-g-n9ZyQqBgmKGffEXb8RB_9855x-3inULH4QTgl2Sw>
    <xmx:vhx_auuqgbMTTm8TnPTqlV1QbTxpnCpJ9eVOCjcZecj9M-gZsJ0ySA>
    <xmx:vhx_aoeFjo4_dtx0D9DTA-0IOx2Ln-hVPHBjfX8zqi4xohO2xjJ5tg>
    <xmx:vhx_aozowKrOVW6sRsfzqbJGCo1_9vYUUAR0R3w3rLQYgoY6pVEHLePK>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 14 Aug 2026 09:48:41 -0400 (EDT)
Date: Fri, 14 Aug 2026 22:48:38 +0900 (JST)
Message-Id: <20260814.224838.67768463960169120.tomo@flapping.org>
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
In-Reply-To: <DKO995UPAESG.UQNZ5G92HCPQ@garyguo.net>
References: <DKNVOU9JC15P.3DEBNZ56QK20E@garyguo.net>
	<20260814.084700.1697518597717457311.tomo@flapping.org>
	<DKO995UPAESG.UQNZ5G92HCPQ@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Aug 2026 01:54:25 +0100
"Gary Guo" <gary@garyguo.net> wrote:

>>> But further complicating the type system to prevent concurrent restart sounds
>>> like a bad approach to me.
>>
>> My intent is the opposite: I think this makes the design simpler.
>>
>> All four implementations of start() already take self by value. For
>> Pin<Box<T, A>> and Pin<&mut T> that means what it says -- the box is moved
>> into the handle, the exclusive borrow is consumed -- so "no arming while
>> armed" is already the design there. For Arc<T> and Pin<&T> the same
>> signature meant nothing, because Clone and Copy let you build another
>> pointer and call start() again.
>>
>> So the contract depended on which pointer type you picked, and the module
>> documentation had to spell that out: "When a type implements both
>> HrTimerPointer and Clone, it is possible to issue the start operation
>> while the timer is in the started state." After the series there is one
>> rule for all four types, and that paragraph is gone together with the
>> restart operation it described.
> 
> Let's ignore the implementation detail of all various Rust pointers. It is
> something that I plan to overhaul and doesn't matter to the core issue here.
> 
> The change you're making is to remove the ability to concurrently start a timer
> in Rust. So if you have a timer might be running, you'd need to first cancel it
> before you can arm it again.
> 
> I do think it is conceptually cleaner -- however given this is explicitly added
> in
> https://lore.kernel.org/all/tip-5de2755c8c8b3a6b8414870e2c284914a2b42e4d@git.kernel.org/
> and the pattern is what perf core uses; so I wouldn't just dismiss the existence
> of this pattern. Perhaps cancelling before restarting is considered too
> expensive and has to be avoided?

The pattern perf core uses is "no arming while armed".

While perf_mux_hrtimer_handler() returns HRTIMER_RESTART -- while the
timer is active -- perf_mux_hrtimer_restart() does nothing. Only once
the handler has cleared cpc->hrtimer_active and returned
HRTIMER_NORESTART does perf_mux_hrtimer_restart() arm it again.

That flag was added precisely to implement "no arming while armed", in
4cfafd3082af ("sched,perf: Fix periodic timers"):

    We do not want to race such that the handler has already decided
    to stop, but the (external) restart sees the timer still active and we
    end up with a 'lost' timer.

    The problem with the current code is that the re-start can come before
    the callback does the forward, at which point the forward from the
    callback will WARN about forwarding an enqueued timer.


With cpc->hrtimer_active in place, neither of the two conditions that
5de2755c8c8b touches is reachable in perf's usage.

v1 is missing the ability to restart a stopped timer: once the
callback has returned NoRestart, the handle owns the right to arm and
never gives it back. I'll add it in v2, including a non-blocking
variant built on hrtimer_try_to_cancel(), so that a caller which
cannot sleep can re-arm the way perf does. That makes perf's model
expressible in the Rust abstraction.

