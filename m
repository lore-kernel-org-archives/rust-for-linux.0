Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC711B86CB
	for <rust-for-linux@vger.kernel.org>; Thu, 29 Aug 2024 20:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724964087; cv=none; b=eag/sAWj4U6XurRzc8c38/nMaj7KMzp0Izoi1zmBdgstKEbl1BmSw7yprHUFEQBQ+xr9Oi4Anr1EZrxfRqhvru6Ir8l78JbABzAa9WmZ4NbxtdpHiio4nOiCYTsXAuDs1i3t+xA1oqZgjnol5ZTG6pS8GoHg2KBOFYyx3SDC98I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724964087; c=relaxed/simple;
	bh=lkw3CL5ttT0gqHzz5o9doV2aknAvPQcr1nH6EsFs+kk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt0zrO84jVLyetkjf3pExJVy3XYIhICiA8SLPbAr2cXSA0Avz/XgGGpVAohs7rDDKmJMuXlJINu4YNaw8f71DMYzloM6fWciqKSHrOoF7iGyntsbkpNXUspr2+423Tzkolkslezlq9tc+UVi9XTk0vVVQ+tGp5R4jut+pFmZFC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=P7gVKQax; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="P7gVKQax"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6b747f2e2b7so11030467b3.3
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Aug 2024 13:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1724964083; x=1725568883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkw3CL5ttT0gqHzz5o9doV2aknAvPQcr1nH6EsFs+kk=;
        b=P7gVKQax6x78Tcf+QQbBjqGZRW75B74a0+zbWN/rTxwxJQIw2sHqmmdQKmPKhi2g1I
         nc3ulnOlQ5epE+J5drxty08ZcIdAAhX/d0BXUAe6HGxfK8D2Og6E61FvShsIhi6iulwV
         pMLUdfcS2H7l7BlIDO2Ly+pCfxbeKA1OHVPhlSkjyMWmvA+mLtzvS+g/b0hMdflAUJPp
         NTD9QGKnieNBYshKrmG/j29e1SvgsVUcas2akJFw7pVFhj94OHvORBeXkliM/Wf0KfI8
         6Uk77hA+0Z6bK6mJOiB99+XcaUYT0GCgig9895EiB+EpiJawQOETWekVPnCrf4sMjBhP
         4pmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724964083; x=1725568883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lkw3CL5ttT0gqHzz5o9doV2aknAvPQcr1nH6EsFs+kk=;
        b=TsvJl093PXp7eUCWWeqUOty/Jk4559eHlu9Z/XtOEmZMI+dq/VhPYmYh8QZKliQqQ5
         vmwxdEPazejbrQ+BjakxnXXwGWBwy1bUTRNikq7iWjVc/Mfh0YKSzl/ie9iiNYiiRaSj
         Ifzzx9o+H+w1WPHVE0brxuPd7z0rp+zIenp/DgZy0nCQzMab82Pq7rW++HIass+JDM6E
         qN1bAOURvXFp9knukBmbvyd7fRBQ+T7jMWYbt0Dv6w5HqwMvMhw0dMdMmVKnCGvyP3gz
         UmM8vQ6L4rgdFiQZ0dPDkNmGKUpV6B+fiJV5iJ69wAlvkkBibi2Kx3aQpz5epeWzfRld
         waiw==
X-Gm-Message-State: AOJu0YyNDAuv4rLtjSrfBLaU9SOEYyiZT4fX+E2qvRhDauf7aRo0aYnw
	Vmpgm9FWc3zvf/aNz8f1W9uSi56fvzlNY6Lc2VRzxHdJujLF9n0wbKdk3d4oyRW4b7ZuMOACz8U
	gCfFTw/jqfYfpJESNqERKCqveeUPGgcrrgvzDmhhNkB6pc4qs
X-Google-Smtp-Source: AGHT+IG5bnrqP5A8V1VwPz3WChxlTbtJRKlO+thLHCUI1KIwj2sEbBZHPkOzVeqpltZtskErlXnGa2h2LL9kt1/6Yjo=
X-Received: by 2002:a05:690c:39c:b0:6c8:e45d:ebd8 with SMTP id
 00721157ae682-6d2759683d1mr48049297b3.9.1724964083388; Thu, 29 Aug 2024
 13:41:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828180129.4046355-1-boqun.feng@gmail.com>
In-Reply-To: <20240828180129.4046355-1-boqun.feng@gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 29 Aug 2024 15:41:12 -0500
Message-ID: <CALNs47uOhuNCj+LjD66AE5DSJ0DdEv4keJcgbmPaEAEFScWUMw@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: Provide correct provenance when constructing THIS_MODULE
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024 at 1:02=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Currently while defining `THIS_MODULE` symbol in `module!()`, the
> pointer used to contruct `ThisModule` is derived from an immutable
> reference of `__this_module`, which means the pointer doesn't have
> the provenance for writting, and that means any write to that pointer
> is UB regardless of data races or not. However, the usage of
> `THIS_MODULE` includes passing this pointer to functions that may write
> to it (probably in unsafe code), and this will create soundness issues.
>
> One way to fix this is using `addr_of_mut!()` but that requires the
> unstable feature "const_mut_refs". So instead of `addr_of_mut()!`,
> an extern static `Opaque` is used here: since `Opaque<T>` is transparent
> to `T`, an extern static `Opaque` will just wrap the C symbol (defined
> in a C compile unit) in an `Opaque`, which provides a pointer with
> writable provenance via `Opaque::get()`. This fix the potential UBs
> because of pointer provenance unmatched.
>
> Reported-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Reviewed-by: Trevor Gross <tmgross@umich.edu>

Thanks for the fix!
