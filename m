Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1DA334376
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Sep 2025 15:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828448; cv=none; b=Z35MZj8PmFpY7NmhPXkGEcZWJ1Kt8unh3Iv0I46opapNiuA0vj2oAweFsqMnJvz0D72nrAhee68U5zBY9lyXvRh8UsjebqgXc2OFAdGkk3U//qFxH9q034A2Ol7dnVuMEw2NKArzWoLKnzFdnUi5KGm949/cP9lEkWcwX09jZD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828448; c=relaxed/simple;
	bh=Phpjjzej2saJsjDk6+uFFR4cadxcNKgzK4r1gcCZxMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sT5uc4DwIeJDA/NmPmdzIhx+rEFWjbHHzfnvD+fsG12aDS20knV1lQQtPhmrrmwvn26+dgb2xY3RzXnd2rTkLJJ6rTPckAqDBIIp7xo3uW+aPDsIc3/YYtSPnTzd+11Md8twcxCA6clfyzY1wru8GwDa/wdDGmwnoX37f8+k5xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=bjzMHiUo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="bjzMHiUo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24adcc94338so5201935ad.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Sep 2025 08:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1756828445; x=1757433245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glkrp5zHlTMARGO+3DOaDAvVK3fEgiovpkxY+a+HGYU=;
        b=bjzMHiUobd/8Zu1CFso7fr/PJZaMxxifNPoqM2h9Cmp3JwGf5D1g5+Ud5ht5moxSY+
         R5YzoG0S/M9ymqYshdEbnrbyTJsIsITccUk3DKBi16FUfRTGbdY4lQEZjm4nwYplkNe8
         Kyx+5KrjqdUmr5LVznJ+mZ3l4dy07pHfFWwQBcLHPKvQR7zv7HDtqufaC8jxs/UtsUBE
         erDv+P+CXEPxkzD2nulWV4z+EUHlFI03kIWx9Xv2NngeK8O05ZXY7+2Fm3Lj3EyhFp4N
         U8XAVXT7Zb9Cl6D1lY3m5E1McAYSUJuZocyGXic8P/aO/xioLTphvTdKtQXdMt92pXPm
         udTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828445; x=1757433245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glkrp5zHlTMARGO+3DOaDAvVK3fEgiovpkxY+a+HGYU=;
        b=MdQFCXHac9YpEyI6qzN8nCwuf5ELZKg1w+XE3opcf1H7WkYvdfyJYSgKvjOt+mDGhJ
         amb/OCUgN/p9E6D+RjJjvDukzTQSKQrnM+r6H6YFQm6sbxnjhhWa3qo1N2qsn1eMYRSu
         ZQBd4UFZAvl72DaXE9AFWeaMu1DDMxcgCSaUPZ56elkLxVwtbTGoItYIfl57Cnw3a7rv
         Xph4GNAak+G1hrMBsukyK3QjRVgj1yDItTpA/Swa+hrwv2I32pkHTR5zBZQFArm4pMS2
         R2s9eQh+Nv6UkLbx/A8+D5cujCh9dM/+QNd+GnITdSQfRy+Z+CMtWxHfqcQNd7RZoDXn
         +/5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXbnOg9fTGYc0Vs/P0Jf33KzeDn4GLsLfF0qpK1uMRY5MYfVRLN4GqIXVYJTrXvt20qzweZNQM25tmARRFUxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJdzhPwguS/jMrc1/Roei/ArL5cak+S68QFnJZM1aRcXW98FZ
	/tml0Jhm8et1q8ZWyXrFFA+TyTct3ypeSE+nwcOvD6TXSKwvqts8+5sGFblHjrgnA4bmI6EQbLu
	23SQr1nCYllH8gOWfFgDPv3/P3zGn4NQkNZYXrtZMVg==
X-Gm-Gg: ASbGnctyZn5PjzvxqanGgSPAWAqoIstcQDTtlBK0ReKmT/D2hwzrgceZBiADlafjaRQ
	Z+dw5+yqDqkC3llGUcuOUhR6oATJ5oCDRR513Xt4aicInKeDrYfWGl/i4r9K/dfH/ixMLUdjGui
	QCmQ5etlYhH30No3fs7Jgz+wGd6EsHqrlumpmYM+GcXXIIWRBJx2CpSxIZW2RTieA6EAhMqSYOs
	5T+2/7qqD0fDFYChvA6xjs=
X-Google-Smtp-Source: AGHT+IGo7hz0BxRWV5G1YH7hZvvr/9XeTFH7fJAa8NDYd3gLSzScxGKzPO2jMdun1EGK4NyLE1jjAIqh2/FqtYN8eps=
X-Received: by 2002:a17:902:db0e:b0:24a:fbe2:b88e with SMTP id
 d9443c01a7336-24afbe2bb85mr35011445ad.1.1756828444780; Tue, 02 Sep 2025
 08:54:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250822125555.8620-1-sidong.yang@furiosa.ai> <20250822125555.8620-5-sidong.yang@furiosa.ai>
 <CADUfDZoDvAp1yqFyB_SQiynqQfOQPkO_mnQ_pWAXpZJESecFFw@mail.gmail.com> <aLbSi5-a67i78BHl@sidongui-MacBookPro.local>
In-Reply-To: <aLbSi5-a67i78BHl@sidongui-MacBookPro.local>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Tue, 2 Sep 2025 08:53:53 -0700
X-Gm-Features: Ac12FXyB8pbvzfSRoQFUjtPUW2OqS8AXMTk_z5NcDibqacuoXAPawZgi6AKUSj8
Message-ID: <CADUfDZqwgT_dpObEcnhSymk=VX7c_=13yFByyxM6Wf-W3+Wg-w@mail.gmail.com>
Subject: Re: [RFC PATCH v3 4/5] rust: miscdevice: Add `uring_cmd` support
To: Sidong Yang <sidong.yang@furiosa.ai>
Cc: Jens Axboe <axboe@kernel.dk>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, io-uring@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 4:18=E2=80=AFAM Sidong Yang <sidong.yang@furiosa.ai>=
 wrote:
>
> On Mon, Sep 01, 2025 at 06:12:44PM -0700, Caleb Sander Mateos wrote:
> > On Fri, Aug 22, 2025 at 5:56=E2=80=AFAM Sidong Yang <sidong.yang@furios=
a.ai> wrote:
> > >
> > > This patch introduces support for `uring_cmd` to the `miscdevice`
> > > framework. This is achieved by adding a new `uring_cmd` method to the
> > > `MiscDevice` trait and wiring it up to the corresponding
> > > `file_operations` entry.
> > >
> > > The `uring_cmd` function provides a mechanism for `io_uring` to issue
> > > commands to a device driver.
> > >
> > > The new `uring_cmd` method takes the device, an `IoUringCmd` object,
> > > and issue flags as arguments. The `IoUringCmd` object is a safe Rust
> > > abstraction around the raw `io_uring_cmd` struct.
> > >
> > > To enable `uring_cmd` for a specific misc device, the `HAS_URING_CMD`
> > > constant must be set to `true` in the `MiscDevice` implementation.
> > >
> > > Signed-off-by: Sidong Yang <sidong.yang@furiosa.ai>
> > > ---
> > >  rust/kernel/miscdevice.rs | 53 +++++++++++++++++++++++++++++++++++++=
+-
> > >  1 file changed, 52 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/rust/kernel/miscdevice.rs b/rust/kernel/miscdevice.rs
> > > index 6373fe183b27..fcef579218ba 100644
> > > --- a/rust/kernel/miscdevice.rs
> > > +++ b/rust/kernel/miscdevice.rs
> > > @@ -11,9 +11,10 @@
> > >  use crate::{
> > >      bindings,
> > >      device::Device,
> > > -    error::{to_result, Error, Result, VTABLE_DEFAULT_ERROR},
> > > +    error::{from_result, to_result, Error, Result, VTABLE_DEFAULT_ER=
ROR},
> > >      ffi::{c_int, c_long, c_uint, c_ulong},
> > >      fs::File,
> > > +    io_uring::IoUringCmd,
> > >      mm::virt::VmaNew,
> > >      prelude::*,
> > >      seq_file::SeqFile,
> > > @@ -180,6 +181,21 @@ fn show_fdinfo(
> > >      ) {
> > >          build_error!(VTABLE_DEFAULT_ERROR)
> > >      }
> > > +
> > > +    /// Handler for uring_cmd.
> > > +    ///
> > > +    /// This function is invoked when userspace process submits an u=
ring_cmd op
> > > +    /// on io-uring submission queue. The `device` is borrowed insta=
nce defined
> > > +    /// by `Ptr`. The `io_uring_cmd` would be used for get arguments=
 cmd_op, sqe,
> > > +    /// cmd_data. The `issue_flags` is the flags includes options fo=
r uring_cmd.
> > > +    /// The options are listed in `kernel::io_uring::cmd_flags`.
> > > +    fn uring_cmd(
> > > +        _device: <Self::Ptr as ForeignOwnable>::Borrowed<'_>,
> > > +        _io_uring_cmd: Pin<&mut IoUringCmd>,
> >
> > Passing the IoUringCmd by reference doesn't allow the uring_cmd()
> > implementation to store it beyond the function return. That precludes
> > any asynchronous uring_cmd() implementation, which is kind of the
> > whole point of uring_cmd. I think uring_cmd() needs to transfer
> > ownership of the IoUringCmd so the implementation can complete it
> > asynchronously.
>
> I didn't know that I can take IoUringCmd ownership and calling done().
> In C implementation, is it safe to call `io_uring_cmd_done()` in any cont=
ext?

It depends on the issue_flags. If IO_URING_F_UNLOCKED is set, it can
be called from any context. But if IO_URING_F_UNLOCKED is not set, it
needs to be called with the io_ring_ctx's uring_lock held. That
generally requires it to either be called during uring_cmd() or from a
task work callback. In either case, issue_flags needs to match what
was passed to uring_cmd() or the task work callback.
You can look at NVMe passthru as an example. It calls
io_uring_cmd_done() from nvme_uring_task_cb(), which is a task work
callback scheduled with io_uring_cmd_do_in_task_lazy() in
nvme_uring_cmd_end_io().

Best,
Caleb
