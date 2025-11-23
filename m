Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82EC821CC47
	for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763903790; cv=none; b=fj3LR/CDuV4PtihHuifwPjdoEM1o/5YkUM0PLalk8/9r4KFuRxsbWdvlVdm7wqYEMbsYtOdlHpErTnPGsWY4BR8Trsk+1fVSbuV9HQf3nCsEtTLuWoivhfKsKPOFacinYlYpahVLeDGK8b7YnAwIkI//FEo22vQMT86EcDBkPCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763903790; c=relaxed/simple;
	bh=54vi7KmAT+1m3az/BKhHowS24K4TkexlSujhLJMigzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nvLZ97uMu9aU/8HY8Dg8dWfW/1Rof+HgHvR+HadLYao35Am3jrOSoaSQJY7f7f01MBr9Jy2IaeoV1GTz2xblm/g0Y4gNExQ7UUmsd0zC3QsC+PndfWOjb/01CBb8zTDwhQMNiPqVKgpu+GRYxK8sHJulz6kGbRdsEt0GUglXSE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdGVhLps; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdGVhLps"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a219db05so20987075e9.2
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 05:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763903787; x=1764508587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vWsYIQ2Ggbhbzka70Nij3a4arpdwqNARnWCMeN/qSWA=;
        b=hdGVhLpsx71DM1Z2KF42+GUYyGncfHK5SG5TXv0FOOE1O/WCejhBl+C4QRB1p0pCH9
         NZXgjYZKYWyyAGnytkKrexyaObgps6FfMTwmBKyHPA5/glfwCTzaKmlpPef5JXryC3ex
         x7uDoLz1qiihOJ12d0V6IFHIJyaqux2mAz0MvL12ch4Z3Opf34zJwFBP6oggUWwO4FmN
         4SimP4S0BLIkHLhXT0ifKPi9HEhXgt8u0lIvD/90TB+CUuOUffMRcjAzi6nTnv1pi/e4
         Eib4LPc5ReLsKckISK8SqFeZRk7DVitCXlMVCwAb1wHpPV6w/wvgAYycjvtG/dU3QX2x
         HXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763903787; x=1764508587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vWsYIQ2Ggbhbzka70Nij3a4arpdwqNARnWCMeN/qSWA=;
        b=FBZYYawO2ODz+JG1sXYbRR5IcVHXh4ozf4zlztMMy2Uff1lal55EX7cCsPQbUZhhkv
         bfvPJ7iGDjd45qq/T4bLo6O7YEJyZf4kRQL4/3Y5WJWiGotd5n1USfImegBZ+Twkkbt/
         qjQLl7BiTMbckC2k1hUlYRJwHQAuAgw26SSex9pbKyzU4uX/CjSthK6UzeDDk+So23gM
         GoXd5OHM//hv7larhQdDVEJsSv+pl4sbYDRJyqozEvKdDR/KOJzm7bMbxudOdlhgnzlO
         e0/m9HlacGhsClqgLpyFZsM6y65FvAZgopJkXauTnW6Fksn3zC/oDnUjzAFh9948nIrt
         YHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUllLQYRrh4svXXvs3iuB2N+8RrxzbhjH3OURThSkmpTRDab0aFQusQ3VCB99DlWPm072KyKNqBUxvDQ8v7lQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtpyzfpodegg7onZg2hqSxXM74H4xJH+RPMZl2XLAGZEZ4HiwM
	HLqo+qfiYvKGGaJZwoYGnvgrq2kgFUAEbaFoTovRYyRM/wBAB2vWgNIt
X-Gm-Gg: ASbGncsAi6saMN3eG38RzwpG8DD6CmTxo2cQ3TLhERqXOg9hwH+kAAMUe023mbnsccs
	WK//rYudf/s57TMztMDEdODB2h8hr3DvRPFVrmaW7u9020zHdzXNbDg8gfIwHgTxyoTdnDMoE0u
	RPUaXjWic7Grh13T9lPK5BGHWh6b7+7bmkmhvZbydlzyIIay4mD2YZR3vWBKcFxfxgUs7i6pJDP
	bJPaEW/HhW2RWKAwcU5gXZmczEFH7SYu06QrmrDtsjfTHwbyY0LMHGw6UaMhPnE4MieSN1BYA3C
	1mEoh+aEBTKSkMWTlN4K8ImLDrpjE2Ou9oHwowgOZtrbaiTwsNmuGVtgny6o14/kTkMo1HnbD7t
	VQwVOs1NvKw+on7PTOHLxQVvTza18JHcxg1XVFLTUOjAM4w5Lj25Dri9MedpXYmT82/x5UNEBkW
	RqecgGPV25mrZv5r6kLfVVYWdGnfrlSzdIkxCqDkVcEjU+ZL5XWQHEUtqyUl+EvL5g/SHGSk/fw
	3q61w==
X-Google-Smtp-Source: AGHT+IGwu9HAU1GTXcVV6PqyT2WVWbNnyTLYP+26LVoRcWUnFI2rUjGr2LZvtLw3Ln81be9Wp+f1+Q==
X-Received: by 2002:a05:600c:840f:b0:477:632a:fd67 with SMTP id 5b1f17b1804b1-477c10d6d13mr93671615e9.12.1763903786586;
        Sun, 23 Nov 2025 05:16:26 -0800 (PST)
Received: from ?IPV6:2a06:5906:2618:cb00:f1a3:6462:6c03:ec0e? ([2a06:5906:2618:cb00:f1a3:6462:6c03:ec0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb919bsm22549569f8f.34.2025.11.23.05.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 05:16:26 -0800 (PST)
Message-ID: <7bd3232c-90cc-4e71-8aed-2ac911cb20f9@gmail.com>
Date: Sun, 23 Nov 2025 13:16:24 +0000
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
To: Shankari Anand <shankari.ak0208@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alexandre Courbot <acourbot@nvidia.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-pwm@vger.kernel.org
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
 <20251123092438.182251-6-shankari.ak0208@gmail.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <20251123092438.182251-6-shankari.ak0208@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Shankari

On 11/23/2025 9:24 AM, Shankari Anand wrote:
> Update call sites in `i2c.rs` to import `ARef` and
> `AlwaysRefCounted` from `sync::aref` instead of `types`.
> 
> This aligns with the ongoing effort to move `ARef` and
> `AlwaysRefCounted` to sync.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1173
> Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> ---
>   rust/kernel/i2c.rs | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/i2c.rs b/rust/kernel/i2c.rs
> index 1aee46f59460..c50ca464d87c 100644
> --- a/rust/kernel/i2c.rs
> +++ b/rust/kernel/i2c.rs
> @@ -17,10 +17,8 @@
>       of,
>       prelude::*,
>       str::CStrExt as _,
> -    types::{
> -        AlwaysRefCounted,
> -        Opaque, //
> -    }, //
> +    sync::aref::AlwaysRefCounted,
> +    types::Opaque, //
>   };
>   
>   use core::{
> @@ -32,7 +30,7 @@
>       }, //
>   };
>   
> -use kernel::types::ARef;
> +use kernel::sync::aref::ARef;
>   
>   /// An I2C device id table.
>   #[repr(transparent)]
> @@ -408,7 +406,7 @@ pub fn get(index: i32) -> Result<ARef<Self>> {
>   kernel::impl_device_context_into_aref!(I2cAdapter);
>   
>   // SAFETY: Instances of `I2cAdapter` are always reference-counted.
> -unsafe impl crate::types::AlwaysRefCounted for I2cAdapter {
> +unsafe impl crate::sync::aref::AlwaysRefCounted for I2cAdapter {

NIT: This module already imports `AlwaysRefCounted`, so please use the
imported name instead of the full path for consistency.

>       fn inc_ref(&self) {
>           // SAFETY: The existence of a shared reference guarantees that the refcount is non-zero.
>           unsafe { bindings::i2c_get_adapter(self.index()) };

Thanks
Igor
