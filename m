Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E341A781
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429958; cv=none; b=h+E6Zzh2Ug/UQK8UYD2dd6sTrs51SMHWKxCqtXUo3hiVSecARGFwKLaGOfeP0sUJHlCPHEMi61kdn7tTzH0I9ruIhvixarxChRxHKIVBSp4Md18NbV2b2v2RQ8Afdwr4rMaBNPvkEpErWq6EnTGSTxiHkMSM+T/+s+Py87mZMdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429958; c=relaxed/simple;
	bh=9LOCtbgGr2wUzylvSSY/QfURYDLYnVmVvVmuKL95+wU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JY2fB0Jfoc6a1Lt0Yk2oxfqFaNBEG0DiBSm8bgM20MA+bJUNAyA1zN9BmBOsCwQVEOymdvrqn3cv3jbKIijywuF4wkxxG1wUF56DT79pCaTw759Htf74CztkydR0STHsiJy76LwnR+VpvXxKa9ymO/Uo34fL+TZArKwNc/bMkUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RfjJzCO/; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RfjJzCO/"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-493c20d0468so56753185e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783429955; x=1784034755; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Of9sO2EnIhsNa8bQoFBjU1/utC4MlhlC0hhDaEkOu5U=;
        b=RfjJzCO/MeCghv0B6q9bqiXzx2ev8sTZ2fC2IdvajAdZHomB3bohH1aqsD6eIAn59M
         uKS4ZntRK4mUAHV28S3QTRYOgd+kSCMRxYED4gNNAueE7jv0d4q9SAUT7AUCymtCRhnx
         n3zOdx1prvHL4D6xh+MgP0uGEjeFK+k+Xobk445dw8dgu23TLs9irqBaMGDZB8nBdGLU
         gmEMBoWex5icJQG7J5ipRpg6foQ2tnUWzwLMMEZp0wNpS0Yf6+bmktfzVQAQq0vIWCjG
         r/lOg5j4Eb3iJfKYHpqPOBmIJ2SGfar8FYzJloZtZA5BF2uoFwl7ppLzPYnqlodnMK2u
         6h8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429955; x=1784034755;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Of9sO2EnIhsNa8bQoFBjU1/utC4MlhlC0hhDaEkOu5U=;
        b=ZljusareBMV0DF1vVxxeHb3rDRxhfT1f62PTF28AHvj3I/ksxNtaYVKay/QQ0dk9ZV
         ohSPyPe6xra8TkyZauEMYZAp85cicG3VKCZo4qbUobX94xllHx/snG1LzGwtbVeOc/Uu
         EOVJ0a8tFM8xJsFjSOsRSqXq+8Bhh0qiZ4eebggeFQc966GAdBMINsEcQa1gJqjs/DVF
         xTWmtYPRw6PyXgzRucsArl5YrrA9SkH0GMoSOXd7IRc7Ekag19kvBDoiCyVSzNSu5Di1
         s247dCO3ZAtpZdmQzw+eHvP+83iEcQFqsVBitz0BhcyYWWDHXoB+VCPbsEgbakjXg3tH
         EOxw==
X-Forwarded-Encrypted: i=1; AHgh+RoteN9mGMAN1xLeT3cO+OICsWp9oy+m1z2eg9rJcIoLQcRXMqFjiZMTCdGpmNXFcDpd9rXXBVVc03IlsNHdqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmmRQsZIPDjfu0PYnT6Bla+p6SbZGEoJWrH1BY5AZPr0Nf00fX
	9rnJqHpYV3ySwCRZpJF2Vf7KQtY7A/6nlkoRlpw+MpfERNmiyUAxJeixZtK1d7sV45D4cN1BFGQ
	tWAu5lWA2TPKjwyHOvw==
X-Received: from wmj4.prod.google.com ([2002:a05:600c:244:b0:493:bddc:b22])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f0a:b0:492:7084:32af with SMTP id 5b1f17b1804b1-493df080c62mr56205555e9.23.1783429954428;
 Tue, 07 Jul 2026 06:12:34 -0700 (PDT)
Date: Tue, 7 Jul 2026 13:12:33 +0000
In-Reply-To: <aj7mpkvobbQVLLcx@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260623-pr-ratelimited-v1-0-cc922f544dc0@google.com>
 <20260623-pr-ratelimited-v1-2-cc922f544dc0@google.com> <aj7mpkvobbQVLLcx@google.com>
Message-ID: <akz7QZ1k4aKB7wAk@google.com>
Subject: Re: [PATCH 2/5] rust: sync: add const constructor for raw_spinlock_t
From: Alice Ryhl <aliceryhl@google.com>
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Trevor Gross <tmgross@umich.edu>, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Jun 26, 2026 at 08:52:54PM +0000, Carlos Llamas wrote:
> On Tue, Jun 23, 2026 at 03:38:05PM +0000, Alice Ryhl wrote:
> > +// Explicitly list architectures where this logic is checked correct.
> > +#[cfg(any(
> > +    CONFIG_ARM,
> > +    CONFIG_ARM64,
> > +    CONFIG_LOONGARCH,
> > +    CONFIG_PPC,
> > +    CONFIG_RISCV,
> > +    CONFIG_S390,
> > +    CONFIG_X86,
> > +))]
> 
> I guess this is done explicitly because we can't test if
> __ARCH_SPIN_LOCK_UNLOCKED is defined by the arch?

There are some arches where zeros is not the right value here, so when
someone adds Rust on a new arch, I want to make sure that person has to
look at this function and determine whether all-zeros is valid for that
particular arch or not.

> Looks good to me,
> 
> Reviewed-by: Carlos Llamas <cmllamas@google.com>

Thanks!

Alice
