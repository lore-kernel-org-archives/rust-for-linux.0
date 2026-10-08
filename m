Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8703E40F754
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 13:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466839; cv=none; b=SxWmVxQ9CyaBIitOWiiOUymeSsogGtoALQZhgwFUKoh+Vb2gQJaX1+fAD++VQYzjX/kG7MFK203y8aUcIAuFnoQmkZWZxjjhPmC+e5y2gKdk9VS17h+7zSr5Dzlo2JcEw6UroH7UQBUvSDYp5+9eu6dbha2oAmjDDYS0UhcfXW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466839; c=relaxed/simple;
	bh=dMU5gDFDndPQntnELXRe83VyHy5u8IIrFunscx5Ux+E=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=U/jvClXj/MS37igyVk29gPUAP1uPi7NKw2lO/chft8Q4LrkRI4VcsAJ3pfUp55okm+P/iXo53MQ1IXJUHvw1e7ij/vFhXTK49mKJPXAUJZPu9TcXny4FMhMAyc0cu72VTkDh4jvPK3tmI35cdKzYsIXRQsJvJk4UNJY80dWq+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=CeTGNPJA; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=y6TPahUQ; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="CeTGNPJA";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="y6TPahUQ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A2DBB140011E
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Oct 2026 09:40:36 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 08 Oct 2026 09:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1791466836;
	 x=1791553236; bh=h+db636bXtVWCb75xLUnxkAlLMkE3DON5NU+canvwco=; b=
	CeTGNPJAgMQhm6pobAfxFxX70e8Urp40J7/OxMcxx5rVgLCmhpVGTtfo48v7BROy
	RLBAJSx8Qv9NoJvYCcd46Mdg3NX9QYdnJrV380Et4W6+PvkXp3d+Iq89xBMghg5Q
	9GoVUIGVohw5xP57VYfA0PKbBtrDggxY/GtZYYDG6rHlXGZO/bfkyJ+opOVRFO2f
	kUXm8IptmL5HBQfrtStROjjfQaz4fuVl7F5ckDikdxYuL95Og3QTkjCA0meNeOdk
	u6ZgG5yzmjCDf4hPckFknv7ZTXYVUki85l2KVhXOO04fJitG6g8oo6jbj3QvQnHj
	DKZkuk7qzvIOuK/uzccpZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791466836; x=
	1791553236; bh=h+db636bXtVWCb75xLUnxkAlLMkE3DON5NU+canvwco=; b=y
	6TPahUQye0gQ8dtSAAP8bbZ7WL0ZFILQl1hh3iV5bo8Sg3F7hZZQXEdaW16Pngg9
	XDj+TjnM3xt5PYLg3eV848BN4apJES3EzydJSrcE27qcJRb+jNo/cvu+5Cg/q1HY
	mIv9TYe0x1C104r3K4JOYQwEAPYCVOVNrsRZTdIZXowgJXF5mmZRZq8M44hod6XH
	QIOHEUgMXMlN3rHiZOIQuqNjjgNEW6dG82S5ihwCQ8x765F+PpEYzh3frAyADNxy
	jAPj4rh4KRUgyYs+3Ctuilq8/yJ68f7Ta0T8mtKU7ttCsoVaoJ2L32LlPdkft7Xj
	dRF1+kfMQZXlaKnTuNWhA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791466836; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:G6AfpVmOd5XgHoSfllulPs5Boueyi4uBe3hkzPKCOF8rbab
	QUKUhaMUcBpD1jJ+sLTHuZ34tXp1A9ujba/sy9htnB454hqLq0dxrNojBapR0LAJ
	HUioJXtWFhBfM8A5yjoiM10nMODKG4Pws2Wvg/skSbzRqqCS4BByYHpxUWoP9cMH
	ynkYFemTLkn0q175+Y7GpVpyqx2p8jFNDF0DO8Ur1s+n9ChIJIBND6Q8m4RdKLHt
	Ol9rlsTqqaNYS49jm2/T1+Q5LDakIM8RK9pmLngjjcOrjUM1YQiyXNjWsb+d/7qJ
	J2pm9P1SwHPkzgdzJSlJ+XYO5y0dyUr9O/ChYJg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:513sm0LI48A2fWPdBFkUCv46ffVZzZ04Tk2Ooaj/OGU=:dMU5gDFDndPQntnELXRe83VyHy5u8IIrFunscx5Ux+E=;
X-ME-Sender: <xms:VJ3HajNi9wt3Caz5aTGmJiV6bmWGVedounsVd4LISLPFZuAwyXxO-A>
    <xme:VJ3HapwMxNi0oL1voMJ3HzjzQfQGYMaHt2gckE-4SMK1LnsiGC-Wv9brdfbtR1bS-
    Q4Jj05eLl34z5-09fEhijL3pV4w1gxLwgTIRdTji7uY7TKukgahfdgSvQ>
X-ME-Received: <xmr:VJ3Hatq_7h6l-7tJSEyBU0mQ_VSfQbDrbbhF3nEoMXitfQ5Im87T_ECa4WRP81nAXMW8LqQOJeDRlCHVyWU7K9YE>
X-ME-Proxy-Cause: dmFkZTFZTCG28JH6vPVxD4VNDmE6/FbS4VVkiv7Aw05P+M1+3cDh1aw6AGKNEz3EqxO1BC
    gBgcuXI9OS76UYDutGhxCf4Y37Ffxurha2DyawXxvtDS0erxPhqDRJDctI+tXzWA8Lthpq
    TPiVbscP5kr65dOTT07DZuVWT6DDKigp2BowSdPFQcfLuA2Ilv1rl9iPmciVuWMEhj0MkZ
    KwGXSkSNWKIy4eeRgoTt0QGDDHNLFwBJBTnKUS7BfzWToA1TZ2nko5TBhSQ9pjPdeSQIHG
    Wf65OBD38HLiUxT3HnWb945ux7haNZFB8OgAfQUX/niyakGWoNZgknEd0EzbpuU6UxBosN
    OxMlRaY+yuycg01KsGCwVSc9lO2QFbHfCF3kw4vTxElZcDXWuJwNrrQkttHvc15Wa4UY6t
    iA4uwKs/DzABR2yX0LmfhlYxJcQKTszlq3z8JcZ8psVUYCGuh44b/BN9zVVHmPi/nTm1cY
    Lbjx7W2pLfLyELrTj/Pji2Jne6HpYBTbvPuvdpbofBWWkawj9wygGUglm5lDQYTC+a67jh
    M1bzuv01SZqR5T/2guVDXsNcuH5h6/AWvXWmnzHkixCkktYX5chL2HC9vTbos27YSLKLGg
    Zmmuxh+QTyoNlvAMvTve1XQDGFnjnmQKNhpLju7mVgIAujlRAsYUH1lXeUtQ
X-ME-Proxy: <xmx:VJ3HahPJq8dpjUQlmxkI0rGfTzFR8waYC4ipFrHfJF8C79P0j9pxWQ>
    <xmx:VJ3HapdF2njc1Yho96V6ZYJ_WAJ0SZT05sJETEw4iqhFbqq03ZN1GQ>
    <xmx:VJ3HavUcqNNTVG6lihvXRvs70jC19oKZtki4kuEs5wK3kyQPww9gjg>
    <xmx:VJ3HaiCADRpcWhwR56dZhlqjhLxxbAB7XGxY6MU4G1d9JFxyBtl25g>
    <xmx:VJ3HavS6zxMucWb9tQydvvUaOz-MaOrjd89bf-5jdZ3bO3ELxYvwl60l>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Oct 2026 09:40:33 -0400 (EDT)
Date: Thu, 08 Oct 2026 22:40:28 +0900 (JST)
Message-Id: <20261008.224028.1620344487807334383.tomo@flapping.org>
To: a.hindborg@kernel.org, ojeda@kernel.org
Cc: tomo@flapping.org, boqun.feng@gmail.com, fujita.tomonori@gmail.com,
 frederic@kernel.org, lyude@redhat.com, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [GIT PULL] Rust timekeeping for v7.4-rc1
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87y0c8cpl0.fsf@kernel.org>
References: <87ece1eirv.fsf@kernel.org>
	<DOzJmBcnnVm3wwaMPJ41CK0g_4XXYhk_umLH7Q1T8fR4l957fWjO1gJ9OQvY055xk4UMyyrpcah5B_gQdRy5Bg==@protonmail.internalid>
	<20261007.225501.2303547436453055941.tomo@flapping.org>
	<87y0c8cpl0.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 08 Oct 2026 15:02:51 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <tomo@flapping.org> writes:
> 
>> Hi Andreas,
>>
>> On Wed, 07 Oct 2026 15:34:44 +0200
>> Andreas Hindborg <a.hindborg@kernel.org> wrote:

[...]

>>> ----------------------------------------------------------------
>>> Andreas Hindborg (1):
>>>       rust: hrtimer: document handle based design rationale
>>>
>>> FUJITA Tomonori (3):
>>>       rust: time: rename ClockSource trait to ClockId
>>>       rust: bindings: set HZ to CONFIG_HZ
>>>       rust: time: add Delta::to_jiffies_timeout() for timeout conversion
>>>
>>> Sang-Heon Jeon (1):
>>>       rust: time: warn and assert out-of-range input in fsleep() and udelay()
>>
>> Would it be possible to also include the following two patches in this
>> pull request?
>>
>>   rust: time: make Delta::ZERO generic over the time unit
>>   rust: time: add Delta::as_jiffies_unsigned()
>>
>> https://lore.kernel.org/rust-for-linux/20261002050428.2746277-2-tomo@flapping.org/
>> https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@flapping.org/
>>
>> Three patches depend on them: the workqueue and condvar patches in the
>> same series, and the serdev patch. All three change code that is
>> merged through trees other than rust-next. If the two patches are in
>> v7.4-rc1, the three patches can go through those trees in the next
>> cycle without a dependency on the timekeeping tree.
>>
>> Both patches are small and straightforward, and Gary has already given
>> his Reviewed-by.
>>
>> If it is easier, Miguel could also apply them to rust-next directly
>> with your Acked-by. That would work for me too.
> 
> I'm not taking any more changes for timekeeping this cycle. Up to Miguel
> if he wants to take them directly. Otherwise wait for next cycle. Either
> is fine with me.

Thanks, Andreas.

Miguel, could you take the two patches into rust-next directly?
