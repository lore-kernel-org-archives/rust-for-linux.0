Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41FD3128AD
	for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767175933; cv=none; b=BR5YtwJkneEEPksJIVq6I+OuML1rRTZTPe+ChR84qTazNQWUHQ+p89Yezty0ql86bVORPIcQD/jH0ZzlOtFNu64crzAJY21+0mnX2JjzYHymy6RkJ5PTNaTzSBU6UEIwyKd8fPry6Fzjd6vtaQvxwb34SwhwMnlFyPvMdTYzkpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767175933; c=relaxed/simple;
	bh=3aQKJU0TBwKw/JymWyNqfA/UgBthI0BjnAw0FWaciKQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sMZ/FQ55UEQiPovk5/O16ucGFB7VjcGKgi6mvLKs67H44dbHP9IHSh1EveEazWMfmacKIIw8me+rAZ6Qay3m5D5fOwN05CFct75bva82po1tP3oy42VNXKBgt1uzhNHNoGbun4LONc0oU59/IcQYzzFl48z+PVl1qkqzL9ZisBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fZAr5FZY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fZAr5FZY"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-477bf8c1413so68651695e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Dec 2025 02:12:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767175929; x=1767780729; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtGQZWIk6btmN6Wc/o4tVe9XiJTHY52MW3CNm6gJwpQ=;
        b=fZAr5FZYfU16wZXgHrfyAFzratRMdf3qIMRkYCJWayx4QHVDYpfiBk2aVi5Gyoz1kV
         zk8arVkxcyBjqhRymblDwcC4V8GZUuw4ojfx0tfAEW3pN36FRSAHKDlY9WdAiMt1tnkL
         2GBJ+vx2Ru6TuOAAyL+aNsWTAAuedOV1oW8e/kcxCWv3BgzwHZyPg16WAZYp5dsrxT/r
         mjlhNRvAUFSb8n7nBYSYHIlybew4BrZDDQ0c+uraBiktpO9Jevb3fyeCvhw1RyF2DlrU
         YVnYL2y4kmHpWU60Ta68RGdNe1mLajOnNq2licob5xU4iVlTiIw4dtN2mKwGYt7+YxI5
         /Evw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767175929; x=1767780729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtGQZWIk6btmN6Wc/o4tVe9XiJTHY52MW3CNm6gJwpQ=;
        b=IrMD61Tv6N+nMVnshl1ZNCqFL+1P3GIBJDQNmX0xfcsw8GwP+1eNz6oIYkeVFOkzEg
         vxf5KAKU+0tV9i3Xafm3y+60gaPXoVdk+gHZ4wo4qsOQts1OkD1GHdxOsFIjLc7jl+5g
         uksGETj+FT1PgRMLL1Uj422sMleUC9+m2z19RGU6UmyrLouDVDhMJp7vmvHaax/NrzCd
         LSCSTAD03Elv29CkixBYDmjRZziEdaldlKtsIvpx1+KTj5LSYa7HMT946yutU82/XdDq
         gVnKgqdNp3UabJIGu9yIekbGSBYHxrw/8Snw9rlKTeGHch5F7FMsQ1slyaagu+TCNT59
         dWIw==
X-Forwarded-Encrypted: i=1; AJvYcCX85orFd3ATDfTYyaqtqRdClimgOvZwU0FPEg83DtZqdALofpE43xwnw4qkV7NSEtF+YpFfcKceA8L0nCHecQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3V5STsuq8RYAcKu2cXuGa0EwHigluf1Hsir/d29oi6xXjsCp
	1eUbiPkXVDn1Nn1/ETSNeLHGqvEhWYlT0GRVizIi27ptMYcN1XcPerhCTF8SLVgFuWNX2HZu3li
	r0xMRzpC9Dk6Hxa1aNA==
X-Google-Smtp-Source: AGHT+IGlQ+41oq6YwxLty4A6uiXW50pWPOXJqNSkzcyRWN0uX4EnbXnYuNdtftZDBHyGBdcXQIKX7rJXmvoriN0=
X-Received: from wrp5.prod.google.com ([2002:a05:6000:41e5:b0:432:84fc:4516])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:584e:0:b0:430:f622:8cca with SMTP id ffacd0b85a97d-4324e511553mr47029840f8f.56.1767175928851;
 Wed, 31 Dec 2025 02:12:08 -0800 (PST)
Date: Wed, 31 Dec 2025 10:12:07 +0000
In-Reply-To: <aVRgTQWhqjKB6xpK@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251230093718.1852322-1-fujita.tomonori@gmail.com>
 <20251230093718.1852322-2-fujita.tomonori@gmail.com> <aVRgTQWhqjKB6xpK@tardis-2.local>
Message-ID: <aVT296MBoaSzYqAd@google.com>
Subject: Re: [PATCH v1 1/3] rust: revocable: Switch to kernel::sync atomic primitives
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, arve@android.com, brauner@kernel.org, 
	cmllamas@google.com, gregkh@linuxfoundation.org, ojeda@kernel.org, 
	tkjos@android.com, a.hindborg@kernel.org, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, tmgross@umich.edu, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Dec 31, 2025 at 07:29:17AM +0800, Boqun Feng wrote:
> On Tue, Dec 30, 2025 at 06:37:16PM +0900, FUJITA Tomonori wrote:
> > Convert uses of `AtomicBool` to `Atomic<bool>`.
> > 
> > Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> > ---
> >  rust/kernel/revocable.rs | 24 ++++++++++++++++--------
> >  1 file changed, 16 insertions(+), 8 deletions(-)
> > 
> > diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
> > index 0f4ae673256d..47cd2b45eada 100644
> > --- a/rust/kernel/revocable.rs
> > +++ b/rust/kernel/revocable.rs
> > @@ -7,12 +7,20 @@
> >  
> >  use pin_init::Wrapper;
> >  
> > -use crate::{bindings, prelude::*, sync::rcu, types::Opaque};
> > +use crate::{
> > +    bindings,
> > +    prelude::*,
> > +    sync::atomic::{
> > +        ordering::Relaxed,
> > +        Atomic, //
> > +    },
> > +    sync::rcu,
> > +    types::Opaque, //
> > +};
> >  use core::{
> >      marker::PhantomData,
> >      ops::Deref,
> > -    ptr::drop_in_place,
> > -    sync::atomic::{AtomicBool, Ordering},
> > +    ptr::drop_in_place, //
> >  };
> >  
> >  /// An object that can become inaccessible at runtime.
> > @@ -65,7 +73,7 @@
> >  /// ```
> >  #[pin_data(PinnedDrop)]
> >  pub struct Revocable<T> {
> > -    is_available: AtomicBool,
> > +    is_available: Atomic<bool>,
> >      #[pin]
> >      data: Opaque<T>,
> 
> I actually think we should use Atomic<i32> instead of Atomic<bool> here,
> because in most of the cases `T` is a aligned to at least 4-bytes (e.g.
> Devres uses a Revocable<IoMem>) And in that case, using Atomic<bool>
> doesn't save extra memory but makes the xchg() operation slower on
> architectures that don't support byte-wise RmW instructions (e.g.
> riscv).
> 
> My rule of thumb for using Atomic<bool> is: when you really care about
> the memory usage, and you can guarantee using Atomic<bool> is saving
> memory. For a general "flag" usage, Atomic<bool> is not strictly better
> than Atomic<i32> in most cases imo.

In Binder I believe we only use load/store with Atomic<bool>. Does it
matter in that case?

Alice
