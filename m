Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8075013D520;
	Thu, 23 Jan 2025 21:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737668764; cv=none; b=oGR0yKVDoaFE3NkKTZVev+DX1utxK/80wHffXjZ82RUY8jtrX2oSKsg/2lungUTYyjpnxQZrngURfPV1/7IiqSXLKH5QhcIr69hhlHeAQeO2FxzwjxTobPcO0PvdrtExYUnw0dZbcliVtydCKDKU/EruJqFXE9r8FY11/FeG9w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737668764; c=relaxed/simple;
	bh=y5eF/K0+/hojvltq27evvDsMsqnvvq4kFfavfyHxtoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWbPyEnbPNN/ftZRN8Xxu7z6a447SY9cMA5dYVKHwqhYzReeYra2V6GmZhmT7sa2Id2dGWV+gPZcAbhn2E/Ae1anoz2Jl4Iv2lkbWddROkv2u3JhLQw97wLkpeDvwWvlC6shaRdYHM0jsHxX6TnXaQl2gzM6OWFN6u6/XEM4/9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mz/sTc8r; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mz/sTc8r"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-467b74a1754so18278331cf.1;
        Thu, 23 Jan 2025 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737668761; x=1738273561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVopTBLXf87An8r3KCRn3GUfCCRBGgnBO699daZmpbM=;
        b=mz/sTc8rBdlHWrLlNnzVv41VAb+ATUP9xkIe9yV1y/A3O28qdNh3QrPX/6YapOe+Xq
         7T23FZ3DwjypYDdc6fu1/pTZM5X8Rq52rMOA0ujWVBt9M3+DAGOlCGQRmj/3GF9hBsa4
         090uqXhYNcHqP2DOwQZURRp1dd5X9iYdGkMbL2FjUhST6Gbo06TrPpz6uYT2wh1JQINb
         WTmq+smZ5tSkPTdklLisuMiMWXZ6qpVW6X02tsFv9NUXpE5Y72hwH2LYeIfURFGyjKC+
         NT6iAzmcrKsYdy0LzXVQn5GAcBy0oAqK0OSByWohfg0ftIvGbUKGIhACHvJFEsYOSEzC
         IUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737668761; x=1738273561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVopTBLXf87An8r3KCRn3GUfCCRBGgnBO699daZmpbM=;
        b=USk4nHl8jdXNkXA7hj3kAFqftF6Vm7Usxrqk58C/WK4bdPKRN7QC5kfCOPB+jFAIJs
         j4wUbjHevKycwQoz1hTzATD2IBpmW58RJpalaADStVv63DDmiKqYAsAR/VyOFhrBn+Nf
         8piKUgtO+IOabdxjr3z/p3WlffhrbfNH4KE7O3hqPULHyW2Nv89129c1fX2X+en4Ov8M
         Y7Ntzowfl2L1y8t7yBEE8c4Zp/2tWg8QvtFPheYOBTNgkr7NC/Rx4yYwV6bFmay71Fvz
         46h2sVmG/r2quFjdDqYCg4tWWm+kfiVGfI+VEsHdxP6kulI5Uv7PYEjru4gAhfmSmrJY
         q5Nw==
X-Forwarded-Encrypted: i=1; AJvYcCU6T57MsfARROWB8d6TVOv9JFY5/4GZVMn+f5rYi+E3yIEZ6xBbmXbUqGHupUMzJIwP5xtm1byo26AnEzM=@vger.kernel.org, AJvYcCUQeNDBnDAMaFfyYXuMb9INIV/AcG1r+o0y0BSIjHo8nuczQ1akPIdBw8qwzp3ZjNJUDRN3CgDgWOFXx0b9pR8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLwiErhwB2ht1AX1qYxaNGc0ywXsBfZDXxaFp8o/oWq49ID13
	JpzxQ8ze864pTU/Kn3KL9OohOIt1xDXDSBSoVpzGcX4nAiUeJvgH
X-Gm-Gg: ASbGnctqgmBLp6fPNrH9qW1x5EEeoasKHK/lnD89SQVmygpX1MscWdVjsv8BUVJFtIr
	peemY0IminM9/bnZ7uWz/j4a0Nt5IJYNQKFhfHbtjQSTwvzPKDdDKAYjcyTUg9EgMyXUbg5J9DJ
	cdpr9HFTs0h59782YFMVF9iSwbLqo+qkNTUvkj6J4qn/l55shmddw2W+9mijWTG2tE8GN8KzVgc
	f5GJ21mkPGGIAhZdxD+raonPfrkmRkOP58R7eHIxz3FuY4QgxFl7Y/KsZ6q11aePlm6cSPPeGgM
	PrHIITXhywgfyp+nwVueL7BDBcrNIFsDC+Se6b42SpF0Eo+na6Ztr+bxXttKS3Qzb2RhEoM=
X-Google-Smtp-Source: AGHT+IEQIRglpngjQXaG5414+TCo1Ieiy7HbLKFMH4Mzz4H2386i0EKt5e2a7N2fRtZaXQRBJ6iKoQ==
X-Received: by 2002:a05:622a:1a18:b0:465:3a62:a8f9 with SMTP id d75a77b69052e-46e12bdd8camr481391711cf.50.1737668761167;
        Thu, 23 Jan 2025 13:46:01 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2057a8f5bsm2526226d6.83.2025.01.23.13.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 13:46:00 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0E6C01200068;
	Thu, 23 Jan 2025 16:46:00 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Thu, 23 Jan 2025 16:46:00 -0500
X-ME-Sender: <xms:l7iSZ_3rRkIi6NfMr1Dtvk_yVbnUVLR1LztZGyPIq8ZFJOeUIaWESg>
    <xme:l7iSZ-HkaSuSO9Nx-8nfI8OjySYoCtp57mBsRHPmr8dSpezz04LzGVzcUqngW5NPL
    _5uyOy_KQlnVcDzsg>
X-ME-Received: <xmr:l7iSZ_7xhLR0OZgJZdFhRM-db5E94MDtU5lmHRcj6KIQxE-gga9fgv16x34>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvdejjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    rghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesgh
    grrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhm
    rghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrd
    hmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepthhmghhrohhsshesuhhmihgthhdrvgguuhdprhgtphhtthhopehruhhsthdqfh
    horhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:l7iSZ02pEO3_rQS_cuw6V9yzRpPsNgReJiHfchOMbyd-t0W0Lk_86Q>
    <xmx:l7iSZyEIc_0jKmlqYsvGls8ugkA288AQLUYtcUY2OfR3coqgRRt3bQ>
    <xmx:l7iSZ1-4muAM6vlyLwIDagF0iV9tYJ95Q-mVoyVsVZYtEIG6eYps1w>
    <xmx:l7iSZ_lrt2-ee4tq1jiPS62J2EaN2GpZX3wdXCX6pI0Y929Y7Msx-w>
    <xmx:mLiSZ-F7V9yw1rKD8hdJ1HwN1AlI0ItZK95BS2I7B2OVGFh8D6oNt2KX>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 16:45:59 -0500 (EST)
Date: Thu, 23 Jan 2025 13:45:32 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] rust: list: make the cursor point between elements
Message-ID: <Z5K4fPgPBNOJaJGl@boqun-archlinux>
References: <20250123-cursor-between-v4-0-cb06698db94c@google.com>
 <20250123-cursor-between-v4-2-cb06698db94c@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250123-cursor-between-v4-2-cb06698db94c@google.com>

On Thu, Jan 23, 2025 at 11:01:09AM +0000, Alice Ryhl wrote:
[...]
>  
>  /// A cursor into a [`List`].
>  ///
> +/// A cursor always rests between two elements in the list. This means that a cursor has a previous
> +/// and next element, but no current element. It also means that it's possible to have a cursor
> +/// into an empty list.
> +///
> +/// # Examples
> +///
> +/// ```
> +/// use kernel::prelude::*;
> +/// use kernel::list::{List, ListArc, ListLinks};
> +///
> +/// #[pin_data]
> +/// struct ListItem {
> +///     value: u32,
> +///     #[pin]
> +///     links: ListLinks,
> +/// }
> +///
> +/// impl ListItem {
> +///     fn new(value: u32) -> Result<ListArc<Self>> {
> +///         ListArc::pin_init(try_pin_init!(Self {
> +///             value,
> +///             links <- ListLinks::new(),
> +///         }), GFP_KERNEL)
> +///     }
> +/// }
> +///
> +/// kernel::list::impl_has_list_links! {
> +///     impl HasListLinks<0> for ListItem { self.links }
> +/// }
> +/// kernel::list::impl_list_arc_safe! {
> +///     impl ListArcSafe<0> for ListItem { untracked; }
> +/// }
> +/// kernel::list::impl_list_item! {
> +///     impl ListItem<0> for ListItem { using ListLinks; }
> +/// }
> +///
> +/// // Use a cursor to remove the first element with the given value.
> +/// fn remove_first(list: &mut List<ListItem>, value: u32) -> Option<ListArc<ListItem>> {
> +///     let mut cursor = list.cursor_front();
> +///     while let Some(next) = cursor.peek_next() {
> +///         if next.value == value {
> +///             return Some(next.remove());
> +///         }
> +///         cursor.move_next();
> +///     }
> +///     None
> +/// }
> +///
> +/// // Use a cursor to remove all elements with the given value. The removed elements are moved to
> +/// // a new list.
> +/// fn remove_all(list: &mut List<ListItem>, value: u32) -> List<ListItem> {
> +///     let mut out = List::new();
> +///     let mut cursor = list.cursor_front();
> +///     while let Some(next) = cursor.peek_next() {
> +///         if next.value == value {
> +///             out.push_back(next.remove());
> +///         } else {
> +///             cursor.move_next();
> +///         }
> +///     }
> +///     out
> +/// }
> +///
> +/// // Use a cursor to insert a value at a specific index. Returns an error if the index is out of
> +/// // bounds.
> +/// fn insert_at(list: &mut List<ListItem>, new: ListArc<ListItem>, idx: usize) -> Result {
> +///     let mut cursor = list.cursor_front();
> +///     for _ in 0..idx {
> +///         if !cursor.move_next() {
> +///             return Err(EINVAL);
> +///         }
> +///     }
> +///     cursor.insert_next(new);
> +///     Ok(())
> +/// }
> +///
> +/// // Merge two sorted lists into a single sorted list.
> +/// fn merge_sorted(list: &mut List<ListItem>, merge: List<ListItem>) {
> +///     let mut cursor = list.cursor_front();
> +///     for to_insert in merge {
> +///         while let Some(next) = cursor.peek_next() {
> +///             if to_insert.value < next.value {
> +///                 break;
> +///             }
> +///             cursor.move_next();
> +///         }
> +///         cursor.insert_prev(to_insert);
> +///     }
> +/// }
> +///
> +/// let mut list = List::new();
> +/// list.push_back(ListItem::new(14)?);
> +/// list.push_back(ListItem::new(12)?);
> +/// list.push_back(ListItem::new(10)?);
> +/// list.push_back(ListItem::new(12)?);
> +/// list.push_back(ListItem::new(14)?);
> +/// assert_eq!(remove_all(&mut list, 12).iter().count(), 2);
> +/// // [14, 10, 14]
> +/// assert!(remove_first(&mut list, 14).is_some());
> +/// // [10, 14]
> +/// insert_at(&mut list, ListItem::new(12)?, 1)?;
> +/// // [10, 12, 14]
> +///
> +/// let mut list2 = List::new();
> +/// list.push_back(ListItem::new(11)?);
> +/// list.push_back(ListItem::new(13)?);

These need to be `list2` instead of `list`, otherwise the doctest will
fail.

> +/// merge_sorted(&mut list, list2);
> +///
> +/// let mut items = list.into_iter();
> +/// assert_eq!(items.next().unwrap().value, 10);
> +/// assert_eq!(items.next().unwrap().value, 11);
> +/// assert_eq!(items.next().unwrap().value, 12);
> +/// assert_eq!(items.next().unwrap().value, 13);
> +/// assert_eq!(items.next().unwrap().value, 14);
> +/// assert!(items.next().is_none());
> +/// # Result::<(), Error>::Ok(())
> +/// ```
> +///
>  /// # Invariants
>  ///
> -/// The `current` pointer points a value in `list`.
> +/// The `next` pointer is null or points a value in `list`.
>  pub struct Cursor<'a, T: ?Sized + ListItem<ID>, const ID: u64 = 0> {
> -    current: *mut ListLinksFields,
>      list: &'a mut List<T, ID>,
> +    /// Points at the element after this cursor, or null if the cursor is after the last element.
> +    next: *mut ListLinksFields,
>  }
>  
[...]

While we are at it, could you also add a doc test that uses
`cursor_back()` and `move_prev()`? Something like below, that would
show (and at least test a bit on) the API for another direction.

With all these, feel free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

Regards,
Boqun

------>8
diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index b83016e5bcd9..2d38fbaf94e3 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -625,6 +625,18 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 ///     None
 /// }
 ///
+/// // Use a cursor to remove the last element with the given value.
+/// fn remove_last(list: &mut List<ListItem>, value: u32) -> Option<ListArc<ListItem>> {
+///     let mut cursor = list.cursor_back();
+///     while let Some(prev) = cursor.peek_prev() {
+///         if prev.value == value {
+///             return Some(prev.remove());
+///         }
+///         cursor.move_prev();
+///     }
+///     None
+/// }
+///
 /// // Use a cursor to remove all elements with the given value. The removed elements are moved to
 /// // a new list.
 /// fn remove_all(list: &mut List<ListItem>, value: u32) -> List<ListItem> {
@@ -672,12 +684,15 @@ fn next(&mut self) -> Option<ArcBorrow<'a, T>> {
 /// list.push_back(ListItem::new(12)?);
 /// list.push_back(ListItem::new(10)?);
 /// list.push_back(ListItem::new(12)?);
+/// list.push_back(ListItem::new(15)?);
 /// list.push_back(ListItem::new(14)?);
 /// assert_eq!(remove_all(&mut list, 12).iter().count(), 2);
-/// // [14, 10, 14]
+/// // [14, 10, 15, 14]
 /// assert!(remove_first(&mut list, 14).is_some());
+/// // [10, 15, 14]
+/// assert!(remove_last(&mut list, 15).is_some());
 /// // [10, 14]
 /// insert_at(&mut list, ListItem::new(12)?, 1)?;
 /// // [10, 12, 14]
 ///
 /// let mut list2 = List::new();
