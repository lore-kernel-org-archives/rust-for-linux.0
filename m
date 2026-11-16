Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794838944;
	b=f9bRzBdRi2v4iBPXRERQUHIN7lnMcj69JELn7N53Y3IDIkXrIVC/qPNLUMqdYVXLeiFk
	 XVMFEXOUpQGT5dNJgaKdcQVtwFjRbRV+ynDzf02rvB/md6xd4I9uqsnFrmOep7VqMJ11X
	 iTCo81bT4hPWpVzC7ruk2dHL4f0NwbVXHcdohXVP8+qDSuvK+jg73oUWpe353KmMtFjkq
	 r6Ch88aaiVt745RIvtZSUXM9g8eUGM+a7s7MLmZTquyj8m4o9+0i4+RSScfIxJZL5h2cQ
	 BvlxSozUhwbiwYangwJGwzQsTQPbV3qNpCAv1VHPrsy6iX9IHQATTY2xxJ9tCFKfCoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
	b=eVi0PmpxgpsRkzvAUgDInxm6H9G5bGEyHk4/CQ5TMiXrIp182yohY8r2Z1aK7eAHCSxH
	 TdW4H6wRaibB2h4Y8Tcu4Zygils8Fzaxs4SwXLCp9eXzlMpuIH/xW7wDD8kjCZC0AV4fc
	 NrPXa75S2WmGI5PU25uivuv6fm5EsACZLxpri8ndpYhetBIPRMHU65YRws6jjM1r5dcib
	 2qaBJs/2zJoxY4aBY0wX9JOyOBoxfXEKucIfT3vwZ3IAPFsZFswkHxwCo9CDBohkTtiCb
	 4EKJjoY9ks5BrNqmGJJROlwHWBW3QTFIgbabCAZGmuekgDtJ+xOvuWL8r+cadFEtkFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbKEu8PE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.174
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEB9606A33B
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 14:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EEB9606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EbKEu8PE
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-949680e6d82so167481985a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 06:22:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794838943; cv=none;
        d=google.com; s=arc-20260327;
        b=aHiPLH3fA0FZz5TIM0QS+ZoIcz8ho3ol1fTOmIQ9YqMLHwkClQBGiGQQh2iwu725em
         7kKErowvElp2JOZgwi49fqC8aCb+r1A3eRvRnMEeQPmYUw24Rb/3kZyLqjO8gESk63wj
         ckz/86S7KZGUdZL/QCqhvzncKMIYcoTOaxWeMrUX8wwbd0E9y8wWRM0WzbEkm8aeF4Ok
         qAiRsipBqCCaPAw4lKQdoEcxKt+rlEPoUTPBuFOhWZ1EzNaKqJZCoRVZN86szXlBh7ut
         x+2H0oPuj1AbBt7Lq/9tR0z015lHX7ktW0ZWEeD3gy+XN4gH9C9xmfk9S57v1gfSzeGl
         BEfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
        fh=2e2WKYe6HQB7IYAEsSnXkTNioMfWYM+RdWjR/nv+89o=;
        b=BaSqm3HPDAyv40zyrHV9pz1QhrjZsbECU5a8hwl4QnkC3cKfqsuMu2LBa5aAyu5SW9
         y2BXeeJ5iiHnSsV4rh4HPe4KqUxU1eisjATZ6WOa1wxVVmneSOdBRtwycw/7kCuqsd3M
         a7tykxFdLg71EZG9OF7rD3w6g9s3i9U/F/TcHEvFzZVcG0lLNqewtm2Dh29D1gLVLgky
         dlpLpwd/BxefiYL+P7H/4hCL5FprHX5v2roDFBuWAI1BB/LZgctwNVBDNqjSqPe6QZS3
         TFa6LyoNTlcA4TgI8SJAiCPrYFpy+bQLg0k5UwpbwyL+s2o90Y7YB5osqlVmbIdMDxis
         00mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794838943; x=1795443743; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
        b=EbKEu8PEVyxZpvcV8E8o8s9RtLWPNC55zu7a8fDADbC9Qtok+mA5D2Hmu3/yKIPklP
         N5xe1Gr6y/kmZM9MlRy+0wk+5TKAgA/e/XOfEj89PP42HU4Cy41ngVQWRpWacjsHvLkg
         TSpsYAcI2DIss4ePq6B8twl2HIq/V7b6yzsIwPMkPIoi3gh/lKpDsl5OpKaalWCooAnE
         o7gKkHDDG16mb5yt6jLIFQ8ImWdnBYGaOrYF+Vtx/6CEABrzEEClVmwTMZJToFfYc7dM
         pFwlAiLfKTPgM2nX72hL1QwhvkEyiHr+7SiVvkSMfhxjTmz0v9pe5QW6DooX2f4yr2s/
         00ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794838943; x=1795443743;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=whWJsRn/1UObkhQ6vFbtYGotnDXUyjncCuIw3+hU87g=;
        b=1gUaSaqBdh0tLpL1tW/dfZRC9ie8s2j4Y4hsnWQ3RbdvhJfyJ13mF2in1CL91npJdD
         yj/wkMBjjA8DqL+8bXJecQrAwN4YipmbHsO7dCWXBMrlThWb1HTJUo75bWW8y4RvuFym
         XImeCSuyeRlya/ZB0rSAGiFY6DboPZyQQdasgrjR5xULjq5uDNRcBYTMCf5m8TR51RK8
         9iefcz2grXBG2cOe015A487xzRQZpf5yaM31INLzULyHiClJ8acLFDEt6uj2W2EJz+w+
         2ohgApTIkdJgUcm9dx6o9g1iPe/VA/mXEQuM/iMCH29qcieOR4bq/qSmGRhbkmRJPPz1
         q6BA==
X-Gm-Message-State: APuU4Z8QAyIaWvAG6LkY9OlsypvTkfqCLwhXnJie6LJ+C3m2ZuDJI/ao
	q2edIF4/gcbKEmjJ2hE2RrHu7GRBYnc0rQzfXsuMJSIutt0nW3zIJ/CBSM7P95VHxyMoJou0Asv
	13gakvo/i3yuEyPbp6Hmn6+1Iyu6dvJs=
X-Gm-Gg: AYBFou1QWiy4zNtV4czLyXyXyeauXTE4fGb2vl2QcJKmHNm71L57NAj7MriWuLT5q1v
	G4gE5wjxLuikpbjxt6EFRwf5dTupM/Vf3WufHbFy45XOBH5UH/SRNQR9jgwv54R2iWbPJO796Mt
	f+fZeseXorGl9rDYguqijpZc+HjaoIif9TfUoYi/7Cv+g0BoKFBQtltjDS4rJ8E2lF+/PoOUIt/
	HuYnzumSGvm/xRwesvmbTh1Z39YiWpZQOHgh7r+EUfkWYzjeW/R83avBzt5/63kJ/rMpynEaJHv
	YqxI0TFhzYou6Y2Q1dnJjrKREhNQef7bIEmJ12XgdNys+/kuQ2dg95SPTtaGCM17IrMQDLsuBpe
	/x+Igg1TR0FWDNMxW0gmj7ue9H/xLsKNcp4ly
X-Received: by 2002:a05:620a:6497:b0:93f:2aa8:c550 with SMTP id
 af79cd13be357-9494ba7e95fmr1498779385a.26.1794838943170; Mon, 16 Nov 2026
 06:22:23 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114200703.33229-1-mbkchelofficialdev@gmail.com>
 <20261114200703.33229-2-mbkchelofficialdev@gmail.com> <DMWMG16XGPYB.W659Q8DBV6F4@garyguo.net>
In-Reply-To: <DMWMG16XGPYB.W659Q8DBV6F4@garyguo.net>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Mon, 16 Nov 2026 16:22:12 +0200
X-Gm-Features: AclHuK8fns1-r926XfwgL2WRc_EEssCxZIC_o5cjkaSCMh-o-Y6f2l6EEQJ4o9U
Message-ID: <CA+YDrKAM1-Jx+WH+ewzFuU9SzF=Ef=QYs-stgDNHC=7t84cCFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sync: lock: allow fallible initializers in Lock::new
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Matthew Auld <matthew.auld@intel.com>, 
	Arun Pravin <arunpravin.paneerselvam@amd.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gary,

Thanks for the pointer, I missed Philipp's series. Please disregard
patch 1/2.

Patch 2/2 (rust: gpu: buddy: store the allocator inside the Mutex)
depends on the Lock::new change. Which tree would you like me to base
it on? I can rebase it and resend it as a standalone patch.

Best,
Ivan

=D0=BF=D0=BD, 16 =D0=BD=D0=BE=D1=8F=D0=B1. 2026=E2=80=AF=D0=B3. =D0=B2 14:0=
8, Gary Guo <gary@garyguo.net>:
>
> On Sat Nov 14, 2026 at 8:07 PM GMT, Ivan Tverdokhleb wrote:
> > Currently Lock::new() only accepts an infallible initializer for the
> > protected data, because impl PinInit<T> defaults the error type to
> > Infallible. This prevents wrapping a fallible initializer, such as
> > Opaque::try_ffi_init(), in a Mutex or SpinLock.
> >
> > Make Lock::new() generic over the error type E, so that it accepts any
> > impl PinInit<T, E> and returns impl PinInit<Self, E>. E must implement
> > From<Infallible>, since initializing the lock state itself cannot fail.
> >
> > This is needed, for example, by the GPU buddy allocator, which has a
> > TODO to move its gpu_buddy structure inside the mutex.
> >
> > Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
>
> See https://lore.kernel.org/rust-for-linux/20261022160725.2215244-2-phast=
a@kernel.org/
> which is already in linux-next.
>
> Best,
> Gary
>
> > ---
> >  rust/kernel/sync/lock.rs | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index 10b6b5e9b024..26c071088b02 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -128,11 +128,11 @@ unsafe impl<T: ?Sized + Send, B: Backend> Sync fo=
r Lock<T, B> {}
> >
> >  impl<T, B: Backend> Lock<T, B> {
> >      /// Constructs a new lock initialiser.
> > -    pub fn new(
> > -        t: impl PinInit<T>,
> > +    pub fn new<E: core::convert::From<core::convert::Infallible>>(
> > +        t: impl PinInit<T, E>,
> >          name: &'static CStr,
> >          key: Pin<&'static LockClassKey>,
> > -    ) -> impl PinInit<Self> {
> > +    ) -> impl PinInit<Self, E> {
> >          pin_init!(Self {
> >              data <- UnsafeCell::pin_init(t),
> >              _pin: PhantomPinned,
> > @@ -141,7 +141,7 @@ pub fn new(
> >              state <- Opaque::ffi_init(|slot| unsafe {
> >                  B::init(slot, name.as_char_ptr(), key.as_ptr())
> >              }),
> > -        })
> > +        }? E)
> >      }
> >  }
> >
>
>
