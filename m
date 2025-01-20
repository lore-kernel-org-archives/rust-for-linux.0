Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE44918FDC8;
	Mon, 20 Jan 2025 11:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737374141; cv=none; b=IXe3ilA6ZcVOqQhYt8m2qIGiMslcMibz3BRUbdwIm6AQ4DWBMDGA1b6u5BExbeNIK3MPGaoirbq+GnKIv/xvyHP1HD0vzI30Vssla5yQBgJP7B6V3dF2pJ/dxPx6ISEkTQtxoVaEoK9uuocyKwaUAqv+O7yltP+cfXZUGu64Rrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737374141; c=relaxed/simple;
	bh=DLNstBoar4ifU31o+3NKdRHWKDc24VLMKho6RVtC0Nc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WKuVQY7c5i5aCuCvtTSRCN+xHVTAUqLpaO8L1vUGf6PCh495km73pGVhqqb+bZ/QPRVdsarCspqeg8RrmmFkfWdbLyLJDKE/rfm0TfIqql60Bvb6sUAjgpJ9ecvK8PftNiqGmJaLfqJgujTej7Jpf8xIJOZUrtvgeXAfA28qE2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L0cGhGOf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L0cGhGOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D87C4CEDD;
	Mon, 20 Jan 2025 11:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737374141;
	bh=DLNstBoar4ifU31o+3NKdRHWKDc24VLMKho6RVtC0Nc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=L0cGhGOfU6Fabaw/D0K9YACK20MU7whnuKClnOfa4heb0uDEl1UM/OJGyytg3vLO6
	 BjcyDIGbp0f3SwGL5XDwyzhvxWR7KGvK8X8L558xcyAf8N7d0wo6ltNkiR7raH2PVt
	 r3L1QRXvefjeE92nDDN1PtOXIEnpFwQPzDzAsCNH+5k0FmuWD0wH3IyY5XK/Om1WEB
	 KlkpxiaPbZ/YsE0GTooRsR9mpQ1rETfapXYc2JNs75m0MIJKnYmRC4aqs8cXtqOt+c
	 uWnDmqEjjVelfZSM1ZK5FtfRvCz89Kli82lFY9JFkH8eZGmsT4/QfxzO25P3HyTVjG
	 BlgyX6Ce2Z/cA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Alex Gaynor"
 <alex.gaynor@gmail.com>,  "Boqun Feng" <boqun.feng@gmail.com>,  "Gary Guo"
 <gary@garyguo.net>,  =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno
 Lossin" <benno.lossin@proton.me>,  "Trevor Gross" <tmgross@umich.edu>,
  <rust-for-linux@vger.kernel.org>,  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: list: make the cursor point between elements
In-Reply-To: <20241025-cursor-between-v1-1-08913714aae5@google.com> (Alice
	Ryhl's message of "Fri, 25 Oct 2024 13:36:29 +0000")
References: <RDzzJkrT7QOUu_FAcJyNOJx3ZW9gzDG7vi-z94_5G6YiTgp8yKUu_U4QYVyTXrzTi9eK4BIiANZ4LboxAchm-w==@protonmail.internalid>
	<20241025-cursor-between-v1-1-08913714aae5@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 12:55:31 +0100
Message-ID: <87h65tem30.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Alice,

This looks like a nice improvement!

"Alice Ryhl" <aliceryhl@google.com> writes:

> I've been using the linked list cursor for a few different things, and I
> find it inconvenient to use because all of the functions have signatures
> along the lines of `Self -> Option<Self>`. The root cause of these
> signatures is that the cursor points *at* an element, rather than
> *between* two elements.
>
> Thus, change the cursor API to point between two elements. This is
> inspired by the stdlib linked list (well, really by this guy [1]), which
> also uses cursors that point between elements.
>
> The `peek_*` methods returns a helper that lets you look at and
> optionally remove the element, as one common use-case of cursors is to
> iterate a list to look for an element, then remove that element.
>
> Another advantage is that this means you can now have a cursor into an
> empty list.
>
> Link: https://rust-unofficial.github.io/too-many-lists/sixth-cursors-intro.html [1]
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/list.rs | 325 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 231 insertions(+), 94 deletions(-)
>
> diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
> index fb93330f4af4..328d3e369d57 100644
> --- a/rust/kernel/list.rs
> +++ b/rust/kernel/list.rs
> @@ -245,8 +245,20 @@ pub fn is_empty(&self) -> bool {
>          self.first.is_null()
>      }
>
> -    /// Add the provided item to the back of the list.
> -    pub fn push_back(&mut self, item: ListArc<T, ID>) {
> +    /// Inserts `item` before `next` in the cycle.
> +    ///
> +    /// Returns a pointer to the newly inserted element. Never changes `self.first` unless the list
> +    /// is empty.
> +    ///
> +    /// # Safety
> +    ///
> +    /// * `next` must be an element in this list or null.
> +    /// * if `next` is null, then the list must be empty.
> +    unsafe fn insert_inner(
> +        &mut self,
> +        item: ListArc<T, ID>,
> +        next: *mut ListLinksFields,
> +    ) -> *mut ListLinksFields {
>          let raw_item = ListArc::into_raw(item);
>          // SAFETY:
>          // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
> @@ -259,16 +271,16 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
>          // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
>          let item = unsafe { ListLinks::fields(list_links) };
>
> -        if self.first.is_null() {
> -            self.first = item;
> +        // Check if the list is empty.
> +        if next.is_null() {
>              // SAFETY: The caller just gave us ownership of these fields.
>              // INVARIANT: A linked list with one item should be cyclic.
>              unsafe {
>                  (*item).next = item;
>                  (*item).prev = item;
>              }
> +            self.first = item;
>          } else {
> -            let next = self.first;
>              // SAFETY: By the type invariant, this pointer is valid or null. We just checked that
>              // it's not null, so it must be valid.
>              let prev = unsafe { (*next).prev };
> @@ -282,45 +294,24 @@ pub fn push_back(&mut self, item: ListArc<T, ID>) {
>                  (*next).prev = item;
>              }
>          }
> +
> +        item
>      }
>
> +    /// Add the provided item to the back of the list.
> +    pub fn push_back(&mut self, item: ListArc<T, ID>) {
> +        // SAFETY:
> +        // * `self.first` is null or in the list.
> +        // * `self.first` is only null if the list is empty.
> +        unsafe { self.insert_inner(item, self.first) };
> +    }
> +
>      /// Add the provided item to the front of the list.
>      pub fn push_front(&mut self, item: ListArc<T, ID>) {
> -        let raw_item = ListArc::into_raw(item);
> -        // SAFETY:
> -        // * We just got `raw_item` from a `ListArc`, so it's in an `Arc`.
> -        // * If this requirement is violated, then the previous caller of `prepare_to_insert`
> -        //   violated the safety requirement that they can't give up ownership of the `ListArc`
> -        //   until they call `post_remove`.
> -        // * We own the `ListArc`.
> -        // * Removing items] from this list is always done using `remove_internal_inner`, which
> -        //   calls `post_remove` before giving up ownership.
> -        let list_links = unsafe { T::prepare_to_insert(raw_item) };
> -        // SAFETY: We have not yet called `post_remove`, so `list_links` is still valid.
> -        let item = unsafe { ListLinks::fields(list_links) };
> -
> -        if self.first.is_null() {
> -            // SAFETY: The caller just gave us ownership of these fields.
> -            // INVARIANT: A linked list with one item should be cyclic.
> -            unsafe {
> -                (*item).next = item;
> -                (*item).prev = item;
> -            }
> -        } else {
> -            let next = self.first;
> -            // SAFETY: We just checked that `next` is non-null.
> -            let prev = unsafe { (*next).prev };
> -            // SAFETY: Pointers in a linked list are never dangling, and the caller just gave us
> -            // ownership of the fields on `item`.
> -            // INVARIANT: This correctly inserts `item` between `prev` and `next`.
> -            unsafe {
> -                (*item).next = next;
> -                (*item).prev = prev;
> -                (*prev).next = item;
> -                (*next).prev = item;
> -            }
> -        }
> -        self.first = item;
> +        // SAFETY:
> +        // * `self.first` is null or in the list.
> +        // * `self.first` is only null if the list is empty.
> +        self.first = unsafe { self.insert_inner(item, self.first) };
>      }
>
>      /// Removes the last item from this list.

This looks like a refactor of `push_front`, `push_back`. It looks like
it is unrelated to the cursor change. Can you split this out into a
separate patch?


> @@ -489,17 +480,21 @@ pub fn push_all_back(&mut self, other: &mut List<T, ID>) {
>          other.first = ptr::null_mut();
>      }
>
> -    /// Returns a cursor to the first element of the list.
> -    ///
> -    /// If the list is empty, this returns `None`.
> -    pub fn cursor_front(&mut self) -> Option<Cursor<'_, T, ID>> {
> -        if self.first.is_null() {
> -            None
> -        } else {
> -            Some(Cursor {
> -                current: self.first,
> -                list: self,
> -            })
> -        }
> -    }
> +    /// Returns a cursor that points before the first element of the list.
> +    pub fn cursor_front(&mut self) -> Cursor<'_, T, ID> {
> +        // INVARIANT: `self.first` is in this list.
> +        Cursor {
> +            next: self.first,
> +            list: self,
> +        }
> +    }
> +
> +    /// Returns a cursor that points after the last element in the list.
> +    pub fn cursor_back(&mut self) -> Cursor<'_, T, ID> {
> +        // INVARIANT: `next` is allowed to be null.
> +        Cursor {
> +            next: core::ptr::null_mut(),

I am slightly confused about why you need to track the beginning and end
of the list. The cursor movement operations circle have wrapping
semantics and the lists are circular. Could you remove some code by
using this property?

> +            list: self,
> +        }
> +    }
>
> @@ -579,69 +574,211 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
>
>  /// A cursor into a [`List`].
>  ///
> +/// A cursor always rests between two elements in the list. This means that a cursor has a previous
> +/// and next element, but no current element. It also means that it's possible to have a cursor
> +/// into an empty list.
> +///
>  /// # Invariants
>  ///
> -/// The `current` pointer points a value in `list`.
> +/// The `next` pointer is null or points a value in `list`.

Could you add an example of how to use this struct?

Unrelated, but since you are at it, could you update the safety comment
on first line in the `List::remove` function?


Best regards,
Andreas Hindborg


