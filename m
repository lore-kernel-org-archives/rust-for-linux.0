Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574207;
	b=TALN3RF17eJX2OxP4AjRxtWxmhIXZbv/9UTCkiu3mpNNz2yU0QumkEXsK2bSJ7RA/qyD
	 3y7I5/T4ZJut6TFBAL3BXTwd5a9+V2Yd6K0QpT1zwSxeqatniGbhUFRPAWSdvUJo3ifw2
	 YBzKqtqCBHTBumWll4XT/cfwPnfFDRpjNpD+rB17evcMrghZsJ5lO2hLsTkh6O9kyJJXD
	 5nSaPvpdmD9THyUVtIWbf+eAnC2nVpodvroCWFJxfwfx5se1hyKCm0pLtfus5Uajdll1t
	 qyaOuhNKuI1Xhj2WcdsMECJe/ZEN4nUeXasl7XcN067Jn9MN2t+EZausPBc4xAazpYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574207;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=UjhycloSVwN/MsXqslqJcrsVG4Tc+E2r56Jl+uN09fI=;
	b=PpNBal2lNgxtfKHIM1jTcgFkg31eDKg2UaOHfJGOR9ot9h/H457bxUNz6pNt9d5B0AEN
	 r0UKzIwRPjJWhABnCi70jhN6XKWs3mvD4UcR6T+6FDdb8RqdBGUPguBV8pgVYgCa0BW9T
	 5O9z7xiuPqyVG7Y0sqhxkndenX5w7/jhPkVVMzbgmthfPe3qgFmeqvhpdbccYSnYmL7JY
	 LlYdM/IzCzRVR3cHZbszNevpyQRRicdaZhidTX9L9Xg+WKi7YyI5WSlEvGhPT2bbIW/l8
	 XYTnrdYy9v4VytLehJUZe5d9Li2Tf4YlYmsB2ry+IYSBmg5qENwZTjwL1B8RmJZjObA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=sWZ+27OJ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xpqD8259;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABD8606A31A
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 09:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ABD8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=sWZ+27OJ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=xpqD8259
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7060E1400083
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Oct 2026 05:16:45 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 21 Oct 2026 05:16:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792574205;
	 x=1792660605; bh=UjhycloSVwN/MsXqslqJcrsVG4Tc+E2r56Jl+uN09fI=; b=
	sWZ+27OJD63e/ltTZ0iTd2ZOlpkBeqWZzo0aybnnWxEoLJ7obx+cqIgOI8Zhu4I3
	J44hEYkOl8QmttT0pnnuY1BFlMv5j/hSp1GMAsWpBogRj/NHWntU60Qoaabn/Ac0
	3SbloHRTlFGKzMdF8PRMYu27II3wM8XBh4I8KzHQgwnTu0tEwwnEqH0TS6Hf2tGy
	ZUIiqIuq8VHTHWOQi1V0BS1sPy4xW509asKMMR1yOf4GmFfAXCl5ELN19JrXG7Ls
	V5kGLlcC61y2bDL0pfcP40esCkXsUGxQ5+dP//2XGqBlItKP/shOamjpeP4Fp4dC
	oJ9DaxT4xVSqoCZCvRArFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792574205; x=
	1792660605; bh=UjhycloSVwN/MsXqslqJcrsVG4Tc+E2r56Jl+uN09fI=; b=x
	pqD82590tRKDDt49Y1uY3YoHPm1dCRX4MIWDGDOpCdNDckmGMcHlLXMlSwbhvVIU
	Vi/7qd4VXVcPOYP0sej7jf1JlRUbudilEgpk8IU/10vHwNH3jhjtxx3+jbuWQxI4
	Ffcqyltw6mcYLJwgRHw6QLACqU4XDfabN4lFR0JrKaViK4INGAHSGVWVhgj+Kl1x
	i1ayFjOYKqm/o47xeGXE0rX6L4MHwWtkQNjUEhIdpxHVYGXWgOFEHxJ7PkGZF37n
	5qAz3Deli78Bbiftmu4CUHko7Jh6cr5R/yYx1Y7HUoEWsokUCJcudyqD+hJekNX0
	KqTieRkf1ib4JUrpqHP0Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792574205; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:M7vd1ck9BWuygO94ISWrmEGyzGOFIL+OtdKwaR6z5K6iFZB
	wTuUXua+dV/zxMcES50xB+pUDSWXH8iZyZ/woKv2m0ZznCK01KWftirdeAQaHhtN
	IJmUwDtVtF0zg4ScZyhxeqnelyvPl6Jo520QWmNm25ZDtHJhBTZnOJoy25kAKOhf
	H4o+AFuTo7AJL/1x3pgcDTbmDsrkE1AvoJpSKG74zwc7xcZiouCKfNY4R+j2pwaO
	X/LisK0RvJXpRMGcBP9n/fIRM+Q9cJTg6igeiq+EDfSBfH0r6Ef81neoJhiXqQo3
	JYYCR+bcJnm8849LbSqlCbkv4nrKtogrZQi9qVA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:ZwMDi4rAti1uu51xzIBBJztq/4lgEcvp8W3Mckc3dcU=:uXV0Pgga/E/hgbUqGADZ4JQfpuFz3auNsY49xtYlPdQ=;
X-ME-Sender: <xms:_YLYanXhOjMvwrSy-IJElg6rozn-mdq4dLms4f8c5Jx-GYhF192EjQ>
    <xme:_YLYarrNewEtcIPZafRTyKwnBGRRgXN3vHWedsEkMr3J4YcyhLkvPa9xXcGQ7it9S
    _-WNUPn1QcUGOFjsPcDyDvWXt4eYolh9Sl-W8djU9dZ0gJQesOKDxyR>
X-ME-Received: <xmr:_YLYauupcimTS4D6_md0ZuiifoKwCNdGFXqV_uHC-dUoDAP2DRXu5jBd7bZvI4ANl97JgzlwR0nYMxKpc0bsrSYA>
X-ME-Proxy-Cause: dmFkZTG0LX2vhbvH7Fb2TvHCFcsQyHPcJmPOPD0Y8sf8J1GVaCtaKhE01c93ZTwa3Uf/QI
    qc9WxXA5QVYuYFZWPQDnYCX4C0Hwl7L8/WKqhvfOhxH/vA8zYcWgbg4LJamXbPTC+V5iGg
    r1k3PZ8S6oiIUEChtYSky6D9HZThaAe4T6YG2qUgTjjjV8IXR2BQg9gA/HnkKUBSPfsggi
    bS5wzFV5oXcSJiuWZE074Js8D3D4YkrE8rSZAv9XqN0gNvZYA35xTVMTFMKgINKtDQhKpw
    XRsdF+rFgWMsqVUeDW8LD82HG7k7tusdPh52FkvC7oLk5Pre0BXu39FhbvbB2DO2AtCkpA
    vh4fw0bGMECeNqgZcMQWZBft2aDMD8ZbG3lDwDxMTAptKER2gz8IGvs+p4LDTFM/5LzdSk
    jA4CzWPGKKoxEJ6PqjJwcD2oo1XIbDmzVc1SI9P7oIYyfUu7td1mzBWOs2w9MxAalmHR+e
    7FRYSdaQi+zvkRIeEO1xXWqJemVmfnfH9gr5oBUGa1KQVQsmgJ4poEBiJbIc8lfAuEz1Hf
    qwJUYbJHa7zT80Zxw17S299qjPYBj95JEYzGA72gBltKYn6v0BbvBJn/oP/irHsRoiTj7e
    /J8P0fmtcH9BAwXDdNimOJkhVmHitLd1zg/jObIO7NhElcZdlZ1hM9vFymUw
X-ME-Proxy: <xmx:_YLYahTYix0bQqMVnA_pTR8lJrOst0Wlw4JAy4MHclMTOyPyz1JMHA>
    <xmx:_YLYaqp3_-MlsTdLKbAiReHiAbqVi0vme4yhP6fopYzmoy3ZUOABkQ>
    <xmx:_YLYakK22Kzu03e63Zwvz1MwlaICd4Xyd9gWzDy_WAEItI4WmsPl5Q>
    <xmx:_YLYalOdjXS7B0vb5XN6V1gEKS9c4ptSH6q5lHj4JjhruBYvIoKSSw>
    <xmx:_YLYap5jG1pncBa1nZcBUh-ypRbAu0seXjKI4EvsUcUgMHqFhC5Cy19I>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 05:16:39 -0400 (EDT)
Date: Wed, 21 Oct 2026 18:16:37 +0900 (JST)
Message-Id: <20261021.181637.954248793010611824.tomo@flapping.org>
To: chenhan0017.work@gmail.com
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org,
 boqun@kernel.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 miguel.ojeda.sandonis@gmail.com, tomo@flapping.org,
 georgeandrout13@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rust: math: add signed division and remainder
 helpers
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261017111134.22546-4-chenhan0017.work@gmail.com>
References: <20261017111134.22546-1-chenhan0017.work@gmail.com>
	<20261017111134.22546-4-chenhan0017.work@gmail.com>
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

On Sat, 17 Oct 2026 19:11:34 +0800
chenhan <chenhan0017.work@gmail.com> wrote:

> Delta's division and remainder implementations operate on integers and
> do not depend on time units. Move them into a math module to provide a
> common home for arithmetic helpers, with Delta as the initial user.
> 
> Expose div64_s64() and rem_s64() so driver crates can use these operations
> without constructing time values. The division helper takes two i64
> operands; the remainder helper takes an i64 dividend and an i32 divisor
> and returns an i64. Both keep Rust's signed operator semantics, including
> the unconditional panic checks, and use the existing C helpers on 32-bit.
> 
> Keep the Delta API and its panic documentation unchanged. This is separate
> from the preceding behavior fix so that introducing the math module is
> not required for a backport.
> 
> Assisted-by: LLM
> Signed-off-by: chenhan <chenhan0017.work@gmail.com>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
