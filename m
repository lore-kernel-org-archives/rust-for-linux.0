Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A602921579F
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 01:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768268728; cv=none; b=Va8pz4GJFS3MVpCclBJQ2cqa0GQTB1xYQUYQhNvqgs9tg5SIm8jKWhWYBUSAY8xUiSJ1kcIHDXnZeYhYN1bzGS93RQkqPczIuI+66Ir6XM8t6rj6i8406vXXwYFIXe0+iQlmD453UjyM+LPF+Wqk45XoIzBnk7695SNcktSSYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768268728; c=relaxed/simple;
	bh=Uobo9SLBU0DwNcaFkYaXmUMdi1ZmqSzr4kmCUz9cAnk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fcqF67HnGxL8ZQgZVG6NRrTW4KRwHX1SKwOsh4yyI8/dhGxWVLhyI4Zszwa5z8Ull7ayyDSzcUO01NXq1QXX7hbEvJdRoYuUlJBx0zSYWYLFgIKFhv/PRHNmiy4g/H6OehSKE/iVhVnWSPZ9n+htPUMSFQyl9uvvpNyS/BLkAHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGeP0XZJ; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGeP0XZJ"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a3e89aa5d0so54592335ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Jan 2026 17:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768268727; x=1768873527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rq8mSmnBZ2KK6Xak0ZjIpBvEWHBPUXPoEpVhrF7RtPY=;
        b=PGeP0XZJSbdVOQGd5J2I6SPTIwjBDZp1itAXkH35VOqkoeJhulZpiQ7YzhFslVWSDM
         vYOsprefp4XzItNPf85SlXF1o7fJ4lZqFe8GFVA/E6KtjfCx1JK0/INx2cZyGcOxxwsF
         YTgkhbMbHjR+OdU/fwWbCDS+VaJANoHqvaw+bPf4CdSVv8hYyQmaqSj9wbzySXjSU1qZ
         TR/Sbp9Lmxv2YH6zntWcwGJWAy5OoxMIAxZN09qkOWhYy8ONBxVztxmhm4zlo+waEIE3
         H/KfIQ1IpxqoKkd/wEZqO7HkYwHhp1cskoKr79m7lmOGImF0/UW119F9fIy/nfeCxNsY
         0gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768268727; x=1768873527;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rq8mSmnBZ2KK6Xak0ZjIpBvEWHBPUXPoEpVhrF7RtPY=;
        b=C7Bv/CPjpyggHmX4gas8QWf2drpGgqFMm9qnOmrhR4IPOFwaishCDzR2UHoRiSjCcG
         OByyWKjvMWEcpd65HTR+M/YshAZ3R2UOih+68tucVh+MoBsZ7uyHBfaiPt+huS4DZ0j1
         +RsjM6MQfdZmerLAygHiZhvolpKz1kJdkdchUMOvpOrCwvFcS9gUv9Vlf2vWITGg/exJ
         w9rmj0jKzzD5qDFEy5BgO8mCknVi9SejyjJhGWJ1XEi3In01oNsIiRAq01MTjWMUTXWA
         zqT9XDQYzG42lJx13WiQyNMPBesPg6VNNvRqM+5qK8g1/bF3SbU9OMCyJ7nHNZIU2nZp
         zxag==
X-Forwarded-Encrypted: i=1; AJvYcCXTNa6TTLq6JzMIHEOmMZYB41PcCbqFMU9lNwiisILX1T85KVdI8aGOA1tJ+U0x0cLMTdFYXVLU5JSX9R3uQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/5WCxOLYx5soCewiKLUQNpRmmdtG7Aucszo3z1Zdb8Vmm2vT
	dGoU+ph7BgdTTP0xQ6CD8W4vt/TCM/SxifxpYcpl8MDow9/M4lJxKgsF
X-Gm-Gg: AY/fxX6pK/OqA7w+HAOG8S7ZtkuBSncs9KQ7ul+COo3F/2eip4x1yIZfp/1D3pR+NkD
	osHmvjzKjJi2lQIMBmJsKTGGClw9OshDnNZSeLtTjjy9t3qOsBaG89Z/UZ6r5/c8KiuAqeU/pFR
	EkYRYF/Hn/JN8QWZYt+0d5/Iz1jWtIxbEubYT0EK4HKnOtOSlpvGBCr7WipCnms5NKMmo+EpQIE
	vOFjbsizhL8ZBNk7Tp0yF3PctnkvAY3DSIj/odg44sUXMEeMkznVjLZb0spBvps2qyKiJw8IXyy
	6JUSjJEaUKXEEgRYo1iRcA9hg+jiv/aUlxQf6eU5eG6Tqm89/yFNVy99MdEnyBd2KKIbTSCAhan
	dcdBj1WqpWAaiWcVaAhmiowh90Os+Gzys3418yM5mtkCJ3py3BZH2EQn4XAsQNLeqja3kJD7+Md
	JSxt+YpUUmEsHKNlcO2GXWODNdkFDSW9zFttd6nkFrF+N9eShDyPvm7Wco+/1X/8vym5+XbxaPL
	PPHKQ==
X-Google-Smtp-Source: AGHT+IFji2bFZ+ftmYNANnzm0k9xkLq7awR2lzzeHETSVnckhPTfpfcQcv0/XxTfVTHNw2a9g//3Xg==
X-Received: by 2002:a17:903:3d0b:b0:2a0:d527:4d08 with SMTP id d9443c01a7336-2a3ee49e03cmr202278035ad.41.1768268726909;
        Mon, 12 Jan 2026 17:45:26 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88d8sm183839435ad.80.2026.01.12.17.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 17:45:26 -0800 (PST)
Date: Tue, 13 Jan 2026 10:45:22 +0900 (JST)
Message-Id: <20260113.104522.664001916919689669.fujita.tomonori@gmail.com>
To: gary@garyguo.net
Cc: fujita.tomonori@gmail.com, aliceryhl@google.com, boqun.feng@gmail.com,
 ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
 a.hindborg@kernel.org, bjorn3_gh@protonmail.com, dakr@kernel.org,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 1/2] rust: sync: atomic: Add i32-backed Flag for
 atomic booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <DFN28YJ5LQ3K.LEWE16Z5EXYF@garyguo.net>
References: <aWS8aPuBRTKIjTZu@google.com>
	<20260113.073003.1666900745205693004.fujita.tomonori@gmail.com>
	<DFN28YJ5LQ3K.LEWE16Z5EXYF@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 13 Jan 2026 01:12:29 +0000
"Gary Guo" <gary@garyguo.net> wrote:

> On Mon Jan 12, 2026 at 10:30 PM GMT, FUJITA Tomonori wrote:
>> On Mon, 12 Jan 2026 09:18:32 +0000
>> Alice Ryhl <aliceryhl@google.com> wrote:
>>
>>> On Sun, Jan 11, 2026 at 02:05:57PM +0900, FUJITA Tomonori wrote:
>>>> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
>>>> users can use Atomic<Flag> for boolean flags.
>>>> 
>>>> The backing integer type is an implementation detail; it is currently
>>>> i32 but may change in the future.
>>>> 
>>>> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
>>>> particular, when RMW operations such as xchg()/cmpxchg() may be used
>>>> and minimizing memory usage is not the top priority. On some
>>>> architectures without byte-sized RMW instructions, Atomic<bool> can be
>>>> slower for RMW operations.
>>>> 
>>>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>>>> ---
>>>>  rust/kernel/sync/atomic.rs | 56 ++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 56 insertions(+)
>>>> 
>>>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>>>> index ca9cab77abf0..473d3c07e234 100644
>>>> --- a/rust/kernel/sync/atomic.rs
>>>> +++ b/rust/kernel/sync/atomic.rs
>>>> @@ -566,3 +566,59 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>>>>          unsafe { from_repr(ret) }
>>>>      }
>>>>  }
>>>> +
>>>> +/// An atomic flag type intended to be backed by a performance-optimal integer type.
>>>> +///
>>>> +/// The backing integer type is an implementation detail; it is currently [`i32`] but may change
>>>> +/// in the future.
>>> 
>>> How is it, could we make it u8 on some architectures without penalty,
>>> and have it be i32 on others? Or is i32 better always.
>>
>> Does the following look reasonable?
>>
>> #[derive(Clone, Copy, PartialEq, Eq)]
>> #[cfg_attr(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64), repr(i8))]
>> #[cfg_attr(
>>     not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)),
>>     repr(i32)
>> )]
> 
> The arch list looks correct to me.

Thanks for confirming.

>> pub enum Flag {
>>     /// The flag is clear.
>>     Clear = 0,
>>     /// The flag is set.
>>     Set = 1,
>> }
>>
>> #[cfg(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64))]
>> type FlagRepr = i8;
>> #[cfg(not(any(CONFIG_X86_64, CONFIG_UML, CONFIG_ARM, CONFIG_ARM64)))]
>> type FlagRepr = i32;
> 
> This doesn't need an extra typedef. You can just put `#[cfg]` on the associate
> item below.

Got it. I thought the type alias was cleaner, but I'll drop it and put
the #[cfg] on the associated type.
