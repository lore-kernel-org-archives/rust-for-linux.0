Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B31F3126DC
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 15:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827679; cv=none; b=lvncoNeWMl5TBNXhm2bGVrSbjjNnRN8hWx3a+77Kg42xb7qOhWmECqGl5lpXFJdQTSDunVTG9VOJx9CLxVUvZv0TRBynEzetUA719/HewB14G5V+gSzYZv9pQVs7Zg2vG39WTWy8OgzYavWZNukoPD6EAl8t5OFR8HyTvK4rvS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827679; c=relaxed/simple;
	bh=QluTfD9wMAugqsvsTpkivo+YO7g0ZwIGiUNIGQ7P5H4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vmwcxce+HtEaPar2AlGwOGG3M4qjrylKHs68JwxoCWJQV3kNmAGA/VtBfx7M3BOmAWOvZ8CZdxXfYYQJK91oH+wdt8Jj3g5zSi8oJMNfcnJlBsGpxQRaipIwuTaHpWlo0HbRtoP5p9RcpoavNJ0oM67q9DwapgKpilTY2tzyCaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=ZAztdo34; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="ZAztdo34"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b4f8050e031so55909a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 08:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1756827676; x=1757432476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkCxo0/t5wwsjv9mXSTQkXhX9pYSV5znV2uTfXDIZSc=;
        b=ZAztdo34vaVm2Adk7BY6Ojsd+6HR9AwRQAxXFDGRxh+AKp1MRiPXHIAoL8wmHOdm+X
         mOYP7kAyWKEiUKQXhxoXUJu4mdoetRxTbHSQfCV+VZVA6KpPaRCaWlVncPt3wJWw/Kd+
         6GEG5+OZkl3w7e9GfmDS5MZUTWNnNLNjbckaqv7qoNuFYNYqLdQ2TRUVTAGZBHYXSLgP
         YpO+mkxgtvqAzHoe3IXST53EXWElAT0HrR+e6+1g4W7eLrNESQQ1mus5G56CcB/gkXK1
         5CVe1oVoSq20p25EGPrYOG8ZfKZhDmpuMnUIcy8Wof/1Vqefuvdnv7MY67xuTDwoPuwk
         bELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827676; x=1757432476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkCxo0/t5wwsjv9mXSTQkXhX9pYSV5znV2uTfXDIZSc=;
        b=pKVEpZw+rATy6NJUqnJgsOoGID0sk6SnOW83DVayxuV0krQjmGN7jrpKe22wg+sl3Y
         ghCEaSH+E6rZO0iXKeMU4YwNzPWDL6ubHMBzx2nBXWIvMG4MExWf5fJzee/pV741BLJ8
         UnAf7eDCs/DOBSlux48bokFS6UA/M6WXY1dLgSv2jJyTExG96rKJPDjauv9dyEkzr4/o
         M1EiCJmX42LrFZgqpEi6Gcm0tgwV8S4Zwlcqp0vEatfpnnOomgHuWzV0DoDDHloAOkpE
         YB6k1v5oZUPgajWgdzSsfGh2/gPhLl4LH+58aWx59FdlGij3iqipBqxfRee3rZ0lxT2Q
         nFhw==
X-Forwarded-Encrypted: i=1; AJvYcCVpV9q77VEyf5bCYzXwQIkMtgIgKc1H1hj0knZZyw/xgACUlBJsX0Dimrcm7ncnwaP0/OqdwmV3/9zXC9V9LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz5Ww+jmF/QVnVIOERA5utltzLKG7J7en8/t3XqrsHAFaCr0Ro
	lhq4T2XHcogr1qK8vMg3jNeemBADNZ9N+H/kBrdDN8AeeDqlUtUdoiIMx/Gh4RCtWQL4NR3Sahu
	Ct4HsYXFOPRFbIJjY3gaiPClxd487Sh/w8MfgEbD1+Q==
X-Gm-Gg: ASbGncty1nY9/4+Sq3Gmf4Hiu7TGqHhy0yPVoCeWmYgKgZxse5/69m5p9AcTgg2EJUm
	UvtKa/Upuyeo9WyvJNMiaA+s2qDs9MKpeaExIPQoerj/bpbbWVM9mrio4yerEor54oujM2ArXLl
	sYURCHlXzc1nji/1bzHLX+o4bCcJy2MKwwE5F3vxwb0SNZ6W6+DzB3zz8lme74m3fARLTBieyl8
	HP0jO2P4juLlPKLHME85CY=
X-Google-Smtp-Source: AGHT+IEt0Cgnt/x16pjdoNl5ndQFi4EG9t4bTYtasq97JuCpHWfVOAXDROsI7AGKgxCf/el8KOmoQylAOu/woif1vIg=
X-Received: by 2002:a17:90b:1646:b0:30a:80bc:ad4 with SMTP id
 98e67ed59e1d1-327e5f553a9mr10246056a91.0.1756827676039; Tue, 02 Sep 2025
 08:41:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822125555.8620-1-sidong.yang@furiosa.ai> <20250822125555.8620-4-sidong.yang@furiosa.ai>
 <CADUfDZqBZStBW2ef4Dav4AO7BZMF9O9tzmbzSJnSvsSRP7r4HA@mail.gmail.com> <aLbQ0TPUegON738P@sidongui-MacBookPro.local>
In-Reply-To: <aLbQ0TPUegON738P@sidongui-MacBookPro.local>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 2 Sep 2025 08:41:04 -0700
X-Gm-Features: Ac12FXyZQMDk-BJ6owCZSRzglAC-QK23YwbiWA14rZMXiZdXH0ipRaMvz8rkcDg
Message-ID: <CADUfDZpkDEw73mjyD8uRh61emz+5VzDk3aJiwwmcVuwY_Bq8=g@mail.gmail.com>
Subject: Re: [RFC PATCH v3 3/5] rust: io_uring: introduce rust abstraction for
 io-uring cmd
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 4:11=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.ai>=
 wrote:
>
> On Mon, Sep 01, 2025 at 06:11:01PM -0700, Caleb Sander Mateos wrote:
> > On Fri, Aug 22, 2025 at 5:56=E2=80=AFAM Sidong Yang <sidong.yang@furios=
a.ai> wrote:
> > >
> > > Implment the io-uring abstractions needed for miscdevicecs and other
> >
> > typo: "Implement"
>
> Thanks.
> >
> > > char devices that have io-uring command interface.
> > >
> > > * `io_uring::IoUringCmd` : Rust abstraction for `io_uring_cmd` which
> > >   will be used as arg for `MiscDevice::uring_cmd()`. And driver can g=
et
> > >   `cmd_op` sent from userspace. Also it has `flags` which includes op=
tion
> > >   that is reissued.
> > >
> > > * `io_uring::IoUringSqe` : Rust abstraction for `io_uring_sqe` which
> > >   could be get from `IoUringCmd::sqe()` and driver could get `cmd_dat=
a`
> > >   from userspace. Also `IoUringSqe` has more data like opcode could b=
e used in
> > >   driver.
> > >
> > > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> > > ---
> > >  rust/kernel/io_uring.rs | 306 ++++++++++++++++++++++++++++++++++++++=
++
> > >  rust/kernel/lib.rs      |   1 +
> > >  2 files changed, 307 insertions(+)
> > >  create mode 100644 rust/kernel/io_uring.rs
> > >
> > > diff --git a/rust/kernel/io_uring.rs b/rust/kernel/io_uring.rs
> > > new file mode 100644
> > > index 000000000000..61e88bdf4e42
> > > --- /dev/null
> > > +++ b/rust/kernel/io_uring.rs
> > > @@ -0,0 +1,306 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +// SPDX-FileCopyrightText: (C) 2025 Furiosa AI
> > > +
> > > +//! Abstractions for io-uring.
> > > +//!
> > > +//! This module provides types for implements io-uring interface for=
 char device.
> > > +//!
> > > +//!
> > > +//! C headers: [`include/linux/io_uring/cmd.h`](srctree/include/linu=
x/io_uring/cmd.h) and
> > > +//! [`include/linux/io_uring/io_uring.h`](srctree/include/linux/io_u=
ring/io_uring.h)
> > > +
> > > +use core::{mem::MaybeUninit, pin::Pin};
> > > +
> > > +use crate::error::from_result;
> > > +use crate::transmute::{AsBytes, FromBytes};
> > > +use crate::{fs::File, types::Opaque};
> > > +
> > > +use crate::prelude::*;
> > > +
> > > +/// io-uring opcode
> > > +pub mod opcode {
> > > +    /// opcode for uring cmd
> > > +    pub const URING_CMD: u32 =3D bindings::io_uring_op_IORING_OP_URI=
NG_CMD;
> > > +}
> > > +
> > > +/// A Rust abstraction for the Linux kernel's `io_uring_cmd` structu=
re.
> > > +///
> > > +/// This structure is a safe, opaque wrapper around the raw C `io_ur=
ing_cmd`
> > > +/// binding from the Linux kernel. It represents a command structure=
 used
> > > +/// in io_uring operations within the kernel.
> > > +/// This type is used internally by the io_uring subsystem to manage
> > > +/// asynchronous I/O commands.
> > > +///
> > > +/// This type should not be constructed or manipulated directly by
> > > +/// kernel module developers.
> > > +///
> > > +/// # INVARIANT
> > > +/// - `self.inner` always points to a valid, live `bindings::io_urin=
g_cmd`.
> > > +#[repr(transparent)]
> > > +pub struct IoUringCmd {
> > > +    /// An opaque wrapper containing the actual `io_uring_cmd` data.
> > > +    inner: Opaque<bindings::io_uring_cmd>,
> > > +}
> > > +
> w> > +impl IoUringCmd {
> > > +    /// Returns the cmd_op with associated with the `io_uring_cmd`.
> > > +    #[inline]
> > > +    pub fn cmd_op(&self) -> u32 {
> > > +        // SAFETY: `self.inner` is guaranteed by the type invariant =
to point
> > > +        // to a live `io_uring_cmd`, so dereferencing is safe.
> > > +        unsafe { (*self.inner.get()).cmd_op }
> > > +    }
> > > +
> > > +    /// Returns the flags with associated with the `io_uring_cmd`.
> > > +    #[inline]
> > > +    pub fn flags(&self) -> u32 {
> > > +        // SAFETY: `self.inner` is guaranteed by the type invariant =
to point
> > > +        // to a live `io_uring_cmd`, so dereferencing is safe.
> > > +        unsafe { (*self.inner.get()).flags }
> > > +    }
> > > +
> > > +    /// Reads protocol data unit as `T` that impl `FromBytes` from u=
ring cmd
> > > +    ///
> > > +    /// Fails with [`EFAULT`] if size of `T` is bigger than pdu size=
.
> > > +    #[inline]
> > > +    pub fn read_pdu<T: FromBytes>(&self) -> Result<T> {
> > > +        // SAFETY: `self.inner` is guaranteed by the type invariant =
to point
> > > +        // to a live `io_uring_cmd`, so dereferencing is safe.
> > > +        let inner =3D unsafe { &mut *self.inner.get() };
> >
> > Why does this reference need to be mutable?
>
> It don't need to be mutable. This could be borrow without mutable.
> >
> > > +
> > > +        let len =3D size_of::<T>();
> > > +        if len > inner.pdu.len() {
> > > +            return Err(EFAULT);
> > > +        }
> > > +
> > > +        let mut out: MaybeUninit<T> =3D MaybeUninit::uninit();
> >
> > Why is the intermediate MaybeUninit necessary? Would
> > core::ptr::read_unaligned() not work?
>
> It's okay to use `read_unaligned`. It would be simpler than now. Thanks.
>
> >
> > > +        let ptr =3D &raw mut inner.pdu as *const c_void;
> > > +
> > > +        // SAFETY:
> > > +        // * The `ptr` is valid pointer from `self.inner` that is gu=
aranteed by type invariant.
> > > +        // * The `out` is valid pointer that points `T` which impls =
`FromBytes` and checked
> > > +        //   size of `T` is smaller than pdu size.
> > > +        unsafe {
> > > +            core::ptr::copy_nonoverlapping(ptr, out.as_mut_ptr().cas=
t::<c_void>(), len);
> > > +        }
> > > +
> > > +        // SAFETY: The read above has initialized all bytes in `out`=
, and since `T` implements
> > > +        // `FromBytes`, any bit-pattern is a valid value for this ty=
pe.
> > > +        Ok(unsafe { out.assume_init() })
> > > +    }
> > > +
> > > +    /// Writes the provided `value` to `pdu` in uring_cmd `self`
> > > +    ///
> > > +    /// Fails with [`EFAULT`] if size of `T` is bigger than pdu size=
.
> > > +    #[inline]
> > > +    pub fn write_pdu<T: AsBytes>(&mut self, value: &T) -> Result<()>=
 {
> > > +        // SAFETY: `self.inner` is guaranteed by the type invariant =
to point
> > > +        // to a live `io_uring_cmd`, so dereferencing is safe.
> > > +        let inner =3D unsafe { &mut *self.inner.get() };
> > > +
> > > +        let len =3D size_of::<T>();
> > > +        if len > inner.pdu.len() {
> > > +            return Err(EFAULT);
> > > +        }
> > > +
> > > +        let src =3D (value as *const T).cast::<c_void>();
> > > +        let dst =3D &raw mut inner.pdu as *mut c_void;
> > > +
> > > +        // SAFETY:
> > > +        // * The `src` is points valid memory that is guaranteed by =
`T` impls `AsBytes`
> > > +        // * The `dst` is valid. It's from `self.inner` that is guar=
anteed by type invariant.
> > > +        // * It's safe to copy because size of `T` is no more than l=
en of pdu.
> > > +        unsafe {
> > > +            core::ptr::copy_nonoverlapping(src, dst, len);
> > > +        }
> > > +
> > > +        Ok(())
> > > +    }
> > > +
> > > +    /// Constructs a new [`IoUringCmd`] from a raw `io_uring_cmd`
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// The caller must guarantee that:
> > > +    /// - `ptr` is non-null, properly aligned, and points to a valid
> > > +    ///   `bindings::io_uring_cmd`.
> > > +    /// - The pointed-to memory remains initialized and valid for th=
e entire
> > > +    ///   lifetime `'a` of the returned reference.
> > > +    /// - While the returned `Pin<&'a mut IoUringCmd>` is alive, the=
 underlying
> > > +    ///   object is **not moved** (pinning requirement).
> > > +    /// - **Aliasing rules:** the returned `&mut` has **exclusive** =
access to the same
> > > +    ///   object for its entire lifetime:
> > > +    ///   - No other `&mut` **or** `&` references to the same `io_ur=
ing_cmd` may be
> > > +    ///     alive at the same time.
> > > +    ///   - There must be no concurrent reads/writes through raw poi=
nters, FFI, or
> > > +    ///     other kernel paths to the same object during this lifeti=
me.
> > > +    ///   - If the object can be touched from other contexts (e.g. I=
RQ/another CPU),
> > > +    ///     the caller must provide synchronization to uphold this e=
xclusivity.
> > > +    /// - This function relies on `IoUringCmd` being `repr(transpare=
nt)` over
> > > +    ///   `bindings::io_uring_cmd` so the cast preserves layout.
> > > +    #[inline]
> > > +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::io_uring_cmd) -> =
Pin<&'a mut IoUringCmd> {
> > > +        // SAFETY:
> > > +        // * The caller guarantees that the pointer is not dangling =
and stays
> > > +        //   valid for the duration of 'a.
> > > +        // * The cast is okay because `IoUringCmd` is `repr(transpar=
ent)` and
> > > +        //   has the same memory layout as `bindings::io_uring_cmd`.
> > > +        // * The returned `Pin` ensures that the object cannot be mo=
ved, which
> > > +        //   is required because the kernel may hold pointers to thi=
s memory
> > > +        //   location and moving it would invalidate those pointers.
> > > +        unsafe { Pin::new_unchecked(&mut *ptr.cast()) }
> > > +    }
> > > +
> > > +    /// Returns the file that referenced by uring cmd self.
> > > +    #[inline]
> > > +    pub fn file(&self) -> &File {
> > > +        // SAFETY: `self.inner` is guaranteed by the type invariant =
to point
> > > +        // to a live `io_uring_cmd`, so dereferencing is safe.
> > > +        let file =3D unsafe { (*self.inner.get()).file };
> > > +
> > > +        // SAFETY:
> ?> > +        // * The `file` points valid file.
> > > +        // * refcount is positive after submission queue entry issue=
d.
> > > +        // * There is no active fdget_pos region on the file on this=
 thread.
> > > +        unsafe { File::from_raw_file(file) }
> > > +    }
> > > +
> > > +    /// Returns an reference to the [`IoUringSqe`] associated with t=
his command.
> > > +    #[inline]
> > > +    pub fn sqe(&self) -> &IoUringSqe {
> > > +        // SAFETY: `self.inner` is guaranteed by the type invariant =
to point
> > > +        // to a live `io_uring_cmd`, so dereferencing is safe.
> > > +        let sqe =3D unsafe { (*self.inner.get()).sqe };
> > > +        // SAFETY: The call guarantees that the `sqe` points valid i=
o_uring_sqe.
> > > +        unsafe { IoUringSqe::from_raw(sqe) }
> > > +    }
> > > +
> > > +    /// Completes an this [`IoUringCmd`] request that was previously=
 queued.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// - This function must be called **only** for a command whose =
`uring_cmd`
> > > +    ///   handler previously returned **`-EIOCBQUEUED`** to io_uring=
.
> > > +    ///
> > > +    /// # Parameters
> > > +    ///
> > > +    /// - `ret`: Result to return to userspace.
> > > +    /// - `res2`: Extra for big completion queue entry `IORING_SETUP=
_CQE32`.
> > > +    /// - `issue_flags`: Flags associated with this request, typical=
ly the same
> > > +    ///   as those passed to the `uring_cmd` handler.
> > > +    #[inline]
> > > +    pub fn done(self: Pin<&mut IoUringCmd>, ret: Result<i32>, res2: =
u64, issue_flags: u32) {
> >
> > Since this takes the IoUringCmd by reference, it allows a single
> > io_uring_cmd to be completed multiple times, which would not be safe.
> > This method probably needs to take ownership of the IoUringCmd. Even
> > better would be to enforce at compile time that the number of times
> > IoUringCmd::done() is called matches the return value from
> > uring_cmd(): io_uring_cmd_done() may only be called if uring_cmd()
> > returns -EIOCBQUEUED; -EAGAIN will result in another call to
> > uring_cmd() and all other return values synchronously complete the
> > io_uring_cmd.
> >
> > It's also not safe for the caller to pass an arbitrary value for
> > issue_flags here; it needs to exactly match what was passed into
> > uring_cmd(). Maybe we could introduce a type that couples the
> > IoUringCmd and issue_flags passed to uring_cmd()?
>
> Agreed. We could introduce a new type like below
>
> pub struct IoUringCmd<'a> {
>     cmd: Pin<&'a mut IoUringCmdInner>,
>     issue_flags: IssueFlags,
> }

Yeah, that looks reasonable.

>
> Is `io_uring_cmd_done` should be called in iopoll callback? If so, it's
> better to make new type for iopoll and move this function to the type.

I'm not too familiar with IOPOLL. As far as I'm aware, only the NVMe
passthru uring_cmd() implementation supports it? It looks like commit
9ce6c9875f3e ("nvme: always punt polled uring_cmd end_io work to
task_work") removed the IOPOLL special case, so all NVMe passthru
completions go through nvme_uring_task_cb(), which calls
io_uring_cmd_done().

>
> >
> > > +        let ret =3D from_result(|| ret) as isize;
> > > +        // SAFETY: The call guarantees that `self.inner` is not dang=
ling and stays valid
> > > +        unsafe {
> > > +            bindings::io_uring_cmd_done(self.inner.get(), ret, res2,=
 issue_flags);
> > > +        }
> > > +    }
> > > +}
> > > +
> > > +/// A Rust abstraction for the Linux kernel's `io_uring_sqe` structu=
re.
> > > +///
> > > +/// This structure is a safe, opaque wrapper around the raw C [`io_u=
ring_sqe`](srctree/include/uapi/linux/io_uring.h)
> > > +/// binding from the Linux kernel. It represents a Submission Queue =
Entry
> > > +/// used in io_uring operations within the kernel.
> > > +///
> > > +/// # Type Safety
> > > +///
> > > +/// The `#[repr(transparent)]` attribute ensures that this wrapper h=
as
> > > +/// the same memory layout as the underlying `io_uring_sqe` structur=
e,
> > > +/// allowing it to be safely transmuted between the two representati=
ons.
> > > +///
> > > +/// # Fields
> > > +///
> > > +/// * `inner` - An opaque wrapper containing the actual `io_uring_sq=
e` data.
> > > +///             The `Opaque` type prevents direct access to the inte=
rnal
> > > +///             structure fields, ensuring memory safety and encapsu=
lation.
> > > +///
> > > +/// # Usage
> > > +///
> > > +/// This type represents a submission queue entry that describes an =
I/O
> > > +/// operation to be executed by the io_uring subsystem. It contains
> > > +/// information such as the operation type, file descriptor, buffer
> > > +/// pointers, and other operation-specific data.
> > > +///
> > > +/// Users can obtain this type from [`IoUringCmd::sqe()`] method, wh=
ich
> > > +/// extracts the submission queue entry associated with a command.
> > > +///
> > > +/// This type should not be constructed or manipulated directly by
> > > +/// kernel module developers.
> > > +///
> > > +/// # INVARIANT
> > > +/// - `self.inner` always points to a valid, live `bindings::io_urin=
g_sqe`.
> > > +#[repr(transparent)]
> > > +pub struct IoUringSqe {
> > > +    inner: Opaque<bindings::io_uring_sqe>,
> > > +}
> > > +
> > > +impl IoUringSqe {
> > > +    /// Reads and interprets the `cmd` field of an `bindings::io_uri=
ng_sqe` as a value of type `T`.
> > > +    ///
> > > +    /// # Safety & Invariants
> > > +    /// - Construction of `T` is delegated to `FromBytes`, which gua=
rantees that `T` has no
> > > +    ///   invalid bit patterns and can be safely reconstructed from =
raw bytes.
> > > +    /// - **Limitation:** This implementation does not support `IORI=
NG_SETUP_SQE128` (larger SQE entries).
> > > +    ///   Only the standard `io_uring_sqe` layout is handled here.
> > > +    ///
> > > +    /// # Errors
> > > +    /// * Returns `EINVAL` if the `self` does not hold a `opcode::UR=
ING_CMD`.
> > > +    /// * Returns `EFAULT` if the command buffer is smaller than the=
 requested type `T`.
> > > +    ///
> > > +    /// # Returns
> > > +    /// * On success, returns a `T` deserialized from the `cmd`.
> > > +    /// * On failure, returns an appropriate error as described abov=
e.
> > > +    pub fn cmd_data<T: FromBytes>(&self) -> Result<T> {
> > > +        // SAFETY: `self.inner` guaranteed by the type invariant to =
point
> > > +        // to a live `io_uring_sqe`, so dereferencing is safe.
> > > +        let sqe =3D unsafe { &*self.inner.get() };
> > > +
> > > +        if u32::from(sqe.opcode) !=3D opcode::URING_CMD {
> >
> > io_uring opcodes are u8 values. Can the URING_CMD constant be made a
> > u8 instead of converting sqe.opcode here?
> >
> > The read of the opcode should also be using read_volatile(), as it may
> > lie in the userspace-mapped SQE region, which could be concurrently
> > written by another userspace thread. That would probably be buggy
> > behavior on the userspace side, but it can cause undefined behavior on
> > the kernel side without a volatile read, as the compiler could choose
> > to re-read the value multiple times assuming it will get the same
> > value each time.
>
> Thanks, opcode should be read with read_volatile(). And I would introduce=
 new type
> for opcode.

I would rather remove the opcode check entirely. As mentioned below,
it's not required for safety, it doesn't actually ensure that
userspace has written to the cmd field, and it adds overhead in a hot
path.

Best,
Caleb

>
> >
> > > +            return Err(EINVAL);
> > > +        }
> > > +
> > > +        // SAFETY: Accessing the `sqe.cmd` union field is safe becau=
se we've
> > > +        // verified that `sqe.opcode =3D=3D IORING_OP_URING_CMD`, wh=
ich guarantees
> > > +        // that this union variant is initialized and valid.
> >
> > The opcode check isn't necessary. It doesn't provide any assurances
> > that this variant of the union is actually initialized, since a buggy
> > userspace process could set the opcode without initializing the cmd
> > field. It's always valid to access this memory since it's part of the
> > SQE region created at io_uring setup time. So I would drop the opcode
> > check.
> >
> > > +        let cmd =3D unsafe { sqe.__bindgen_anon_6.cmd.as_ref() };
> > > +        let cmd_len =3D size_of_val(&sqe.__bindgen_anon_6.bindgen_un=
ion_field);
> > > +
> > > +        if cmd_len < size_of::<T>() {
> > > +            return Err(EFAULT);
> > > +        }
> > > +
> > > +        let cmd_ptr =3D cmd.as_ptr() as *mut T;
> > > +
> > > +        // SAFETY: `cmd_ptr` is valid from `self.inner` which is gua=
ranteed by
> > > +        // type variant. And also it points to initialized `T` from =
userspace.
> > > +        let ret =3D unsafe { core::ptr::read_unaligned(cmd_ptr) };
> >
> > Similarly, needs to be volatile. The C uring_cmd() implementations use
> > READ_ONCE() to read the cmd field.
>
> Okay, This should use read_volatile too.
>
> Thanks,
> Sidong
> >
> > Best,
> > Caleb
> >
> > > +
> > > +        Ok(ret)
> > > +    }
> > > +
> > > +    /// Constructs a new `IoUringSqe` from a raw `io_uring_sqe`.
> > > +    ///
> > > +    /// # Safety
> > > +    ///
> > > +    /// The caller must guarantee that:
> > > +    /// - `ptr` is non-null, properly aligned, and points to a valid=
 initialized
> > > +    ///   `bindings::io_uring_sqe`.
> > > +    /// - The pointed-to memory remains valid (not freed or repurpos=
ed) for the
> > > +    ///   entire lifetime `'a` of the returned reference.
> > > +    /// - **Aliasing rules (for `&T`):** while the returned `&'a IoU=
ringSqe` is
> > > +    ///   alive, there must be **no mutable access** to the same obj=
ect through any
> > > +    ///   path (no `&mut`, no raw-pointer writes, no FFI/IRQ/other-C=
PU writers).
> > > +    ///   Multiple `&` is fine **only if all of them are read-only**=
 for the entire
> > > +    ///   overlapping lifetime.
> > > +    /// - This relies on `IoUringSqe` being `repr(transparent)` over
> > > +    ///   `bindings::io_uring_sqe`, so the cast preserves layout.
> > > +    #[inline]
> > > +    pub unsafe fn from_raw<'a>(ptr: *const bindings::io_uring_sqe) -=
> &'a IoUringSqe {
> > > +        // SAFETY: The caller guarantees that the pointer is not dan=
gling and stays valid for the
> > > +        // duration of 'a. The cast is okay because `IoUringSqe` is =
`repr(transparent)` and has the
> > > +        // same memory layout as `bindings::io_uring_sqe`.
> > > +        unsafe { &*ptr.cast() }
> > > +    }
> > > +}
> > > diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> > > index ed53169e795c..d38cf7137401 100644
> > > --- a/rust/kernel/lib.rs
> > > +++ b/rust/kernel/lib.rs
> > > @@ -91,6 +91,7 @@
> > >  pub mod fs;
> > >  pub mod init;
> > >  pub mod io;
> > > +pub mod io_uring;
> > >  pub mod ioctl;
> > >  pub mod jump_label;
> > >  #[cfg(CONFIG_KUNIT)]
> > > --
> > > 2.43.0
> > >
