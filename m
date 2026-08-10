Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F03D75A2
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 12:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364153; cv=none; b=AQNTXUah2mu2gYoLuQ+7/LdYDwSbnLk07DxxvKVUHgpDVJiucI2cAvPQpfAWecWTRKXO1SZapSu9L+GAZaB+mLSC+7W6FYep567FrLfHnJ4ZQVvxz8029QF2hUzC1ob/hpoIpqJf1RyfU0u/CIgrn8rM/zu/i/xBvH/PVeqOpDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364153; c=relaxed/simple;
	bh=0/pOQl73wytep2frPnjRtGJ+qEMFRk3EjB5zEGeLehg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=XAQMxE3Ww+7dhXbHRY6hTdsowCapcAaKTIyeOe3I1YLEoOU9UowAmhmYEQtMAoOn3UopEWk60f59s0JQFt+Nr6u3Q2GTDT+tqdO1n5sKgOb7eXJNfrnuusJyAQum0kOS8xjqQK8/GdxOB9Iikwpb+EIRAr5u73DRsNArZ+GAXmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=SaZfwlRg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=bWquuwhL; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="SaZfwlRg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="bWquuwhL"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 996BB1380150;
	Mon, 10 Aug 2026 08:15:50 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Mon, 10 Aug 2026 08:15:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786364150;
	 x=1786367750; bh=J1r1kts7Lv6eINPIAnD2xGDJaw35EHBUD78yu4SpjPo=; b=
	SaZfwlRg32x3QsXUIzC8YZd+eyDkAoUaEYfLAlUFSLpz4lUJhXFo09swV83cZXeV
	fCOHR5Pj6hsVTsaYzgwh4e0PssUdbLRP740qloXIbVwad/Qto6O/gb8WGHdD+eUa
	CXdKK0G+QeGMimSQu5UnVeBKKa8UY5CCV4TRXFXjz4on/t7H7l/Xoc+beYbojzAX
	S3L0uFV2NqQ55qDp5XBGRNh1CyBhwZ73CtJuai3Y7aZYjDm7QQhdn9x43xGYG6z2
	gz4YS6mmdwfiEanR04Sh4Y7oivttDr7dZicaDa4Bf9U/zclVIKbeLl5mnp0m2vxS
	DqRAHn0Kxzy9+DsLi0WYSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786364150; x=
	1786367750; bh=J1r1kts7Lv6eINPIAnD2xGDJaw35EHBUD78yu4SpjPo=; b=b
	WquuwhL/8aZlz0wYmuJDXCXe2mBT/rJWiBtBfOhZeWTATt9aMe4iltns4gAdb4Ah
	c0BG6/Mq98154/AoppXHhJ0/l06uuuG08WtTPCS6q0SU4XfIMRJntq6cqU7OMoFZ
	xQqvvNR5Ol9WB8Q4TFZV7wXYLLGL+zPOoRr33EvXO3MfHjPlr5dsdN5jo8/EGGPY
	Oo5VBE5Cme2VGgoO3+Dj3jZI+sxN0MDiN9nJynrLuxTIQLSXnarMk8kLVb2ytsPm
	ObAdPKUQYfUVKvS8g2mAYeynXLMIKxWSmsEvacLCfxyBgF2qEe1Av97tGetxnjpp
	OyUP4bN0gmCVX7VTXxuAw==
X-ME-Sender: <xms:9sB5au1LZymLdOjD_DNpNPh2b6bB8TtffU1-rLkpmNcag6cPWywt5Q>
    <xme:9sB5ag_BkBThbGlkW4Nm51t-EGiZKq0caAkhNXpzLJ2AzpKVvmXewCWC7GfDHN827
    LSByVK8R-Sn8-ukMe6qmGhp4tFJE7UZvblo3rBifP5_TID-IRzU>
X-ME-Received: <xmr:9sB5akO0wSG0nTqc00PCuOFeuqEmtXohsj2Bh9C8AfyPAp2C0Sc-aqq7z5NzbAXdOBo0WBHpuY9xTtagWC9oK3zP>
X-ME-Proxy-Cause: dmFkZTGJ8V5YR8kymuYLgcZdRpbouyS1x0NCzpm/lWJsncPdnGtXjyejK9mHSFk4afvVLg
    2rLCudXf53nbe5p475rmdOoWpLhhbB7aYYu0RLIXC5GpBk3s4WnFjwZLF5eS/9SN2pjYNC
    6y5WldDXVs2VUEJtkO9k6C5ZnQPKB8CwFeCSWa4Wjy8nPHwkEovMB+OsmScBcHT2/ZrM9Z
    9LnLA5xRIof+rc97AkPZzEJlfoWHrO3Lyb4S3g3rD6wJULEOSAkGwRqKMYF7MI8fr/Cmpi
    iz+US9Tyz2LZJpxJZ+S76ED9C3m3rjFMqkeQA/vNWSAE3yV2CtDbKmiY6u9YfYTsUQzCkE
    8SfefOjebnuCRvZ5YMuvOlrVmOl30UObk9T22Vg72906HZ/WbsjwCaKbJ3DyE5qpG2eZdq
    h+E0q3uvC/n8ZVU4lfCTCyzQ0QzPqSboYIIqsd+wvAZjfrwfH4LlDamS5yZvHSjUdvfcg2
    PKTw4BqcZ9OrLkDoSgKLvz/uYy3+fQ3vQGK9OzxhIkWT66L3Nk32buiC0gAaQ/nES4pZ9H
    W2zRaCP4UQBpf+vB3WcpYppu23W/qKl8jVFta25sY8q0zLWePXXqWom2MyEe/7E7QkkCoP
    9K7WNmZ2kyn6lDPYjf2gIaijvI8PXkt3d6Gm21iEVjOecLXNceP4ZiB+ZQSA
X-ME-Proxy: <xmx:9sB5asCp4pbANC3Hi17aKu82EsBDOATF_UEWzFCYMXFKCp1FdAJuPw>
    <xmx:9sB5auObjBZ5WcSwoDHCM_9iJEzE__KX0H3j48Yexj0PlZuirdBD-A>
    <xmx:9sB5aqaXCtAonDClx6zdXbFOLClBk_9tpngWzKdcxu9cF3cvCgUKdg>
    <xmx:9sB5alNxGviefDDVgARR-e3a6qlYp7-futUFrZ2CNOqWOM-Dmz5H6g>
    <xmx:9sB5auCTPUw7OXVtgzRj8CsWxse7BLOb5Nlyv553JIWszM6YzjLrJaWS>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Aug 2026 08:15:44 -0400 (EDT)
Date: Mon, 10 Aug 2026 21:15:42 +0900 (JST)
Message-Id: <20260810.211542.1020667562439851698.tomo@flapping.org>
To: a.hindborg@kernel.org, ojeda@kernel.org
Cc: acourbot@nvidia.com, tomo@flapping.org, aliceryhl@google.com,
 arve@android.com, boqun@kernel.org, brauner@kernel.org,
 cmllamas@google.com, gary@garyguo.net, gregkh@linuxfoundation.org,
 tkjos@android.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org,
 tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v5 1/7] rust: time: make Delta generic over its time
 unit
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <878q6e2p6f.fsf@kernel.org>
References: <20260807.211008.1388653306665929214.tomo@flapping.org>
	<DKK236MNP2NH.MFG9QEPIEH1M@nvidia.com>
	<878q6e2p6f.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Aug 2026 13:24:56 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "Alexandre Courbot" <acourbot@nvidia.com> writes:
> 
>> On Fri Aug 7, 2026 at 9:10 PM JST, FUJITA Tomonori wrote:
>>>>> +
>>>>> +impl TimeUnit for Nsec {
>>>>> +    type Repr = i64;
>>>>> +}
>>>>> +
>>>>>  /// A span of time.
>>>>>  ///
>>>>> -/// This struct represents a span of time, with its value stored as nanoseconds.
>>>>> -/// The value can represent any valid i64 value, including negative, zero, and
>>>>> -/// positive numbers.
>>>>> +/// The span is stored in the unit given by the type parameter `U` (see
>>>>> +/// [`TimeUnit`]); its value has type `U::Repr`. `U` defaults to [`Nsec`], so a
>>>>> +/// plain [`Delta`] is a span in nanoseconds. The value can be negative, zero, or
>>>>> +/// positive.
>>>>>  #[derive(Copy, Clone, PartialEq, PartialOrd, Eq, Ord, Debug)]
>>>>> -pub struct Delta {
>>>>> -    nanos: i64,
>>>>> +pub struct Delta<U: TimeUnit = Nsec> {
>>>>> +    value: U::Repr,
>>>>>  }
>>>>>  
>>>>>  impl ops::Add for Delta {
>>>> 
>>>> When you add `Jiffy` later, this impl block will only cover
>>>> `Delta<Nsec>`. Is that intentional, or did you intend to support
>>>> all these operations operations for `Delta<Jiffy>` as well?
>>>
>>> Intentional. Delta<Jiffy> exists to carry a jiffies-valued timeout
>>> across the C boundary; it is not meant as a general arithmetic type. I
>>> can add them if a user needs them.
>>
>> Is there a reason for not doing it now? Common arithmetic sounds useful
>> for any unit, and since they are already agreed to panic at the bounds
>> we can constrain them on `U` implementing the corresponding traits.
> 
> I agree, I think we should add these. Unless there is some reason
> preventing us from doing so?

No reason for `Add`, `Sub`, `Mul` and the `*Assign` variants. `Div` is
the one exception:

https://lore.kernel.org/rust-for-linux/20260810.112355.268188462246300198.tomo@flapping.org/


> If you guys are in a super hurry to land this series, and if Miguel is
> still fine with taking this so late, you can add the arithmetic next
> cycle.

The reason for landing it this cycle is Gary's point from earlier in
the thread: the users can then be added in the next one. I expect
those users to come via a GPU tree, so it would save some coordination
later.

Miguel, would you still be happy to pick this up? I'll send the
arithmetic as a follow-up next cycle.

