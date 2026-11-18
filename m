Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018776;
	b=nqDMinqH0gguVrJznIiSEPrjPQdneeS5fiMqwtkOXylk2K3esdaGNtX0+yH6ED6VuhJH
	 NCdm3dc0SzSD/zrrYe6kxPSryxGbqbcm6ieVYiBAYvNqbe6vVCcprvqkGRDDaGjcIAYDW
	 p+j1/ddxaMgwlO5fnJWeV6ftniT/BpBDtYFnAe6zmcsEdZNvOU5JjblZ0AvTCkcpH0HVU
	 dVuAwBeNOc4MD07UpbQU6/ccI8wfglC4D70xiw/TWzBWPgpikVYo9RVfhdeXBHx9/WFme
	 6e0P5B7QZKfi4f+Px6hHCB4Z64wg9Bph8acthkwbtpE98BA0fz7owOqSZhHxs7ipTNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018776;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=eFrBCM7CPvXc7RORk31+znnK2wW3gMhHFGdabCbdV5I=;
	b=E+dQZOH+T9vRyVk8CFxG6mVlp59c0ShNEH1IdgMGjff8Hj+eLD3adGTwzSQJPMtep5QP
	 DdhOnfLLEDakKTeIhtZLae03Ji9E6cvV5yMgZ2bgItaH5LdGLwwqMbVHyui+gLqB3Zv+C
	 p12N5rgeFWqgJA3N0SvfPmyEQQhh7OyQ+pWmLLWiOKnRrjZNIakd8T4WTAemXpB5IjlKY
	 jxP37pHN5FbVlVRJk02aXssfhzYd82whZKcS9GhaJg4/yGO3+zoXRyHbx3r5YxEaWSOin
	 7Mzav7bu9Cps4HUrbD5seyA5LQ1DYCeAioe8DWZcZ9J9dd8TjFpg3o7jb/tvu9JSJPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTQfgtsC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12358606A31C;
	Wed, 18 Nov 2026 16:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VTQfgtsC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECA01F000C8;
	Wed, 18 Nov 2026 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795018775;
	bh=eFrBCM7CPvXc7RORk31+znnK2wW3gMhHFGdabCbdV5I=;
	h=From:Subject:Date:To:Cc;
	b=VTQfgtsC3yMr/ac3UB/d8JKsvf3GxsuSwUd7T6xGE6HYRuiUbk4U6Zt/eju9nrNA2
	 M/hAmvNbJsIcBiwkCvsvSVsckbguQz6nlYqE4DeNrF/oedoNgwwtFyLFpAgIRT0PTZ
	 fX9QCrlzeVEqGwmVah8t6G44/VgRFDX7IGl0uhd2YR9QjvFqo/jjSQnr4nWMZnOdoV
	 usXoyaYVm8I/qQEcZKT9mxZrBI7Dj+B4KnvN6zJ4iDtdR5Uw4yyUEMg6aalam/QJgx
	 l04MyCrwodC7o638fcVFuskV5VhCn3PB4THLcZn4mXTIo611J7S8KsC93NE3J8NIK1
	 fU2sb7Ihr6ZGA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v22 0/6] rust: page: add page kinds
Date: Wed, 18 Nov 2026 17:18:16 +0100
Message-Id: <20261118-page-ownable-v22-0-d63ff73f4075@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMjP/WoC/0WNS47DIBBEr2KxDhI0BoyvMsqiG5oZRhM7MXYmU
 pS7h3ykLKtU9d5VVF4KVzF2V7HwudQyTy0A7DoRf3D6ZllSKwQocFprkEds3fw/If2xBA4+9Bo
 HQyDa5bhwLpcn72v/ynWjX47rg/FeLHzammh9zT6aplVglVFWblM5bSwbTULIMTlvc+AwnuGpI
 aws43w4lHXsfO8t40B2cNqRMVH1mCl4F7PKhJhCSs5kEvvb7Q4dE0Sj8AAAAA==
X-Change-ID: 20261112-page-ownable-2e97941a83b2
To: Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, 
 David Hildenbrand <david@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mike Rapoport <rppt@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Wilcox <willy@infradead.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, 
 Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
 Carlos Llamas <cmllamas@google.com>
Cc: Igor B <igor.b@beldev.am>, Vitaly Wool <vitaly.wool@konsulko.se>, 
 linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7944; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=WHdG1t5Ag1Nz1FPp8c0/hz5TW9dGwn5dkm6bRHT4QtQ=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBq/c/P4xLeBQvFzyl7yL1Rp/6IYnMqrDurD6UbQ
 Nfep8G8PgiJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCav3PzwAKCRD6UCkIqsW9
 0NUpD/9RgYY4JysHIllCAH9/dWcz+95rSzrHZKZStdjJ93OaXna2EJi+KdpNh54KyEpOJfUTE1n
 E6tUEbpSc1zdanpzbrph+jzzeosXu+W0pOhiRycbZHFe5FRV62TQJz0X48uG9ghOsblPHL7FgaA
 zBr0S17d3KgABUWkfmD9R9w7xUT14nKb2I5KbJxMi0nvUK4ByacGwEL9Bi6jDufg+flMz/aLUD/
 q6bJgn7o2hRRVErkMGwB0pobLqncfUsgxS8jjKIa+mpEAwdxTHnyOdgPB4SBCCYgyuvFhE2RnUv
 keQH7BzML6btdaUSE4Q9qxlNoBrC3NF/nQIGy/nGWO38YOwOXpP2R7ux103QcRVJCJB1rhlkIJG
 RQUiaLhbTiuaBluDI9dhOOyGzzXxf4XPXbNsO7BKajZCC+n70WauaaBxOygLxW4ksW4HjSozndQ
 UlCatGGxL4NNhbnJVVAQa+yDwd4TpFGAsSXtkbS4+OXA5gJwLn+Ao+yvaOPpc6uju8QAoHTy20N
 vGdLq/KQiXYk+bfvM/GPucyv2YsEH5BQffSMLxZVWTZ567/i49O5IFQy5TfMFq4HaRy0EG3sOrt
 IvfsSK38Imfsdo125eQfj5tSMpL8hPh8b4+2MULU2jbWFtSR77VN35PxsccsAmEvvqi5eyEgutB
 W2KI3ss4M4zI5fg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Note: The page patches were part of the `Ownable` series [1] until v21.
This series continues the version numbering of that series, and it depends
on v22 of that series for `Ownable`, `Owned` and the split of `RefCounted`
and `AlwaysRefCounted`.

Not all pages can be treated the same way. A page allocated with
`alloc_pages()` is managed by the page reference count, and kernel C code
routinely takes its own references to such a page. A page owned by the
slab allocator must not have references taken to it, but it can still
show up in places such as a bio vector. A frozen page has a reference
count of zero and is exclusively owned by the party that allocated it.

A single `Page` type cannot describe all of these. This series makes
`Page` generic over a sealed `PageKind` that describes what is known about
the page:

 - `Page<Base>` is the base kind. Nothing is known about the page
   beyond the validity of the `struct page`.
 - `Page<RefCounted>` is the default kind. The page is managed by the
   page reference count, and `Page<RefCounted>` implements
   `AlwaysRefCounted`.
 - `Page<Exclusive>` is a uniquely owned frozen page whose data area
   follows standard Rust aliasing rules, so the data is available as
   `&[u8]` and `&mut [u8]`. It is handled through
   `Owned<Page<Exclusive>>` and is the first in-tree user of `Owned`.
 - `Page<Frozen>` is a frozen page whose allocation is uniquely owned.
   Unlike for `Page<Exclusive>`, nothing is known about who accesses the
   data of the page, so the data is only available through the unsafe
   raw accessors.

Operations that are valid for any page are available for all page kinds.
All other page kinds dereference to `Page<Base>`. The purpose of the
dereference is coercion: a reference to a page of any kind can be passed
to code that takes a `&Page<Base>`.

`Page<Exclusive>` is backed by a frozen page, as suggested by Matthew
Wilcox in the review of v21. References cannot be taken to a frozen page,
so the exclusive ownership is upheld by mm rather than only by the Rust
type system.

Patch 1 adds the page kinds `Base` and `RefCounted`, makes
`Page<RefCounted>` reference counted, and updates the users of `Page`.

Patch 2 adds `Page::from_raw()`.

Patch 3 makes `alloc_frozen_pages()` and `free_frozen_pages()` available
outside of mm. The choice of `include/linux/gfp.h` as the new home of the
declarations is open for discussion.

Patch 4 adds the page kind `Exclusive`.

Patch 5 adds the page kind `Frozen`. It has no user in this series and
can be dropped if it is not wanted at this time.

Patch 6 adds slice access to the data of a `Page<Exclusive>`, and
tightens the safety requirements of the raw data accessors accordingly.

[1] https://msgid.link/20260910-unique-ref-v21-0-e83257373062@kernel.org

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v22:
- Split the `Page` patches out of the `Ownable` series.
- Make `Page` generic over a `PageKind`, with the kinds `Base`,
  `RefCounted`, `Frozen` and `Exclusive`. `Page<Exclusive>` replaces the
  `ExclusivePage` type (Andreas).
- Back `Page<Exclusive>` by a frozen page (Matthew).
- Add a patch that makes `alloc_frozen_pages()` and `free_frozen_pages()`
  available outside of mm.
- Add the page kind `Frozen` in a separate patch (Andreas).
- Return `&Page<Base>` from `Vmalloc::to_page()` and `AsPageIter`, as
  these pages are not known to be reference counted.
- Make `Page::from_raw()` available for all page kinds. The caller selects
  the kind and upholds its invariants.
- Rename `ExclusivePage::alloc_page()` to `Page::alloc_exclusive()`
  (Andreas).
- Let `Page<Exclusive>` dereference to `Page<Base>` (Andreas).
- Add `Page::as_slice()` and `Page::as_mut_slice()` for `Page<Exclusive>`
  in a separate patch. Always zero the page and never allocate it from
  highmem, and require callers of the raw data accessors to ensure that
  no conflicting reference to the data exists. Update the safety comments
  of the existing callers (Andreas).
- Justify the `AlwaysRefCounted` implementation for `Page` by all
  instances of the type being reference counted, rather than by the type
  not implementing `Ownable` (Alice, Gary).
- Tighten the safety requirements of `Page::from_raw()` to require, for
  `Page<RefCounted>`, that the page is reference counted and that taking
  additional references is permitted (Sashiko).
- Mark `Page::alloc_exclusive()` as `#[inline]` (Sashiko).
- Drop the Reviewed-by tag from the `Page::from_raw()` patch, as its
  safety requirements changed.
- Link to v21: https://msgid.link/20260910-unique-ref-v21-0-e83257373062@kernel.org

The entries below are the `Page` related changes from the change log of
the `Ownable` series.

Changes in v21:
- Import `Page` directly in `allocator.rs` instead of using the
  `page::Page` path (Danilo).
- Convert `Page` to `AlwaysRefCounted` backed by `get_page()` and
  `put_page()` instead of `Ownable`, and return `ARef<Page>` from
  `Page::alloc_page()` (Alice).
- Update Rust Binder to store `ARef<Page>` instead of `Owned<Page>`
  (Alice).
- Add `ExclusivePage` as the in-tree `Owned` user, without
  `Deref<Target = Page>` as that would break its aliasing invariant.
  The type was previously posted as `SafePage` and is renamed here
  (Alice).
- Link to v20: https://msgid.link/20260824-unique-ref-v20-0-490735672187@kernel.org

Changes in v20:
- Use `self.page.get()` rather than `Opaque::cast_into` (Alice).
- Link to v19: https://msgid.link/20260626-unique-ref-v19-0-2607ca88dfdf@kernel.org

Changes in v18:
- Remove `BorrowedPage`; use `&Page` directly (Alice).
- Update Rust Binder for the `Owned<Page>` conversion (Alice).
- Fix stale `Page` docs (Sashiko).
- Link to v17: https://msgid.link/20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org

Changes in v16:
- Simplify pointer to reference cast in `Page::from_raw`.
- Use `NonNull<Page>` rather than `Owned<Page>` for `BorrowedPage` internals.
- Fix formatting for `Page::from_raw` docs.
- Link to v15: https://msgid.link/20260220-unique-ref-v15-0-893ed86b06cc@kernel.org

Changes in v14:
- Add patch: rust: page: convert to `Ownable`.
- Add patch: rust: page: add `from_raw()`.
- Link to v13: https://lore.kernel.org/r/20251117-unique-ref-v13-0-b5b243df1250@pm.me

---
Andreas Hindborg (6):
      rust: page: add page kinds and make `Page` reference counted
      rust: page: add `from_raw()`
      mm/page_alloc: make alloc_frozen_pages() available outside of mm
      rust: page: add `Exclusive` page kind for race-free page access
      rust: page: add `Frozen` page kind
      rust: page: add slice access to `Page<Exclusive>`

 drivers/android/binder/page_range.rs |  24 +-
 include/linux/gfp.h                  |   9 +
 mm/mempolicy.c                       |   1 +
 mm/page_alloc.c                      |  10 +
 mm/page_alloc.h                      |  14 -
 rust/helpers/page.c                  |  21 ++
 rust/kernel/alloc/allocator.rs       |  29 ++-
 rust/kernel/alloc/allocator/iter.rs  |   7 +-
 rust/kernel/alloc/kbox.rs            |   3 +-
 rust/kernel/alloc/kvec.rs            |   3 +-
 rust/kernel/page.rs                  | 481 ++++++++++++++++++++++++++++-------
 11 files changed, 474 insertions(+), 128 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261112-page-ownable-2e97941a83b2
prerequisite-change-id: 20250305-unique-ref-29fcd675f9e9:v22
prerequisite-patch-id: 4e3c7a1a2077aaa0ece2d557fa73486355903ae5
prerequisite-patch-id: d1073c5dcd6287fbcba7848a5d182108930230c1
prerequisite-patch-id: 3244def11bbdf2eabaa6e94e15ce06540b2f5814
prerequisite-patch-id: cef14c5bef5ba519ceaf0a0e7c9e93ef974db7b3
prerequisite-patch-id: 56410da35ed8dbe7b210adae0985af705cc0b5b0

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


