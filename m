Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E30290092
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752067390; cv=none; b=feTGJlPXxNkOK6AHjz2e5BPfMt8WmzI9lDBo4cQmggqJ/EGGtny45Ulh9TCw2YGiEZ0N+b+YdxWBrJqsqRP0u6x/sJTmHHV4Qv7f8qJ0dqIsO9b9/jcYbaSV2wINJepf6mDRf32coLW5ZfJdL8dlZWhf1TLgKAySSRGmcMF/zcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752067390; c=relaxed/simple;
	bh=oLihLmGKr765QwW6yOTYbdJj4ra7Xr28+HppMym6oZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p1cXnaib2xq1hWCtcN6F0Z9OcM/VIDstVIfkqcTIgW2hra7v5MJDT7QF0DNOiTJ+GsycNjo+O7AOvlEvQtt9prSU6UKkPjo0/OxH3n86EpJE2YjWfupw5u2QDYdAp84pPPcORHp5EDndQ1D9U5FTkhvl7eFyUiIifABEa4cD0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KIifaTmK; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KIifaTmK"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-453691d0a1dso32078775e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752067387; x=1752672187; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kgEZMQ9Ie8rjRKEQijQn/j/EhVux9NWCg6JTzmKrPW0=;
        b=KIifaTmKkAz5cVAvvU0Cq9tTSVHCVLmxg0mVRHamICmO/nVY8Bu/IZV0jDH2Krrb8X
         tlU3bH3Wb6BqEswLmI4LGro6LZwLOOUX6vHDvTapdUHCxQQlBZ0ljsDprQvmuep4fMFZ
         1A7a6344CStfafQaDgh3P3h5D8cUhMD2yE0XQuUOcrSuzDO8Hj/QOEDDq8VYQv0xQL8a
         6q7ooquVYGC5aZP8QJHuhBKKxuQ8OjwxKH6eWbFXYTTnXRAD5JsUTfN1PrZXYqG9x7HG
         iWG7hemQ77wWclhBtHod5HeoksxREHSX7VABBGqMz8dw79E3ruKVM9SXqMM6+F5YR811
         WWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752067387; x=1752672187;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgEZMQ9Ie8rjRKEQijQn/j/EhVux9NWCg6JTzmKrPW0=;
        b=MQeN+Z8/GkFkKLfykI06VE+aQrsHNqos8eDFDNByTt5fktjPmspQZiCE/Mp3bfd910
         0xDLSgNjAU1lRr2FpUC0VMnG8+uRVjucHHwxDrt6EvaxWRnedqxDaIRxWKFaC/Vlf4qs
         0nqTba0iPzk+IF0GJsNzeRvrI+sDaT6mASBmKYY78Zgm5wpBV2gIk7hmigv6jMQIRAnw
         6OOTP8ha23ZayTwKx3mX0k64hExaA4cG6PRaUUFc3JwqLZX/5Z2Wj1KI6jj1A/Zpyw6W
         4dyAQdnP3RIVSfZE+Y8wvn3S9HRnpEyROo5Iv5/gnIHaXz+ZlTlFWmusGzdM7FR3r9qr
         a4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWUM0xVeTyu+m/Pa9eG1JESy4I6jlqOrUERvaaEKoMNfPpgdxLfcfKOg3h3zAWDFFWJxaRs9yhrD08PL1ungA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp0/t4EqYk384hqL8yuDlzW1OTi2Na9ILXGBKEWJvA0f8x0lim
	MAntkoXIr2DRaYJrysi+ICdJSsJjJ+mzE2UsINpQKgxMYQNoMAjoIDZNFuOBOgtNq5eiw+P7tht
	9TwxnSsc2JNE1Z5Ex1Q==
X-Google-Smtp-Source: AGHT+IHb5fOkVKQdzNuZzdCQyevCzD2sZ596OHAKOrb01PKV0SZTCwDTR8YFS/+ZmLNpsMuKr3dLp1O8HwuNHMI=
X-Received: from wmbez5.prod.google.com ([2002:a05:600c:83c5:b0:453:ec2:c7bd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314c:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-454d5311363mr24682575e9.2.1752067386947;
 Wed, 09 Jul 2025 06:23:06 -0700 (PDT)
Date: Wed, 9 Jul 2025 13:23:05 +0000
In-Reply-To: <20250708-rnull-up-v6-16-v2-3-ab93c0ff429b@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250708-rnull-up-v6-16-v2-0-ab93c0ff429b@kernel.org> <20250708-rnull-up-v6-16-v2-3-ab93c0ff429b@kernel.org>
Message-ID: <aG5tObucycBg9dP1@google.com>
Subject: Re: [PATCH v2 03/14] rust: str: introduce `NullBorrowFormatter`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 08, 2025 at 09:44:58PM +0200, Andreas Hindborg wrote:
> Add `NullBorrowFormatter`, a formatter that writes a null terminated string
> to an array or slice buffer. Because this type needs to manage the trailing
> null marker, the existing formatters cannot be used to implement this type.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/str.rs | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
> index 78b2f95eb3171..05d79cf40c201 100644
> --- a/rust/kernel/str.rs
> +++ b/rust/kernel/str.rs
> @@ -860,6 +860,65 @@ fn deref_mut(&mut self) -> &mut Self::Target {
>      }
>  }
>  
> +/// A mutable reference to a byte buffer where a string can be written into.
> +///
> +/// The buffer will be automatically null terminated after the last written character.
> +///
> +/// # Invariants
> +///
> +/// `buffer` is always null terminated.
> +pub(crate) struct NullBorrowFormatter<'a> {
> +    buffer: &'a mut [u8],
> +    pos: usize,
> +}

Do you need `pos`? Often I see this kind of code subslice `buffer`
instead.

> +impl<'a> NullBorrowFormatter<'a> {
> +    /// Create a new [`Self`] instance.
> +    pub(crate) fn new(buffer: &'a mut [u8]) -> Result<NullBorrowFormatter<'a>> {
> +        *(buffer.first_mut().ok_or(EINVAL)?) = 0;
> +
> +        // INVARIANT: We null terminated the buffer above.
> +        Ok(Self { buffer, pos: 0 })
> +    }

I would probably just use an Option for this constructor.

> +    #[expect(dead_code)]
> +    pub(crate) fn from_array<const N: usize>(
> +        a: &'a mut [crate::ffi::c_char; N],
> +    ) -> Result<NullBorrowFormatter<'a>> {
> +        Self::new(
> +            // SAFETY: the buffer of `a` is valid for read and write as `u8` for
> +            // at least `N` bytes.
> +            unsafe { core::slice::from_raw_parts_mut(a.as_mut_ptr().cast::<u8>(), N) },
> +        )
> +    }

Arrays automatically coerce to slices, so I don't think this is
necessary. You can just call `new`.

> +    /// Return the position of the write pointer in the underlying buffer.
> +    #[expect(dead_code)]
> +    pub(crate) fn pos(&self) -> usize {
> +        self.pos
> +    }

You delete this function in one of the later patches, so it makes more
sense not to add it.

> +}
> +
> +impl Write for NullBorrowFormatter<'_> {
> +    fn write_str(&mut self, s: &str) -> fmt::Result {
> +        let bytes = s.as_bytes();
> +        let len = bytes.len();
> +
> +        // We want space for a null terminator
> +        if self.pos + len > self.buffer.len() - 1 {

Integer overflow?

> +            return Err(fmt::Error);
> +        }
> +
> +        self.buffer[self.pos..self.pos + len].copy_from_slice(bytes);
> +        self.pos += len;
> +
> +        // INVARIANT: The buffer is null terminated.
> +        self.buffer[self.pos] = 0;
> +
> +        Ok(())
> +    }
> +}
> +
>  /// An owned string that is guaranteed to have exactly one `NUL` byte, which is at the end.
>  ///
>  /// Used for interoperability with kernel APIs that take C strings.
> 
> -- 
> 2.47.2
> 
> 
