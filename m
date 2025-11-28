Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169A1134AB;
	Fri, 28 Nov 2025 18:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764355251; cv=pass; b=aPPoclkAgsRT9WoOxqXESV/pp2uwOdXftjBsktkTuz1KUB9rMRMZlNO7GEUZCcNFujK+AmrLN4vaeVjbZeLw4q751Yd9TPt5rKTF4Oz83Pj83ZXll1Xtkzmadi7CoHxCTThXiqDQCc4EQEQO/oFziiK1+gKPe8cNWFmwXNbgUvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764355251; c=relaxed/simple;
	bh=U9Hi259o6P/VifqnNSDOStKGTTzGR6eX/T2Uo8N9bV8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=h8q98Q403wRUapTPwHwPjm4e2f7s5h8rMRRBp6xxm02ISStOhKgI8FyO2ZpKF3Wuhw3DOS6K8PrnPsYnyoM2NIN7XvthmUfnhPeLxDTniLq9c9J13JE7EVJ9rBOUI39PpjNH4AeEfuwf2KuQILBCidPxtPJJF2UGegbFZ4AG7EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=M4HdlLVU; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="M4HdlLVU"
ARC-Seal: i=1; a=rsa-sha256; t=1764355217; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OEIJOXhtmCYwjL2AWjdrgY1Ck1mKp9UbXvkz0IGFfmikxbERpbmQz1Hj6vbM0j5894VOiIopCiLIVaCUNG+9H0OJqwJlQv1CTHmtQPQ8jdDyF7BX4u1GgjvJtnYS9qKJWlJRD4we0qONoVxtbM+RpNqQPAW7ZtTbsoLGQVa5Lvo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1764355217; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VR+yiO3OWi0XsRfpnPpRnWQXdDB0FkkL51pJMt1kvPA=; 
	b=WPfzojSt6eHb+NjLs/GsF4Q3r5Aez2A924a0UtLU/r4vNA9agSv4oeVhd3EJffWzbp4yJobS/vEOzcVAUIW/XUcgD03q/F9oTn85oAJ8KH0JUbbwkNzVhhR0JdK9kZFRh9D9yp/hj5QIuirvpyz2B3rrKWWptfYJczvokqbTZ18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1764355217;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=VR+yiO3OWi0XsRfpnPpRnWQXdDB0FkkL51pJMt1kvPA=;
	b=M4HdlLVU16sdmspLHh9gR3PwykRN0zRZhFGkmibeRWGkESUuOVNiWTD2yaFY64bo
	+GmIddOnwq4u8KUpi4IL3hsBjeCwCHvCh47zTPMtHUX2EXCMipTQjoSDmacMgXG3xdR
	gRY53yt97RWLuTasbrhwNgQeeAzAXVOMqaiQNCgY=
Received: by mx.zohomail.com with SMTPS id 1764355214305840.4028854983251;
	Fri, 28 Nov 2025 10:40:14 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 2/3] rust: clist: Add basic list infrastructure and
 head iterator
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20251111171315.2196103-2-joelagnelf@nvidia.com>
Date: Fri, 28 Nov 2025 15:39:58 -0300
Cc: linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 dakr@kernel.org,
 airlied@gmail.com,
 acourbot@nvidia.com,
 apopple@nvidia.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com,
 mripard@kernel.org,
 tzimmermann@suse.de,
 jhubbard@nvidia.com,
 ttabi@nvidia.com,
 joel@joelfernandes.org,
 elle@weathered-steel.dev,
 arighi@nvidia.com,
 phasta@kernel.org,
 nouveau@lists.freedesktop.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <FD0C3CA4-6B65-449A-86D8-216A0AF314C4@collabora.com>
References: <20251111171315.2196103-1-joelagnelf@nvidia.com>
 <20251111171315.2196103-2-joelagnelf@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External

Hi Joel,

> On 11 Nov 2025, at 14:13, Joel Fernandes <joelagnelf@nvidia.com> =
wrote:
>=20
> Add foundational types for working with C's doubly circular linked
> lists (list_head). Provide low-level iteration over list nodes.
>=20
> Typed iteration over actual items will be added in a follow-up
> commit using the FromListHead trait and ClistLink mechanism.
>=20
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> rust/kernel/clist.rs | 190 +++++++++++++++++++++++++++++++++++++++++++
> rust/kernel/lib.rs   |   1 +
> 2 files changed, 191 insertions(+)
> create mode 100644 rust/kernel/clist.rs
>=20
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..5ea505d463ad
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust =
code.
> +//!
> +//! TODO: Doctest example will be added in later commit in series due =
to dependencies.
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +/// A C linked list with a sentinel head
> +///
> +/// A sentinel head is one which is not embedded in an item. It =
represents the entire
> +/// linked list and can be used for add, remove, empty operations =
etc.

nit: IMHO, the phrasing can improve here.

> +///
> +/// # Invariants
> +///
> +/// - `Clist` wraps an allocated and valid C list_head structure that =
is the sentinel of a list.
> +/// - All the `list_head` nodes in the list are allocated and have =
valid next/prev pointers.
> +/// - The underlying `list_head` (and entire list) is not modified by =
C.
> +#[repr(transparent)]
> +pub struct Clist(ClistHead);
> +
> +// SAFETY: `Clist` can be sent to any thread.
> +unsafe impl Send for Clist {}
> +// SAFETY: `Clist` can be shared among threads as it is not modified =
by C per type invariants.
> +unsafe impl Sync for Clist {}

Please keep "struct Foo" and "impl Foo=E2=80=9D adjacent to the extent =
possible.

> +
> +impl Clist {

IMHO, we should capitalize the L as well, i.e.: CList.

> +    /// Create a `&Clist` from a raw sentinel `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure
> +    /// representing a list sentinel, and it must remain valid for =
the lifetime `'a`.

Rust reference rules must also be upheld for =E2=80=98a. i.e.: nobody =
else can mutate through
this pointer, including the C code.

> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a =
Self {
> +        // SAFETY:
> +        // - `ClistHead` has same layout as `list_head`.
> +        // - `ptr` is valid for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.as_raw()
> +    }
> +
> +    /// Access the underlying `ClistHead`.
> +    #[inline]
> +    pub fn head(&self) -> &ClistHead {
> +        &self.0
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        self.0.is_empty()
> +    }
> +
> +    /// Create a low-level iterator over `ClistHead` nodes. Caller =
converts the returned
> +    /// heads into items.
> +    #[inline]
> +    pub fn iter_heads(&self) -> ClistHeadIter<'_> {
> +        ClistHeadIter {
> +            current: &self.0,
> +            head: &self.0,
> +        }
> +    }
> +}
> +
> +/// Wraps a non-sentinel C `list_head` node for use in intrusive =
linked lists.
> +///
> +/// # Invariants
> +///
> +/// - `ClistHead` represents an allocated and valid non-sentinel =
`list_head` structure.

Perhaps a blank here?

> +/// - The underlying `list_head` (and entire list) is not modified by =
C.
> +#[repr(transparent)]
> +pub struct ClistHead(Opaque<bindings::list_head>);
> +
> +// SAFETY: `ClistHead` can be sent to any thread.
> +unsafe impl Send for ClistHead {}
> +// SAFETY: `ClistHead` can be shared among threads as it is not =
modified by C per type invariants.
> +unsafe impl Sync for ClistHead {}

Same comment here about Foo and impl Foo.

> +
> +impl ClistHead {
> +    /// Create a `&ClistHead` reference from a raw `list_head` =
pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure,
> +    /// and it must remain valid for the lifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a =
Self {
> +        // SAFETY:
> +        // - `ClistHead` has same layout as `list_head`.
> +        // - `ptr` is valid for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next `ClistHead` in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe {
> +            let raw =3D self.as_raw();
> +            Self::from_raw((*raw).next)
> +        }
> +    }
> +
> +    /// Get the previous `ClistHead` in the list.
> +    #[inline]
> +    pub fn prev(&self) -> &Self {
> +        // SAFETY:
> +        // - self.as_raw() is valid per type invariants.
> +        // - The `prev` pointer is guaranteed to be non-NULL.
> +        unsafe {
> +            let raw =3D self.as_raw();
> +            Self::from_raw((*raw).prev)
> +        }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_in_list(&self) -> bool {

is_linked()?

> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe {
> +            let raw =3D self.as_raw();
> +            (*raw).next !=3D raw && (*raw).prev !=3D raw
> +        }
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe {
> +            let raw =3D self.as_raw();
> +            (*raw).next =3D=3D raw
> +        }
> +    }
> +}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list =
(`list_head`). Caller has to
> +/// perform conversion of returned `ClistHead` to an item (typically =
using `container_of` macro).
> +///
> +/// # Invariants
> +///
> +/// `ClistHeadIter` is iterating over an allocated, initialized and =
valid `Clist`.
> +pub struct ClistHeadIter<'a> {
> +    current: &'a ClistHead,
> +    head: &'a ClistHead,
> +}
> +
> +// SAFETY: ClistHeadIter gives out immutable references to ClistHead,
> +// which is Send.
> +unsafe impl Send for ClistHeadIter<'_> {}
> +
> +// SAFETY: ClistHeadIter gives out immutable references to ClistHead,
> +// which is Sync.
> +unsafe impl Sync for ClistHeadIter<'_> {}
> +
> +impl<'a> Iterator for ClistHeadIter<'a> {
> +    type Item =3D &'a ClistHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Advance to next node.
> +        self.current =3D self.current.next();
> +
> +        // Check if we've circled back to HEAD.
> +        if self.current.as_raw() =3D=3D self.head.as_raw() {
> +            return None;
> +        }
> +
> +        Some(self.current)
> +    }
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index c2eea9a2a345..b69cc5ed3b59 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -72,6 +72,7 @@
> pub mod bug;
> #[doc(hidden)]
> pub mod build_assert;
> +pub mod clist;
> pub mod clk;
> #[cfg(CONFIG_CONFIGFS_FS)]
> pub mod configfs;
> --=20
> 2.34.1
>=20
>=20



