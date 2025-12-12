Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF7F1990C7
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Dec 2025 02:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505253; cv=none; b=Fe0Vvdomr6g0gKfpXuMAYOMXZla3vNuQMNHPySLYD8zYFcjc/du0JTWXxvjkgx3rMwD/dxylOA+SB3/oJ5Lm/kT6mkkewjzIxjGydh2ulmdMdOfrbuDx29eJjp8V/1NYCvEdX7Z5qDm3z/YQVabliOdI98GVwUYG/9N17GhaR5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505253; c=relaxed/simple;
	bh=OKgICG0NzHvK/Mr0iZAZckP1OzI7gTJ3x/RhQi5vaZ8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bexQrjsZFCHYtO2EaelWhChddiJH27Tm2yCQEAKutZN9ORBNCLjqwss2sHg3Yzqn6L/X8WHdd9QTalth31J7KlC9yZn83GntqC8JHeaQfNJ/gJDyMhzUay6uOxBfIiGBsnqbKlVyo7Vexcm545pBizn4RiJVyyYE5cGiMoFBt50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iquFhGiZ; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iquFhGiZ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-297ef378069so6791035ad.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 18:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765505251; x=1766110051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOA/UkMm1d/5Oj9XkXOk6yS2Pl1roA9E7bITIRe1vwI=;
        b=iquFhGiZD+pPvqLIdUIpPHa425Drr2yPhUt7sWIlQvwFjEDL1g3JEjoTyXLOrp6NvR
         LdKe3+X3sDGDQPRYXGbNui2/QDI4Ae4cKFhjBJ7RWyONO9AuVRAmxNjJ++kKGhcER0Ls
         BYCgqlgfjS4qwmouWAEJhU5CLiolM1N6FyZ9s3vA89B7UCp4e3XZDv8Id8V9APMK1Gw6
         uMktYBFXpyWnWzGU7u3VJJPov847hQUJrELTFTKgtRMXwLszGn7lmsbfz22dEV3JjQk9
         pJxrU1SaQt2+jhGZq4QRi9kHyUOPcS2D1Wa9KotwmqXY6C9xZUYLdnEcGWsd0l0HG7WY
         9gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765505251; x=1766110051;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NOA/UkMm1d/5Oj9XkXOk6yS2Pl1roA9E7bITIRe1vwI=;
        b=OlpY41JfB+ywkene1/AQbYJqyejkJSUv91GHsv+7GPuJI2Vqc/pzuj2If4lWyvB87J
         eUZs2ecavDTlUAZtFT88Duad1wC24oYxWpwtSUCggPFIwigOH32tthtggmPZcbnO8JOD
         Ie0vcI9QQVZOoMVZWIIYOyUy5D8jPCBAemQ5r/u1vw26eVi15faCVsbHQlQ4KcGwUigO
         evcayCJTjnDzl06vwOTZi8RKXhs97y3qZaqiYylk42ffiXIbAjLUPxzCX/96dHaNlo5+
         raGQ0jBOEy5LSsO6bBccmk+iimOVFyU7cpR9akm1/6GXUD7y8QLdmMmvW/9IdWV4BQA2
         0n4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZtXHGeH1Xx83HzMzdgMh6X9Ur0YC7Nk8WkTqGtcSARYhHdbjIeSgjD1bUNC88XHcb5hZfJMFkxk7KI7naDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyegqDQs6a0qp+4Utk+95nJPRTkgLMSpSk/v+4/6o771UcN6Tl
	VGiQ3/vfyD0hafmhnZdN73ENTujYDUwThqJhgminYOuTxcCI8ZrPILQ1
X-Gm-Gg: AY/fxX7ZM0TNBYOaTEITBTxvA492i5hB86byrNbUH66Mn56auk6UJV/eLmvBEICcpsk
	Y6LQGKXS9Hvaf4KJq1aSa17Z0k7oCve3twNAjSEw9R6h9TOQRBMDCSgN6/1BoV1QjDNrdbrVDFr
	MbGtgvALmRzORlzVDz36BIqox+e03wqt6q27Tk7RbXkdwcJFDzaGwjzkHr0WDxPG50LSdPcXrwa
	cMm5LdI2jR5syZ9z86LYB67Qbo/PV7rFzx5kjb/gSFsi3Q+zv2ImYZdGQdTb4SP7mYARtP7NYT4
	tyUZu6sgFwGwfSIY40ugKJ6FFxxlutvd5sPTDT+c8YIP6+99iVrDjCTq1xbr/eF5IXst2uruKB3
	eVe3lpQYsef5K6vrN19cyaWToBSibxHKw5j9DpdiV1oFheGYVdHYq4xp50tts4ONIZRVsNaXDVc
	rGmcW+w/Y9rLDVz12Nud0L5xrKiFXETv+ppSFQDWJGBOX8Bnde16aXOpRc3rwWAyR96OY=
X-Google-Smtp-Source: AGHT+IHw0pxCohWx+wwHwZQMRraWL3GlKpehnjwprZqIQqRYSrc80MJqKUxfNBla9xqzFEO4m/XOKw==
X-Received: by 2002:a17:902:f70b:b0:297:e252:9e50 with SMTP id d9443c01a7336-29f23caa91amr6151485ad.42.1765505251050;
        Thu, 11 Dec 2025 18:07:31 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38c3asm37306375ad.38.2025.12.11.18.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:07:30 -0800 (PST)
Date: Fri, 12 Dec 2025 11:07:19 +0900 (JST)
Message-Id: <20251212.110719.1712545729385097553.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 dakr@kernel.org, lossin@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v1 2/3] rust: sync: set_once: Implement Send and Sync
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251212003401.524495ae.gary@garyguo.net>
References: <20251211230919.1303926-1-fujita.tomonori@gmail.com>
	<20251211230919.1303926-2-fujita.tomonori@gmail.com>
	<20251212003401.524495ae.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 12 Dec 2025 00:34:01 +0000
Gary Guo <gary@garyguo.net> wrote:

> On Fri, 12 Dec 2025 08:09:18 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
>> Implement Send and Sync for SetOnce<T> to allow it to be used across
>> thread boundaries.
>> 
>> Send: SetOnce<T> can be transferred across threads when T: Send, as
>> the contained value is also transferred and will be dropped on the
>> destination thread.
>> 
>> Sync: SetOnce<T> can be shared across threads when T: Sync, as
>> as_ref() provides shared references &T and atomic operations ensure
>> proper synchronization.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/set_once.rs | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
>> index 889d37dfd17f..5894d0dda14e 100644
>> --- a/rust/kernel/sync/set_once.rs
>> +++ b/rust/kernel/sync/set_once.rs
>> @@ -127,3 +127,10 @@ fn drop(&mut self) {
>>          }
>>      }
>>  }
>> +
>> +// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
>> +unsafe impl<T: Send> Send for SetOnce<T> {}
>> +
>> +// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations, so it is `Sync`
>> +// as long as the data it contains is `Sync`.
>> +unsafe impl<T: Sync> Sync for SetOnce<T> {}
> 
> This needs to be `T: Send + Sync` as `T` can be destroyed on a
> different thread that creates it.

Thanks!

You're right. T must also be `Send` in order for `SetOnce<t>` to be
`Sync`.

I'll update the `Sync` impl to require `T: Send + Sync` and adjust the
SAFETY comment in v2.

