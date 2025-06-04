Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4C718C03F
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749027625; cv=none; b=PgKut6DY+S44szkuURbBMNR2GmGny6l9oknaAPeiddGLq53c4/Tn/ckcwSrMOxoAQoj5muBSqSTZEGci7uKldBNCRxarpagqPfxC7Lclkyz0tvCsnl84WZpd/YmAHU7PzAzbKT64XwXlQhlJ4ITIInvoT9x93H1O2X1BSCBg42o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749027625; c=relaxed/simple;
	bh=WWSVrkloq7pwBtF0fI+ECc+vU7jSih7MauL6+8GvsvA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ruc7yRkFtQp+OO4IcwN84PbreTCVWs0wQlLAKiLr+F+JvBFoADmDYZatsb/HprwvvNaZWBCY9eM5PSe+qNqQ9A6fP0BilCNAyahOz3/GRVb8kge6bjMRk0DY9Pkva9Wlzh9WNpgDAnSc6tckw1mbAakSzEUwWBun6FY7V2ugTzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mFfhtMVu; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mFfhtMVu"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-450df53d461so36440395e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jun 2025 02:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749027622; x=1749632422; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KjEMH/TqNnUE/z+eJUzsFegKG7rEAJKYvPFdSAPotXY=;
        b=mFfhtMVu50axpE61XD9ECrYgNLCMpKW1U6Ow5hxrrWLEPUm2QCbbArdfNqQJTvroFm
         KBiyOhHu52np4+WxiuCMijtb3BsqiHT6lfeG5gD8W2A+Hvsst9IAh9X+1eQc2LKOcdl6
         mspKvcXDmLZhLDUpMwgnNxsNHfFIsUYtC6T9wvCQiZ/DNuVZURS1AhBKBryCazJZPYqG
         OdJcb1PFYzQL3FeS7233g65OcnwVwxIeQOyxtSWBRUlvLMxa20JLsBbIlpsGmdTkCjEY
         jAdgqWoDOj/Rhf+XzcEeJMLMX7ttpQnkv3Zbz10PB+g1dmwXsCzjZbXMqvt+t6TbwQG+
         02oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749027622; x=1749632422;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjEMH/TqNnUE/z+eJUzsFegKG7rEAJKYvPFdSAPotXY=;
        b=sjEV3WaM8oH2yx4cv7YHotYHRfYo1fETGOV895Bq4gmb9h+byEnmeI+0eq5YfRv+p3
         fM5IxGE2YqzKYbUi6mNaibSh2gylXntRO5esOn7aC7CKkJEpkMnukJ+hAoJ5nUHMWIDw
         wTfPj1rCFc3hjOhDrvXBHQsDfB44RSQf9ayi1Z17dbzkKzngM8TODmPz8NqlZuHZN6ZV
         P1DCS7msph/ElxLyMycw/N3F7WhvtFA/k4eplryphQm2JbYUl03j8twZgiBYdF8bhr4N
         nTfXeKkhdavBT5AmLpQL0nBwaf0MIkXH7Gvgr+x7EpsdkKQqXfspHSs6soU56AHctvgP
         XQJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDMCNgsjPF+G2PWMyzaNksiYvHyjQEtw4or+fY9DOPUBn2Ye3IfSj0OOnCMnrrfuQ3hjQBBRFJyiNQstwMcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCIDjLZAxqthkGsHA/EZhfk262SrT4o/9NlS0S1tDBwrR72ufH
	DmVhm4RKQWyzXFgfqiTp30xFH+kPfofWrIuFz2/zjFSujLYyY7wXMppi3DYKzvVQNZra8ILlxHs
	y0IPNwaIMbNB6lkEXZw==
X-Google-Smtp-Source: AGHT+IFzBiaDtFCOSU2dybkHtHIaIwGYDPYEPLMon3bbK+M6KlCqiMYESKGwbiLZ8/HKB/xEFOV0lt8yaHNVlzc=
X-Received: from wmtg4.prod.google.com ([2002:a05:600c:8b54:b0:450:dcc5:70fd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:348e:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-451f0b249a2mr16127135e9.25.1749027622526;
 Wed, 04 Jun 2025 02:00:22 -0700 (PDT)
Date: Wed, 4 Jun 2025 09:00:20 +0000
In-Reply-To: <20250603195426.2360773-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250603195426.2360773-1-ttabi@nvidia.com>
Message-ID: <aEALJCHeJ6GLnaxo@google.com>
Subject: Re: [PATCH] [v2] rust: introduce sfile macro for succinct code tracing
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, lossin@kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Jun 03, 2025 at 02:54:26PM -0500, Timur Tabi wrote:
> Introduce the sfile (short file) macro that returns the stem of
> the current source file filename.
> 
> Rust provides a file!() macro that is similar to C's __FILE__ predefined
> macro.  Unlike __FILE__, however, file!() returns a full path, which is
> klunky when used for debug traces such as
> 
> 	pr_info!("{}:{}\n", file!(), line!());
> 
> sfile!() can be used in situations instead, to provide a more compact
> print.  For example, if file!() returns "rust/kernel/print.rs", sfile!()
> returns just "print".
> 
> The macro avoids str::rfind() because currently, that function is not
> const.  The compiler emits a call to memrchr, even when called on string
> literals.  Instead, the macro implements its own versions of rfind(),
> allowing the compiler to generate the slice at compile time.
> 
> The macro also uses some unsafe functions in order to avoid indexing
> into a str, which apparently is not completely a const operation.
> 
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>

What is the use-case for this macro?

>  rust/kernel/print.rs | 63 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/rust/kernel/print.rs b/rust/kernel/print.rs
> index cf4714242e14..1fd1497af887 100644
> --- a/rust/kernel/print.rs
> +++ b/rust/kernel/print.rs
> @@ -414,3 +414,66 @@ macro_rules! pr_cont (
>          $crate::print_macro!($crate::print::format_strings::CONT, true, $($arg)*)
>      )
>  );
> +
> +/// Returns just the base filename of the current file.  This differs from the
> +/// built-in file!() macro, which returns the full path of the current file.
> +/// Using the base filename gives you more succinct logging prints.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// pr_err!("{}:{}\n", sfile!(), line!());
> +/// ```
> +#[macro_export]
> +macro_rules! sfile {
> +    () => {{
> +        const FILE: &str = file!();
> +        assert!(FILE.is_ascii()); // .as_bytes() does not support non-ascii filenames
> +
> +        // Return the index of the last occurrence of `needle` in `haystack`,
> +        // or zero if not found.  We can't use rfind() because it's not const (yet).
> +        // Avoiding rfind() allows this macro to be evaluated at compile time.
> +        const fn find_last_or_zero(haystack: &str, needle: char) -> usize {
> +            let bytes = haystack.as_bytes();
> +            let mut i = haystack.len();
> +            while i > 0 {
> +                i -= 1;
> +                if bytes[i] == needle as u8 {
> +                    return i;
> +                }
> +            }
> +            0
> +        }
> +
> +        // Return the index of the last occurrence of `needle` in `haystack`,
> +        // or the length of the string if not found.
> +        const fn find_last_or_len(haystack: &str, needle: char) -> usize {
> +            let len = haystack.len();
> +            let bytes = haystack.as_bytes();
> +            let mut i = len;
> +            while i > 0 {
> +                i -= 1;
> +                if bytes[i] == needle as u8 {
> +                    return i;
> +                }
> +            }
> +            len
> +        }
> +        let start = find_last_or_zero(FILE, '/') + 1;

Is plus one really correct when this returns zero?

> +        let end = find_last_or_len(FILE, '.');

I'm thinking that you should only have one method here returning Option,
and that the two calls should match on the Option.

let start = match find_last(FILE, '/') {
    Some(slash) => slash + 1,
    None => 0,
};
let end = match find_last(FILE, '.') {
    Some(dot) => dot,
    None => FILE.len(),
};

> +
> +        // We use these unsafe functions because apparently indexing into
> +        // a string using normal Rust methods is not completely const operation.
> +
> +        let base_ptr: *const u8 = FILE.as_ptr();
> +        // SAFETY: We know that `start` is <= the length of FILE, because FILE
> +        // never ends in a slash.
> +        let ptr: *const u8 = unsafe { base_ptr.add(start) };
> +        // SAFETY: We also know that `end` < the length of FILE.
> +        // If `end` < `start`, this will generate a compiler error.
> +        let slice = unsafe { core::slice::from_raw_parts(ptr, end - start) };
> +        // SAFETY: We know that the slice is valid UTF-8, because we checked
> +        // that FILE is ASCII (via is_ascii() above).
> +        unsafe { core::str::from_utf8_unchecked(slice) }

Instead of this, I'm thinking you could have a const str slicing method.
You can use is_char_boundary() asserts to get rid of the ASCII check.

Alice
