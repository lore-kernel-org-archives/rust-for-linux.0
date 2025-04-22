Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F8C23A9
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 22:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745362061; cv=none; b=iL9v+kMMIl4Vi/koqX61QWYUXq62ibB8JFuFM52seGoZoxnBOl9FX543WR3lUYUvOEkby/3cShFUhre7PnoR84tBIhZicxbgFv8/AD2yvsP7eISJt6aBagefUrY9TZ+JL3aYduMEJAUozXSJ2FByTb8ShHwYOoSWGUarphwHIiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745362061; c=relaxed/simple;
	bh=2noy5RFrIBJZiQ9XTs9K+aIAyN0I/RqTjHqCBaKLxpU=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ZPyvRu4/HoesPRf/YUE59N2J3sL02QKqiJokeeEIUcrs1sOutoavfu3MSll336z0zpDriqVUZA1YpIbjH0e13yUfrPPl4mrozIOiapBOLLa8xnN/BtN9jqBf08wOi5w76vwCRfpKG7NDGqB2IUBQhDJYRxW5UQAN6ZiJrrCUWBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdoVOypI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdoVOypI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240b4de12bso85595975ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 15:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745362059; x=1745966859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJjGxEPkWDxsgoH8TN7y6RKLpW2yPuU4cIr04gehf4k=;
        b=gdoVOypIXli6B1XhJs6ZivzTWUy+dUTWSsihkMbd2hvfnhEb5hTpYudX/8cuS3DqTl
         cc5phV71slD1b8v0s56+V1sp9X5Oh3g8Dr4+lstqu0Am41X/Cw1a7Z3HUn7AkE11u851
         jihWU8GokqvJqKP1+UAiJ9M7NEAW2/UtchHsE254VZN6LF5qdI35sU2JL72aMDUdQqXL
         hBKCEOfv3XYFTFpaOEyn7YC4sUl7/BDE5khm6oLkU4T1Xuac4xs2WBjDJeCfLgHGlCG5
         lj/zYflfpuL8t3q6jGpiFZ09cRI7sPNyhe8Phabl9TdOhBhulLXVtll40X9ImB9g2Jtq
         Wi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745362059; x=1745966859;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cJjGxEPkWDxsgoH8TN7y6RKLpW2yPuU4cIr04gehf4k=;
        b=lk9Yu9p1qJSFgKWKG5urNrYaWQPByO/Yz0mx3+5ZBDwJuYyb+AQuxglP1N2NKIVeDS
         gLrVueLNGszeDhfgc9jyBwr5uGcjTXep3JseDoe9iEbDBVaewp7kZ+fz9qhFMnjnUqpT
         tCca/b1pq8vc7aw2L7fO3MQbjMro4okkj/z+Q0+egA2XTVYRcjpsVPCftp5+I/yZzIvI
         QdnhgwBk9CZkinHYVn+ZdXLB/D5ae/C3UQ/NVxQwE7OoAKNCx64f3dKyPzdDuv4DrZjl
         1DJRVGNjOLrdFRDSBImHspR22M48hhszgnKA1VhH3IE4g6QlxlQK8IlGkIYqkRDNEp3g
         YlWw==
X-Forwarded-Encrypted: i=1; AJvYcCUGzNQywWa5aCT2XUaHQTPlX1ExMXlAwaE4ClApRk8cz95oy6Ks0p5n8jVL1YSL71FM8H05aRpbPBkX8FYYFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwcW+6hXFaqHGxpsWn7CPzKx1mlpUkeT7py66dHOWBWDNwcU2nP
	+aeFSUI5ftSq1+vh0lmUkYJnvCf/o1QS1+pjiVGZUkvOQopRp95F
X-Gm-Gg: ASbGncsq4lIzx+rX6/TuoJUQpn5DjiA1q/ABIgct1gEINtxEZFIPNf9YGHnyXomlcv7
	Qcbp0f+qdXCvxXwLLt0KmJAEbof/8+yTTjLvuqFqgYBPB6mA53Qyp3w1o6b1soN6oL0lxfK8x/W
	KdonM20KcC77NsHT62744ijvZqqQfVK6bBqQl8/9cjJGX/CHH+GmkMtPGJK3+y+fQQZwLFBButF
	nZSdDJzdiQRiUmRikn06Al7pPTtyedz6v5ksNLPFnMoseE1pmsGkvTtRSjzqxmw6cgrtNqiz6D7
	extOnB7oW+LLTxOX4NgS5m+DpCyx8LTlZzsj7LoRWLdegVMxFo6Uqy2YiU4p1oHlc9jYcQ++DbT
	MEUmccwMVYmfgn0cubCz/7vY3uowE0XpQ8g==
X-Google-Smtp-Source: AGHT+IEZTukl5MyXlQ7V56U+wkxtzHB+Di510uCmyR/huG9PCtLWaEaXc7GuJkwezKDZYD4qtwaYkg==
X-Received: by 2002:a17:902:fc4c:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22c535a9e07mr225295715ad.30.1745362058915;
        Tue, 22 Apr 2025 15:47:38 -0700 (PDT)
Received: from localhost (p4138183-ipxg22701hodogaya.kanagawa.ocn.ne.jp. [153.129.206.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed2489sm91298115ad.171.2025.04.22.15.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:47:38 -0700 (PDT)
Date: Wed, 23 Apr 2025 07:47:26 +0900 (JST)
Message-Id: <20250423.074726.1315152675881380220.fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
 frederic@kernel.org, lyude@redhat.com, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org
Subject: Re: [PATCH v1 3/3] rust: time: add ktime_get() to ClockSource trait
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <87ecxk9w3d.fsf@kernel.org>
References: <j6TQ_TOATaKV1cgs9cQAor4mPf5w-aBkthx9JS9bySKdK05B52gu-27p2SRf_vmJQ0THVPMU3IhsbPWDvQH_jg==@protonmail.internalid>
	<20250413105629.162349-4-fujita.tomonori@gmail.com>
	<87ecxk9w3d.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 22 Apr 2025 15:14:46 +0200
Andreas Hindborg <a.hindborg@kernel.org> wrote:

> "FUJITA Tomonori" <fujita.tomonori@gmail.com> writes:
> 
>> Introduce the ktime_get() associated function to the ClockSource
>> trait, allowing each clock source to specify how it retrieves the
>> current time. This enables Instant::now() to be implemented
>> generically using the type-level ClockSource abstraction.
>>
>> This change enhances the type safety and extensibility of timekeeping
>> by statically associating time retrieval mechanisms with their
>> respective clock types. It also reduces the reliance on hardcoded
>> clock logic within Instant.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/helpers/time.c | 16 ++++++++++++++++
>>  rust/kernel/time.rs | 32 ++++++++++++++++++++++++++++----
>>  2 files changed, 44 insertions(+), 4 deletions(-)
>>
>> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
>> index 7ae64ad8141d..613475c529d4 100644
>> --- a/rust/helpers/time.c
>> +++ b/rust/helpers/time.c
>> @@ -1,8 +1,24 @@
>>  // SPDX-License-Identifier: GPL-2.0
>>
>>  #include <linux/delay.h>
>> +#include <linux/timekeeping.h>
>>
>>  void rust_helper_fsleep(unsigned long usecs)
>>  {
>>  	fsleep(usecs);
>>  }
>> +
>> +ktime_t rust_helper_ktime_get_real(void)
>> +{
>> +	return ktime_get_with_offset(TK_OFFS_REAL);
>> +}
>> +
>> +ktime_t rust_helper_ktime_get_boottime(void)
>> +{
>> +	return ktime_get_with_offset(TK_OFFS_BOOT);
>> +}
>> +
>> +ktime_t rust_helper_ktime_get_clocktai(void)
>> +{
>> +	return ktime_get_with_offset(TK_OFFS_TAI);
>> +}
>> diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
>> index db9a783631ec..4b9b61eed628 100644
>> --- a/rust/kernel/time.rs
>> +++ b/rust/kernel/time.rs
>> @@ -63,6 +63,11 @@ pub trait ClockSource {
>>      ///
>>      /// This constant corresponds to the C side `clockid_t` value.
>>      const ID: bindings::clockid_t;
>> +
>> +    /// Get the current time fro the clock source.
> 
> Typo fro -> from.

Oops, fixed.

> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Thanks!
