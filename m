Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9758140E34
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 08:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624964; cv=none; b=iS71DW2kXq8wykqC0FuA5Q/YBTCJ0djN5yWm90+UsCyZIhibzfC5/iB8UvGroNj7CsmtlFXGc/1axmCdJl8dqMZzjl/oFFJmNPWrsJLnZPeZoy7LgupgO4ht280cNs2q6SpuJYxyta8my54VRvgi3BTmOUi2A2TsPX90jMxZ4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624964; c=relaxed/simple;
	bh=Yz3FvUcSxm+sPTrIaF3ceIVk5DSTE0gKUp7+I6EngE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4av3rMRvkUWO34Xb2w7X68i3PcQrMvf+sURY3xiNjM5UpSMHWhrPZ9y+GqSHPgl/w9DRoP7DjJU3EW4yLUGmTLPXMablS0BY9fboD6tLKYL5VB85hAMWeESchCgeH7cmjQ2nzQSDljnokWRa28vRJmDc/FRGE/GAFOp0sQUvjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KmEM7s4b; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KmEM7s4b"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-367963ea053so4966832f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Aug 2024 01:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723624961; x=1724229761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GtZhrT/mm/AxwGAt7UwiNX0lEue7r3nHz8XAGJUFqg=;
        b=KmEM7s4bCf4SHKlU+KNEbCglwEjFzxSALDuvwpqXzAYFKJm7aJx/pvP4JptoIEnBmp
         nGmZYaq7MGpGyxosy1gsZHB8Z0LQGc6lfMrPvV9opOFoXkGRzhCRMHKgbYc6i24ENs+I
         6gTWNHaYCcFvZhn1ECDw+YPiRmRM/1xTm9OQWfK35w6JA91PEEea6vQOrt+ajKFeAOWM
         K/EhTBggqGpc1+d9maw7jsb3agyk5GryUN7ehMH94Qia0yS59DzcuiqmqcRnVMXXC68N
         5XB8lJfOxgJMNOt6AGsdV9t1TvFeBOLeYW3pMM49jwOROvyiwRNrbH2Uw2+/o3FJtYA+
         R15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624961; x=1724229761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GtZhrT/mm/AxwGAt7UwiNX0lEue7r3nHz8XAGJUFqg=;
        b=hEVGd+PYzEYgKIRRcX+oKMG4wM6wgYPKR1P4ooVnIBopf/3fF9LPUgen2cuNjaxg2J
         JxraeET9vrDavk6L9GBKk2xHgQ7BArlKjjwl6NhEkzCK7/MHUEQXfkuarsQwQuafRdJ8
         ZAGgThTsLVjz/vfIvBFFRQwAVCOzdBZATHXg/Y6tPEXqVpzgNa9MTNJ+BRJOuyLkQHcD
         sewTIn/dt14aVHpzb+8VdHPbW6PQd0n0pDsqtX608hB1rpcsdgpGE2MdHEgtaciywQhs
         lLpq/zRGK6z4EN+AYZkf8g4GAg/4fd8MOICLCanNktmWpKQyOhcXqfc7cSolOU6Iz9Kk
         nxUA==
X-Forwarded-Encrypted: i=1; AJvYcCWtDn/U5jdRKZky8PezVSEtYaYoDMF5dNOZgxuR2j/j+1dMMkjeNj6ruMUQl42POI905jcr6bbPd4W6pSmZcwe0QP2A1yprKrQIxCW3tas=
X-Gm-Message-State: AOJu0Yxk4KRZhCyN0uIMeFSP/EiKGq/mpTxM6Xl1yON7VxdN5kfJ/Ci4
	Pydsp9xMiBR49nTE0EfLotLmqUk6kJ2OrNgg3ZLBom1e3k5uWayDGw3CZsb+Bj9jy8fTMt8u7TA
	KNnPILQVHsIqeBF7UKingytKmHDfvbtycNB6v
X-Google-Smtp-Source: AGHT+IFrmL3U1S+rpzBOdS5HfRHkuyTVNTg4EqoC10UJXSwLurGP5QVOWdVYxkQVIjwptFuwedEGKyhyn45M8GLcKU0=
X-Received: by 2002:a5d:59a5:0:b0:367:9903:a91 with SMTP id
 ffacd0b85a97d-37177744793mr1608078f8f.11.1723624960494; Wed, 14 Aug 2024
 01:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240812182355.11641-1-dakr@kernel.org> <20240812182355.11641-14-dakr@kernel.org>
In-Reply-To: <20240812182355.11641-14-dakr@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 14 Aug 2024 10:42:28 +0200
Message-ID: <CAH5fLggchaAzcRK=i=zRm7hTg6qX0yGBAyAHcO45rG-oEh-AMQ@mail.gmail.com>
Subject: Re: [PATCH v5 13/26] rust: alloc: implement kernel `Vec` type
To: Danilo Krummrich <dakr@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, akpm@linux-foundation.org, 
	daniel.almeida@collabora.com, faith.ekstrand@collabora.com, 
	boris.brezillon@collabora.com, lina@asahilina.net, mcanal@igalia.com, 
	zhiw@nvidia.com, cjia@nvidia.com, jhubbard@nvidia.com, airlied@redhat.com, 
	ajanulgu@redhat.com, lyude@redhat.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 8:25=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> `Vec` provides a contiguous growable array type (such as `Vec`) with
> contents allocated with the kernel's allocators (e.g. `Kmalloc`,
> `Vmalloc` or `KVmalloc`).
>
> In contrast to Rust's `Vec` type, the kernel `Vec` type considers the
> kernel's GFP flags for all appropriate functions, always reports
> allocation failures through `Result<_, AllocError>` and remains
> independent from unstable features.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> [...]
> +impl<T, A, const N: usize> Box<[T; N], A>
> +where
> +    A: Allocator,
> +{
> +    /// Convert a `Box<[T, N], A>` to a `Vec<T, A>`.
> +    pub fn into_vec(b: Self) -> Vec<T, A> {

Nit: I would probably make this a From impl.

> +#[macro_export]
> +macro_rules! kvec {
> +    () =3D> (
> +        {
> +            $crate::alloc::KVec::new()
> +        }
> +    );
> +    ($elem:expr; $n:expr) =3D> (
> +        {
> +            $crate::alloc::KVec::from_elem($elem, $n, GFP_KERNEL)
> +        }
> +    );
> +    ($($x:expr),+ $(,)?) =3D> (
> +        {
> +            match $crate::alloc::KBox::new([$($x),+], GFP_KERNEL) {
> +                Ok(b) =3D> Ok($crate::alloc::KBox::into_vec(b)),
> +                Err(e) =3D> Err(e),

Hmm. This currently generates code that:

1. Creates the array.
2. Allocates the memory.
3. Moves the array into the box.

Whereas the stdlib macro swaps step 1 and 2. You can do the same by
utilizing new_uninit. A sketch:

match KBox::<[_; _]>::new_uninit(GFP_KERNEL) {
    Ok(b) =3D> Ok(KVec::from(KBox::write(b, [$($x),+]))),
    Err(e) =3D> Err(e),
}

> +// SAFETY: `Vec` is `Send` if `T` is `Send` because the data referenced =
by `self.ptr` is unaliased.
> +unsafe impl<T, A> Send for Vec<T, A>
> +where
> +    T: Send,
> +    A: Allocator,
> +{
> +}
> +
> +// SAFETY: `Vec` is `Sync` if `T` is `Sync` because the data referenced =
by `self.ptr` is unaliased.
> +unsafe impl<T, A> Sync for Vec<T, A>
> +where
> +    T: Send,
> +    A: Allocator,

Same comment as Box. Ditto about "unaliased". Needs `T: Sync` instead.

> +impl<T: Clone, A: Allocator> Vec<T, A> {
> +    /// Extend the vector by `n` clones of value.
> +    pub fn extend_with(&mut self, n: usize, value: T, flags: Flags) -> R=
esult<(), AllocError> {
> +        self.reserve(n, flags)?;
> +
> +        let spare =3D self.spare_capacity_mut();
> +
> +        for item in spare.iter_mut().take(n - 1) {

You need to handle `n =3D=3D 0` here.

Alice
