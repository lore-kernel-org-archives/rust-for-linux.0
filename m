Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA02430DEB5
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764145078; cv=none; b=l5ozFOtjNCJ6/7+J+k2sqXwYJ8O6UYIIO6zz1MZbm8Ada/gJ9IYL6w+UjjJSdeu/4uJRSrPyD/9ioaYejKUb+CSjIBLp9gKg35NhRR47dvqcc+X9O06OGrSCPRHi26eTvrPqmCSE057xEY02EJA6JgqfKc7oe2arHVonvFa/Z8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764145078; c=relaxed/simple;
	bh=ZC5HenvqPHpnGI5hFRmJeF1Bc46Ct6k4ZgVLg6NWRKQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7nJcVZ0BQWnjsSSfdLDboTJCb7Etoyj3eykkCOYiO+Mz+Mo1ybDO4dsj3HoyFph0VtEe4Ud26Qg51ZtKIjaXAee9Vb8tlIUPe+N6gLmsjhiGkxdQNIOLA6Bwns0Mn6WKV23teqtZRnzAs4KPMck/X3ZOJMXYtcybChznhJc/sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aB5eD34k; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aB5eD34k"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-450ccefe573so2867027b6e.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Nov 2025 00:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764145076; x=1764749876; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qYz8fU53OYun5isIfqSipnELIUSXFW9PXg4YNJblPY=;
        b=aB5eD34kRvhcZWtWWkUZHR/VV1lGBrgSpyERnwuYo+zE9sgIM6DROLHxFlSEft772V
         Kb6SP7OfCjI1VfnXhUV74O/VNTwnqUEuwEP6ZG0ZLKVk9nEPjYMPcpOWfqcARE9AvyQ3
         VqAGKGvMGVmcvU5zUEp42Aeurm84AMWDW5DTxunLXgaogCC1hWeXwibgA413oY4VyhXK
         +AzQDAzsxFehPlKzDXT4pyawOcTsHG0FVpfWXOJMKspQtG14dD1N+kqUKsc9F8pQnFO/
         PzfhU9JUBCF1rYQ4BWb1jzjMS641+PVwYF/RJGajtqKuVIZmrDGvhU+nVja1TcKjna/P
         MNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764145076; x=1764749876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0qYz8fU53OYun5isIfqSipnELIUSXFW9PXg4YNJblPY=;
        b=wjCRptBLitu7XVsOeoxky/HQVq6Zyig/jIyu2QHa3GNVfVq0EqHZmcEviWm9lxtCZ2
         MqDTWUUbjnQrZRhBb/Mrylfugdy+fg/DGYlr1Wc/hmmbPOMtBKNgCIQ45E2U4mUJgSVL
         NpkTJf20eJOZtnY626lKoXo8fGbPJEg4qPA3R5a5WJibBH4HEmjMbYQcXIjsUl/vwKDN
         KGjLFSYUWRut4frgLa1KRl/c/VxfykoO1CslZzstYOFqJC4aJv5UV4aX/sX9hYMT4sjc
         kiE6voTBc/Q6gBRZVKfy03wI0k287lxZydcUxCxZVhGsqRpsZH22zyuW8rUSMT4+IUQQ
         dlyw==
X-Forwarded-Encrypted: i=1; AJvYcCUoe6lRQmmKD+0zQhVLktlnmMr2OW93ky4/ohGbBUp3EppuUi3DlkNHhIve7o5PlVXKCyVQmLQchs1dJ2Zz7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9U6q80wnb3ZmZNNV6h/DLBI0EpP1E5gc0ve2RuiBiEIXop51t
	YDBcrY4gXdteg+G6LgWQPYsumzLxNHumaEHpRn57QMpc9Z5WlixE2FpXETXrlfpvECz2EWWYW3c
	o3WXFJKBTSsgusr+qz4GovgudpJBN9D/ILF5493u0
X-Gm-Gg: ASbGncsAnhRiLwfmgIgeO7Gn7ijhKNEVwFYHiSFbWwG97qgalsUt2dtZ+7ndHZDzOBG
	eDMDtEtZzW0iDcpNAG0iDNQMd1qUg25rXq97kH62xIBxPESiMuGe41QeOfJaez/n/wCbMzmBPIc
	aQz2PSkKHtST7ajTuoDM26GJkG2M/hh1RKqZn327G7aoxDO7qIb8idJXXGrwq9NjjVTGVnke/w0
	LxGKGldiMu4ypWD8OG1FjvL9YkrL+6U1MrlACqoW1WcQF7K1576QdV8Wq2ojRoKM1eTGzLwkluy
	fGvdXCv5nZP1BRVWRXHij7KWzA==
X-Google-Smtp-Source: AGHT+IHdU6zHUhV85+swfPqc53j8YE3zfoyGsGZrxDCTJEKYi7Nu8m90S3zCjf1Orp2o+AXqIqXYwKH4tCMwqBVI/V4=
X-Received: by 2002:a05:6808:1527:b0:450:d09a:8cdd with SMTP id
 5614622812f47-45112bde338mr6813863b6e.58.1764145075488; Wed, 26 Nov 2025
 00:17:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-binder-bitmap-v6-0-dedaf1d05a98@google.com>
 <20251125-binder-bitmap-v6-6-dedaf1d05a98@google.com> <aSZlZu0SNycNvk4q@yury>
In-Reply-To: <aSZlZu0SNycNvk4q@yury>
From: Burak Emir <bqe@google.com>
Date: Wed, 26 Nov 2025 09:17:43 +0100
X-Gm-Features: AWmQ_bnVYGFFcpOhD_ZWT2eYSl8f54crCsx4LN7kzfXpfx6BEJv8DEgRByoVvLY
Message-ID: <CACQBu=WuPwr7ATFWN2_8xN0cZce7i2tTZ0=wWFDznRR7WxkeAA@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] rust_binder: use bitmap for allocation of handles
To: Yury Norov <yury.norov@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Suren Baghdasaryan <surenb@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > +
> > +            let grow_request =3D refs.handle_is_present.grow_request()=
.ok_or(ENOMEM)?;
> > +            drop(refs_lock);
> > +            let resizer =3D grow_request.realloc(GFP_KERNEL)?;
> > +            refs_lock =3D self.node_refs.lock();
> > +            refs =3D &mut *refs_lock;
> > +            refs.handle_is_present.grow(resizer);
>
> This continues puzzling me. Refs_lock protects refs, and the spec
> says:
>
>     a reference=E2=80=99s scope starts from where it is introduced and
>     continues through the last time that reference is used.
>
> https://doc.rust-lang.org/book/ch04-02-references-and-borrowing.html
>
> The last usage of refs is at .grow_request() line, because later it's
> reused with the new value.
>
> If my reading of the spec is correct, after dropping the refs_lock,
> you may get rescheduled, and another thread may follow the same path.
> Because refs_lock is dropped explicitly and refs - implicitly, the
> concurrent thread can grab both and follow with resizing the id map.
>
> When your first thread will get back, you'll end up resizing the
> already resized map.
>
> I asked your AI, and it says that this race is indeed possible for
> exactly that reason. But it doesn't break memory safety, so the
> compiler is happy about it...

Yes - the writes to the map field are synchronized.
So there is no data race (=3D unsynchronized {read, write} / write
conflict) and corruption cannot happen.
Never mind that there is a race involving data : )

The scenario you describe is why id_pool grow() and shrink()
double-check before doing copying.
So the thread that loses the race has allocated a new array for
nothing, but things move on.
