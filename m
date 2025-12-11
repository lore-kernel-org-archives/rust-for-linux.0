Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D32428466C
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 05:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765430260; cv=none; b=JWmWiB6elr6pA1SzP/axjfcjke2TpcPGcJtlu4GJDtb/ZJoe9lVNUprsVOeb/XliVrD5Oa8y9pcpCJvzX+t3BT/Jx5GFapHmd9L/m2tJKrHe4h/RDz4eS8483m8eu+MdM3+d6CgSezt2Q6ua5noa6bPc+qAJypGFU96y/qr+mvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765430260; c=relaxed/simple;
	bh=yCkGtS5Kv33n50vByP7BnLEOhm7vAmdfudm2oVqWIDM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=pvUL68mOeE0/v10LjG4+v7nwxuAGHpUO31OTo9OrGGhL8/hfx3BinO1gg7pGHTb53oXe05VU+/CKTp5xFarR5LzmyZHfENswYyY3No9N/1PrcVS6P4tVbZS1RIyHAXoUwM41LJi0NS4otvUGVcx1VNMTSiGPeOP1cTS4hwdy0Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RmPoTvMr; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RmPoTvMr"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2984dfae043so6939925ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 21:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765430258; x=1766035058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MDQVfc9jny1ANgfo5/Sx0bNFK9c08vXOX/rko0PJSO0=;
        b=RmPoTvMraZ7DCCXUVjiprd3b6AepGO4qnP6BL55db0gzGeGzVGGRW5TqMxpvhzwnfk
         QU7zBfQEXrpmLU5AwhEUy1Pyij79W8hu1Z3FSatAgy7ggIN/aN3vEt7RqVzvF+iucOe9
         bj3hQqeWkY+52ikBrK1omj8MYZbMO2M9IEdNndGMtqSOmEB6vNNkNuYk1SYQWB+XPZJa
         ov6zxMFi6S1Xn2Aggt8eQY/sDBvs/aEyIxiX2Da70uPgiQ/WCH9Bxqv4BDkhNK4szNNV
         4rs6ViPGUeGPHWAO2KT2w37k3EAgqjysladIgwW605FYU350m06E/VPMRr0Qi0RBIwgz
         XAYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765430258; x=1766035058;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MDQVfc9jny1ANgfo5/Sx0bNFK9c08vXOX/rko0PJSO0=;
        b=i1meL4O5WdJNTbEtQKmbi6y1TqMQ48tr52Q5yqtoKEE9wVeK0m2k2dGp1fln4MUeQe
         1I2xijWLXjbQodWv79kN90fRZxX9QsPz7zwanlxH6ckpRUeJnZrqCGn24DfAuiOwUyG1
         CvABTf2niTVfythbmWvk8HwIBpQ4RPJLZvUZ4LOgORXYZjrm6mcIYrtxxYkXeAMRFoBH
         X59HpsdzmVirT3EqSvmB4kg8T6y4DKm4a50afq/qp640LGNYfa6d00hKt/vrzzgQfX/i
         Cr8h+fHbI5v28/F3wCJwqIACw2wm/DK1RtlPcgoCicz0Kok4eqBwNFAikVCTqry8eDDA
         5NsA==
X-Forwarded-Encrypted: i=1; AJvYcCXDaNU2fAXiNBtwAhVJo9z9oKm8g9FAmMBXx9zHUh8gd8bwgVfcCsCQRd+r1aa9Bf7L3MdfxyEYoOPZMJd5Mw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjRz81X+3SBQneAaVLvlHeh9AZtse9Rw2FiORPnJQKwZN7i7dM
	47WSKrgc1GUiEDuv/3TyJh+nAWrAgVP5fhgMBrHHOncijcgzFe7EJQxn
X-Gm-Gg: AY/fxX4rYg7dS3bNpJQU8twDrOXiCKrGGjE9GRfdioqvWBgX7xqUm1ZBcvnbE3WADPc
	xdTBt+aKW93fGHEqbBwSNfe5OwANJDKH6vuO7XXp/ZA5q4cV5Z3KZQdixG/j2+IIg0x5hRnfJ4v
	dFqFGZTy90mAsuXHNwmIG2/9cYq3I5mCR+/HXYepkZGsokj1iv22RzjRqBCk3QB447E4vs7Fpq2
	7qk32pCwZdnGt7OAC46R83qpZ/h47VACOFH0NxKi/piD+YE5ECRy3ousxMk0rKm3VaGhwjSz/eW
	pz03xwcVLh8mWAgr7jEq1odwu0O1GhNOyDANvMac5GtZLz31DZObKHVJNkdKNmyirSyq4DFHfxd
	YYsng6hp7ljLsOID/JQ4/KDcMJM3Ia0ynRrrKsuwglVf47Sct7ecVxemqOSNOoVrIBzPrVv5Ds7
	++EIIFRVk11PQG0wvo8JIarNXYJpiGw7hBXyC/q7fSHzumvCPEDk9F0Up04IuG8QPgd+8=
X-Google-Smtp-Source: AGHT+IGgTC3Fq8juDRbDZ7p6V3W19OPRmRuE87eJTn+gZNqF5NHgw67QHE65AqBwbCnDLNhCaTCkIg==
X-Received: by 2002:a17:903:18d:b0:295:5132:1a99 with SMTP id d9443c01a7336-29ec2d6fc77mr46712285ad.44.1765430258488;
        Wed, 10 Dec 2025 21:17:38 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea0169easm10292415ad.50.2025.12.10.21.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 21:17:37 -0800 (PST)
Date: Thu, 11 Dec 2025 14:17:22 +0900 (JST)
Message-Id: <20251211.141722.56326824426767753.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, acourbot@nvidia.com, alex.gaynor@gmail.com,
 ojeda@kernel.org, peterz@infradead.org, will@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 mark.rutland@arm.com, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aTn_WK-ldlzOxBHq@tardis-2.local>
References: <DET9DDRLLQYT.1LUXV5C3U6ABB@nvidia.com>
	<20251210.083147.1370409203593259538.fujita.tomonori@gmail.com>
	<aTn_WK-ldlzOxBHq@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 11 Dec 2025 08:16:40 +0900
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Wed, Dec 10, 2025 at 08:31:47AM +0900, FUJITA Tomonori wrote:
>> On Tue, 09 Dec 2025 09:27:25 +0900
>> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
>> 
>> >>> Can you document this macro a bit, in particular the motivations for not
>> >>> leveraging the existing ones (I guess this has to be with the new
>> >>> helpers, but following the code through is a bit difficult without
>> >>> comments).
>> >>
>> >> // Since i8 and i16 are not expected to support the full feature set
>> >> // of i32 and i64, using the current declare_and_impl_atomic_methods!
>> >> // would require refactoring it to handle specific types or splitting
>> >> // the definitions. Furthermore, supporting Atomic<bool> will require
>> >> // even more significant structural changes.
>> >> //
>> >> // To avoid premature refactoring, a separate macro for i8 and i16 is
>> >> // used for now, leaving the existing macros untouched until the overall
>> >> // design requirements are settled.
>> >>
>> >> makes sense?
>> > 
>> > Absolutely, thanks! Maybe also give a short explanation for *why* i8 and
>> > i16 won't support the same feature set as i32 and i64.
>> 
>> I could add, though Boqun might have a different perspective.
>> 
> 
> Yeah, I think it's more of an "undecided" stage. The reasons that why we
> want to avoid the same feature as i32 and i64 for i8/i16 are:
> 
> 1. For some architectures, 1-byte or 2-byte atomic RmW
>    (read-modify-write) operations are not supported, they would generate
>    worse binary than designing the algorithm with Atomic<i32/i64>.
> 
> 2. For some architectures, atomics RmW are implemented by lock-based
>    operations on C side, in that case READ_ONCE()/WRITE_ONCE() based
>    load/store implementations are incorrect, because it would race with
>    lock-based RmW for example.
> 
>    atomic_add_unless(v, 1, 0);
>     lock();
>     ret = READ_ONCE(v->counter); // == 1
> 						atomic_set(v, 0);
>     if (ret != u)				  WRITE_ONCE(v->counter, 0);
>       WRITE_ONCE(v->counter, ret + 1);
>     unlock();
> 
>     Hence, we need to make a design decision here, either 1) we make
>     Atomic<i8> support RmW and Atomic::<i8>::load() may contain locking
>     on certain architecture (that also means you cannot use it as
>     READ_ONCE()), or 2) we disallow RmW for Atomic<i8> if they use
>     lock-based atomic.

I was assuming option 2. As far as I know, all architectures that
support Rust today have hardware support for RmW operations, and I
don't expect we would add Rust support for older architectures like
PARISC in the future.

> I feel we are not having the enough data to make the call here, 
> therefore I would avoid premature conclusion in the documentation.

I agree. I will update the comment to reflect that it is still unclear
whether i8/i16 atomics will support the same functionality as i32/i64
in the future.


