Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.155
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663511;
	b=lurrUWoxRicwhw+1N/jSzIavP3Y+FZE913NI2YmYPH2ttAGguCDYTs2CWIQom79cS/Wt
	 6v+qr1uFyPGof+amu4RGh6bGt9GzGok/eGN3g5DM6BL8238/bALsiDyhMqQ3LYL2P2A96
	 iG2VPGRE81Tlg3QoC7/a/i3+lE7hYbRDAgu0T+egZlVDUt+2UKd4XC1BPGH2UJ+Qr+n0D
	 YeqjcrYfadgS8FpdsJTkGhBMxLOln8eZ22lIXS8kGklFMa6xMEfzNVTK13aNn8t3lagbB
	 DfRYbLk+rv0xYu2ZmwIJvw1qdnLG6gNgBCuJrSRlqvIBc8HX3gbbIufx/fozHk0f47g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663511;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=SNG1HRb8nHFIie74LXwMhLAKLST7T7jquSoOJxOlEK0=;
	b=ybVlaCll4JXvIxDWdT9WZb0xZkYmL/XkrRW20BWf2BO9WTOMYFTQmgqQCcwfl8mvHIOZ
	 VceLTzuy0XneICSyiFOwQi9afyT4oPOP1xzAvKd2djqA6eugUtAje6FYSuVGk71sAfGOc
	 HBKC+hS6ohmn6SQhX8MlH3TO5YsJdPaBup6VLHq+XDSvo2iYESU7aJLbtJ1J1Dx17qrDK
	 Unq9d82moGplvBkONb7CbBl6vTN1GHWaC13jduPAeDhicDWvIzTCUIpoo9r6o1SyZzDsb
	 yvTLCXe1LmW5Rs4FiogwcaTE/8peKkkaeSMoLAKHVS7iWK9VBfX0n5lzJ24i2vRMv+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=temperror header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=kjDDMOtI;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZXkXzX04;
	arc=none smtp.remote-ip=103.168.172.155
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B926606A329
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 13:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B926606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=kjDDMOtI;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZXkXzX04
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6930D14000A2
	for <rust-for-linux@vger.kernel.org>; Sat, 14 Nov 2026 08:38:25 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 14 Nov 2026 08:38:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794663505;
	 x=1794749905; bh=SNG1HRb8nHFIie74LXwMhLAKLST7T7jquSoOJxOlEK0=; b=
	kjDDMOtIsUw7bSdWWMIMxExjuwJMfM6fUrRhZ/kFv1JsJBLXywr9mHhX+SQDzzKL
	rKTLGR37Le4FAOmgLPO0KiDyAVR3YCYNb0KVZG5JNRvkJIO4s6Kdh5y5z4gvHxuD
	YoBd6lFVs/24bKmI9bnee/fjcTf4jdUZ+ubQCVjr9Lk3RlKwIswN7V5hHEdKM3Ws
	KUZXeEUA5otuYK85n6SwzwHm9Z+/QFhWWw5YLxnlJRvuW+b680eNQbJhAtk/X0ru
	K/d/r1qWZ7kseS+YbngpiXfIL7iYYXQccr7Cq6Cs+vYUOXmgSmNDVZtljBk7/6WN
	t0VXWL1hN7FszJUBrep20Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794663505; x=
	1794749905; bh=SNG1HRb8nHFIie74LXwMhLAKLST7T7jquSoOJxOlEK0=; b=Z
	XkXzX04q4UyVz+lf8NtnAgfAHirWryfPU5tFvaA69SsZe0EW7fjK87bBsFggvRpW
	J2f+3lARbnoLTkqwtl35LjIb0iUpLtmCwrnrBYEikvU0Jwcgavp8aFLkSnylEuam
	lV5ex/fR1r5uzupd6qCJaJOQKGlfAXcZQXmQ5YSydfcL2DTX5HHcIHvHF76i+7aQ
	fhxuq5ksXHxYucjDpTQRgYVe6LfDuMiBo8HKNPI8zj7pJ6XxBOd/QJSq9udXruZs
	KTXMSrxV3OuCOJs0AyyWvDGaSvumSOXPhBONC3zy39O6Eg2ZZR6AcwKFGeD9EMuO
	BhlEvcRK48YyymFm4jqjw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794663505; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:uJd9bOewLjzqdtHSuxEqTatTddKxIojXhH2RtawCSoA2HlA
	eOiPf5+A3YgE2jQG5bBTqb4KoHRjqizHgleRZrFROkCZojpJ9EDIZfmoe2GOTkZQ
	lNTPI6ReZOPEu2Go1sNum7hX6UJB6/SWaFJTwt+HrJDCeEA1Pk52/gUX/B0h7UZz
	rPWP74MgGia4NXL4Vn7ou/rRnPaRwRX7xCR6jisXxOpg+VoON5WEp61sg91gNC6v
	YZPZAJtwwGXpYOro7x6Xe1wH7VaEz2eTHqD+AYmk1tS/uASy/ZOyOcG3kjMZGBF2
	cMlN6UWxwas1phSKeGGPkcsrIjU6dgOjmxZP3ng==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:f9opZpIyqagmduFeeGp+xKUJT++WTJdd2E/jjBkBYfo=:lU5PHoFLOrW5W3SGXZtCpCZosecH1DWsdh966u97RCw=;
X-ME-Sender: <xms:UGT4agKAWa5ySOtc97TQISMy-97FHL2OfzX4uSuKWCjKjS1-qIU2BA>
    <xme:UGT4atWjLXkvN2rwfSSzfQ5RsUvoMnhL0nkz4wTXfoBK8IEIg-YzKxB-urofSq_81
    S88oAytwY2-srH-PjH8_0i8fJiTU9mwDAzM1QBjnqod2DOyW2T4I9s>
X-ME-Received: <xmr:UGT4alOYs099Ivx7PoBIhrdjgUoi_H9LMpqmJbh-FSMQUlJgnlxCm9ae7k9o2eSPuQlj7aLuo8OpjI8Vinlrs76B>
X-ME-Proxy-Cause: dmFkZTGP3BUWlQUihCukVcPKcTSgRT44A4NtkjyCSrpXOA/rwXWHPdz16CsJwJJyEfGatL
    lN7ru0/bjWuVwus+qg8IqcETdlNBpF48fef4z6tyHamWyDNIIzYe03ACQowYrwSJHAZ8Vo
    lvfypnf3SveEnc3NnZR4xRbeVLvsA/FkY75IBy+dYZd6B7umcwKRfgMYFd/WK5QM57Vnj9
    BmeVgMpoO/QOvVLovaVWsh8nVgQuZu4003ZqUiazRIRGRLF3S70i9QhkTtXD9RzX7Czkmn
    MgWG+ZxTViB8Xw02wyuvpZ45gFna4jOQNaOt1JFnvKw+0f8ie4mpP7NZIWqxFpdmlz1kKe
    y6mh+4B83bYFIJ0yFcWsfd1rFn5SmSEnudjOYZK7gYqCCwbMuhnMpexVFxv9ob9ECe4I67
    by5e77wcZfvni8QYKNOaKXwrl2jxeEbJOIR1pNN3PB3KVKRXCoOmlm6V6Me+St6KWuc06J
    xPt1KCwstHXAvPslZk0UMcWTc9ubQcq8uJAYSywQHe0VwHvctj4Vdl7z4KQdJ9uM/25bhJ
    XXQCdN1KprZ+6AE5H2qB0zIpkeCXi829c66eEWFkab/pH680qxI+BuVSZxBUl6vkFZ10Fy
    llHgiwxI+0uxLOI67X1HIa+ljQs19jVFyJOuUYlCGKfjNDFicbB4MA7kV9vg
X-ME-Proxy: <xmx:UGT4apl0n8bbnI0VZnG8vgM23u56GC-tSbvAkf2oazmZhu2zYMcnfA>
    <xmx:UGT4aoUAdGYNJXWIuqt-sf5wY7IDdoZCFKyAeGoI7PrqT2BcodgtVQ>
    <xmx:UGT4aoJdiW5JK61Ond5x6dJoQpUc0dJ6LS9xEMJ8OqI6qsuvUOZk8w>
    <xmx:UGT4asY4Ujiow9_baoCz-AyZMP2tdtO_uR2T4Vlt3pOFv0T67ss44g>
    <xmx:UWT4auPybT4Cfr1pYKtDssyRL9DWsNAIDtacQe3SZir_YQbu25i7Xauv>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 14 Nov 2026 08:38:19 -0500 (EST)
Date: Sat, 14 Nov 2026 22:38:16 +0900 (JST)
Message-Id: <20261114.223816.1091200428221776094.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: tomo@flapping.org, boqun@kernel.org, fujita.tomonori@gmail.com,
 frederic@kernel.org, lyude@redhat.com, tglx@kernel.org,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 ojeda@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
 acourbot@nvidia.com, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: hrtimer: add active() method to query timer
 state
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87wlqiv386.fsf@t14s.mail-host-address-is-not-set>
References: <20261105-hrtimer-active-v3-1-52636808ccda@kernel.org>
	<20261105.201145.828445900027892304.tomo@flapping.org>
	<87wlqiv386.fsf@t14s.mail-host-address-is-not-set>
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

On Thu, 12 Nov 2026 09:55:05 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
>
>>> +    /// Query the state of the timer.
>>> +    ///
>>> +    /// Returns [`true`] if the timer is in the started or running states.
>>> +    ///
>>> +    /// This method synchronizes internally and does not require exclusive access to the timer.
>>> +    ///
>>> +    /// The returned value is a snapshot. A concurrent start or expiry can change the state of the
>>> +    /// timer right after this method returns, so callers that need the state to be stable must
>>> +    /// serialize against those operations by other means.
>>
>> Does "expiry" here mean that the callback returns HrTimerRestart::NoRestart
>> on another CPU? An expiry alone moves the timer from started to running, so
>> active() still returns true. If so, I think it is clearer to write this case
>> directly, and to add the case where the timer is canceled on another CPU.
>>
>> The same sentence is in the commit message, so please update it too.
> 
> Right. How about this:
> 
>   The returned value is a snapshot. A concurrent evnet can change the state of the
>   timer right after this method returns, so callers that need the state to be stable must
>   serialize against those operations by other means.
> 
> The intention is not to reiterate the state machine, but to indicate
> that things might changes.

Looks good to me, except for one small point. Since "start or expiry"
was removed, it's not clear what "those operations" refers to. How
about something like:

  must serialize against such events by other means.

Also typo: evnet -> event

