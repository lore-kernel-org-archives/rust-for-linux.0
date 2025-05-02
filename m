Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C6722A4F8
	for <rust-for-linux@vger.kernel.org>; Fri,  2 May 2025 12:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746187369; cv=none; b=bGFYcNMh3w4fhsJGD74eF6udWvPIybdd8cqmDF6NT/39LlZxyVPcCJnUgn3mumAH4WYdz5nSIt8/1tYZedEqzgNrFXBVzmJ2BW8mOVUH/gYWmhiTeERRTsRAaiK6Lw46g/S0WUdlvdR0U7ZXUo8IOvG00V4gguZGGLs4vNMvqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746187369; c=relaxed/simple;
	bh=g4eFzVvT77yBI+Qw2ofVmfNImjSBjNLhFW9sOqt1FCg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MdcWO0VRTCDOkBLhrxuBDsBCb3nlgLCAZHWvVefdh+XNPup/+8q3YEUMKY22SHXDLR0UwvAknjrVFzcmch8DxjGkeIKucjXRfAt+tbdNB8YF0Czph1Zf9ZXhoKp0KdYb1WqEhK87uXtJNkRzecXfC1AZFLdZMl0D03XvYKUNbXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xSdmdqaX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xSdmdqaX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d01024089so11950505e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 May 2025 05:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746187366; x=1746792166; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UncE169T2um0/KVNW8FIzn79zOglaPAb564ZSpvpVsE=;
        b=xSdmdqaX69MQUlrEAq9p6w8qRT6XBtLfr3BgIdmzCrwZryaTYdZpXVQagcFclU1+O7
         H2TqMkgw1UmrKvAKZmFnLKqNBjyoaln9If6yDBkQ+Kz5ScGtvGf53rvYhFXeA12X4Uq9
         aznHIxk5loGQ/5Rb6kc2ALtv/D9rDRT0hYbsNgmFnp9pVrjpoDghwFn/cHw8pUkasuGq
         ypqkmH854Ea8NU/zpccoXSVMaAQZe5z1VVn5KROkYHhcFTFS6i6f1dCpxcj04MvnzKdF
         EpXkmT83K3VYlqfBSsOEJnxgR0NqFbDkITrh2XhvhC6dij02spIsjpKi4SmbDwdXg9Ew
         /6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746187366; x=1746792166;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UncE169T2um0/KVNW8FIzn79zOglaPAb564ZSpvpVsE=;
        b=vgo6p2x1obHWGz3s4uLRwrxUqD2hr4C0c7KmlSR9n7S0dysh3b4c3AgHTJ/2BQGoCx
         eQAtdqUBxSOKsfiZgWnWHh9bEdNSzR/0HGdfuvCTGGIkFxh8nfQo5REBg1s5TlxWeTbu
         p66fcXl1u4sSSZ4g6tZqvJwJg9jXstWcIHsmUfn/y9xIJBGRarlehDORTrImfimXAhTl
         q/RqbYIH0HZqOYL1kiWbOdA3jt90/ySPnH5TIwZXuk7y+MAevhTypd0Xk3+K2jymzBHo
         auVrRtO+U+G/CguJ+NP3dnL7LSk+fJjPBF1RoJMVItI0aFz7bpUz1L+X5LbnFU/AjnSg
         7S4w==
X-Forwarded-Encrypted: i=1; AJvYcCXsG1SAzi0E/sG6t4z8F91OgXrs1tvNJT9lhW+YHl7r5L+GYP8qjnlnCl5Q5kH/y3LjOODQa4CmQ2Vj3jDSIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuyMKPtu9xPz6OZAC5eTU8bmnBooyUlyU36xxj9wlJoi4ORKwp
	hsUsNAB5dhDinynOywzv6nRS8xj19DFyGJkj6IcXBGFfBVURshcQOuAl5b40qkDA9U7ChtfgsDF
	P/hcJ0oGieUrNTg==
X-Google-Smtp-Source: AGHT+IGr1We1bnkxCvwGNQjj5LrNx2TT3BLBrEN6cQ0S7gvJeMbwhyujVOviCnm19NUM4mVEhK7xhW4ZTpJ7yPM=
X-Received: from wmqe18.prod.google.com ([2002:a05:600c:4e52:b0:441:b607:4ec0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4ec9:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-441bbeb4843mr19195785e9.9.1746187366501;
 Fri, 02 May 2025 05:02:46 -0700 (PDT)
Date: Fri, 2 May 2025 12:02:44 +0000
In-Reply-To: <20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-aref-from-raw-v1-1-eb0630626bba@kernel.org>
Message-ID: <aBS0ZP9tFnujvodq@google.com>
Subject: Re: [PATCH] rust: elaborate safety requirements for `AlwaysReferenceCounted`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Oliver Mangold <oliver.mangold@pm.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 01:53:57PM +0200, Andreas Hindborg wrote:
> Clarify that implementers of `AlwaysReferenceCounted` must prevent the
> implementer from being directly initialized by users.
> 
> It is a violation of the safety requirements of `AlwaysReferenceCounted` if
> its implementers can be initialized on the stack by users. Although this
> follows from the safety requirements, it is not immediately obvious.
> 
> The following example demonstrates the issue. Note that the safety
> requirements for implementing `AlwaysRefCounted` and for calling
> `ARef::from_raw` are satisfied.
> 
>   struct Empty {}
> 
>   unsafe impl AlwaysRefCounted for Empty {
>       fn inc_ref(&self) {}
>       unsafe fn dec_ref(_obj: NonNull<Self>) {}
>   }
> 
>   fn unsound() -> ARef<Empty> {
>       use core::ptr::NonNull;
>       use kernel::types::{ARef, RefCounted};
> 
>       let mut data = Empty {};
>       let ptr = NonNull::<Empty>::new(&mut data).unwrap();
>       let aref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
> 
>       aref
>   }

I don't think it's entirely impossible to write an AlwaysRefCounted
value that can be on the stack. The type just needs a lifetime
parameter. For example, this API is not unsound:

struct MyDataStorage {
    // ...
}

impl MyDataStorage {
    fn as_aref(&self) -> ARef<MyData<'_>> {
        unsafe { ARef::from_raw(ptr::from_ref(self).cast()) }
    }
}

#[repr(transparent)]
struct MyData<'s> {
    storage: MyDataStorage,
    _lifetime: PhantomData<&'s MyDataStorage>,
}

unsafe impl AlwaysRefCounted for MyData<'_> {
    fn inc_ref(&self) {}
    unsafe fn dec_ref(_obj: NonNull<Self>) {}
}

impl Deref for MyData<'_> {
    type Target = MyDataStorage;
    fn deref(&self) -> &MyDataStorage {
        &self.storage
    }
}

Alice
