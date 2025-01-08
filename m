Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BF238F82
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jan 2025 12:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339563; cv=none; b=PXV3f00CMD7yQkBEnSGTYtFMFJGQ8Fdm+T4mth6b7EUfgpMqbYsyz9omyCRywEP3xRpQn7GCojAmgc6fnrHWrid6+CtYR7vXYAiymVXd+HjPpv+RlKO/91X9Q4xtEqVDS2SPqM7gRDLsO4kLyMGK5D7ZE0fAgA14GP6lR1aCcq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339563; c=relaxed/simple;
	bh=swwGyveLyp0amIySgvtp+qQyuVHE7vnmoDcPy67/Qj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iDp1BPLFBvPvUVDJwqBFmZhmHpMEkI5FdS1gIckOBuTnmCWboixNndAYzz5lVB4ftvH6opHgtljjFwdg6uX+9W4SQiuCyFHlzORcpCtq0GvpZsfVaq2SB/9Iy8TUIwER+LMjKXZHRztb5+tLATPxZow0HQ//1kNLSKHIDcJmZWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2P/hTlOx; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2P/hTlOx"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso119618865e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jan 2025 04:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736339560; x=1736944360; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3Vodk3cvVQRC0E4rbLU9E6VKqAaSnQ+/DTuNiDJXiA=;
        b=2P/hTlOxh84FRmVsmcUKgl/TCzD089sDM0K2bKDkGAuF7rlpA5eRGg540uGt/P0jt/
         XW6HIikmWjUB5iqPQ72FRnhbDHx1dpZQGwMH0Tdbl/hmc5DV/PnMtKK8Mytf+mIMs1MV
         3WUDvgKV8Exz8egKkgAw4WnrWtbBxqSkT0XLxBv+UWxDXsvFp7Z86iGfxCnFISo4Oawr
         s/VPQaF+ll9gDEyIJ9rJwlHfXxOlASe+bkSX2CDBphRU5ICgyCjbFPIDuwgT/6IVxvLA
         uI8qmT45o7as13cSNPxQpova3XCTtguzNyuyEij9Rv5qa/ZD4pB0WH1MrQSnmryFjyu1
         cNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339560; x=1736944360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y3Vodk3cvVQRC0E4rbLU9E6VKqAaSnQ+/DTuNiDJXiA=;
        b=U7jjM7bgCvGwwWQstTEKj/caK629xMRsTRVgr5LF6nGlvWokFbWpVK+1sY8NT3H3c0
         najJfQLby11xxnTjF/CQifGSNHlF+TqMj+U4xsdD4qTDjTmm4KCz6htnYba07W2hpFIg
         GRiN+zHE9mSf7Qnxrl7dIkkHsMlfoeDASW5fHwY7P5czTr+Q7BLi/OKffCI4P5pCDYoA
         0W6S9XAbTirGbMlUwdiNSaVX9ND2idELufLwm/e0f5y4HBWy4Jkcug2vumpQ5SrtwyL/
         AMP48eFRbpsPFn1NLnS4GbXz7FuCrGg6aPbB+JM1IKBoA3Ser6u+FKNQIQbjV3O7UDCH
         K0iw==
X-Forwarded-Encrypted: i=1; AJvYcCUpGBRzU5230KwhVPvBzFhvWfkWLfbw3pNKLupfa34S+Y6/N0TVgFwh+MCVg4bl5FiQ1ZFzSCJjez+Gxio75A==@vger.kernel.org
X-Gm-Message-State: AOJu0YytiziRWFlLf73d74IjpbLIf9FViGh5UXefNzSJoCXSn9e0TM+O
	ukcm4sIXC+YGcqa8llXDrOBqpllvt9gyKBjb16qCbdnBZIbnkSILPjE/lKXBFnKQQjO2C7RKzZp
	o96fHNRXP715w52DXdXsWVMduqzbbTkCtqWHB
X-Gm-Gg: ASbGnctQuB02gsNfW5Zw97muY9wFtBObuvAlaBEwXYgPHIoVihUC6zursoxfPXl3qMC
	AbTYhXR3u48DJog3rKbvB766IIp9vo4bauH5WURUom8jnPfENfqicOp431vmt6+YFArON
X-Google-Smtp-Source: AGHT+IEskuo3fK2LuhaAm13Ug2sSSFQnbDigYwYbO9yrK57j8PvPXDs4R1cjfZdHdzcXJgq1wwS+JhW9G4C5zCKry+s=
X-Received: by 2002:a05:6000:1f8d:b0:385:f6c7:90c6 with SMTP id
 ffacd0b85a97d-38a8730687emr2336604f8f.20.1736339560020; Wed, 08 Jan 2025
 04:32:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211-vma-v11-0-466640428fc3@google.com> <mSBxLtHQ2_lBeEYTQNS-AoAdOXj-UH7mEb48SlHQZJMlUBwpqzIP4UB9nZv439lfseuIL27p3QnFOMFjV2wk-g==@protonmail.internalid>
 <20241211-vma-v11-8-466640428fc3@google.com> <87frmnadmk.fsf@kernel.org>
In-Reply-To: <87frmnadmk.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Jan 2025 13:32:28 +0100
X-Gm-Features: AbW1kvYRGjjTmfVAVHygmi3avDuaVXAHexXRmtBBxOnWAWxHdiZq78_fUYF0gdI
Message-ID: <CAH5fLgiBsW-sZ8LW4aqK1Eux71qdB3ERr6RdE3gX2uka+GRrew@mail.gmail.com>
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

On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
> > +impl CurrentTask {
> > +    /// Access the address space of the current task.
> > +    ///
> > +    /// This function does not touch the refcount of the mm.
> > +    #[inline]
> > +    pub fn mm(&self) -> Option<&MmWithUser> {
> > +        // SAFETY: The `mm` field of `current` is not modified from ot=
her threads, so reading it is
> > +        // not a data race.
> > +        let mm =3D unsafe { (*self.as_ptr()).mm };
> > +
> > +        if mm.is_null() {
> > +            return None;
> > +        }
> > +
> > +        // SAFETY: If `current->mm` is non-null, then it references a =
valid mm with a non-zero
> > +        // value of `mm_users`. Furthermore, the returned `&MmWithUser=
` borrows from this
> > +        // `CurrentTask`, so it cannot escape the scope in which the c=
urrent pointer was obtained.
> > +        //
> > +        // This is safe even if `kthread_use_mm()`/`kthread_unuse_mm()=
` are used. There are two
> > +        // relevant cases:
> > +        // * If the `&CurrentTask` was created before `kthread_use_mm(=
)`, then it cannot be
> > +        //   accessed during the `kthread_use_mm()`/`kthread_unuse_mm(=
)` scope due to the
> > +        //   `NotThreadSafe` field of `CurrentTask`.
> > +        // * If the `&CurrentTask` was created within a `kthread_use_m=
m()`/`kthread_unuse_mm()`
> > +        //   scope, then the `&CurrentTask` cannot escape that scope, =
so the returned `&MmWithUser`
> > +        //   also cannot escape that scope.
> > +        // In either case, it's not possible to read `current->mm` and=
 keep using it after the
> > +        // scope is ended with `kthread_unuse_mm()`.
>
> I guess we don't actually need the last section until we see
> `ktread_use_mm` / `kthread_unuse_mm` abstractions in tree?

I mean, there could be such a scope in C code that called into Rust?
And I don't think there's anything wrong with future-proofing this
abstraction towards adding it in the future.

> > +        Some(unsafe { MmWithUser::from_raw(mm) })
> > +    }
> > +
> > +    /// Access the pid namespace of the current task.
>
> Is it an address space or a memory map(ping)? Can we use consistent vocab=
ulary?

Neither. It's a pid namespace which has nothing to do with address
spaces or memory mappings. This part of this patch is moving an
existing abstraction to work with the reworked way to access current.

> > +    ///
> > +    /// This function does not touch the refcount of the namespace or =
use RCU protection.
> > +    #[doc(alias =3D "task_active_pid_ns")]
>
> What is with the alias?

This is the Rust equivalent to the C function called
task_active_pid_ns. The alias makes it easier to find it.

> > +    #[inline]
> > +    pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
> > +        // SAFETY: It is safe to call `task_active_pid_ns` without RCU=
 protection when calling it
> > +        // on the current task.
> > +        let active_ns =3D unsafe { bindings::task_active_pid_ns(self.a=
s_ptr()) };
> > +
> > +        if active_ns.is_null() {
> > +            return None;
> > +        }
> > +
> > +        // The lifetime of `PidNamespace` is bound to `Task` and `stru=
ct pid`.
> > +        //
> > +        // The `PidNamespace` of a `Task` doesn't ever change once the=
 `Task` is alive. A
> > +        // `unshare(CLONE_NEWPID)` or `setns(fd_pidns/pidfd, CLONE_NEW=
PID)` will not have an effect
> > +        // on the calling `Task`'s pid namespace. It will only effect =
the pid namespace of children
> > +        // created by the calling `Task`. This invariant guarantees th=
at after having acquired a
> > +        // reference to a `Task`'s pid namespace it will remain unchan=
ged.
> > +        //
> > +        // When a task has exited and been reaped `release_task()` wil=
l be called. This will set
> > +        // the `PidNamespace` of the task to `NULL`. So retrieving the=
 `PidNamespace` of a task
> > +        // that is dead will return `NULL`. Note, that neither holding=
 the RCU lock nor holding a
> > +        // referencing count to the `Task` will prevent `release_task(=
)` being called.
> > +        //
> > +        // In order to retrieve the `PidNamespace` of a `Task` the `ta=
sk_active_pid_ns()` function
> > +        // can be used. There are two cases to consider:
> > +        //
> > +        // (1) retrieving the `PidNamespace` of the `current` task
> > +        // (2) retrieving the `PidNamespace` of a non-`current` task
> > +        //
> > +        // From system call context retrieving the `PidNamespace` for =
case (1) is always safe and
> > +        // requires neither RCU locking nor a reference count to be he=
ld. Retrieving the
> > +        // `PidNamespace` after `release_task()` for current will retu=
rn `NULL` but no codepath
> > +        // like that is exposed to Rust.
> > +        //
> > +        // Retrieving the `PidNamespace` from system call context for =
(2) requires RCU protection.
> > +        // Accessing `PidNamespace` outside of RCU protection requires=
 a reference count that
> > +        // must've been acquired while holding the RCU lock. Note that=
 accessing a non-`current`
> > +        // task means `NULL` can be returned as the non-`current` task=
 could have already passed
> > +        // through `release_task()`.
> > +        //
> > +        // To retrieve (1) the `&CurrentTask` type should be used whic=
h ensures that the returned
> > +        // `PidNamespace` cannot outlive the current task context. The=
 `CurrentTask::active_pid_ns`
> > +        // function allows Rust to handle the common case of accessing=
 `current`'s `PidNamespace`
> > +        // without RCU protection and without having to acquire a refe=
rence count.
> > +        //
> > +        // For (2) the `task_get_pid_ns()` method must be used. This w=
ill always acquire a
> > +        // reference on `PidNamespace` and will return an `Option` to =
force the caller to
> > +        // explicitly handle the case where `PidNamespace` is `None`, =
something that tends to be
> > +        // forgotten when doing the equivalent operation in `C`. Missi=
ng RCU primitives make it
> > +        // difficult to perform operations that are otherwise safe wit=
hout holding a reference
> > +        // count as long as RCU protection is guaranteed. But it is no=
t important currently. But we
> > +        // do want it in the future.
> > +        //
> > +        // Note for (2) the required RCU protection around calling `ta=
sk_active_pid_ns()`
> > +        // synchronizes against putting the last reference of the asso=
ciated `struct pid` of
> > +        // `task->thread_pid`. The `struct pid` stored in that field i=
s used to retrieve the
> > +        // `PidNamespace` of the caller. When `release_task()` is call=
ed `task->thread_pid` will be
> > +        // `NULL`ed and `put_pid()` on said `struct pid` will be delay=
ed in `free_pid()` via
> > +        // `call_rcu()` allowing everyone with an RCU protected access=
 to the `struct pid` acquired
> > +        // from `task->thread_pid` to finish.
>
> While this comment is a nice piece of documentation, I think we should
> move it elsewhere, or restrict it to paragraphs pertaining to (1), since
> that is the only case we consider here?

Where would you move it?

> > +        //
> > +        // SAFETY: If `current`'s pid ns is non-null, then it referenc=
es a valid pid ns.
> > +        // Furthermore, the returned `&PidNamespace` borrows from this=
 `CurrentTask`, so it cannot
> > +        // escape the scope in which the current pointer was obtained.
> > +        Some(unsafe { PidNamespace::from_ptr(active_ns) })
> > +    }
>
> Can we move the impl block and the struct definition next to each other?

I could move the definition of CurrentTask down, but I'm not really
convinced that it's an improvement.

Alice
