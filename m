Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7AC215064;
	Thu,  9 Jan 2025 08:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736412172; cv=none; b=pOfKCgJ5vos6a5zpEdAOzIyUzb+8rlUPIy6KpBjXKmrZsXqO/sFMoq1egx721RtnXPiCXRCYAJeQ/BF24fXHDtt7152xu2ZkY0wk9QC+77iNJk5+jQf7T7MK26ply7VK8ujXeCbIONTUquxguWBe8s8F0KcArEoo8S9fSNNFrQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736412172; c=relaxed/simple;
	bh=PhMWVkGP4H8b6b24Flid4Nn/KUJYU0Y+xwXr/mirWBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B371+rXuyiyNHgCaMwkv6WhXTZcUL7PNzJZ73ifbcOaRH12YVy4kLdG8zii8+UtAAwMuCRViVFdBHC+TivWW9oZURhrB8DtFKIOvPu+ChFzx8Vxetikfve8+yu5vpuhnrubUvkdjLHETOe6Zah7iQVbvL/Nf2ZqKtSikvyYa6jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICjvHPlq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICjvHPlq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F2AC4CED2;
	Thu,  9 Jan 2025 08:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736412172;
	bh=PhMWVkGP4H8b6b24Flid4Nn/KUJYU0Y+xwXr/mirWBs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ICjvHPlqK7b7PEe+CtIItBUm670tDTyD022FWKIRM0Gay+yCICMur+VzGs4AO0tiT
	 e615Ub5/Q9bcNkiMydTgIN6rd9NZVm7Ls/izsrsbMbAj0wclqG5YZS1qnSlSFYjeT6
	 57Kjxn/21kj5mAyzlt7TffsQmJIoqgBJc0LkDC1tr1BVTNvIeE0k3A7ecEoobtqihh
	 zerMCxqtYqKuUYSUno7O/BjuFDDVVD3fgbl77iowL9mrpNWNk7KaiddrtnIJg/kxXS
	 v+yAUtLdulLVJrmVWrATLQ6bLwsabuON+bfQV9+NeXMDJQlxDsqm+NET2EXl2gMvLS
	 HeLWZJtaAGUpg==
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
In-Reply-To: <CAH5fLgiBsW-sZ8LW4aqK1Eux71qdB3ERr6RdE3gX2uka+GRrew@mail.gmail.com>
 (Alice
	Ryhl's message of "Wed, 08 Jan 2025 13:32:28 +0100")
References: <20241211-vma-v11-0-466640428fc3@google.com>
	<mSBxLtHQ2_lBeEYTQNS-AoAdOXj-UH7mEb48SlHQZJMlUBwpqzIP4UB9nZv439lfseuIL27p3QnFOMFjV2wk-g==@protonmail.internalid>
	<20241211-vma-v11-8-466640428fc3@google.com> <87frmnadmk.fsf@kernel.org>
	<5qXA_x0NK0TzOkDwdQ8RYbk3SboUQiD0qflQhsoPRyhFxpD7fZHC7uVjI7RQBvvHPVEO1zlMRBq3F8BBImHrYQ==@protonmail.internalid>
	<CAH5fLgiBsW-sZ8LW4aqK1Eux71qdB3ERr6RdE3gX2uka+GRrew@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 09 Jan 2025 09:42:38 +0100
Message-ID: <87y0zk9y4h.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Mon, Dec 16, 2024 at 3:51=E2=80=AFPM Andreas Hindborg <a.hindborg@kern=
el.org> wrote:
>>
>> "Alice Ryhl" <aliceryhl@google.com> writes:
>> > +impl CurrentTask {
>> > +    /// Access the address space of the current task.
>> > +    ///
>> > +    /// This function does not touch the refcount of the mm.
>> > +    #[inline]
>> > +    pub fn mm(&self) -> Option<&MmWithUser> {
>> > +        // SAFETY: The `mm` field of `current` is not modified from o=
ther threads, so reading it is
>> > +        // not a data race.
>> > +        let mm =3D unsafe { (*self.as_ptr()).mm };
>> > +
>> > +        if mm.is_null() {
>> > +            return None;
>> > +        }
>> > +
>> > +        // SAFETY: If `current->mm` is non-null, then it references a=
 valid mm with a non-zero
>> > +        // value of `mm_users`. Furthermore, the returned `&MmWithUse=
r` borrows from this
>> > +        // `CurrentTask`, so it cannot escape the scope in which the =
current pointer was obtained.
>> > +        //
>> > +        // This is safe even if `kthread_use_mm()`/`kthread_unuse_mm(=
)` are used. There are two
>> > +        // relevant cases:
>> > +        // * If the `&CurrentTask` was created before `kthread_use_mm=
()`, then it cannot be
>> > +        //   accessed during the `kthread_use_mm()`/`kthread_unuse_mm=
()` scope due to the
>> > +        //   `NotThreadSafe` field of `CurrentTask`.
>> > +        // * If the `&CurrentTask` was created within a `kthread_use_=
mm()`/`kthread_unuse_mm()`
>> > +        //   scope, then the `&CurrentTask` cannot escape that scope,=
 so the returned `&MmWithUser`
>> > +        //   also cannot escape that scope.
>> > +        // In either case, it's not possible to read `current->mm` an=
d keep using it after the
>> > +        // scope is ended with `kthread_unuse_mm()`.
>>
>> I guess we don't actually need the last section until we see
>> `ktread_use_mm` / `kthread_unuse_mm` abstractions in tree?
>
> I mean, there could be such a scope in C code that called into Rust?

=F0=9F=91=8D

>> > +        Some(unsafe { MmWithUser::from_raw(mm) })
>> > +    }
>> > +
>> > +    /// Access the pid namespace of the current task.
>>
>> Is it an address space or a memory map(ping)? Can we use consistent voca=
bulary?
>
> Neither. It's a pid namespace which has nothing to do with address
> spaces or memory mappings. This part of this patch is moving an
> existing abstraction to work with the reworked way to access current.

Sorry, not sure what I was talking about here. I feel like this comment
landed in the wrong place =F0=9F=98=AC

I remember taking note of the use of VMA, memory map, address space all
over the place. I object to "VMA" and would rather have it spelled out
in documentation.

>
>> > +    ///
>> > +    /// This function does not touch the refcount of the namespace or=
 use RCU protection.
>> > +    #[doc(alias =3D "task_active_pid_ns")]
>>
>> What is with the alias?
>
> This is the Rust equivalent to the C function called
> task_active_pid_ns. The alias makes it easier to find it.

Cool.

>
>> > +    #[inline]
>> > +    pub fn active_pid_ns(&self) -> Option<&PidNamespace> {
>> > +        // SAFETY: It is safe to call `task_active_pid_ns` without RC=
U protection when calling it
>> > +        // on the current task.
>> > +        let active_ns =3D unsafe { bindings::task_active_pid_ns(self.=
as_ptr()) };
>> > +
>> > +        if active_ns.is_null() {
>> > +            return None;
>> > +        }
>> > +
>> > +        // The lifetime of `PidNamespace` is bound to `Task` and `str=
uct pid`.
>> > +        //
>> > +        // The `PidNamespace` of a `Task` doesn't ever change once th=
e `Task` is alive. A
>> > +        // `unshare(CLONE_NEWPID)` or `setns(fd_pidns/pidfd, CLONE_NE=
WPID)` will not have an effect
>> > +        // on the calling `Task`'s pid namespace. It will only effect=
 the pid namespace of children
>> > +        // created by the calling `Task`. This invariant guarantees t=
hat after having acquired a
>> > +        // reference to a `Task`'s pid namespace it will remain uncha=
nged.
>> > +        //
>> > +        // When a task has exited and been reaped `release_task()` wi=
ll be called. This will set
>> > +        // the `PidNamespace` of the task to `NULL`. So retrieving th=
e `PidNamespace` of a task
>> > +        // that is dead will return `NULL`. Note, that neither holdin=
g the RCU lock nor holding a
>> > +        // referencing count to the `Task` will prevent `release_task=
()` being called.
>> > +        //
>> > +        // In order to retrieve the `PidNamespace` of a `Task` the `t=
ask_active_pid_ns()` function
>> > +        // can be used. There are two cases to consider:
>> > +        //
>> > +        // (1) retrieving the `PidNamespace` of the `current` task
>> > +        // (2) retrieving the `PidNamespace` of a non-`current` task
>> > +        //
>> > +        // From system call context retrieving the `PidNamespace` for=
 case (1) is always safe and
>> > +        // requires neither RCU locking nor a reference count to be h=
eld. Retrieving the
>> > +        // `PidNamespace` after `release_task()` for current will ret=
urn `NULL` but no codepath
>> > +        // like that is exposed to Rust.
>> > +        //
>> > +        // Retrieving the `PidNamespace` from system call context for=
 (2) requires RCU protection.
>> > +        // Accessing `PidNamespace` outside of RCU protection require=
s a reference count that
>> > +        // must've been acquired while holding the RCU lock. Note tha=
t accessing a non-`current`
>> > +        // task means `NULL` can be returned as the non-`current` tas=
k could have already passed
>> > +        // through `release_task()`.
>> > +        //
>> > +        // To retrieve (1) the `&CurrentTask` type should be used whi=
ch ensures that the returned
>> > +        // `PidNamespace` cannot outlive the current task context. Th=
e `CurrentTask::active_pid_ns`
>> > +        // function allows Rust to handle the common case of accessin=
g `current`'s `PidNamespace`
>> > +        // without RCU protection and without having to acquire a ref=
erence count.
>> > +        //
>> > +        // For (2) the `task_get_pid_ns()` method must be used. This =
will always acquire a
>> > +        // reference on `PidNamespace` and will return an `Option` to=
 force the caller to
>> > +        // explicitly handle the case where `PidNamespace` is `None`,=
 something that tends to be
>> > +        // forgotten when doing the equivalent operation in `C`. Miss=
ing RCU primitives make it
>> > +        // difficult to perform operations that are otherwise safe wi=
thout holding a reference
>> > +        // count as long as RCU protection is guaranteed. But it is n=
ot important currently. But we
>> > +        // do want it in the future.
>> > +        //
>> > +        // Note for (2) the required RCU protection around calling `t=
ask_active_pid_ns()`
>> > +        // synchronizes against putting the last reference of the ass=
ociated `struct pid` of
>> > +        // `task->thread_pid`. The `struct pid` stored in that field =
is used to retrieve the
>> > +        // `PidNamespace` of the caller. When `release_task()` is cal=
led `task->thread_pid` will be
>> > +        // `NULL`ed and `put_pid()` on said `struct pid` will be dela=
yed in `free_pid()` via
>> > +        // `call_rcu()` allowing everyone with an RCU protected acces=
s to the `struct pid` acquired
>> > +        // from `task->thread_pid` to finish.
>>
>> While this comment is a nice piece of documentation, I think we should
>> move it elsewhere, or restrict it to paragraphs pertaining to (1), since
>> that is the only case we consider here?
>
> Where would you move it?

The info about (2) should probably be with the implementation for that
case, when it lands. Perhaps we can move it hen?

>
>> > +        //
>> > +        // SAFETY: If `current`'s pid ns is non-null, then it referen=
ces a valid pid ns.
>> > +        // Furthermore, the returned `&PidNamespace` borrows from thi=
s `CurrentTask`, so it cannot
>> > +        // escape the scope in which the current pointer was obtained.
>> > +        Some(unsafe { PidNamespace::from_ptr(active_ns) })
>> > +    }
>>
>> Can we move the impl block and the struct definition next to each other?
>
> I could move the definition of CurrentTask down, but I'm not really
> convinced that it's an improvement.

I would prefer that, but it's just personal preference. I think it makes
for a more comfortable ride when reading the code first time.



Best regards,
Andreas Hindborg


