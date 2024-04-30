Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79212194C9E
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714505157; cv=none; b=u+UfDYNJUCWzWHT/3HQsgoj0ZvGknHu/NET20APdxI0nWDJbib+VemCgHhYdADKdQ8uW2Vjhy6l58sFqBMIyEYm9hjtsDQS6ztsiurDYXn3tiLWyJLehn512lZI0HtjL+uWIhoSSB/ZqL744ljElBK/sIeD771LaJ/DZ+0uBEmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714505157; c=relaxed/simple;
	bh=OFvWvbhcXT0877ZDgmEH+05dAnfmkppd3fGr0ywgJOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2V/ehcYaD7SYS8IQ0HYabYTcJDI4o2WZUI2iu8i0SnJu/yEs7mIK8s+x0apWViys6py01RJh2wKVd48qLwwJpveV98W11TzQhFjJwdMzocvFDbGxZLcOvYPtLS2UiBRECeaYtX0iuidOga1IanlPQ5W0vS6zuQ7ABp1ZRsLYDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RcsOTvNT; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RcsOTvNT"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61be74097cbso15757577b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714505155; x=1715109955; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQqUYxw6jihuDJUJrO7xd3MQMQtYoaHrb57FAN9pu9c=;
        b=RcsOTvNT8TZ9aiEWIaB7dfCYqZYGeMc4W30JmcdOflibxnojaoWE9SLKN84weLB7B1
         w1urmnWn7aLHw7ophcKo8HAoVMeYYl9Vm60mMW1LO/znhtRtyVQuY5akpiI3nKPd7WwL
         nNy/tPhrF8+aIHbQIQN5HlaUzvnqBKs/UX5I8Kqa1ORiFXPDw5GFzEnp3QYJWsFshs+y
         tqtbc3AxSck5n+EN5YEffar2nETM7YTZRhTKwhMh7Wj7IuIqYR2fm6kDh9RliTiB0lYg
         5O1kC7abZFiDGw1PfSpBWbK22LhUDO29D9yNPFpxG5Y/p0wOKz2gyu61RYz2nfX1p/bJ
         wqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714505155; x=1715109955;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQqUYxw6jihuDJUJrO7xd3MQMQtYoaHrb57FAN9pu9c=;
        b=HEvO3V8K+GBCKiu5Wye+htDH+RPSuJDGVnV734TqRhgo4S0flqMJ783/DfZLMcPqOe
         OBx+H+i2DitOq3HRURg2TcEg44MdWJqwNhZt/9ZDlr9h4SB7OFyA+LbLzwjnTEO1VuhN
         luVx1PRPLa4JZA7ucnV80DAdXM0C4KOToxqI9R7G4s3KqfAyT+bj8kVrJ1ccC3MtP5Ta
         RFBSah1vI+fSXFqzGgrdzIigrrZzmUDfHGMoBRWQF32IG9sQmrR8QabIlLq4CrfMsGIM
         KYA7NmtFyzCeVMu9G2H4iCuibwPSCzOkasQK+Tav3D5JufqZ4DiWOY/Y1j6b3idXKdiy
         LnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2vNSInc7MTU+WNHFBjxdDNurtLrLYimOA/D8DfIWFMgrdA2jkoejJGhWmiCVRiiwOYBY18DwC3F/I05ap/RuEPfAn/sNGBsdR/L33+8=
X-Gm-Message-State: AOJu0YyIqPppLpJAK92Nkgk4c/lue1LqXBufroSh6hgse12K3gKhgcOD
	hQeKs57mFT6Opk1HbLNDKtqrFre6f43HEsL3+KBLo2QSc4FlDpwKXn4lH05IgcwPATTbhSulIX/
	ZzffPFNzW+sBUqJzZRPzkgGZPf7E=
X-Google-Smtp-Source: AGHT+IHk+euI96gWzIadlH/LK7O3oT79AacxxByh6unJOOQRvGIBeYgvYz7Rqstmy/6shu4wZ87PwFwIxKC+Cz5kXBM=
X-Received: by 2002:a05:690c:6f83:b0:615:1a0:78ea with SMTP id
 je3-20020a05690c6f8300b0061501a078eamr548032ywb.34.1714505155176; Tue, 30 Apr
 2024 12:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430121322.2660-1-dakr@redhat.com>
In-Reply-To: <20240430121322.2660-1-dakr@redhat.com>
From: Wedson Almeida Filho <wedsonaf@gmail.com>
Date: Tue, 30 Apr 2024 16:25:44 -0300
Message-ID: <CANeycqqRasM-k1WY8znPbF3_bRDGQHghnyMi=oy=Mjs9UQH0fw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me, 
	a.hindborg@samsung.com, aliceryhl@google.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 30 Apr 2024 at 09:13, Danilo Krummrich <dakr@redhat.com> wrote:
>
> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> passing a dangling pointer (instead of NULL) to krealloc() whenever a
> new Vec<T> is created through VecExt<T> extension functions.

Nice catch, thanks!

A small nit on the wording above: this applies to any Vec<T>, not just
those created via VecExt<T>. For example, if we create with
Vec::new(), then use VecExt::push or VecExt::reserve, we'll run into
this. (IOW, which function is used to create the Vec is not a factor,
using VecExt to extend it from 0 to >0 is.)

>
> This only works as long as align_of::<T>(), used by Unique::dangling() to
> derive the dangling pointer, resolves to a value between 0x0 and
> ZERO_SIZE_PTR (0x10) and krealloc() hence treats it the same as a NULL
> pointer however.
>
> This isn't a case we should rely on, since there may be types whose
> alignment may exceed the range still covered by krealloc(), plus other
> kernel allocators are not as tolerant either.

Perhaps it would make sense to add a sample with such a type?

It would serve as a test as well when kunit and doctests are enabled.

>          let (ptr, len, cap) = destructure(self);
>
> +        // We need to make sure that ptr is either NULL or comes from a previous call to
> +        // `krealloc_aligned`. A `Vec<T>`'s `ptr` value is not guaranteed to be NULL and might be
> +        // dangling after being created with `Vec::new`. Instead, we can rely on `Vec<T>'s capacity
> +        // to be zero if no memory has been allocated yet.
> +        let ptr = match cap {
> +            0 => ptr::null_mut(),
> +            _ => ptr,
> +        };
> +

nit: why did you choose to use a match here? I don't think C
programmers would use a switch to determine if a value is zero or
non-zero.

I would have written:

let ptr = if cap != 0 { ptr } else { ptr::null_mut() };

>          // SAFETY: `ptr` is valid because it's either NULL or comes from a previous call to
>          // `krealloc_aligned`. We also verified that the type is not a ZST.
>          let new_ptr = unsafe { super::allocator::krealloc_aligned(ptr.cast(), layout, flags) };

In the case when reallocation fails, we need to rebuild with the
original pointer (the dangling one if cap is zero). This patch is
rebuilding it with null when cap is zero, which is incorrect.
