Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DC53E49E6
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785917715; cv=none; b=b/7zbgqNAZcK+7B8UfMZg1O8KeBUHFwdKPDpR7b6+qZNi7RIb7CASXarwqJ+uTB09YbEz959Lekscu9sXvUfZGcNEmm8uNO6UvZgHzgabX8UBFfbBsB0iaHhDS0HTVokEKTnHKr5BW2DqqME5SfKa1fZH4pDldNrzdGNk1HqZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785917715; c=relaxed/simple;
	bh=HT0NUXPWAal3dYKmFNpEiu2bSkfaDQDGKPzccIs9BB4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CjGtaSpndk7BOn6f7vUn66uDvA47Y2npbwCkxlEszddfrbnWZvNEEHiOz9LQ8imJuyCEz3NjEPWTx0LGf8SW/rZMEn2wu7tgz3rP9Kx/Uvk30r/aJIu8mtQ+IX/ctzv8xBQuv6aiWPxD08Q/2CRvx8H5csC9bmo8Xd5jeAJl+fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q0tVhX6s; arc=none smtp.client-ip=209.85.167.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q0tVhX6s"
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-5aeb75d2986so472998e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 05 Aug 2026 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785917708; x=1786522508; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IxOxJaQlSoO6Zwz8hRrFEsrYhAobxhiDmYsdD64hwV0=;
        b=Q0tVhX6syPotweF0501yEgWylzZdSE25uyKRj7sC+zf1i0tf8qq/OSFUq6cXgj4Bkj
         /xQ7fvAHsAYLGgi3Ny0CCHWk6NMMpM9jrKZRyxaVQcJTsjO1yr7NP+5CgUOYAZ+gHu/6
         ZTp380aZKC8J9BpMDcA+ipBSP3u0KcXq7Y7znUHm7HibbdWz94gup4jaJavYhdpocJ7i
         B3wD1ughPS4MRiyZ+rFDS4rI+UpYWcV91fKzl7jxmR8V0i7sBuSecYsD8xVDSsSKKBNz
         j2JodLczs7uf5HiMmEv9dYijGFcyj/+cwPrAaQDEg+TVC4zFfBvDXiX3lypsb9MjC20w
         dGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785917708; x=1786522508;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IxOxJaQlSoO6Zwz8hRrFEsrYhAobxhiDmYsdD64hwV0=;
        b=GtM9P1Dp7Wf01DJgGnQaGJnAZzKgCU79DHyGnXUn+XZ+BE1kmexd8dBVOn/Iz89p6u
         xdpKx1E/4VYrtCjRARZb453SnLBfKJNf9hHJgqj6DyX2hFmI9fq/vIyBXtPCaFxFaB5J
         CAaTHnn0wYGAtPKe1pogrX+hzXeMoDAAZm5J0dukGw6qQBKnFkLmwc/FpLhrUFTlE1gj
         GnALuxKM9OcH4J1up+0SPXYNeUkgXnZFfpvlNlq7Iyau/Es1X54kYLEPLhEod1lQLxJj
         XlAkOpqW2gvpZXNi45C9KemyONhUQdFj70lIzFe/S0YWrPWVgstLSeXIYLEojU8HMF6E
         UFHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlrZEnx40t9USCv6RAyQlICj5C1qaLa3KtSmWAZJBWhIjJC+oAxOLyia8Gx0P1UnPHm7Lya8Jz9+IzdXUlcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYVBjB4saAxaDQrNRLa8Kw1guGU8F4EOBekQwdjpnwH4pwUVeT
	yLUy2sVTU/i3ffK1MwnMH4HCbFJLY+EsWZEt2R2cwGtsPYVPsL7PQi7sht9U3gWU+40mmHIxOI3
	ihBsMeEm4iibivE0OEQ==
X-Received: from lfy6.prod.google.com ([2002:ac2:4846:0:b0:5ae:c130:fed9])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:ac2:4c50:0:b0:5b1:51f1:594f with SMTP id 2adb3069b0e04-5b2f61a3fa4mr555860e87.38.1785917707853;
 Wed, 05 Aug 2026 01:15:07 -0700 (PDT)
Date: Wed, 5 Aug 2026 08:15:06 +0000
In-Reply-To: <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn> <20260706-hashedptr-v13-2-377a07f2f78d@kylinos.cn>
Message-ID: <anLxCshIflMu-1zI@google.com>
Subject: Re: [PATCH RESEND v13 2/2] rust: fmt: route {:p} through HashedPtr to
 prevent address leaks
From: Alice Ryhl <aliceryhl@google.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jul 06, 2026 at 01:18:44PM +0800, Ke Sun wrote:
> Define a custom `kernel::fmt::Pointer` trait and `HashedPtr` wrapper
> so that `{:p}` formatting uses the kernel's `%p` hashed format instead
> of printing raw pointer values, preventing kernel address space leaks.
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>

Overall looks good to me, but one thing:

> +impl<T: ?Sized> Pointer for HashedPtr<T> {
> +    fn fmt(&self, f: &mut Formatter<'_>) -> Result {
> +        use crate::str::CStrExt as _;
> +
> +        let mut buf = [0u8; 32];
> +
> +        // SAFETY: `buf` is a valid, writable buffer of 32 bytes, sufficient for all architectures
> +        // (max 19 bytes for 64-bit). The format string `c"0x%p"` is null-terminated and `%p`
> +        // matches the pointer argument.
> +        let len = unsafe {
> +            crate::bindings::scnprintf(
> +                buf.as_mut_ptr().cast(),
> +                buf.len(),
> +                // Rust's `{:p}` includes a "0x" prefix, the kernel's `%p` does not.
> +                c"0x%p".as_char_ptr(),
> +                self.0.cast::<core::ffi::c_void>(),
> +            )
> +        };

When given a null pointer, this will print 0x(null), which seems a bit
weird. It may also print 0x(ptrval) or 0x(____ptrval____) during early
boot.

It seems like it'd be nice to special-case these to provide better
output in those cases.

Alice
