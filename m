Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C591215B0EC
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732868557; cv=none; b=MVi1Kny4w4i8QhCUnPZa6e+fpBPm+v02E+M2JNNWZkbpyejmctWD8F9WTKvL+cD2THEEk0TfD7/K8f4KxPyuCSzqOV11f97UpJ5Yd7sbgLL+NPyyFkpn7qiDxqr2Ri07kvArdVwpZeQAUbCQv0c1i6TzKIyoed6WXL/SPnljBy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732868557; c=relaxed/simple;
	bh=562yHw0XBNbz/d+kvGdxMM55CvOCfYE2YRMXmMQ1hpk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FUGXKD8gZZDO2lVfEi6CeGH2WCXAZu/2NZTEK46Harsw2HiqP/rGS+lssFfgIdxSz3u2cXkhYcCWleSewG/MUWmJH/VqEwQvwFp4xYxDGsHcZbxebDAs50rxvpSAKHbS7dkuukF2U5cQWw7S/FMu2ECBveSWjkh5harQpKS9ZB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=fsxw1a3o; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="fsxw1a3o"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa53a971480so210633366b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 29 Nov 2024 00:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732868554; x=1733473354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bpOpchybQJXD5CvZrpdSs1RBStnGyKaKUM/Uju5sP7Q=;
        b=fsxw1a3oH0tW/K4dcEKMJlJK+wlIuH5k41HtuDb/J/sybSGf8tCD32eea41z1ueiwY
         4oJunEtOTK4nxF26enPXohZ1gi4S3bhC9hbHqmiFA8TA83R4v2KIMqZyY6LsnnNl6XsR
         j+t4/FW490gyxDJHjHM5zmVjs7BNmxsfjJ2Q4US3WjSe34Fpe+TCASLVVbZgsoKUbYwI
         erIvdxY07GVREpGQuziGv5QqxSO+eCDr9FwvAvq203FbgTC2D1wh6s9goNtge7m5mYNJ
         o8qvEWZK3aERS4vembs0UY7x9fYQwN6oc6d/qPrj1bPcmiRoVbRSiy4S/zDCWGzeN15O
         2p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732868554; x=1733473354;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bpOpchybQJXD5CvZrpdSs1RBStnGyKaKUM/Uju5sP7Q=;
        b=DgUVxLQJKSUB0Mm1AYAh8MOdhrMBEnux4F5w3EXuUqgNsxwFltqVuYGbl8UCYVxjpM
         KLDYdfVCb76GoAuBCHzxckHt0IkEGr1EZccpa0gu55ANz4fda6XyXN0jshMMtCj6IpQt
         UYIEyABPf/FhPJaFscwDPa/F16pAqYN5dREpQ5ees4WBVsYC1TG7b0M1bqboW7fWm8OE
         A5tqe6HExonIJlEVvxUUWw5BCR8mVdx8DHKPz2H4cch7xY3UoJJQEtqzK7hRcm9GbTSx
         q1at+5TdaVKVB9XIU6EAAL7fX1vMJJ23d0XfPgBJ1wDR1sGk0Ek4rXKuCbIeMFvCp3RL
         PdmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp7lrqNYtnPNQbOtrUf5jpXMGBThjn4/tneccbTp8bAQWlvnqkEwk/TKCfhI4QkkcnX47aY7vixOYMRXIMyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwXuR2UsO3/Igx9EqmcH4VuCqV/nE7QINdfE23174LaJ15WUMu
	Rl6kzkF2cMOaICKKd71+qGLIdTK2mXFd7SZD/Jw4pASqonAOZgWeSCdcljZgLu0=
X-Gm-Gg: ASbGnctsqUgQzAtIGJwaSAPWX+haC9RxPwm/6gHO9QYps0PS+W0dQplLpUyQmgPj1yh
	H6JvY4MAHsFfU7dVvvQENCFFUmzHWgrd80bZ12El/Jpuil3bpZIpvFKtf12LN61QDrxbv8pMQyw
	L/u5fpm8bNNMzWHyiDqS3b8oEKOteWF4H0+PXnqUdYigoTr0C2HVpZD9QIfDXGxR4KfzFVa0t4w
	82zZv73luYIW5EfnXnXbrFTI99KSh60l6cv+G7YwvWSPWbvpkM=
X-Google-Smtp-Source: AGHT+IHyI/nqfSxONykSF4kwQGUMItj0mjdcZ+BUKlRUULAfXTeC/1tNq1UOeKpwb/WJV4QJtInbew==
X-Received: by 2002:a17:907:7751:b0:aa1:f9dc:f9bf with SMTP id a640c23a62f3a-aa580eee484mr832584866b.10.1732868553906;
        Fri, 29 Nov 2024 00:22:33 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e6d7esm148314366b.114.2024.11.29.00.22.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 00:22:33 -0800 (PST)
Message-ID: <0aa72bdd-7431-49bb-a6b4-e254787db0f1@sedlak.dev>
Date: Fri, 29 Nov 2024 09:22:32 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: Add `OnceLite` for executing code once
To: jens.korinth@tuta.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Rust For Linux <rust-for-linux@vger.kernel.org>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Dirk Behme <dirk.behme@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>
References: <20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io>
 <20241126-pr_once_macros-v4-1-410b8ca9643e@tuta.io>
 <230b3602-5d68-4e79-969d-0d2df1fdf033@sedlak.dev> <OCj9As8--F-9@tuta.io>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <OCj9As8--F-9@tuta.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/27/24 8:46 PM, jens.korinth@tuta.io wrote:
>> Have you considered it to be implemented like `AtomicU32`? I think™ that
>> one atomic variable is more than enough.
> 
> Just to clarify - you mean something like this? Nevermind the magic numbers,
> I'd replace them, of course.

Yes, that's what I meant. But as Alice pointed out, you _may_ be able to 
reduce it to the one AtomicBool.

Daniel
> 
> diff --git a/rust/kernel/once_lite.rs b/rust/kernel/once_lite.rs
> index 723c3244fc85..0622ecbfced5 100644
> --- a/rust/kernel/once_lite.rs
> +++ b/rust/kernel/once_lite.rs
> @@ -16,7 +16,7 @@
> //!
> //! Reference: <https://doc.rust-lang.org/std/sync/struct.Once.html>
>   
> -use core::sync::atomic::{AtomicBool, Ordering::Relaxed};
> +use core::sync::atomic::{AtomicU32, Ordering::Acquire, Ordering::Relaxed};
>   
> /// A low-level synchronization primitive for one-time global execution.
> ///
> @@ -44,13 +44,13 @@
> /// assert_eq!(x, 42);
> /// ```
> ///
> -pub struct OnceLite(AtomicBool, AtomicBool);
> +pub struct OnceLite(AtomicU32);
>   
> impl OnceLite {
>       /// Creates a new `OnceLite` value.
>       #[inline(always)]
>       pub const fn new() -> Self {
> -        Self(AtomicBool::new(false), AtomicBool::new(false))
> +        Self(AtomicU32::new(0))
>       }
>   
>       /// Performs an initialization routine once and only once. The given
> @@ -71,10 +71,10 @@ pub const fn new() -> Self {
>       /// [`DO_ONCE_LITE_IF`]: srctree/include/once_lite.h
>       #[inline(always)]
>       pub fn call_once<F: FnOnce()>(&self, f: F) {
> -        if !self.0.load(Relaxed) && !self.0.swap(true, Relaxed) {
> -            f()
> +        if self.0.load(Relaxed) == 0 && self.0.compare_exchange(0, 1, Acquire, Relaxed) == Ok(0) {
> +            f();
> +            self.0.store(2, Relaxed);
>           };
> -        self.1.store(true, Relaxed);
>       }
>   
>       /// Returns `true` if some `call_once` call has completed successfully.
> @@ -98,7 +98,7 @@ pub fn call_once<F: FnOnce()>(&self, f: F) {
>       /// ```
>       #[inline(always)]
>       pub fn is_completed(&self) -> bool {
> -        self.1.load(Relaxed)
> +        self.0.load(Relaxed) > 1
>       }
> }
> 
>> The `rust` part should be default value for rustdoc tests, can we please
>> omit that?
> 
> Will do!
> 
> Jens

