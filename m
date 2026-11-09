Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265092;
	b=FKVh7RAFH7VgI+KvL3FJNyMqfsJa4CYRxkvBSZTQ/FeoAZLBNv5zZyQ1BUnwmuZAulVi
	 EXzCZxpd5SKy60FQXPk/woVUaDpNeMZuRnf6WXRhAT8pAvwmI8PKdOI1mEfQFuNDRyrle
	 VJMKtqQ6SfTcuQuNLVSzuz2wRYsdLf0qhtZic0OEG+kPJQr4WQsuhStM6FcKC5RGzTJM1
	 36k+Eleq11Ez9p+gtMHzYkz/FXp+qAyxX6ZcE6BjaUbzkHfBicBJb6Nqzce9oDkw73tq9
	 nSpKLcLXFNZPbdxXfnIJCa/Tnjr0Jf4lTNGCSwMnOrYn68a3cEd5O7T5gHvI2GZg9cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265092;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=kcutZ0X+ZrDPvubgOobo9BpJ/79gJuK50QMpV5H02co=;
	b=jffwx2u4HUhMe3kyqbglNklbDp+mRJBIi2aeucFx6ukYehq+yfyu+iAzNf3NoyTOmv1c
	 HfzrhLrmQ6I37HfudNhgJBP/KwYoVDyNbYSMouJdo+1CKvxfznqBat/43AtqiXD45RKqL
	 AZAKkuTtLiSNzzcFbRret2vk/HS85CgRXfXhXYQfhZWS9iP4rgE4wtpYPuHe1dWBeOeJH
	 Nnn00W216ug4zHD+x/NVEVYeSHzwjcR4W3r+R78au1kBA8ZfU6KAaa1DR5qCaYLXga7R3
	 G684/vU38PqwFEEw4RQ/HxIxUmYOy1vxGsAZ8jGHy+KTiP+ID7yqeadw4Qj9VbCvpqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=mzzfJm+W;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UAArsezJ;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C928606A325
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 22:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C928606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=mzzfJm+W;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=UAArsezJ
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id 2995B1D001AF
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 17:58:11 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 09 Nov 2026 17:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794265087;
	 x=1794351487; bh=kcutZ0X+ZrDPvubgOobo9BpJ/79gJuK50QMpV5H02co=; b=
	mzzfJm+WGMopTUGQVfMKK5ODmEpubpvfzw7hG2cOBxTxUA/XeQ19SrC/j7O/38kK
	LBRhjwjvVVTPPX1nb4RUh+EDodVxIIAEIkJg0d1P1jC02RFERT073sbE0BUy3TDs
	OiXxGzUZtqB7La4d6D07uhtADlOuk4vs1vsQ6XxA3+42QiAXsN1JbOjrbrwRNSim
	1fWvUQRfp2POskoAAu+sYfZiCCMUxyQ72OsDGx2dJrwrQXJramgVz52IuFaLa62B
	8aN+ei+rElD7UgXdaEVjjwN4AUCy2l+wLqtt4tXXsj4nIb60vqi+4CdgtURzgpA4
	oVujUhW+U5AqdohA8aqnmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794265087; x=
	1794351487; bh=kcutZ0X+ZrDPvubgOobo9BpJ/79gJuK50QMpV5H02co=; b=U
	AArsezJVNfh5on0ymY9AObrFnTi3McPKEERaed5GQA+JW9e7Pr1xE0vUzhQGeY3s
	2YZ4EDsRQqsY2bsrDeLKxJGDfL6bh1Nuz7AVjaVkya+0jHfBxzk3T++NDpCcVUWf
	D2gNciAG6/m7D9a5faZ+vjoYC5EYX2fAxTNJSVOUFZglsRkzxEaR8qK+5DUf5Bev
	/qeCQS5Z5Nneu1rRZT8mRfbZeN6pJmOIZiKdtPhVY95ZwPVJDeqlHnjAMGT9qWcU
	XQE45GjEkVnf0wH0dGaZ92VH5isgq4aAWLTRY5SV7dGS6Ah8MLyuZeoyNJr8aKs6
	OAYVBqPpDAx67M9KoX0zw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794265087; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:fBkvsUhB67Y5BIWvcvqh/mqGxofmCvBolj3iO7kghadLplQ
	UzdGo0ng7QwDWp0qJfJWgihDp/2xgNVagIEgpmA65zdNgszbLIMdI+8AdAT+ahmk
	31SGUOoATIbxYieRhw8JhI8VgG0o39lj4zf406FkAzyQBSpvTR5LLqHi36PGTP6+
	QYhj5lbVsGD1OnWrM8m6bzBoUS69PC2vjLhWq1ZccObaTfHrZS4JhhMh91Z99gtl
	9yQWENOkqaVmLU+XuzMMZhUZiUmTopJ1Rg96kLzTDaTfIfFRnj9tCSYQ7Vk9HWcX
	5Ogumo7EmbryjgwGaVYCTrghhsi0BTabN5mxDLQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:0GozLqTu2IssOB8UF0Hcaw5N1gO/5S+HM0cjFnSNS9E=:kcutZ0X+ZrDPvubgOobo9BpJ/79gJuK50QMpV5H02co=;
X-ME-Sender: <xms:_k_yah4ANSIYfzYp2Y7fpVgQPh5S9WccAERp3BeSoRJTQ96V2Jz1Qw>
    <xme:_k_yaggIHWTe5XFihaFvf2Cx5jXbk-BGN5VbEzhjCf3nWN2U-STOjZCdm8QyTDeoH
    40ZE7_0uLTexxP9sIumzZKxELD4Vfgh3fcFwf5E_5gA-yWExcYOdZzd>
X-ME-Received: <xmr:_k_yasiAtXPBSp0o3Y8PB16OoVvImddlmg6xZbbOBvJQfZIkLIgFj8X_EvFJL1V8Jzgb9zzVG_yB6b--Qugk-2E->
X-ME-Proxy-Cause: dmFkZTGneUUp0FtI+QifA0Lct3oPpXCkfmLj2XKFUNhJOHAQdI8CWr4Xgdc2qiNxI3m1I1
    2ApEO1GDRxRm36XPZPBr0Dn8uNDzQ40r1l/gOYT59r1Lr7wJTeM9N0AduzLn+H3zxpssM7
    i7ewCOsjgWBiiIdqubxVzE4N22lG4DmYZFmBNMkkjx4eP1wwFpKW6s2Dp9ljXEzF0ey7q1
    T+2A/YeEj+/9sUX7NdLYon6fTcH9yf0T/KL9smxQue5efZvqT9MOC6lao5XPOqIyvvJP3h
    OJTqMWQLx7j/GYQI5MfW9hANxINIi/uXDUUjwB82vPbAxkBBp0qa8MY07H5OwaB7BPIQth
    rGaSpkIF2WqU2FlYGftS/4JbHrzkexIxG1ZzUM8WLYRV4uiFC0nuJiP1m2/N2lgstrR1iv
    KP9U79blGj1FRt09WdoHUISeuGhRaU2hPm1I/n6kY38j3J0S+f+isQgtWgLpC4pZL4hjG2
    qEs8OylyM+EA6P4MDaL/QXbOUHF/KSw988RsJ5sH6NizYlJ3O2+m9+xX28k7lbj1kcaSC6
    SvOo3+EHMz8b4KGZlD+MfzafSndZ7c5VstxscVpqxZMYpOFWbxJ6ZHIiyU/5NzHWBup06F
    OCviZ31PODibyM04Mwk2en5x7heatFfCY4UcrrsTXf5pOKnBRoMUT6jeeLog
X-ME-Proxy: <xmx:_k_yagksbUSODwzYc7GxwO0KF77wQou7E0ibk5cZM0PO5Ic32o95sQ>
    <xmx:_k_yakFyUmxWC-kucrSpJIrxaQOEnuY1_oOKyY9zQ1F2p4F9HCe44Q>
    <xmx:_k_yaiP__eVIybcRelliD8mBz3p1KiQerMVaC0L8404hjSnZFf5iUA>
    <xmx:_k_yarskzwaNxGXOqb_--HjCvlj9xdudfDKDiiy66z2xme1TKJNQ1A>
    <xmx:_0_yajFKpHcT4saSmYaGxiAcLVec1ZeVAV_ORMP-p6-T_XImri0bwcVI>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 9 Nov 2026 17:58:01 -0500 (EST)
Date: Tue, 10 Nov 2026 07:57:58 +0900 (JST)
Message-Id: <20261110.075758.247487148810717068.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, fujita.tomonori@gmail.com, frederic@kernel.org,
 lyude@redhat.com, tglx@kernel.org, anna-maria@linutronix.de,
 jstultz@google.com, sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, boqun@kernel.org,
 daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com,
 work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: time: implement `Display` for `Delta`
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <8733tgnc41.fsf@t14s.mail-host-address-is-not-set>
References: <20261103-time-delta-display-v2-1-b01b1fe9ff9f@kernel.org>
	<I_BPRv0XwpoRCf2AG4Ot12JnHyqvdM9lb_wF0sZMixc0UIoaBb-aeNWYuff1oe4_X1m5SpCTcZp9woOg-dt9Eg==@protonmail.internalid>
	<20261104.180854.547774168466136920.tomo@flapping.org>
	<8733tgnc41.fsf@t14s.mail-host-address-is-not-set>
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

On Wed, 04 Nov 2026 11:07:42 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> We can also change it to be a `Debug` implementation. I was not aware
> about the stability requirement. But I guess that is mostly a user space
> thing? In the kernel we can change stuff as we see fit, as long as we do
> not interfere with the uapi.

Right, in the kernel we can change the format as needed.

Still, I think it is easier for users if the kernel crate follows some
rule about when to implement Display and when to implement Debug.

As Miguel's suggestions in v1 show (12_345ns, 12.345ms, 12.3ms), Delta
does not have a single obvious format. In the kernel crate, other
types with a unit, Hertz, MicroVolt and MicroWatt, implement only
Debug, not Display. Display for Delta would be the first exception.

So I would prefer Debug.

Maybe we should also write such a rule down in
Documentation/rust/coding-guidelines.rst.
