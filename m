Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED4025569
	for <rust-for-linux@vger.kernel.org>; Mon,  6 May 2024 16:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715013446; cv=none; b=LxEzcKEbWFXzBbCwlEQX4ieQfxhWOhMFFfPfGsBaDlzob7Pho8mtAV2isI5lW3KEZ9FCZd/rzlyPMveQtbvVAziHeAl0gTyLdEaBPrlgY/8rJNR3AJKImwJMhyJzJ61BL0TCr83qaVuraulygQXU8zbtA9yxkhVPfNmZdqmkmLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715013446; c=relaxed/simple;
	bh=Qg41n1qBME/VENWqbYH382hqpIHuWATYQq30m7JaCG8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jAwaSwLxJclOH5IybqELr1B7yiB+lnR9sU2ezKds+RvoW9HErCcA0GgQ/oe1bzV2nUnPs8+CbgCU/77XzS0513jLULCm5blPdUV287qZ7oioTsEjBxZoQFHw9exTXKYBkHG8aooXrMCKGn3JndPrfWLv8JlUbCt8ldFwq/UhLVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y6dVV5xb; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y6dVV5xb"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-61b62005f38so22644477b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 May 2024 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715013444; x=1715618244; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lbKdrk6HakAU1oD2QpZCK/0h2B6HfZu56VLT3ovNnHY=;
        b=Y6dVV5xbj+TBi9NCYt0Njp6wb/WEyCyf6W353+aajVXeRnegMkhp5aKjrvV7xHRZUL
         /sn45I1Wv+7Tv1kW42CXgB3YjxqOswrWQ/+Jlk0abwVX7zOesXS+Z9hn3GE+eUgPuvW1
         GZq2l49dW0mx1wXHM/NNynhSJNNtrqFhAiySKrSLECNV9tRyyIO48ZczlYwYzr8rvfq5
         4JV1sGpJbhjlWr6o8mwR9W3OZS20vTJJM0tn2mQXzW+AbFK+cM/yzCXIA/EK+D0b3skt
         kjuoB5ftbGka6RUJYLkxawEYqb1PjkNJWASmOfSsm4aU8ldnHgo1q7lg/zX1ta1T+6kM
         8x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715013444; x=1715618244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lbKdrk6HakAU1oD2QpZCK/0h2B6HfZu56VLT3ovNnHY=;
        b=Wloayj+gcQ4oLPi60ukU+ldSq4rMFFG0pEKzU+yzoLbspXR3PAWnoz/nbAapZwRbo4
         SgBFGp/yZYXquf7KfNmprLro9z0MSsgha/Q+IOn39NqxWKQ03hXRwXP5r+zWAEzwlLId
         9GNULgNtYMllyK01lI/EG8v8nhJxVwqOzv7ii3aHMV84YN2uxyghd9ngnYeN059ptXRM
         K9wM/iOlhW7LKuEi5UyrJ3yAYLnWpRVUHx1TghZp+XWFzxyGt6eBBLsxhp6EKSE9qGgt
         h0zmKJLCs8HFUGsfRARBj7nAfVq8bAHFCFAF+4jDb1IU7/UTYvN1lgDx8UdkWO2/Q2ol
         k9rg==
X-Forwarded-Encrypted: i=1; AJvYcCV0VqtgoMCc6KexWfigUz4tHNAVi/ccN5QKkNrhgTytlJ1XhVHYJm+K9JRpUs0WDu3tUXFPJyO9Iv72DtRPU4uMTjoSUjKc29GF8vJhflg=
X-Gm-Message-State: AOJu0Yz68EKPO81gM/k5PLzVNvMGbUbFJNdQ6HZNpdI/lXOjGRaOPMbi
	+yXbeNDGsh+3HOoL3c2aNUYjePa0U8GXoOyW3bkUtzEQWGqqjQeHsALSYBGyYGpcNlNZ763zxVv
	2qTVtzFmiLQWJCnTJN29XnvCOP8Q=
X-Google-Smtp-Source: AGHT+IGrakgSMkVvSP3ShU87ASyuqgC9BcsIbHNtorwN4oM1w4pKdyWvK74USknLBtGUpYSB4vBTVo6Wcife/q3jYu4=
X-Received: by 2002:a81:a083:0:b0:61b:69f:4c24 with SMTP id
 x125-20020a81a083000000b0061b069f4c24mr10632555ywg.20.1715013444241; Mon, 06
 May 2024 09:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240501134834.22323-1-dakr@redhat.com> <CANeycqoRh_hjUmAKyQCjNy-SJ+Ct5XR9yDMBc_HJaY3+EjajuA@mail.gmail.com>
 <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com>
In-Reply-To: <82f42e39-b1a2-4915-b382-71f4c06c3f53@redhat.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Mon, 6 May 2024 13:37:13 -0300
Message-ID: <CANeycqppeewOc+OH_KPLOdbPLx1BMGMcmuye=uKM2-K80J7Vwg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 6 May 2024 at 12:22, Danilo Krummrich <dakr@redhat.com> wrote:
>
> On 5/6/24 16:11, Wedson Almeida Filho wrote:
> > On Wed, 1 May 2024 at 10:48, Danilo Krummrich <dakr@redhat.com> wrote:
> >>
> >> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> >> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> >> passing a dangling pointer (instead of NULL) to krealloc() whenever a new
> >> Vec<T>'s backing storage is allocated through VecExt<T> extension
> >> functions.
> >>
> >> This only works as long as align_of::<T>(), used by Unique::dangling() to
> >> derive the dangling pointer, resolves to a value between 0x0 and
> >> ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
> >> pointer however.
> >>
> >> This isn't a case we should rely on, since there may be types whose
> >> alignment may exceed the range still covered by krealloc(), plus other
> >> kernel allocators are not as tolerant either.
> >>
> >> Instead, pass a real NULL pointer to krealloc_aligned() if Vec<T>'s
> >> capacity is zero.
> >>
> >> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation flags")
> >> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>
> >> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> >> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> >
> > Reviewed-by: Wedson Almeida Filho <walmeida@microsoft.com>
> >
> >> +
> >> +        // We need to make sure that `ptr` is either NULL or comes from a previous call to
> >> +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
> >> +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>`'s capacity
> >> +        // to be zero if no memory has been allocated yet.
> >> +        let ptr = match cap {
> >> +            0 => ptr::null_mut(),
> >> +            _ => old_ptr,
> >> +        };
> >
> > I still think this should be an `if`.
>
> Is there any benefit using an if here, or is that your personal preference?

Readability.

I don't remember ever seeing anyone implement a != 0 comparison with a
match or switch.

But if you insist on innovating on what seems poor style to me, go
ahead. I'll fix it later.

> >
> > What happened to adding the sample/test? It should be straightforward
> > to do it...
>
> As mentioned, I can send a patch for that soon.

Oh, I see. You intend to send this separately. I thought the patch you
had mentioned before was the v3 for this.

We don't normally send documentation examples separately. But I'm fine
either way.

Cheers,
-Wedson
