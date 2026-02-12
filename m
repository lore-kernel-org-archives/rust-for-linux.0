Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968EA2770A
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 17:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770919047; cv=pass; b=bZrjiSuYQuMC38nn1PJMRnpK4fyPFvR5w9d55CvNetj41y1Ed67/9A4dPyXWAqxEEv6apA8jd4L5wC7CTaLvU8n6nT8Wbr+6hmBfvnpedR2ZSuzuWK92iPDPD6Ir9JHo/3sOoJOBiW2aKe0zaIWiBc7FSJQnuOBeIC6puCrhucY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770919047; c=relaxed/simple;
	bh=EhXTKtRF/I3yDPHeGp0rE6kgGjFY0V5i+vd45ZXA93k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HimCIdUVj/h2b4h6/P+DeDZ4SqDIhw/XOmKCGGS9kKtvxegLHo3RL6BJSVs6Dl4uyWjJ5EhLSb889MTWGA9yRX1h+QIHeiQ0CbV/pMgyROgSONGIW6/pVcT7RCv12+gJVkBlsDuJPJYi5psr1TvM/tultpP5jB1CAIH/+TSJDhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xcMeP+hj; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xcMeP+hj"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-65a3a1740e7so388a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 09:57:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770919044; cv=none;
        d=google.com; s=arc-20240605;
        b=kreCnVprjCnQEBAb7LYufzKe9lQeEKK4+kuY60deV/NtbDz40NH3x+4aeBvUvUsczP
         B1ky4By96ayM16ndkxEro/GeSYvb1ZJoab6RQ8jTWemK0X41sUggPufmgA8GFzjCukIQ
         pP/9/Y60mpG90/PBdQbCY9WxozHT3iXi2rEZO2uL8q6SkOBLJZCUoDDyJgsybRk7Z2/B
         b28nmPkz/gRrs66hyc62h87pp8KkrqkluaMK37vvGLez0kDPgXtBXJd1u3qREJUU4cQm
         fgVG6ceZWto6S4v2PzJMJ7EOOn4e/tJ+kuvpmYtnUHWEPJdkmLjGHxc3b6KMlE5ViWGs
         +O6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tVlqnetEz8yUwQdQn0ClYH5vWDZI7e3GhL2usHI85V0=;
        fh=orl5G0MfnX1YyD+KYUl7s3HSaoRhinldlmFbOcJYSJ8=;
        b=lDYzn2KwFcByKTudUn957A3JyacrlMmxIGrJTV8T/gGU49Dt+jhl4my8R7ZjGnI0Aj
         OtlMSe0MZtuKjdWm2N3mpSw8dsQ06guDfbpvmCszkMDS0h8h/pVR807aq4o7E6ZPULUw
         SZ7+3l/RgHi/o8Izo0QHyH0KQqrG7Q6REPaTS5MbkirJ3oQgf1tTO+QDA3Guv3V7DM3j
         WKD7lF/hqKMaQzTVV/F2FKpvgoAy1rLXH0nJiz0LasqkA/esresZzSNyAclD8LhwKbVE
         VEe73N5Ch/0Nrm41a7/d2boDyRIBlLrx64pTzd6MdjjYVndqBZ3KzswC8++kANgAURwJ
         Fy8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770919044; x=1771523844; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tVlqnetEz8yUwQdQn0ClYH5vWDZI7e3GhL2usHI85V0=;
        b=xcMeP+hjWHcEjgA90nXluccAEN9Uhfwq5uMkwi0zN7E5Lk2atfiFV8IPNyiWzv4YTQ
         wxKlINXmEFJTE0gqfpJpF/4Hy3EPc/Sxk2mUBbdPfFn8gtgdZvoyF/pFxnIDSh9QpBek
         UEA2xMhadMeCrFgnF0ObmMouIcXKnFyNWxxo7CQehEahQHgsEEyK7QzyOH9HO8Ky/Kxo
         XNkXPsa24VsBGuV84RPGFa3C+Y0nFGdIefA95AFYHh4l0TNSAUQLxe1sIpp16pkQ2y7a
         ASSmhMt+HTK4vw4YtENKxxOwdOJ/uvBfvPBwQd6cCSQm1xv3EH2VVxdA3K8W3BzdxX2A
         K1Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770919044; x=1771523844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tVlqnetEz8yUwQdQn0ClYH5vWDZI7e3GhL2usHI85V0=;
        b=h2Uh6s9PdHGKEv4mwGDrao/CjyS9No5/gLH6OkMYrCedIfwq8oPHtXxU32m9g7H0lz
         qf9EvM6jCso5EXS8V75h46k20JLOvSRS+BKKxlyX5Na8j1pIVM7Dw09u0DzRvUlYOC37
         V58lpDDAYRv4pBSPKfeia3JcvhrjuMdUczTxUbEhE8pktvw+7xu0nvb6TyTCJ5k7hCdU
         5c7uunJ2AFCPZ8E6EMibGchB4kBFdJ1bvSUgG1qAPCqfnKIacmpP8cPODQE4zFUjwE8q
         GaYK3W6IYahnsenIAULk/CZ93OQHf5qRCNx2GMew29GVRJylQiU7H5D/ZC3c69aOMmxN
         T63Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvUA8vIFKmffH+Mu9Z/uJYQPCMEKLrAeYv17+Oi3D2p9A+2e1eJ+k248QUhwoUWMNFRgI/Se/jJ1aEm4dmOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxVEpXxELKBvopTmAgm9t+Mg5MihjTq2U4K/y76St48KlfxCBaz
	hIbrXxE/w20GzujseVkvd+MycxS3zf4CkfP61uFok4aEUHQ10pCqxhsZC76Wrko27tBvN8EZAQ6
	cK/t2im+KXNvZkjWwSfK4ray0x59paVQSUPHLc7q5
X-Gm-Gg: AZuq6aJQdSCPGj3U5epd5zW7jyzYPAF7YlrT3lveIxkEcFjzBF+Z9bcsqI6CiPgvnpG
	YlOjcs47bX7RJLf3vqQ8Uuk1HazEyLUCQhVC/+xQ6FJCEOYyHqYQWc6NxdGsF0f0TjYT0Aa8uSl
	4ldK4pF+Gh7FA86QsLxWsoSdIyS9nAu+oUygPup+xpwi3DpXS1SbeHePGbTCmcLkqgJUU5dCX2w
	QU+dIDkJkGHHMOOmoKsJtjEcdhSWKnvn6278ZR32SkV6BTkrSCwUiVxv3bglJXZlFswvNVgBkNm
	vMwhXwLEQO9qcsn/T933x13LEc321nmiDAOoDg==
X-Received: by 2002:a05:6402:3549:b0:659:785c:d3a5 with SMTP id
 4fb4d7f45d1cf-65b9912a432mr61069a12.8.1770919043418; Thu, 12 Feb 2026
 09:57:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212-rust-de_thread-v1-1-948f5b992624@google.com> <aY4KTKEeljWt2NfH@tardis.local>
In-Reply-To: <aY4KTKEeljWt2NfH@tardis.local>
From: Jann Horn <jannh@google.com>
Date: Thu, 12 Feb 2026 18:56:47 +0100
X-Gm-Features: AZwV_Qh8CMbVRGVHCRCHFpXP2aXfkesrZSuIHE2Xk3K6BSrGstsa3RRSbXxjYuw
Message-ID: <CAG48ez1Gc73rwgC8kY=6mTbx=SjVGT95pbhnjh_RAsvvyNudEg@mail.gmail.com>
Subject: Re: [PATCH] rust: task: clean up safety issues wrt de_thread()
To: Boqun Feng <boqun@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho <walmeida@microsoft.com>, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 6:13=E2=80=AFPM Boqun Feng <boqun@kernel.org> wrote=
:
> On Thu, Feb 12, 2026 at 05:44:15PM +0100, Jann Horn wrote:
> > (Note: This is not a bugfix, it just cleans up incorrect assumptions.)
> >
> > Task::pid() and Task::group_leader() assume that task::pid and
> > task::group_leader remain constant until the task refcount drops to zer=
o.
> >
> > However, Linux has a special quirk where, when execve() is called by a
> > thread other than the thread group leader (the main thread), the thread
> > calling execve() swaps its identity with the thread group leader's,
> > becoming the new thread group leader. This means task::pid and
> > task::group_leader can't be assumed to be immutable for non-current tas=
ks.
> > (The actual swapping of PIDs is implemented in exchange_tids(); the cha=
nge
> > of leadership is in de_thread().)
> >
> > For reference, you can see that accessing the ->group_leader of some ra=
ndom
> > task requires extra caution in the prlimit64() syscall, which grabs the
> > tasklist_lock and has a comment explaining that this is done to prevent
> > races with de_thread().
> >
>
> Thank you for the patch. I think it's actually a fix to the API, so we
> need to Cc: stable here.

I don't think "a fix to the API" (when talking to a kernel-internal
API) is a reason why a patch has to go into stable.

https://docs.kernel.org/process/stable-kernel-rules.html says: "It
must either fix a real bug that bothers people or just add a device
ID."

In this case, I don't think the change will cause any actual change in
userspace-visible behavior; the group_leader() change clearly has no
effect on behavior because all existing users use it on `current`, and
the pid() change also seems very unlikely to actually change compiler
output in a way that makes things less safe.

> Could you also split the patches into two? One
> is moving the `group_leader()` into `CurrentTask` and the other is using
> *atomic load* to read `pid` (see below)?

I figured these two changes were semantically related enough to go in
one patch, but sure, I'll split it up.

> > Signed-off-by: Jann Horn <jannh@google.com>
> > ---
> >  rust/kernel/task.rs | 34 ++++++++++++++++++----------------
> >  1 file changed, 18 insertions(+), 16 deletions(-)
> >
> > diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
> > index 49fad6de0674..989165116278 100644
> > --- a/rust/kernel/task.rs
> > +++ b/rust/kernel/task.rs
> > @@ -103,7 +103,7 @@ macro_rules! current {
> >  unsafe impl Send for Task {}
> >
> >  // SAFETY: It's OK to access `Task` through shared references from oth=
er threads because we're
> > -// either accessing properties that don't change (e.g., `pid`, `group_=
leader`) or that are properly
> > +// either accessing properties that don't change or that are properly
> >  // synchronised by C code (e.g., `signal_pending`).
> >  unsafe impl Sync for Task {}
> >
> > @@ -204,23 +204,13 @@ pub fn as_ptr(&self) -> *mut bindings::task_struc=
t {
> >          self.0.get()
> >      }
> >
> > -    /// Returns the group leader of the given task.
> > -    pub fn group_leader(&self) -> &Task {
> > -        // SAFETY: The group leader of a task never changes after init=
ialization, so reading this
> > -        // field is not a data race.
> > -        let ptr =3D unsafe { *ptr::addr_of!((*self.as_ptr()).group_lea=
der) };
> > -
> > -        // SAFETY: The lifetime of the returned task reference is tied=
 to the lifetime of `self`,
> > -        // and given that a task has a reference to its group leader, =
we know it must be valid for
> > -        // the lifetime of the returned task reference.
> > -        unsafe { &*ptr.cast() }
> > -    }
> > -
> >      /// Returns the PID of the given task.
> >      pub fn pid(&self) -> Pid {
> > -        // SAFETY: The pid of a task never changes after initializatio=
n, so reading this field is
> > -        // not a data race.
> > -        unsafe { *ptr::addr_of!((*self.as_ptr()).pid) }
> > +        // SAFETY: The pid of a task almost never changes after initia=
lization,
> > +        // so reading this field is usually not a data race.
> > +        // The exception is a race where the task is part of a process=
 that
> > +        // goes through execve(), see exchange_tids().
> > +        unsafe { ptr::addr_of!((*self.as_ptr()).pid).read_volatile() }
>
> Please use
>
>     Atomic::from_ptr(&raw const (*self.as_ptr()).pid).load(Relaxed)
>
> here. Or maybe you want to use `atomic_load()` [1]? We should avoid
> using arbitrary `read_volatile()`.

Ack, I'll change it to a relaxed load.

> [1]: https://lore.kernel.org/rust-for-linux/20260120115207.55318-3-boqun.=
feng@gmail.com/
