Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E101E520B
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 14:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750344257; cv=none; b=fdUltD3h1XJp2gwad42Md6xbKR+zrULGQvGb9j7joT4UNJrAFRHyfJbN7qDtenWVkXwB+pEKD4ybMItSRRuh/FX9cFjQ5eaq9VFgth6GZkTLdVCZGsc2UkxL4hMsqob6onB7RflaHDcTqkuV8dSMo6JHcG0zVbw9H0ykR0VLouU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750344257; c=relaxed/simple;
	bh=XcwXvx+KTKGOkOisPCG0xqUIuO+jeGgpgekvwvZ5tBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWTlLgCcuydqvyCzvyvf5nR/fEdrdXXke0dYjxJInNUIa+9STRTD/QgHkBGktlXQhq0mH1bQrR6Vmb/tTihoTRitugdCKl8MU1N8Z42Gi1K7Jwccg9hbe+rzSo2NYfHIHrCVyVH8dBBQwzicwsa+nSzDYuLNIYjcxU7PGATDTJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cCZjNDD3; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cCZjNDD3"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a5257748e1so639708f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Jun 2025 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750344254; x=1750949054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVMqsQRe9rYHlObyTkfPf+JCwJJxn0mjlS9ZABuzrNY=;
        b=cCZjNDD3UyjYmG8rqZlmfVV/6kHzInqQg5Sh3YZx+MIwkSGPoj5I0KApQYYxXHtRin
         CzZTLcXX43+rZ6Qma1GTvYc5cyevOA3d3+zz1wBt8YdN2icC6eFmqKl0giwvZd/xpxzV
         9GhzIW+F15bW2ZuEeh34qaO996ZkuzSTz3pPGpRsXvl/D6X0ySjt4TphnLxnRWRKhqVh
         RVm8qG+18ZkERbgePQnhrmfoxXeI3//rCLrJiNc52CwUqdcJ91bm4CxGDE/3Pu2jCrUg
         V5Gq4GKOgAtbvGxnUg+i0G167Apmo75/XXSljPGiur/S/c6S6Rz263hiA5ldo+Vq72kr
         KV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750344254; x=1750949054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EVMqsQRe9rYHlObyTkfPf+JCwJJxn0mjlS9ZABuzrNY=;
        b=dY1HGQKqvRO9TufjUaxd8kAuG6xfFyKAlaUXUQYJHwPkq1WUD8ApHkU9sPER0DbKjg
         U1ev/QC3BDv/dRxgbiUSgd2U2sQxTAjJiDPx5QM8Q088b/apD22ArVRApe32HUbLpLdK
         Ju4/McWH/bWwx8LlDvO820xAhiyu08jQ3UGtn6imrxoPmImIfKaKC91xCb0zGlZ2/mAk
         vyMrUAEW3R+76//q0EC7tnxaDweZ3M4IJf/ribolfF8930Rw6PveSEMNU6NHQmYrOgXV
         iHC/oDW5yMBnKfzlPmj7jhJnZqm9EZ3rgdwixkYTAMYNQilbU6GMNdTkRtI4UnVxC4gV
         XamQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvBnCryWuvMPhZvHkSzi4UGQiw4aPu6DwfRPg5+9U2sjjSAGeMRsVado3+zjm4LeqySC6Wpdr1U1tepr188A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoc9+BJB7wZ9ZvlB9HU9ekXlLcvjFxm68CyPcQAhEToyIa9WWR
	s8HtDEhNgdSYDfTOYxtYHzt1Pn9NjFXV92J9rfYim4aAgnftRvHEwVyrbi64QzwdEAZ7ZHbY3o+
	knB/IDhATqNy87V2TWSz3C6cXa7tUKz0kaRJD3B/USQQhZNgGTlOF5env
X-Gm-Gg: ASbGncvd8Gj71OOtsUlNbBuCZzUKE58x7CKNcrZ2ZhS7u93hrMBb6PdVDCoSljK7tXM
	XEMFwQsJQOV+x4Lm4O8qtteN9BRma3LLCbSLMQnW9H5Q6R7okYv1MCRzfk4JqpOl9H4cbYqTm7k
	y7lSh1aK/LbC4Sn7c0m6qdyoOSCMeFEmoe/wy08gOP1opi3H+5eZNKKeobkuICC0qXExVX+2VZM
	c+RLkSDcgUg
X-Google-Smtp-Source: AGHT+IFolUKIJpNOwvo6YbqeRvkbUyZ0UB57Cu3isdwLbs+TzWq4hnGEeJOT+f//vxWUlBfYnyXOTLlhgASVn3iykHg=
X-Received: by 2002:a05:6000:290c:b0:3a4:f35b:d016 with SMTP id
 ffacd0b85a97d-3a572367993mr16248379f8f.11.1750344254287; Thu, 19 Jun 2025
 07:44:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619140656.498-1-work@onurozkan.dev> <20250619141401.GI1613376@noisy.programming.kicks-ass.net>
 <20250619173344.6c72c48a@nimda.home>
In-Reply-To: <20250619173344.6c72c48a@nimda.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 19 Jun 2025 16:44:01 +0200
X-Gm-Features: Ac12FXymE55CREO4hachgxG9Df6IxIrwgv1201IJaKd3lfeHyLxcVoX1imNXr3s
Message-ID: <CAH5fLggxqK+aZcynsq0koWZG5DD=Byc+DrqEZ9ZCr4+pdScMqQ@mail.gmail.com>
Subject: Re: [PATCH V3] implement `ww_mutex` abstraction for the Rust tree
To: Onur <work@onurozkan.dev>
Cc: Peter Zijlstra <peterz@infradead.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, will@kernel.org, 
	boqun.feng@gmail.com, longman@redhat.com, ojeda@kernel.org, 
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	thatslyude@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 4:33=E2=80=AFPM Onur <work@onurozkan.dev> wrote:
>
> On Thu, 19 Jun 2025 16:14:01 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
>
> > On Thu, Jun 19, 2025 at 05:06:56PM +0300, Onur =C3=96zkan wrote:
> > > +bool rust_helper_ww_mutex_is_locked(struct ww_mutex *lock)
> > > +{
> > > +   return ww_mutex_is_locked(lock);
> > > +}
> >
> > Do we really need this? In general I dislike all the _is_locked()
> > functions and would ideally like to remove them.
> >
> > Pretty much the only useful pattern for any of the _is_locked()
> > functions is:
> >
> >   WARN_ON_ONCE(!foo_is_locked(&foo));
> >
> > Any other use is dodgy as heck.
> >
> >
>
> It's an abstraction of `ww_mutex_is_locked`. Since this is an
> abstraction module, as long as `ww_mutex_is_locked` exists I think
> we should keep it. FWIW it's also quite useful for tests.

We're not just adding copies of all of the C methods - instead we
focus on the things we have a use-case for. If you're using them in
tests, then that could make sense, but otherwise you shouldn't add
them.

Alice
