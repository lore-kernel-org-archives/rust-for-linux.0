Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE133C181
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 09:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764839586; cv=none; b=RZsXQs/ZlOOR7ntK83h/Gnm92Ms0jey1S5bzRgjI1uvFexF7p7eMEyoMJ2kCYIgdBFqf9+DsV3TEOf8uoHj2oN9nYBfcvagHv5t0OMDkL/K3E5Nv26gLO4U0zVen+m2SVpUezUMG88BLttH/jh/ogWfONcevRILJ6i0gKd6HQA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764839586; c=relaxed/simple;
	bh=E/Us579nTVgurFAyuKqneDAK/MMCEioOOwy1LAuVIGU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qb/SHcw7Aq+WEU5K2gkWEs3cLUEhR8/2gfzKy6cFywMLUNGyFCtcZwpEg+7jeASV1vQ69PdBQjKeB9EoD5H0ROPykq5kvT0DU42CUMUZjCYe0dEYo+zpeL4lNXPdQYbSaEgMqAvUFI8OB/lreyrT5i6MvubqhzE7/zUJLl0lqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2UzPJpXe; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2UzPJpXe"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6407e61783fso721316a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 04 Dec 2025 01:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764839583; x=1765444383; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRDZhJnUIfvx3/Hg/oNl3IHpJs7xKfq6AQy62QyhG00=;
        b=2UzPJpXekgpnuKOY4Ky2aWKNgpBcX9xO+nwWecCG5HWdBM4T9wr8XjAFJiTCrhuUIL
         PnY1nWpEz85sEvhGREWvlhFRTI7khO7fQfqH/b5l6xANoQP4gyHW6aYvvqnv0nmtf2A3
         JJMkosDhlmenZRjq8raYAzL2Ek61bzIrDHqcc69wVVmiGsjgCV7xTUB1xj6PmPHpkhxb
         J6IP657OmplhJy3FTy3mlPwEZvuam0mCjwxMEiAAAuBrUFt8ttqRex9UWPTF5s0nG5Uv
         1/2slawXiti9g3WHZvs7NshqZ4lFyiasb5rGwaoBrztnRlf1iOZ4B6tnbAzYeyUk2ULO
         rkUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764839583; x=1765444383;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRDZhJnUIfvx3/Hg/oNl3IHpJs7xKfq6AQy62QyhG00=;
        b=abiHx7ILkkJRp2gp855l+1L19hsVgb5c3JL+5iFm6IjHazJUTvfC6ju821A7ihJTkd
         vrKBS+XVpfxK14nu68+v8dH8zzoDCtRgQmB1L2Zc+mLXwPU6gaHNl0HyVDqVzWMHuKxY
         S9RbSMCc0IxEkASG1DLJEYFT7azmrCiE92FRvMexsy6RkiSiHQuJXs5N3uIvCDe7FeYk
         cvICa+B6oCk5156yrIg3MbhGgKiSIGbG/GogWUfcTCSUqn/0IubtqE3At9CLVS4BLzle
         q9FuCK1UUuFqlIuIImyKJ9EVo1VFGOKKEqN4/eXGrzlrJB0jAl3L7XZJ7ATpDfrNDXZC
         lyqw==
X-Forwarded-Encrypted: i=1; AJvYcCVNZ/DLsQtKFewptSijNLj8OYcYE+8PDdSwYcKatXhAgEZjUqUhaQHtRvVTlVPMdcYSQQKBfA7w/EiVgAdZtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpyfJraW9GxoapphZqVEPQouBPKM6A8e8tgZcu5SlgsJnZ6K9t
	cd7dm56+KykyTF7xDu77jgHSPyhHMSzej0KPJXCqgojotmitw74RB+r0kQlUfc1K1CCGhC2w4Qv
	+5XxQn0WedA+pxoiHRA==
X-Google-Smtp-Source: AGHT+IEhdPWvEmB4vfFoDOsOLUUthSnQqFGCrg+waysgL3RexQWT0QwI0B7dGIxK2uf85VyQcWDZE8BMbpilqHw=
X-Received: from edc5.prod.google.com ([2002:a05:6402:4605:b0:643:3a03:788d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1469:b0:647:a2b2:3db9 with SMTP id 4fb4d7f45d1cf-647abd80d9dmr1973340a12.7.1764839583215;
 Thu, 04 Dec 2025 01:13:03 -0800 (PST)
Date: Thu, 4 Dec 2025 09:13:02 +0000
In-Reply-To: <20251203203222.70415-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251203203222.70415-1-sohammetha01@gmail.com>
Message-ID: <aTFQnsTFuVO5DrYv@google.com>
Subject: Re: [PATCH] rust: sync: ordering: Fix dead link to LKMM explanation
From: Alice Ryhl <aliceryhl@google.com>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Dec 04, 2025 at 02:02:22AM +0530, Soham Metha wrote:
> Fix the reference to the LKMM 'explanation' document, using the `srctree/`
> prefix triggers an htmldocs warning.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508301445.KuPDLTET-lkp@intel.com/
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> No functional changes.
> 
>  rust/kernel/sync/atomic/ordering.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/sync/atomic/ordering.rs b/rust/kernel/sync/atomic/ordering.rs
> index 3f103aa8db99..d71c4f582f75 100644
> --- a/rust/kernel/sync/atomic/ordering.rs
> +++ b/rust/kernel/sync/atomic/ordering.rs
> @@ -20,7 +20,7 @@
>  //!   described in "DEPENDENCY RELATIONS" in [`LKMM`]'s [`explanation`].
>  //!
>  //! [`LKMM`]: srctree/tools/memory-model/
> -//! [`explanation`]: srctree/tools/memory-model/Documentation/explanation.txt
> +//! [`explanation`]: tools/memory-model/Documentation/explanation.txt

Currently, when I view this on:

https://rust.docs.kernel.org/kernel/sync/atomic/ordering/index.html

the link goes to:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/memory-model/Documentation/explanation.txt?h=v6.18

which is the source code of the relevant piece of documentation. Of
course, a better link would be:
https://docs.kernel.org/dev-tools/lkmm/docs/explanation.html

However, I think this patch would case the link to go to

https://rust.docs.kernel.org/kernel/sync/atomic/ordering/tools/memory-model/Documentation/explanation.txt

instead, which seems wrong.

Alice
