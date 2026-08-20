Received: from flow-a5-smtp.messagingengine.com (flow-a5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667A540D57F
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230423; cv=none; b=VRfo2BoNIK5zGcNnegCc3hDscxYuu+FI1dSF8LTYMEu+AgzEm+WHJ8a6E4l8BFSNmAk4vL+BLa3LITskThEj/7+jd0OMfErdQC3fWJQo1wKBSXeH3ooczSWS3UhP/W5p69Jg9kT5EOV5O2eQ7df8gWnoQqMtj4Ix8Y0NDyaL6Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230423; c=relaxed/simple;
	bh=TkikFQC9M+F1h65Q4bH8E44GI0vgbXkY1e1P3QNRpfw=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=c5rGMuejN6FSLHJ5rYIr2vxO/qYtUtbHpbK9q3vzj5BWBLSE9luuJwNRE3y5UAm6yi8Ga4jAdZlRatc0OPzti2sambREzBifP0q1JvGLTHtwxWSZio3Ql80MkoXmAIjzy3dzizU/010GI/nWzpmQLMfeYKKChrUYRUdRatFIP8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=gY93GhzT; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=k84WCorB; arc=none smtp.client-ip=103.168.172.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="gY93GhzT";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="k84WCorB"
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 61700138043B;
	Thu, 20 Aug 2026 08:53:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Thu, 20 Aug 2026 08:53:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787230420;
	 x=1787234020; bh=b0n8e5HBW0HQzHJYfOvqpWJuQ0XGug4tO0qOd2lZBhw=; b=
	gY93GhzTG0CTe0Tjgp0xtawGO1tIr5rpKnvc9/htuJeHMgGyvSXzaA68LmWHadWF
	tNWVVeuPlOOYQAa5IlkYe+8o8GpSdslib4DVuPAw6Cgv7EayfyWhAMHHhV0Lz0TX
	TN0OUgF8h+6qeZgI83DR4TFnnxpOHoBane3NAJEVjZzEG4qOiMGk90q2JMFTeqQh
	mKmdllZWx2Es7r74OLqkLLQVsSY0QSzPEkxgPN9FY4XzNQTiETfu3jd/lNe3GKU1
	ZXw4vhtiVMCWdnZhJ0vBdWCSFAOvk9KmbmRLk6U2KctEn/KG99b1T+/55sAX4JNx
	7zpEX4N+t9MfFgx4A9wmsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787230420; x=
	1787234020; bh=b0n8e5HBW0HQzHJYfOvqpWJuQ0XGug4tO0qOd2lZBhw=; b=k
	84WCorB9y1X/8MZ4Cjjq6x/PvHm6lXX2BurVGflhQTWFytvjEOB1dNE+rxqFPbTK
	+eqiYcvXB+WHtl8yeO4tQm3RvSCBYiHbF2v/yofqRJolr1Mg7ogdalhlga+e896v
	RVxa74lFgQ9rpIp9S36z8D+uFizMniliUc35Um46SOnSDyHUCSG45t5uTpjexX+n
	S+VvetalsnBmUEvLeNnW9HplVGE2Dy4amS9aJyWjJVWaxGP1IDVy5NU5EsQyqFJI
	3do0mwNeebDma0bllRy5KpQblkYI7oKARtqy8/7ERQXYmaM5kGd8fLI6UTgMKw/f
	ttj2HflQyPnpYO1Yd06uA==
X-ME-Sender: <xms:0_iGajKQose5t0utBlV_TXMgBHaKyvOm6aBU5JVuDgfJThTtDT6AOQ>
    <xme:0_iGangF6yEKDSQgScUL6nXw9XvpwQlQguN1hqDFVcV7F-LKdJsGV1zgJZFfmx-HF
    0bp0Cil2tCWnGcvUyTQnPPjmlA6Rrqpb9E3KIY691oVJLgagsovYnuf>
X-ME-Received: <xmr:0_iGas0xVTGRS3FC3f5WVGuAQLaLc3uIpMDibqb94PXFfml3DjW0uvP0g2NVnSYx_DjymH5kSgRX-_AAljsICRQY>
X-ME-Proxy-Cause: dmFkZTGqEmE/3M91CGzJxVj4hGx1T3moeh08thHyl1LO0/S/r0eHwuWEHM8sEj+YKlyWev
    l7A/w55R1B9LImnbm6bDuvOyDCVlurJuhAI/5vtCY2c6G+5l7D5PyIiYlkDOo4EI1ycACA
    R9BcFG2qMyLhwYFMZK7eUoVHf8h36dxOsd/AetDqKU8zW5krGeVoC6iFCAFiZ+LeCCBUxt
    Uk9kJ9tCZdIvKM4MPNES0l6AN4Ro1DyvOZJRKDJ34Gijjqpcl4iYK0fbP30JqJTWqxBgZq
    MK21DnW/J4dN+frE807Kk5ZdtU1iB34o4iS63fM7b9RkLbWkqDbCgVpPdWaIB4D4nbtfYU
    aGcFHkVSYm+Lf8SfJmgn7tDjrLZjEbRkcqmWOIew0E6V1MCcVW5z/Tmp/F+Q/5s62VVE6X
    1VwjycjVe9OcNY+lpOw9AAoYVrYaNLO/0FIfDbLYKEDhf/mnTjp0/FcD+GJjztelJ36Aa1
    6WSk+uFZ4/5IkPjY2mKdH9HDL46BwHqTPd3RbLT7JzmwDA981OlVtEi8B5OVACH8HCFR7z
    1vIqnsxgTlRmgOrDXmCv5PErwZxpbVT1zJfnSC67VEQQZsUVFTwebvbiGwp/8voGM08JfM
    7Clnhg0yj9Wzg/zNFdTZCArec2cxnExzLsdnXgt8Xnv4mbPeCCegsa4iBcng
X-ME-Proxy: <xmx:0_iGaoYT0ti0GbmT4qoSRXmsR38-y33xn8U9pzU8sCPmIcGjeNV9Cw>
    <xmx:0_iGapi4s91YH5crcVDOVYb2Y__q_Nxl757fNSYnLc-Zg4LptAqcxA>
    <xmx:0_iGaojQOYTGRNF0XbiwNv3WWt0zDVI944L5Miq8PD5kue4ycqS1iw>
    <xmx:0_iGamCXfbEhjVqoS_ilpoLyobKx9ZqBgdhKQt0hpLqU--tgtpRuYA>
    <xmx:1PiGauEB9fkRVWCjYUa2V8AJpBL3nrFrRZgMzNUcRcMC9m6aRg_A7ETA>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Aug 2026 08:53:35 -0400 (EDT)
Date: Thu, 20 Aug 2026 21:53:32 +0900 (JST)
Message-Id: <20260820.215332.1257209020327006274.tomo@flapping.org>
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
In-Reply-To: <87ecft7yyf.fsf@kernel.org>
References: <87h5kp88uy.fsf@kernel.org>
	<20260820.182114.956582163653669626.tomo@flapping.org>
	<87ecft7yyf.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 20 Aug 2026 14:34:16 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>>> We discussed this at the call last night. We came to the conclusion that
>>> we would like to experiment with the solution outlined by Gary, where we
>>> inject `expires` into the callback handler, and the callback handler
>>> returns a forward duration in addition to a restart value. Because with
>>> that approach, we can avoid adding complexity to the Arc end of the API.
>>> 
>>> For the best implementation of this scheme, we probably need to change
>>> some bits in the C code, add an additional path. Down the line, we could
>>> also see how man callers of the C code can be changed to use this
>>> pattern.
>>> 
>>> Do you want to send a patch based on this solution Tomo?
>>
>> https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/
>>
>> The solution that we discussed before, right? It changes how the
>> hrtimer core calls the callback. If the C maintainers take that, I
>> will do the Rust side for it.
> 
> Yes this one. We don't know if C maintainers will like it. We were
> discussing having a separate path on the C side just for just,
> alternatively converting C side callers.
> 
> I think we should be able to reach some kind of agreement with C
> timekeeping. But if not, we can solve it on rust side only, but less
> efficient. We can grab the base lock again, read expires, then drop the
> lock. But better to do it in the C code.

The Rust side cannot take the base lock: lock_hrtimer_base() is static
in kernel/time/hrtimer.c, internal to the core. So that way needs some
agreement with the C maintainers as well.

