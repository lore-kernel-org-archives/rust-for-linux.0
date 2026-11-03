Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699349;
	b=2GuA4Ctlb5LGmdoRlFAeEAla4/h1J6sJpDPYFKfglg2eWbbIOunzLgC041ZKbc9aWY8r
	 rd1vK0/xP/XD1SvXZ+pClvuwWNtxxK3ZEPdxkbdt+agL73JwtBYYWsWxstBX6ECmZprpd
	 3c9u4472Vaf3b2mHkkChZuYe3wxc3vRrJ/XM/oKqR4m5P6aPkGLDdPx1rN9TeRFHEWU79
	 k2XE9AiUFLWLUJ/W9SGPlXDthIxG5RD+51r6M8G/Lwd00P88UtzVOWhfrniqyQF7/396v
	 +m8jcBo8LTAKsRFBizqLzKICwfB2nMiRRIhfj5yAiXF87vThQBKyaBS2ppAe0hpL+Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699349;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=OG7G7PorkiRlIdo4/3T/y2XzMFds8zQXDfkhHN9H58Q=;
	b=MXhyq61LDvWZgx/UFcMK9m0ZUR4qTnafGFITg9PPmS/wXknPCEDcyoz9h6ECqbuxF92n
	 62yDV1opMbLlG+2K7UPGGtHC8U+k8lKzwwhueRLGuLtq7GAS0PxXxZ2wzaxwOhxD9RHUJ
	 nn0/H7SYYCuvjnO7N1Eld+NGjANHkYqs9L02ioC1eCRlZSjM0DVLAvId3t9hsMumRDOTW
	 NtqCj2YvYsoYQjw/JPl4Zxb9gOTAIMQiphLT76MkoL+G18MtrrrpfxSN6ZLu9bKKYuviu
	 NGDPP+Ndw/9y9VKKnU7Dhf/nH37jNHS4bJZEO1n3Xn877sd/+I0Mo7Razua58l13t3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=YmV6RvIl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dc7YS7E4;
	arc=none smtp.remote-ip=202.12.124.154
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1548C606A327
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1548C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=YmV6RvIl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=dc7YS7E4
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 51B9B7A016D
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 04:49:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 03 Nov 2026 04:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793699345;
	 x=1793785745; bh=OG7G7PorkiRlIdo4/3T/y2XzMFds8zQXDfkhHN9H58Q=; b=
	YmV6RvIlPYeodh59rkbGI5zqJRCYlOa7gMl0n9WZXPGF8bld9Ui+8PNS+fXrtvhf
	3Q04AU4OPyuOwAmuEPkTEeLZ/4EkGevbsf+juEFiXbTfZLRHbc5EnQTtifVM8rLH
	PXbjhCTZRwLQSvHHZ3ROuyL5J3xkDimv9Xwp2hDzM/onfotvSBcEc+Bq7q0ccPCy
	TcclLdfayPIs44bZ1TfJjkmVPNQEDcpCZCvCrz8wi//XOu5ZejDmSlwqVy6cO5Nr
	RmHyXV3ZJGD6cCepWl/yJ1EswFnOVJiNlQRUht3iguxqNkU4BUZVs1juDE6+M4QK
	3EadjNls3DjUScjCYNHIew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793699345; x=
	1793785745; bh=OG7G7PorkiRlIdo4/3T/y2XzMFds8zQXDfkhHN9H58Q=; b=d
	c7YS7E4H+TBEtgldCTpv22V9t48KUldRdHrTmscixOKvYNUaCigHs3KZ2Uq01e1/
	XnstUaFPFQKZw81hLvXK37HOBN85EkI86PhPvlhQ15KMO0xbyptPwPs/gybdEDG1
	kKnhgXVL2eGXWvzq8VO58DzlHJ0d/vWL7Yt9rKYH9r4QXTh900bgI6SHdMauGwXZ
	IgLc4QjS2MOPtNiDjwgdEB8EWAwGLglAuRoqUbn2NNmxoYImSL7svsA0Jip0QgYG
	dkCyFcEeu4efLY/DyH3g3ZXJopEyE+5uBBiLFty0wMmaKIeU9g6UOPRUP7GzTUSE
	l8v4cNafxyG1rqQoS+j9Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793699345; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:XcQaRhpExKVKdBp4S0A2cYvYHANsAgvTIH/E9VinthNqnB5
	+zlRhxE2CZV19n1jpNh0nr1DAIoTQVjYd7t/UA9yYLQwv0fecSjfLNcdvvVR/6hm
	szHcFzoaIw8eKqO6su+jwlfar7D4Ch5412wvzaUm7hnzieHnlaAZGByLYkwI4VGM
	F+NVV+lusKAtP0dL4k+1Ic6lgYZUxB1CvZb62/a3YZd8a1T5tpVZuKbD+tJAaeC7
	c7FAtYnWStrBBwmkdljNpm7Tx8FF+E1HRbGBKzMaFRAxQncYm61WVb+O2G3kA4Uy
	EPCyWe4p1vzlwWBL9ElV3YZFbk3jYfl1wS7HuJg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KFEYeJSeqaQvdhSfOiFj3pESt9ROi+/kLsY54sLVMnQ=:A69AET1Hnmc2CppcAFFTir5bItDWu7qWG+xCGZtT8N8=;
X-ME-Sender: <xms:EK7panJYqIeXKlzyb6RoVeAgS3geUr915EtAV6OD-2UYHkbvHh_uxQ>
    <xme:EK7pagKyYa1o55Q3frqsugecORLznxWZCW4-92hD4s0OqcBTONOdR3fHC0EKwgzGu
    q8VP1wTjlcv6F8hSu2ySvIv_7WzsTUCu_EfUZpXUip0r1VeXDMw1mGa>
X-ME-Received: <xmr:EK7pagley4nv7EFzEUeN3saxq8aXmmzmPxNYSJbz1OZ9wPHV3VJXkMksh8zvrXxt-DcHawFTE5u75CxYQoEOTWUA>
X-ME-Proxy-Cause: dmFkZTGoAdnMZpSzRxjqGakBDdmQBjBOFDndVX07QMFZZzrUmDy5sPPmTzyIX+5y2ejCSm
    k29jl5O6VozixDzDldi3Dxucr92wBgwkB7AFKK+oJRd1vvaGeznaUxq/Ge83a4h0bDAIID
    LUXb3jKBN+Dyids7eIDdNJ69zI3GAppKgn2TPI+407ytDKj+HrZ6k7r3kqSIkVD7ZSeT/X
    4TRTGrSmr5eXXMnSSE6VCvLeaJSQu9hXBTna8wz8ToUeLLIxgGKeJ5go0kqwiibYNlqYpu
    womEK5z3VLYxCyk3zpnVdd1on5EzmFysqm7Uq0a2dQZjDhSoYG9+wjubq8XEj6WoKrvFGv
    Cp9M/YhHv//3rjPbK/K+DMm5MRq8aLjx+9xCSZuhzKjFWhsuPOscy4By1Uu06h/cpDYHAd
    fbWc4buaUhPxaWVYqi/VZ4XEKEOVj+WxKVsfjKdLPYWTAMQlK7PtCY2+YNcFZp66k7ulJy
    0LAt9U1k9w73KjUQvgoVRzyBouELenbH0/sTcp8SQD6XB8NZ9dPX6isKJ/3OtZgMyxB1BS
    EQUxpo+pk+ceBmBolZBLZTTC2p5B/SFrudk15CTxcMQLTljaA3Mr/H+lq8Ed4b4E77cnwU
    8sZ6nWtYMVptckoZ9Vz10p2LepBv8U0/K81szq1wR3FmJP0neGYTxuWSIVLg
X-ME-Proxy: <xmx:EK7pamJjHbUZv5oF3g4dFGL0JiI6jyTvKj9DYg7SPHHJGC4BmmVTSg>
    <xmx:EK7parWzXTUrbuO0iPy1sCGhUEJni6dZNS9khgzOBwxGpcTEMfkX0g>
    <xmx:EK7parOa7YBXhVg7ITjmD0t_zI_z2kBY-ztTWrpAatQCYTt-kEfLmw>
    <xmx:EK7panm39Ep6Gs_hlyKss_7Ms9mC_01o7eDgxoJqRgqH9Tudi_mzYw>
    <xmx:Ea7pasn1Ec0ISS5__DG-weNW_Qzj96UHVwyc8HeYKvup-V9lQsJQp7I7>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 04:49:00 -0500 (EST)
Date: Tue, 03 Nov 2026 18:48:57 +0900 (JST)
Message-Id: <20261103.184857.703333269279645088.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com
Cc: tomo@flapping.org, linux@armlinux.org.uk, ojeda@kernel.org,
 ardb@kernel.org, chrisi.schrefl@gmail.com,
 linux-arm-kernel@lists.infradead.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com, guptarud@gmail.com
Subject: Re: [PATCH v1] ARM: rust: Generate unwind tables for Rust code
 with ARM_UNWIND
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com>
References: <20261009124124.1176706-1-tomo@flapping.org>
	<20261103.182511.1470121559944018656.tomo@flapping.org>
	<CANiq72=Mb7Vn9O0baOJFRf68UiZoxK0RjdXBFLw_hCHcqCkZ_g@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 3 Nov 2026 10:34:59 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, Nov 3, 2026 at 10:25 AM FUJITA Tomonori <tomo@flapping.org> wrote:
>>
>> Gentle ping. The patch still applies cleanly on top of v7.4-rc1.
>>
>> Which tree should this go through?
> 
> I guess arm's ideally, but I am happy to take it with their OK (do you
> want this Cc: stable@?)

I don't think it needs Cc: stable. It only affects the backtrace in an
Oops or a WARNING, not how the kernel runs.
