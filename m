Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A614E3CBE69
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 06:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784271004; cv=none; b=Xs+gMdVSLoqlZipTvLBC/PBcnwVw4VClHRVhttbxfQWFXuNe4n29Tr6sgVATN/V2SMrS/93eVvmQzwLxpsHIe5bx+R+0Y0PVwGCJrRYGukbTxhKSd7Z/YyCgWxFCG/E/NTImQRSf5N7uANSo5jdZZkK7XSm+aYbJIADOvMD0y5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784271004; c=relaxed/simple;
	bh=D1mrFldeNqG1YbnhoVS/JmMoUGyIme/bYBnoIcTtcSk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KgmzV/m4r+jbUtg3M51tIH63XyO3LxeugnfhQLWHuwlSgtxBWGREXrdyP9kxQ/LLl/+QKUQfeh7mMbA5C/e9nocdwMS/H23kQIANJivioGEaCxK3C9SJcjU+Di5wjDkVil/aRzJh+29r3N2d4qZZKw124qjmH8WIsca3gVTzsag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g1MkrjJh; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g1MkrjJh"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493b0a5e636so67774995e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 16 Jul 2026 23:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784270998; x=1784875798; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3IIUFS6P5p7QPQ9HP1ejsEO54asX/PUTcjDZAC8qfc=;
        b=g1MkrjJhv7LVSZbqaDUlWThdIJhHPKIEnyGFjd1PrMFfT+P38f7/44Azk3IzUt0Q55
         svXj6hV/841/UqonHplODHUk8Cxo9fEbnEWWbiLkydBM2PmGQg1ck9ic0qNGKplRpILH
         4vcZYMtW079IrdY8g3eeV7F+3jnY60TxIWqEIqmv+8m/YXkiJ4aNy0hhsJrQ8gJ35ana
         cTmrrfWHlP4Ofo7g6qWndpv8AhkqYntUYg0I4Hk8Uo3MPxeUFN2wa+XjC3BEiMblpc5f
         zasuH5in+VUyaMvwhbN0cHNX648VXGP6V4ZrjFgW83iv6X+r0vp4JALKQ5ruGCjGx7Xf
         j64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784270998; x=1784875798;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f3IIUFS6P5p7QPQ9HP1ejsEO54asX/PUTcjDZAC8qfc=;
        b=RYKBmvTvopikRQerHXWQoudHDb4qUoRtN5QDGZW0MTFWqmNnq5sH/n6Iz3aUSzu5nY
         rK4vD5NCBAu3Y/QAqFAUPamfoHQ5kYF2euJD6Vc8l8N4zYCLFgPBa06Od1S+pHjzvZGu
         OJn3Tl1ZgSvWox5kkAYx3IfikO82CLavnZ87riFKPwa7egbi7uQGaP7pLvae1uY0LLcn
         nu6gL0dWCQueAhGVK/ZyJtfgkvf6qFZG+41DVyCw+pVBT/UYPBWdzrRVjwzeYqOuuUTL
         /qkSudDKFX67iz8MQnFHYOhT4aG/OfBEx7ypOSyu8TU7H8GqAWFQB5VlxsWZDIW9vA1w
         X8cQ==
X-Forwarded-Encrypted: i=1; AHgh+RqfVOR9cfyAhnqUBLoTOhxSSAUFs9i2WXuYif/oYDiiGizgWofiZSHKHI1xpjkvelr36OHbVJ4Tff7vDWwaFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzyT2MfG58FYgQhEUPQR3oLoKgpckgWHfLf1/WmF2FSFVlKmT7R
	p/xbj1P7L3gfCz2pGxAoTZy6lGXakgAQQkS0ISvZCXCwfbwMYcf9hdD/YPJG7oVU3mZn7vxKgFn
	JdBT4Pb+tu3hGQDdMsQ==
X-Received: from wmqj10.prod.google.com ([2002:a05:600c:190a:b0:493:b636:4ee9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:2e52:b0:493:f807:1a79 with SMTP id 5b1f17b1804b1-4954a410669mr8621755e9.27.1784270998176;
 Thu, 16 Jul 2026 23:49:58 -0700 (PDT)
Date: Fri, 17 Jul 2026 06:49:56 +0000
In-Reply-To: <20260716-b4-rust_binder_impl_flags-v1-0-b4201d3f15b3@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260716-b4-rust_binder_impl_flags-v1-0-b4201d3f15b3@google.com>
Message-ID: <alnQlHQkPwbDlxY9@google.com>
Subject: Re: [PATCH 0/3] rust_binder: Update bitmaps to use kernel::impl_flags!
From: Alice Ryhl <aliceryhl@google.com>
To: jahnavimn@google.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 16, 2026 at 01:02:33PM +0000, Jahnavi MN via B4 Relay wrote:
> In the current Rust Binder driver, internal state variables (thread
> looper states, deferred work, and transaction configurations) are
> represented as raw integers and manipulated using manual bitwise
> operations.
> 
> This approach lacks type safety. Because the compiler treats all
> integers identically, it is possible to pass a thread looper flag
> into a function expecting a transaction flag without triggering
> compile-time warnings. These cross-contamination errors compile
> cleanly but can cause runtime bugs or undefined behavior.
> 
> This patch series resolves this issue by migrating these raw integer
> bitmaps (`defer_work`, `looper_flags`, `flags`) to strongly-typed
> bitmasks using the `kernel::impl_flags!` macro. Functions now accept
> specific, distinct types rather than generic integers, preventing
> flags from being mixed up. This transition also replaces manual
> bitwise arithmetic with readable, safe methods.
> 
> Based on top of:
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> 
> Signed-off-by: Jahnavi MN <jahnavimn@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

It would be nice if our impl_flags! macro could allow us to omit the
right-hand-side that's saying `= bit_u8(i)` here:

    /// Represents a single deferred work category.
    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
    pub enum DeferWork {
        Flush = bit_u8(0),
        Release = bit_u8(1),
    }

After all, if we don't care what values the bits take, the macro could
just assign them for us.

Alice
