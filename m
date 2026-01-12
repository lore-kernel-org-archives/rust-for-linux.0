Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902FC2BE7C0
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 22:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768257655; cv=none; b=PiKoTeKBPSAvM5lZgo+pQsx0ZdcslLQVuBC822TEnM5fcelDbVK9FhyEUdWfXNhdkKm02q1iw+43FlSSbt4F/7cLYLz5/PGca1eBbfButkLw7YBhJad//S7nqlPiUEZK9iynwgb8KLqWbqC9/4+HscfcQUC7Sp54OlqbF0mUcCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768257655; c=relaxed/simple;
	bh=+kH/c13f3s432PR2BPsMbJL+Rn51ss8kJQMbUzfKu28=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=dRT5qbNfIMg6qa8LczhH7I3e3Dm9NRoY0KN82KngCBGVd7xOKIfgmErPf7aG03tZhqTHdlBW1BUP6oas9h7ExgHcLG8s6l9gR+O/ALtich3/C7rex40ysW5SgPR0fTIw5wQCC8AH8SA8eRAxpYV3o8VTGGwr/BstQv7i1wL9uSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IhsN6BWB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IhsN6BWB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so753792b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 14:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768257654; x=1768862454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uar7LV6GWhwRcQ+WSbw1PhiN+vUKSPCZmVRDaw1o2m0=;
        b=IhsN6BWBUYgcRP3E9EHy0hhyxQRu9v76GDI8Q9E0QKXo/VpXKIwdZZe2sTcOE/Lm8e
         YmBXo6NpQ+7eSyXqv1YBdGGVsh7pVZ/b7i6WdeFoJKSdGZyFOGPXZb+D3exqydRMPBbP
         rQsG5ZLzukOAAfFPj/KelELBwMZ8SoWmNMM0a6p4oXheIbzwEMkU4LGSJV0Cfty4bhUE
         /06cgvFKL5R3SFt3rIhy6c0TYXORp8WqtNFd88vyAcy+NU8QL7loKtCqNGBfa43S1rET
         3fU2m8jhV7V7nVYoQF7cJySng15V5oU83OfZb6l9MUhvlqVCVo3sCQCJFz/eston5VqP
         LknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768257654; x=1768862454;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uar7LV6GWhwRcQ+WSbw1PhiN+vUKSPCZmVRDaw1o2m0=;
        b=iqKPONlCgnpXB2kOrTucQ7KNoEyt5jrGa0VgJvVrJbX6+0LwEp6tCTtRVuOamDTAed
         DPfzkLG0xq6n59Sigu0P0WRiDqwFVM/VLg7l+qjyXqa3dXyp96QliPMMgFIqN44e1RrB
         RYRp794rKflE7FLLjZZwAmiPmzDMqXbCmI8RJ3aCl/AkT5hUz+GJCZXUCg6vtY6aJvLK
         yZ9qrnCbso8yogNGSQ/mzHjNYa/n5Jc4PlJ1wvBZoKsNqwDqClqUJd+nd/wDlFeD0VUN
         IpTc2vVKAyuPC0iBbWK8ddNw4V0WaGvdBHUJMBkQqmLUWzlIwcwBXoHdQ4eQO6zy1u0p
         jzYg==
X-Forwarded-Encrypted: i=1; AJvYcCXTqypi82i3L8wPa3grULjjA7HCfYJkrX/onM7sBpNfPKxAcgrFC/aDmm26WRxDelhrCBedWEKLQoo4OQZ8Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKAQ+ix8cacTD7DUykCt6IYbGajmIng3rLcdX4+FqlXB5mqntc
	kQLJP5oMifG52SUOWNkKV00Fm2YI+WJvRlb626xDK4eTIaVS9inbUNpg
X-Gm-Gg: AY/fxX785AFGzTndiEAexjaKcgj1pBOvWmv5T10ab0MMk5DCkg6yzjbouIlISCwrb/Y
	OdpZxJN0tXg/rIKjXy8HIfGMJ8FNtYyP5mFgVp5Ab2BfNb9u6wjLdMZ5Ma1KLTk37TazFhGx/8G
	ciOrj91s3HWLKM3V1LMfx//BEcRMqeWmuQrhCaHLQWkw6A0a6Oy5MMcN8peEtJL0/1ZFot/NabL
	pyC9Tl7Rl9UTEoI90YYTdQNsUtmKyU3LhzwwMSQV2KVi1BFrShqzeldLOGNMZr2rccp57W3QqEf
	sAPz4zGNN26x7C6cwa/1cffeSrIxQTt9MFfOsxIQWkEXGfzZGUX5efP0Mjib9y+CNPCoiw4AIWM
	v4Tbiac4MP6G39JYtXRLpuMu7VyrQh0q+VjjRkvK6+zn2VsCL68uqlqxg5mN2Wmo5nBDUfwcDKb
	8iNCGHEqcbfd6krOe5IfLTxyrjv3QhbK3v6kCIeUGy1fJ0MME1Z75tLMfcE7gBwqKy2BuZraEZ9
	wy6QA==
X-Google-Smtp-Source: AGHT+IHN2rRCByXvBOcCxu+sMRbXKBk7KRsBNVCkaZQyEB3qQUV6vuc8byRXkL8JGxu0GXC4yZVBFA==
X-Received: by 2002:a05:6a00:1d05:b0:81f:4a06:6f4 with SMTP id d2e1a72fcca58-81f4a064644mr5925158b3a.12.1768257653978;
        Mon, 12 Jan 2026 14:40:53 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm18505638b3a.54.2026.01.12.14.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 14:40:53 -0800 (PST)
Date: Tue, 13 Jan 2026 07:40:49 +0900 (JST)
Message-Id: <20260113.074049.89091055100612702.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, boqun.feng@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 2/2] rust: sync: atomic: Add AtomicFlag bool wrapper
 for easier use
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <DFMMHWYPIFWB.1DLKD9OLUNGNU@garyguo.net>
References: <20260111050558.3147975-1-fujita.tomonori@gmail.com>
	<20260111050558.3147975-3-fujita.tomonori@gmail.com>
	<DFMMHWYPIFWB.1DLKD9OLUNGNU@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 12 Jan 2026 12:51:53 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Sun Jan 11, 2026 at 5:05 AM GMT, FUJITA Tomonori wrote:
>> Provide AtomicFlag as a thin wrapper around Atomic<Flag> so users can
>> work with a simple bool API for load/store/xchg while keeping ordering
>> controls.
>>
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic.rs | 46 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index 473d3c07e234..c3039289b989 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
>> @@ -622,3 +622,49 @@ fn from(b: bool) -> Self {
>>          }
>>      }
>>  }
>> +
>> +/// A convenience wrapper around [`Atomic<Flag>`] that exposes a [`bool`] API.
>> +pub struct AtomicFlag(Atomic<Flag>);
>> +
>> +impl AtomicFlag {
>> +    /// Creates a new atomic flag.
> 
> Need an `#[inline]` here.

Thanks, good catch. I'll add in v4.

>> +    pub const fn new(b: bool) -> Self {
>> +        if b {
>> +            AtomicFlag(Atomic::new(Flag::Set))
>> +        } else {
>> +            AtomicFlag(Atomic::new(Flag::Clear))
>> +        }
>> +    }
> 
> Would it make sense to have an inherent method on `Flag`?
> 
>     impl Flag {
>         #[inline]
>         pub const fn new(b: bool) -> Self { .. }
>     }

Yes, that makes sense. I'll change it.
