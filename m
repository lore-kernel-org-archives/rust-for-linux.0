Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9282E7BB15
	for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714465522; cv=none; b=UVcJU7TbDPWeWOYxkpSSzaWsnqa3CE9ztMuF71d14EpVKjCXl9f9Fhdpkdy4JisBvwrcdTOomUEJWzYw3bS6ZyyShJWQQ5wfaLVXCG3uJDq4ydjd9EZ58E4EiJQtWMNJc0YIq5jbIyMv6EpxX4N7xG4U1O7wJG0+QpY4gD0ETXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714465522; c=relaxed/simple;
	bh=sFTRiPf6/6En/1sFQoIXjBsmP4fGZki0Qf60EkFHUcc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TVsaEat2KjB6ogh7QUZ6b8mosNANR7PQPgEhG1sP+SF5EOWBYB/uEzJOItsCteBDqwz2qqVH0A29LqNIJj12DUfGdcWkSVjOYDi4R+UmkFjhyQ8hD6PpkOFsbnIs9+1iWVj/YKeDXb2NNYbEoe+IGitm4+o3sQngX+D1SO/FQn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XzyUz9es; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XzyUz9es"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-4dae34a3806so3242799e0c.1
        for <rust-for-linux@vger.kernel.org>; Tue, 30 Apr 2024 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714465519; x=1715070319; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFTRiPf6/6En/1sFQoIXjBsmP4fGZki0Qf60EkFHUcc=;
        b=XzyUz9es+GG+maE5A1JmHwLs8z1ewXRYkfE9ISUFRfOUSMNzl8Uh2r1VeSsWDGmOm8
         aCNOMV0Hpg0RcXHiTac1sg+13a2c3oJIXaccJYuPTDTsHDWl5kgW5R67lvKnd4kkvoeJ
         1ML9Grbncls84+Cn/HCtsGVzz81I9RnjSd+uIKduALxN8MGwXrAt5d9VlJEqyYlvwMLo
         ze4rdIN5WiEcre0awXbflmeYj0jVZfbJ95acdMWdYkt4hS33ei0/dpW6QOtdOWe7qMKe
         TKHh4hLxaT+maDuDOr61TPAN5YZyI43WzftdmQyBkg8e0kiT2mE1ecQCI7ldHEWAJqVR
         7Ovg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714465519; x=1715070319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFTRiPf6/6En/1sFQoIXjBsmP4fGZki0Qf60EkFHUcc=;
        b=wr/MH2o27t1+C+a6AZAoLHsTyaLgkGjFA5wNo4aNW1JposZsHEAKS6TYo2aiZAvZTV
         DwO9U0nGF9dPNHXyImnb2ERHk0/JVvCuUGLYBNnkRZk5TBnR9NDlDLdZYp0qKy//b3Tc
         I2ygm0XovFjDgkGpLxinzDLnhh9AkaoTwYPPwGag+lEP0qVntkZU9TcGFxJsRm4LotQ8
         4aIBdwtZEZOYFVW0UdNKflORxCZV8x6UhSrsTCvkgDJSxbdOfTtd0Wv943jHiPMqmJDv
         OCZt+kYa0URVv34waCMbVcxngmYZANheo2+Z/z2XaLbMJPUBucAbiFsZhDs6NvGDCipB
         zXkg==
X-Forwarded-Encrypted: i=1; AJvYcCUEqAUna2E3L3ms1508OMUffsVSIar0tqWySgJ1npXJ3FzCBy3WoPq54m8A+MTpzkGn43jJM3iji/mc8ZAKl+Y658j+saqVtyQ7NBr9+SQ=
X-Gm-Message-State: AOJu0YyiJ9DdzK20GHBbBc9tTY3PxIlEjNxi2UjALzxUSEZym/5/BVDe
	yERn5LaTHZBI6JwYyHXjMPBGyzuvYlHpW/AvLbrHix4qGKvLcz7BhYml9KNBgMZXS5HbH+FyIRl
	Knkf67e6e/fYKcsmBDKezfkIMaIB1EVwicqtB
X-Google-Smtp-Source: AGHT+IEWbjr57akosE+sXSWoYDZcRQiWimnVrCp+Z+7cGiNlwzeJIl5hFpZ9lYJ4zEfs3Yeh3fSlE5OqLoJ7nXYdD5c=
X-Received: by 2002:a05:6122:894:b0:4da:ae51:b755 with SMTP id
 20-20020a056122089400b004daae51b755mr2135868vkf.3.1714465519381; Tue, 30 Apr
 2024 01:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429192435.2235-1-dakr@redhat.com>
In-Reply-To: <20240429192435.2235-1-dakr@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 30 Apr 2024 10:25:07 +0200
Message-ID: <CAH5fLggzvBasL8UCm_A+9UQSmqzikhqMT82HW3SX47aHLgn0xA@mail.gmail.com>
Subject: Re: [PATCH] rust: alloc: fix dangling pointer in VecExt<T>::reserve()
To: Danilo Krummrich <dakr@redhat.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2024 at 9:24=E2=80=AFPM Danilo Krummrich <dakr@redhat.com> =
wrote:
>
> Currently, a Vec<T>'s ptr value, after calling Vec<T>::new(), is
> initialized to Unique::dangling(). Hence, in VecExt<T>::reserve(), we're
> passing a dangling pointer (instead of NULL) to krealloc() whenever a
> new Vec<T> is created through VecExt<T> extension functions.

Good catch!

> This only works since it happens that Unique::dangling()'s value (0x1)
> falls within the range between 0x0 and ZERO_SIZE_PTR (0x10) and
> krealloc() hence treats it the same as a NULL pointer however.

This isn't quite true. The value of Unique::dangling() is actually
align_of::<T>() rather than 0x1. So for types that have an alignment
of 0x20 or greater, it would not work today.

> This isn't a case we should rely on, especially since other kernel
> allocators are not as tolerant. Instead, pass a real NULL pointer to
> krealloc_aligned() if Vec<T>'s capacity is zero.
>
> Fixes: 5ab560ce12ed ("rust: alloc: update `VecExt` to take allocation fla=
gs")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
