Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793354716;
	b=APjlyK3dOQNbnOid6wyC0+lIYeJQnKaft+Np8sAQNHUqqxLVwjCFYC43VNO6ifGG6CVN
	 9F3e88AlurZF6z250/dOa+CtpKODHkKIAZE2h2qx1EoGQKTCCjCViR5uJqDpmGSnNCCPO
	 CNHjTA0nI2QcQRxpItXzaAyWvTuRQFSdX6VWGQq1huKFMDL4UzqJNXED1GPJvgJhxNm07
	 o7WCf0d+cO0TUQFcnFkSMIB44UJax+fKhHK0rgFQXUPwioNZ193XTrULZdf5jRUbAXAW6
	 AXfbEBuINuD8IZVwr+3dqSZaGxNtwWZfrZ3+KTAkPiOJptum7tvCdrz0B6J4OgFtyyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354716;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=CYmf7zEV7N2JO5e7QjNKth9sPECuxuSbTlZTcxut18k=;
	b=DJjFd3KZRN/Ib3WNgBgvvsel/FqG3Yd3BsY26RA//8qEyriacGYn1KKhe7VxJDWVdnS1
	 +dD6oApns9GmtGojRCvFhw8xpJpH8Mf8RmQNZOiC+j3BmJWIR5gVXcaBx5VxjsGIh1hXT
	 QSUo45Wfpbfb3UsDZhD+ybS9KbS5U8ak3nVy7h0dILtr5mMBOs3wdgICYojzZ5aURLfmO
	 EzJqpBHEXF75z6z8JJyMuwPrxiOii/zDunzmX7mDYeY46hhpEyjA0qPj25Zt7x+I2w5zR
	 tLF+UhWL1R0kQAIHP6q08T7iIikdWk+sQv6/1okbRLNiGEriGSFJhFvSZ1Bj2DEo6RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=LTTrns7S;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QxcaxBot;
	arc=none smtp.remote-ip=103.168.172.159
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB0760A2616
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 10:05:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB0760A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=LTTrns7S;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QxcaxBot
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 00E121400187
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 06:05:10 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 30 Oct 2026 06:05:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793354709;
	 x=1793441109; bh=CYmf7zEV7N2JO5e7QjNKth9sPECuxuSbTlZTcxut18k=; b=
	LTTrns7SPkdtU3OnExJh8ofe/pEAmAjNZGD90lWxuwO4JF6dwgwbW0Tz114EHBmx
	dwQUn1s9tIP/21OsyLnDIYHZ2/F6tFz4TFIOjqQs6g8UoqjyhHZLH/Id6GObTVI0
	yrSJkuRusXuRkDUVXEQ9ysHDydgS8PpsQ13Lw7xlJALKNo432I2wJEMi3sld0QmQ
	1ihDjlZM7bZLw6vFp0QvYknoTodJKnBqIdVjbpoXZqyttmiLRvf1TjVwnLAq9CzO
	IJZnYUpGHvxHB2Ubaymwh+AcuZF+jyiONEb9N+DH79hG+KqKyNS2gMOj6PrvCpwu
	QkrY+HquqfSW4tRdxGYeog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793354709; x=
	1793441109; bh=CYmf7zEV7N2JO5e7QjNKth9sPECuxuSbTlZTcxut18k=; b=Q
	xcaxBotJveEQIpMKup3A4QP9vpRlUifEg8zao0R0iUqSZH+FWrhXsCvl3g7ecH0s
	RKI6LCmxPPpjzxRRnCtURhsygiuxGsgL+3pCnUwbx1QHaPW7XJ7I2EqkRm5cMTzP
	cYin9/nzVHcGTRbocs0PF3G5UaL6tBpUjnpl9+XbuWeJe+v4f2TkEcwZUnnF2psw
	1WhfsILBuH/jSZMXMpKsN6MNCiEytumAq2i2G2W+LxkdOEcNUogDgKDzxaB8nK7S
	PhVCx8ZX+jGa3kX+mxySM2PgKF51tDidv0FLlZ0zsPKG/AsLqlGcy5aZ0Emy0+dn
	yEjLJ1AYDktjkF/kDovCA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793354709; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:a1HuufBTOos68miiVJCDa0JZ2EGJ8U0Xn60NoL6w3aR+mvi
	Pa+r1+DYR+6jHdNS7ruk1dZvfxUWiKvnvMwFNM+l9r0+t+JHUctA911Na3FfYSVh
	InKLFwCzT869khwTwyz+ttdaa0RIkeFDFgjyeJx8cJrLPRdGIlzHIyoMlHNge1HN
	HWol+vw18kNt4HO/uA6eDGSyTt6MXtL0e8sSpBuzKM3B0/NxFSSLEai5fIUb7R+3
	sULuh9zgrsLytkaqOV8eSsfiXiAd6dvvgD2Hw6cBoGIZ+sUTR0w6wY+jb4d1s+TE
	43xWLhoMHaOOeMjb9rVGNRH8v87HmYmxb74uIcA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:O+zVubfLIZG+YDdFFy25xWSpDtgbXwlawSh8FXN1sXE=:cbcMN57HhtchPL+P79PrPbn9la13DG4pgSMEvOD0+F4=;
X-ME-Sender: <xms:1Wvkahoh3Xt12nODHNFXTlOmCWpPqXRhk-VNbBnp5eU97df0sHpzcA>
    <xme:1Wvkarkq03wrrRcFsgWwo1-hbi-k89rYzXY4d6pDwQAjWNo9AlO3iTP2uzBTgiZpS
    PQM-uSFi1-W4x4L0kc2bCNwyN0crKUx8LC7N7U1ahOz7s7UilFeUI8t>
X-ME-Received: <xmr:1WvkalZwfcSGTQXTL4SsKGsUdzI8XupzxhjQc5akpcNNIvxUkct8T7MXOaU0SguBvGG1NJsEc8rBzhMdIgos6qMa>
X-ME-Proxy-Cause: dmFkZTF3XHbGwWOzLbWHktg+P4vPkKHpnO7jkRsVw+n74zppSuF93Bwys9kdl7GCDyRcTW
    gtTlKmdCUd6M21ElAe05m2OjkCo4/i2B6SZeq1DcJYCDFG0o64qhESJhf1AJPt/MfJk4OX
    igGM+6D+CLS6LtruurHqOOdOsaeaZk0qIyZlp5WZBYvS95+DEabdSSk+gUd+TBsLkJ2zcb
    SbxIFoFm3C5JWamieI9BGJ/j9n9QamNiMCbGcFxS/0qLrwuT3paqYIJDhwy9UCUe8BZo2Q
    WAgMFTVYky66yHBQnzGOM/IzUi2mSPflAo6q4/vLjHp6G+NxaUJ4HXedhoSgGgmaiH6MBr
    pz0Frbabu0eXzJxlYrgotW0ugMy3XXL82q6VsMOxLwf2e2+nThVgP+dRik8V+FLcFmtgbq
    r+t/9Skl8V8Ox7SL65CAbUDhSDNNs198fDWQL3vHR+HNK+l0yzz15HCzdzyymi5jnx1j5L
    9DqWIZ54fNY7LJ3YH2igsx0SSfSGvyrB4UQTVUpSFKnMu4Ae0Vpfy9fDvJ5X4IvmWebPgT
    ppVl7IT1s2l7gyet7Yc50+QU38mehBpUeQ3YFgdfHAqwK8hW7+0OAsrhoNJUhRotOs1wUh
    rOAM0ePvoplpVJDPDgs62aKrUFTYifE6M0NCNSfAOyR0mUFG8NEnRT7vGh5g
X-ME-Proxy: <xmx:1WvkajV2gZR1ikP9r-2VTE1Bed7CIJAntSKpjg0bDbjNviS3eCWdKw>
    <xmx:1WvkatBEHizfm52NwNNpiRR27TR4byDYOtEV_-mTUnTV5-maOQbeAQ>
    <xmx:1WvkaqxkLO9iVMQFlqx1PD01ripjEbC46GAkKkUe_ieWUfNw174TLg>
    <xmx:1WvkarZZSMlqKCViXdIwVhqMRuYYRyaWMhZhi1Yb-ncdVOcD1O1WHg>
    <xmx:1Wvkamb3k7q6fSz964NokTD-7GIE3uIzL0BWt6KuxQIODgV7ByoSIhQP>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 06:05:05 -0400 (EDT)
Date: Fri, 30 Oct 2026 19:05:02 +0900 (JST)
Message-Id: <20261030.190502.1711453613571853758.tomo@flapping.org>
To: mike@fireburn.co.uk
Cc: tomo@flapping.org, a.hindborg@kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org
Subject: Re: [PATCH 9/9] rust: time: add ktime_get_real_seconds
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261030075750.356854-1-mike@fireburn.co.uk>
References: <87h5jzx5gj.fsf@t14s.mail-host-address-is-not-set>
	<20261030075750.356854-1-mike@fireburn.co.uk>
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

On Fri, 30 Oct 2026 07:57:50 +0000
Mike Lothian <mike@fireburn.co.uk> wrote:

> So it's the case you described, Tomonori: the format is fixed outside
> the kernel, by the dock's firmware, and what the caller wants is an i64
> of seconds since the epoch.  It never gets subtracted from anything, so a
> seconds based Instant would only be there to be converted straight back

Right, you only need an i64 of seconds since the epoch and do no
arithmetic or comparison on it. A type is useful when it guards those
operations, and there are none here. So the plain function is fine
with me. If a caller that needs them shows up later, we can add a type
then.
