Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C3209F45
	for <rust-for-linux@vger.kernel.org>; Wed,  7 May 2025 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599091; cv=none; b=JVm4K2fTihQZwvS8V4fSft9R38d/2cwablPmTpl3Mqw+Xza94D6qt5OdNkZA1gQKmFwcM3YVhcYNA51YDHIEvL+6EcxQZZal3Qe5VB7giyWCVoJLZibJfdOfSF93iPHdejkFDKVFd/p4v51q2s5J7k4yncoxcIp68wjlsb8pA9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599091; c=relaxed/simple;
	bh=yIxpL7LJINcGQCYV3WKDg2l3cC2MaNWqR8MRzfpUgBM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J/I9agPC7DFl7icZuJtiX67G+zVNVCcuDKNKTXZWYIsFz1bcvh91fTKsgrJJOjJfVF5udTHyJBprruXwZoIsVhxfVcceLKXYkewB3VostmKVC5Olva2l3erQAEgI4hWp5XxXYyVfmMnH9WVWGF6CIWCMqTQLWwEdINzsZG+t5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JXYJ4VNS; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JXYJ4VNS"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0a037f97so34968785e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 06 May 2025 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746599088; x=1747203888; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hD9zIW42LA6slVSrrFyagI194Qso9e0OpjZIhXRXyvA=;
        b=JXYJ4VNSzuK5Dx3QGIgF3DqJaxKCNOjuajHX6j4kWTNmw4qUouNy0iZ9Gn4ZQpEANM
         TyvLfCWLbVMRSfMqdevgFzRqsrVbcRWEGaH8KU5kDWioknX/yVisAj0FI1lDSWpAa9xp
         pjSQzuII3jDMN5Hei1SgcAXkmTH6J6vY+UthHPELij6W7lU3ki5gooyNaK955Ul8g0p4
         EuZv0wue0lcd3zFS7wNgwwcnAEDcXze71F51lJlPAos2VVm0Nk0YbCb9wpzArvJg5phq
         Z4wZUAV5Gqv6li9E088s/+Pvrjnx9dVWNDoG4OiCMosOHPH64WhrrBu2SNfzd8mtmEnh
         o0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746599088; x=1747203888;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hD9zIW42LA6slVSrrFyagI194Qso9e0OpjZIhXRXyvA=;
        b=ZcjWkMTKT9AYhFCX6NgHY+suIX5IvEop7nFtvDBjGxgIg+t1zsXBdCGGHRjen+z664
         FTxECE5eSs0/wAywL6Wh6UfdAZi88MpNNyDW+wKo8lVWFjGj5FjhRJYmiPvo/L+Xr1I+
         pGbyP7+Cqt5y7uYuXBVzvXBBKa5dY6yQWSPbbmzvMAc/LNbW87Lu626CZ1nt6ZQFC0Zn
         2AqFdGmvd5UEYC1u4hIYHkSnq7n6BKA5m/h/THxmZMKw6giU3hXSs6S6zooEzcMeZMSA
         oo2csuMk7ANnZ31D/XWt3KXZAUJQtSNejs8RBrjTaSwt+EV2eU4atofAjT64P/U2SBRg
         HZmA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ8HiLEQdus4YIgAaouqCbMCP7fImxuImBOWClawNdeaM+D6LjakhzMPCm6e6xb57vufdQnbIoB7tfV76o7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1XPEMqjSKffHrS1xPmo1qjGOCOqhXw4JSTZnE5m7FIl4U6dma
	bi3/Uf8fH0zMylPE+EBSmMlTv6a4h0MFvOpt1pOh8FQlBtB614xqIRGJmnz6RgazLA86xUgo8IP
	1ERW92ybnk62D7w==
X-Google-Smtp-Source: AGHT+IEQD3CUFYskBATw0XZ+FKCVzi/D0fVledLscEilaA+KhdfsGoZlOtCY+5Bdl7cSzmBzTJ++V5TmOaZ4qwQ=
X-Received: from wmbdr22.prod.google.com ([2002:a05:600c:6096:b0:440:60ac:3f40])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a44:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-441d44c2b9bmr13748615e9.10.1746599088658;
 Tue, 06 May 2025 23:24:48 -0700 (PDT)
Date: Wed, 7 May 2025 06:24:46 +0000
In-Reply-To: <aBoYYzj7sGEbsQzw@Mac.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506-aref-from-raw-v2-1-5a35e47f4ec2@kernel.org> <aBoYYzj7sGEbsQzw@Mac.home>
Message-ID: <aBr8rnOk2QmBBR-n@google.com>
Subject: Re: [PATCH v2] rust: elaborate safety requirements for `AlwaysReferenceCounted`
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Oliver Mangold <oliver.mangold@pm.me>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, May 06, 2025 at 07:10:43AM -0700, Boqun Feng wrote:
> On Tue, May 06, 2025 at 10:29:02AM +0200, Andreas Hindborg wrote:
> > Clarify that implementers of `AlwaysReferenceCounted` must prevent the
> > implementer from being directly initialized by users.
> > 
> > It is a violation of the safety requirements of `AlwaysReferenceCounted` if
> > its implementers can be initialized on the stack by users. Although this
> > follows from the safety requirements, it is not immediately obvious.
> > 
> > The following example demonstrates the issue. Note that the safety
> > requirements for implementing `AlwaysRefCounted` and for calling
> > `ARef::from_raw` are satisfied.
> > 
> >   struct Empty {}
> > 
> >   unsafe impl AlwaysRefCounted for Empty {
> >       fn inc_ref(&self) {}
> >       unsafe fn dec_ref(_obj: NonNull<Self>) {}
> >   }
> > 
> >   fn unsound() -> ARef<Empty> {
> >       use core::ptr::NonNull;
> >       use kernel::types::{ARef, RefCounted};
> > 
> >       let mut data = Empty {};
> >       let ptr = NonNull::<Empty>::new(&mut data).unwrap();
> >       let aref: ARef<Empty> = unsafe { ARef::from_raw(ptr) };
> > 
> 
> Hmm.. I would say in this case, what gets violated is the safe
> requirement of ARef::from_raw(), because callers are supposed to
> guarantee that an refcount increment was passed to `ARef` and in this
> case, and unsound() cannot guarantee that here because it's going to
> clean up `data` when the it returns.

You can change the example to go through `impl From<&T> for ARef<T>`,
and then you have the same situation without this unsafe op.

Alice
