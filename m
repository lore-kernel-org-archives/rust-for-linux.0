Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC618C008
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Dec 2025 23:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765323114; cv=none; b=adrIbo/CLPTBOiLR+tSU1g5R7ETi6t1QLGC6DENvOiDUHAGFKYLrw5BAC3k5H4LvlcBcPXu5DiB2LRY2Gew58KtmDZ1zAezR69ORGuWa0LVp+DGtmgUskPfUnAhiyJJugIcyWNX67jM+Bt8g8nvpCAQrW+YqyTizuAXpJ4ux4O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765323114; c=relaxed/simple;
	bh=XH/RVTRviqUzLXdi+vebkSF7CXoi8l8eoAUgf4/GsiE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ckW1o2BVexC3JNoWdiJpSOurb/gwFiT1huNNXM8IeP0jgWkc9gWNmbRw+tWhXuq0tx+KDHF6eoLcCnbpWfpqvNmDXERCPpZu0noDWaUK2H0XMZV3+NgCHONuWzLTqL+dEnliwBeMbivS9ma56aYDi70EWLAwayptKVVVqkxuHLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jiTzsL0z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jiTzsL0z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29555b384acso62926035ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 15:31:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765323112; x=1765927912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/JpyykJChc4+E6bNdj5oQI9BXWJ7FWqfKBT4z47184=;
        b=jiTzsL0zwnX27fsq9PZojfdxfcmIuLLewAjF4LcFsQ6X1v3p75LG34kmaOcjjXL+KV
         QsJF1pSyG8l5eSVBkWnglvYu6Eohgbg9LJC+OtM11sgznN9S1G3W/Bx5k2i1HQdzksAr
         dqNuIikX6qb0N494ru+bguUq34eevQ1nLcpQ4Rwe1pn+iWigdjRGSrkT8P1vEKFsUL2U
         OPwCOKllMwBaeObvbvYG7MZACiCbX1Q7ItKKmEStQTdUiaz3yj9pa3MuEytQbfTNuhn4
         wdJmSqOfGLlcasKw0ODtMvdcGZY7K6d8MdfRdHh2CrwIikoMpL2EDF+H/VLyU0LuD7An
         i8rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765323112; x=1765927912;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B/JpyykJChc4+E6bNdj5oQI9BXWJ7FWqfKBT4z47184=;
        b=az1NqccUC9IVpznEJp+jNdJQVqbezytMZMnGoHLebmMTlaM6GoWD9jDHfh27plp6HG
         wdKQxoZPa0OzsoMxYb22/KgTKDK8ozhxAvlxV6F+3qm67KwozdPp8JVfLXdArqVzUdGn
         FiR9McBKWqEJ1cNdzoSXPI+JTmfiRNlYKQyb41O0zMLjRlHmf1gOUnaB563UtSZj1YGZ
         pNmv81GfLG0IOBtvG9zC7GzEqVj37uuq7m5weEzuQoTbiMDDh1yPaNmZ+SF9FWc3ptFG
         r39aXj49Edc+8qUWRzxMYWwDGtlfleeydNI9Ta+mMzRzb6pRcKB4KZi3ur87h+wYYgI1
         tG7A==
X-Forwarded-Encrypted: i=1; AJvYcCWMCZL/Iq96WCWZMWpryXFWnpcq+Yus8I79tI35fQlJfHUwqVPx4VP8PwEVBYCrNUCkfTTd2FV2RX4devExNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfNsopZFE1nHFMd15RHodQRPRoTJm3YjeNFbvalj15spFswT2O
	C9FhKZG7ubNh41OVv7gDyzBpCUPC68Q1BFVQV0uQjH5IL7ZbZc8UkEkj6d9RqMoF
X-Gm-Gg: AY/fxX4RvwAl7tIR1kK92HW3BU+fUReq2P0uSgPUnJR8X3rWPDVj0vLVRruZp3YfOLZ
	tz1DHI9oNynTU4gyIq1YOszi0vqgFJEf6jfMI+FTSMem9jYrihbs/0Kiiej8Rjsc92bFPHGXYs/
	/773SOo0mq5dONCkl3kUwjKH6sH7clu7RBM0Yv93zuXXB3fTY+A0UPVeVxDyvUUBvXZ8F5KnoO3
	95GdZHNfCVwdXJH+Hlj+al9/mOgHh/frGSN6nCawA7DRU+D/kOeesvTjORaaiiR52TvG5eJcTec
	a6D2ij1fvKAH/wnzxW5hGYAh1Mcm/YFWyrJRcSDtVP8JmqbT2Jmuy+i5YsHH30Okc6DyDOFdPfF
	kNY0y606Mo9mQol9RRDYUvrH/bmcBFyeaB4/eLDbOlh6czWebiIseHp1RqYZF8aPKN2JgWYA8vA
	aVUBC65XH8uEkaumO7ojS03HAfHV0WkFrl+8CyFzpGgTXetlf/Kg1stLj8LZcIclievw==
X-Google-Smtp-Source: AGHT+IGHH+gVf8ObA464cNmP+dlhgdr0ZK9yn/yxIxAX8GHT9qvAliJUEOsHfdeb7L8qpHOTkw/6ZQ==
X-Received: by 2002:a17:902:f70a:b0:295:6e0:7b0d with SMTP id d9443c01a7336-29ec2da56b0mr4419145ad.56.1765323112372;
        Tue, 09 Dec 2025 15:31:52 -0800 (PST)
Received: from localhost (p4783053-ipxg23301hodogaya.kanagawa.ocn.ne.jp. [153.209.99.53])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49caa4sm166857045ad.15.2025.12.09.15.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 15:31:51 -0800 (PST)
Date: Wed, 10 Dec 2025 08:31:47 +0900 (JST)
Message-Id: <20251210.083147.1370409203593259538.fujita.tomonori@gmail.com>
To: acourbot@nvidia.com, boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org,
 peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <DET9DDRLLQYT.1LUXV5C3U6ABB@nvidia.com>
References: <DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
	<20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>
	<DET9DDRLLQYT.1LUXV5C3U6ABB@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue, 09 Dec 2025 09:27:25 +0900
"Alexandre Courbot" <acourbot@nvidia.com> wrote:

>>> Can you document this macro a bit, in particular the motivations for not
>>> leveraging the existing ones (I guess this has to be with the new
>>> helpers, but following the code through is a bit difficult without
>>> comments).
>>
>> // Since i8 and i16 are not expected to support the full feature set
>> // of i32 and i64, using the current declare_and_impl_atomic_methods!
>> // would require refactoring it to handle specific types or splitting
>> // the definitions. Furthermore, supporting Atomic<bool> will require
>> // even more significant structural changes.
>> //
>> // To avoid premature refactoring, a separate macro for i8 and i16 is
>> // used for now, leaving the existing macros untouched until the overall
>> // design requirements are settled.
>>
>> makes sense?
> 
> Absolutely, thanks! Maybe also give a short explanation for *why* i8 and
> i16 won't support the same feature set as i32 and i64.

I could add, though Boqun might have a different perspective.

In my opinion, the reason is that the C side doesn't fully support
atomic operations for i8 and i16. While the C side doesn't support
load and store for i8/i16, we can easily support them with simple
wrappers (as this patchset does). I believe that xchg and cmpxchg
could also be supported easily.

However, supporting AtomicArithmeticOps (like fetch_add) for i8/i16
would likely require more than wrappers; architecture-dependent code
(likely with assembly). I don't think that it's a good idea to
implement such.


My plan is to add supoprt for limited atomic operations for i8/i16,
and then use the i8 support to implement Atomic<bool>.

Once that is in place, I intend to replace the Atomic<i32> usage in
SetOnce and OnceLite [1]. I believe the AtomicBool usage in the
binder driver could be replaced too.

[1] https://lore.kernel.org/rust-for-linux/20251117002452.4068692-1-fujita.tomonori@gmail.com/
