Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793198177;
	b=wbIRxHTWvx5VVP1xHE8iT8g/fehTRfZkSSAJ39G0P0ONiVdNx3dx/gxaDlHuWVy7muww
	 rwHvd8ER+Yx45GGzAkEK650/936dysOrYSw0LSGuVCYcqZQr4PVNAPEE7FHF4sEuiiX4e
	 vfPazgXeri7or1z5HRxD759mUQNOjPWFTXrQp5GUembZeq+tyCoPIpuUXa0czAIp1+17+
	 1GqARsNiBxdVQJmHQN0gQq+s9OFkr/30Mnyk1i6isLq2p2s+zYCscf26JGac9UokDiVnr
	 y+2FqvYdw62v0uiQnsp7KE8VGYEIWg9oM6W13QPievopoVEf+ZshhS90bpCf3FQ3/Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793198177;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=M1Ry+UQHTd+cvMSHTcIN1u2SNdFt3NGJJUT4FPQVL7w=;
	b=2jmYmHSuLl1YRfqUWgta44zx52RJ4esMvcXfL7mFk9OHNkKAyzku8O58R3tvdj01HeS2
	 k1cuWd+AuuTk/faje4fnBqwS7c1M/NGHNWH8EjAbBZVwZ4UXLku1DPrrUlZnkSuQjrthv
	 476SDAsufdpi9cXCXyePRew6aw/Ybtp/SPsD5pod4MFJTApNFOVy3nK6k4Snhen5s1uiW
	 +KUdfW7Q/bK1ebwg60K/okY1o7dyYiK9ZoOadLY6fOyCJC4YdPZM75DwlI/ij/0gATsVs
	 WMfaFcFJbfed7dJBKh6IUcoJ+dUzxaOriX2DtrF1kIp5ro6MUP/9JCHeAwxM0w4efGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuS7zG9b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78463606A320;
	Wed, 28 Oct 2026 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XuS7zG9b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D921F01829;
	Wed, 28 Oct 2026 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198177;
	bh=M1Ry+UQHTd+cvMSHTcIN1u2SNdFt3NGJJUT4FPQVL7w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XuS7zG9bwDDzf6eW+qpcN4OUszqtmlUkME+JsnbCzvetndxSL/X40cpjy0+HgXLmO
	 +hSz5xgQyCdoFMBqvu0ozp4GsnRs7LdR8ZXJbLvL5Bkb7lhppG2J5affy/zDUCpRdP
	 anRW3chWrfWZOwmJ3al0QP8NpEMQlO2uytOxzp44mvQV/vB3sVqcicIOikmra4wvxx
	 CIxI6gu1a+7Bm5nq7PrDn4wyTRp1D/77b7jBo5TAQm2otn62Y+b3tcAaB5L0Ex2vuA
	 yyWYpo6Jwrb/InbcmMy/zIy1Z2GxzkKgINqSNNNLjlcZkKahfwqkjefPIoT6edUDkX
	 Zy4mMVjoMxu8Q==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
 Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Lorenzo Stoakes
 <ljs@kernel.org>, Vlastimil
 Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Uladzislau Rezki <urezki@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v3 3/3] rust: alloc: move `NumaNode` to the `numa` module
In-Reply-To: <DLSQY2IKU5IO.3BFLXTCTJ5I6U@garyguo.net>
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-3-e968ce5ee613@kernel.org>
 <DLSQY2IKU5IO.3BFLXTCTJ5I6U@garyguo.net>
Date: Wed, 28 Oct 2026 15:36:05 +0100
Message-ID: <878q3hopt6.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> On Tue Sep 29, 2026 at 6:56 PM BST, Andreas Hindborg wrote:
>> `NumaNode` identifies a NUMA node and is not specific to the allocator API.
>> Move it from the `alloc` module to the `numa` module so that NUMA related
>> items live together.
>>
>> No functional change.
>>
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Link: https://lore.kernel.org/all/aiZvKPFCkqJUsP0a@google.com/
>> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
>> ---
>>  rust/kernel/alloc.rs           | 30 ++++--------------------------
>>  rust/kernel/alloc/allocator.rs |  6 +++---
>>  rust/kernel/alloc/kbox.rs      |  4 ++--
>>  rust/kernel/alloc/kvec.rs      |  4 ++--
>>  rust/kernel/numa.rs            | 35 ++++++++++++++++++++++++++++++++++-
>>  5 files changed, 45 insertions(+), 34 deletions(-)
>>
>> diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
>> index 21067bde6860..9daddf540e7d 100644
>> --- a/rust/kernel/alloc.rs
>> +++ b/rust/kernel/alloc.rs
>> @@ -22,7 +22,10 @@
>>  #[derive(Copy, Clone, PartialEq, Eq, Debug)]
>>  pub struct AllocError;
>>  
>> -use crate::prelude::*;
>> +use crate::{
>> +    numa::NumaNode,
>> +    prelude::*, //
>> +};
>>  
>>  use core::{
>>      alloc::Layout,
>> @@ -114,31 +117,6 @@ pub mod flags {
>>      pub const __GFP_NOWARN: Flags = Flags(bindings::__GFP_NOWARN);
>>  }
>>  
>> -/// Non Uniform Memory Access (NUMA) node identifier.
>> -#[derive(Clone, Copy, PartialEq)]
>> -pub struct NumaNode(i32);
>> -
>> -impl NumaNode {
>> -    /// Create a new NUMA node identifier (non-negative integer).
>> -    ///
>> -    /// Returns [`EINVAL`] if a negative id or an id exceeding [`bindings::MAX_NUMNODES`] is
>> -    /// specified.
>> -    pub fn new(node: i32) -> Result<Self> {
>> -        // MAX_NUMNODES never exceeds 2**10 because NODES_SHIFT is 0..10.
>> -        if node < 0 || node >= bindings::MAX_NUMNODES as i32 {
>> -            return Err(EINVAL);
>> -        }
>> -        Ok(Self(node))
>> -    }
>> -}
>> -
>> -/// Specify necessary constant to pass the information to Allocator that the caller doesn't care
>> -/// about the NUMA node to allocate memory from.
>> -impl NumaNode {
>> -    /// No node preference.
>> -    pub const NO_NODE: NumaNode = NumaNode(bindings::NUMA_NO_NODE);
>> -}
>> -
>>  /// The kernel's [`Allocator`] trait.
>>  ///
>>  /// An implementation of [`Allocator`] can allocate, re-allocate and free memory buffers described
>> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
>> index cd4203f27aed..4af50e20933b 100644
>> --- a/rust/kernel/alloc/allocator.rs
>> +++ b/rust/kernel/alloc/allocator.rs
>> @@ -11,12 +11,12 @@
>>  use super::{
>>      AllocError,
>>      Allocator,
>> -    Flags,
>> -    NumaNode, //
>> +    Flags, //
>>  };
>>  
>>  use crate::{
>>      bindings,
>> +    numa::NumaNode,
>>      page, //
>>  };
>>  
>> @@ -122,7 +122,7 @@ unsafe fn call(
>>          // - Those functions provide the guarantees of this function.
>>          let raw_ptr = unsafe {
>>              // If `size == 0` and `ptr != NULL` the memory behind the pointer is freed.
>> -            self.0(ptr.cast(), size, layout.align(), flags.0, nid.0).cast()
>> +            self.0(ptr.cast(), size, layout.align(), flags.0, nid.as_raw()).cast()
>>          };
>>  
>>          let ptr = if size == 0 {
>> diff --git a/rust/kernel/alloc/kbox.rs b/rust/kernel/alloc/kbox.rs
>> index c63d6acdbb6f..0fa736c81287 100644
>> --- a/rust/kernel/alloc/kbox.rs
>> +++ b/rust/kernel/alloc/kbox.rs
>> @@ -13,12 +13,12 @@
>>  use super::{
>>      AllocError,
>>      Allocator,
>> -    Flags,
>> -    NumaNode, //
>> +    Flags, //
>>  };
>>  
>>  use crate::{
>>      fmt,
>> +    numa::NumaNode,
>>      page::AsPageIter,
>>      prelude::*,
>>      types::ForeignOwnable, //
>> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> index c7546b9da4fa..b669ca10b3f7 100644
>> --- a/rust/kernel/alloc/kvec.rs
>> +++ b/rust/kernel/alloc/kvec.rs
>> @@ -14,12 +14,12 @@
>>      AllocError,
>>      Allocator,
>>      Box,
>> -    Flags,
>> -    NumaNode, //
>> +    Flags, //
>>  };
>>  
>>  use crate::{
>>      fmt,
>> +    numa::NumaNode,
>>      page::{
>>          AsPageIter,
>>          PAGE_SIZE, //
>> diff --git a/rust/kernel/numa.rs b/rust/kernel/numa.rs
>> index 164e622d325f..4a3a880308f3 100644
>> --- a/rust/kernel/numa.rs
>> +++ b/rust/kernel/numa.rs
>> @@ -4,12 +4,15 @@
>>  //!
>>  //! C header: [`include/linux/nodemask.h`](srctree/include/linux/nodemask.h)
>>  
>> -use crate::bindings;
>>  #[cfg(CONFIG_NUMA)]
>>  use crate::sync::atomic::{
>>      Atomic,
>>      Relaxed, //
>>  };
>> +use crate::{
>> +    bindings,
>> +    prelude::*, //
>> +};
>>  
>>  /// Returns the number of online NUMA nodes.
>>  #[inline]
>> @@ -27,3 +30,33 @@ pub fn num_online_nodes() -> u32 {
>>          bindings::nr_online_nodes
>>      }
>>  }
>> +
>> +/// Non Uniform Memory Access (NUMA) node identifier.
>> +#[derive(Clone, Copy, PartialEq)]
>> +pub struct NumaNode(i32);
>
> FWIW the C type is nodemask_t and this should have mask in the name too. It is
> not an identifier. That said, this is an existing issue, so shouldn't block the
> move.

What makes you say this? This is not a mask, it is a numa node id, which
is represented as i32. `NUMA_NO_NODE` is a valid id.

I am using this to specify domain for block mq queues. If you take a
look at the allocation path:

  blk_mq_alloc_queue
  blk_alloc_queue
  slab_alloc_node

It's an id, named `numa_node`, `node_id`, `node`. Not a mask. Unless I
missed something?

Best regards,
Andreas Hindborg


