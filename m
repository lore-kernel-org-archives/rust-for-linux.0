Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129872E3706
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 10:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754908885; cv=none; b=MkCfh+I8uXfsemmNIRG1cAHTuUUDAxjRMhd5TaSzdVNsFlw1UopDE0ZvkuDFvH2YbLsm1ePdeRjL9oE0hNbPexI+EVeOm+YkjBg/8KPHLD4EXXQ6ce8uv/CUDc+BKowTBSIMwq3FOiHkou9uwx4Y7QdPU769KWHIMoNed+LGIdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754908885; c=relaxed/simple;
	bh=iMNWeegK23RBYSCBVALilBDSPcbYBj/GWmMUNg2MkKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyMna1kdaBsTuvpzlG/E4d+PctiFOOzCGphisvWFQHLasZ5fwZmeNgFCUrvLowUSgpxeszBQua3h7J7uo6ITYt29VGEsJLszAeAWR8pLlkLZ7wWj6+v0mrh9tYKID3SG5L5yeps7E+0o25KBmP9uAzPtJ9SMmvMrv8pCrXOfLJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eYHaGvNq; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eYHaGvNq"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b7920354f9so3482828f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Aug 2025 03:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754908882; x=1755513682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nimGoAU42lqaRFxUej+qmdtsX3Dn8aFnhBpdHY1P9A=;
        b=eYHaGvNqQ/n7IYBlfgk95Gty1yHat50kzuVqzx/tuf09/k0nw3CenlRx5+AroSiYJ+
         NMvKP3aeeuPxeKRtlnxE0ribDf8lXXDyqvwFyreAOB8763aGtZJhxKGCt8K5XEvqt/tJ
         zSWhvUurL9yhAxSyBZW6mW2KVqCz9q3UTnk4YSZNeRxZKDLMnijR7kNeihiCaqOFPkQT
         rn255OjAJMp5iqIsiGdZqVzYBnptjDUrPocJVKqSaj+aDcNEnZGm82/LpU/Ad+7Ut2H3
         Yq8vBQP6tn6P4GiMoj2AWSTXoReK572cTpwjBkJ3T60mbjvCER01ONdOhbXTuuixVp/S
         BWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754908882; x=1755513682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7nimGoAU42lqaRFxUej+qmdtsX3Dn8aFnhBpdHY1P9A=;
        b=tYmCbO5h1/36hmjTmcymhU2xZgaQd9uDKDwjEkKm38qapoJsUCRLms4wHn/U9fbqBl
         p8oz2ejiNzHP3LEUMMgEdyoPukWSs/HWPKRxlzrBRvInaNwMEiyL7RYrVl5K3R5R/18T
         NVXD8uYMTppOue6QXQDs6XfVqQrbVY0Kvq2HDtuqDHqLS5BacVnstq3bWGXNFrJtvJFd
         yh3YGhC8QB5rdg5uqOEdVKyMo9hjEb3Bf88QO+xhqZuwMvtlcL+9aiRTnbEvzFU1WuZM
         6pOTMdH/5WI+OIxSgHuPfsYtRSFiBRsdM8xRfo9i0Fevr1z2D7YaMW2KrjQ+un7lzSh6
         6hKg==
X-Forwarded-Encrypted: i=1; AJvYcCVL9o9z7XObBwvDl6fIGp6kp7Ye0xrL2oiXFgPKsal8vXsSHZP22XutkCt5OOHIyvlfJYEYlCtgG240gpgvkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YweSupfFGM4/ti6Jhg0ih58kEJS91mEdx8SmNw7CJzi9cFRWfWS
	OCaD5/ADgKhRf6fEpX2lM346dqA3lWM+aKWAyMT7RjQzZvIZ9HwwdzO0Ui8Vw3dpQ0+i8wROnLT
	rxxxfVDJbJdMAMBg/2lK60ESn0OFTfrhvCiB8m6iY
X-Gm-Gg: ASbGnct9HklVWUAOMAmQvNHeRhFlG36ePKpJma/teKJP8TSyhsaQFJhzMkETS21IOIw
	ssFPEcjHRmrYpax/ZxjlhrLEBan04Va5Zu20ouB5QAZVhrfVfzyHoVxU8fFF5NU6x3bhNi78pgq
	4NBjn//pUwGm3LDKGEDmVQu3/Kf6fdeLBu42IMuu9oNBSdNvMz/RzaGOqGef3vNFy8Q0rj6oMXH
	1bCRFGMrOpsIZOKL7k=
X-Google-Smtp-Source: AGHT+IFqUWoG+UYe0WvI8ZPBeEsMhEUw5yo8Y2NDjj9iL5kmm96cPK8w/tyOQV0e9sBTS1Ea5rNKeOZjynElQWmts0U=
X-Received: by 2002:a5d:5f81:0:b0:3a6:d2ae:1503 with SMTP id
 ffacd0b85a97d-3b900b7b09emr9455468f8f.34.1754908882025; Mon, 11 Aug 2025
 03:41:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250808181155.223504-1-dakr@kernel.org> <20250808181155.223504-5-dakr@kernel.org>
 <aJm1C7Pehrh8FIFa@google.com> <aa82666a-42d2-4cb9-80fb-b54a10d83900@kernel.org>
In-Reply-To: <aa82666a-42d2-4cb9-80fb-b54a10d83900@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 11 Aug 2025 12:41:09 +0200
X-Gm-Features: Ac12FXyJTSZaotvEya8hr4HU3VIg6BbaFvp-OAPRTjL-bymqPcRH7ECsik8bhWo
Message-ID: <CAH5fLgjoGOPnW4HdBnEjZeJL3X5xWm5wUeNjK7u7VE80YhTcDA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] rust: page: define trait IntoPageIter
To: Danilo Krummrich <dakr@kernel.org>
Cc: lorenzo.stoakes@oracle.com, vbabka@suse.cz, Liam.Howlett@oracle.com, 
	urezki@gmail.com, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 12:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On 8/11/25 11:16 AM, Alice Ryhl wrote:
> > On Fri, Aug 08, 2025 at 08:10:18PM +0200, Danilo Krummrich wrote:
> >> The IntoPageIter trait provides a common interface for types that
> >> provide a page iterator, such as VmallocPageIter.
> >>
> >> Subsequent patches will leverage this to let VBox and VVec provide a
> >> VmallocPageIter though this trait.
> >>
> >> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> >> ---
> >>   rust/kernel/page.rs | 10 ++++++++++
> >>   1 file changed, 10 insertions(+)
> >>
> >> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> >> index 631718a6ad7d..bfb5898ab4b5 100644
> >> --- a/rust/kernel/page.rs
> >> +++ b/rust/kernel/page.rs
> >> @@ -103,6 +103,16 @@ fn deref(&self) -> &Self::Target {
> >>       }
> >>   }
> >>
> >> +/// Trait to be implemented by types, which provide an [`Iterator`] i=
mplementation of
> >> +/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc=
::allocator::VmallocPageIter).
> >> +pub trait IntoPageIter<'a> {
> >> +    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc=
::allocator::VmallocPageIter).
> >> +    type Iter: Iterator<Item =3D BorrowedPage<'a>>;
> >
> > Oh, also, I would put the lifetime on Iter.
> >
> > trait AsPageIter {
> >      type Iter<'a>: Iterator<Item =3D BorrowedPage<'a>>;
> >      fn page_iter(&mut self) -> Self::Iter<'_>;
> > }
> Makes sense, but I think it needs
>
> +    type Iter<'a>: Iterator<Item =3D BorrowedPage<'a>>
> +    where
> +        Self: 'a;

Yeah probably.

Alice
