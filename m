Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C8D38422A;
	Thu, 23 Apr 2026 17:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776964043; cv=none; b=r+iZakTdP1m0rRZLZEJHtZA50YSyW37XgXYBKZ3rPjjwroG+bEKglpYwmLhPf4vyrbQGn0TOoFZKke0+txGW19BL6f9dJk24h0MgH8cGiJepasn2hDMxW33Icljvuv+rQc+lSRLyBI2o2yjB3Du3FxUKKdg9ZpMq3DSBs7aP6xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776964043; c=relaxed/simple;
	bh=Od5rIDJoLXjhMgFvJFtK+2TZl45gHONpbL19GnF0G+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cb1DDiS7l7u4gADsDrXx/w4/6PecnSpTLMgREHxVfpQtRAwXqmywDK7gJlA93+mqsOAYqnyf4U1HN0WHsHngOz8lpT71do20fXyNGX/jOocrDMbW1gyyH0cQRxiWYNuDq/e1H+RpEi256cDwAMDAMOzJiU2RnTkSofUdOw/LQlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dhpe7vYk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dhpe7vYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4607C2BCB3;
	Thu, 23 Apr 2026 17:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776964043;
	bh=Od5rIDJoLXjhMgFvJFtK+2TZl45gHONpbL19GnF0G+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dhpe7vYk/JqpgDEqiWhM3OH5iR/5fSGBbpzjJi5NIcZPAsKvc8rYiOPwg1JG+6rKk
	 q4zk9a4X7wInOcqyhRNVjTJDWfMQDF4EDMg0EVfIWA1Sl1qcVelRJ0h7HEuVabxdBw
	 nxaoKR4bAmbk/abX3qnzp1UwTJWbF1E1NIdVfT2jXmLWjx0x13PtF8Vo6wdiFK88Ti
	 WIva38uLD10/9NAfrNnBrj6lPKcdaayJDm0X7y7THTNBrB72XP1B9vvAeQuD5odThh
	 k9Y5+DL0oee6R22sAA/8PWu0WQ53I8BEcIC1XenS9XIHY5F8+4YiCGyJw3+wY7z9Hx
	 g13MjnPP4OZKg==
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id D4CA8F40068;
	Thu, 23 Apr 2026 13:07:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Thu, 23 Apr 2026 13:07:21 -0400
X-ME-Sender: <xms:yVHqaUKxKRh28AnA77MfEsDvy8Hrk0ARcYOGtkVvN0ql0991gEOCAw>
    <xme:yVHqabNbNSR1GkknYCzXAnHX_wiHr9em7Ak37t1GN8lOTDJcmyfI6TFim8Wfh0DCH
    kNaC6WeRuelqORPCnIcv8dMCGkyqxn5yCqksoPcozarrL23sv0oikI>
X-ME-Received: <xmr:yVHqacb-6CcVEv_L6gMhVssRYKaYlhsdId-brAAXYfkQg-djOMtnpgJer6qnzvGMT4zWho3adaAM9QHOShlhIi_fNrpo-BDh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeijeejudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnsehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnheple
    evhedtudfgfffgffehtdetjeeugfegfeetueeiieeiudehudehkeeitdejgedvnecuffho
    mhgrihhnpehtrhgvvgdrmhgrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihht
    hidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrhhnvghlrd
    horhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehjohgvlhgrghhnvghlfhesnhhvihguihgrrdgtohhmpd
    hrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtph
    htthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegrnhgu
    rhgvfihjsggrlhhlrghntggvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
    pdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtg
    hpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:yVHqaXwSsa-EC2yJb4kePyKBURNtWROSm2Y68-wQ_Jmcycxfh73ykg>
    <xmx:yVHqaYFUCvYL6V-pQWE_ax2xz5i65aLFWrLaW5yqWy7dNHZQ0_x-3Q>
    <xmx:yVHqaSqSD20Rqon3yXtaTvyrCoppcdsW3s6BxLBHhGdK-slV3Ck2Uw>
    <xmx:yVHqaWz82TIirpMlXrybiOvnf9SNW2D03U_jv_ROpBwbm3lp5XOT9A>
    <xmx:yVHqacwp5YVvJNqeoU3Z_Omk-3Xas5FVdsCKNeDccpOrD75PzvLuqN0U>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Apr 2026 13:07:20 -0400 (EDT)
Date: Thu, 23 Apr 2026 10:07:19 -0700
From: Boqun Feng <boqun@kernel.org>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, maple-tree@lists.infradead.org,
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: maple_tree: implement Send and Sync for
 MapleTree
Message-ID: <aepRx2jgIKmoRp-r@tardis.local>
References: <20260422202813.2990181-1-joelagnelf@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422202813.2990181-1-joelagnelf@nvidia.com>

On Wed, Apr 22, 2026 at 04:28:12PM -0400, Joel Fernandes wrote:
> The C maple_tree struct contains a *mut c_void, which prevents Rust from
> auto-deriving Send/Sync. Following is an example error message when using
> MapleTree in nova-core's Vmm.
> 
> This propagates up through MapleTreeAlloc to Vmm, BarUser, Gpu, and NovaCore,
> causing NovaCore to fail the Send bound required by pci::Driver:
> 
>   error[E0277]: `*mut c_void` cannot be sent between threads safely
>       --> drivers/gpu/nova-core/driver.rs:77:22
>        |
>   77   | impl pci::Driver for NovaCore {
>        |                      ^^^^^^^^ `*mut c_void` cannot be sent between threads safely
>        |
>        = help: within `MapleTreeAlloc<()>`, the trait `Send` is not implemented for `*mut c_void`
>   note: required because it appears within the type `kernel::bindings::maple_tree`
>   note: required because it appears within the type `Opaque<kernel::bindings::maple_tree>`
>   note: required because it appears within the type `MapleTree<()>`
>   note: required because it appears within the type `MapleTreeAlloc<()>`
>        = note: required for `Box<MapleTreeAlloc<()>, Kmalloc>` to implement `Send`
>   note: required because it appears within the type `core::pin::Pin<Box<MapleTreeAlloc<()>, Kmalloc>>`
>   note: required because it appears within the type `Vmm`
>   note: required because it appears within the type `BarUser`
>   note: required because it appears within the type `Gpu`
>   note: required because it appears within the type `NovaCore`
>   note: required by a bound in `kernel::pci::Driver`
>       --> rust/kernel/pci.rs:294:19
> 
> Implement Send and Sync for MapleTree. The tree contains no thread-local
> state, and all shared access goes through the internal ma_lock spinlock.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
> v1->v2: Adjusted comments and imports.
> 
>  rust/kernel/maple_tree.rs | 29 +++++++++++++++++++++++------
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/rust/kernel/maple_tree.rs b/rust/kernel/maple_tree.rs
> index 265d6396a78a1..2400c905270da 100644
> --- a/rust/kernel/maple_tree.rs
> +++ b/rust/kernel/maple_tree.rs
> @@ -16,7 +16,11 @@
>      alloc::Flags,
>      error::to_result,
>      prelude::*,
> -    types::{ForeignOwnable, Opaque},
> +    types::{
> +        ForeignOwnable,
> +        NotThreadSafe,
> +        Opaque, //
> +    },
>  };
>  
>  /// A maple tree optimized for storing non-overlapping ranges.
> @@ -240,7 +244,10 @@ pub fn lock(&self) -> MapleGuard<'_, T> {
>          unsafe { bindings::spin_lock(self.ma_lock()) };
>  
>          // INVARIANT: We just took the spinlock.
> -        MapleGuard(self)
> +        MapleGuard {
> +            tree: self,
> +            _not_send: NotThreadSafe,
> +        }
>      }
>  
>      #[inline]
> @@ -302,19 +309,29 @@ fn drop(mut self: Pin<&mut Self>) {
>      }
>  }
>  
> +// SAFETY: `MapleTree<T>` is `Send` if `T` is `Send` because `MapleTree` owns its elements.
> +unsafe impl<T: ForeignOwnable + Send> Send for MapleTree<T> {}
> +// SAFETY: `&MapleTree<T>` never hands out `&T`; all entry access is serialized
> +// by `ma_lock` or `&mut Guard`, so `T: Send` suffices (`T: Sync` not required).
> +unsafe impl<T: ForeignOwnable + Send> Sync for MapleTree<T> {}

If the design of MapleTree API is to support having multiple readers, I
think we should add `Sync` bound as well for future-proof. I.e.

unsafe impl<T: ForeignOwnable + Send + Sync> Sync for MapleTree<T> {}

Thoughts? Unless you have an usage that be broken because of this.

Regards,
Boqun

> +
>  /// A reference to a [`MapleTree`] that owns the inner lock.
>  ///
>  /// # Invariants
>  ///
>  /// This guard owns the inner spinlock.
>  #[must_use = "if unused, the lock will be immediately unlocked"]
> -pub struct MapleGuard<'tree, T: ForeignOwnable>(&'tree MapleTree<T>);
> +pub struct MapleGuard<'tree, T: ForeignOwnable> {
> +    tree: &'tree MapleTree<T>,
> +    // A held spinlock must be released on the same CPU that acquired it.
> +    _not_send: NotThreadSafe,
> +}
>  
>  impl<'tree, T: ForeignOwnable> Drop for MapleGuard<'tree, T> {
>      #[inline]
>      fn drop(&mut self) {
>          // SAFETY: By the type invariants, we hold this spinlock.
> -        unsafe { bindings::spin_unlock(self.0.ma_lock()) };
> +        unsafe { bindings::spin_unlock(self.tree.ma_lock()) };
>      }
>  }
>  
> @@ -323,7 +340,7 @@ impl<'tree, T: ForeignOwnable> MapleGuard<'tree, T> {
>      pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
>          // SAFETY: The `MaState` borrows this `MapleGuard`, so it can also borrow the `MapleGuard`s
>          // read/write permissions to the maple tree.
> -        unsafe { MaState::new_raw(self.0, first, end) }
> +        unsafe { MaState::new_raw(self.tree, first, end) }
>      }
>  
>      /// Load the value at the given index.
> @@ -375,7 +392,7 @@ pub fn ma_state(&mut self, first: usize, end: usize) -> MaState<'_, T> {
>      #[inline]
>      pub fn load(&mut self, index: usize) -> Option<T::BorrowedMut<'_>> {
>          // SAFETY: `self.tree` contains a valid maple tree.
> -        let ret = unsafe { bindings::mtree_load(self.0.tree.get(), index) };
> +        let ret = unsafe { bindings::mtree_load(self.tree.tree.get(), index) };
>          if ret.is_null() {
>              return None;
>          }
> -- 
> 2.34.1
> 
