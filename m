Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00527AD2D
	for <rust-for-linux@vger.kernel.org>; Sun,  3 Nov 2024 16:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730651896; cv=none; b=BDNF3SEOxxhuTr/Y6p9wbkhDsl/rC58SS+Kiol4Dt0ktoWr67A4UbjAlqccHcM2oVqHS9ftbIJzjWgD5aRlxFA0FZ5SX2djF2zysdi2T8qkCjHDOOvEca2BWe990FV5Wc9l3I8yg8/BoGGGsbmrDvrRczSD6EMSuTvKuq/8ykT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730651896; c=relaxed/simple;
	bh=8qUs/VD9uADMgAdbZCVPMypgVmUMoKWyzehvgSfzE4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rFjvV/40mzGmX+u+IxUXBF7ltd4k82iL+pdxnHDlLfeixc3OJlO9HgcnHfPtK/H6hwg1y0sq6jZhu4bwsM2to7VSaUocXsLs5lUdQRg8J7Faj62eg/HP+Z5hhEmW1OPWWG4kRJ2eYSklfuZIG+IlmCmYLLedESUm+L5Vr4pfHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRiMi5H9; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRiMi5H9"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a156513a1so601677866b.0
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Nov 2024 08:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730651892; x=1731256692; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1Q0MEE5K7RKexaO+eCmPtIZhWmnmJvTY+5GQzYRvHI=;
        b=jRiMi5H9tWLabF0rMwk9N4OXm0be5BMlEYWez/phYgSXQq60Va93vv2Nvl2Y25o8g1
         v4xWqTw0EBJcR4OLaef0SU+TWHDqFwN08+V85adbnwmYhhmWKWKS4PnaRgfAD8a7P5JL
         h+lLHLVSR8X8qPZDWD8zYe7D54GXyHeEGopfGkWNUkowXK+vfzRnmk3N5ueHoweOh2TG
         n+d4FtnlulYr7kWXjNp2nZs2GBi1gyQ9sQkn+ei+54SVyc18FFVrs+WgmkhAECbDQglP
         byUVmfAvJuIizf5foA2InoLw4hV39FCWqW2pWybguDza0ihZYyqA0YHv7fxnpiw8P+MB
         7GHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730651892; x=1731256692;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Q0MEE5K7RKexaO+eCmPtIZhWmnmJvTY+5GQzYRvHI=;
        b=V3XaSiMKFegOxARrduNd/VKhllau52H0Cww9qF42AI3aK9SOxygtuNyHpIRN//9hBa
         JtHbPn1phZv9RB4JtzVLUSKL0KbS3FIOSEBDOJLGIriptQ9qqC/e+kXefUrlTs7jbQo3
         iRBUrZdHjXAfZWy1fGCuRmbIn31Di0ixF4fdh9nFYWYJ8Pqy2lD6GNmQdEYt9xlTUE4N
         PLVcXu0m1hMZWvriiCq2xytVfgHvVBmLpVZEPowHvk9czcZs91sO5q77lP8iUUj537aT
         dVfBSiTxbyTISXQ1n/IeV+U5T4a31ChqLc9D7y/hJ5P7DUq280FRYqgUO34aqOs25rkq
         K34A==
X-Forwarded-Encrypted: i=1; AJvYcCW/aEi9Fnl2DxjKpTv+I5mUt+txLQXz9muwMe8N8Ys3MVeRYEqKyOLtGkAuld8ortUNGbd9Gv6vWQ/ZonTRpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrWS/6ySs5hE7wvB8w6vYzljMAQUHwBsObPJ/m9xPeKEsFYkLm
	5kk/oCwGIPliob6HIQ7VFnZqSh2CXe95iRnXWZNmUWEQXATLol1Z
X-Google-Smtp-Source: AGHT+IHQ9rrsnLKOZshBt5ZQN5rgIEs6nSRaZDdubzaZtUkxMh1I8Ho9Ahw3q4zh8/STrvFYnssUeQ==
X-Received: by 2002:a17:906:f59b:b0:a99:4780:1af with SMTP id a640c23a62f3a-a9de5f6e2eemr3000729466b.31.1730651891873;
        Sun, 03 Nov 2024 08:38:11 -0800 (PST)
Received: from ?IPV6:2003:df:bf0d:b400:ec4d:dba9:842:9657? (p200300dfbf0db400ec4ddba908429657.dip0.t-ipconnect.de. [2003:df:bf0d:b400:ec4d:dba9:842:9657])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e565e098asm440580766b.132.2024.11.03.08.38.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2024 08:38:11 -0800 (PST)
Message-ID: <b9bcc656-7e58-4509-aa2b-6279a72fa9fe@gmail.com>
Date: Sun, 3 Nov 2024 17:38:10 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
 rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20241103030530.76756-1-fujita.tomonori@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.11.24 04:05, FUJITA Tomonori wrote:
> Add Rust version of pr_[emerg|alert|crit|err|warn|notic|info]_once
> functions, which print a message only once.

Maybe it should be mentioned why this is added? Who will use this?

> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
>  rust/kernel/print.rs | 92 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index a28077a7cb30..57dbb45ba5c0 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -414,3 +414,95 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
>      )
>  );
> +
> +/// Executes code only once if the condition is true.
> +///
> +/// Public but hidden since it should only be used from public macros.
> +#[doc(hidden)]
> +#[macro_export]
> +macro_rules! do_once_lite_if (
> +    ($condition:expr, $e:expr) => (
> +        {
> +            #[link_section = ".data.once"]
> +            static ALREADY_DONE: core::sync::atomic::AtomicBool =
> +                core::sync::atomic::AtomicBool::new(false);
> +            let mut ret = false;
> +
> +            if $condition && !ALREADY_DONE.swap(true, core::sync::atomic::Ordering::Relaxed) {

What is '$condition'  good for? It looks to me that it is set just to
'true' everywhere below? Could it be dropped?

> +                $e;
> +                ret = true;
> +            }
> +            ret
> +        }
> +    )
> +);
> +
> +/// Prints an emergency-level message (level 0) only once.
> +///
> +/// Equivalent to the kernel's [`pr_emerg_once`] macro.

Here and below:

Would it make sense to use a similar header style like with the
existing pr_*()? And add '# Examples'?

Best regards

Dirk


> +#[macro_export]
> +macro_rules! pr_emerg_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite_if!(true, $crate::pr_emerg!($($arg)*))
> +    )
> +);
> +
> +/// Prints an alert-level message (level 1) only once.
> +///
> +/// Equivalent to the kernel's [`pr_alert_once`] macro.
> +#[macro_export]
> +macro_rules! pr_alert_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite_if!(true, $crate::pr_alert!($($arg)*))
> +    )
> +);
> +
> +/// Prints a critical-level message (level 2) only once.
> +///
> +/// Equivalent to the kernel's [`pr_crit_once`] macro.
> +#[macro_export]
> +macro_rules! pr_crit_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite_if!(true, $crate::pr_crit!($($arg)*))
> +    )
> +);
> +
> +/// Prints an error-level message (level 3) only once.
> +///
> +/// Equivalent to the kernel's [`pr_err_once`] macro.
> +#[macro_export]
> +macro_rules! pr_err_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite_if!(true, $crate::pr_err!($($arg)*))
> +    )
> +);
> +
> +/// Prints a warning-level message (level 4) only once.
> +///
> +/// Equivalent to the kernel's [`pr_warn_once`] macro.
> +#[macro_export]
> +macro_rules! pr_warn_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite_if!(true, $crate::pr_warn!($($arg)*))
> +    )
> +);
> +
> +/// Prints a notice-level message (level 5) only once.
> +///
> +/// Equivalent to the kernel's [`pr_notice_once`] macro.
> +#[macro_export]
> +macro_rules! pr_notice_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite_if!(true, $crate::pr_notice!($($arg)*))
> +    )
> +);
> +
> +/// Prints an info-level message (level 6) only once.
> +///
> +/// Equivalent to the kernel's [`pr_info_once`] macro.
> +#[macro_export]
> +macro_rules! pr_info_once (
> +    ($($arg:tt)*) => (
> +        $crate::do_once_lite_if!(true, $crate::pr_info!($($arg)*))
> +    )
> +);
> 
> base-commit: ae7851c29747fa3765ecb722fe722117a346f988

