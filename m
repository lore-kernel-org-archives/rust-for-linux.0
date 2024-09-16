Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE37B1586F6
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 15:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726499358; cv=none; b=tP75hbs7Adf7HdWUl2upehmIjX+XkgHXvXzH931igzCsZCKb8J5BCa6I2EJEmLKoKHNePOhFNiECSnIY9IUY0LOKt4F3xeMLJG0VZgFMQsGymrlq7MK4TurgQE1uNNF3Xe6XOudXCWqjjCOufLVmAY7sn9hh5kwP9yOCrIIfzCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726499358; c=relaxed/simple;
	bh=l165PztHVlsogQc+EgLOaphQH7X3VmvNCP4c375rVt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqhP9BtnjRA4YiLaXCwvDNBzkbIwJJ+DlcUhA9di2uo5jJ5WIhiiiwtpqjuhlWaQzcXwsrsppi5si/9r29vseAPEE5/3woX3c89KYsDIVUT9aVItZvj3iYt/D6IjU5GcLHPDdoNI5ljDXulwSs7ri15QCvkUiQV0ntoHsZK4S3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=fP6EWdcC; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="fP6EWdcC"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cba6cdf32so37896435e9.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Sep 2024 08:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1726499355; x=1727104155; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKf38lNbWYYuuOUwA4zcVP/sOLD6l437bW0Md8dWghA=;
        b=fP6EWdcCjsr9Kzci7iKixoQABwRIxPD4os/BQtCamQhXc4PZCGuhtnsWoXOCuv8HEq
         ooqFRnuSGDZAqnTpR6EragZsoUItGhP0Z0AHejy+nJU9m+75SRP5bSnIM9k811Dq+vqF
         ViZpa1mxADauQ3mEfwsL0MDEjmMN7y8jwFDpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726499355; x=1727104155;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKf38lNbWYYuuOUwA4zcVP/sOLD6l437bW0Md8dWghA=;
        b=LhcUyt3XVo0Tj575QWx8j1aI3s9vn52wwoNSDXYXheJDuL2USK/QpPELj6Gn6+r3Sq
         GHPAdNPNhyLW90PZ12PS/O8IKsS12He7WfLQyRgFSnUY/Obf/FX4MjcRI0C5Flhi421M
         uINb/wiAx4LneNfLOhWlOr7uPCWA+gBzfX8jHtc8nMriDIzuafBAXtdqCnUeSLYRtw7O
         fWQ73bz0fwNCck/bQDzstvEh0QtnEQRTPC9WFx1f3vcNRZrO0GVxUhRWZUhe7+bY4Fll
         eu9ArMJqYflhdmZV/0RQ6lAqRb5KduX9xnN6ghH+X++itWWDf07wywHb2kt7GDSXUj+p
         4R8g==
X-Forwarded-Encrypted: i=1; AJvYcCV9smyeNzE2rvl/qEu7pyb7mPFRHfHLs7/ReWwir4oMgk5J61PrGBTi4Fa7Dqy/MWwogmLcxpN2bmgIrI1JMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqDRzHRAMZA/Q9fnY2TFv/ATIBXnX3PqxtWoGC5OdNEOdbMcA3
	goZZD8MLUxT66AaschTSbCj5EWv58o/xdUp1eq376FLVCVBZ5gbMJnRNN/KaDQo=
X-Google-Smtp-Source: AGHT+IERkyDzjsGinkuBm373Llf3+qFfTfI8eIyqGUPZ/6vDL5lU0W2gqHqTCbEpld04k2T6zXwamA==
X-Received: by 2002:a05:600c:1549:b0:42c:a574:636b with SMTP id 5b1f17b1804b1-42cdb58f622mr98033535e9.35.1726499354697;
        Mon, 16 Sep 2024 08:09:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42d9b15d2besm113378045e9.25.2024.09.16.08.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 08:09:14 -0700 (PDT)
Date: Mon, 16 Sep 2024 17:09:11 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: add global lock support
Message-ID: <ZuhKFxEVDtzoZEbw@phenom.ffwll.local>
Mail-Followup-To: Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240910-static-mutex-v3-1-5bebd11bdf3b@google.com>
 <ZuRh9niSrX6E5CWq@phenom.ffwll.local>
 <CAH5fLgiaPYphXE-Azfb0MU1EzsNpAMFntDeAt8YAMj5KAxS_xA@mail.gmail.com>
 <8c233e14-e380-417d-84f7-d5056a768427@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c233e14-e380-417d-84f7-d5056a768427@proton.me>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Fri, Sep 13, 2024 at 04:52:02PM +0000, Benno Lossin wrote:
> On 13.09.24 18:10, Alice Ryhl wrote:
> > On Fri, Sep 13, 2024 at 6:02 PM Simona Vetter <simona.vetter@ffwll.ch> wrote:
> >> On Tue, Sep 10, 2024 at 02:23:34PM +0000, Alice Ryhl wrote:
> >>> Add support for creating global variables that are wrapped in a mutex or
> >>> spinlock. Optionally, the macro can generate a special LockedBy type
> >>> that does not require a runtime check.
> >>>
> >>> The implementation here is intended to replace the global mutex
> >>> workaround found in the Rust Binder RFC [1]. In both cases, the global
> >>> lock must be initialized before first use. The macro is unsafe to use
> >>> for the same reason.
> >>>
> >>> The separate initialization step is required because bindgen refuses to
> >>> expose __ARCH_SPIN_LOCK_UNLOCKED to Rust as a compile-time constant. It
> >>> just generates an `extern "C"` global reference instead. In the future,
> >>> we could expose the value of __ARCH_SPIN_LOCK_UNLOCKED to Rust in a way
> >>> that Rust can understand. This would remove the need for a separate
> >>> initialization step.
> >>
> >> Yeah it's just a raw C struct initializer, I wouldn't even know how to
> >> move that to rust.
> >>
> >> An absolute horrible idea, and I didn't try whether it's even possible:
> >> - put all the global locks of a type into a special linker section (we
> >>   need a macro anyway for them).
> >> - patch them up with a horrible linker script objtool patching with an
> >>   example lock initialized by the C macro.
> >>
> >> Even worse idea, on most architectures/config it's all zeros. Iirc the one
> >> I've found that might matter a bit is CONFIG_SMP=n with some lock
> >> debugging enabled. We could make rust support conditional on those, and
> >> then maybe a build-time check that it's actually all set to 0 ...
> >>
> >> Requiring the unsafe init just feels a bit disappointing to me, when the C
> >> side (including lockdep annotations) tries really hard to make global
> >> locks a one-liner.
> > 
> > I actually have a prototype lying around that gets rid of the
> > initialization step. The idea is to define some new macros:
> > 
> >  #define __ARCH_SPIN_LOCK_UNLOCKED      { 0 }
> > +#define __ARCH_SPIN_LOCK_UNLOCKED_TYP  unsigned int
> > +#define __ARCH_SPIN_LOCK_UNLOCKED_INT  0
> > 
> > Rust then uses the two new #defines to initialize the raw spin lock to
> > the right bytes. As long as __ARCH_SPIN_LOCK_UNLOCKED and
> > __ARCH_SPIN_LOCK_UNLOCKED_INT are represented by the same sequence of
> > bytes, it should work.
> 
> I have no idea if this is possible, but maybe one of the C experts can
> help with this: could we define `__ARCH_SPIN_LOCK_UNLOCKED` in terms of
> `__ARCH_SPIN_LOCK_UNLOCKED_INT`? That way there is only one source of
> truth.

Some arch are {{ 0 }}, but parisc is {{ 0x1a46, 0x1a46, 0x1a46, 0x1a46 }}

Everything else is reasonable though, with either 0 or 1 for unlucked and
one or two structs/unions around it (some arch though have named
initializers for that one field).
-Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
