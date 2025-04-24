Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DFD1AED5C
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 10:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745491883; cv=none; b=a13j0tFzM3CuRkoltyJ49vVv+WRd02I2oV5EJfO3vP8GL64P7brU8KUZ7vxRGoId7sRZKhaUxWzJVlUrQpy+DcDpwdZ+Orquf/es7THl7NV+ylIli9pQc64ppRHD6RTpRxkT/91alUIB8sBrmhm8rc2afKF8LNdUkicE8zoGUF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745491883; c=relaxed/simple;
	bh=HG1//szgx01meAsMA7HuncrbLx0xZUsBwK+q9eqz9Kk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTjsvEt8ZnL5HteQ4dUvAiXJXLIGTZLG/jZlS0S6whai/lyP1656A1OY96wf5y3qtzGTqONlemGVyRqbnwcL9NXkKKOiQYmDVIVbvcxLlDIXQfQoqSBx1Fhk6fOfOj7sDe1k5Lczgfsd5PZ8r7I6Qx4m+Hpaz5OLcy+eQRVBuQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VA0IZCrR; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VA0IZCrR"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-301cda78d48so989479a91.0
        for <rust-for-linux@vger.kernel.org>; Thu, 24 Apr 2025 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745491879; x=1746096679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x+abMdG/o8rmNfu60caQnUkqfKekYjtbcUEXVb0J6LQ=;
        b=VA0IZCrR/U13goc3N4DYtYt9lhoLnrtAxrFd/0ozd1/Li7IJllqpTJ2csq1J6E0xh/
         AdWWcA89hgX/tFczx/Uk/A/hkvT0GXCjWBgu2r6L2EHXZZn+Su4ww8Px2aFxghVEvksm
         uEF4Gw2tavhcDeWM5PVghquDCgllP2IZFuhKt0cIRpBWm/9fDcf7fdRES5BU6DUnPGSr
         a4R7AcyLASPq4FtlsjArIlODSLviHBCH9LpQKCpBkZme7JeHZbdpfnGFNMEtabo/9Kl4
         3Y+piNhTk5t8a8LRN3QDJF4gAy5jTyXhLto+htGrjtRan/rbBZPoqZ8UcXiefJEBKeq2
         sk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491879; x=1746096679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+abMdG/o8rmNfu60caQnUkqfKekYjtbcUEXVb0J6LQ=;
        b=cSsoSJotB9V8JhHVeyK6TdfRAXjV93DJfsJiuFHIP2M2+jGGYCfX4MXGtDZvQSM36O
         ZB8LbPGUJWNXkdxGdrnPCOaNv9TWSi8GoLqD65UwabyMPppeTszpUFHDVATcodWqzeqA
         ecxS/SntctT+zEEB9syAhWZSVshbFeZF4Qom3U7nHVKLrf1dhM69cEYBoz3mF2FP+FTn
         jNhH+Qv7CroDl8wWaWZSCS/rES8Ycl35ALxo7oyAiQrPjoJQqQ+hdstJ3kUk84z9VA11
         JQAIcl3Y6M8g9zTA934MZoxGJO+Ww4s9qAfqgX2h9dzPtFA/MifapZJkeuMAIKDjFGl+
         FBzA==
X-Forwarded-Encrypted: i=1; AJvYcCVl/dBvqqyV/peBJWPWCN/vTFde35kzen/G4NlQ98GJXMZSCeSbUWYB+uRuBSzCc4BgXqq3tzTeSg3oxbUm4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFadHIKtlrpbk2QS7Ei6gXUsjbbdD5i1QVTY4jfjfh1jwKRLDt
	gB5ug9UeENTOt+tkd1HivQc6BnInlWuj6koWUymERYQg+Sq92WgbNSkCitO+wXM=
X-Gm-Gg: ASbGncsYWymB9+2CrRrZO2UjuZpZAaPrWN93398jmFOsGtlyy9EwwJ8nBNcrJCzTkaF
	V3k0qcC4SzCP6DvbOTKghSXONOv4QyIKl4Fm9n3ycHJ824DY6k6NVEXTzrcqBPa5wgMYP5OeOhO
	3mQgA7FfOJrW7ZGuTvMLzs2uKV05rtwequiQnaHzc1BbWXM1R1pUpSLUbGPMje4wur8HgFA+ipK
	a30jW4+z2l1Oz53yJeY5tDEC12Yo1KVd4Hj90lYHCwKblOyKo/o3WtKJOtSr3003mbKSIp3eyAG
	PvoUmz9yWgQApIcPMKSJzRreql1+WcK9KrT1OFLEIQ==
X-Google-Smtp-Source: AGHT+IGpKJwHUe6vHUfwkD5s7/iL/IigxAr6meNd1hlH8G0Vgd+Zb7hGpE427/lVCrNIM2lV9yojAA==
X-Received: by 2002:a17:90b:5487:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-309ed26b9ddmr3148717a91.3.1745491878988;
        Thu, 24 Apr 2025 03:51:18 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03b27asm1124213a91.6.2025.04.24.03.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:51:18 -0700 (PDT)
Date: Thu, 24 Apr 2025 16:21:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V11 13/15] rust: cpufreq: Extend abstractions for driver
 registration
Message-ID: <20250424105116.m6vnewh7b2tlmxy6@vireshk-i7>
References: <cover.1745218975.git.viresh.kumar@linaro.org>
 <a14f6927488b5c7d15930c37a3069f46a5c888a2.1745218976.git.viresh.kumar@linaro.org>
 <6fc3e178-60f9-4b0f-9c56-6d983e4d1eed@kernel.org>
 <20250424062910.6zk7amxq4gjxtw66@vireshk-i7>
 <c332c760-fa48-4159-a3af-e33bedc0e4ef@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c332c760-fa48-4159-a3af-e33bedc0e4ef@kernel.org>

On 24-04-25, 10:03, Danilo Krummrich wrote:
> Yes, driver-core-next won't be rebased.

Thanks. Here is the diff after rebase:

diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index 8628f0bada02..55a219148eed 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -11,7 +11,7 @@
 use crate::{
     clk::{Clk, Hertz},
     cpumask,
-    device::Device,
+    device::{Bound, Device},
     devres::Devres,
     error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_char, c_ulong},
@@ -835,7 +835,7 @@ fn register_em(_policy: &mut Policy) {
 /// use kernel::{
 ///     cpu, cpufreq,
 ///     c_str,
-///     device::Device,
+///     device::{Bound, Device},
 ///     macros::vtable,
 ///     sync::Arc,
 /// };
@@ -879,7 +879,7 @@ fn register_em(_policy: &mut Policy) {
 ///     }
 /// }
 ///
-/// fn foo_probe(dev: &Device) {
+/// fn foo_probe(dev: &Device<Bound>) {
 ///     cpufreq::Registration::<FooDriver>::new_foreign_owned(dev).unwrap();
 /// }
 /// ```
@@ -1031,7 +1031,7 @@ pub fn new() -> Result<Self> {
     ///
     /// Instead the [`Registration`] is owned by [`Devres`] and will be revoked / dropped, once the
     /// device is detached.
-    pub fn new_foreign_owned(dev: &Device) -> Result<()> {
+    pub fn new_foreign_owned(dev: &Device<Bound>) -> Result<()> {
         Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)
     }
 }

-- 
viresh
