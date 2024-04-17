Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28181411CE
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Apr 2024 14:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713364821; cv=none; b=nBUVzEd7VzkArNwglDHSXlf0XWIog8f3gmtS5nPdrw3z9qJuUXg+vVcyvaTiIPZ07/k/dblDUImxdY9Cy1fun7ufm6QYnICV+Lm1ZY7Pijwr3N4S38Uz3hMD+gJk4kMyV2sQXiLM4bq6VIuumkcJ1I3uzHNG/PohEu4qQo09W0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713364821; c=relaxed/simple;
	bh=CG7A0XS5Xdpm61BM+Mu/W9XBB/wYmjyn3UwZ2G16VmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sM+YEIPihwn7KIG8xMk6tQznRuOIkrpbGh3vAehVIEu0eVG2RZh6DEXhsaBfOHBPZDgiWendztgT1K4f9L6yrdt3HNZGjQIqViQ4ARLw9yjuzXOJTYDK83aZWL8To34hFcz3jvC+wciHaLSWtYI1IRwA2yhpQN0VPDMGJVxkgPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aHZGXw63; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aHZGXw63"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-7e7af556187so1713714241.1
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Apr 2024 07:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713364819; x=1713969619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9STrnlwuu+n4JzHQ1nF68oOe1/KL3VmX4gpavyNIyiA=;
        b=aHZGXw638ZeW9a/y7K3QuwK5Q5gkaSAnb+mqwZ8H1Z6ZLwXzHGQYUFsksagZt903FA
         UA/KIqjG9+MZqzvSwZOK/1blT2kS8sNmPK5Dp6920edLid4KNdEylWt8rgVBte44U/bz
         QgQK82WB87LkQHk4mU7cBH+ShVRH0AXQV1u1BFLH/sSjR+mXnJOtYhbgGHtC2qJBjFVI
         1G5cjKYiouzotV7gONGaIiMRfPlQvv6vQAEcu1A0m0WON5yfxy5AF2MwKnHRn3US9Ays
         AA4nApWCdVOcumPJKgLVnMDqWBlbY89DsltEkp3N40z7BGa3LOYVKWwaewLWGNn5aPKt
         FVpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713364819; x=1713969619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9STrnlwuu+n4JzHQ1nF68oOe1/KL3VmX4gpavyNIyiA=;
        b=kOVrfJyqCOKDrxoTYE+8msS8lgwkopnKN3U8KQ1yvk+9LyYLUO4pKWLwviPwhZYRLk
         t+l94EOADyF9Nw4hW8nlUdOI/mLP/jEsTlFLzs3trv+GmKFgDDYoMRvvxrsXNo5JPo/5
         zpSERDvc31viaIkuBFp0q0i9MwLJzvxVMN4jdljkNN1TrcIXB42P9CHYP1upkuLvgS/C
         bRLIBluA5rnMZTLq0KUrOLRJz37dXmlq7pTzz+1WyKr1jrfE0cG6p4iuzBUWUgMAW+nb
         KGUYr9qBkaK/ZwFHBs4/Ye09syVJm5GO5k4C2G8qVu3cuLNd3ZVOK4snztMWDzDLz41y
         CcXA==
X-Forwarded-Encrypted: i=1; AJvYcCUvZuuNgxrbvHCjIeO+t78r0pMCMdfM35ve99bPeXSwEgyiXRfya8joQ0xfZuqx21x4Ekk4zkQf1/5G56Nu1A9CbHZgs30peAp18TEfTvw=
X-Gm-Message-State: AOJu0YwGCxUeP9GL3XkXXvA3ptGAHY8qoTjb5JPGaPEhntE/vuOGHxXs
	Ojk518/QGKD04XMCiKXK8DCvAI/dxCD/orxDlpaucly/Oyg4612v21TFPfyWz9GSw8i64M4LSCr
	BtGjw8hRGYSaBZ684GKCRQaFEt2Zu3WscAI4w
X-Google-Smtp-Source: AGHT+IEAhdkE9/+u7jKI1qVzSkpiUAFnT/Mz0cfCADATqN+blmQ68F1aCON7VI4CU5CS05totk8sdgrrvWMi3cB58MI=
X-Received: by 2002:a05:6122:882:b0:4c8:90e5:6792 with SMTP id
 2-20020a056122088200b004c890e56792mr16551902vkf.7.1713364818511; Wed, 17 Apr
 2024 07:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240415-alice-mm-v5-0-6f55e4d8ef51@google.com>
 <20240415-alice-mm-v5-1-6f55e4d8ef51@google.com> <20240417152802.6b7a7384@eugeo>
In-Reply-To: <20240417152802.6b7a7384@eugeo>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 17 Apr 2024 16:40:07 +0200
Message-ID: <CAH5fLgjcO0mrQ=X2QG1qS+sTpWDnBfGxXGWn-3wBQzn3MP8pQQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] rust: uaccess: add userspace pointers
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>, 
	Kees Cook <keescook@chromium.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 4:28=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Mon, 15 Apr 2024 07:13:53 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > From: Wedson Almeida Filho <wedsonaf@gmail.com>
> >
> > A pointer to an area in userspace memory, which can be either read-only
> > or read-write.
> >
> > All methods on this struct are safe: attempting to read or write on bad
> > addresses (either out of the bound of the slice or unmapped addresses)
> > will return `EFAULT`. Concurrent access, *including data races to/from
> > userspace memory*, is permitted, because fundamentally another userspac=
e
> > thread/process could always be modifying memory at the same time (in th=
e
> > same way that userspace Rust's `std::io` permits data races with the
> > contents of files on disk). In the presence of a race, the exact byte
> > values read/written are unspecified but the operation is well-defined.
> > Kernelspace code should validate its copy of data after completing a
> > read, and not expect that multiple reads of the same address will retur=
n
> > the same value.
> >
> > These APIs are designed to make it difficult to accidentally write
> > TOCTOU bugs. Every time you read from a memory location, the pointer is
> > advanced by the length so that you cannot use that reader to read the
> > same memory location twice. Preventing double-fetches avoids TOCTOU
> > bugs. This is accomplished by taking `self` by value to prevent
> > obtaining multiple readers on a given `UserSlicePtr`, and the readers
> > only permitting forward reads. If double-fetching a memory location is
> > necessary for some reason, then that is done by creating multiple
> > readers to the same memory location.
> >
> > Constructing a `UserSlicePtr` performs no checks on the provided
> > address and length, it can safely be constructed inside a kernel thread
> > with no current userspace process. Reads and writes wrap the kernel API=
s
> > `copy_from_user` and `copy_to_user`, which check the memory map of the
> > current process and enforce that the address range is within the user
> > range (no additional calls to `access_ok` are needed).
> >
> > This code is based on something that was originally written by Wedson o=
n
> > the old rust branch. It was modified by Alice by removing the
> > `IoBufferReader` and `IoBufferWriter` traits, and various other changes=
.
> >
> > Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> > Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/helpers.c         |  14 +++
> >  rust/kernel/lib.rs     |   1 +
> >  rust/kernel/uaccess.rs | 304 +++++++++++++++++++++++++++++++++++++++++=
++++++++
> >  3 files changed, 319 insertions(+)
> >
> > diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
>
> > +/// [`std::io`]: https://doc.rust-lang.org/std/io/index.html
> > +/// [`clone_reader`]: UserSliceReader::clone_reader
> > +pub struct UserSlice {
> > +    ptr: *mut c_void,
> > +    length: usize,
> > +}
>
> How useful is the `c_void` in the struct and new signature? They tend
> to not be very useful in Rust. Given that provenance doesn't matter
> for userspace pointers, could this be `usize` simply?
>
> I think `*mut u8` or `*mut ()` makes more sense than `*mut c_void` for
> Rust code even if we don't want to use `usize`.

I don't have a strong opinion here. I suppose a usize could make
sense. But I also think c_void is fine, and I lean towards not
changing it. :)

> Some thinking aloud and brainstorming bits about the API.
>
> I wonder if it make sense to have `User<[u8]>` instead of `UserSlice`?
> The `User` type can be defined like this:
>
> ```rust
> struct User<T: ?Sized> {
>    ptr: *mut T,
> }
> ```
>
> and this allows arbitrary T as long as it's POD. So we could have
> `User<[u8]>`, `User<u32>`, `User<PodStruct>`. I imagine the
> `User<[u8]>` would be the general usage and the latter ones can be
> especially helpful if you are trying to implement ioctl and need to
> copy fixed size data structs from userspace.

Hmm, we have to be careful here. Generally, when you get a user slice
via an ioctl, you should make sure to use the length you get from
userspace. In binder, it looks like this:

let user_slice =3D UserSlice::new(arg, _IOC_SIZE(cmd));

so whichever API we use, we must make sure to get the length as an
argument in bytes. What should we do if the length is not a multiple
of size_of(T)?

Another issue is that there's no stable way to get the length from a
`*mut [T]` without creating a reference, which is not okay for a user
slice.

Alice
