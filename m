Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793335730;
	b=ckAOzEZ8T87ZaN9nr6qnnbMPJS98vnqHxCRvSISLW/M5moFTVylZXegfz9a2mev+XxY+
	 hklDv4xvxFMmMAPuKYk5GHF7H2K0c0MUnASfJ9LervDlzHvegn8xNYCUVTpzRgoVayDml
	 djmqH/yk5zvGDrbxJpTRHv4W9OwNFAV+iP7SfR/I6KpymNksweMz48qds31PsnCGk/Qk2
	 X0hmZUAPMcpvAKAJFbI6o6v+F+n1l7yySncsEl3xjw7G66vASKA1mNjWZqpQXDgt4Pu2z
	 P8Bq91C7vN4GbAgEgB9y7B2A73f2Vux7TQN1uNZLrmV8DOROqR/47uB/VoBD8sJF6Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793335730;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oU2naT987G9eSXMTPmu3BcMlK+P7I/IwaHdJlghvweI=;
	b=GpBnPyWpUNyKgvEnfCmcPM9RJXK4mfgxN+IQnvLuj3GidLiu8aTgO7i4HLByUw8vdZkM
	 yjwVkiS8qBu1XLxMw4RHqbOVFmvr7ws9obKFuAAhhOqmU0G9Z7Po3mEtSWGYugfVRGcC9
	 mbzA0t74lxOSBUG71xEbg6/Tg2hudW+U+icUu6PwMiGWlShNou/Du/aueCrxx5F/Dyfjg
	 yVEg9t7BMsfBpeVhBrzU6f7wg3jfHd3udhhl5wFdv+GieURxP3IJjlLvyzuuiADXleVsp
	 kwQmBJW82BMTLXlfSlO0P7o9YtjWohj6ijIb+EKuY07eFEcvQvneEw04uJsF3lfg7Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=BfzwIqyl;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yYPoNVKW;
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB09F606A31A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 04:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB09F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=BfzwIqyl;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=yYPoNVKW
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id DB090140017C
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Oct 2026 00:48:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Fri, 30 Oct 2026 00:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1793335728; x=1793422128; bh=oU2naT987G9eSXMTPmu3B
	cMlK+P7I/IwaHdJlghvweI=; b=BfzwIqylRxo6e4f4e/8nWAIudshTUtj8MGm/I
	6S+MNIKeP2zKwiEA3zJtksY8Re0IfNbIXnclwbXDLxH4KXSeBJayhFJXAAhqqKew
	OEUf1/zKsyLPXi2WaMkE8y8tRreWLUEuRD+7EBh4CsnhdQ0S8nC46Q/Ij/2NFjCW
	cZillD+TP0sCPhHuT5B7Qsg+W/CS5XGlSXgwT6As3MvkEvQ07JBM1HoQ9TpVRSUu
	8qAObmJSB3APCf/Xi7jied3axrV6wQ3gP8kjNwXrdxFNB5t5G6sO/xV3QQPRHutH
	5hhUmt3hIqOWO/WwaXhckFyNnTKPCZj0yvxpoCHeL6R0++0aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793335728; x=1793422128; bh=oU2naT987G9eSXMTPmu3BcMlK+P7I/IwaHd
	JlghvweI=; b=yYPoNVKWEJ0LhRMSxbLCgkBRPGeFI24IDavb01gPKdI2vkrDYQ0
	Zk/PjPhRT7HQw+RPnVM76GjPJ1DLVvCaMDksEu4WenoA4hxtqa2A3rwxdSm4KTIU
	f3VcR8ar3/icsImIvU624EPT2mRc7r+KY2l4Vk3db1EIRUDYbe6P8mwUH22hlBM8
	23izYwVxno3zdg57zt7USZ0ldjVlsYveD8XE42mKMVZhG0srCjdubt01DOZUgRwS
	o2lMqEe9k00SO+ax6pZQic45mbNL3l4e9cKa2l0Q3tWFuTxiwBkbQd+JtxNL40cO
	0m6FQUfGUh4zlrr5BomDgt/xk/uZ6uLnphQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793335728; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:auKLJJtKoV6hR/I1ey9pFlnvSpSDYzyFXm8kHV/K/vCePLX
	7N2MR8l+6EE7hqKWQhLdvDRBTpLztUiK5yE1Hs9uJZAJDKjmwgNLc2ZilcW9/mpl
	B/YKLcDHfq/GpD6fgLpFcXwnqT4XkEUmXzm9XGON1pLq+ynkxJR0DSesuksj6L+f
	Mns57LtVT2ArlMezs+b3mPuMWSp6v7r5jZzjZSq2R6uuqUFihcOXk66wBeknrzsM
	VMGM5TWzjhe7fuHDArsQ/rB9br3Vo39NWBd0WAyKwkHFhMq2z61Micmq3E9ZSk77
	3DeutqB2iRNvnBO5TUn7tjbcS7qINgfVTs3Wbiw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:S+aH7l8rClAwcJIwrbLgLUFZHQ7upKe1k6RUHQB7gJM=:PtcBQX/Jyri5sDr/h+fJOxI/9BFb+QDEldqeL41AXno=;
X-ME-Sender: <xms:sCHkanGjWZP8MdsZ4pqWjmBCUSoUK6aQURpWyazVO3ILn3_i7IRtHw>
    <xme:sCHkagNsMcxjoyoiKD7jvoiJIpKUueE12tmJLWWGCGxx6M4yvXOyeK3SGdSGGuBka
    EeB0hc7Qv9lq5kw7ohePHEt6bJddwxn_CP__grFELRsBSR-evjItgk>
X-ME-Received: <xmr:sCHkakqW7Y2Uhkt9sOu0bsFoS8TsDRFejuxpyYJosyFCTGcvFA7Hy7R2utyvRBF_hyoP7UCygTFB6meIy6I>
X-ME-Proxy-Cause: dmFkZTFHzF+ke0RzyB6IWWznHZdvKAiT36/JM8TFfmosA607y0bVQgrIIsRGHHzeC7+1cm
    GKQN6v7almZGLUOMTK8P3kfae50/xNELHObfZkyEOoMojrWbpeSoqmiTgUoW64F/5sTMyK
    N2Q9xaOGnC5XbpMz4UyKLuZG0VT+xmz0RrnphJbG7Q6W0I+7gOJ+jxqSn3gdFUTgDOcSer
    9dMjomfFJWJxuAfg6tDoKZzm4iygMo6QrlcOV+i4DokNLD4Fue0XqjnfVJ9rqVuFnF072N
    n7egqhPeYbeKJ7HlzLmS+qGZvywr6kgkkWt1qaCQuB1aceW6UgHh+sEXaWsuSzJnByauSS
    OHBGduEQtTHpLo5GLR3YWNAd+VZGnZyYJhaGA0xQnARktVYXV8Jy/ZbbsImisstjy6qexm
    6moLMsMd3rp4nwMsT4yWMgtQlXqlmF0v+uFQmJEo8nzyAxoqxKZWtRaACe4GO7mQbKfQDz
    W0fWPpCBcJOcUZ9LPQbcu8TGa2JH29K2NKsCA76MruuVpyOIclQtiv4PGD18XAOb6XII5i
    VeRDZgQNkhDgGlNCitt9xZeEu3jS7J2eViKM331zleo+JqgTT1hmh2vdHIex9CmwEiSc0z
    Fnh4w/rz8XWrlulClAh0J+TqywjWdjqH+nBAoDHSQoQllb/vxKBYH0dHMvXg
X-ME-Proxy: <xmx:sCHkapBj2u4AKE3kpAgA2TUEqb1qWL8Hkij0xTlF9hOVc9uhss6XHQ>
    <xmx:sCHkalN9mwytHjXF97Rdqn2duLgpcjC8tOgGc-eOlWk8aRh9w0iapw>
    <xmx:sCHkavCErFOyX0YXRGaHLTE5V_0J3ER2f_rKM3CtanPujeXq79qx0Q>
    <xmx:sCHkar9b7lYSq7wB64Ww9EUHX5mMwzefwdi8BM82-i5Q5_rssSAvLw>
    <xmx:sCHkanxFHI5056qdgwzFUoGwRP-kIHtVpvwZJRLGTalTqQQ1vCaCPXLL>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 00:48:43 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] rust: time: remove leftover "clock source" wording from doc comments
Date: Fri, 30 Oct 2026 13:48:03 +0900
Message-ID: <20261030044803.3863267-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Commit 6a8e2c63f2fe ("rust: time: rename ClockSource trait to ClockId")
renamed the trait because it represents a `clockid_t`, not the C
`struct clocksource`. Two doc comments still say "clock source".

Replace them with "clock". This matches the `ClockId` doc ("Get the
current time from the clock") and the C hrtimer_setup() kerneldoc
("@clock_id: the clock to be used").

No functional change.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs         | 2 +-
 rust/kernel/time/hrtimer.rs | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index b6a2aab12a50..09b682ac4755 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -198,7 +198,7 @@ fn clone(&self) -> Self {
 impl<C: ClockId> Copy for Instant<C> {}
 
 impl<C: ClockId> Instant<C> {
-    /// Get the current time from the clock source.
+    /// Get the current time from the clock `C`.
     #[inline]
     pub fn now() -> Self {
         // INVARIANT: The `ClockId::ktime_get()` function returns a value in the range
diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
index c0180b8ca5d3..24e508d8f11d 100644
--- a/rust/kernel/time/hrtimer.rs
+++ b/rust/kernel/time/hrtimer.rs
@@ -904,7 +904,7 @@ pub trait HrTimerMode: private::Sealed {
     /// The C representation of hrtimer mode.
     const C_MODE: bindings::hrtimer_mode;
 
-    /// Type representing the clock source.
+    /// The clock to be used by the timer.
     type Clock: ClockId;
 
     /// Type representing the expiration specification (absolute or relative time).

base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
-- 
2.43.0

