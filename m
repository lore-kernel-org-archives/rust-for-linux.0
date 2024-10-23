Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0582D1A0734
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 09:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675711; cv=none; b=WyTW40EuZ2cnuTQlD9KLnlx+IHhpRhBbH9fsDB2eP3ivne02+JadCdSwzb2IrKsSTDu3YHwcAXEqCCbY3zKmOQuTNxmPIgm6NC3dMUU/SAl5F9p7iGBKuWa1iHahEuB0bo8aBt++WetUc49UMjZYzKUODBzUs9lmie/Ou6J2ma4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675711; c=relaxed/simple;
	bh=+euBRe+YJJ5kwBl8JCch+oTPenUgNUWi3HDBLbYPpTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tVm2X8jSbMbjntItdIb8V7noNKzlz8clm92jPwmQwWcEAg/Eiq/eDMUmrcJEPluom8yKLnH0VSyYzLn1gyEsMfdJ++F0y6RR+atGpnMf420Fi67PWzVfEDX1Kgqgl8AYyT82St8Gurqelo0gcgnTTGtMR4v86uMumY9GcWgaK1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cRnc59nW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRnc59nW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315df7b43fso66593725e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 02:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729675708; x=1730280508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HjhUWQx3FhByOzspd9YJMOCO+cWepr8CDKy9yIPq1U=;
        b=cRnc59nWVQPohhyyAegBbQUGatz7xdMcYb3H9QaCgQUJsIbOF6G7+enX5tNZdTYOMh
         UXhj+hkQn6ShaxOB0C4CSt7AY82bKnoK0aG1IlHWR1aOZbvpH0eiDP1zRmI8jThrW1Pb
         05581wCIdq/WuEpAtrPo8KbrZwq7MNR2UAdgrZjpu2j2ttO8l0O0743H5P+Ai+YdMppG
         acJekD5KD5mCdmyrwPaQ1AjKXgiO5TIpyDPV8eOdFVUDtGMKf1d+/1wcCu7vbFadiozU
         7BfLryIprwzt9Go0xLu2w8BdYLk0olOX0Nt+U1mYC3ZQsNk8oAb86VOB3hcmO4qpmtWk
         u/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675708; x=1730280508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HjhUWQx3FhByOzspd9YJMOCO+cWepr8CDKy9yIPq1U=;
        b=mjHT6nXPPFxWbnLM4UEpe3w0eKGHg3Uyzz88oiO5JFs6XUwMqrd1pEfy9tkDjImU7w
         GjIoRA5N6abaZ1SpdiObNR89KbcwxIZd28Gl/TLOCBQLJGGyzIYb2e+sG2JFa81w8OGn
         04KnvO3rd+e116xHpNfEtwlCdf09H2w769mSS+xXBETSguJ2VA7SBJKW9Ym8Zgu1lTti
         UCC/IG7MBfzwEOSUBadIHVYO+u8awd4SAY96U+8djOg788n3kuQ1pZ1aIBOyYhyM6Z6Q
         uGKOvJoMnSGIKBqytlsG0M3Fqo3J8m6jl5PG7PwFqNZNkrtj+pcnBomSlFcFAvYA0npu
         Y5Qw==
X-Gm-Message-State: AOJu0Yw4CPI4O3goUYZe/ILBkDwBEl5500PbKcB/0X5gBD3h0k55SPCs
	nYMt+57+GoLskjEacTcLH22Tc3IEdWm5+d1eCxm+CNw9WX198QGtRQoi3E/HwydQ/ngpxESYqih
	wwLZLlbjcCRzMU1YOsgyUQd+BY8iFcgpUr/Qu
X-Google-Smtp-Source: AGHT+IHTtT5ppppgEclk0pUPkMtYrNEcLz+4PVx4rtK92P8V92Y4yNZSUNpPVUalV85KF3okbYL8p/xnOuvpEDM4bAI=
X-Received: by 2002:a05:600c:1d98:b0:42c:b995:2100 with SMTP id
 5b1f17b1804b1-431841320f1mr15567365e9.6.1729675708278; Wed, 23 Oct 2024
 02:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022224832.1505432-1-abdiel.janulgue@gmail.com> <20241022224832.1505432-2-abdiel.janulgue@gmail.com>
In-Reply-To: <20241022224832.1505432-2-abdiel.janulgue@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Oct 2024 11:28:13 +0200
Message-ID: <CAH5fLgjZ91xFo4hV4dPnDXLFr9jX3na60tVt_KuNU_c6WhhzAA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] rust: types: add `Owned` type and `Ownable` trait
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, dakr@redhat.com, 
	linux-kernel@vger.kernel.org, airlied@redhat.com, 
	miguel.ojeda.sandonis@gmail.com, boqun.feng@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 12:49=E2=80=AFAM Abdiel Janulgue
<abdiel.janulgue@gmail.com> wrote:
>
> Add the 'Owned' type, a simple smart pointer type that owns the
> underlying data.
>
> An object implementing `Ownable' can constructed by wrapping it in
> `Owned`, which has the advantage of allowing fine-grained control
> over it's resource allocation and deallocation.
>
> Co-developed-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
> ---
>  rust/kernel/types.rs | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index ced143600eb1..3f632916bd4d 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -429,3 +429,65 @@ pub enum Either<L, R> {
>      /// Constructs an instance of [`Either`] containing a value of type =
`R`.
>      Right(R),
>  }
> +
> +/// A smart pointer that owns the underlying data `T`.
> +///
> +/// This is a simple smart pointer that owns the underlying data. Typica=
lly, this would be
> +/// returned as a wrapper for `T` in `T`'s constructor.
> +/// When an object adds an option of being constructed this way, in addi=
tion to implementing
> +/// `Drop`, it implements `Ownable` as well, thus having finer-grained c=
ontrol in where
> +/// resource allocation and deallocation happens.
> +///
> +/// # Invariants
> +///
> +/// The pointer is always valid and owns the underlying data.
> +pub struct Owned<T: Ownable> {
> +    ptr: NonNull<T>,
> +}
> +
> +impl<T: Ownable> Owned<T> {
> +    /// Creates a new smart pointer that owns `T`.
> +    ///
> +    /// # Safety
> +    /// `ptr` needs to be a valid pointer, and it should be the unique o=
wner to the object,
> +    /// in other words, no other entity should free the underlying data.
> +    pub unsafe fn to_owned(ptr: *mut T) -> Self {

Please rename this function to from_raw to match the name used by
other similar functions.

Also, I don't love this wording. We don't really want to guarantee
that it is unique. For example, pages have one primary owner, but
there can be others who also have refcounts to the page, so it's not
really unique. I think you just want to say that `ptr` must point at a
valid value of type `T`, and it must remain valid until `ptr_drop` is
called.

> +impl<T: Ownable> Deref for Owned<T> {
> +    type Target =3D T;
> +
> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY: By the type invariant, there is necessarily a referen=
ce to the object, so it is
> +        // safe to dereference it.
> +        unsafe { self.ptr.as_ref() }
> +    }
> +}
> +
> +impl<T: Ownable> DerefMut for Owned<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY: By the type invariant, there is necessarily a referen=
ce to the object, so it is
> +        // safe to dereference it.
> +        unsafe { self.ptr.as_mut() }
> +    }
> +}

We only want Deref, not DerefMut. DerefMut both requires uniqueness in
a way that is stronger than what we can really promise, and it also
implies that the value is *not* pinned, but we generally want to use
Owned with pinned things. Thus, we can't use DerefMut.

> +/// An Ownable type is a type that can be put into `Owned<T>`, and when =
`Owned<T>` drops,
> +/// `ptr_drop` will be called.
> +pub unsafe trait Ownable {
> +    /// # Safety
> +    /// This could only be called in the `Owned::drop` function.
> +    unsafe fn ptr_drop(ptr: *mut Self);
> +}
> +
> +impl<T: Ownable> Drop for Owned<T> {
> +    fn drop(&mut self) {
> +       // SAFETY: In Owned<T>::drop.
> +       unsafe {
> +           <T as Ownable>::ptr_drop(self.ptr.as_mut());

This uses NonNull::as_mut which creates a mutable reference. You
should use NonNull::as_ptr instead.

Also this code will look better if you move the semicolon so it is
outside of the unsafe block.


Alice
