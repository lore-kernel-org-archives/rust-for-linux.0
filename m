Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD61DB361
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Dec 2024 09:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733478999; cv=none; b=OMOtWoMCQ7xCcoiyQN8n+OlfWeEg69MeK3Z8kQt/9UpBaEgYHFPY81UNX0vRoMTZGkMORWjDjUYIswrmfnMqHJTPvD+NelbW6IOS6Dhtuuz2hFe/MCdAP4cTJ14wv3rHyDzBLCWIlVHqvhl8/ELUkxaS/sCrSgM9jDWEMx71unk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733478999; c=relaxed/simple;
	bh=u3Nn3XfNE9X4wSjorElnFa3+gGBNUsIrTN62x6Dkdmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ddBRlGg/WhaQJ7jTYCvJe2H2ggHJUojn8iJ+6zTID0xPle7X3B6wgUOhiMhYrifL0TJCelsR8Jt8T6T4p9WulGElQ7NWYuHmRVP+pLzwmOfTyPd/tApEolWPYOh6UWf0J64tv0LeVEnuJ7DB8lVJHMl5YYdEW5JtEbfI+q/yP3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mvi/fczv; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mvi/fczv"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37ed3bd6114so811897f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Dec 2024 01:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733478996; x=1734083796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3Nn3XfNE9X4wSjorElnFa3+gGBNUsIrTN62x6Dkdmc=;
        b=Mvi/fczvDqI7p0tveM6oOnlu0HCVz+gQfYYaJG7AX4U+z4pSKT+J9ocVHWae92wVQU
         YZboBIyHCELqHRawzntQ3+e6Y668hwEpq0rXwi2qjIvqZB524n449bvxjujaL7PAU0tS
         Y+vLaGaIsBsOR3es1RxFMXjY8qISihdQslaRQKpyXo5S6r4UyB6gcu9msLD/+y7cfUBH
         OZ6z6rOW7iKq5lqC7jUhRe4JAUtNgXvKqNmM1azpcxVgfv8B0bLUtcFqk9mooyQbjFTh
         4ElQMU8U6qN9e9rI6rh49DF73HRnQJrvDkfZSDTo9PmdAF4h00vMV16q0CV9AbS0xXWK
         Pbug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478996; x=1734083796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3Nn3XfNE9X4wSjorElnFa3+gGBNUsIrTN62x6Dkdmc=;
        b=ooOga/ue4Ph4GUxeLHiyw3yWs1T9GVcJN27gzgLaMYgQX2mssbxMqUxyZq5zX2+XQp
         oDFR9UlGVAclqYPPRaQJjjW2n5WkRoriXWMZ0lZyIT9PxMp/KG8dFC4gbmQ4LN0EIiOw
         SRGYcqPpjhOikFsTGmJUYoPmD3fgRXjAAlzOgAKvIyKd2CsQyxI/9F44LCIFVvX+GjEr
         /JGoWmhB/xrNsp0wEc7t9wO3d7S9Bd2UCh4pSHDUQTrWfKaWD+pG5G2iBx8M4FzZSgsH
         I7G338hjz8OfGl092wST1dy1Mn874Da4exHEwxrxVKVaqFkyr4XkU0//K0IIZXJtm+bT
         Yiuw==
X-Forwarded-Encrypted: i=1; AJvYcCW+aNJ4mvNbOJj7myHBfeA/ySovH4/ZfWNKQIs8l6hS6Z0mfwFKRuyGJOx0BEcmHnCmEEG2nmzn/WEy+fhu/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8AnQpwlapCTKq8o9ht+Su9Vl+SDSO2IfzCYDH4MZZo3g+4cI9
	pujrfdv3r4bArK/NQBZFVdSOPf/v98sho3EoF9c+a0CTkHzxOub5AFe6z+MSs7WqrguIkKAb7pJ
	7P4qyY/QQFWObvnX0J3M3NOhefg2Y/XTTdqsw
X-Gm-Gg: ASbGnctb7A32FcyrCzBsN9MfvG1jBtLOmKdTzZmmTRY19nGQoGzwL4oQjgLN/wlIOZP
	fJ3d5GYRxj4iNwJsar4bdX9na9TRjSjB2
X-Google-Smtp-Source: AGHT+IEI4ugE5yUlz80Raoztir4esrVQ6dVrTvSFsQiYh6O9FXPRsxE4M7zyfVQ/uimtw7elOU/aRG/pDrBA/rN2s2E=
X-Received: by 2002:a05:6000:1565:b0:385:df73:2f3a with SMTP id
 ffacd0b85a97d-3862b3516aemr1476984f8f.14.1733478995645; Fri, 06 Dec 2024
 01:56:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-guard-stable-doc-v1-1-a3f8249cf4d4@google.com> <Z1HuNaDAiKV7L9ea@boqun-archlinux>
In-Reply-To: <Z1HuNaDAiKV7L9ea@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Dec 2024 10:56:23 +0100
Message-ID: <CAH5fLgi8N6bdke1o_uTvYsYfwH1KhsY4wTGmFpc43Mi_U6+KWg@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: document that Guard is not a stable lock guard
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 5, 2024 at 7:18=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> wr=
ote:
>
> On Thu, Dec 05, 2024 at 12:35:51PM +0000, Alice Ryhl wrote:
> > Most locks in the linux kernel are stable, which means that holding the
> > lock is sufficient to keep the value from being freed. For example, thi=
s
> > means that if you acquire a lock on a refcounted value during rcu, then
> > you do not need to acquire a refcount to keep it alive past
> > rcu_read_unlock().
> >
> > However, the Rust `Guard` type is written in a way where it cannot be
> > used with this pattern. One reason for this is the existence of the
> > `do_unlocked` method that is used with `Condvar`. The method allows you
> > to unlock the lock, run some code, and then reacquire the lock. This
> > operation is not okay if the lock itself is what keeps the value alive,
> > as it could be freed right after the unlock call.
> >
>
> Hmm... but `Guard` holds a reference to the corresponding `Lock`. How
> could this happen? Do you have an example?

Well it can't. The reference is yet another reason that Guard can't be
used for stable locking.

This doc change arises out of me needing a stable lock for something.

Alice
