Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169CF22AE55
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 10:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736764018; cv=none; b=tAhXVQf2JcSAUfXN9c5MXDVF9jyAk02Ks+HEL2AM0os68y48dWg7S7tjv0Sta44d6IXqtAqM7KgaaZnxb3F72XXORJ/b9WjtjBjNNUfOddtf2xVtmrz5JNm+iitxAde8kQJHsA8dC5ssDGkfgjHfpwnzpBcTTEekyfL933WrGOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736764018; c=relaxed/simple;
	bh=vQw3YmcT45+jEPsb/gLwWjTwPpa/XpATmo+XkLefb38=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Blx4s7P7tLrC6O5MAlM7ChdfQAxAwl0iQK4DXI5PrN7UEq/Ivtbb4LelIc26vl/nbe3ZWNOlZ7IbOi/3/Ny09J2idFryXUkpPdlnXQTVb8ZQRekURpuuhsuVqrYmfL/DxLLXnLyiHh+UQKr5ccbJKGAeZiCkPy/eqMVyqht1xls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zh6CvXCn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zh6CvXCn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4363ae65100so42227125e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 02:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736764014; x=1737368814; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WotA+xYJuM3ux57wZ522GGvB6ieWOsCacjrw//zGRFg=;
        b=Zh6CvXCn7dvludNtoZuQILJxoVTik+iMHJkC42IOjxwCxWKSAdwk2TBO97n8aZ6v2V
         cSvFjIErLdAJ0mhXlxLrDP5TI0jmN25zx/mcW6z45VNM0ROW1upCq+O9AYJe8xK09a9q
         BUmHp5gcsJDmYr4kGHMaPBGOW7WnJyFWaXA909YwYsoWZFZrRccaD/nTr7OC5JsXtBoa
         66xSzdxkAHSm0vQQr6TB7gleJS+wAcisca4qh5RloXKT/XXvcqZwQwpLbZYPWK8PlBpq
         q8YsRS7yNizso2tBWYlvvKbLM9G2XDSvaXmtIkMF2j8OQPB54alcMW02G6jZ/EqVj2nZ
         q4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736764014; x=1737368814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WotA+xYJuM3ux57wZ522GGvB6ieWOsCacjrw//zGRFg=;
        b=BVdQdjo8pUdM5CgIEULHHd+zJlAxAc8dJK6amBxCfk4JE6CAIpxLvvpg0eoZpAPJjv
         J09ArmL30roaDT/vczzG11+wNzw0WwdeUvLvbfo2i8H5OXzP5wKdSBX/dAel5MkdasU8
         2KM9iFBv/8nQTF/8TzziJWPjCzGrnOKzNLaHvbgRvzTUvIzOYx4pCOJRpZPuv1fSQt2A
         9L08k4o8dxFNdm+h0Y9RZXAUQhiIfpUM0CyETFtrpC6kF9dkCA/6zh7x+zgNI44oRSwZ
         V8jeTyEcJJNuqmtCiATGVpzAlPS/FFwm7c8jPVmuy2pE5h9YKUVyMago4XSwLaIm/+37
         ev2w==
X-Forwarded-Encrypted: i=1; AJvYcCU6Va3cM+oIRn2oVJSWJbgtiTh1ECjjh/Dhl7sd3UXbkge1780eOozAojNz/XyKC2/Z68psPS64sooH4PiUag==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Kn/P2hIqsm4D7X8ceg7qCDgzfOizsjxOKJFURSd+9nTDWuxj
	rixw7tzRvISYaUemLHubESWGRwz+o/St4S2gHm/75WuEEArQsbaQvCfe9Fmc+ql3v2/Joc3TMJv
	IbwYfO97wTyteWiZUgvmfXADu4RrSDDO9x6rs
X-Gm-Gg: ASbGncsaum2cMwIR0IaoH98cp1F4HeygFVKfMuodbOF1UkHuEQu+88L+Tnr68TbuD2P
	lIrmaFk8kSiMQ2k2kopFw60T22bYYzGLQgXLHpsOd6plJuTjvwVkWqJZsnPwcVuVWqAHk
X-Google-Smtp-Source: AGHT+IEdGBC/y1Bvaqxe390XP8IZkL7ccHVLd8tb6uNVNh+W/IRSR2mP1N4tBZgiPoa1YN8GklcEUFkm0PwDHhINESE=
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id
 5b1f17b1804b1-436e25548e3mr76471545e9.0.1736764013996; Mon, 13 Jan 2025
 02:26:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <mSBxLtHQ2_lBeEYTQNS-AoAdOXj-UH7mEb48SlHQZJMlUBwpqzIP4UB9nZv439lfseuIL27p3QnFOMFjV2wk-g==@protonmail.internalid>
 <20241211-vma-v11-8-466640428fc3@google.com> <87frmnadmk.fsf@kernel.org>
 <5qXA_x0NK0TzOkDwdQ8RYbk3SboUQiD0qflQhsoPRyhFxpD7fZHC7uVjI7RQBvvHPVEO1zlMRBq3F8BBImHrYQ==@protonmail.internalid>
 <CAH5fLgiBsW-sZ8LW4aqK1Eux71qdB3ERr6RdE3gX2uka+GRrew@mail.gmail.com> <87y0zk9y4h.fsf@kernel.org>
In-Reply-To: <87y0zk9y4h.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 13 Jan 2025 11:26:42 +0100
X-Gm-Features: AbW1kvaPU7jte_DTbz1hQMDwki-WCfamsRDNzYatM7mfSJxRtXANZ6h8Hqjf9II
Message-ID: <CAH5fLgh6J41JkaD23_Br6nLkznAfzaivVY=xRpr1jzpUZNZgKA@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] task: rust: rework how current is accessed
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>, Jann Horn <jannh@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2025 at 9:42=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@ke=
rnel.org> wrote:
> >>
> >> "Alice Ryhl" <aliceryhl@google.com> writes:
> >> > +    #[inline]
> >> > +    pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
> >> > +        // SAFETY: It is safe to call `task_active_pid_ns` without =
RCU protection when calling it
> >> > +        // on the current task.
> >> > +        let active_ns =3D unsafe { bindings::task_active_pid_ns(sel=
f.as_ptr()) };
> >> > +
> >> > +        if active_ns.is_null() {
> >> > +            return None;
> >> > +        }
> >> > +
> >> > +        // The lifetime of `PidNamespace` is bound to `Task` and `s=
truct pid`.
> >> > +        //
> >> > +        // The `PidNamespace` of a `Task` doesn't ever change once =
the `Task` is alive. A
> >> > +        // `unshare(CLONE_NEWPID)` or `setns(fd_pidns/pidfd, CLONE_=
NEWPID)` will not have an effect
> >> > +        // on the calling `Task`'s pid namespace. It will only effe=
ct the pid namespace of children
> >> > +        // created by the calling `Task`. This invariant guarantees=
 that after having acquired a
> >> > +        // reference to a `Task`'s pid namespace it will remain unc=
hanged.
> >> > +        //
> >> > +        // When a task has exited and been reaped `release_task()` =
will be called. This will set
> >> > +        // the `PidNamespace` of the task to `NULL`. So retrieving =
the `PidNamespace` of a task
> >> > +        // that is dead will return `NULL`. Note, that neither hold=
ing the RCU lock nor holding a
> >> > +        // referencing count to the `Task` will prevent `release_ta=
sk()` being called.
> >> > +        //
> >> > +        // In order to retrieve the `PidNamespace` of a `Task` the =
`task_active_pid_ns()` function
> >> > +        // can be used. There are two cases to consider:
> >> > +        //
> >> > +        // (1) retrieving the `PidNamespace` of the `current` task
> >> > +        // (2) retrieving the `PidNamespace` of a non-`current` tas=
k
> >> > +        //
> >> > +        // From system call context retrieving the `PidNamespace` f=
or case (1) is always safe and
> >> > +        // requires neither RCU locking nor a reference count to be=
 held. Retrieving the
> >> > +        // `PidNamespace` after `release_task()` for current will r=
eturn `NULL` but no codepath
> >> > +        // like that is exposed to Rust.
> >> > +        //
> >> > +        // Retrieving the `PidNamespace` from system call context f=
or (2) requires RCU protection.
> >> > +        // Accessing `PidNamespace` outside of RCU protection requi=
res a reference count that
> >> > +        // must've been acquired while holding the RCU lock. Note t=
hat accessing a non-`current`
> >> > +        // task means `NULL` can be returned as the non-`current` t=
ask could have already passed
> >> > +        // through `release_task()`.
> >> > +        //
> >> > +        // To retrieve (1) the `&CurrentTask` type should be used w=
hich ensures that the returned
> >> > +        // `PidNamespace` cannot outlive the current task context. =
The `CurrentTask::active_pid_ns`
> >> > +        // function allows Rust to handle the common case of access=
ing `current`'s `PidNamespace`
> >> > +        // without RCU protection and without having to acquire a r=
eference count.
> >> > +        //
> >> > +        // For (2) the `task_get_pid_ns()` method must be used. Thi=
s will always acquire a
> >> > +        // reference on `PidNamespace` and will return an `Option` =
to force the caller to
> >> > +        // explicitly handle the case where `PidNamespace` is `None=
`, something that tends to be
> >> > +        // forgotten when doing the equivalent operation in `C`. Mi=
ssing RCU primitives make it
> >> > +        // difficult to perform operations that are otherwise safe =
without holding a reference
> >> > +        // count as long as RCU protection is guaranteed. But it is=
 not important currently. But we
> >> > +        // do want it in the future.
> >> > +        //
> >> > +        // Note for (2) the required RCU protection around calling =
`task_active_pid_ns()`
> >> > +        // synchronizes against putting the last reference of the a=
ssociated `struct pid` of
> >> > +        // `task->thread_pid`. The `struct pid` stored in that fiel=
d is used to retrieve the
> >> > +        // `PidNamespace` of the caller. When `release_task()` is c=
alled `task->thread_pid` will be
> >> > +        // `NULL`ed and `put_pid()` on said `struct pid` will be de=
layed in `free_pid()` via
> >> > +        // `call_rcu()` allowing everyone with an RCU protected acc=
ess to the `struct pid` acquired
> >> > +        // from `task->thread_pid` to finish.
> >>
> >> While this comment is a nice piece of documentation, I think we should
> >> move it elsewhere, or restrict it to paragraphs pertaining to (1), sin=
ce
> >> that is the only case we consider here?
> >
> > Where would you move it?
>
> The info about (2) should probably be with the implementation for that
> case, when it lands. Perhaps we can move it hen?

The function already exists. It's called Task::get_pid_ns(). I think
the comment makes sense here: get_pid_ns() is the normal case where
you don't skip synchronization, and active_pid_ns() is the special
case where you can skip RCU due to reasons. This comment explains that
normally you cannot skip RCU, but in this special case you can.

Alice
