Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C3533EB01
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771584613; cv=pass; b=elrxP8bLAeH25znvpoQ16m4beepgtOl4KJO/XA/21B6XRdGfbpRP4G6FVhdkPd72UVpwNRxP4sa0DAmjD9J4RIpVw32F6SOymjNlKvS+gLeYWBQX+U+AiRPX8VA5cPWmmjOnFNZ65aETnVqOIhHas9GpfWO+3CrVGwx9eiuFOto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771584613; c=relaxed/simple;
	bh=oIngJ6S5SUKbvESTbw5vt2bQmTdKhr5N3+wDe58Yw5E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pWEcQhxWZDmUURa7DAR1AtVQTOo5Mq60QtuLX+3q264G/mGJZHMt++cd2tjbadBx2MXpCFMR8ukoK8TNigcOXjgVTdRFDXolegjt1VoGeMOjuFxhz+q4V6/Wj8/qpyRPhjnzVWCJZ0+DZB872/lbit1GLZHHVnMqYQJD0jB3Ekk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WrSMJnVF; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WrSMJnVF"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43626796202so1760817f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 02:50:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771584610; cv=none;
        d=google.com; s=arc-20240605;
        b=kXSUacfit5D7PuF6inXEtLVheRXfdWZY5XfFmf9LG/ot4KPxrcP3gSTVWIzWuYEZVe
         Nie01R06P6Z8nS4mggsQL2sGs177wjFLuGQQdtCgYcUCc94mFMGww9Pe6noM7varrFCj
         G8pekmV1AXW9Oo/95BQeY49Eh4WZdNodsGLOeRcGESEGH2Y8MBXmXxj0pfy8qiF/fdPY
         SLBvvm8RrEtdMCe4IJgLHxpjJARX7yVlIuc+GcPkUMDtM9118OI2H19XXY1o6hj8NEad
         AVGkG38iRem7IYLhKVd5b+5SWVNX+hT9thNqhXOmQa2DNnHIrUBjZTPFOuT6ceW8bgxK
         iD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UAf0+WPiEFSXz/CCPkkC3DmUlSyhmOoTBssum21ipoU=;
        fh=sQmgC2IEcl9hMd6Ud+H08xiwdQ8+57/KRo94uFyZZ/c=;
        b=US+tZldn34E0dKUR0uvdp3t1GSp+ao81j2fkDiepXniod/bYJ/mDrKzPNu/IUlISRA
         YrKeG9ArXcMvWSQIMxJXShtbOZkp1rT+YooQrosmvG08ccV58M/VG3Jx9JdLzOnNE/pj
         ALmrroqXMgkJW2laUcxHRv1SLUYD3fmI8SApstTzHz0KJrEgEkYjDGto684Up36rrgKl
         FKRL2MwKEPfodKCvuoqB/6qDiThfa/zl/Su+UxGQXoeB107DBBQ73t+WEdewwo9d8/Ov
         kD+BSt3TGPOCIb5S8UsfXKQfOR/btSmeOY8FLET4CZdiYQoh9zhWlrx1xZQxagZwgvIy
         SOdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771584610; x=1772189410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAf0+WPiEFSXz/CCPkkC3DmUlSyhmOoTBssum21ipoU=;
        b=WrSMJnVF5uBG1etU8Ao1aJIH79rL4B/ID7aOQVzdXbXEAdapztjr+4Ojw8JeHNFzt2
         dlIX5bMaHjSwAwqSEjpbFcjWcCz/Ytn+K1E6hC7kI3h9qjQUDh33ZJHsKdwmHuuhVGRP
         YFF0cE/9CorGsiF8nd1xmbzJ3t3K/qoPOti9J8BMYJ/xUB/nPHYgwPenjrQey3oTVuLG
         c1sOzkT6SCPTSC1qWfTj6n+lkDppOSu17WoIm0D9qCdM74Q/2YDEWRK19PZ3iOOmz7QI
         hGSxz50RSjTI4gysJQiaeqVVYLKibaZlO+bWe1TNVaOl6HXS7zjCEKcoetqQAgYiZCyB
         y61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771584610; x=1772189410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UAf0+WPiEFSXz/CCPkkC3DmUlSyhmOoTBssum21ipoU=;
        b=mxuVXSsKVy8gJ8LoYitovDcaFBxVnHZSTIMkppnu6cArbNv2xU3Zmm2csm9Rk7hTu6
         5yQnCAEuslnRyHDpHQeTbxG1aa0S/6d8pffw8H4YsHSDpYz1n07lKLDA0jzqSTce8/Up
         0xe2YB66iIVH4cGbEk7fUFaGg1VWHqZUBr3EvVUuAmdE/iT2ft3XKglvH512rFyfZaPH
         MCnDrY9ZVQ+G67ZwxhfTPVN3WJeRyK8rawN8KOBqFV7RbxeOBavq82EwQCGfTAKLt9Ut
         ErqK38YYS7zpTTHpm6vQcZke4vTsLwGgFd/HFGAMrzDj2xbmT2jU+qWhno7FVtXMqWAS
         WsOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVimPCKBSb8m0ykQerQWHlokPu96fZAuh+Gv59NJAyBfhBiQ7nw0T84L66vND8EiJ1vVhAFuJwIRZ8om7/VCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCQ5YpFP4ywnrzhfpCyk+vheiuwOmBX9do4V8YWreFUO5jsmm1
	lYlRf3h2WmSTqROXpXXNzj8GhEZobqQWxJN/aOnNqkcr7jfSSEK1wIm9Ji+7XQSOvCSe7SRkNhx
	Uuu87xwuLilIYnlMR2nOpNUM7whXXp6tiq9DUdV7m
X-Gm-Gg: AZuq6aIkkQqcnmNR9bKJU9Vy4YQ0F241JFqBzkCEx2pn9mmfDAUzA7EwKfKvjF3+/5G
	HHfBaFePSHBAs2KnGTYmsEDnkZTDjUYHat1WVjpYklSTVmlDhs7c9brqx7KiiqrEOIlOafD3rz4
	SgBBX8vGua3tEcrhc4/KpGoIYtYesO7v1YIAX75Aodi77Ijs7oAFEcKqHp/gMliAv3LFKQELYV+
	yDHa83e6KQFFvodCrD4ivlxu7Bn91+r+dQHgfTvtk1ir+JVOzoyA/l10Jph+OpcGl9ZanwjgMdH
	/p4GEMuEmhqTCuaSD/mXh0BuyR69Us2nmCcwBw==
X-Received: by 2002:a05:6000:2409:b0:435:95c9:6895 with SMTP id
 ffacd0b85a97d-43958e00ce5mr15101201f8f.18.1771584608836; Fri, 20 Feb 2026
 02:50:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org> <20260220-unique-ref-v15-3-893ed86b06cc@kernel.org>
In-Reply-To: <20260220-unique-ref-v15-3-893ed86b06cc@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 20 Feb 2026 11:49:57 +0100
X-Gm-Features: AaiRm525n9TXR47KvplRQPUHuuUwgU5iN4_ng3kUHWK8LN9TrQcHulfhA1IhjZ4
Message-ID: <CAH5fLggNjCZ3AvHnhO8O0cmd33B3zMbfq+hhNvonznTsLLtgYw@mail.gmail.com>
Subject: Re: [PATCH v15 3/9] rust: Add missing SAFETY documentation for `ARef` example
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org, Oliver Mangold <oliver.mangold@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 10:52=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> SAFETY comment in rustdoc example was just 'TODO'. Fixed.
>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/sync/aref.rs | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/rust/kernel/sync/aref.rs b/rust/kernel/sync/aref.rs
> index 61caddfd89619..efe16a7fdfa5d 100644
> --- a/rust/kernel/sync/aref.rs
> +++ b/rust/kernel/sync/aref.rs
> @@ -129,12 +129,14 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      /// # Examples
>      ///
>      /// ```
> -    /// use core::ptr::NonNull;
> -    /// use kernel::sync::aref::{ARef, RefCounted};
> +    /// # use core::ptr::NonNull;
> +    /// # use kernel::sync::aref::{ARef, RefCounted};
>      ///

Either keep the imports visible or delete this empty line. And either
way, it doesn't really fit in this commit.

>      /// struct Empty {}
>      ///
> -    /// # // SAFETY: TODO.
> +    /// // SAFETY: The `RefCounted` implementation for `Empty` does not =
count references and never
> +    /// // frees the underlying object. Thus we can act as owning an inc=
rement on the refcount for
> +    /// // the object that we pass to the newly created `ARef`.
>      /// unsafe impl RefCounted for Empty {
>      ///     fn inc_ref(&self) {}
>      ///     unsafe fn dec_ref(_obj: NonNull<Self>) {}
> @@ -142,7 +144,7 @@ pub unsafe fn from_raw(ptr: NonNull<T>) -> Self {
>      ///
>      /// let mut data =3D Empty {};
>      /// let ptr =3D NonNull::<Empty>::new(&mut data).unwrap();
> -    /// # // SAFETY: TODO.
> +    /// // SAFETY: We keep `data` around longer than the `ARef`.
>      /// let data_ref: ARef<Empty> =3D unsafe { ARef::from_raw(ptr) };
>      /// let raw_ptr: NonNull<Empty> =3D ARef::into_raw(data_ref);
>      ///
>
> --
> 2.51.2
>
>
