Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA9C27E1D7
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 11:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763032741; cv=none; b=GDLd3Dags5BGR9q0VAsczKG7ASMlHATxpsA3yZfKzwgOf34SdweU0DUOB62nBk6wIGubXPLA2J+Ih8oLAwTFZhDBl3dIznPEHXTT+ytTXaCRoPn5YaN+OONjYfvS1qIY9AWGAJqlChb+xkTCJYcTn+2WEuMH5u/KTnQu7lhOtLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763032741; c=relaxed/simple;
	bh=px5mJqwS3eN+Q6fkLrFQJ5T0ZHfSFMeAoSEEp8MOTrI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fitiKQr0eL/SLqMeMbTh/FwOu9A3mgvPeO+Ji0W8wmHbeO/5ovFOw1knBB9UpbMN00jK2+ykkqgSTVnSr91TRI0LKy/aiQqtFC5v3jA1IQQSmT0vO0vc313RndSX1TYrEXngRQ1zDhHf6W0OTdQhtwt+NAEJrchoeDSw9oI/ymM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DkNeIiAX; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DkNeIiAX"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7aab061e7cbso705839b3a.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 03:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763032739; x=1763637539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0YNIzIu22uiiz0mxGtMBpFIWjPETro/ppwvr0tw+Pc=;
        b=DkNeIiAXQEhOgpPOVNYwzGxhcTDEVRB7jetO+TmbM8ML5p9tpWgsJV0q1mMhZ3t//v
         BidSPHmEq8Q6+z3RXNZiFbzLZF3pnauWtJ/LGGmq/ile7IJ64wEcnpawfhYvnzgZvW2B
         GlqlRwJ6FE0moOyUjdEztCdaXIglWlKAasez9JfUnBw5VkDDH9camjBRmNqv19tra5BW
         V/WaVChmwPIlxF692n92mKByLNZ2HaU9BXSu866ItjH3kapyYejcumSt05so0cqxj+wB
         E3NrpHrCC0pk8pRs8DBLZQnqpH20GLkES+C1uNh/UFA+LBfA8ZPuGHIJI5njoYoc6XId
         mdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763032739; x=1763637539;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H0YNIzIu22uiiz0mxGtMBpFIWjPETro/ppwvr0tw+Pc=;
        b=TbGU9iBEhev150sW01MCXw1STfBnZbaa7u40U0A9aSvkQWlpIOvf0weeg1PwtBX5Y+
         iyngPhzDJ9s89VTicma5m+DpCOb+vFr+twbGjfBo32zQsw0/us2DkdPcQfIy6sibCHHh
         CX2+OGLnpNym0I8no1LpvWOR7RcyL2pmYTWCHv6WBfJqjGoLdpo5Jzf0giCSl1cnk1kR
         3kwX26yTbn1LNjYE/feCylCq/rOFLwkaKkFa2Uu+ialOG1RKLRJGTAfhE+nl4/GQPxQO
         WFLvAj6jkYDdmQ9iUMhO8yVG5a+fS1BfDDUVsKzHXhyhtm98/F1a5JIbGtL2bPTgfDJN
         /itQ==
X-Forwarded-Encrypted: i=1; AJvYcCV59rDhlhy4o7B1fvIIMFOZskPUClKyNc9RDeSuFFCtLV+r+vcdHn0X6sZW42Ij2qSJFNFiwMXXYazC0gcchQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzksD5o9Hnix8q3/WRfSe9JyzKxY/OIQ8j8zOlVCbO3H3Y+KCk/
	/5OPoyokh5pS9JO0ayBW7aTBx2eFSpa1Pm+M+k1nDLyJLl0ybAovIZUb
X-Gm-Gg: ASbGncuW2K8cXVN5XQ8pViO1iRtGTuBt7q1eG63N/TqEXkeuQ3GzGjyAh+ZbXzUk67e
	eybwxtYVFQE79/huQ10HzSC8EhK5jIeUKS0nPtjGXEs812RzSiDcYcv2nlR0jpLRt178YHscR6C
	tR4EsYOUnNiW+nVZG7eZCQQ6ii/KElMnyisCiKzfZu/gPkLEpJ3tAjWLU94cI49vIPxpToKFIFD
	qZ0XZ66EaB3mR+F9FJ5DOX9h1c1JI6pIiOF8o5Id5Zm3D+0n0RjzDzouuZfsysXS/EXloNz2kTG
	D3/XT36Ok1KESlcs9N1GYiPAZ6pm8pQV2OBhcnnNL+oA1J4l03K8ZIjcxl6EJ1KsrmpGDFJeqtu
	nExPzMGBdb86iQI3pzhTupPehs9NcBWNxxRnhzrT3hpC2e8rPKtdmP+mvcO5uBjmib2XZSn3sAt
	/9A0ZZdzGJ2fEWt5LSoJRGla6H9L1xW8ifo3tyf8SSDQ9tcEZyLOZZXA==
X-Google-Smtp-Source: AGHT+IFMQwz4IO52o2f0gprc7FuYEtmCSHF4UuwHPZvpQ047cmK3l9k1adYs62mCV0kQYm1qF1mPYg==
X-Received: by 2002:a17:903:11c4:b0:298:90f:5b01 with SMTP id d9443c01a7336-2984ee21128mr72795845ad.52.1763032739021;
        Thu, 13 Nov 2025 03:18:59 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2bebd6sm22452935ad.79.2025.11.13.03.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 03:18:58 -0800 (PST)
Date: Thu, 13 Nov 2025 20:18:44 +0900 (JST)
Message-Id: <20251113.201844.1009485179863259148.fujita.tomonori@gmail.com>
To: aliceryhl@google.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
 gary@garyguo.net, lossin@kernel.org, rust-for-linux@vger.kernel.org,
 tmgross@umich.edu, jens.korinth.tuta.io@kernel.org
Subject: Re: [PATCH v1 0/2] Add support for print exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aRWt6Ah8KuBXff8V@google.com>
References: <20251105054731.3194118-1-fujita.tomonori@gmail.com>
	<aRWt6Ah8KuBXff8V@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 10:07:36 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Wed, Nov 05, 2025 at 02:47:29PM +0900, FUJITA Tomonori wrote:
>> This adds the Rust equivalent of the kernel's DO_ONCE_LITE and
>> pr_*_once macros.
>> 
>> A proposal for this feature was made in the past [1], but it didn't
>> reach consensus on the implementation and wasn't merged. After reading
>> the previous discussions, I implemented it using a different approach.
>> 
>> In the previous proposal, a structure equivalent to std::sync::Once
>> was implemented to realize the DO_ONCE_LITE macro. The approach tried
>> to provide Once-like semantics by using two atomic values. As pointed
>> out in the previous review comments, I think this approach tries to
>> provide more functionality than needed, making it unnecessarily
>> complex. Also, because data structures in the .data..once section can
>> be cleared at any time (via debugfs clear_warn_once), an
>> implementation using two atomics wouldn't work correctly.
>> 
>> Therefore, I decided to drop the idea of emulating Once and took a
>> minimal approach to implement DO_ONCE_LITE with only one atomic
>> variable. While it would be possible to implement the feature entirely
>> as a Rust macro, the functionality that can be implemented as regular
>> functions has been extracted and implemented as the OnceLite struct
>> for better code readability.
>> 
>> Of course, unlike the previous proposal, this uses LKMM atomics.
>> 
>> [1] https://lore.kernel.org/rust-for-linux/20241126-pr_once_macros-v4-0-410b8ca9643e@tuta.io/
> 
> There has been a fair bit of discussion below. Here is my take on the
> way forward:
> 
> 1. OnceLite should be it's own special type, and it should be in a
>    printing-related module, not kernel::sync. The reason for this is
>    that do_once_lite! is hooked up to a special section that allows you
>    to reset the once status, and if someone used it for anything not
>    related to printing, they would end up with being incorrectly reset
>    when someone resets pr_warn_once calls.

Do you mean that only the do_once_lite! macro, which places the data
in .data..once section, should live in a printing-related module? Or
should everything including OnceLite struct itself, also be moved
there?

> 2. I would suggest just using a relaxed load followed by store instead
>    of xchg. This is what the C-side does, and I think there is no strong
>    reason to deviate. It allows for a single byte of data instead of i32.

You meant best-effort try-once logic like C?

pub fn call_once<F>(&self, f: F) -> bool
where
    F: FnOnce(),
{
    if self.0.load(Relaxed) == State::Incomplete {
        self.0.store(State::Complete, Relaxed);
        f();
        return true;
    }
    false
}

Using u8 as atomic type instead of i32 would require a fair amount of
work, since at the moment only i32 and i64 are supported as atomic
types, right?


> 3. If we *do* decide to use xchg, then the xchg needs to be guarded by a
>    load so that we avoid a write operation when it's already cleared.
>    Many read ops are much cheaper than many read/write ops.

Make sense.

