Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C164207DFA
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Mar 2025 11:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175225; cv=none; b=B+99OsfG3Q1fGOptpK4X9Om2gCo3QklQn9lzhH6OFWzNW2K70dKy0TWoR2k6CK1ASTI4AWJgGc0OiFg8816AmfxK49264GZK9d7VY4GdyC74pduflfDZGY4eFiH6hYcGvPCMZSyFRaUR9b6SR5HdMQOG9qz96pBrYwB036p02co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175225; c=relaxed/simple;
	bh=Cas4miGuWF4X8Ueh2mbf616IC1RvlTWV01oJSrhCH5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a7onmrlUxs94jho1LJAdymYMsZzRQ+0VwLvBK4i4xXer0Vt5eQoVB8+ruUPMqUG1MqsUUfjWmNtufw4xCG4kgGfqKDSwD+07sALPjkha6awS2rXD6McSdSyBND5VKr1gxZ74GepCu7zmN2AHf+t2jnV4iUyLfXwKSqM0JjlQKgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X3D8gQuH; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X3D8gQuH"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22349dc31bcso117757375ad.3
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Mar 2025 03:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741175223; x=1741780023; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pfu3+TZx6+D0Zyy6rK5mXbmSh6WzrBwSPP3UW1ZgMZU=;
        b=X3D8gQuHJmLr9c6WRRxjiCr4vy/8Sp0fhPQPXtoVpSFbrupVO+pBd9KdtWAtAyeruU
         1AHX8L+ugZ2RwcyI72vbKxOu201g0OzW+KfmEixYE2T50HB8ha6nRj6cQPDHxkyoHAC0
         77jxOcceL6cS2oZiwHMJjzevf0miI9BhuCrzDL3iRpui/md+nE7VOkoRAt9aCjQXSPVp
         EV3AXi626amAmQ7xY6Sg9ubzICJKeCPiMcdqmuZ2HJ0zBDlQ+mrhNycOe3X9eXXhumOo
         JWVubh72+Iw+doy3b//E9nfNby0LePSp39yfIp9J1PyG1766CUEmCNNGStYcXm+4V52x
         tg7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741175223; x=1741780023;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfu3+TZx6+D0Zyy6rK5mXbmSh6WzrBwSPP3UW1ZgMZU=;
        b=H1rjnrZBarA5so6+r/ExyooRu6zSTWnW0P8PfPbGQS0V8R7j4AF0G+jeq5WBgvqjBU
         pjURYe2NYCi407IaWARZ5tlh/zRJCzhNTySZjbvdvpMZvfF8kmPyU6m1vUKEUnBqorYl
         ejfLv9Sg4uiQVZPca3pCPA0fGci9twOBm/U1pzPPWAmRTPFuD0M1m5Hmm5SyhMiYw4Hk
         8DU/ZE4D2dOQNxrtvFJEjIcCN1TFvUhK4IEYf9OG0wBRlTnoecSx39kv6MtrcG1OX0Tb
         qxjKRBZWgvH62AHmLltnAUmcKElXqT/OAFI0KyLDm5SsSZWZzg5uAZKJwjRYeF7uqHDZ
         xQVw==
X-Forwarded-Encrypted: i=1; AJvYcCUmtJCL2FyRADdnaakcFC7GKmP5OSBczJaG5X7SWbw89OMARJeJQCpQyVneS44GzmMw0C6LsIedL+X9ZSIEtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyzZWBTrZZOEnUaYdy2fltkKJOJKLrn0b9PjLD1GYDrgmcgfHsU
	kJKBnQBpWH9YDuceMLVCV0XnWDxsL5iHR8C0ZLWYl1HJ3/Ln1M5S1My2efqe/z0=
X-Gm-Gg: ASbGncth380fxOiowIHXC/1CmaMbF3ctExBZMhoJL/waL9W+94rY6orOC7PuMdyC9uh
	eVlG/Qh29/wy8Ea1YOXS0U2TSre5cZXUS75E364lzFaE6o6H3/PUy6z+HrFCDrgZWuBEcVhn9Et
	iHcX4nqmMjG/MRd+Md99XMMAIEvSIoz2SsIdGYrTIkn1lhrVh3+Bn07vhk+45j+GUBVs0Llr7JK
	wDXyhVU7pLNSyijz/tx2Og0B+GlHRoS4Mq9xDlDyWjFOgR+9Mx18ry/K+yl+jMYPpXoe4vQdcYe
	Ji2+ExDjyOILgdXn2aT6x25bark8I8nbFDeqgZSfZJAQKw==
X-Google-Smtp-Source: AGHT+IHS3XolbnTHiz90ZHqMPzwfVi03ruXNsyC83Cm7ljJr1IitVbI67JnaTA9B26A8OYNT3b6gWw==
X-Received: by 2002:a05:6a00:3d4c:b0:736:3ed1:e842 with SMTP id d2e1a72fcca58-73682cc4160mr4386797b3a.20.1741175222794;
        Wed, 05 Mar 2025 03:47:02 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734d444a9fasm10805158b3a.60.2025.03.05.03.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:47:01 -0800 (PST)
Date: Wed, 5 Mar 2025 17:16:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: Re: [PATCH V3 2/2] rust: Add initial clk abstractions
Message-ID: <20250305114659.k5pptszvmusblynm@vireshk-i7>
References: <cover.1740995194.git.viresh.kumar@linaro.org>
 <023e3061cc164087b9079a9f6cb7e9fbf286794e.1740995194.git.viresh.kumar@linaro.org>
 <CANiq72kdWzFOZ39EoFNxEAbk4KYgzLi1OAEc1zn8BM07VpXy3g@mail.gmail.com>
 <20250304085351.inrvjgixvxla4yn3@vireshk-i7>
 <CANiq72=sU1sHvamC5REFPEC1aOVdZw9EKdxOgkUYESTR2yh3iQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=sU1sHvamC5REFPEC1aOVdZw9EKdxOgkUYESTR2yh3iQ@mail.gmail.com>

On 04-03-25, 10:37, Miguel Ojeda wrote:
> On Tue, Mar 4, 2025 at 9:53 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > +///     clk.disable_unprepare();
> 
> Looking at the example, a question that one may have is: should we
> have something like a scope guard or a closure-passing API for this,
> or does it not make sense in general?

Something like this (untested) ?

+/// Runs a cleanup function/closure when dropped.
+///
+/// The [`ClkGuard::dismiss`] function prevents the cleanup function from running.
+///
+pub type ClkGuard<'a> = ScopeGuard<&'a Clk, fn(&Clk)>;
+
 /// A reference-counted clock.
 ///
 /// This represents the Rust abstraction for the C [`struct clk`].
@@ -139,10 +146,12 @@ pub fn as_raw(&self) -> *mut bindings::clk {
     ///
     /// [`clk_enable`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_enable
     #[inline]
-    pub fn enable(&self) -> Result {
+    pub fn enable(&self) -> Result<ClkGuard<'_>> {
         // SAFETY: By the type invariants, it is safe to call clk APIs of the C code for a clock
         // pointer earlier returned by [`clk_get`].
-        to_result(unsafe { bindings::clk_enable(self.as_raw()) })
+        to_result(unsafe { bindings::clk_enable(self.as_raw()) })?;
+
+        Ok(ClkGuard::new_with_data(self, Clk::disable))
     }
 
     /// Disable the clock.
@@ -163,10 +172,12 @@ pub fn disable(&self) {
     ///
     /// [`clk_prepare`]: https://docs.kernel.org/core-api/kernel-api.html#c.clk_prepare
     #[inline]
-    pub fn prepare(&self) -> Result {
+    pub fn prepare(&self) -> Result<ClkGuard<'_>> {
         // SAFETY: By the type invariants, it is safe to call clk APIs of the C code for a clock
         // pointer earlier returned by [`clk_get`].
-        to_result(unsafe { bindings::clk_prepare(self.as_raw()) })
+        to_result(unsafe { bindings::clk_prepare(self.as_raw()) })?;
+
+        Ok(ClkGuard::new_with_data(self, Clk::unprepare))
     }
 
     /// Unprepare the clock.
@@ -185,10 +196,12 @@ pub fn unprepare(&self) {
     ///
     /// Equivalent to calling [`Clk::prepare`] followed by [`Clk::enable`].
     #[inline]
-    pub fn prepare_enable(&self) -> Result {
+    pub fn prepare_enable(&self) -> Result<ClkGuard<'_>> {
         // SAFETY: By the type invariants, it is safe to call clk APIs of the C code for a clock
         // pointer earlier returned by [`clk_get`].
-        to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })
+        to_result(unsafe { bindings::clk_prepare_enable(self.as_raw()) })?;
+
+        Ok(ClkGuard::new_with_data(self, Clk::disable_unprepare))
     }
 
> > +///     let expected_rate = Hertz::new(1_000_000_000);
> 
> On top of that, would any other kind of operation make sense? For
> instance, `.inverse()` to/from time or things like that -- we don't
> need to do any of this now, of course, but it may be worth taking a
> minute to investigate how we could improve the type now that we have
> it.

I am not sure if we should be implementing them right away, I agree
about from_hz/khz/mhz/ghz though. Let some users come for that and
then we can consider it ?

-- 
viresh
