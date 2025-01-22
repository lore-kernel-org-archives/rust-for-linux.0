Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD4136A
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540155; cv=none; b=NeBIVzXNLbaLJUoaT8MDE6P/jXGVpmE/KdOdYWt7UJBjPbissUwN6lyRPvH4UP4UZ4hZzKZwOmhhYxaExTdw7AIENpC3XT6l4ECQvaNT+Z42kFgybhhBaGJE9bFrXbcEb+u0gmKrD8hEwrG9cEziaWbwFWTV8loaJTC5yo4I4PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540155; c=relaxed/simple;
	bh=rg0wctb8s8zvnjZZAV3RYEa6Tx8UaHmyZKZh1+gDAv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geMnrLCPb7bQbOHk7ZmZQLsQhFG2bz2kf+Q7t2hYU16i3wxswwLAAn19Xkag4w614Amm9NpLlfBKe6UmsXotCOOHxI2L2QmUNLjhwJv9mwNK1ukRJ+vhsLzx56fSVBR12k8G8N68+R0u7JU8TpHOOiGEWV3iSptyFG9HGj+hD4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=akWPOmjM; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="akWPOmjM"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-385ef8b64b3so5851644f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 02:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737540152; x=1738144952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T64ksA3JRg5Gqw8xNHAVE2Ven6JlxcDBE0lpBLQtMiI=;
        b=akWPOmjMTxgeRNQFZbQkS2g+nfTNTwEGiePWsdllour3Ob4o1rZrC6a9SwbMNFyIIF
         933JjdILFP9bYTj809r2NJeggVluaAmJAQDWDoxCRLgtSVw8gP5Quat+bqwlqrAI05Ic
         tKeMkh5Dmm7Scv6lVuLWDJ/246DoKzZ/MIfoBaD3QE1Y3eHylLJKeuxrAUxkR0mYMIBj
         fn8Eb7GaWjotGNBi+asYEbwsUWyqPzdXfJT3Flm5/dBlYgmskwMm4TRY3sBSdnwvGyky
         fR8GZKib10FOu28Bk//0JRSLMkfZdapySqXXESUGVHSxq1gp8Cz99S5P0rsLlj6ThfQC
         Iw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540152; x=1738144952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T64ksA3JRg5Gqw8xNHAVE2Ven6JlxcDBE0lpBLQtMiI=;
        b=U6xIQBJ7g9mR9O4IFPjMC8nDtzQioWV0nfYn6Km4mPtZZZ2qlG4NwrVPzCz2fMtI8C
         jzIyDSucSb9ovhGnQA19bywdylzN5jqLZOeXHFsn/cF3wXEnNGpAAWzTC7WJgDlAqT6D
         x1ou+dly+sCS3LIpy7ebvY3l9nixnIGExYgM2HOLfXevsOohuri1gnk/bhqXNosIU9Zw
         v3rZ/siVlmH58D655J7vqgULp3R5H56AZPVqYi+PGq3hnO154fL8HbpFet+jYzG/4Ii6
         lIn/jD7riC/di0UQm0nXc4OMk4M/YSG2K9msWeaQhX6bBAOsQO8MLyfb+JlUFkWXHlkj
         gOPg==
X-Forwarded-Encrypted: i=1; AJvYcCXxAD15OFoMb9wgMXwBB4FnS5IJ2j9HiJCJVaEqw4KUYGxKjvWpvmZF3XuL+ouQ8HiOBbDVdqggV8Y9RLG9dw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUKupwKa5MjSLS3yz4o54U+CohG3GUddwDU7bNGlnXigBlIMd4
	MHigTO7uXYKmQ2jLJSuTPPraY87b++omUh13fEK2DWTUPzarBBQnle/E9HdKD6+ea/60VZ1RVOH
	gDSJZknt6PcVU8gFyg54QxAhSuC70B8s/Hqyb
X-Gm-Gg: ASbGncvlayjSDXpVcHGr9ZaDl744M1e9/tWd7m3mLhEBohVEH1MnE9iJ53ttbzVCiRD
	Rry2W8Z4iolJoRG0u25bohlH0b6HFKoTcY2pTKJ5Ojrg5VlIQn+oHrxFV0NcM9bkGIn7L/kAR+l
	Jqubxv
X-Google-Smtp-Source: AGHT+IGEFIX9HCNodJz+eHUM4Wmhs96ebBRzx6JXn2x4vSwzYYdzfr2PjAD+N+RuJFenL8Ba0FHl6/2HnZUv60fUzYk=
X-Received: by 2002:a5d:5847:0:b0:386:3082:ee2d with SMTP id
 ffacd0b85a97d-38bf57b7626mr22651937f8f.41.1737540151528; Wed, 22 Jan 2025
 02:02:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
 <20250121-cursor-between-v2-2-1b24cd377618@google.com> <Z5AOYbZGhgB19KzC@tardis.local>
In-Reply-To: <Z5AOYbZGhgB19KzC@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 22 Jan 2025 11:02:19 +0100
X-Gm-Features: AbW1kva-f1wcJlZ7OqS6VxCpNCq2B0MyA4dm29sxxZIvnpAyIEPdNCBUS1Id8Ss
Message-ID: <CAH5fLgi=WbkcAcqbZRozJP0XQvQLdAtihEMZz3Qzyf1MJbjHhQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rust: list: make the cursor point between elements
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 10:15=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Tue, Jan 21, 2025 at 10:14:24AM +0000, Alice Ryhl wrote:
> [...]
> > +/// References the element in the list next to the cursor.
> > +///
> > +/// # Invariants
> > +///
> > +/// * `ptr` is an element in `self.cursor.list`.
> > +/// * `ISNEXT =3D=3D (self.ptr =3D=3D self.cursor.next)`.
> > +pub struct CursorPeek<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: =
bool, const ID: u64> {
> > +    cursor: &'a mut Cursor<'b, T, ID>,
> > +    ptr: *mut ListLinksFields,
> > +}
> > +
> > +impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u=
64>
> > +    CursorPeek<'a, 'b, T, ISNEXT, ID>
> > +{
> > +    /// Remove the element from the list.
> >      pub fn remove(self) -> ListArc<T, ID> {
> > -        // SAFETY: The `current` pointer always points at a member of =
the list.
> > -        unsafe { self.list.remove_internal(self.current) }
> > +        if ISNEXT {
> > +            self.cursor.move_next();
> > +        }
> > +
> > +        // INVARIANT: `self.ptr` is not equal to `self.cursor.next` du=
e to the above `move_next`
> > +        // call.
> > +        // SAFETY: By the type invariants of `Self`, `next` is not nul=
l, so `next` is an element of
> > +        // `self.cursor.list` by the type invariants of `Cursor`.
> > +        unsafe { self.cursor.list.remove_internal(self.ptr) }
> > +    }
> > +
> > +    /// Access this value as an [`ArcBorrow`].
> > +    pub fn arc(&self) -> ArcBorrow<'_, T> {
> > +        // SAFETY: `self.ptr` points at an element in `self.cursor.lis=
t`.
> > +        let me =3D unsafe { T::view_value(ListLinks::from_fields(self.=
ptr)) };
> > +        // SAFETY:
> > +        // * All values in a list are stored in an `Arc`.
> > +        // * The value cannot be removed from the list for the duratio=
n of the lifetime annotated
> > +        //   on the returned `ArcBorrow`, because removing it from the=
 list would require mutable
> > +        //   access to the `CursorPeek`, the `Cursor` or the `List`. H=
owever, the `ArcBorrow` holds
> > +        //   an immutable borrow on the `CursorPeek`, which in turn ho=
lds a mutable borrow on the
> > +        //   `Cursor`, which in turn holds a mutable borrow on the `Li=
st`, so any such mutable
> > +        //   access requires first releasing the immutable borrow on t=
he `CursorPeek`.
> > +        // * Values in a list never have a `UniqueArc` reference, beca=
use the list has a `ListArc`
> > +        //   reference, and `UniqueArc` references must be unique.
> > +        unsafe { ArcBorrow::from_raw(me) }
> > +    }
> > +}
> > +
> > +impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u=
64> core::ops::Deref
> > +    for CursorPeek<'a, 'b, T, ISNEXT, ID>
> > +{
> > +    // This can't use `ArcBorrow<'a, T>` as the target type because 'a=
 is too long. It would let
> > +    // you obtain an `ArcBorrow<'a, T>` and then call `CursorPeek::rem=
ove` without giving up the
> > +    // `ArcBorrow<'a, T>`.
>
> I'm not sure whether we want to mention `ArcBorrow<'a, T>` here, because
> `ArcBorrow<'a, T>` is a (smart) pointer type, which should never be used
> as a `Deref::Target`, otherwise CursorPeek::deref() would return a
> &ArcBorrow<'a, T>, which doesn't make sense, and a bit challenging to
> implement I think?

A previous implementation of this struct used ArcBorrow as the type of
`self.ptr`, but I had to abandon that because it wasn't helpful. I
wrote this comment to document that I couldn't get it to work. I can
remove it if you don't think it's useful.

> > +    type Target =3D T;
> > +
> > +    fn deref(&self) -> &T {
> > +        // SAFETY: `self.ptr` points at an element in `self.cursor.lis=
t`.
> > +        let me =3D unsafe { T::view_value(ListLinks::from_fields(self.=
cursor.next)) };
>
> Shouldn't this be `self.ptr` instead of `self.cursor.next`?

Excellent point, thanks.

Alice
