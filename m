Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D76366049
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jul 2026 09:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783935649; cv=none; b=q5aqJsYEJcb3UWin2iClUfa2M1g1PHsWEvYpI6d4FDpcDDdkQDJ5xqjJVPz960rHT3z9lLMyq1XujYOHUGJWRqW5SopyGZzCBoGxPfyoiabwDwrHpd/3wU7Wt26uWdErVHWKsSkRjt0FdJpsQJoMo6abvb3z8RhWSDCZ9BJhTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783935649; c=relaxed/simple;
	bh=yIo2Zhqsm8a2s6JX8JsG+n1bivzQFxFF1Fhq8AympOs=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bTYkoiaulu4TUJy9LoCGUwj7h3ZXFTllVLs1GAn4+tX9yAuO0H7kfHBt4G0Mh+Vgp2H6SVr3NDeb3Xd3+TW+HTt69ZNqRHhd7Oi5vHb/JBsZ5kZA9/TIaYCeAkO+UAjAPwEuBlYBNjqhz1tabhne8NP2nzVnSjNFFxcUv3JgnJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=XlyCfVXE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XBqCtdIg; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="XlyCfVXE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XBqCtdIg"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id EA6ED1300189;
	Mon, 13 Jul 2026 05:40:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 13 Jul 2026 05:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783935645;
	 x=1783939245; bh=iAK5LYRYSJhNhZt0+FxNEGYumz4+jwHWeyr6u9gQSew=; b=
	XlyCfVXEk93+MZIweyyKDGSQ+daJm+3wL2NgJICHQLIgWQuEOV2CD3KYA5L8DIER
	L5csxQUMgmkQlgetg3yQzIoNcJJF5a44uqPf4l1JfvGn306kT8jwQ8Omz6/Xwg/x
	NHrrDyFLSgAbih2NkYiZFt4yGDh80NRthb4zty889MqhvbaDDqzOJrtTeklhlF6F
	pu0LlvrDVaZYFmE2XrsCtI3zzu+UFZZjTGfecTxk22qzh3CUhEGdfosRQTWfj+XN
	razH8O9R4bwnaiLY3t5zigL4DE3+LsZVluXYwWrPbxHEpBo+iE+ncUGus6xGVG8F
	f8olOH4XbICLSIsXKyl1RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783935645; x=
	1783939245; bh=iAK5LYRYSJhNhZt0+FxNEGYumz4+jwHWeyr6u9gQSew=; b=X
	BqCtdIg6FwjakyxsNBGrTOQSxgFnymA2BCtOn3ahS0JDKBdtotU8JQhwqqNN8858
	kOlzqcK60rie9vU3KPnCtxIE+tBnB2EnfFbk+3+F//3s9zsFHDTp2B4DRQrjuX16
	Dbvw8egcj+4tiOV6WXiLxbu7LvSFzT2r6yzrmWKdBWZHfowyTdQDkFJjx+ecH722
	ZgyaVYwSnwwB1MB9c7FXs9T4LP5XQxK1G/XGxycs231FIowHcF4KE31o1Oo72w2q
	EzNWUTrriGZHjq+R5ijpJOA5gm6yb73cv7uyht4bppf4+zs5miFRVy0S6FV/gcaP
	wEtwLe4GyH+GwMGP2NG7g==
X-ME-Sender: <xms:nbJUaqsKFlJkcsPl3HzeoxS_TAUt3GBLDrjlfx4mq9N5sAj15RKmXA>
    <xme:nbJUaq8zdDekBO8j2K7HQhHQaPW4ZuZbcE096W_FiowynusQrO5xa-rC2cF89XlRW
    hjIIkuoRE-o7cjQtqEiyFNYtioZjAd2WGM-KYhmYl-48Ap5HQpGn4A>
X-ME-Received: <xmr:nbJUarzy7VHlhFkSvox81y4ktCdboYGHdHkb7NJ--AWKYAV7MYoD2hnu3shkQ8t63nSe8Upn6E9LuuYfsYR8k7kZ>
X-ME-Proxy-Cause: dmFkZTFHl0HO9RNa+XVkVtF/pdE66ZUbgGlonUB23LoHhH6vt++ljR2b6ZBjSOrWj62Hk4
    vqIzvwlHGESFUFUg8qX7k1JMz5hYAj6lt5/UN6jj/wYc1PUvFfYIDggjgoDIAnE3ZvmXpj
    xS7/fhvVhxtf/BqBWK5w5HzpOSSBzYXpgZg2ytAVdMU9o9UMRQ8lbTdgKtlu0PTs85Hkxv
    wMZWGrR3x9v6TK6Kbo3myVP2UoPXAEINNzls9L/L2ouPvsf5ObcY5hAtMFd6RiGcxOHion
    RiCVu2cRwZ7YSl0r+jTsVpVy2zfFQfVhVnJF8J/1MICpa0uJqodGWE/07neFDqIbMZGvs0
    M/od+iv/bBygR7gJUwZOArSudIGUiuJenXcrfoe2CEMk1WTIw9t1U80jqsSAIIOnFBkipE
    gXxRpvXMMs3MyBq3O9YqLgkYXeh9xa/k/hEboiTpyFa5UWd5+B8jpEBkvztQRotYE28E8+
    kZuYjt0frBdzqQScat+0IXEsUQV19D51ZfCVxsSG6CeKfGob9EyUQdH6BS0H2DoXrMZ9g6
    54pxXEPWXQdUHWWk+fobh7nFc2YkDJUxZeLZF2ZU8hwk4p1/KmD1DutkYfbwHgPlglCLbB
    OIUFl1LF9CtF8663uK5VB2FjmzkASpfROnBgIndSmOiB2EzG+0NTYmMNDOEQ
X-ME-Proxy: <xmx:nbJUai8XPa71SqP_U3nOzrcH4p-MIPKiyd4m4JsET9iO4qb8YXAC2A>
    <xmx:nbJUagJfBYc9peSqvfAEZx3LfuzrDd7Gjpgm-L0A98C0Wn0a1kFfww>
    <xmx:nbJUan_7zcBi5us8Ft6xWiY8tGrs1Te08sSXLjf3xK7OFe5akJZoTQ>
    <xmx:nbJUasHHAI2ghvgQ-tVcXBWFNfDUtcw29ZNE7M_UtXO8T4w4J0G9wg>
    <xmx:nbJUavYqhrNKkrkSgPM-_aVsf7o7pt8A6U5Pk4AO4HfDlEIl0RVxDPR0>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jul 2026 05:40:37 -0400 (EDT)
Date: Mon, 13 Jul 2026 18:40:34 +0900 (JST)
Message-Id: <20260713.184034.916211318483609924.tomo@flapping.org>
To: work@onurozkan.dev, aliceryhl@google.com
Cc: tomo@flapping.org, a.hindborg@kernel.org, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 3/4] rust: workqueue: use Delta for
 enqueue_delayed's delay parameter
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20260713090732.115293-1-work@onurozkan.dev>
References: <20260712235246.3069713-4-tomo@flapping.org>
	<alSpDAILCIIU4q7u@google.com>
	<20260713090732.115293-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 13 Jul 2026 12:07:30 +0300
Onur =D6zkan <work@onurozkan.dev> wrote:

> On Mon, 13 Jul 2026 08:59:56 +0000=0D
> Alice Ryhl <aliceryhl@google.com> wrote:=0D
> =0D
>> On Mon, Jul 13, 2026 at 08:52:45AM +0900, FUJITA Tomonori wrote:=0D
>> > From: FUJITA Tomonori <fujita.tomonori@gmail.com>=0D
>> > =0D
>> > enqueue_delayed() took a raw jiffies count (a plain c_ulong alias =
with=0D
>> > no type safety), so callers had to know on their own that the valu=
e=0D
>> > meant jiffies and convert to/from it themselves. This mirrors the=0D=

>> > issue already fixed for CondVar's wait_interruptible_timeout().=0D=

>> > =0D
>> > Switch to Delta, the duration type already used elsewhere, so the=0D=

>> > unit is part of the type instead of a caller convention.=0D
>> > =0D
>> > Use as_jiffies_ceil() rather than a plain truncating conversion:=0D=

>> > queue_delayed_work_on() treats a delay of 0 jiffies as "enqueue=0D=

>> > immediately", so truncating a small nonzero Delta down to 0 would=0D=

>> > silently turn a requested delay into no delay at all.=0D
>> > =0D
>> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>=0D
>> =0D
>> It seems unfortunate that a caller might be forced to convert jiffie=
s ->=0D
>> nanos -> jiffies if they already have the value in jiffies.=0D
>> =0D
>> Alice=0D
> =0D
> Yeah that's not ideal. We can solve this by making the argument somet=
hing like
> `impl Into<Delta>`, right?

With impl Into<Delta>, the argument type changes, but if Delta's
internal representation stays a plain nanosecond count, then .into()
still performs the jiffies -> nanos conversion. Then enqueue_delayed()
still calls as_jiffies_ceil() to convert back to jiffies afterwards.

#[derive(Copy, Clone)]
enum Repr {
    Nanos(i64),
    Jiffies(u64),
}

#[derive(Copy, Clone)]
pub struct Delta {
    repr: Repr,
}

The enum representation like above works? Delta::from_jiffies() just
stores the jiffies count. APIs like enqueue_delayed() that uses
jiffies time-unit don't need to do any conversion.

The downside is that it makes the Add/Sub/PartialEq methods
complicated.
