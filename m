Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71743194C78;
	Mon, 20 Jan 2025 21:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737407556; cv=none; b=f13khGqGVuhWYgUdy+ZQxqUvQIeRiIzL6RgBc533R9CLiYOIku9RECXIPH0rxrYLW0e4VJ8sK5KCgSts1khpS5/GtlqdBijVZiZUzGE63RSJ7vzhaazW7WjutnqRprixWFsYg1QWkRiW+Ki3NOKz3O5BwEm9OXOV7jYU9rsC8eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737407556; c=relaxed/simple;
	bh=uA2mcFGE2BXe/wlaVePIRvc8grkqEAcaX1YhNCFEbeI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qBO46k3fGgI2urjDdoFwBzKCVvHwwFNxiiNWm0HqZE5YdUuvW2o03jzLTjX9wXSQY4CjA7tc69J6J44hJHJwBJSue3l7KeOnpf2T+PJ5oGux+8CBIUnrPb0eQCLgK+li6/ZGwYyHIdjZLxbFvfE0bx9t3Wyq19dlQHv0OF+MHNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkXnTOU7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkXnTOU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88500C4CEE0;
	Mon, 20 Jan 2025 21:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737407555;
	bh=uA2mcFGE2BXe/wlaVePIRvc8grkqEAcaX1YhNCFEbeI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PkXnTOU7Uf4eX6U047y9iSf8+/aoso12sNwBj4RKiUp3paDNNLAqK+8RjUzrIG3of
	 T1vg70IweFBPUgqZmZKdjQBuI49CTLWWSorwnZSstQ+CgwgI+LwabuGeZniZ83/siP
	 sJrnEZngKB8e18mgMK6aW2AkWbXZSbyFj8qBWUlvflB1B6r/0FwJTj2bU5T6rlwyRy
	 qKhIIwI9UdoBYfmEp5tzEuBNKCUgc6WX3DfYu6QYP2Fay3PZp9rKP3DOhZO2OxEgLL
	 h78dlBWb2huzkYGsi5BhGVKN18R6e4kMk4rx4PV86O17R6LHSxKYOcxACBv+QUEUZe
	 cQS036UyGo+VA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: list: make the cursor point between elements
In-Reply-To: <CAH5fLginoFU38HbRjtOY8wAOo9uu5LJD7AKzduRkL0RcT6BUvw@mail.gmail.com>
 (Alice
	Ryhl's message of "Mon, 20 Jan 2025 16:52:50 +0100")
References: <RDzzJkrT7QOUu_FAcJyNOJx3ZW9gzDG7vi-z94_5G6YiTgp8yKUu_U4QYVyTXrzTi9eK4BIiANZ4LboxAchm-w==@protonmail.internalid>
	<20241025-cursor-between-v1-1-08913714aae5@google.com>
	<87h65tem30.fsf@kernel.org>
	<5HvNJ52WD0CL3uj4M1EHoKipDiKw0B-3tbEAGI_KFSmgvt5hyLWPPDTKHoKWYGk4y_BYjEyppWUpJW6AfSyVPA==@protonmail.internalid>
	<CAH5fLginoFU38HbRjtOY8wAOo9uu5LJD7AKzduRkL0RcT6BUvw@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 22:12:21 +0100
Message-ID: <877c6pchqi.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

"Alice Ryhl" <aliceryhl@google.com> writes:

> On Mon, Jan 20, 2025 at 12:55=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
>>
>> Hi Alice,
>>
>> This looks like a nice improvement!
>
> Thanks!
>
>> This looks like a refactor of `push_front`, `push_back`. It looks like
>> it is unrelated to the cursor change. Can you split this out into a
>> separate patch?
>
> I don't think it's unrelated. It extracts out common code that
> previously only push_front/push_back have, but that the cursor now
> also needs. Of course, it could still make sense to extract
> insert_inner out in a separate patch.

I think that would make sense.

>
>> > @@ -489,17 +480,21 @@ pub fn push_all_back(&mut self, other: &mut List=
<T, ID>) {
>> >          other.first =3D ptr::null_mut();
>> >      }
>> >
>> > -    /// Returns a cursor to the first element of the list.
>> > -    ///
>> > -    /// If the list is empty, this returns `None`.
>> > -    pub fn cursor_front(&mut self) -> Option<Cursor<'_, T, ID>> {
>> > -        if self.first.is_null() {
>> > -            None
>> > -        } else {
>> > -            Some(Cursor {
>> > -                current: self.first,
>> > -                list: self,
>> > -            })
>> > -        }
>> > -    }
>> > +    /// Returns a cursor that points before the first element of the =
list.
>> > +    pub fn cursor_front(&mut self) -> Cursor<'_, T, ID> {
>> > +        // INVARIANT: `self.first` is in this list.
>> > +        Cursor {
>> > +            next: self.first,
>> > +            list: self,
>> > +        }
>> > +    }
>> > +
>> > +    /// Returns a cursor that points after the last element in the li=
st.
>> > +    pub fn cursor_back(&mut self) -> Cursor<'_, T, ID> {
>> > +        // INVARIANT: `next` is allowed to be null.
>> > +        Cursor {
>> > +            next: core::ptr::null_mut(),
>>
>> I am slightly confused about why you need to track the beginning and end
>> of the list. The cursor movement operations circle have wrapping
>> semantics and the lists are circular. Could you remove some code by
>> using this property?
>
> I think the current API is much more intuitive. Yes, the list is
> implemented in a circular manner, but you're not intended to think of
> it that way. The linked list is a list of elements. With elements ABC
> and cursors pointing between them, it makes sense that the cursor can
> be |ABC, A|BC, AB|C, ABC|. In each case, you can add an element before
> or after the cursor. To iterate the list, you keep calling `move_next`
> until `next` returns `None`. That also makes sense. If the cursor
> becomes circular, then you iterate by calling `next` until the next
> element is the first element? Seems confusing to me.

You might be right. But then again, in your patch the cursor _does_ wrap to=
 the front
when it is at the end. If we did not treat beginning and end as two
separate states, we could remove a lot of edge case checks, see below.

In your experience using the API, did you use the feature that
`move_next` will wrap to the front? If the cursor is circular, maybe
`move_next` and `move_prev` should should be no-ops when the cursor is
in edge positions?

With a circular cursor, you would need to compare to first or last as to
break an iteration loop. I think that is how the C API works.

With a circular cursor it would be something like this

let mut c =3D list.cursor_front();
let last =3D c.peek_prev();
loop {
  let el =3D c.peek_next();
  // Do stuff
  if el =3D=3D last {
    break;
  }
}

For a non-circular cursor

let mut c =3D list.cursor_front();
loop {
  let el =3D c.peek_next();
  if el.is_none() {
    break
  }
  // Do stuff
  c.move_next();
}

Not too much difference?


diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index 328d3e369d571..e1d0608e66dc8 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -589,26 +589,15 @@ pub struct Cursor<'a, T: ?Sized + ListItem<ID>, const=
 ID: u64 =3D 0> {
=20
 impl<'a, T: ?Sized + ListItem<ID>, const ID: u64> Cursor<'a, T, ID> {
     /// Returns a pointer to the element before the cursor.
-    ///
-    /// Returns null if there is no element before the cursor.
     fn prev_ptr(&self) -> *mut ListLinksFields {
-        let mut next =3D self.next;
-        let first =3D self.list.first;
-        if next =3D=3D first {
-            // We are before the first element.
-            return core::ptr::null_mut();
-        }
-
-        if next.is_null() {
-            // We are after the last element, so we need a pointer to the =
last element, which is
-            // the same as `(*first).prev`.
-            next =3D first;
+        if self.next.is_null() {
+            return self.next;
         }
=20
         // SAFETY: `next` can't be null, because then `first` must also be=
 null, but in that case
         // we would have exited at the `next =3D=3D first` check. Thus, `n=
ext` is an element in the
         // list, so we can access its `prev` pointer.
-        unsafe { (*next).prev }
+        unsafe { (*self.next).prev }
     }
=20
     /// Access the element after this cursor.
@@ -648,8 +637,6 @@ pub fn peek_prev(&mut self) -> Option<CursorPeek<'_, 'a=
, T, false, ID>> {
     /// If the cursor is after the last element, then the cursor will move=
 back to the beginning.
     pub fn move_next(&mut self) {
         if self.next.is_null() {
-            // INVARIANT: `list.first` is in the list or null.
-            self.next =3D self.list.first;
             return;
         }
=20
@@ -657,10 +644,6 @@ pub fn move_next(&mut self) {
         // access the `next` field.
         let mut next =3D unsafe { (*self.next).next };
=20
-        if next =3D=3D self.list.first {
-            next =3D core::ptr::null_mut();
-        }
-
         // INVARIANT: `next` is either null or the next element after an e=
lement in the list.
         self.next =3D next;
     }
@@ -670,24 +653,13 @@ pub fn move_next(&mut self) {
     /// If the cursor is before the first element, then the cursor will mo=
ve to the end of the
     /// list.
     pub fn move_prev(&mut self) {
-        if self.next =3D=3D self.list.first {
-            // We are before the first element, so move the cursor after t=
he last element.
-            // INVARIANT: `next` can be a null pointer.
-            self.next =3D core::ptr::null_mut();
-            return;
-        }
-
         // INVARIANT: `prev_ptr()` always returns a pointer that is null o=
r in the list.
         self.next =3D self.prev_ptr();
     }
=20
     /// Inserts an element where the cursor is pointing and get a pointer =
to the new element.
     fn insert_inner(&mut self, item: ListArc<T, ID>) -> *mut ListLinksFiel=
ds {
-        let ptr =3D if self.next.is_null() {
-            self.list.first
-        } else {
-            self.next
-        };
+        let ptr =3D self.next;
         // SAFETY:
         // * `ptr` is an element in the list or null.
         // * if `ptr` is null, then `self.list.first` is null so the list =
is empty.




Best regards,
Andreas Hindborg


