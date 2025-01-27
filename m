Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D739B1FDA9C
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 10:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737974144; cv=none; b=rz8OvRUcA3KTIZyOkKQ8AUuL/FwwGXAYUFJ62haNQ6qQ8lbpdndb6GMbp8HVyyohjD+TV+06N5nzB0vFuPLq1XErvnTjZ9dUZfJje7qLoSHgTwI+I6mjFpsbsu1dkCTtwz/Pnx4NiOYx3vKUrLJwxgpHsc8idoNP2ye8ClZX0yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737974144; c=relaxed/simple;
	bh=NtY6ldB4NLGI5+e02ZgJDHqgCmmfYOhA/ZN09N5nPLI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J5Pofr+1hjph/0bVOZQGhRpvsIrmkf/lZOmDPv5hJp06a+YoMQUTUuFwY6Oote3yfWzIn3w09YqTh5Uwk8A36Gow1LduMKXEA5hRzTYBn61p9yDHZ7sOnBaHBeWXOpBMcBi+6lnKHdIDYW0V99LKqr2dkm3a0Jo9s3ND3VzajxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iFWuil4u; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iFWuil4u"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385e27c75f4so3753279f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 27 Jan 2025 02:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737974141; x=1738578941; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wIhBTIsutw57QfFZ2SGjDd9svh7V5giWJWT0xsJlZ+k=;
        b=iFWuil4uF27IW626Mk9jVbUC9XSB7MtwxwkV/e8hw/EZqYQ9p8ctwGnuwlYmqCDLsU
         LjpVwUetdSbdhyPywXBUtDHWbIjOapnt5PPEAtDH6RUAXxcfDPvejqW6EPDNEneWBwo2
         qqQ5q7TgqNosSfRxFGg6DOqy7hBlKCclmbIvWEpCQWmGjp/UYXpVQHRyiPVcMMgmtGlR
         rM7thrXS0i8NIwrDMSLpRi5EYIpGFKwmT19j/Bw05+8O6ioIEoaRLdvTyJAU+7YfkZuE
         dQeWrY/XaY8EZDx3RGhnkpPCKV0oLCQ95jHIpWjj9Bd47CskjAMbfIDeK8pQKq8HAEQk
         R47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737974141; x=1738578941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wIhBTIsutw57QfFZ2SGjDd9svh7V5giWJWT0xsJlZ+k=;
        b=bIbIT3+smXwBEJsKw0BgsuNhkRTSmHUYIEX+DhJLsTKaD6tr4v/pmYCpSrFmodG85C
         u+HBZCuljSf4ajPaKrJHZrprvTkBgQw8PNTF1IPPHXSF/rLJb9x4+3/PYlF5OY6jPbYa
         ijELwQNxrCu75KQh7av3bVSoIJeM1mvOusdQZL4K0LdEby8H/0aZuwctthnqilqNAjCZ
         oVt2P+kWyc5E+0bmwDZudcnr/YgukeCkhc7DUTlkPufFIpR2UyBZtDVLDfuXk3WiQzpT
         fZtfiwpmSFOtLnMzZa77U0i9CQhl26YCCxUZZLY/spgQG1uTy271IqRGMGRCrxIXb+K+
         fCiw==
X-Forwarded-Encrypted: i=1; AJvYcCUjlKvUKYLH2Gq9vq+ZG3q8LTil2KVyUCBKtRgBt5aeQhlT9JTFqneq0WQu3rxvZOqJA99d1DPHFMtgtSRsnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbOyPNcJPPLLd9RSyODDk6EPE+MwtEn/v5iahlTDa/POTrwHK
	IxMuCv22rXEXiOtcXLaEFxujhzMn837M7JblhsxAStyMgsfTGVjt+U88nAP2NknhIpp0D0yi24C
	QfA/cL7OV4jSvm/vWTkLbi/gMTP1bqgoXeTT/
X-Gm-Gg: ASbGncs6o+SYwdxjRDEs3Zy2FAu0M1DW1tcOQixW8XZ5AEtdyajhxmCBRoeuOPLupTr
	AQd0n0TyuwxlruwfNx11YycUXq1E7+CKQd8J5scSWH0i+qSSRm52cmHGTgX+HutkC14oZPJOE7J
	ZFQYUDPPDEYShKshui
X-Google-Smtp-Source: AGHT+IEPg+IFkuH+X10bMyjZjiwpsTREWQ8/+zyQ6XYJalXLNqw3NJ6lY2v/odFxmCzECpdjw2gSWWBT4j5bTi4gfA8=
X-Received: by 2002:a5d:64eb:0:b0:385:df4e:3645 with SMTP id
 ffacd0b85a97d-38bf59ecb69mr39892433f8f.50.1737974140884; Mon, 27 Jan 2025
 02:35:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123-cursor-between-v4-0-cb06698db94c@google.com>
 <20250123-cursor-between-v4-2-cb06698db94c@google.com> <Z5K4fPgPBNOJaJGl@boqun-archlinux>
In-Reply-To: <Z5K4fPgPBNOJaJGl@boqun-archlinux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 27 Jan 2025 11:35:29 +0100
X-Gm-Features: AWEUYZk9m-sUNx_RYBqeLtN6cEURq66SoLyi-nrQycqBtNNo_ExM85Z3KzncL6s
Message-ID: <CAH5fLgjZEoHheUYfcb4QkgRMyy5MLz=60YrQd_Fa6O0LH1-Rgw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] rust: list: make the cursor point between elements
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 10:46=E2=80=AFPM Boqun Feng <boqun.feng@gmail.com> =
wrote:
>
> On Thu, Jan 23, 2025 at 11:01:09AM +0000, Alice Ryhl wrote:
> [...]
> >
> >  /// A cursor into a [`List`].
> >  ///
> > +/// A cursor always rests between two elements in the list. This means=
 that a cursor has a previous
> > +/// and next element, but no current element. It also means that it's =
possible to have a cursor
> > +/// into an empty list.
> > +///
> > +/// # Examples
> > +///
> > +/// ```
> > +/// use kernel::prelude::*;
> > +/// use kernel::list::{List, ListArc, ListLinks};
> > +///
> > +/// #[pin_data]
> > +/// struct ListItem {
> > +///     value: u32,
> > +///     #[pin]
> > +///     links: ListLinks,
> > +/// }
> > +///
> > +/// impl ListItem {
> > +///     fn new(value: u32) -> Result<ListArc<Self>> {
> > +///         ListArc::pin_init(try_pin_init!(Self {
> > +///             value,
> > +///             links <- ListLinks::new(),
> > +///         }), GFP_KERNEL)
> > +///     }
> > +/// }
> > +///
> > +/// kernel::list::impl_has_list_links! {
> > +///     impl HasListLinks<0> for ListItem { self.links }
> > +/// }
> > +/// kernel::list::impl_list_arc_safe! {
> > +///     impl ListArcSafe<0> for ListItem { untracked; }
> > +/// }
> > +/// kernel::list::impl_list_item! {
> > +///     impl ListItem<0> for ListItem { using ListLinks; }
> > +/// }
> > +///
> > +/// // Use a cursor to remove the first element with the given value.
> > +/// fn remove_first(list: &mut List<ListItem>, value: u32) -> Option<L=
istArc<ListItem>> {
> > +///     let mut cursor =3D list.cursor_front();
> > +///     while let Some(next) =3D cursor.peek_next() {
> > +///         if next.value =3D=3D value {
> > +///             return Some(next.remove());
> > +///         }
> > +///         cursor.move_next();
> > +///     }
> > +///     None
> > +/// }
> > +///
> > +/// // Use a cursor to remove all elements with the given value. The r=
emoved elements are moved to
> > +/// // a new list.
> > +/// fn remove_all(list: &mut List<ListItem>, value: u32) -> List<ListI=
tem> {
> > +///     let mut out =3D List::new();
> > +///     let mut cursor =3D list.cursor_front();
> > +///     while let Some(next) =3D cursor.peek_next() {
> > +///         if next.value =3D=3D value {
> > +///             out.push_back(next.remove());
> > +///         } else {
> > +///             cursor.move_next();
> > +///         }
> > +///     }
> > +///     out
> > +/// }
> > +///
> > +/// // Use a cursor to insert a value at a specific index. Returns an =
error if the index is out of
> > +/// // bounds.
> > +/// fn insert_at(list: &mut List<ListItem>, new: ListArc<ListItem>, id=
x: usize) -> Result {
> > +///     let mut cursor =3D list.cursor_front();
> > +///     for _ in 0..idx {
> > +///         if !cursor.move_next() {
> > +///             return Err(EINVAL);
> > +///         }
> > +///     }
> > +///     cursor.insert_next(new);
> > +///     Ok(())
> > +/// }
> > +///
> > +/// // Merge two sorted lists into a single sorted list.
> > +/// fn merge_sorted(list: &mut List<ListItem>, merge: List<ListItem>) =
{
> > +///     let mut cursor =3D list.cursor_front();
> > +///     for to_insert in merge {
> > +///         while let Some(next) =3D cursor.peek_next() {
> > +///             if to_insert.value < next.value {
> > +///                 break;
> > +///             }
> > +///             cursor.move_next();
> > +///         }
> > +///         cursor.insert_prev(to_insert);
> > +///     }
> > +/// }
> > +///
> > +/// let mut list =3D List::new();
> > +/// list.push_back(ListItem::new(14)?);
> > +/// list.push_back(ListItem::new(12)?);
> > +/// list.push_back(ListItem::new(10)?);
> > +/// list.push_back(ListItem::new(12)?);
> > +/// list.push_back(ListItem::new(14)?);
> > +/// assert_eq!(remove_all(&mut list, 12).iter().count(), 2);
> > +/// // [14, 10, 14]
> > +/// assert!(remove_first(&mut list, 14).is_some());
> > +/// // [10, 14]
> > +/// insert_at(&mut list, ListItem::new(12)?, 1)?;
> > +/// // [10, 12, 14]
> > +///
> > +/// let mut list2 =3D List::new();
> > +/// list.push_back(ListItem::new(11)?);
> > +/// list.push_back(ListItem::new(13)?);
>
> These need to be `list2` instead of `list`, otherwise the doctest will
> fail.
>
> > +/// merge_sorted(&mut list, list2);
> > +///
> > +/// let mut items =3D list.into_iter();
> > +/// assert_eq!(items.next().unwrap().value, 10);
> > +/// assert_eq!(items.next().unwrap().value, 11);
> > +/// assert_eq!(items.next().unwrap().value, 12);
> > +/// assert_eq!(items.next().unwrap().value, 13);
> > +/// assert_eq!(items.next().unwrap().value, 14);
> > +/// assert!(items.next().is_none());
> > +/// # Result::<(), Error>::Ok(())
> > +/// ```
> > +///
> >  /// # Invariants
> >  ///
> > -/// The `current` pointer points a value in `list`.
> > +/// The `next` pointer is null or points a value in `list`.
> >  pub struct Cursor<'a, T: ?Sized + ListItem<ID>, const ID: u64 =3D 0> {
> > -    current: *mut ListLinksFields,
> >      list: &'a mut List<T, ID>,
> > +    /// Points at the element after this cursor, or null if the cursor=
 is after the last element.
> > +    next: *mut ListLinksFields,
> >  }
> >
> [...]
>
> While we are at it, could you also add a doc test that uses
> `cursor_back()` and `move_prev()`? Something like below, that would
> show (and at least test a bit on) the API for another direction.
>
> With all these, feel free to add:
>
> Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Done, thanks!

Alice
