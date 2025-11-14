Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD843161B3
	for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 14:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129673; cv=none; b=TVDPOeMuHvOs5qsit25N9bZN5uJVRIRcdpRy+gxAiYOuz/xdYvTG8zzxdmI+ASsJ2cas3ajL3spSqjTw4UL04i0cjM+g1WMO7jzSuCmpQEROA8xS5KUOFASJaG7Kd+FjJJZis1xtE+qunKSaoGw5FX9AsUfOqQeBKyX2f6/LZEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129673; c=relaxed/simple;
	bh=2eR3akRVZnrVHsg+J5EG6VOJ99kql8wG4e+pk/Ll7VU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KPoFOP65MFEFoLEIYn+I4hr9fyBqBBmoTBMw4ipU+U/PCG39g2to3VNy+XNEY/ze1a1bikFTrkvw5+gXKZU5o8S0zcbhn1pXNQVoLrz7Y54SVHr1vV2wNn6m9bFBhEwDLq0x24RWfxkHgh5AoHR94sjhzFOXJqH3w3qsgk23piw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GE/YTBpF; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GE/YTBpF"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42b2ffbba05so1263105f8f.0
        for <rust-for-linux@vger.kernel.org>; Fri, 14 Nov 2025 06:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763129670; x=1763734470; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=W5aM3chhkUgJL4ddkf6WLZOw7VDXbIkdHXO0/Ou1Luc=;
        b=GE/YTBpFbUc04TGIEImJJQidjxauQK8QcpdJjiDd0N46KZt6b2sHnIbluxvhUYZHr3
         q+ltMV/tK8PzulPTpDaeJ+9MuqTNv1WkkF8lZ2cLmZhfHoZ1fC+xGN5Oa++VVVk6e3Rk
         uf4xCIY4kQByB6lUjwG9oWPPS+K+EKk4pgd/xALJxmenh034lOv+CsG+r5lkOnY+sBaw
         JU1aQI+6FyHF0tjepqgou2aNowqbLReoNRep49ixN5eRqXjvCHCBvAfnR+XEZMXV1nx/
         W9A4Y5M7oOpuZx1gheEWbidX+YB04myzoUo7sgvXdLCFaomkMLcrB68W/H7sHMBNANBC
         hQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129670; x=1763734470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W5aM3chhkUgJL4ddkf6WLZOw7VDXbIkdHXO0/Ou1Luc=;
        b=oEX8nX/Fh5SS9FIHyzxut9r3E+k3nwmz+8KZCIDzZVeyhsh5O0EBGlCp4bKHai2bca
         FqjlAh+DFw2WfQIuDX9U701ByiQWtEQXd1sFg6igYnG4L46oS6pmYQxuJpHsQ0kzeZFY
         +TKVbbR29nfQknal9s/sw8+0eUjCVUj2/bzealt+NwpnLSwsoziFgLf2/iHfSDGSkpGf
         k01quocL8a6dIuwvQTneF6XRkLOzEiSnpoZDYCixyx6jfLmgzJJ34vIW9ZLFDa0F9WcH
         jG46WxfbQVelU9LCMC/2Ksw8lfQrhxNLm/yr/mhoBY0FAbmkekEYUupCalaEX6aaUUM4
         xTIg==
X-Forwarded-Encrypted: i=1; AJvYcCWvjNnuuAtx0ZZ1xSYdkhay276G9dHtNwVchXZR14iPPMFowWQUKt/B3BiG9KQqFV9gjXe5esaRYU3j2BZNgA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwN7ZC01JBQYTS66ZbAw/hr9V+39s/RdSEuMJqICWTkI6uK1laY
	0nw6YhzbEU59QgauGrcZMiKAybihuX1H/todQh5yfykynfUXM4Lj1AGXzARt+jbJOnwh0CRIKm6
	OcfgzuQZGA6liLKCIPA==
X-Google-Smtp-Source: AGHT+IFXeT4yFx0oG7rvNrSpRCt3VNkTaWIE/y/gfn9SIO7cDd+KCiseUbyEqcvVAhw2AOWk2zPC1arie5+9UX8=
X-Received: from wrbfq12.prod.google.com ([2002:a05:6000:2a0c:b0:42b:2fa7:5a3a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2406:b0:42b:3592:1b88 with SMTP id ffacd0b85a97d-42b59398ab3mr3120567f8f.50.1763129670236;
 Fri, 14 Nov 2025 06:14:30 -0800 (PST)
Date: Fri, 14 Nov 2025 14:14:29 +0000
In-Reply-To: <20251114140020.327075-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251114140020.327075-2-phasta@kernel.org>
Message-ID: <aRc5RVnXe4PGNkt0@google.com>
Subject: Re: [PATCH] rust: lib: Add necessary unsafes for container_of
From: Alice Ryhl <aliceryhl@google.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Nov 14, 2025 at 03:00:21PM +0100, Philipp Stanner wrote:
> When trying to use LinkedList in the kernel crate, build fails with an
> error message demanding unsafe blocks in the container_of macro:
> 
> error[E0133]: call to unsafe function `core::ptr::mut_ptr::<impl *mut T>::byte_sub`
> is unsafe and requires unsafe block
>    --> rust/kernel/lib.rs:252:29
>     |
> 252 |           let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
>     |                               ^^^^^^^^^^^^^^^^^^^^^^^^^^ call to unsafe function
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
> 100 | | }
>     | |_- in this macro invocation
>     |
> note: an unsafe function restricts its caller, but its body is safe by default
>    --> rust/kernel/list/impl_list_item_mod.rs:216:13
>     |
> 216 |               unsafe fn view_value(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
>     |               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>     |
>    ::: rust/kernel/drm/jq.rs:98:1
>     |
> 98  | / impl_list_item! {
> 99  | |     impl ListItem<0> for BasicItem { using ListLinks { self.links }; }
> 100 | | }
>     | |_- in this macro invocation
>     = note: requested on the command line with `-D unsafe-op-in-unsafe-fn`
>     = note: this error originates in the macro `$crate::container_of` which comes
>     from the expansion of the macro `impl_list_item`
> 
> Add unsafe blocks to container_of to fix the issue.
> 
> Fixes: b20fbbc08a36 ("rust: check type of `$ptr` in `container_of!`")
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> I'm currently writing DrmJobqueue, a new piece of infrastructure. It
> uses LinkedList and resides in the kernel crate. When using LinkedList
> from within there, for reasons I don't fully understand the error above
> shows up.
> The other testing infrastructure doesn't seem to run into the error,
> though.
> 
> P.
> ---
>  rust/kernel/lib.rs | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index fef97f2a5098..a26b87015e7d 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -249,8 +249,11 @@ macro_rules! container_of {
>      ($field_ptr:expr, $Container:ty, $($fields:tt)*) => {{
>          let offset: usize = ::core::mem::offset_of!($Container, $($fields)*);
>          let field_ptr = $field_ptr;
> -        let container_ptr = field_ptr.byte_sub(offset).cast::<$Container>();
> -        $crate::assert_same_type(field_ptr, (&raw const (*container_ptr).$($fields)*).cast_mut());
> +        // SAFETY: Offsetting the pointer to the container is correct because the offset was
> +        // calculated validly above.
> +        let container_ptr = unsafe { field_ptr.byte_sub(offset).cast::<$Container>() };
> +        // SAFETY: Safe because the container_ptr was validly created above.
> +        $crate::assert_same_type(field_ptr, unsafe { (&raw const (*container_ptr).$($fields)*) }.cast_mut());

The unsafe block goes in the impl_list_item! macro. This change makes
container_of! a safe operation, but is should not be a safe operation
because it uses byte_sub which promises the compiler that this pointer
offset operation stays within a single allocation.

Alice
