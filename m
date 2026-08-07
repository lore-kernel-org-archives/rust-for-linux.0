Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10C4398E7
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105002; cv=none; b=sndjaIGC1OOW42ZreLbTxhBZK/Qbcthb36Y9098hNDQNoAYlTNUym9MD6onDm39G7TQvHW/jcXiicGMiHFarh+n7PGrO9RyO5MQv5vAjs6UNBd0Nl62SU3OPBMOaSX6IjtnS/3p6If8jH7yjvLKLLWVFwMKMzKNHybcACt6ydfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105002; c=relaxed/simple;
	bh=HxphelmpubRWldZYLTJ9Ttw8/BIYVbR6Yb07TxNkWJY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g3/z3lqitRBuzolcwaKTlHrDSM7jIwsv6sAS2hlsw2ktc1nC91qMdPT7fdREv+albbPexOI7DQmMdfc3sG7tWoLPPfVUJuPxZleJ16GArCx6IBWO9FKxgXj3WaNgXtO6ZmOz9RRShnX4JoeE7ivn8Ycm9FTxK144fTowWVBQBn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=ApXsI8wQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Tdqw5b4U; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="ApXsI8wQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Tdqw5b4U"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.stl.internal (Postfix) with ESMTP id DB47A1300019;
	Fri,  7 Aug 2026 08:15:09 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Fri, 07 Aug 2026 08:15:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786104909;
	 x=1786108509; bh=9t6vVWGin2/hV3L7j/TCmR1fJA0R9Q7skhWDlXyWNn0=; b=
	ApXsI8wQiHGfrJWB2YMykX/LQvgfbTklsBWEKKV4c942bMomtG66ONlJLTB7tOxh
	ajhfRol1f/6F8zHFq821JSRDyC2dMdieTSbfsbdRbBNzCun2pKGdrVnCszbHeing
	TGnNxou99moYyQ71ZbqPm8CYFfU/Ebhg6ih0Y7jG7UPk2jrAqM8XPsbjm0pBj+jr
	vV/0O0mOvvJwE27qaTH7//uRkg6iByppjhj5EwmEuIgeE+PBGy30P/KqTHnmbO8W
	O8Bo/EoPFpvjqaPBLjPm5kCM104ldBuMiuBeT5MXsSYwEAA5Nn4zO2usbSly8ICa
	aYoWW3KlBKZZrh1qWd7tiA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786104909; x=
	1786108509; bh=9t6vVWGin2/hV3L7j/TCmR1fJA0R9Q7skhWDlXyWNn0=; b=T
	dqw5b4UKeeSA95WGzqpqvhJUZ92KbjYNp7hkbhykZw28iNiS8tsfDzDle+L9SmFU
	GlTdmKIKoekYMczvMPc2DMMrFQ44msIe9xxmp+hA8FE/xunlyE5RdI9mSQ6aYPmF
	OIzIffpin4Pw5h+OHDFiNHH7+k7qsZX76xsPadU7nm5SGAVAq1rAH1DsBq3xK7/H
	gU0LZ05e6TUM5K1/j3jc2teuUBMaKq9iLjiXTFn48DhzYR6exOLuWD2c/wjrRpAo
	AdvSAbYpeaZRxjDl27KdlHJ1aSQ0P/KsU6eU08U5txZ8Ercx2yt+8t6GwPrhpcRq
	iepAq4xKIOJIUxfH+QlBQ==
X-ME-Sender: <xms:Tcx1atSdMEkWFX2PEKoMEZFekF7vcpuvMYMfEVVhLGZieP2NsCp6-g>
    <xme:Tcx1amoq0k8azR2YkHnbVmpcoFB8X_rHmI7qA780fWYDUmqxrsCTrOrLLIEJ2qPnb
    qF-OtINSU2bxhsNpUr1oQs8I-nLjr6XivzlhGrSFAVRqPYaE37Qu5aS>
X-ME-Received: <xmr:Tcx1agJSJytv-w-7-qz8w_J6DuAH74IIPNjtuq6LsK66mDbj0FNE0QiJq1-itIURLaOsdsaMp_lQ0IkX_is5iKqX>
X-ME-Proxy-Cause: dmFkZTGVE/taVaZrMtVsPbnNsfT2IIfKBB+TPFEHi1JpTRTchhE9Gl9lvzsibj8Vg+pi0T
    bYhQzm8VW4eEJEyCMKbahOAcU9jErbfGHi4jDTOGlVbHEnpm2JV9s4zlDeRGljxK2Vbh0+
    UBn36WN5nvPoKfmXdYGws9BJILNVUCiYRmV9c4IjuRDV0eeF4vaftY4IhZSU1Eoc6eoDDh
    hORGcVlQzheTcUQ3MAlwkqohmPryPHtCEL3bkIPZnYE5qto1GO5Rjlp5lICyKOTUFewMxH
    Q1YakXuG/Ns4DXgtRwcs4eG5G2Hp07xKDBxNKkgawTA9bL0hfds6gvmSIcxFci+J/Varhq
    tJSRtMnJDfO+lbXekv8oAenaND+1DCxtNikeyu9X4RAOD5/9ak2tR91V+8jqhlVz8nIYfv
    RVQDgrbGwgLj73EmrVBVD73JXbkcuv0zHh1WR/mab3skJ9GWyOv0snO/0X06oJ7Yy+/NIM
    1+PGHqzRXCA46BNsqHSReiUCeHS4sFRw4v5SYpynKP7NFf09yNXmSpN0w8j7IlprvJNp7Q
    gU/z1apBRkxOL3ORHwhxjB94X/7LzTAdSKnY3i6Y/elr0w6y96UQ0Q/SEGKOthYgWXxZ+F
    fAW9Wf3YLYnn9otPl03nxBhuvMbqKwBKrRE4cHIkFTL9XYhBClyrfQFMrBQw
X-ME-Proxy: <xmx:Tcx1ahNu9PCQEKfeuO3GIXZs2qOwTc7--nZSUP09oZ9PrKBMxFaw0A>
    <xmx:Tcx1ajrFA10Ux922A6LCLf8Oa3DiZtLIVRutRxFvoVYq8k9Uk2slgQ>
    <xmx:Tcx1arFbH26CPn6KlC_gr4LrzSFRq9w78nrx9nHwKVEXav0jP7I4VQ>
    <xmx:Tcx1agLMNzO0yKjbrWskjtWKXt70jNEMjaiUwo80zU7uAPZGfdQbXQ>
    <xmx:Tcx1ahct-umyByNI94nxDY_iBYuUUPwsgtegElYJ0pjfpjBDomlS6q6u>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 08:15:03 -0400 (EDT)
Date: Fri, 07 Aug 2026 21:15:01 +0900 (JST)
Message-Id: <20260807.211501.1592151404250813286.tomo@flapping.org>
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
Subject: Re: [PATCH v5 4/7] rust: time: add Delta::to_jiffies() for timeout
 conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <871pcb4lxw.fsf@t14s.mail-host-address-is-not-set>
References: <20260806073241.1024319-1-tomo@flapping.org>
	<20260806073241.1024319-5-tomo@flapping.org>
	<871pcb4lxw.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 06 Aug 2026 11:50:35 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index 9d65a6c1992a..5844ee985a7b 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
>>          }
>>      }
>>  
>> +    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a timeout.
>> +    ///
>> +    /// The value is rounded up to the next whole jiffy, so the resulting
>> +    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` does).
>> +    /// A negative span clamps to zero jiffies (an immediate timeout).
> 
> Should we rename this to `to_jiffies_timeout` to indicate the clamping
> logic more clearly? I would expect a function with this name to have a
> negative `Delta<Nsec>` convert to a negative `Delta<Jiffy>`.

Make sense. I'll rename it.
