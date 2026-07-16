Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F083451CF
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 05:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784179565; cv=none; b=idN3Sfz2ZJVY+b17DIR0f64AMVeb6vM1N6/yoLZ6GYlXy+W3En8hCutkJQNf0RGU+yZxPfEoTaGnc2c7kC45QKjyRwl4jd59xV8eXNYVLl7WhDF1eOGJLuzBixNUjdj5tEOvTWTRnDbVAwuRCmgRE8/9MYpo6Kxf7Mh8IKaragU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784179565; c=relaxed/simple;
	bh=GceRmms38wASeWc60/Ex1NUyKYIVHDTf1FJgZnfrWL0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=SMCgk0CSPn7mYWIbpDHMKyHDp1oHx+8+/xxLheXs1KDF0N+k5gOTaKZWvqn6TkYLmf6BVJ4JsoyqzBWX+dQuD5BB03Z73IND/KWPkwDCtQlwFr33EqngBBOQTRiQX1tgSwFD/sHkGPuwjKTN27bs6K1qV9u5nQX7XWoFxIk3UNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=PQBI6MkO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WS4s4JJD; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="PQBI6MkO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WS4s4JJD"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 2F52C130014B;
	Thu, 16 Jul 2026 01:08:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 16 Jul 2026 01:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784178506;
	 x=1784182106; bh=AfLbmsLGFyX2nsNGlLa0UymkSjHHgpt39UhzWIg1w2c=; b=
	PQBI6MkOoH8Vd2wj3fg/PApzPzMfcVFWB+6V8CbgmnQg3PnTaAIw9PQv/AfPPCzi
	dnuGi5aaQVqPfPomghEMgVVSQyHDrlbtp4ES5g3IgApOAmPnTmtqP8lFlP0SDAkC
	gzAYTJ3x+RKSfHvnsuOI1LD2jWvvYjkXtVh0HCh/VWSGQ/+rFdZLczGgQwTjRmLD
	GT3QFFiuE9gIg/xxbZxIJ6XDAj//ftrgJYNVokc/LcZ+bRerh/p4MFaUYw/JBFHY
	RxfS+LYe6AthamgLIScMNeptABVM81ILjc2wMEuw4Ou1hF37aq2gwFs8M6SQpgg+
	n4EoMlJ9xDXfjk3Zu0fZwg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784178506; x=
	1784182106; bh=AfLbmsLGFyX2nsNGlLa0UymkSjHHgpt39UhzWIg1w2c=; b=W
	S4s4JJD3DdQBtsMW0PdkdUIQjLRJDkWpjZe3gCbydq5/32d12d0HbFVN56P3hxHf
	UWJwJ0vfCcdCkmta5Mw85SVoJ34uq1ZtYqROTkGej6qB4CA+ZtXJs2l4gYty4R8s
	I8Me9Uw73MyI/7r6fPV+Ju2tO0+OGF9OqmYzecqrvbZrTnnS7Ja+7O/8jdWDa2z0
	QSCchpKx0iP+xPLXLj19ufl9aOo0yAFp6gm1OcwiCS2ek0naCAPZqe1wtyEILwY+
	1nWRAZRw2m/oo9AMjzsTkWqWLV9+qxLdBgTJqtfTvn+mjyJsRD+8cy9XAotbcAw6
	5/ahfnAoSPtOQKpCpTMkg==
X-ME-Sender: <xms:SWdYauN0k6ODwveqXWSYK81lIv9ttWS9CaUH7cMAZ7d1xlboCWpnNA>
    <xme:SWdYas0189wYwfGuSDqUZtyWgIC_CHd8E-n4yatKHetfapuNL3bc8CuBffdNN2Dfp
    oH37rV8quQHO8uIsSu5oL7aqPiQughqd2HZ16-WOYjEi_hzle80av5n>
X-ME-Received: <xmr:SWdYaikduEv3wOeNPPhETMg_iwxnj1wq4O0r7-34zJcL-f4VnYncpp_79VbbYxn8e9Tr1F2wkDobNwtPhPY3qAof>
X-ME-Proxy-Cause: dmFkZTGxlNX0WchkO1Hbz3nI+r50Lr1MDC+FGu5025zsoFblWRwyr9Vfb0UdunyP7fKfNq
    QpUNvfLyO9IkYy56CAeXCvaLWJ8rmgEfst7weDYbPNruep9PxGWm3ZVapxjCQXqV02ZUcs
    q8fo4A59z6EixLxtdp86qeJuvpdjmTkIsX2qbnFXu9haVFZSLRMui917WQXGZDgjWnFr0v
    IXLRR8XAlLlAQonZI9PmY9tGFLUOSvV42+swOjP55cdAf+1R/cNAN7qIgp9/1IwG6CvwdH
    0ILL4IosvMmMa0dK+V4xmGhklmRmXoDS2oeTkw1b9qzUShltGSBVL1gn4hRqvI2aVZbgNv
    RbxTBnOjet/iIPPdU63X7s7AI2e4uKIshbPN1Gt3LK0oYyXKXcqEP65jIS6o+CeVDzc7yR
    itYqmwG0q9N5RxukfPpfeGyKNkrNvizcEqKHmKngSlZ5e676cFVWETumbAfWMR7luVfKkc
    u0/HithB8BAuGpEYlpIlAm08lDZRTJaOyUepyjqIvupkyKelmDkHO1K3vsMp5Aw8sTiERR
    +SpJACc2BNAww8qWuiLZBc8cT1xMfrPD8En3I2GpnbtvBYwCC/knc2LvbqmPK8xnB/FR6T
    ZnefOG6eaHN5q7SG/VbtX/B7mqOYcFsrrh1nTIklsURfQvXSXuykYyD6Yrrw
X-ME-Proxy: <xmx:SWdYaq73E_9Y2NeQs5xlp5l4CVCNcgjQVBjk3NjyySOqXYV4NQtvOw>
    <xmx:SWdYajme9vqac5vu14_ErGMClvqvH23rH55bZoG6N4EVqdYLcGiRdg>
    <xmx:SWdYakTajgoDegVwC-NaguzEqodXWU-7kL0IPQt-hkUCGmuUQyhU-g>
    <xmx:SWdYapnC7CO_dRuquhnDplChQ8GYiljWzf6_wY70tyR4tfpkBadUmQ>
    <xmx:SWdYavZiPUhqyN-QwbmXdG5roMcipL-n0d_iy3BmIRQ3sxBYjmDI1f8->
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jul 2026 01:08:19 -0400 (EDT)
Date: Thu, 16 Jul 2026 14:08:17 +0900 (JST)
Message-Id: <20260716.140817.2274294223385671448.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, aliceryhl@google.com, arve@android.com,
 boqun@kernel.org, brauner@kernel.org, cmllamas@google.com,
 gary@garyguo.net, gregkh@linuxfoundation.org, ojeda@kernel.org,
 tkjos@android.com, acourbot@nvidia.com, anna-maria@linutronix.de,
 bjorn3_gh@protonmail.com, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v2 1/4] rust: time: add jiffies conversion helpers to
 Delta
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87cxwogywo.fsf@kernel.org>
References: <87ik6ghha8.fsf@kernel.org>
	<20260715.212021.485543459172925773.tomo@flapping.org>
	<87cxwogywo.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 15:33:59 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
> 
>> On Wed, 15 Jul 2026 08:57:03 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>>> 
>>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>
>>>> Callers that hand a timeout to some C APIs need conversion between
>>>> Delta and jiffies.
>>>>
>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>> ---
>>>>  rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++++
>>>>  1 file changed, 30 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>>>> index 363e93cbb139..cd054ea5df02 100644
>>>> --- a/rust/kernel/time.rs
>>>> +++ b/rust/kernel/time.rs
>>>> @@ -377,6 +377,20 @@ impl Delta {
>>>>      /// A span of time equal to zero.
>>>>      pub const ZERO: Self = Self { nanos: 0 };
>>>>
>>>> +    /// Create a new [`Delta`] from a number of jiffies.
>>>> +    ///
>>>> +    /// If `jiffies` is large enough that the corresponding number of nanoseconds
>>>> +    /// would overflow an `i64`, the result saturates to `i64::MAX` nanoseconds.
>>>> +    /// The exact threshold depends on `CONFIG_HZ`.
>>>> +    #[inline]
>>>> +    pub fn from_jiffies(jiffies: u64) -> Self {
>>>> +        let nanos = (u128::from(jiffies) * NSEC_PER_SEC as u128 / u128::from(bindings::HZ))
>>>> +            .min(i64::MAX as u128);
>>> 
>>> In general for this patch, why are some widening operations using `from`
>>> and others use `as u128`? Is it not possible to use into/form for all
>>> the widening operations?
>>
>> When NSEC_PER_SEC % HZ != 0, we need to multiply jiffies *
>> NSEC_PER_SEC before dividing by HZ.
>>
>> What the C side does is:
>>
>> u64 jiffies64_to_nsecs(u64 j)
>> {
>> #if !(NSEC_PER_SEC % HZ)
>> 	return (NSEC_PER_SEC / HZ) * j;
>> # else
>> 	return div_u64(j * HZ_TO_NSEC_NUM, HZ_TO_NSEC_DEN);
>> #endif
>> }
>>
>> We could replicate this with a cfg/the C side's const-eval
>> computing. But I think using u128/i128 is simpler. What do you think?
> 
> I think widening to 128 bits is fine. My question is why `NSEC_PER_SEC
> as u128` instead of `u128::from(NSEC_PER_SEC)`?

NSEC_PER_SEC is defined as i64 because Delta stores its value as i64
so the other constructors can compute directly without any cast.

u128: From<T> is only implemented for unsigned integer sources:

error[E0277]: the trait bound `u128: core::convert::From<i64>` is not satisfied
   --> /linux/rust/kernel/time.rs:373:44
    |
373 |         let nanos = (u128::from(jiffies) * u128::from(NSEC_PER_SEC) / u128::from(bindings::HZ))
    |                                            ^^^^ the trait `core::convert::From<i64>` is not implemented for `u128`
    |
    = help: `u128` implements trait `core::convert::From<T>`:
              core::convert::From<bool>
              core::convert::From<char>
              core::convert::From<core::ascii::Char>
              core::convert::From<core::net::Ipv6Addr>
              core::convert::From<u16>
              core::convert::From<u32>
              core::convert::From<u64>
              core::convert::From<u8>
            and 4 others


Note that the u128 division here does not work on 32-bit architectures
so I will switch to a different implementation in v3.
