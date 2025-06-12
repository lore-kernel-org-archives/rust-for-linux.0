Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD2D1F4CAB
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749720511; cv=none; b=obhZSEKxtfI9Q6XxSBif+nAEIAsCKOOii71HhTDPvE/jc7EOo4L7Lf+LGMR3exJKR9/BdT6bt0QJHCjZ67b3+i9EUEWfHazVc4l0R3KWM4172+w8pccC+soD8c+RKFaZThQwWdFBoHZa1w608uS9I7OJMHbEpayJEWyX6/CggAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749720511; c=relaxed/simple;
	bh=IFgb4F5Iu+UKrhX7of1UyD0GJ8X+vqX7HiKG8JEk82Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qolWmAtycWZJzXbxnXCQZXZZRx1Cck/ceYAXX2rFIBmJUPvwGm14S21b4uU8X7qQ4BdpxwNJ+qzxKjtq4Ho1geRgALyOv5POqxLHt/Rm67oYvR3vYXDMOlKiQoT71zsjCM3REV5fAatoMI7rfcFnVVN0KvG5SP8235hjU2VnIdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jWZCARwj; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jWZCARwj"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-451d2037f1eso4190445e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Jun 2025 02:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749720508; x=1750325308; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qGXjO0gZf7c+kFxei3MxTslMSXhk7nEUqCSL8/HYDPk=;
        b=jWZCARwjeT2lQ6dM642Y+5VLANqkH2kjT+rxa/5YvXzx6WRlqIFpF4hu1YCTEaaKqB
         ElKfSlWqn0d6yLOO1kTQyR7xBDWxreHX+Ya8ABBuJ9+CA+TFUZvCIg3WuLdsLFHpexqn
         mEexJ6Dj+fqI9F4u1JlGXFEpZ/0/o48x8jfsCopqX3jwMAKW2M1ktVi9DsExO32RJ/L6
         5j0syTEbpfSiYtBEncWReAK6GWxxgRkrlFtrVsqQ6q2QbYIEZ80Vd8IgNm+WYS7cQSyo
         HdHjD+cv/fH9bPXT3nZiXGe3T5antdxOrC7DVosbrmE9e+M+02UZhO/vC/KUUpyrawEa
         bg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749720508; x=1750325308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGXjO0gZf7c+kFxei3MxTslMSXhk7nEUqCSL8/HYDPk=;
        b=pGDg9sKxm+JUrRbJ9pszSN2/gyaB9Hf5ZpVP/+rjPU2XsvCLzas5gfvG5VeFSM2Rvv
         KMNlkMPRXablTKXmjYmHhAd2oDCaFFqG5LIwn4w2XhFLGjTqbs8SPTLsOc8o8eLN9UxD
         ZkCip5zlnTRRCHdb0tLGrVzi5968r1PJiVcHdPxCqcNK/XCv2b2ppgs8xhdDbWnOq4pZ
         XFjECBOGZYb6O9xgLsu/Di9GT6NxqdfOPKHeWbn2r+t+DRHQ9WPO1UOoVg0DuvSEtzuP
         1nXsVIEaLO1D8rQKAvzjKheGS9eyKAHL282THi+wmza0bFQ/J0wn/i0Lee8O9e5fCMFW
         1gSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPJCURilVFkdNbyIjetyWmyjVV/n3AEu57c4cIc5pu9L5Am1QWO8BvCMXeHDLpZj5o17pfkN/56lTjlWDNUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXgbZvdXZ4BNzIkGbADz2VST6aqp471hbo6AUHRajqJuptnvYP
	ICP4trOWsac7YBoACVV4J0sMxAZZFJ2XEsufmA81P2xVmMENzZEikkpjGdoi4HYxbJNYwXUhmjX
	iP6dMHFM44nYzAQ0DCg==
X-Google-Smtp-Source: AGHT+IELdFB35Ra3YOSzs2LbO39EM3Mp7jmY8Bt+ho64HVbiiHP3AgFPjdClR2DXKvVsMjH2Ml3en5KIyqK6lMo=
X-Received: from wmrn17.prod.google.com ([2002:a05:600c:5011:b0:450:d5b8:85b2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6098:b0:453:1058:f8aa with SMTP id 5b1f17b1804b1-4532d2b6f74mr23413365e9.15.1749720508511;
 Thu, 12 Jun 2025 02:28:28 -0700 (PDT)
Date: Thu, 12 Jun 2025 09:28:26 +0000
In-Reply-To: <20250602232842.144304-3-marcelomoreira1905@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com> <20250602232842.144304-3-marcelomoreira1905@gmail.com>
Message-ID: <aEqdur4JTFa1V20U@google.com>
Subject: Re: [PATCH v4 2/3] rust: revocable: simplify RevocableGuard for
 internal safety
From: Alice Ryhl <aliceryhl@google.com>
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: lossin@kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 02, 2025 at 08:26:23PM -0300, Marcelo Moreira wrote:
> This commit refactors `RevocableGuard` to hold a direct reference
> (`&'a T`) instead of a raw pointer (`*const T`). This makes the guard
> internally safe, reducing the need for `unsafe` blocks in its usage
> and simplifying its implementation.
> 
> The `try_access` function is updated to leverage `try_access_with_guard`
> and `map` to construct the `RevocableGuard` in a more idiomatic and safe
> Rust way, avoiding manual pointer operations. The associated invariants
> and `SAFETY` comments for `RevocableGuard` itself are removed as its
> safety is now guaranteed by its type definition.
> 
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
> ---
>  rust/kernel/revocable.rs | 26 ++++++--------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 
> diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> index d14f9052f1ac..43cc9bdc94f4 100644
> --- a/rust/kernel/revocable.rs
> +++ b/rust/kernel/revocable.rs
> @@ -105,13 +105,7 @@ pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
>      /// because another CPU may be waiting to complete the revocation of this object.
>      pub fn try_access(&self) -> Option<RevocableGuard<'_, T>> {
>          let guard = rcu::read_lock();
> -        if self.is_available.load(Ordering::Relaxed) {
> -            // Since `self.is_available` is true, data is initialised and has to remain valid
> -            // because the RCU read side lock prevents it from being dropped.
> -            Some(RevocableGuard::new(self.data.get(), guard))
> -        } else {
> -            None
> -        }
> +        self.try_access_with_guard(&guard).map(|data| RevocableGuard::new(data, guard))
>      }
>  
>      /// Tries to access the revocable wrapped object.
> @@ -198,22 +192,16 @@ fn drop(self: Pin<&mut Self>) {
>  ///
>  /// CPUs may not sleep while holding on to [`RevocableGuard`] because it's in atomic context
>  /// holding the RCU read-side lock.
> -///
> -/// # Invariants
> -///
> -/// The RCU read-side lock is held while the guard is alive.
>  pub struct RevocableGuard<'a, T> {
> -    data_ref: *const T,
> +    data: &'a T,
>      _rcu_guard: rcu::Guard,
> -    _p: PhantomData<&'a ()>,
>  }

I don't think this change is valid. Consider this code:

fn takes_guard(arg: RevocableGuard<'_, i32>) {
    drop(arg);
    // rcu guard is dropped, so `arg.data` may become dangling now
}

This violates the requirement that references that appear in function
arguments are valid for the entire function call, see:
https://perso.crans.org/vanille/treebor/protectors.html

Or the LLVM perspective: When Rust sees a reference in a function
argument, it adds the LLVM attribute dereferencable to it, which implies
that the pointer must be valid for *the entire function call*. If the
memory becomes dangling after the rcu guard is dropped, then this is
violated and the compiler could perform optimizations that are not
correct.

Alice
