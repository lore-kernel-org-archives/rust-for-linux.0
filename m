Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F142C0298
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 06:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757486296; cv=none; b=Oz44i0DOCKt423ZHbVnv4tRPVcK1EwQcsWJU+2sOwtd6LwXUCb6SYZH8SpzHuLSoswivtjNhyfLl5/Xj7G/cddvvXA2P0phPd37I69U9kClosJJsyL3I5o6rKIKthd2y9NPUxfcF4n06mEp3IWWcY7JXvQTV5VSTw1OgW6dVvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757486296; c=relaxed/simple;
	bh=yryUMwDR30rtuJdWFH/MyXXnVO7CXbV9uMb71deHiEE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lNdaKbn02HAAWiBa6hynQDCoUjA76WnMg1FNjiYzCSwHS4eATit7oPON1UIKibR3rWMtLRx3DXWH1fcvcKL2QdDEaVV1H4SvYbCyT2CEwyh2ZOIy3XqBTujGgqoGF8Pe4hPGjOLF1uDvaOwE9e+yRJANRnVXnqBmc/wLUfcijSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bK7Vq1+3; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bK7Vq1+3"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-45de14da365so29906495e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 23:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757486293; x=1758091093; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2/zASRd4VlUP5kA2rQTucm+9EdU95a3XDxfNBrHYtvk=;
        b=bK7Vq1+3HrYIgcP+IZ/jlZ73ShTo0LFDU/UiTEiIxn3awHHcb1c7x5fqIWknwl1ycb
         H0pUzXnOMQYYvd4HxSc5Q6RtykkMtPl8PzYE+r8fvq+Ml/iH8xpEdO23V6t2FFxC1U8u
         keJKCmmP0aYTC7yuFZZJ7bifSr12UztJTefcikeQ4tsTq5qOK7DsemQluGzuMY2lOZgV
         SU4DMai/O6/R60nHFmGykWdLSxlf+eUzi2SstfEwm9mtX26LGaxPjQlk7zo4C8aBT/ju
         rJCQ/VeCNY7wXltMDZ95T5s3TF+pVC3CzYGBT5vDebZoYdIkbmtLoANj5QTA4dyr/fow
         YICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757486293; x=1758091093;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/zASRd4VlUP5kA2rQTucm+9EdU95a3XDxfNBrHYtvk=;
        b=lvddkWc/nIVov5R8QKzVSaaDOjnCc92Xd4ShwRpa7BYn7TrAt/C/I+Cj8sArPbAfXJ
         fH5CV58l6bqg0SYLiqsNK9UlXfjM6rmBA0dLJt3jEEzfT/9+QX2JvwvhjwIx1XdoXD65
         wbu4C9TRk+GgRb8Cm3miu5dHnSUi/FGZ+tpYDgU7AJ9QwFEIopUp3YnyURVBCVlcensP
         rdjEKM1kCi6/eJpqoO1KhalwnymsjNoGCjfUFDD3M1ogqPkU94/oPBkP0ykonRtfCZIA
         wq6sWNhAFoew8FGcCcZoyT1wRZKwoqRv+j3PrMk02cnOQ/0RX1JnQ0yEX+eiM+6DjmLI
         CQUA==
X-Forwarded-Encrypted: i=1; AJvYcCW++XyFnFfewSMrCg0WaN/Cm3j+WIH2pGlpHXqa3jrm34zIEWY04OgBl6IWAiqy4pWW/3qMpysk9I1OWxSolg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0/qBUhLSQfVbEcOfFLKSbt3ri4FNdewQnuycdxcqfUODKZ6PL
	mpHEpMnQ8TWU4oiGVSPW/UYm+ux5qoK5G3wad/fSId/oaQ0RJ8koZI5ESXRUXwStExgGIxTSGbT
	F+y31CIogWwvwC1UtSQ==
X-Google-Smtp-Source: AGHT+IHojclEEC7z2jplMWZ5H0SzEwYNQuFJtvzwyJSanHck2T14rpWlBunxFlpqN0ln2ChwOs7IFAQkutmL8Gk=
X-Received: from wmsp35.prod.google.com ([2002:a05:600c:1da3:b0:45b:7fa6:f2ef])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c1c8:10b0:45d:ec9d:5fc3 with SMTP id 5b1f17b1804b1-45dec9d6013mr44833865e9.18.1757486293048;
 Tue, 09 Sep 2025 23:38:13 -0700 (PDT)
Date: Wed, 10 Sep 2025 06:38:11 +0000
In-Reply-To: <20250909-irq-andreas-fixes-v1-1-dbc9aafed2cb@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250909-irq-andreas-fixes-v1-1-dbc9aafed2cb@collabora.com>
Message-ID: <aMEc0-8mM4uaFwlB@google.com>
Subject: Re: [PATCH] rust: irq: request: touch up the documentation
From: Alice Ryhl <aliceryhl@google.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Sep 09, 2025 at 05:46:55PM -0300, Daniel Almeida wrote:
> Parts of the documentation are either unclear or misplaced and can
> otherwise be improved. This commit fixes them.
> 
> This is specially important in the context of the safety requirements of
> functions or type invariants, as users have to uphold the former and may
> rely on the latter, so we should avoid anything that may create
> confusion.
> 
> Suggested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

>  /// A request for an IRQ line for a given device.
> @@ -112,7 +117,7 @@ impl<'a> IrqRequest<'a> {
>      ///
>      /// - `irq` should be a valid IRQ number for `dev`.
>      pub(crate) unsafe fn new(dev: &'a Device<Bound>, irq: u32) -> Self {
> -        // INVARIANT: `irq` is a valid IRQ number for `dev`.
> +        // By function safety requirement, irq` is a valid IRQ number for `dev`.
>          IrqRequest { dev, irq }

When creating a value with an Invariants section, we usually have an
INVARIANT comment. Why was this one removed?

>      }
>  
> @@ -183,6 +188,8 @@ pub fn irq(&self) -> u32 {
>  /// * We own an irq handler whose cookie is a pointer to `Self`.
>  #[pin_data]
>  pub struct Registration<T: Handler + 'static> {
> +    /// We need to drop inner before handler, as we must ensure that the handler
> +    /// is valid until `free_irq` is called.
>      #[pin]
>      inner: Devres<RegistrationInner>,
>  
> @@ -196,7 +203,8 @@ pub struct Registration<T: Handler + 'static> {
>  }
>  
>  impl<T: Handler + 'static> Registration<T> {
> -    /// Registers the IRQ handler with the system for the given IRQ number.
> +    /// Registers the IRQ handler with the system for the IRQ number represented
> +    /// by `request`.
>      pub fn new<'a>(
>          request: IrqRequest<'a>,
>          flags: Flags,
> @@ -208,7 +216,11 @@ pub fn new<'a>(
>              inner <- Devres::new(
>                  request.dev,
>                  try_pin_init!(RegistrationInner {
> -                    // INVARIANT: `this` is a valid pointer to the `Registration` instance
> +                    // INVARIANT: `this` is a valid pointer to the `Registration` instance.
> +                    // INVARIANT: `cookie` is being passed to `request_irq` as
> +                    // the cookie. It is guaranteed to be unique by the type
> +                    // system, since each call to `new` will return a different
> +                    // instance of `Registration`.
>                      cookie: this.as_ptr().cast::<c_void>(),

I believe these comments address the invariants of RegistrationInner. In
that case, we usually place them on the struct:

	// INVARIANT: `this` is a valid pointer to the `Registration` instance.
	// INVARIANT: `cookie` is being passed to `request_irq` as
	// the cookie. It is guaranteed to be unique by the type
	// system, since each call to `new` will return a different
	// instance of `Registration`.
	try_pin_init!(RegistrationInner {

Also, I don't really understand these comments. The first invariant is:

	`self.irq` is the same as the one passed to `request_{threaded}_irq`.

and the justification for that is that `this` is a valid pointer to the
`Registration` instance. That doesn't make sense to me because this
comment talks about `this`/`cookie` when it should talk about `irq`.

>                      irq: {
>                          // SAFETY:

Alice
