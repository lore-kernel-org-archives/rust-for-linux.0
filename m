Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9FF3DDDA1
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 09:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217686; cv=none; b=Fz3m18j/O/n+p0d1z1wawYzCB2iRjZEYgAH/793+Le3IBWcyyRse+Umit/FV62T1A8QTcKc5gKr7Y80HDkziU4+rVOYkpYGgZ+q484Q7Y1WGkJToihBLn6Eial2G+akyptPDtuFxIuWoporcSZOejX1taI2TD+te3IkZASSkSp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217686; c=relaxed/simple;
	bh=VEetsOItI7VOuy4eqKCu+WlcnPphx9V9TmEcOV9+aWo=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p3PDzV1DZh2F/1x9dZf/3+IpDw6F/tDzsp6WxGdbEsXOLUBHCvf2G3K8Vn0zgQye8G19toTyQ3Xny/FLoot9Bi0q3Mvb+GxYySeM1+QUSENmS/+izk0QcYzHequXtuXPdmhx9JrTe7QCajKQTOn4tqO/J/58TinVvu1sz7Y47+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=LY7+v02Y; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=d4cdQ9g+; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="LY7+v02Y";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="d4cdQ9g+"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id 6FDF813001CC;
	Thu, 20 Aug 2026 05:21:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 20 Aug 2026 05:21:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787217683;
	 x=1787221283; bh=sgiif5DJBHNfwuPKIMs0hFJ46RLNy3K+m63Pc4kq/p0=; b=
	LY7+v02Y5VGjz5fAbhKcW0JzGt4vVFQ4Mibfj2vYIGmj2BzQQzSmUnAf2aDz267j
	jL6DeiKBx6YKU0o3jBMn4QwfMA0dWn3dsLeqbkK8nPDTLe/0wJS86MLGVHw4cH7a
	G9AhzxsKp6MpWrke4Z4N0x4yCOi9AQsribirUVeNprq+n4ZsxQd9UCIWfPhffwDl
	y6JN/uacRJBAkaFu7+MGlfwyUwJGkw03uLRKwarkVdbAS1rETH5s1Hm7W1eTpMBt
	jgzoOrSLSObBUvNPwTDu1rZyNA7uHJitdWuvtCckDwNeKnF66MXaVc91KSOwtIS+
	rapXm+tYtOJernRiZ2U3Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787217683; x=
	1787221283; bh=sgiif5DJBHNfwuPKIMs0hFJ46RLNy3K+m63Pc4kq/p0=; b=d
	4cdQ9g+1L4GcXscxU4OhxL5qWiivD+NDWrTg0pjG4YEcaxYfN9eV+9St/BV+K5Kh
	5zZFjx+KgR6NcfhnZ2eFi1CVEOVSqlIsO20YMwi2uQ6En9hCXL/QGk996Zr6akNy
	z0ZRa4vsIWIEnMBIamVjgxc0Sz/R4ofwGpjnR+Z2Q+QYNHEpkiQKuBu8f6a42vxm
	ya8ZsaUtHaUHkPfRW0z6e9wCmDub825LB/gaMMvBHtf2OSRk2bzHv9LNeaT0GFAu
	oqkquAZEbGUV6tQzI8BQI+HbovIWXz8NVa9vtrcqvrL8ZgPPTZq0haLLxoTtBt17
	66CmqQ4QAWtDS6BPiSMpA==
X-ME-Sender: <xms:EseGanz9b3yRK8-Erm5_zIkCIY15WlFSvrhRMwvtIyl5DcMwwzrmfw>
    <xme:EseGavoJy5mf-8t6W2xJftrIGmhq2ka2mixM-Jr6DDqUn3TITjw_x_-tKhZhOE6pl
    IZ-NmrQE0zgBwVHnWJ9QhrJyGeTekYGI7qlrIv-q9-Vx9_O95m3ysSl>
X-ME-Received: <xmr:EseGaifpm2OYTS5y1JpB1_5kQ8m1ldldMIqgJbjrtHEytiKQuPLWIGyf1FrcEfB1Ku62MLl3m689Cy7pG5QydE5s>
X-ME-Proxy-Cause: dmFkZTFZdq4AHEhu+Z63Z0M1UEIDWE+fA5dfkbNf02hLsgI7HIyXIVoAbdLDDO7plg66gR
    LnXW6Al7WNxsHaEla3GMt59gYPEe7mQr4yQ/ymyS0KInABzRdoHGpTPsmI767tlep354wX
    rPJP0uTJS7q86wWhJIyu6KpxvuqNYTwdYBhDcJX32asw857yliUgfIjoBo1qvj5BRWOlOs
    vYqH/ARp8QeyUWYkMYDNERlnka9W8nFmzENcPzBIY2qoknMBrhiyHwL+oDipbcW5K95m6Y
    bxifTzWza+wD/x2CIh+wJFJ0PaIFFxstx7zGeJs0cFXlhL6oH2wOc6oj/wgbNeQ+jaxmKX
    2J4kjI4qzQP/F4+bxpsOfPK3u5uRYHc8Nmn6G7C2udbJa3D6cArHEtH4vrAkfHRWdLltyO
    bUEGOy4fbI1gwI6e/39IQpO151kPtR+rDw5rra50RvU/z0WqSrIrNVWzKivwQrfZOon/ev
    wSZhAB0+Mh8TsLeY/2+0ecXYgMIDLVbN84tYt4OtI+DY30+mcxoBgLI4kkK0CccG3Odh8y
    ksAW0fIKFwYH4wMEDZc0x4JKFPT6mO/Q8M1q6DC/1JBJCXhQZkklPk9i8jrsh7wjlE7kya
    SHblW4ES/F02Z8gHARBn09dwPmrgDpKNU9tRXOvm1hnGHpUEGgW5iJSCC+uA
X-ME-Proxy: <xmx:EseGatgAodzPpo7TlfUeGpNcOELYulikzZOl7o3XN_9Swn7yJEVacw>
    <xmx:EseGaoJwnkn_uZF4sb9Ed8qJBVS4fnk_d-JrvGP0bqAFllVgeh__NA>
    <xmx:EseGaipbHtAmXx1ojOGvZnJR9t6Qk0dK5ypV41rus3-MCohtIJrk_Q>
    <xmx:EseGaloqsp_EXKQ9LSsyzBTHEfAhefuIXGOjPGVySHiqNkwwY6Zj1Q>
    <xmx:E8eGarNNNVx-pQUG70gSQ7udceHG7nc-gIEvqcfyoFO-4nBWz2a6XPMq>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Aug 2026 05:21:18 -0400 (EDT)
Date: Thu, 20 Aug 2026 18:21:14 +0900 (JST)
Message-Id: <20260820.182114.956582163653669626.tomo@flapping.org>
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
In-Reply-To: <87h5kp88uy.fsf@kernel.org>
References: <87pkzf8wrh.fsf@kernel.org>
	<20260819.220106.1561543001385383760.tomo@flapping.org>
	<87h5kp88uy.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 20 Aug 2026 11:00:21 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
> 
>> On Tue, 18 Aug 2026 13:59:30 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>
>>> "FUJITA Tomonori" <tomo@flapping.org> writes:
>>> 
>>>> On Tue, 18 Aug 2026 11:02:27 +0200
>>>> Andreas Hindborg <a.hindborg@kernel.org> wrote:
>>>>
>>>>>> perf and CFS bandwidth have a flag as well as a lock. The flag is "do
>>>>>> not arm while armed", which is the same rule the types enforce
>>>>>> here. rtc and the softlockup watchdog look like they cancel first and
>>>>>> then start instead. None of them arms a timer that is active, so I
>>>>>> would rather the abstraction did not allow it either. Does that seem
>>>>>> reasonable?
>>>>>
>>>>> I am fine with preventing starting a timer that is Started or Running,
>>>>> but I am not liking the `UniqueArc` requirement.
>>>>>
>>>>> I have a use case in `rnull` where I have to start a timer behind an
>>>>> `Arc` with no way to obtain a `UniqueArc`, so I would prefer if that use
>>>>> case keeps on working. Without this, I would have to allocate a box and
>>>>> put it behind a lock, leading to double indirection.
>>>>
>>>> Before the UniqueArc requirement, I would like to check which timer
>>>> you have in mind? The bandwidth timer, the per-command timer, or
>>>> something else? The two seem to need different things, so I would
>>>> rather not guess.
>>> 
>>> The bandwidth timer. It is started from an `Arc<NullBlkDevice>:
>>> HasHrTimer`. If we make the suggested change to `ArcTimerHandle`, I
>>> think I would need to change the `NullBlkDevice::bandwidth_timer` from
>>> an embedded `HrTimer` to a `SpinLock<Box<HrTimer>>` or something like
>>> that.
>>> 
>>> Maybe this is fine. I don't think it will affect performance for `rnull`
>>> - this is already a throttled path. But it gives slightly more
>>> convoluted code in the caller by reducing the way we can use the API.
>>
>> I think we can allow creating HrTimerArc<T> from Arc<T>, so that UniqueArc is
>> not required. ListArc does the same with AtomicTracker, an atomic bool in the
>> object that records whether a ListArc exists:
>>
>>     HrTimerArc::try_from_arc(Arc<T>) -> Result<HrTimerArc<T>, Arc<T>>
>>
>> It fails when there is already another HrTimerArc for the object.
>>
>>> For the completion timer, the change you propose would work fine I
>>> think. I would just start the timer via the unique request reference
>>> rather than the shared one. This is probably a better way to do it
>>> anyway.
>>
>> Agreed.
> 
> We discussed this at the call last night. We came to the conclusion that
> we would like to experiment with the solution outlined by Gary, where we
> inject `expires` into the callback handler, and the callback handler
> returns a forward duration in addition to a restart value. Because with
> that approach, we can avoid adding complexity to the Arc end of the API.
> 
> For the best implementation of this scheme, we probably need to change
> some bits in the C code, add an additional path. Down the line, we could
> also see how man callers of the C code can be changed to use this
> pattern.
> 
> Do you want to send a patch based on this solution Tomo?

https://lore.kernel.org/rust-for-linux/20260814.084700.1697518597717457311.tomo@flapping.org/

The solution that we discussed before, right? It changes how the
hrtimer core calls the callback. If the C maintainers take that, I
will do the Rust side for it.

So we leave this race as it is until we know whether the solution is
accepted?

