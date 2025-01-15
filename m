Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDFB23F28F;
	Wed, 15 Jan 2025 11:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736939033; cv=none; b=hrSutB7NxVow+YtfLADkZ2qURpj6tlkrIFRCtpyRYMPws5sCdg/l76wkHGYPiOy4rOcIEIT1eqZ4oj1livHHIAtgP4FUtelOerXEiSZoVuzMQoTlfZ4/I5dBF8Kp53xQuFhx4Oi9bPl7Z5TCaOvZJyra1NILhEpJeaju6dFUskI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736939033; c=relaxed/simple;
	bh=iM/ufShMeANIyjcRrOoDegM0Bsoxs3dzLR1kEoW8C1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbDEdpgRYv9X5orYhQPJrjom9Uwg3ziv0eYgstuaGcOsdYqP3k3Y8GmCbeuJerZB6zUn92FS8dkMVQADqvQ5lpviwAGJn2ZgfyiVRUmqgZejSYZHyqdycH0uqCnwQtyU157riZ6Rnh/X5FoH0RzNTcK91Skb9OZ2Kgkqwk3phdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ALRZgHh4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ALRZgHh4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960A9C4CEE4;
	Wed, 15 Jan 2025 11:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736939033;
	bh=iM/ufShMeANIyjcRrOoDegM0Bsoxs3dzLR1kEoW8C1w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ALRZgHh434RCRIA1UqIBaRe/NXU5ncICjYcBki3iZ6LnjUIawa2s8VKqZyIZRYOuw
	 MKGss0LBMtbskZgwNACkZFv5CxjQtGpgCnOPa9uItyYDaYQgezoIgOq06CfZkc1cHZ
	 +OsOyCsOwCRENcvgLkSuTQVsxMUTh0cATzjMq6gLyzdMljiSG8QjiXuEzUtYrAO2Xc
	 TZhHHGxB1dGTm+Fc1bPvu8mIySILB9BiieQhrJ/S7sxK9XYeRj+3H1mQga7+Nto/Hy
	 wB7b5z0a8Lg7lzV1QZWuHwcCTqv1Qk987A1M5B7/3rLz8d9f7awGU00Td5ZSjpM/kC
	 szEO2vMKlAvaw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Matthew Wilcox"
 <willy@infradead.org>,  "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
  "Vlastimil Babka" <vbabka@suse.cz>,  "John Hubbard"
 <jhubbard@nvidia.com>,  "Liam R. Howlett" <Liam.Howlett@oracle.com>,
  "Andrew Morton" <akpm@linux-foundation.org>,  "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,  "Arnd Bergmann" <arnd@arndb.de>,
  "Christian Brauner" <brauner@kernel.org>,  "Jann Horn"
 <jannh@google.com>,  "Suren Baghdasaryan" <surenb@google.com>,  "Alex
 Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,
  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v11 8/8] task: rust: rework how current is accessed
In-Reply-To: <CAH5fLgh6J41JkaD23_Br6nLkznAfzaivVY=xRpr1jzpUZNZgKA@mail.gmail.com>
 (Alice
	Ryhl's message of "Mon, 13 Jan 2025 11:26:42 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<mSBxLtHQ2_lBeEYTQNS-AoAdOXj-UH7mEb48SlHQZJMlUBwpqzIP4UB9nZv439lfseuIL27p3QnFOMFjV2wk-g==@protonmail.internalid>
	<20241211-vma-v11-8-466640428fc3@google.com> <87frmnadmk.fsf@kernel.org>
	<5qXA_x0NK0TzOkDwdQ8RYbk3SboUQiD0qflQhsoPRyhFxpD7fZHC7uVjI7RQBvvHPVEO1zlMRBq3F8BBImHrYQ==@protonmail.internalid>
	<CAH5fLgiBsW-sZ8LW4aqK1Eux71qdB3ERr6RdE3gX2uka+GRrew@mail.gmail.com>
	<87y0zk9y4h.fsf@kernel.org>
	<ZLsAHugV1zYzvy9Kf58keOm3JZk3-7ZwaVCBuSpQLQA6C_VSQ5q6PlAqiRRvhaMNjYFe1q4MMXrKF1eW_u5oUQ==@protonmail.internalid>
	<CAH5fLgh6J41JkaD23_Br6nLkznAfzaivVY=xRpr1jzpUZNZgKA@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 15 Jan 2025 11:24:23 +0100
Message-ID: <87frlke5ns.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Thu, Jan 9, 2025 at 9:42=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>>
>> > On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@k=
ernel.org> wrote:
>> >>
>> >> "Alice Ryhl" <aliceryhl@google.com> writes:
>> >> > +    #[inline]
>> >> > +    pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
>> >> > +        // SAFETY: It is safe to call `task_active_pid_ns` without=
 RCU protection when calling it
>> >> > +        // on the current task.
>> >> > +        let active_ns =3D unsafe { bindings::task_active_pid_ns(se=
lf.as_ptr()) };
>> >> > +
>> >> > +        if active_ns.is_null() {
>> >> > +            return None;
>> >> > +        }
>> >> > +
>> >> > +        // The lifetime of `PidNamespace` is bound to `Task` and `=
struct pid`.
>> >> > +        //
>> >> > +        // The `PidNamespace` of a `Task` doesn't ever change once=
 the `Task` is alive. A
>> >> > +        // `unshare(CLONE_NEWPID)` or `setns(fd_pidns/pidfd, CLONE=
_NEWPID)` will not have an effect
>> >> > +        // on the calling `Task`'s pid namespace. It will only eff=
ect the pid namespace of children
>> >> > +        // created by the calling `Task`. This invariant guarantee=
s that after having acquired a
>> >> > +        // reference to a `Task`'s pid namespace it will remain un=
changed.
>> >> > +        //
>> >> > +        // When a task has exited and been reaped `release_task()`=
 will be called. This will set
>> >> > +        // the `PidNamespace` of the task to `NULL`. So retrieving=
 the `PidNamespace` of a task
>> >> > +        // that is dead will return `NULL`. Note, that neither hol=
ding the RCU lock nor holding a
>> >> > +        // referencing count to the `Task` will prevent `release_t=
ask()` being called.
>> >> > +        //
>> >> > +        // In order to retrieve the `PidNamespace` of a `Task` the=
 `task_active_pid_ns()` function
>> >> > +        // can be used. There are two cases to consider:
>> >> > +        //
>> >> > +        // (1) retrieving the `PidNamespace` of the `current` task
>> >> > +        // (2) retrieving the `PidNamespace` of a non-`current` ta=
sk
>> >> > +        //
>> >> > +        // From system call context retrieving the `PidNamespace` =
for case (1) is always safe and
>> >> > +        // requires neither RCU locking nor a reference count to b=
e held. Retrieving the
>> >> > +        // `PidNamespace` after `release_task()` for current will =
return `NULL` but no codepath
>> >> > +        // like that is exposed to Rust.
>> >> > +        //
>> >> > +        // Retrieving the `PidNamespace` from system call context =
for (2) requires RCU protection.
>> >> > +        // Accessing `PidNamespace` outside of RCU protection requ=
ires a reference count that
>> >> > +        // must've been acquired while holding the RCU lock. Note =
that accessing a non-`current`
>> >> > +        // task means `NULL` can be returned as the non-`current` =
task could have already passed
>> >> > +        // through `release_task()`.
>> >> > +        //
>> >> > +        // To retrieve (1) the `&CurrentTask` type should be used =
which ensures that the returned
>> >> > +        // `PidNamespace` cannot outlive the current task context.=
 The `CurrentTask::active_pid_ns`
>> >> > +        // function allows Rust to handle the common case of acces=
sing `current`'s `PidNamespace`
>> >> > +        // without RCU protection and without having to acquire a =
reference count.
>> >> > +        //
>> >> > +        // For (2) the `task_get_pid_ns()` method must be used. Th=
is will always acquire a
>> >> > +        // reference on `PidNamespace` and will return an `Option`=
 to force the caller to
>> >> > +        // explicitly handle the case where `PidNamespace` is `Non=
e`, something that tends to be
>> >> > +        // forgotten when doing the equivalent operation in `C`. M=
issing RCU primitives make it
>> >> > +        // difficult to perform operations that are otherwise safe=
 without holding a reference
>> >> > +        // count as long as RCU protection is guaranteed. But it i=
s not important currently. But we
>> >> > +        // do want it in the future.
>> >> > +        //
>> >> > +        // Note for (2) the required RCU protection around calling=
 `task_active_pid_ns()`
>> >> > +        // synchronizes against putting the last reference of the =
associated `struct pid` of
>> >> > +        // `task->thread_pid`. The `struct pid` stored in that fie=
ld is used to retrieve the
>> >> > +        // `PidNamespace` of the caller. When `release_task()` is =
called `task->thread_pid` will be
>> >> > +        // `NULL`ed and `put_pid()` on said `struct pid` will be d=
elayed in `free_pid()` via
>> >> > +        // `call_rcu()` allowing everyone with an RCU protected ac=
cess to the `struct pid` acquired
>> >> > +        // from `task->thread_pid` to finish.
>> >>
>> >> While this comment is a nice piece of documentation, I think we should
>> >> move it elsewhere, or restrict it to paragraphs pertaining to (1), si=
nce
>> >> that is the only case we consider here?
>> >
>> > Where would you move it?
>>
>> The info about (2) should probably be with the implementation for that
>> case, when it lands. Perhaps we can move it hen?
>
> The function already exists. It's called Task::get_pid_ns(). I think
> the comment makes sense here: get_pid_ns() is the normal case where
> you don't skip synchronization, and active_pid_ns() is the special
> case where you can skip RCU due to reasons. This comment explains that
> normally you cannot skip RCU, but in this special case you can.

Reading this again I think it should simply be cut down in size:


```
The lifetime of `PidNamespace` is bound to `Task` and `struct pid`.

The `PidNamespace` of a `Task` doesn't ever change once the `Task` is alive.

From system call context retrieving the `PidNamespace` for the current
task is always safe and requires neither RCU locking nor a reference
count to be held. Retrieving the `PidNamespace` after `release_task()`
for current will return `NULL` but no codepath like that is exposed to
Rust.
```

The rest is not relevant to this function and it does not help
understanding the function.


Another thought - add a link to `get_pid_ns`:

@@ -307,6 +307,8 @@ pub fn mm(&self) -> Option<&MmWithUser> {
     /// Access the pid namespace of the current task.
     ///
     /// This function does not touch the refcount of the namespace or use =
RCU protection.
+    ///
+    /// To access the pid namespace of another task, see [`Task::get_pid_n=
s`].
     #[doc(alias =3D "task_active_pid_ns")]
     #[inline]
     pub fn active_pid_ns(&self) -> Option<&PidNamespace> {


Best regards,
Andreas Hindborg


