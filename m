Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0321CDFD5
	for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766826768; cv=none; b=OnNoJNTDmLFwhPtXlmJYvvBjfO9EfcQZmJlFYjh4oSsU7pblxe1LhKhvigdXqzHoHoK0GBfWjFM6Znt5jRLBSl/MKlfKyVPa9qFMFKVcqIbt2jntpOUt3TxfbytwUQUq3dBFSArSZf2+aklQ8gRcQx1WZ9y4t04t7MjJz7pNbBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766826768; c=relaxed/simple;
	bh=OS8jQip9W17PmWumrJHWv6q021gKDxLRI9AcpUo9AMk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxLGVxMFOWJM7gnyoceqhczf2t2S5u7LFE9luuo0XiYVzHCB7Q9oWSfWq9Fbjx0+9QE7dnoHE0mZAK+RbLiu6eOG/B9V2YVpAwaszZfRJWDCrzx2fbayUOCynIpICSIigZl3M2I97vOIqenxXQ7zTvEo6sRVsg2SsH8xkMznuu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QudkjJKr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QudkjJKr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso41807685e9.1
        for <rust-for-linux@vger.kernel.org>; Sat, 27 Dec 2025 01:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766826765; x=1767431565; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Ou5PXW11QDxSo4bKxOi8rtihGZrPBEpHn1rKoeHKTc=;
        b=QudkjJKr4H6oywZ2ggvBd05ef0BTsNLFrzD6oK204O8GM3y+pXO+84gRXzrDScynei
         9wey0PEyWptD149ElB0TeSf87zrcM1JxPiAbImWpDZ2SO3ZBUIqKw1cSQRodIE4nKpws
         DWaTOFUofHfGabqTKOHGrkKlqFRSP5J0Ib0Oi4l72npWdfumvjn8VG8qjhvn6C1zyO+n
         STYCnNfnp0aU/7aEFu1z3kKC+v1lCl9bokAVovQElFZ5AMR343GTQ9Q+HCI+ZW3GCk7P
         gEF/utFlNpmccW3xqlvJshS1UJS9pJnbE0rLXqgse8w24XRFO62cCyj3BlMfLOzAhU3v
         Y/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766826765; x=1767431565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Ou5PXW11QDxSo4bKxOi8rtihGZrPBEpHn1rKoeHKTc=;
        b=BwWMtXtVJpLmOlAuW8S6f9he3RxaH+X/QLlo4u3xSasFSYn3pxLYnq/09+FeSe3mbX
         z1YMR90nabezuG8S70yO0KF0IGgEtM+KkhQi6KyRlQPsuOd7I+0/lSjB7E87Dob9J4J1
         NBh8rFCG2N10RxRboS/q1OPeg2DgcmEXO+RUswROCjzfPEZ9bnNhL5E9rDmCciSUu0YL
         jN3/oaLhEoaSuzVQldyUdyViuhNcqcYIRJlE3N/IIBzAopJ/KW8qCzF5mbxSwiwtbZL4
         dbYtKXL6An9bAKa7NVWk9Vh3VutEnx3iDpokbb7R9jxmLuPH/P+dffTg5tcGrDC3hFzG
         cE4g==
X-Forwarded-Encrypted: i=1; AJvYcCVlXSHw9csZC7n8ku0yDWzdFGl3twGw2tXypWEy/4a1P6y/JOovfAc26vHvid1TTcCmfetN4XKT25BNwfiWLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxynbgHlxG1aMOj/1s0Nu8mj29Bg5SrD7Yv7XbZNp7QY+pNvo4X
	oip9a5jdhDd9r+5bMVnRg94Akz5ez/lckp6XFCbFTQgbdwlHwLNl//kk
X-Gm-Gg: AY/fxX58YsiHkRez6oJRYuZh7Fi1ObiKGcLxsmHGyB/rb388nBKVfo72nwpHRzlvlNd
	Knkp26nozVr2lxmg/hL6yhnC1yThrPU018Iut3X193LE+Edh2o4of47Xj+uTMn6Is1o7beCXoAP
	QGzG5e8ZIL4TheXam5psjpbwKjTaGtqTdlTgYkr8J1qN+e2xkebwMvo1oeOaCJqF2/pRFeIHozM
	baSdFwoznK3iUC31IO3rTZkyLYwYUXg5SjDLjBXPGP+gPZPcAILm7Nn/X5CejVZnmF8pUZEUFeL
	jkserAgv9RdGfH2trl4sFA8Ybg+p4zpCpDO/xbxy36qx4cVDXGt+fPDRoLtCTwPn84W14pm4bKD
	WWY7tcm0HJRIqFAO2NNH1RX8DfM4GK/hZPwfqqd7/xPBHvm0aL1PEAeRUhn5w+XDpX8OAxNSF+O
	3oZbw6beIDDj0756CQG6MZcuy5ac49gk6k0CeBkxyftHXtZHzIdHAAlstUSudYXLOQHsOjYOirU
	RMww1OX+Qfx1gqQzyXq23DkIoPQinKXMqgplOGDeiuN6RFWMNTysEP/
X-Google-Smtp-Source: AGHT+IEAuoFmInA9mcH2TQH4+wemOLAT9ZSTmBMDJSZPdHTx7j9Rx2oManPJfHyh9knGDT0kwXr7/w==
X-Received: by 2002:a05:600c:828d:b0:46e:2815:8568 with SMTP id 5b1f17b1804b1-47d20502f98mr210957945e9.10.1766826764451;
        Sat, 27 Dec 2025 01:12:44 -0800 (PST)
Received: from ?IPV6:2003:df:bf2d:e300:38b0:3e8d:cb9f:cb0b? (p200300dfbf2de30038b03e8dcb9fcb0b.dip0.t-ipconnect.de. [2003:df:bf2d:e300:38b0:3e8d:cb9f:cb0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3af6dbdsm195227665e9.19.2025.12.27.01.12.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Dec 2025 01:12:43 -0800 (PST)
Message-ID: <2afd3415-98cf-4baa-8845-242e163f391d@gmail.com>
Date: Sat, 27 Dec 2025 10:12:42 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] rust: Add safe pointer formatting support
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@gmail.com>,
 Ke Sun <sk.alvin.x@gmail.com>, rust-for-linux@vger.kernel.org
References: <20251227033958.3713232-1-sunke@kylinos.cn>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20251227033958.3713232-1-sunke@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.12.25 04:39, Ke Sun wrote:
> This patch series adds safe pointer formatting support for Rust kernel code,
> providing three pointer wrapper types (HashedPtr, RawPtr, RestrictedPtr) that
> correspond to C kernel's printk format specifiers %p, %px, and %pK.
> 
> The implementation ensures that raw pointers are automatically hashed when
> formatted with {:p}, providing safe default behavior that prevents information
> leaks about kernel memory layout. Users can also explicitly use wrapper types
> when they need specific formatting behavior.
> 
> ---
> v6:
> - Fix placeholder formatting to use `f.pad()` instead of `f.write_str()` in
>   format_hashed_ptr(), ensuring width, alignment, and padding options are
>   correctly applied to PTR_PLACEHOLDER


Thanks! The doctests look clean now :)

Dirk


> v5: https://lore.kernel.org/rust-for-linux/20251226140751.2215563-1-sunke@kylinos.cn/
> - Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs using kernel
>   vertical style with alphabetical ordering
> - Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed Clippy warning)
> - Update type ordering to alphabetical (HashedPtr, RawPtr, RestrictedPtr) in
>   fmt.rs macro invocation
> 
> v4: https://lore.kernel.org/rust-for-linux/20251225225709.3944255-1-sunke@kylinos.cn/
> - Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve formatting
>   options (width, alignment, padding characters)
> - Improve code structure: reduce unsafe block scope, use early return pattern
> - Add doctests with formatting option tests for all pointer wrapper types
> - Enhance documentation with detailed formatting options section, including
>   examples for width, alignment, and padding
> - Fix RestrictedPtr example to use pr_info! instead of seq_print! in docs
> 
> v3: https://lore.kernel.org/rust-for-linux/20251224081315.729684-1-sunke@kylinos.cn/
> - Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
> - Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
>   rust/kernel/ptr.rs corresponding to %p, %pK, and %px
> - Make raw pointers automatically use HashedPtr when formatted with {:p}
> - Add documentation for pointer wrapper types
> 
> v2: https://lore.kernel.org/rust-for-linux/20251223033018.2814732-1-sunke@kylinos.cn/
> - Disabled {:p} raw pointer printing by default to prevent accidental
>   information leaks
> 
> v1: https://lore.kernel.org/rust-for-linux/20251218032709.2184890-1-sunke@kylinos.cn/
> - Initial implementation that directly printed raw pointers
> ---
> 
> Ke Sun (4):
>   lib/vsprintf: Export ptr_to_hashval for Rust use
>   rust: kernel: Add pointer wrapper types for safe pointer formatting
>   rust: fmt: Default raw pointer formatting to HashedPtr
>   docs: rust: Add pointer formatting documentation
> 
>  Documentation/rust/index.rst              |   1 +
>  Documentation/rust/pointer-formatting.rst | 101 +++++++++
>  lib/vsprintf.c                            |   1 +
>  rust/helpers/fmt.c                        |  65 ++++++
>  rust/helpers/helpers.c                    |   3 +-
>  rust/kernel/fmt.rs                        |  69 ++++++-
>  rust/kernel/ptr.rs                        | 241 +++++++++++++++++++++-
>  7 files changed, 476 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/rust/pointer-formatting.rst
>  create mode 100644 rust/helpers/fmt.c
> 
> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578

