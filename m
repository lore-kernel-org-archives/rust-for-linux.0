Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697922;
	b=d72GGcySFRWJ30Gi4J6VMgO+l7opB2D1T9u26PNqOwGqw7B1Pwar2Z4FcWaawD2wE7mo
	 AFp3jPg/CIbt9uBVxk/Bt9WBTycRawLit6rm5sWMMKuAIfKWlfnv7rej1uju8JM0/po+f
	 vXvu6MCduPUUoycWRJmmcvCwiiUkATm5EsW8+uhyOAIv82txCRD04aUwJYPqsvJ/ud0Jo
	 lxRs8DsLtbPb2IdTrjhT2AiDVvl0WIylGaZV+JcHLrl2jWslRWDF2+x21jo3CSfvYwwrM
	 T83xZxnqgNgsw4aF2LB71Oq0GsQsx4am7VV088/+RwbFQZHeX97NBdH0DUTe1Z4eSQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697922;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=jdMyzCVU0g1xc1IZX8XGl1iC+1O6XY6mTzYfr/X7yHo=;
	b=taBQ0GtCe9Q7vnZNSewEVSf7OyskG3S2cBpxXdB9J3a9G70KF7ugmKC7WSxEkDfFLgWZ
	 AeAxqoLodfp4qnGsn1YRHniaSQUkBSk51G7/32/tyBpwwJ6EziWJozFJhu044aBqSQxDN
	 BK1m5s8czHq3F6hDFb1No8dLkVaddq6p05SuIHe2ZrebXlpXee63vJn3QM1pNFzvmHV7e
	 D6RT9V0EUn0uTUsYmSCK991qtBiAyEbTrAvmo8nNb2w3N2t1BLZUhWzIi1TX0xw0nzF6b
	 Can5NWUvMNBDDBC3aXF5pDnWZ51iUrWstPVQ0gjLaU9tv5jAgkWXseN9JKhxubI5Ngg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=RUg2LJgH;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U9ePs+Kb;
	arc=none smtp.remote-ip=202.12.124.157
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFB8606A326
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 09:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DFB8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=RUg2LJgH;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=U9ePs+Kb
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4467B7A0161
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 04:25:21 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Tue, 03 Nov 2026 04:25:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793697918;
	 x=1793784318; bh=jdMyzCVU0g1xc1IZX8XGl1iC+1O6XY6mTzYfr/X7yHo=; b=
	RUg2LJgHbvPdReDUNGg8sJVu4Di1PaGrxImR6Pm7Dtm1AtpLkPktjFJK4u0lrKEP
	QBad0xPEE9ywmEpn6THXK1QNk4BVozyjXqoIZDtEJcqcJTbhthgLUTNhKE042C0l
	yXYw3MtBnqQxGieo8aRmeg0Ll0Oysp0AQ3CJQMO6YBt6kYZDZqFIhlM0sMOfKyRO
	TY2282MPVvFkNzQCvyrJbl4yp2MMwNgGqu0CqSAh7nikipUmMpTlUt6GCwyZ6D3+
	At6+LAM11wz7Pig59H51NrOB2DQ51gQ2AQnXhaMKa/CyVcWFO3GZlw7nawWNaGus
	SeEF8ry6XOcGpIraPGZTqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793697918; x=
	1793784318; bh=jdMyzCVU0g1xc1IZX8XGl1iC+1O6XY6mTzYfr/X7yHo=; b=U
	9ePs+Kbr7uT7tK2BCmofy++tCV21ZOyFVUyQ2iXmNmPfyzdfQa3PCxi3v7+pz2Cb
	5ozL6ZJdYzpTLPdU+74EKl+WeySYnN5qrFcRefRrKdkMpKxpXI6gEBrT5gskbJ6F
	ZTnMyr85o0NMSkrAruF493jkyY4Es4rs7T4g5KBiwm9ldrtTrIeffq4RAmVg1WAd
	S6uVjQEnX3nUFZGDg24of6j3ScD16dGzVVOjij9o9wy1HIQc91l8pm8rviBltjuQ
	ciEOFxz4j4Hgs8n20Wsf2mVIK0vtSojFLgCoqofCnaOdqyNZXsfzj5qj9VpZjomo
	yXnv9ah6+9o1FzO34cNSg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793697918; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:cOEX2leTQ4mJ9uw1jRDRQhYmaj2Vla+0HY0WKYjZaIK9emA
	NpI+QdDmG9dpMpZedmDZAl6os6U3vdycwdxNe29/y9rn4PklWrcZfLbuQFKOZYSj
	yhnaCYrid7uVsdJW9e7+K8RWLVXCNlAfKQt/0xYiJyj12msnj4zip7uBZegqNlZZ
	LueXwPn2kx8trVXrebo7mo3ZxLoj0z3Rpwdhz2KYElc3e+tn+VAbKiQXlrW5VhrJ
	HvQJQZDAHZf/HDBUyt8whyls3xP/7K697Lm5BwanWDXEb16tsHV30M+KDpZUkQXJ
	iNfh4rgeYPeI6H0sRCbIol+cTBWBkVFOq4/Oi+A==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:kQaiFmpW+CCHZVU8mF1VMdFReiDJO1//izwUdcwzRZw=:hAj+RXZq/5tljdQQZTHp769c8tXKN1/68aaxqjURzP4=;
X-ME-Sender: <xms:fajpat0ULehFGUWEGFiGAbOAx7ejEyzEcTK9yFR-19YH-diZ7RclrQ>
    <xme:fajpasAmo0EYwUThd1Rtu_dxYpPl1h5XmJKRGs4cWX1bUfYDOhqcMH6nmQ_ha_oxP
    dPOE3_AAp5RT7Gf7MkkbkOwkLny2pMqg_FviGZ7ZXYVuPl9QvVwq6gT>
X-ME-Received: <xmr:fajpalEJ7tVw28vNe3Z-_5dlXJo4dtfO6cmEFV-lKr7v2p5Ks6llCDRH-hl5C5N9sFuRfPwNVttdAf3bWMhUvO4o>
X-ME-Proxy-Cause: dmFkZTGEiVf8igopQ8zuuSTyLQpEy3cHYoem8uMXHaEyIuiJYCWd7AuQ55QXsCTstCbnvk
    rZI2NQbl/7FmxzZ7nlyYuIs/A5jTEwLH0Fk4c3bL23zIITN7QfCAjH4PVPMGVIzjVIXiYn
    Dqw7FWDGl8/RYv0zXfeDD1gqq9qjetflpPO4ih6hJ1BcA/Jjq3LktjigZFjqFO88rD6g85
    Oc7ronP5yQBUPWyN+a5V7VRXjclMT2n5vcLgAjQ6vmi8B3ei6dyAJBkKZuT6uN2K65Yl6Z
    39ja9jFAxgDmFuUqXBmIeiU/tiqqiUWrIznaGYzvpkljDEO5jp3+z9wGRbXnfRXcVQR/kr
    1uZvKmFPduZ97XOzLnD00dIVxbgEYskUpIyK/Tm1GHEEOv5UoL+yVx74g80nzLn+X9HgCH
    x4gDrQNMO/Qb9T3UCp50HL6xgHLyLGyaxQMDe+rN57U0XlSyCHyYOTx9H1j4IBjn0J9ow2
    14JSzDHKbe1jD86QPDiPptHsA+V8Sy0H60RGp2DGpVxdWageA270FD0vOPRup7Wvw1HG6Q
    a5YoElaX3LL6wTMlahgv3uaVKhIFFjyzV6+VqjxFf76r/APEGO0rA75nsGDm1g+2BG6QhV
    4VcCb5sfsOLh7H3ZuQLSb5fzcjYD9q8QBzCaI6oyJYayFAHzgxcS5LCNEXmA
X-ME-Proxy: <xmx:fajpahQbSNw0BFUk7t3Lgv1OoRhHRT661LLKYwXr53Mv3et0vcsQeA>
    <xmx:fajpasPRZpM3p3VBEFHIDe1JElNMBEcMRH9j8H-dvztmnbkSLVVQ0w>
    <xmx:fajpaiO6tsFKL3SLAhE6hZuKyGYa_c5QxkT0Akuq1WBtxkNFw8vqiw>
    <xmx:fajpamGnq7Im-o-UtTCJWQgJEFiRIMr8RnTTAGMQowEVC6mBrN3j5w>
    <xmx:fqjpanCm2V8zz-Mr2wxqMFaT6g5cx77PBRhPID4A-tfQ-at7d1tG90FK>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Nov 2026 04:25:13 -0500 (EST)
Date: Tue, 03 Nov 2026 18:25:11 +0900 (JST)
Message-Id: <20261103.182511.1470121559944018656.tomo@flapping.org>
To: linux@armlinux.org.uk, ojeda@kernel.org
Cc: ardb@kernel.org, chrisi.schrefl@gmail.com,
 linux-arm-kernel@lists.infradead.org, a.hindborg@kernel.org,
 acourbot@nvidia.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] ARM: rust: Generate unwind tables for Rust code
 with ARM_UNWIND
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261009124124.1176706-1-tomo@flapping.org>
References: <20261009124124.1176706-1-tomo@flapping.org>
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

Hi Russell, Miguel,

On Fri,  9 Oct 2026 21:41:24 +0900
FUJITA Tomonori <tomo@flapping.org> wrote:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> When CONFIG_ARM_UNWIND=y, C code is built with -funwind-tables, but
> Rust code is built with -Cforce-unwind-tables=n. As a result, the
> unwinder stops at the first Rust frame.
> 
> Pass -Cforce-unwind-tables=y to rustc in that case, as arm64 does.
> 
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")
> Assisted-by: LLM
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  arch/arm/Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 573813ef5e77..d59b8daf4f4e 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -117,6 +117,7 @@ endif
>  
>  ifeq ($(CONFIG_ARM_UNWIND),y)
>  CFLAGS_ABI	+=-funwind-tables
> +KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y
>  endif
>  
>  ifeq ($(CONFIG_CC_IS_CLANG),y)
> 
> base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a

Gentle ping. The patch still applies cleanly on top of v7.4-rc1.

Which tree should this go through?
