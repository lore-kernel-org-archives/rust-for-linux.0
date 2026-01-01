Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2447CA5A
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Jan 2026 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767246352; cv=none; b=F5rncYqSgJNB9YiTJ1EmLnjgRbRNpukyvM8KHVlLti5vm3sPtQ2HqesK7VQAGqcWoI7kWqqr0iNMc2K5sU1tVcN/OqhnUw4WqD5xUg+iZNCuucQ71GcTRpfDDXL/S6162eQuZVMIuKTIQdbLlEclcZnZhOCfwkIMk0uBSfncEGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767246352; c=relaxed/simple;
	bh=zqVpYWQdHro+3wRtiOZg0xhuqehIzGXgU+1aXUuukAg=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=E9f1Ut1QNmGh/eYhifJSkXLz6NWYRMviQ/uT/AYwoz78YxCtBYH8RFqyaZ+D7nU/Sm/8hqgb8uIUbU7fTw9qXAkM2vYvm3ffRDJV664DKHniiRzvCoD74qvNB0zt9XH+STYbnEfsAPQOpdhFYps62YBLtOcA3JrDF8DKYk3ay2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RR66mAti; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RR66mAti"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-55b22d3b2a6so7119099e0c.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 21:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767246350; x=1767851150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ndBc6CJ1CpfHe+6bNbyAqigINCzeTpSLc2ByqKZUc4=;
        b=RR66mAtidetNqppDWfl9tQkCny3jCXnTUAAfiOpf5/rPuJs45vksspmjHw83qCziuI
         SKxnbGChCiX6avNItTxjbAI6bWvWusjVECR9eXzf3ofluly8Dp1sIO5dtOP3p5ZlIs4+
         YN89lD95R70BA6bs59uNTDavacw3kEMfyCOQjw7DGlaNN6Mj2RqEqC2YdJiT4vNq1/2h
         GZv6G1PKfbvSZqWHOPt6ANE7HAl1CFQWg2k7YeWh/5d2mhqjOTXKp6C4n6Vx6dYvSm+0
         A1aILTf7pVl4GAbQSHwRuJzozwtPbO7YYuiUUw3jnP0NcbHIdeKDYqn7z++QvACWnNWV
         NhLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767246350; x=1767851150;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ndBc6CJ1CpfHe+6bNbyAqigINCzeTpSLc2ByqKZUc4=;
        b=jT3GpI3cFhA+QAUTjwYroFRIljOzp9T9QqTWDncnNrjDMBTzszedCc6vqe0pPWxmxg
         9BZ3KuoCicj84soOXglRMu3sOiPhra3CTOvwTqdLtDxKOL5JO9SWh+H88XrQe5EmoG7f
         0dwEhsRwkNcSYpcmmDEBjZVdsBmzcKYhMrLKQKdXTWsEb7FVG282t/rQdaYJ1xWaY3q/
         Pe6DfMeFYoNTF6qtg+DHrtaA7JmEwQD0Yg1uuauF8y1JfQw9bzSsGaSkTo/D6xDyewFB
         CMbEetPzOiT5ZG7n1irOLZW5b5c/SnWqUVR/5GxAy+prAbW1wmQAQ587KnljNLQRblAi
         AkXA==
X-Forwarded-Encrypted: i=1; AJvYcCXKJqSTaByK/7j/6VZkhwTFGPwzGcScXVuO/Nay+eSvbKoxEMROlEiDSuelf9oH9oMThzk3zvFq9wb5cCmpGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJrTqCdorl+hB2fhHHjcCaFemlcWkazEwVANBhTn6FQ8mkc3vM
	fHCKWnazJXtq9HfX1HFMrr+ZywHInXY75K7tSCLJB0hFORM/24tXRi2ECUSLmg==
X-Gm-Gg: AY/fxX5aJbRQC8rVXiqzISmLAtFAIph/9qNPtyyWb8RNGdlrgzk7DjbIe4jD3dngXne
	4Uz0qCqpsxLBCiLx7o3oyhq//V9yNZSGpQzJceDlrvA2Xi9XsInmOogcPAfRZ9y9+SpmNJiA9Bx
	R/BXDTqvkoYWs2P1KyyiyRZKr7rvHWu8Fh4T4RbU4X78T/TQiBIf90p25PbZsBOd96k3fvxXPzX
	igCN1UJ2AprmFykO/HM8MgNOyyqASWyuNiTt5V/sisBpJT2zcWagnOxs7pbgFjNOngl0R3LiJko
	CBQda7vj3a5yDkUKY//h1RLuAHbtz6E3OT5xQXBvBOR+8czS9bofRN2ygZRKFb+Twj1G6P5/il5
	IDvlGLXaQdbgFFOgNW37l6CByDevJmMko4m2udyp2Sniy5dFEEHa3WlYJv2y0/9OTrXbP3fxX+Q
	38JUBtsvibTIlqYZO+J6XTSnSMcaRCTAE36udlg8I5MhVcGn4V4MkNpqjSPa4K2Zf7Ufc=
X-Google-Smtp-Source: AGHT+IGPae3Q8jZNEse2CMCocxuwZFX5WX9+VfZ7NrPzlgaKICCczFjJjW7e1gwGah3gbqw68yccoA==
X-Received: by 2002:a17:902:ecc5:b0:2a0:e7e0:1d31 with SMTP id d9443c01a7336-2a2caab9181mr464445655ad.11.1767240030084;
        Wed, 31 Dec 2025 20:00:30 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c65d66sm334482605ad.20.2025.12.31.20.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 20:00:29 -0800 (PST)
Date: Thu, 01 Jan 2026 13:00:12 +0900 (JST)
Message-Id: <20260101.130012.2122315449079707392.fujita.tomonori@gmail.com>
To: fujita.tomonori@gmail.com
Cc: aliceryhl@google.com, lyude@redhat.com, a.hindborg@kernel.org,
 boqun.feng@gmail.com, will@kernel.org, peterz@infradead.org,
 richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
 catalin.marinas@arm.com, ojeda@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, mark.rutland@arm.com, frederic@kernel.org,
 tglx@linutronix.de, anna-maria@linutronix.de, jstultz@google.com,
 sboyd@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 jack@suse.cz, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 4/5] rust: hrtimer: use READ_ONCE instead of
 read_volatile
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
References: <20251231-rwonce-v1-0-702a10b85278@google.com>
	<20251231-rwonce-v1-4-702a10b85278@google.com>
	<20260101.111123.1233018024195968460.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 01 Jan 2026 11:11:23 +0900 (JST)
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

> On Wed, 31 Dec 2025 12:22:28 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
>> Using `READ_ONCE` is the correct way to read the `node.expires` field.
>> 
>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> ---
>>  rust/kernel/time/hrtimer.rs | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>> 
>> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
>> index 856d2d929a00892dc8eaec63cebdf547817953d3..e2b7a26f8aade972356c3eb5f6489bcda3e2e849 100644
>> --- a/rust/kernel/time/hrtimer.rs
>> +++ b/rust/kernel/time/hrtimer.rs
>> @@ -239,11 +239,9 @@ pub fn expires(&self) -> HrTimerInstant<T>
>>          // - Timers cannot have negative ktime_t values as their expiration time.
>>          // - There's no actual locking here, a racy read is fine and expected
>>          unsafe {
>> -            Instant::from_ktime(
>> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
>> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
>> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
>> -            )
>> +            Instant::from_ktime(kernel::sync::READ_ONCE(
>> +                &raw const (*c_timer_ptr).node.expires,
>> +            ))
>>          }
> 
> Do we actually need READ_ONCE() here? I'm not sure but would it be
> better to call the C-side API?
> 
> diff --git a/rust/helpers/time.c b/rust/helpers/time.c
> index 67a36ccc3ec4..73162dea2a29 100644
> --- a/rust/helpers/time.c
> +++ b/rust/helpers/time.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/delay.h>
>  #include <linux/ktime.h>
> +#include <linux/hrtimer.h>
>  #include <linux/timekeeping.h>
>  
>  void rust_helper_fsleep(unsigned long usecs)
> @@ -38,3 +39,8 @@ void rust_helper_udelay(unsigned long usec)
>  {
>  	udelay(usec);
>  }
> +
> +__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
> +{
> +	return timer->node.expires;
> +}

Sorry, of course this should be:

+__rust_helper ktime_t rust_helper_hrtimer_get_expires(const struct hrtimer *timer)
+{
+	return hrtimer_get_expires(timer);
+}

> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 856d2d929a00..61e656a65216 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -237,14 +237,7 @@ pub fn expires(&self) -> HrTimerInstant<T>
>  
>          // SAFETY:
>          // - Timers cannot have negative ktime_t values as their expiration time.
> -        // - There's no actual locking here, a racy read is fine and expected
> -        unsafe {
> -            Instant::from_ktime(
> -                // This `read_volatile` is intended to correspond to a READ_ONCE call.
> -                // FIXME(read_once): Replace with `read_once` when available on the Rust side.
> -                core::ptr::read_volatile(&raw const ((*c_timer_ptr).node.expires)),
> -            )
> -        }
> +        unsafe { Instant::from_ktime(bindings::hrtimer_get_expires(c_timer_ptr)) }
>      }
>  }
>  
> 
