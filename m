Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662432;
	b=ZhqD9VJTo5IiHljSuzCJXe0TwMAvx2fS+JWCmZYyLRfe9KtSiuVnwnb5flXjD3TZmxGS
	 hicVrL5Dw013PQfLOGqT/PWGXfArpQ4/MJ9myC4i0aT4j69Fa+c9LLv69Brsg67Bw/eep
	 X8uh4wU7+H1URmkQ5siOqe4Cu50rjfQC/ZxyM4v0+aT8rfS+rCauA+x9D1iIe4lSXXske
	 qLjoeXJpYssmKljGsrHbKJw6C/XmYEdrgGhEgUhXoNQcuk2/ID6atioqmbvCfk+0Bea9C
	 XE1fy3guy9ZCFZDzuhH7YEI9/ltVD0DgZmCTfYTU2lEAmtcUHANk2yb76XGTMB4AGAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662432;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=McOBXCrOsz5e0FaEET5Vw/sSdARBeHlyWrqOV0jH/Gg=;
	b=yxpWM7yr7f5m5Plxv9FWDlL4BBl5fwO2p3G6xL6EuE/qr5BbaBCSm/ZBDb6DuQbc9fFl
	 TKkFru+T5ipbluJEwKBed0Q7pU35Y21B3XSv60XvjsUMVwK/6QYoylwXJLA7eHvgJ2zMG
	 bkmknvB/Qb8d9dszaLb1qqz7LrVtF5YrVm/UrsrXwiHPbSjhmbuYcoACpJkmhZpz454rq
	 ueKUaial4sRTWcUFLZ6MHMGm1R+oEmCpCZxNRbRlqZifJCH4/lGbYa/WQWHarCdAYe8Tx
	 aa/n/2MoPYlUpVSx9hb2jSHZeap5Qr/OcOlZzGSx55OeQMakHhI3tZgxK6sstDqwgVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=nPTGua62;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=H3SfsiHL;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C9E606A324
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 23:33:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91C9E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=nPTGua62;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=H3SfsiHL
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id BBE98140024F
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 18:33:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 02 Nov 2026 18:33:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793662430;
	 x=1793748830; bh=McOBXCrOsz5e0FaEET5Vw/sSdARBeHlyWrqOV0jH/Gg=; b=
	nPTGua62b3GPFlNIgLrfatEUvDu/WXYbItyuOus5aSklQ6SikoUp5PVkMehKAxZH
	IMVQkuhzj/TiZi8eHIxeuG2oBgVRYXMSkhpuaZP402x6JOLMUezeee0sDewRwYAC
	YN9SXJ3xVlpNjV2SE2l4MSdxQM6b61Wgzsx1JRsF8vD1RCQAGw1dwuOjabS6Npmw
	3wTWYyIJgrZJ7z6oIjM96YOrTbEF7NzyHrqzLvNPqzsvn73LuNEX5+hsM8JJRXq8
	kWjobAQ1Kn5VGPWPMiVwtRFo9HtKIve+YTe7G9lTkzkFYIB/Plbr7eEak0VaaYsP
	1g93X7b60+UE/Ws1a/+ixQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793662430; x=
	1793748830; bh=McOBXCrOsz5e0FaEET5Vw/sSdARBeHlyWrqOV0jH/Gg=; b=H
	3SfsiHLFiHXY7ftog7xfGrgs9ge+VbOIiqFcIqKLQvbdNfMlRDp6PUkq/XwKnBLR
	YZsRHL/opVPEVW6E7A0b0/+xZ481XWi55slJLg0ZbWm0G1zYJZMXgcieqJHnrvyy
	cr13qCYQPkYJUinywbeByc28lW8b2tCmk9sNoelmtUIlDcT941ZwI2cC80+HPDxm
	oFz6m+b9dF9b5BTWIaX3btVOkdao9PAo0TpR7ekhnz0IYCQVrcrC4yF+5PAxXFVa
	Xj/06w1qrW/NW2P8vjsPZLKLRjmeOvnZvlsThMnccLrk/oaPS2Bx5sSx8oWK5TMB
	wjyrizBYXvXjUoXpnEBIg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793662430; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:rvbgPqdUz7KF92M3/uY6TFIrmG9o6r3h7FDvCSmy24EG2bg
	KnoSkSeLAsJuOqqKZlCHT9jg49xS2uxAUmzsx4I/CfwXd7hGxOTiIgY+axxnhejL
	deB/lNg3kny6S9UfgNtLNmKI8HZjle5rG5oRPhqm4qukiRH1cl2f6OW1xGeRNwst
	8DZXz0eXVm0h7YNUtfZQOyOvF7bWa9Peom04Quz1ls/cYA2/Ce3ba579g4MmBUGB
	d2ussDe082g0hCM4LmWMS231DYYc7ERgHqt3wU2Jcp6DSoQ95J6T7NkQWe5wP+CB
	CDlUHCWG82lpaXRNwgA6Le16oCkpYfpoPn0vAvA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aFN41iH9WnDoud02ZTIFuHruuSVdR0rzjZGHEPDLeTk=:McOBXCrOsz5e0FaEET5Vw/sSdARBeHlyWrqOV0jH/Gg=;
X-ME-Sender: <xms:3R3papu4vISuJs4koJfQV24o9-W-6XT0WVL-RFnjXLgun7FaGk9Dtw>
    <xme:3R3pavoyUsHRatRHAM6NXxhGFcMIaHglGaxroqctZCqjCZV91qnGJalSvPlPnSKad
    G9zM1rRecWf0KvuLyXKglF28xIY29MPqCaSSSkq-YTuKwJ320rUlKki>
X-ME-Received: <xmr:3R3pahTJ--vknKjBaIXU7ppad4H6jm-8E-IoEL9Ru5Mp_lbFsEcJ6yTzLqoEsJCh_8kuuh1OPrRySZreEGtjIoni>
X-ME-Proxy-Cause: dmFkZTGL/tyq5f2uBiEmN1AkqSHDPGi7kcR6r3M8C6U7TxOEXQo8BRPirtZEtTCJEd3BE4
    4qjdXGwB58EA2Psokwhyqt1uXwohQNkqsYKbefsa/X7kBQws7e9jLny9qWwMbxn+aIGcs1
    RHPtisscWu0EQn88zKDW5z9B3gYrOT7cbT1UxCictUcUrtVwMVvLgvYDLhCm7ob7TKfrZ7
    j9u4J7cCWcQo4cNpuE3iIGWFBPhiYpOrkzs++yNcZAUcEIsyJ3pjgAmkOacpU7kUmX6Gae
    hVgfwM+BTGNZCamdyZEWdhFF6Xeiuu3TRZ6NrQSX8qIkryBZHG19UI8PiqeFoGM+Hk0cGZ
    4PB50NVsFT0LujrdIVJMVbqRL9TYZRY1DcF9oUYKVBgXY89FzHGvZO0Tiz9+P1pLyKsFZ5
    3nuBjA2uqpxvlGQk7KWEEXMmg9XD3R0vFo/hmPjpUGfv1Fa+gfpeQjIKKHLiK0nNYH08kX
    dQvEMtD7DeR07bw+D06zJ9MfCKDfF5iBOl+5BkeKzvDwPgS0HGiA3NgoWx6icY59KWQdPA
    Bd3/sQUeb6L5GSHrFDsYwT1crUwt+gHyeRtSFGzzkd97IAypUTohWr1CDK907w4LklbF4j
    Gn1smRNU/WzIzj+DV5tAF7ENjHrKntkTYqi8Z68lCXqiDmni2cZrCZyPJ3Ng
X-ME-Proxy: <xmx:3R3pasacFX3pDmJ4JbJjkO0cW8MJ6btLQyvpwD6C8Dw-jFBz_obJ1Q>
    <xmx:3R3paq6JV07_kblfYEwqtCIn8mS4o9P82CLqBNDj09yMThho5PJ7JA>
    <xmx:3R3paveZcZez2cbL7kYVTXMgZwJKQ0ldg9dnj1VozIs4pQrac5mgsg>
    <xmx:3R3papcUYXvB56qYEGb2wRWbRKjqz-UMRVwMlzPiFdDtdzsNpx_ZaQ>
    <xmx:3h3pahRD4djhiYvzP50hdBP8vT5LzRmOoYHKoU0k_SD4Zw9pri34lP3y>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 18:33:44 -0500 (EST)
Date: Tue, 03 Nov 2026 08:33:42 +0900 (JST)
Message-Id: <20261103.083342.865260022622203055.tomo@flapping.org>
To: a.hindborg@kernel.org, ojeda@kernel.org
Cc: tomo@flapping.org, boqun@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org,
 gary@garyguo.net, jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
 mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
	<20261031003334.4161188-1-tomo@flapping.org>
	<87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
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

On Mon, 02 Nov 2026 16:07:49 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Mike's series added a free function `ktime_get_real_seconds()` [1].
>> Andreas and Boqun preferred a seconds based `Instant` instead. This
>> series does that.

[...]

> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks for the review.

Mike's drm/vino series will use Instant<C, Sec>, and that series is
based on drm-rust-next. There are other time patches on the list, so
it might be simpler to take these two patches through rust-next or
timekeeping-next, and provide a tag that drm-rust-next can also merge.
Andreas, Miguel, would that work for you?
