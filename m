Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9412F1400C
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 20:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766004339; cv=none; b=Ga/XkgFGSNc7bQfcaYixfxWamVaWYbAIGypHKQfSOV7XChZjG0YE16QwZK/FZXX+3O3r4J1Z/zbm3NvcuLlXfDNR7rXTirYrct83c3h0anH9Xgxwe/yamOKXYXpbQp6+GD9twGKi16Fl1JCukutoVg2SNVPcLm+oHMmct4LbjP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766004339; c=relaxed/simple;
	bh=QQOn5CZ1yzBb5z+d+o+IADOdy8DkkQYrgi3hk9vFOi4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J2BF6vQXeDlNMqE2V0QcWRb6VY4Zyt2/hymw5Fp6HvDVwKHKG3PMWJVqyvZ9HVytJECnSHjbg8/iOptcsdCOuNpJ+hYHSykb7W1fWyUcm78Ssmf1IJ0zPmFglWxGjdtkBe3+BFdMtbjbOoh/LVkqCxkztWo5q6VU9Vpvh71jcio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jlhblkK2; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jlhblkK2"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47921784b97so45507325e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 12:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766004336; x=1766609136; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJu018dHid7ikJmYIXBv8nNNblbkpt4aGSToeTne4DI=;
        b=jlhblkK2XuXZo4zxfQHt4Ak7HyKo6ojNBEB+NRLPGJnmBcPlSwxRoLpVDK4rXucAqJ
         1MVNkSGCRgomE5CmWSeaeZ08ru4NVqrrkNtu6mMaRa7pMoTO/cba/+VjAqrPLu+xjf7O
         sjfzwrSAFW7/Ywhb1GYL9e1HC1wt3jpAMM8VB5UouFsj+EqOr39LdvyWYbwnj13UbAK0
         DFlMyF4RhuwBEOI4dQUYArPw6DK3egi+LQ2OZuMBdXLZvGnezLjoBY8Wf24EdB1TBa5m
         Ome6wFX3pPAEIxOtURS8S6w58/KND/7OsFtWRA7jgrIr/966h9oUYcjwP2bZ3XclaNHZ
         1NSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004336; x=1766609136;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJu018dHid7ikJmYIXBv8nNNblbkpt4aGSToeTne4DI=;
        b=KhAzLkjjSjaQy1q/FewiamFzCFzwQPgsKviTHRLfwr09V8SeVgtd+yWqtTKuIBsTA2
         WxA+KJIXoo1OciDOdI92TZp+0pYvUAee+vqUwf34i5Zpe7L6nHjp3oBNfFsxMnyVKRul
         ZvqDKFae+XTdjCu3Wcwa/495PFjNmFJ4j+R5YbgQ01jsJ0qcBaj5dmsloD5tW7HjghCe
         iR7eZ1NQovz8c6hIfrX1/2vZEtZL/4yWWhiy3SzviHodI0Z/sWOeE6mFCuXJJe0QIthG
         wOkOngPWJqxanQo983ACiNpiHGLESJNHjbHiUyybaKQ6uWIZkEB3sAHDyJ1XjvKI8i3R
         DWwg==
X-Forwarded-Encrypted: i=1; AJvYcCVYCXFfvPuBbVonT5WA8G/hTnQDwvLaZQbBP7qmCdnyyaCDaZoPDo9+M07A+MYf8O4GkZwqkzN+3FX1UtuAuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7EXACR4MbhdodSRq9D3mO4S1aDXI7MEjjwn/qeVQD2+H2W37b
	+g7dZLkR/KA+n9iXRZUNgea9VC3dy3NowbIJU7kvqg3ovAjKRheLUB2C6NggZcPMyW76LsxcMzt
	MOeIjEtW07vJuKqf1kg==
X-Google-Smtp-Source: AGHT+IEw+fHUQgRNTByXtdxJOzTK6oHK/4ZNtyiM+1HoMWJZzvm/a0PzI6Di//yMP705QMC5+SA6aW98+ICN4BY=
X-Received: from wmbip18.prod.google.com ([2002:a05:600c:a692:b0:47a:8165:c9ad])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00f:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-47be3a79485mr652375e9.31.1766004335940;
 Wed, 17 Dec 2025 12:45:35 -0800 (PST)
Date: Wed, 17 Dec 2025 20:45:35 +0000
In-Reply-To: <20251216000901.221375-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251216000901.221375-1-fujita.tomonori@gmail.com>
Message-ID: <aUMWb2VvA48s0jur@google.com>
Subject: Re: [PATCH v2] rust: sync: set_once: Implement Send and Sync
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, 
	lossin@kernel.org, tmgross@umich.edu, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 16, 2025 at 09:09:01AM +0900, FUJITA Tomonori wrote:
> Implement Send and Sync for SetOnce<T> to allow it to be used across
> thread boundaries.
> 
> Send: SetOnce<T> can be transferred across threads when T: Send, as
> the contained value is also transferred and will be dropped on the
> destination thread.
> 
> Sync: SetOnce<T> can be shared across threads when T: Sync, as
> as_ref() provides shared references &T and atomic operations ensure
> proper synchronization. Since the inner T may be dropped on any
> thread, we also require T: Send.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---
> v2:
>   - update the `Sync` impl to require `T: Send + Sync` with the comment adjusted
> v1: https://lore.kernel.org/rust-for-linux/20251211230919.1303926-2-fujita.tomonori@gmail.com/
> 
>  rust/kernel/sync/set_once.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> index bdba601807d8..139cef05e935 100644
> --- a/rust/kernel/sync/set_once.rs
> +++ b/rust/kernel/sync/set_once.rs
> @@ -123,3 +123,11 @@ fn drop(&mut self) {
>          }
>      }
>  }
> +
> +// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
> +unsafe impl<T: Send> Send for SetOnce<T> {}
> +
> +// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations,
> +// so shared references are safe when `T: Sync`. Since the inner `T` may be dropped
> +// on any thread, we also require `T: Send`.
> +unsafe impl<T: Send + Sync> Sync for SetOnce<T> {}

The reason you need Sync is because &SetOnce<T> allows you to access &T.
It's not because atomic operations are used.

Alice
