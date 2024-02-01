Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84E3EACC
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Feb 2024 01:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706752512; cv=none; b=Pn2kYXwjbUDTh6FQVi+ZReUGgzMV5vcYm2iFZYQphDzrx27USPnuUfha3NUYLofFwM90bLhrYX9Proeih4sXbDQ6CVSsBzK3N79PMbA3AxpBxaPVEL5FMy4DlSqLbBD8vTlk+iRUj9qndVXF2sYKjYcOA0D5jlvPoREmbQjdOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706752512; c=relaxed/simple;
	bh=EfmD/s8qRghm9R+l2F5vFH4imv72Dcs09IKlr/e2Lco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq0HBlAsQWwyAlFkc3uoE3LEW987da9khuydkkRfUUhO4JKoDbrvY8KVHLIcjQdZ2EDTjgs2OXYTsUTWwAYaGSaEXq4/lwvLhKVfJM4kew6BERv01bxhOqk+VVJAbr+2pXy7mXE+AGgLtmJl63lniA8KB4cnGDYvoUgYLrQMWxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=es5pdohs; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="es5pdohs"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dc25e12cc63so1379031276.0
        for <rust-for-linux@vger.kernel.org>; Wed, 31 Jan 2024 17:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1706752508; x=1707357308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dWKR7PkG+9bsXHe1OFGgrY6MmJiaJuL52eK1Z0ZBaM4=;
        b=es5pdohsmosqpi3tgeK6m/WKZU7hMABQyC+67AeykEd6qoW3lUP1EtQG7OARZ7FBer
         9qWe093bu/fO6PYZkkrKOzXY41EHdcvSKfylMwFtnjMcZhnv92sl0KRisTw/3FCanRDD
         Fnruqt4ioa8syzl1y1GIRvh5c/FsemfJuNZLydeFb7LJc/ItJkpS/vp75x2IRpogiKI7
         rx0gjyxaHsR839DMxLwipFEYw5gnm8AG9gRVQ7SlXXF5cRZq7vdJJB83kWQO7myi+qmr
         G4jbQleaVIbJEgG9hK8tuCZsfgEilI7/Y8EncQ2hbGz/W4QWuI33aAs6hE8G18M+qt2s
         4vTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706752508; x=1707357308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dWKR7PkG+9bsXHe1OFGgrY6MmJiaJuL52eK1Z0ZBaM4=;
        b=L4QhKGOTPeYlFqzsoCKV+zR+pDIjxbsIw5eq5QQUQsJnf+79zt3hNRjHJL75+IIqY7
         hqChXgqgZimALJYOHPDNDqynJa7PH6GJHE0mtsrgwnsBLL3XXzIk+4cSUgZtSQccGFW7
         r+eQSnHaS3Fn7rosuU6P93JO/Q1RoQNpEl59W49CwshNFpvvmHv5ZKtUwJlqNlTU8u1i
         UklY7ilDC+z6hUAMVJpvswIAkMUs1Pb9q6fZDZBh06k1d+sjpsjxEZ0Eb5tvC2XIm/SX
         1qhvTbJ1X1RYRtyno7Me91+z7kny6JtTGWJn9IMhTLRDeZnh55enfPGKgsLNHmpzNsz7
         a6zw==
X-Gm-Message-State: AOJu0YwjfJVXeSzXdVynqtq9ThWXUxW54cCmrXQmzRajO+zW6vRy2kbQ
	gGF0dBNBc9yd/M3LczNZRE0zFYjE2ypgVZuL/+rahIJP63gi5fKXks5GvzldVeh4WKN5I9vdYfI
	tkphD4ycHXUbdjGQGlf4dWsUW+DgMHpb1r08DGg==
X-Google-Smtp-Source: AGHT+IH9U2NEAFA0KiGptj1QwY3Cte3ZzYADWGoQHKOtOJwXoUyq/QeN7LeJ7wBB760qrh3WIFYq9Gyh1Fg0GZ7ioLE=
X-Received: by 2002:a25:d391:0:b0:dc6:d1a9:d858 with SMTP id
 e139-20020a25d391000000b00dc6d1a9d858mr1398416ybf.8.1706752508233; Wed, 31
 Jan 2024 17:55:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129064519.7137-1-linux@obei.io> <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
In-Reply-To: <0100018d53f737f8-80c1fe97-0019-40d7-ab69-b1b192785cd7-000000@email.amazonses.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 31 Jan 2024 20:54:57 -0500
Message-ID: <CALNs47sfBSBbsGwXnWEJTWqxhGLco8Z-Graktt84u2oC3Zspjw@mail.gmail.com>
Subject: Re: [PATCH v6] rust: types: Add `try_from_foreign()` method
To: Obei Sideg <linux@obei.io>
Cc: "aliceryhl@google.com" <aliceryhl@google.com>, "a.hindborg@samsung.com" <a.hindborg@samsung.com>, 
	"alex.gaynor@gmail.com" <alex.gaynor@gmail.com>, "benno.lossin@proton.me" <benno.lossin@proton.me>, 
	"bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>, 
	"gary@garyguo.net" <gary@garyguo.net>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>, "wedsonaf@gmail.com" <wedsonaf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 1:52=E2=80=AFAM Obei Sideg <linux@obei.io> wrote:
>
> Currently `ForeignOwnable::from_foreign()` only works for non-null
> pointers for the existing impls (e.g. Box, Arc). It may create a few
> duplicate code like:

"may create a few duplicate code like" should be reworded to

> ```rust
> // `p` is a maybe null pointer
> if p.is_null() {
>   None
> } else {
>   unsafe { Some(Self::from_foreign(ptr)) }
> }
> ```
>
> Adding a `try_from_foreign()` method that will return `None` if `ptr`
> is null, otherwsie return `Some(from_foreign(ptr))`.

s/Adding/Add (commit messages use the imperative mood)
s/otherwsie/otherwise

>
> Link: https://github.com/Rust-for-Linux/linux/issues/1057
> Signed-off-by: Obei Sideg <linux@obei.io>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> ---

Content looks good:so:

Reviewed-by: Trevor Gross <tmgross@umich.edu>

You don't need to resend the patch to address my above comments on the
commit message or add that RB, Miguel usually fixes up wording before
applying and adds relevant tags.

As Greg's bot mentioned, you should have a small version changelog
with links to previous versions of the patch after the `---` and
before the diffstat (this part doesn't make it into the commit
message). Example in [1]. Again, you don't need to resend for this but
you could reply to this thread with one so we know what happened
through v3/v4/v5/v6 (and include it if you wind up needing to send
another).

[1]: https://lore.kernel.org/rust-for-linux/20240118-alice-file-v3-0-9694b6=
f9580c@google.com/

>  rust/kernel/types.rs | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
> index fdb778e65d79..04a356ec3534 100644
> --- a/rust/kernel/types.rs
> +++ b/rust/kernel/types.rs
> @@ -46,6 +46,23 @@ pub trait ForeignOwnable: Sized {
>      /// Additionally, all instances (if any) of values returned by [`For=
eignOwnable::borrow`] for
>      /// this object must have been dropped.
>      unsafe fn from_foreign(ptr: *const core::ffi::c_void) -> Self;
> +
> +    /// Tries to convert a foreign-owned object back to a Rust-owned one=
.
> +    ///
> +    /// A convenience wrapper over [`from_foreign`] that returns [`None`=
] if `ptr` is null.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must either be null or satisfy the safety requirements for=
 [`from_foreign`].
> +    unsafe fn try_from_foreign(ptr: *const core::ffi::c_void) -> Option<=
Self> {
> +        if ptr.is_null() {
> +            None
> +        } else {
> +            // SAFETY: The safety requirements of this function ensure t=
hat `ptr` comes from a previous
> +            // call to [`into_foreign`].
> +            unsafe { Some(Self::from_foreign(ptr)) }
> +        }
> +    }
>  }
>
>  impl<T: 'static> ForeignOwnable for Box<T> {
> --
> 2.39.2
>
>
>
