Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D485E322B88
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837655; cv=none; b=aVP0AkQW6PDkzynT0AtO+rOUydxI3R4/r1Frsgk0PnFuPYxKlTrvNIw0RtDdj7SkT1zcQe88G1YrB/l1JkIaPOiCrbkVpafwWmRpp2jrGCreaHM/GdIz5wfgTj1rtuJZqcsysS6ChBn21e+WqZTSNPyn+30fFYxbdjfaQE7jpUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837655; c=relaxed/simple;
	bh=j0Vq7i3vktXeaCWe+C2NzpUZZ6xObpycugCND5M/L60=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aIM2pzpS1lLHaemThOY/A0XOAjCmWTriNYyYg0Rw+EbUmK8Rjk49cSrwI1wft4Bv8iKTzL3+tDhhlHHto0cHZFZjEfgP9aIv7ZyODno/zWDqhCtP4PryKwJ0WgrOJ98luMZzhLW+GC1xtiz70JrDj7n5BdfX5WVWkP49k8TZP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=e3rio40p; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="e3rio40p"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-43b3a0d25d8so2641816f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 18 Mar 2026 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773837651; x=1774442451; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nWiNwiZcBmYWVTTl9iPT0XLfb7VjL0dMPy7l1+Lqx3k=;
        b=e3rio40ptIgc8aCiCTt90OzwTJeMTzR0qA5AzcgAZIPACXZYQbs6MpQrcpxXYTvVTg
         d99jTrE/dd5UbItVwBw+eFPYnDZ28xifnkJrtjgj4c10fi518Qi7fPwnTAJTWWsy1pZ+
         +820Vm8puTj7d6xmrWvPFyy9oIVtOKsrrLkSxEQZFh8VUM8Y119ldGvR9GC8hwb6KcMV
         ZQWYGXU3qnziTc1AqncbflGjNSJl7rz6fsoHvKWDnHtN3jSAU0pZ68oU20juVsjGmJbw
         LGx/D0YKOCHe/Ng2g72HahhGKj6PEZjVOM9SJE3lp6tR3z6AyyHKkBAfH8+XUyY4wgVF
         qFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837651; x=1774442451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWiNwiZcBmYWVTTl9iPT0XLfb7VjL0dMPy7l1+Lqx3k=;
        b=H3/gonPnFLNaK0PW7O+IKpz8rCrc7K05hAQPXk54q9W2j4j8wGJTnbx0cRJ8a5ss+y
         gE+x4JoA8Hy/OeHCjeTER0liSfxMbQ5xwIyNck0sLxS6nIGm8wsoBjX9X5hJCSZ0kxOr
         cm1Q8z7bm0MWMaLKUMXKI6NP/S8q6m08sOcZNGHCyGkbXl8NyIeVtjR6Oc50UEFyLYhq
         JW/hj8BzPj6NiR6L/Wjg/qWITsxekRCIY2WZNc01cI0nWjNfyh5DjNMX87ATbPFSRxeb
         0KNokD7H/IwDGpG6gOx74QPNk/5ZrGC1dnP4Q1D+32XHGglP124kMgqJC7itOQCsczhE
         dnEg==
X-Forwarded-Encrypted: i=1; AJvYcCVFP8CkfdyXiJUarLqj4sapPTIVDo4+EL+dLTp9ef8D/BK/FkOsEJvCmTNHMILftpQVKLujH3HZT5M6x4VqOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DRuOfv2itiMt3UG4SQLMaQHI/25mxSBnPoWUho8dqP/eCeWm
	ThePK/SdqdZTmY7SsOPeHaZCSz6ax5szMLmWbGHNENjzFl+rNCdcW2HiHu3LDwOK3RL+A8Mb4mP
	w41vrh8a/DB17L1WpsQ==
X-Received: from wmnp7.prod.google.com ([2002:a05:600c:2e87:b0:485:6c28:2360])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5491:b0:485:3983:aba2 with SMTP id 5b1f17b1804b1-486f4451354mr52065225e9.23.1773837650627;
 Wed, 18 Mar 2026 05:40:50 -0700 (PDT)
Date: Wed, 18 Mar 2026 12:40:48 +0000
In-Reply-To: <20260317201710.934932-2-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com> <20260317201710.934932-2-joelagnelf@nvidia.com>
Message-ID: <abqdUBqchnVFo7Qk@google.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Helge Deller <deller@gmx.de>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, 
	Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 17, 2026 at 04:17:10PM -0400, Joel Fernandes wrote:
> Add a new module `kernel::interop::list` for working with C's doubly
> circular linked lists. Provide low-level iteration over list nodes.
> 
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  MAINTAINERS                 |   8 +
>  rust/helpers/helpers.c      |   1 +
>  rust/helpers/list.c         |  17 ++
>  rust/kernel/interop.rs      |   9 +
>  rust/kernel/interop/list.rs | 342 ++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs          |   2 +
>  6 files changed, 379 insertions(+)
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/interop.rs
>  create mode 100644 rust/kernel/interop/list.rs
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4bd6b538a51f..e847099efcc2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23251,6 +23251,14 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
>  F:	rust/kernel/alloc.rs
>  F:	rust/kernel/alloc/
>  
> +RUST [INTEROP]
> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +T:	git https://github.com/Rust-for-Linux/linux.git interop-next
> +F:	rust/kernel/interop/
> +
>  RUST [NUM]
>  M:	Alexandre Courbot <acourbot@nvidia.com>
>  R:	Yury Norov <yury.norov@gmail.com>
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a..724fcb8240ac 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -35,6 +35,7 @@
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> +#include "list.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..18095a5593c5
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,17 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
> +{
> +	INIT_LIST_HEAD(list);
> +}
> +
> +__rust_helper void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
> +{
> +	list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/interop.rs b/rust/kernel/interop.rs
> new file mode 100644
> index 000000000000..b88140cf76dc
> --- /dev/null
> +++ b/rust/kernel/interop.rs
> @@ -0,0 +1,9 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Infrastructure for interfacing Rust code with C kernel subsystems.
> +//!
> +//! This module is intended for low-level, unsafe Rust infrastructure code
> +//! that interoperates between Rust and C. It is NOT for use directly in
> +//! Rust drivers.
> +
> +pub mod list;
> diff --git a/rust/kernel/interop/list.rs b/rust/kernel/interop/list.rs
> new file mode 100644
> index 000000000000..328f6b0de2ce
> --- /dev/null
> +++ b/rust/kernel/interop/list.rs
> @@ -0,0 +1,342 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Rust interface for C doubly circular intrusive linked lists.
> +//!
> +//! This module provides Rust abstractions for iterating over C `list_head`-based
> +//! linked lists. It should only be used for cases where C and Rust code share
> +//! direct access to the same linked list through a C interop interface.
> +//!
> +//! Note: This *must not* be used by Rust components that just need a linked list
> +//! primitive. Use [`kernel::list::List`] instead.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist_create,
> +//!     types::Opaque,
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
> +//! # #[repr(C)]
> +//! # pub struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # let head = head.as_mut_ptr();
> +//! # // SAFETY: `head` and all the items are test objects allocated in this scope.
> +//! # unsafe { bindings::INIT_LIST_HEAD(head) };
> +//! #
> +//! # let mut items = [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr = item.as_mut_ptr();
> +//! #     // SAFETY: `ptr` points to a valid `MaybeUninit<SampleItemC>`.
> +//! #     unsafe { (*ptr).value = i as i32 * 10 };
> +//! #     // SAFETY: `&raw mut` creates a pointer valid for `INIT_LIST_HEAD`.
> +//! #     unsafe { bindings::INIT_LIST_HEAD(&raw mut (*ptr).link) };
> +//! #     // SAFETY: `link` was just initialized and `head` is a valid list head.
> +//! #     unsafe { bindings::list_add_tail(&mut (*ptr).link, head) };
> +//! # }
> +//!
> +//! //
> +//! /// Rust wrapper for the C struct.
> +//! ///
> +//! /// The list item struct in this example is defined in C code as:
> +//! ///
> +//! /// ```c
> +//! /// struct SampleItemC {
> +//! ///     int value;
> +//! ///     struct list_head link;
> +//! /// };
> +//! /// ```
> +//! #[repr(transparent)]
> +//! pub struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub fn value(&self) -> i32 {
> +//!         // SAFETY: `Item` has same layout as `SampleItemC`.
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//!
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: `head` is valid and initialized, items are `SampleItemC` with
> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over `SampleItemC`.
> +//! let list = clist_create!(unsafe { head, Item, SampleItemC, link });

Bad news.

My build triggers this warning:

error: statement has unnecessary safety comment
    --> rust/doctests_kernel_generated.rs:7103:1
     |
7103 | let list = clist_create!(unsafe { head, Item, SampleItemC, link });
     | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
help: consider removing the safety comment
    --> rust/doctests_kernel_generated.rs:7101:4
     |
7101 | // SAFETY: `head` is valid and initialized, items are `SampleItemC` with
     |    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.94.0/index.html#unnecessary_safety_comment
     = note: `-D clippy::unnecessary-safety-comment` implied by `-D warnings`
     = help: to override `-D warnings` add `#[allow(clippy::unnecessary_safety_comment)]`

This probably needs to be:

	unsafe { clist_create!(head, Item, SampleItemC, link) }

Alice
