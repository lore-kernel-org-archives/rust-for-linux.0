Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEB928EBF7
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 11:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059546; cv=none; b=Vivq271h7w8mx6UOM3oaE0Kcnrbsj98Q8E3+mDCnoa/Nip9vLsYyuQVHWDMYa3PHWRPTyj3vldAmEGDn9j6V5t3tL+8k4iH3xeXrlbYV+5f93P4H+xFeDX4CDNyb0kKmv0iAPyASM4OTLpifGbE8J6Lf7bS48dOV7Nav7EkzQso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059546; c=relaxed/simple;
	bh=yVRUqOS2CYRi8uo2hTEIz+5PKHym9RVaIsSTs54oFjI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GLgYBqrlHFeR2qeaionnDKogEVCQUeu8ZHfaLgddp1dlHo7mVtqKd8+0MXzY/rhximgIY4GDFeLbUK/gcwCAtbH/B7nbnpCXWnZPLG9ZWlFzha8zdWLdXaQy+EoXM6zmIFtAsqQedYgFNy/uxAk/Zmisn2a9k9518LZs1Od4IFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u9kyKl9D; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u9kyKl9D"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a4e9252ba0so2959346f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 04:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752059542; x=1752664342; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7pfjHxP0w3hCZHCgkCjxsyoDVLKlWq42k3UCxSzmtnQ=;
        b=u9kyKl9DQ/f52I/Po0YSZS1EGk4OfpsBjnRJGtvgDeCZywkNXr7dzTABfI1FBdoJio
         3o6x7wNa+QhyQcJ3afz9DFFORtQ5D/6CyROLaPac1G1+s2ewUtuyokFPiq33qoC2j93y
         mwHmQmnrMCfwTqFtbPn67DQoIf+XfB784lX/PwuhJlXAWt01hLRcCPd94zTOQtBO3g7T
         iNO5Gaz2gmSzN6zGX+dB/cPBScEev8IINTXCAkLfmwlyxKOe1p8JP0U2I5MAKvVCO4sj
         eVEi48r1iwCxKzHAPmNZe39kUm9K0URNf2LJeOlZp3KHW3/qOipz8gpi98mDYdTEKR10
         RYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752059542; x=1752664342;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7pfjHxP0w3hCZHCgkCjxsyoDVLKlWq42k3UCxSzmtnQ=;
        b=Ti8jg3sJ/hAH5L1IcQbG5AK1O8+Krn8X7imIOWl86S1U8mnyG1zAFfSimfCdJfyrfO
         BNEiik5O25ZAcljogVZJZpTkL/OsTNyr/7pHXQzFuMb2W3GGwPGICceCKCnaZedHU0K7
         KiQ8zy3AVZ1NQo7SbS5L3JPp1wE+PvNZejN3jhPWGE+vWM0nuQdmgIeNVtCuA3m/yAi0
         o1vz0ET40mD27iqNHd9x6XHL7/6MgG/i14p9D4F0Eih36j8F9wkSQjov86mYoElAANNE
         +Sm30V4xUbnb94BBlOtXgRs5EtEQPPWqdynuUD1NUP+1NQLm870x9jAuvCBGmE6YruGh
         Xwsw==
X-Forwarded-Encrypted: i=1; AJvYcCUCNgsNa1SmL/ALXE0/Pj+7Pf/qNP82qMfEj+smRBY3qC3m9R77siBORNk3uugfk2mP2I+cGcBPsyEudy51ww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwERkH7YDWma9o9fMsqBAoyavQvu4QaSgc4qlqgaqJt4FQpIRaQ
	1NwGet49wptw+jGcIa0HPG0aZ0PRkxU4zS3kfWCE5fqhVKoXhkkS6evTx0NulZy5+4hY1QpCd4N
	A5qfdc6rqa+kouwAEKQ==
X-Google-Smtp-Source: AGHT+IFWWKIE00+rdbcs+JPdTc+PwH0NinPLV6cuTwrJHXHL0ApfpDb9almjRtgPPUcQDYAks/1o9+UbkmKtbF8=
X-Received: from wmdd10.prod.google.com ([2002:a05:600c:a20a:b0:43d:b30:d2df])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:41ca:b0:3a0:a0d1:1131 with SMTP id ffacd0b85a97d-3b5e44deb7amr1510167f8f.7.1752059542727;
 Wed, 09 Jul 2025 04:12:22 -0700 (PDT)
Date: Wed, 9 Jul 2025 11:12:21 +0000
In-Reply-To: <87qzyqn38c.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
 <A6L7hDRsDyJJvX_NuoUG_Zb-Jy_BMdGLhjsq5xUSRkl6hpItQD9ZvX5ChAr9QIFH4eeDBpW-Q-582Tt4Nef5SA==@protonmail.internalid>
 <20250704-iov-iter-v2-3-e69aa7c1f40e@google.com> <87qzyqn38c.fsf@kernel.org>
Message-ID: <aG5Ole-PoioPgSuh@google.com>
Subject: Re: [PATCH v2 3/4] rust: miscdevice: Provide additional abstractions
 for iov_iter and kiocb structures
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Jul 08, 2025 at 04:53:23PM +0200, Andreas Hindborg wrote:
> "Alice Ryhl" <aliceryhl@google.com> writes:
> 
> > These will be used for the read_iter() and write_iter() callbacks, which
> > are now the preferred back-ends for when a user operates on a char device
> > with read() and write() respectively.
> >
> > Co-developed-by: Lee Jones <lee@kernel.org>
> > Signed-off-by: Lee Jones <lee@kernel.org>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/miscdevice.rs | 97 ++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 96 insertions(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > index 22f291211636f66efca6b33b675833236332719e..a49954c9b0d14117645be8139db792f1fd22589d 100644
> > --- a/rust/kernel/miscdevice.rs
> > +++ b/rust/kernel/miscdevice.rs
> > @@ -14,13 +14,14 @@
> >      error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
> >      ffi::{c_int, c_long, c_uint, c_ulong},
> >      fs::File,
> > +    iov::{IovIterDest, IovIterSource},
> >      mm::virt::VmaNew,
> >      prelude::*,
> >      seq_file::SeqFile,
> >      str::CStr,
> >      types::{ForeignOwnable, Opaque},
> >  };
> > -use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin};
> > +use core::{marker::PhantomData, mem::MaybeUninit, pin::Pin, ptr::NonNull};
> >
> >  /// Options for creating a misc device.
> >  #[derive(Copy, Clone)]
> > @@ -136,6 +137,16 @@ fn mmap(
> >          build_error!(VTABLE_DEFAULT_ERROR)
> >      }
> >
> > +    /// Read from this miscdevice.
> > +    fn read_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterDest<'_>) -> Result<usize> {
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> > +    }
> > +
> > +    /// Write to this miscdevice.
> > +    fn write_iter(_kiocb: Kiocb<'_, Self::Ptr>, _iov: &mut IovIterSource<'_>) -> Result<usize> {
> > +        build_error!(VTABLE_DEFAULT_ERROR)
> > +    }
> > +
> >      /// Handler for ioctls.
> >      ///
> >      /// The `cmd` argument is usually manipulated using the utilities in [`kernel::ioctl`].
> > @@ -177,6 +188,36 @@ fn show_fdinfo(
> >      }
> >  }
> >
> > +/// Wrapper for the kernel's `struct kiocb`.
> > +///
> > +/// The type `T` represents the private data of the file.
> > +pub struct Kiocb<'a, T> {
> > +    inner: NonNull<bindings::kiocb>,
> > +    _phantom: PhantomData<&'a T>,
> > +}
> 
> Also, `kiocb` is not miscdevice specific. It should probably not live here.

I can place it in rust/kernel/fs.rs, but this is an instance of the more
general fact that miscdevice defines many things from `file_operations`
that we should probably generalize in the future.

Alice
