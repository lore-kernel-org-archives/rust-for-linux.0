Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CB927707
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Aug 2026 00:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786493128; cv=none; b=n+HIdfpfh5hAv3Bd32p1CNPrBLGs2YeRLLTwGuNlKZN3r90deF6nsKSp/15ED7v7FtLXwmafdSRaIWwoMBzWkANpgJ6WckrJfdn19tlgiLr8ht4NaDor91OM31G+lVmRxuIA7H4cMnWnendttZjilRtBc126N4wcLt3tW2stkg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786493128; c=relaxed/simple;
	bh=b/89NXxrJ8gU/zJxvVS9mEUSBGmOx2+djgBRL62fwPI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=mLEM+KTk+ZYkRZ5rt+z4O664s6c5/mtbpLUBz0NhRf8ggDOj7NBNxuc/RnbD34geXQAbaPiZ/sD22ayADjGxqCWyHUNil5UvZh0Elfw0Y8Y8miJZIzm3PcHCLA9ejcImK0PGERgerhRhlGpvIzT/T1uLBLXgYSht87/91i5ek4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=RNne15jE; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=W2y3ZjIq; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="RNne15jE";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="W2y3ZjIq"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailflow.phl.internal (Postfix) with ESMTP id AB0F0138001D;
	Tue, 11 Aug 2026 20:05:24 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 11 Aug 2026 20:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786493124;
	 x=1786496724; bh=vmf+7XaiSJTmeUvtU0Jku0eFUT3ubtyjMuCpQYZyuK8=; b=
	RNne15jE4EM65mA3GY0VrbSjBxZ2R8ZDavNSp8jc03asQ9PpjZZFfgrBR9opgWsC
	Q4YfVNJ5voHeLVAQDXZP3KeFMnLvoGg6P/InlTdqWQpAk8RY3a9Ew9IhZDh/suRV
	6lyQx/3YLfhyH0hYZydMV/EWmNgHwFzm3yIu2T0jUDH9Z5GldL2ZrWteJgG/DdPG
	SrZBUYEHmfB/+cnw3QHs30UyFZOSgqBjRCzRR4YW5LMe4+6iIViCU0iu5+AF5OcU
	B/Yz3B8lEcYdk88nw0gPahFYAi1HA1PwpMYfnToQTey+x/6ZFoedCSaxM4lueB4+
	3PuuQLGLqxLfN968T6r25Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786493124; x=
	1786496724; bh=vmf+7XaiSJTmeUvtU0Jku0eFUT3ubtyjMuCpQYZyuK8=; b=W
	2y3ZjIqTVsfnkh8btQlM+SCAZKaCp6hDlioPNMge3BUKIQrOtk8krSQocuWF/0u2
	XgaPclp5YFSC1gvNUkE1oJtZC6tZpfS/Yvgvx39Dcnt9jbfH86mMrTp2WeGNTMy+
	L4hmbaFIgCbIETBFlK236AFuv7ujmfWUVXh2WbLu2XqjavVPnljxtZi99QU7YEdj
	RMGmo4T5dYTTcguezU5bgvJcPgLpDivv+QPFEIdkRNJug/325cznKNv3HjGFRPAG
	e5wRlypBeZozMD11XHszmb3HRUW26c8q2/2biTnwPYDxRP/eXs83zFn/J6UN4+bN
	eEgJROscKQ9qn5vCzrN9Q==
X-ME-Sender: <xms:w7h7auXCfkgOh2uPGb4EDr1Eqh2oS9GoYE16HYJQlZx6PLeKhvN-xg>
    <xme:w7h7aq9tPczEjSJUYADz9CuDGUza1t1yGFpTLYgxndGLIzD6GK1jtlACS-K3vYLA6
    uCVxvoP9f4buo3qdYAIGYwB8RsP7GeWdNNTjowvDzZErlD-LocL07U>
X-ME-Received: <xmr:w7h7ajj7wISsxSTd5kPNtu7nEtRkjZsUw_L7_j8E3g85HsNqSPp3ZCa4btg8saV1AnkXCPkFuQqJvudTYoJgXYSD>
X-ME-Proxy-Cause: dmFkZTGv/iJSmE/B20zF529cIa3xbwsyq9mlYxQ/vLMUvAB9yHFdnT4zgiH3q+RoKSzfHk
    sTgDBF6SuzdPGyhIaJIMrsoT79MCDvthkeXeQpVzSKlBTP9asiNfZhhrHe+inwEn8PWBb5
    h4tbcThPjsIgpv7quavEFNf9gftIHN2Y5wcZJwbVN4OZXpEApwdIDndZ+AqXzXAGbM4Xw3
    8nNRPUKnk9bNiMz/Fgh8+M/PMlk+aKKoyRXm6hss9RXA9A+nxlxaebsiM5r1XKJSffBjHV
    V0G9i9rDD6v390UIVQIOdl+i+QzYQVEF0YXrsZf4dRLxYwbPPF8tbx9kNPwZoCDZIkLJK8
    g4OQ3Kr548ZZzJxbPgLbnD7sNq7E1bwWzDj2wEB/mtJcEpUE/AfW21XwndMyhGocfW32XS
    XAlKGylnwHDVAEQTPMGB5daPvTs5V8oVyl6Shpws0W6U3axONxmfEV80E1ZszCU7/R0IwK
    RJFo5LHyBHJKCCnYsgyUgL2mAW0yYx1wByEEKm1t0YjggFcaepDxQjP3hUCRwh20w6xnHx
    bOs55R0K7sH0FmsO1QHJdHxcMizZ6L8ojrOVwCP06qXVJ5soa1JePUwpSW/jw3OHO7NXMP
    7wc+i3BwP/xW4m3a+wcFRBC34kAvLxd2apN2MLm5uTxOTtaQ0T1Aq7LGB55A
X-ME-Proxy: <xmx:w7h7ahX4UK3UrM8nTWIDLnrwHPjzNicLqfsI0RGZcc3AxRJcVpTTTw>
    <xmx:w7h7anuD5w75kdwuFJPdHAlzbm23OpTZ5Pgrt5hlyTrpcITSMlAUjA>
    <xmx:w7h7ai8l0-JSfCru14C1_w3w51TJw_iAkavgccR3NG2YTq_q5XZQZg>
    <xmx:w7h7anusyJaE-UlPzx8aXZAiLqb_lBmj1SVYF8g43d65armg2_nqpw>
    <xmx:xLh7ajBdSCsBsYXwGasyjnz7GbZ-CnF6lWFpYM8Y609CDQDSSVoemgV1>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Aug 2026 20:05:19 -0400 (EDT)
Date: Wed, 12 Aug 2026 09:05:16 +0900 (JST)
Message-Id: <20260812.090516.1638662871785456326.tomo@flapping.org>
To: gary@garyguo.net, ojeda@kernel.org
Cc: tomo@flapping.org, a.hindborg@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com,
 boqun@kernel.org, dakr@kernel.org, daniel.almeida@collabora.com,
 frederic@kernel.org, jstultz@google.com, lossin@kernel.org,
 lyude@redhat.com, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 2/2] rust: time: add Delta::to_jiffies_timeout() for
 timeout conversion
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <DKM9KW3ARL1K.1JFJOBOB5EDKF@garyguo.net>
References: <20260811150147.1360102-1-tomo@flapping.org>
	<20260811150147.1360102-3-tomo@flapping.org>
	<DKM9KW3ARL1K.1JFJOBOB5EDKF@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 11 Aug 2026 17:44:24 +0100
"Gary Guo" <gary@garyguo.net> wrote:

> On Tue Aug 11, 2026 at 4:01 PM BST, FUJITA Tomonori wrote:
>> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>
>> Add Delta<Nsec>::to_jiffies_timeout() conversion. Unless the result
>> saturates, the value is rounded up, so the resulting timeout is never
>> shorter than the requested span.
>>
>> The result saturates at zero jiffies for a negative span, i.e. an
>> immediate timeout, and at the kernel's MAX_JIFFY_OFFSET "wait forever"
>> value for a span that is too large.
>>
>> Reviewed-by: Gary Guo <gary@garyguo.net>
> 
> You should drop old review tags given this has been changed non trivially.

Sorry about that.


>> +    #[inline]
>> +    pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
>> +        let msecs = self.as_millis_ceil();
>> +
>> +        // CAST: `msecs` is clamped to `0..=c_uint::MAX`, so it is non-negative and
>> +        // fits in `c_uint`.
>> +        let msecs = msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX)) as crate::ffi::c_uint;
>> +
>> +        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
>> +        let jiffies = unsafe { bindings::__msecs_to_jiffies(msecs) };
> 
> As I mentioned in previous 2 versions, I don't think __msecs_to_jiffies should
> be used for this. You're doing two rounding and saturation operations here.

Fair enough.

> If you do nsecs_to_jiffies64 and then clamp, you wouldn't run into any of these
> boundary conditions.

I think nsecs_to_jiffies64() has boundary conditions of its own that
the Rust side has to take care of:

u64 nsecs_to_jiffies64(u64 n)
{
#if (NSEC_PER_SEC % HZ) == 0
	/* Common case, HZ = 100, 128, 200, 250, 256, 500, 512, 1000 etc. */
	return div_u64(n, NSEC_PER_SEC / HZ);
#elif (HZ % 512) == 0
	/* overflow after 292 years if HZ = 1024 */
	return div_u64(n * HZ / 512, NSEC_PER_SEC / 512);
#else
	/*
	 * Generic case - optimized for cases where HZ is a multiple of 3.
	 * overflow after 64.99 years, exact for HZ = 60, 72, 90, 120 etc.
	 */
	return div_u64(n * 9, (9ull * NSEC_PER_SEC + HZ / 2) / HZ);
#endif
}

In the generic case (e.g. CONFIG_HZ_300), n * 9 can overflow and
return a small value so the Rust side has to clamp the Delta before
the call.

The boundaries move rather than go away.

I agree the double rounding should go, but doing the ceiling on the
Rust side will need a few rounds of review.

Miguel, you suggested landing the minimum set, e.g. the first 2 or
first 4 patches. Patches 1-3 are already in, so that leaves patch
4. Would you like to take this version, which clamps the result and
has a KUnit test that fails on arm with HZ=1000 without the clamp,
or should I hold it for early next cycle? Either is fine with me.

