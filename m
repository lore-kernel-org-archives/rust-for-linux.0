Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02BB1DF990
	for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 19:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753038643; cv=none; b=g5C7+/vlS4jA1+xgO/USHs+8RKVfzzY1yOHy16UXXYGosUNaVJfS2VZwcpKsmleQqqXZcJc3HtXV5yLa/mGixXL6Y8RIElGg3vtwu5HLFVDYrPUB1KgVFGV1jYUI+ydISgDlurcHzRnXtNHgDFN8Q5EfmJYLRKFJlCiOJ6qScDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753038643; c=relaxed/simple;
	bh=JOvx3nh9mFDiLNBPYVwlUAlSvRSi4qYNxWKVj/fNYEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nt80yiVXKVMj/59Bi/K7LZT0z2D0kHMUdJlfaaQQxo3grs+ykym9ZH7BibDLjw4sA8kLP5edocQ9AdgjhCwOyAL1Sx+sl2kbFMkp76MPNWFgD+Y6o4MxgflTjBlEeC80Jrq4oq0r/dwv40r0z22fwTGCmT8kUe+gzlg/fkB8DGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=HBBtFakw; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="HBBtFakw"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-312a806f002so709749a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 20 Jul 2025 12:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1753038640; x=1753643440; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PmJl5FG+nYbKChQjlQ85TAcYbUyzcNej5BFeiW0cAQ8=;
        b=HBBtFakwCzbl8SkKbpbRNLwgq4+fVQ9IPkdHh5pqVoKFohlKXI1yvePPt6HY+JGKeL
         G6J/v7AlncDzbat6n8mbzuq2Cc5qXJevASZWCJkawwNljFBuY3Gdf36VXevVi9lyVAYP
         uss+fgw9Amyzh6k+q6h4p1vVpXjv+hkQs4Tl4JjK6UWmZFZPUsr89GGOFnOiUxrmPebZ
         PsJiDBBJSUJymrLYX2LXLtd+48RzN275SIZu6HocREPeuwUgMbVfTXh8lfWCHP7n/pfP
         jYIHwfV84j2dy7oa6fNN8YsMp8rO9fSt3sqdusMwqxkAFKDZ+uCvZWl5nhhNZMaxnEdp
         cb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753038640; x=1753643440;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PmJl5FG+nYbKChQjlQ85TAcYbUyzcNej5BFeiW0cAQ8=;
        b=nLG1W4vCk+hAGuz309dBcLdw+c/v3fWA8TxDI7XT0Oc3oSq+jATSg8w7nXOcGQVibz
         SxGpI0qa2T8vr93ZrNARgDi6dX5Oqjw6KyzVvBp+jGeffTWWTmQqJVI0S+vMV751BHDt
         M15CLlCTCZGdMROJarsJC4Po8rEVDxLO6p9M5Kebf/cnA5LNjjk6BU8I9L7xhaUlegHQ
         ny+lhVWX665JvB+fjHjoOoH0VVmlqux/Bw9strc5r9PjnbIFLeIbY4USOvLRPdfcVuag
         6tjRo8E26NE/BGHQUaAh2LnqxrsPdTXMpm7vwtc0xnA9BnhqBiHolCRxsUXX9wrSQTJI
         X2ig==
X-Forwarded-Encrypted: i=1; AJvYcCXcv1pFHnfGsReSXRX6fhqzp7tVay1CqdWCZnlUsASXrEIec3Tvz3kNE/+t7irYwAwRq4OZLI7DlKJm62KKCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXcPSdtZgvA/JBjrxQUj35F74NygNfUIoWgCA3YBqIyoVNz6sm
	EIw0zQWQ8vvwAA5NStlNfecYwJ0uXM1wE3eo5HA3MqXXAVHXqPG3biwAqmZW0nJOBWhCHS1PkeM
	+QImnKS7VtKMKjj4aX/ILj+QVrsVeGIISeZMRjTWOyg==
X-Gm-Gg: ASbGncv2LIzSciGiyP76nRSVV1QOQuIBn0hde+t7bq/zb8b1vX6iVEyLoSWMw+xPtbc
	arcdYk81oJQnAkPTItaN+BRcE0ae6xVG8vpEekGaqvN4ySt1dffFpypN/K5fVF4IHdQ3rs5NsfR
	U3uJlp5BN+QA+zlwx41eMW+J/1dge2K3Pl/qo4elL0JG2CZGM9EZMEF6R8NTaRXB/g4Xhn2c44P
	1Dxgg==
X-Google-Smtp-Source: AGHT+IGOGQVTZCwO/q58veRX4aZbzscVmWPDj+vfdXysc1G6WzI8O5zaqzuKd24XlOjO18sEzec0XfqkiPOIck3ILc8=
X-Received: by 2002:a17:90b:5483:b0:311:e9a6:332e with SMTP id
 98e67ed59e1d1-31c9e60a04dmr11530858a91.0.1753038639935; Sun, 20 Jul 2025
 12:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250719143358.22363-1-sidong.yang@furiosa.ai> <20250719143358.22363-3-sidong.yang@furiosa.ai>
In-Reply-To: <20250719143358.22363-3-sidong.yang@furiosa.ai>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Sun, 20 Jul 2025 15:10:28 -0400
X-Gm-Features: Ac12FXyeTtvN7WKo8iZgnjOkCeidkzCzy-MFx0hny4yYfEzWm8YJLSVMr542AjI
Message-ID: <CADUfDZoBrnDpnTOxiDq6pBkctJ3NDJq7Wcqm2pUu_ooqMy8yyw@mail.gmail.com>
Subject: Re: [PATCH 2/4] rust: io_uring: introduce rust abstraction for
 io-uring cmd
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jens Axboe <axboe@kernel.dk>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 19, 2025 at 10:34=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.a=
i> wrote:
>
> This patch introduces rust abstraction for io-uring sqe, cmd. IoUringSqe
> abstracts io_uring_sqe and it has cmd_data(). and IoUringCmd is
> abstraction for io_uring_cmd. From this, user can get cmd_op, flags,
> pdu and also sqe.
>
> Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> ---
>  rust/kernel/io_uring.rs | 114 ++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs      |   1 +
>  2 files changed, 115 insertions(+)
>  create mode 100644 rust/kernel/io_uring.rs
>
> diff --git a/rust/kernel/io_uring.rs b/rust/kernel/io_uring.rs
> new file mode 100644
> index 000000000000..7843effbedb4
> --- /dev/null
> +++ b/rust/kernel/io_uring.rs
> @@ -0,0 +1,114 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2025 Furiosa AI.
> +
> +//! Files and file descriptors.
> +//!
> +//! C headers: [`include/linux/io_uring/cmd.h`](srctree/include/linux/io=
_uring/cmd.h) and
> +//! [`include/linux/file.h`](srctree/include/linux/file.h)
> +
> +use core::mem::MaybeUninit;
> +
> +use crate::{fs::File, types::Opaque};
> +
> +pub mod flags {
> +    pub const COMPLETE_DEFER: i32 =3D bindings::io_uring_cmd_flags_IO_UR=
ING_F_COMPLETE_DEFER;
> +    pub const UNLOCKED: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_=
UNLOCKED;
> +
> +    pub const MULTISHOT: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F=
_MULTISHOT;
> +    pub const IOWQ: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_IOWQ=
;
> +    pub const NONBLOCK: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_=
NONBLOCK;
> +
> +    pub const SQE128: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_SQ=
E128;
> +    pub const CQE32: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_CQE=
32;
> +    pub const IOPOLL: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_IO=
POLL;
> +
> +    pub const CANCEL: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_CA=
NCEL;
> +    pub const COMPAT: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F_CO=
MPAT;
> +    pub const TASK_DEAD: i32 =3D bindings::io_uring_cmd_flags_IO_URING_F=
_TASK_DEAD;
> +}
> +
> +#[repr(transparent)]
> +pub struct IoUringCmd {
> +    inner: Opaque<bindings::io_uring_cmd>,
> +}
> +
> +impl IoUringCmd {
> +    /// Returns the cmd_op with associated with the io_uring_cmd.
> +    #[inline]
> +    pub fn cmd_op(&self) -> u32 {
> +        // SAFETY: The call guarantees that the pointer is not dangling =
and stays valid
> +        unsafe { (*self.inner.get()).cmd_op }
> +    }
> +
> +    /// Returns the flags with associated with the io_uring_cmd.
> +    #[inline]
> +    pub fn flags(&self) -> u32 {
> +        // SAFETY: The call guarantees that the pointer is not dangling =
and stays valid
> +        unsafe { (*self.inner.get()).flags }
> +    }
> +
> +    /// Returns the ref pdu for free use.
> +    #[inline]
> +    pub fn pdu(&mut self) -> MaybeUninit<&mut [u8; 32]> {

Should be &mut MaybeUninit, right? It's the bytes that may be
uninitialized, not the reference.

> +        // SAFETY: The call guarantees that the pointer is not dangling =
and stays valid
> +        unsafe { MaybeUninit::new(&mut (*self.inner.get()).pdu) }
> +    }
> +
> +    /// Constructs a new `struct io_uring_cmd` wrapper from a file descr=
iptor.

Why "from a file descriptor"?

Also, missing a comment documenting the safety preconditions?

> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *const bindings::io_uring_cmd) -> &'=
a IoUringCmd {

Could take NonNull instead of a raw pointer.

> +        // SAFETY: The caller guarantees that the pointer is not danglin=
g and stays valid for the
> +        // duration of 'a. The cast is okay because `File` is `repr(tran=
sparent)`.

"File" -> "IoUringCmd"?

> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    // Returns the file that referenced by uring cmd self.

I had a hard time parsing this comment. How about "Returns a reference
to the uring cmd's file object"?

> +    #[inline]
> +    pub fn file<'a>(&'a self) -> &'a File {

Could elide the lifetime.

> +        // SAFETY: The call guarantees that the pointer is not dangling =
and stays valid
> +        let file =3D unsafe { (*self.inner.get()).file };
> +        unsafe { File::from_raw_file(file) }

Missing a SAFETY comment for File::from_raw_file()? I would expect
something about io_uring_cmd's file field storing a non-null pointer
to a struct file on which a reference is held for the duration of the
uring cmd.

> +    }
> +
> +    // Returns the sqe  that referenced by uring cmd self.

"Returns a reference to the uring cmd's SQE"?

> +    #[inline]
> +    pub fn sqe(&self) -> &IoUringSqe {
> +        // SAFETY: The call guarantees that the pointer is not dangling =
and stays valid
> +        let ptr =3D unsafe { (*self.inner.get()).sqe };

"ptr" isn't very descriptive. How about "sqe"?

> +        unsafe { IoUringSqe::from_raw(ptr) }

Similar, missing SAFETY comment for IoUringSqe::from_raw()?

> +    }
> +
> +    // Called by consumers of io_uring_cmd, if they originally returned =
-EIOCBQUEUED upon receiving the command
> +    #[inline]
> +    pub fn done(self, ret: isize, res2: u64, issue_flags: u32) {

I don't think it's safe to move io_uring_cmd. io_uring_cmd_done(), for
example, calls cmd_to_io_kiocb() to turn struct io_uring_cmd *ioucmd
into struct io_kiocb *req via a pointer cast. And struct io_kiocb's
definitely need to be pinned in memory. For example,
io_req_normal_work_add() inserts the struct io_kiocb into a linked
list. Probably some sort of pinning is necessary for IoUringCmd.

> +        // SAFETY: The call guarantees that the pointer is not dangling =
and stays valid
> +        unsafe {
> +            bindings::io_uring_cmd_done(self.inner.get(), ret, res2, iss=
ue_flags);
> +        }
> +    }
> +}
> +
> +#[repr(transparent)]
> +pub struct IoUringSqe {
> +    inner: Opaque<bindings::io_uring_sqe>,
> +}
> +
> +impl<'a> IoUringSqe {
> +    pub fn cmd_data(&'a self) -> &'a [Opaque<u8>] {
> +        // SAFETY: The call guarantees that the pointer is not dangling =
and stays valid
> +        unsafe {
> +            let cmd =3D (*self.inner.get()).__bindgen_anon_6.cmd.as_ref(=
);
> +            core::slice::from_raw_parts(cmd.as_ptr() as *const Opaque<u8=
>, 8)

Why 8? Should be 16 bytes for a 64-byte SQE and 80 bytes for a
128-byte SQE, right?

> +        }
> +    }
> +
> +    #[inline]
> +    pub unsafe fn from_raw(ptr: *const bindings::io_uring_sqe) -> &'a Io=
UringSqe {

Take NonNull here too?

> +        // SAFETY: The caller guarantees that the pointer is not danglin=
g and stays valid for the
> +        // duration of 'a. The cast is okay because `File` is `repr(tran=
sparent)`.
> +        //
> +        // INVARIANT: The caller guarantees that there are no problemati=
c `fdget_pos` calls.

Why "File" and "fdget_pos"?

Best,
Caleb

> +        unsafe { &*ptr.cast() }
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 6b4774b2b1c3..fb310e78d51d 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -80,6 +80,7 @@
>  pub mod fs;
>  pub mod init;
>  pub mod io;
> +pub mod io_uring;
>  pub mod ioctl;
>  pub mod jump_label;
>  #[cfg(CONFIG_KUNIT)]
> --
> 2.43.0
>
>
