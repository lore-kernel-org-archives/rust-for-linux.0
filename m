Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197A299A84
	for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 01:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784166659; cv=none; b=YoaQrWk0QLei538C1nBjn9iTlkTyLb2sl7nvFoubaD4Z8eagne/UAL32sFF5mkJm7hrUhpD/WF7Z61F8L3LdbTXOBXrVUXeRHbPjFOhgi7MQXsBVIIT02tt2z6ut1HhueePT0WuIZIepGeXGcXS2vattSPNa5z0Rw1BhnHGEg8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784166659; c=relaxed/simple;
	bh=d/7egs84emMyAe/PPeG2p2+UVITwJUelgTxva8Mj+7I=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bB5WwbQAkrVjC/qH/w2mYFELRS2OQw11xFVJb/YnAFF5lreKDPRf7YKV+a1carJbcTK4m3qy133RQoG1hPmsdvEYMkyRjoTF8oF3sJuzh8PHDzanwJWxkoMqe/dfXWJrgR5a0lftU15f2tCxSBLFfqnXf1EI9NRQ/YStS868j2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=bWcg/Mbo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g0RFcvLK; arc=none smtp.client-ip=202.12.124.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="bWcg/Mbo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g0RFcvLK"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.stl.internal (Postfix) with ESMTP id 591321300343;
	Wed, 15 Jul 2026 21:50:55 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Wed, 15 Jul 2026 21:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784166655;
	 x=1784170255; bh=hMnAqzcwKGVDnXtm1ejkhmyUts/BX5ZB5jusjvGkTJs=; b=
	bWcg/Mbo56QF2k68mtJCy0ggOjtI2NQr7d7sj3vl86iyFFUc4xuxRYEav4LSUQmT
	7qG9W/ReIlo9OMeDOjN6pjjy1t/G3DxeUTc9PPxJCT6+4o/pH4K/x64uR/Sw0Yzu
	5eGqNqJ7eZAnHlUe/lOsYHBRf8+U3kArFXYz6tlcKgmAB8pEMfaFBGR8Yxp602eu
	KhOVtcR1Os9jewVUbAAmdFEO31pNaVskZZXHw9TqTDySgJb+f+KqrEhTv7SSEGVd
	E5SweztPWJjcARtlHgyxNa11MXyFYw1SNcIIm7wvgiAqxwYp3rCYycDsb0uCeFgd
	XKBfM9yPsVy90LkIG46hrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784166655; x=
	1784170255; bh=hMnAqzcwKGVDnXtm1ejkhmyUts/BX5ZB5jusjvGkTJs=; b=g
	0RFcvLKaEa31IBEDekDE/ez1VNiH5h25Fbjlmk+Hyg35STCqsHxSvk31TloX8rD9
	+G3TMIpmFQqObT79g7sYAn83FuyJZG/w9X9vy4W3Nd9Ns37Z2gdtQ801uOUUksoh
	2iTehDzeReasfSyi14tmNuOTDC1N2mowLhjryDHhXEvZo+G7lznmSA6lTbOctJB6
	Wi/E8v3Z15n7CjgkAorAw4UQdBcktqaY/Y9blJhsk+xfnvyyqTmDsIrSQSd84bIb
	O/qAVhIDlScVDbJiULqg+V3CIw/YiSQsNDtbpEYh+kIKIdG2gM1vB9UAPgjN9RcZ
	dMdV6AT1kxXkdZLHxf6hg==
X-ME-Sender: <xms:_ThYar1ksn4KDiBGYiNAPR9V79yqxELQi-G9AYFiP6Q0tUNmWRVz4w>
    <xme:_ThYavOmERfyMUNOLD6U5MPE_3GgX-_-ecdn_LsTgUMGtoxbJr_y2vpSojdeOZBNd
    1EW9HYIkbCo-gKLO7asAkpiL4Pbb02qR8HtUADWpcfL6WQ-AVLiAw>
X-ME-Received: <xmr:_ThYau0-WM0YraWeoIny2dVjGla9Bz8m-ICHuM0e28InKiE-5-AJhzHXh_LAbNIWa_p9l_bnshZWoYNSHHwRYF1W>
X-ME-Proxy-Cause: dmFkZTEallg+I96iUR1nJNeTGqmkfsqgkbxQXZGq1hig2NvDRASy2eygSrpAPfoXSyb2GE
    on5QbQvAxZrlyZzGHWlVFgWQTTGnT/BYoD7/bjcEZjNqy7KcZIScjtHV4UsqyKG67o03wX
    bKKgY1UrJoanXUqawjNteYN4J/QmgWbIn6qgOvuMg/o6bgvolXXJr7Yx9q9ButaVr00ZOD
    FuC061rv8ZbTRswqr5Cl64gJ49vI+bJYxoNPKtFqkPYQU32HUk6e2zhkz1gati5g2HJ3sa
    qV6OpXN/mLv9kRn3/P3/7zDf5FFusTXjI6GJbn6G3msULmX48GaLNE14qDgirTkVy6OCfw
    zFc3Lk9Rnwkv1PXLazhKMijkQUxj7RtK2BEVDZqb8VJEaki1999hru3vq+jphWiH5ZQpbl
    8ZwnIYsZuAMzaz2PFtyQZHf5D+M4u45EY6C6+4y87wEp/X1oJNMcBCqZGuKegHoLOszeD2
    tVD/ovHaG8FoebEg5dHO3d7NFTjqhSn0Et9Pzq0W2eYKTNdKDkK9SVR5z4vthLZ0KXpxbE
    1QhYjD8JqFmBEksC924CAVUsLg7VUV4ef5Ss0DhATCb9wxmL4eEuIp+dUu0CnFVmQqomKX
    RimPfZIc05EdeAsXwMiKKdC4vpCEjbsCMO5LIGG/efqynSRhGFd0diS3R6CA
X-ME-Proxy: <xmx:_ThYam0B5HL9XkWZpKjqjgOYqzpdFoN7E-l4NS9vqj5evol30YKdnQ>
    <xmx:_ThYak_Y23Zw8bgSOmb6HzkpflS42tP0f0cv1IuMjWgH0DtZRJSpkw>
    <xmx:_ThYaqb62ROe1UFitTriIs6RYxSSd1gCqvPTNZbZMhuq2zlD2MGvkw>
    <xmx:_ThYarzGe6P5KJg3_i9WMRef0UVoiBoOtxzH1qVwUx11AUx4Dvj1wg>
    <xmx:_zhYavuILYUWYonTc4Ru6uLiI8GZfseulSq2mv8Se_FQEzihyJ4fQy0Z>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 21:50:49 -0400 (EDT)
Date: Thu, 16 Jul 2026 10:50:45 +0900 (JST)
Message-Id: <20260716.105045.1232030998312578406.tomo@flapping.org>
To: gary@garyguo.net
Cc: tomo@flapping.org, a.hindborg@kernel.org, tomo@aliasing.net,
 ojeda@kernel.org, dirk.behme@de.bosch.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, frederic@kernel.org, jstultz@google.com,
 lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v3] rust: hrtimer: Restrict expires() to safe contexts
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DJZ89N38SHOS.11AK80GIQXGDX@garyguo.net>
References: <87y0gcf9xw.fsf@t14s.mail-host-address-is-not-set>
	<20260715.202254.38223441240127219.tomo@flapping.org>
	<DJZ89N38SHOS.11AK80GIQXGDX@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 15 Jul 2026 15:51:23 +0100
"Gary Guo" <gary@garyguo.net> wrote:

>>> "FUJITA Tomonori" <tomo@aliasing.net> writes:
>>> 
>>>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>>
>>>> HrTimer::expires() previously read node.expires via a volatile load, which
>>>> can race with C-side updates. Rework the API so it is only callable with
>>>> exclusive access or from the callback context.
>>>>
>>>> Introduce expires_unchecked() with an explicit safety contract, switch
>>>> HrTimer::expires() to Pin<&mut Self>, add
>>>> HrTimerCallbackContext::expires(), and route the read through
>>>> hrtimer_get_expires() via a Rust helper.
>>>>
>>>> Fixes: 4b0147494275 ("rust: hrtimer: Add HrTimer::expires()")
>>>> Closes: https://lore.kernel.org/rust-for-linux/87ldi7f4o1.fsf@t14s.mail-host-address-is-not-set/
>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>> 
>>> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
>>
>> One thing I'd like to double check before merging this,
>> HrTImerCallbackContext::expires() now does:
>>
>> unsafe { self.0.as_ref().expires_unchecked() }
>>
>> which briefly makes a &HrTimer<T> from the NonNull<HrTimer<T>>.
>>
>> This is only sound today because `HrTimer<T>`'s sole field is
>> `Opaque<bindings::hrtimer>`. As you pointed out earlier, if we add a
>> field to HrTimer, "stuff breaks".
> 
> What breaks? You're just converting it to shared reference.

Yeah, two shared refs on their own never conflict.

But pin_mut.rs/tbox_rs's run() build a live Pin<&mut T> from the same
memory as the HrTimerCallbackContext they hand to the same call. So
isn't .as_ref() there forming &HrTimer<T> while that Pin<&mut T> is
still alive?

If so, doesn't that maean every field of HrTimer<T> has to stay behind
Opaque for the reference to be valid? Hold today but feels like a real
invariant now, not something forward()'s raw-pointer path ever needed.
