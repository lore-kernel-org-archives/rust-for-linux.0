Received: from flow-b4-smtp.messagingengine.com (flow-b4-smtp.messagingengine.com [202.12.124.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEC44746AB
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 13:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786109186; cv=none; b=qo1bNVDhgdQsGVBojC6wD4dQB9/lwyas7LKhCW8bRmyHp2s76z0e22ZOSj7kursNXmBVJbWApC2bWD1nZ3AboIaMA/YOCcIfW+jE0eHq15+2RcBEM0DMqY0pNNrKUiv/b7B5smuLncRUFMaQqNTPrFnc0KN//qgaBcCazNsHzUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786109186; c=relaxed/simple;
	bh=eM1MjpGNaMVxm9L+yU9sqivbcXnN6rdLFIAQsiVLZ2Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bLLuG8TZGGRjcrU8kltBNVD1ggK/Q/kNz8PSQ8SGePLeNXCPfaG0zrvniDQ/LwsH/igt4O6xBgyEA2GRgG4RkTRH6pK493D4aLnidnUUNSF5fk3Hrzwfe5HB2jiFynvTPSBmUFEliUtX3ccKy2I6B9ZwpNfyfI+UFWIfQS0L6jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=cS/4umtp; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=UVRsLICI; arc=none smtp.client-ip=202.12.124.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="cS/4umtp";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="UVRsLICI"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 9C09C1300230;
	Fri,  7 Aug 2026 09:26:20 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 07 Aug 2026 09:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1786109180;
	 x=1786112780; bh=Aj6hxqz+gs0YcAIFtAPhS9KntuMurWSNAH+dEqp7s78=; b=
	cS/4umtpj1iVE4MCvjdKEUeLOwVAHI+E5TAXxOK0CUJ6wqkT+36O9sPUetXFmYtR
	ug6gV2qjmxRL3GjHYMHnfNC0IjNiLjdztj5s7H+ZrXckH/QR97dv+xIqrS+2EKSZ
	grhRK8YlRft/nOzn134zrUzi/QxWzZq4uFM/Tw2Qfl8to+wdRpFUh+xYNU70D4vU
	4Vpod146sizy+E2s0GHdwnZgzPJ8Tl9yASMpHqgV+D8/z4Dw+3KiPMwaNYGAw51x
	m2TWIP+TuoViQnKIKNTx/VvaC3hEhs0AoCeOBWSwuNfBICfNIZjFeZgYwB+6uWNV
	W3/hafFIOXdNA2zbgzs3dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786109180; x=
	1786112780; bh=Aj6hxqz+gs0YcAIFtAPhS9KntuMurWSNAH+dEqp7s78=; b=U
	VRsLICIG3hICT+yHbsKBwq4idivdRa/5LzRcUZJbQMpjgD8vifcBwKDq8VyZV1N6
	FwrcSnPLJuotHoHngIMt0pden/rhKhenpd8FVwjoX4YQ9+b0cc4+b8qoTWc6euPV
	aorCb6ihbmuPIOFEf4v1hKaAZHq03Uigw0t+eNyM27yh4qQWq8GUkzM1XRUHXPth
	ACUMYJze8huA2cge1adPA4+ewfwEnhH1R+0t10bBgF72PaPXqr+y4Fdm1PHi9VVz
	+wMyfwVKXN0d8Y+BbIAoiywGzvgAcfVSbgZM6wN1Pnm2XbcYk49IiQnm5x2wGIeS
	p2ZxzrM2Nxt0MpeCf921w==
X-ME-Sender: <xms:_Nx1amIxgk0AxP1Dr4SKeVVRh3Zuxnjnjbs_1Nw5wd0yn7OwXFQoyg>
    <xme:_Nx1auCRB5w4XwUldbEvi25isx_rzY5BCNV90LQy1wCLVfQu4hhyjpY_jT61OahuK
    LEolENXfIqT_1UZ66STVyGi04C51X0aGwR-yoIdT7IFxjJu2CsG8xxS>
X-ME-Received: <xmr:_Nx1akBjoE12kJw0UuUS5gbFSdxzaj08dlOOQXdCVH0WHZijwDjmhRaNzMLbgVEOC-9f-h0lpfxTiL-C_Itx9_wT>
X-ME-Proxy-Cause: dmFkZTG2L27feP+gYMMyKo7SfzhaT+pReH2zaM5AvWK0KP7lisBAkMg4JUMv7MSHi2Awpt
    127MRT22FSFefOw3qAaJ/V013Us5hx5cJPQe0BLC7d3lN2efemWR3q5aAu97T5oNQCKlGM
    Fs0GPqW7j54SgsDbWdae3whUIbXlxDuGoTbH+9YFWAcKZ26kdfmapvUASI2hmUEdrkwWZT
    j4lGzFDgbc9EidjBXUBXO/nZ8UcQuNBZXr0Cmtd6WMWuoMLFes5+KnY684g2Djy1499QV0
    wwO02hz1Gvn4SaGy8oFypQKdD42EXFCKS+T1ha+PYLxscuMbmXUwvToviJfH4Iw+w5WIiT
    XIk+42HzdUIYL57k6RqGiArcrywFXXiTtlvUoz9ZlEnaxzO3rRf9+U7LsCnestGFcOBnvM
    A8y1i29brlIhdxKmz6x+CVoVyy5iWO/Mfyl5lpI8Rz2wuQg8iHUtj+9EGx5Vjc0YgzbSJT
    KIutvatCaXUU61sVwRxGzVn7xJyu8pe8JtfH10eErWoxkltkNiBOPwImlyjW5cvn5TcvS3
    WoPMl3biP9GFyfHISODApk239Nic/pfoqVBf3SHIIwI6qdueuQkn+lSiR7NjX9/AhvINjl
    Ai/KBnL6h/cbtAGmf5xhcbDSiffyUKVJsRSXH4/3JT7TXOBx8p0aJccbQpag
X-ME-Proxy: <xmx:_Nx1anl5Jg0kRUbVzef74IIMvm8n0QeEoXj_7Bk4KlRDQTXTao4bgg>
    <xmx:_Nx1aqhDmEoQPLCqIeDZmNLyfDqHWPHjUttoGVhFCvS3an8vdRuCuw>
    <xmx:_Nx1aocEWPHYCoDHAcmcuROsls7abv08lL7Yy3TxSM8ymMRPnAEg4Q>
    <xmx:_Nx1aiDzTzO50J5PAYgq5jcgPzSQksYvcDUHKv9FyHlDO77SDQ2qdw>
    <xmx:_Nx1ahvQam_rA8ApH7BdJdho0z7w2lWcH_sHcD1D2YwTorny3WLTVsG9>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Aug 2026 09:26:14 -0400 (EDT)
Date: Fri, 07 Aug 2026 22:26:12 +0900 (JST)
Message-Id: <20260807.222612.1239599831975361573.tomo@flapping.org>
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
Subject: Re: [PATCH v5 3/7] rust: time: add Delta::as_millis_ceil()
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <874ih74m2q.fsf@t14s.mail-host-address-is-not-set>
References: <20260806073241.1024319-1-tomo@flapping.org>
	<20260806073241.1024319-4-tomo@flapping.org>
	<874ih74m2q.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 06 Aug 2026 11:47:41 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> FUJITA Tomonori <tomo@flapping.org> writes:
> 
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Add a ceiling variant, mirroring the existing as_micros_ceil() since
>> the existing as_millis() truncates towards zero.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Did you want to extract the common code between this one and the fix you
> posed:
> 
> https://lore.kernel.org/r/20260723120907.209643-1-tomo@flapping.org

Yes, the two are identical apart from the divisor and the C helper.

I plan to extract the common part in a follow-up patch.
