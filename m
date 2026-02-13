Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08FB14AD20
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 16:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770999584; cv=none; b=smCxSd3NugAUU2ujdcNzMDYDxVLfADjlN6DyWOJHqCkzG3vlAsKauSstfy1ZLShkeNJacfI0zuhRNFn4+a0FjJW/TqtJmtejyiQx6z7pIyx/UOEtqsl0tf5Vzl9AdntgAlk8gEG3IQ1yHhDdtrejpXAHrwzinmGHtc/w1AonhQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770999584; c=relaxed/simple;
	bh=skxGPYGF0shbk35Z+9byZsuGGwHFRooDQP2l9UO6RI4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LA4p0XJfm8/MnclD7UiFIlWU1zDRPdnEBQKCTyu3znTL6tX4STjZ/8WZmC8CaBVp2YeEAE74PlcwkJQ0v5DyBgxfdFAoX1+tITwPX8lHbXYDKuqgHOeEwBWgSdG8r+ZvJA1JhP1/krSrqBwlLj2KIo+RpBQAXIWdWUTxivt+AmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DlX80Weh; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DlX80Weh"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b844098869cso33664666b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 08:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770999581; x=1771604381; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6STMy2Sn3VeXtt0dq37yqQOGqgyUcYOyF5J32Z9FjUE=;
        b=DlX80Wehx9NR5OMphwMKo5XkK2oN2duQDbl+xzB3YRXNkfkjpitvSQ0t13Cbvzitno
         YtqfVIiDEd9o65q4oTkNYZ6EwhxF0wd8Te6KE7rGkcpKvLfxz7ni94Rlc7KeKKuvRgWR
         rqbaH+cq7KZ9zt9IiipHt+e8U7C0Lj0vyAdK1CPAkkJq2zBqX9KLGMGaAJiMkAnUJlGf
         UeZZAZMpvGpq3YUnSZypkw6KsmxMvibMngJGL3pV81QSH8qPA7Z8tgJhECITtbXPsfe1
         CGtcRlTJIFrJVD9EFlWW06W2GYxlUdrxckLPS1zNMgI6huCwpXSHhTmYIU0RievJiVRk
         RHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770999581; x=1771604381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6STMy2Sn3VeXtt0dq37yqQOGqgyUcYOyF5J32Z9FjUE=;
        b=ui5dix602GT/MisyyHF/rRu8zxhrwj7im7M2Qk09XfKru/Z3WVwmI7yRg2KW+AmD2g
         OeUoCGBwvJV7ghAqSJ5pKd8pl8+Oye8GjsrnWzrC1ecjbm0IWtZy95+lY4oBA+gSbiz0
         w7BnBBab5KeKiHlyWPu+gPCXlO8XwQLMmJpBUHv5uUnf9GfyoFniz08nTkWQ7xZIi3qD
         n7e82tTQC0BLeglfagQZl1O8UP/+QZD9UCyG+mB6HW5ia6FZ/jtwv6gBMzuNkFj39IlO
         ZJSzZ7MsSP88scuLB5ac0fNeSBXlWFm1kIJ5gp2QfeEHUa9oguZzfUMVLwwz1ALkAA5q
         y5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlsJWYT/vg9jKYNHZfMf0EBzQ2UZ5hDJhjwEdOQ3F1CfEfAxEq9P2n5hNsSFKO4njW9EVk4c8ZQRdGbITCzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq33++27lO1SQ0SMZ6Kyt2iAf4mvFzWB6jnmE7NeccZjPd62M1
	HxGPcOSYfogQNSubsqbbobCpgB3jfZeHb+nQAEOZQcI2BuVNE75YkKd1y8ppmnS4NOCk+GiQAJx
	3ta4Il9qb2zdCkrsSCw==
X-Received: from ejcjg26.prod.google.com ([2002:a17:907:971a:b0:b8f:99f1:6959])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:6d05:b0:b8f:6f6d:c593 with SMTP id a640c23a62f3a-b8fb44767c4mr142915066b.32.1770999580951;
 Fri, 13 Feb 2026 08:19:40 -0800 (PST)
Date: Fri, 13 Feb 2026 16:19:39 +0000
In-Reply-To: <20260212-binder-shrink-vec-v3-v4-3-bd02f06bf2cd@zohomail.in>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260212-binder-shrink-vec-v3-v4-0-bd02f06bf2cd@zohomail.in> <20260212-binder-shrink-vec-v3-v4-3-bd02f06bf2cd@zohomail.in>
Message-ID: <aY9PG909tCTZgMup@google.com>
Subject: Re: [PATCH v4 3/3] rust_binder: shrink all_procs when deregistering processes
From: Alice Ryhl <aliceryhl@google.com>
To: Shivam Kalra <shivamkalra98@zohomail.in>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 12, 2026 at 01:47:09PM +0530, Shivam Kalra wrote:
> When a process is deregistered from the binder context, the all_procs
> vector may have significant unused capacity. Add logic to shrink the
> vector using a conservative strategy that prevents shrink-then-regrow
> oscillation.
> The shrinking strategy triggers when length drops below 1/4 of capacity,
> and shrinks to 1/2 of capacity rather than to the exact length. This
> provides hysteresis to avoid repeated reallocations when the process
> count fluctuates.
> The shrink operation uses GFP_KERNEL and is allowed to fail gracefully
> since it is purely an optimization. The vector remains valid and
> functional even if shrinking fails.
> 
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Shivam Kalra <shivamkalra98@zohomail.in>
> ---
>  drivers/android/binder/context.rs | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/android/binder/context.rs b/drivers/android/binder/context.rs
> index 9cf437c025a20..399dab475728b 100644
> --- a/drivers/android/binder/context.rs
> +++ b/drivers/android/binder/context.rs
> @@ -94,6 +94,17 @@ pub(crate) fn deregister_process(self: &Arc<Self>, proc: &Arc<Process>) {
>          }
>          let mut manager = self.manager.lock();
>          manager.all_procs.retain(|p| !Arc::ptr_eq(p, proc));
> +
> +        // Shrink the vector if it has significant unused capacity to avoid memory waste,
> +        // but use a conservative strategy to prevent shrink-then-regrow oscillation.
> +        // Only shrink when length drops below 1/4 of capacity, and shrink to 1/2 capacity.
> +        let len = manager.all_procs.len();
> +        let cap = manager.all_procs.capacity();
> +        if len < cap / 4 {
> +            // Shrink to half capacity. Ignore allocation failures since this is just an
> +            // optimization; the vector remains valid even if shrinking fails.
> +            let _ = manager.all_procs.shrink_to(cap / 2, GFP_KERNEL);

Not a big deal, but perhaps we should write len*2 here instead of cap/2?
That way, if the cap got way far away from the length, it would equalize
right away.

Alice
