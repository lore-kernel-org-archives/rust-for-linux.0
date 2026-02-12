Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7892E8DE5
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 16:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770914493; cv=none; b=SR2JiNaoTat0EtnKbzOmKiEI/j7YHlRI/u4M1NMBDd9ae1cz2QcYON3VaNvFl9KQnDMq2E4cSY+bDrWUMzDhfabFfEXpnDzGtMnvXSkdJVDTMANBxPvFvYydw5nYuLdGnFRmmyjAZLu/gW8qlFxdVeRwjJ2RBF0ep12Xr/ffgDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770914493; c=relaxed/simple;
	bh=/em0vycJUev//9C294rbUyjSp3KxOkQmJ43mUQLyLvM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEUKFFoYRbFw/5RGfzeG2b6bkMTgaLbIuSQ18rHRJUg8ym3d+E4b1s5ticqg/gyEmsQKxeMCXrFXKpKpeSP34o8ZfLr+ythcL9RedI+Cf1xT9KvEzVYg+VLqkR6B89SGoGQzlmOJILwX9549J+HJAkHEIQWAL4Y/DXcjSFCNkdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaQT7wkz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaQT7wkz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F01C4CEF7;
	Thu, 12 Feb 2026 16:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770914493;
	bh=/em0vycJUev//9C294rbUyjSp3KxOkQmJ43mUQLyLvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iaQT7wkzliTomkugWH13K4WndQSukQSmwACh+aetI6PP59zOrNNkB0+u8TC7yAvm3
	 OOt9Kg+qysoWJ8UCikAnDD2kfFhLowWlD0qbcQA+0+cbELdYUDXG8p2yFsaebNFbOE
	 FwZg9+unhnIQqQxCaseYmflRm6FDFREcQ+A0CiIsU2WkSzow/8r9+8cW13jD7vriHG
	 WEwYIYKInqno5BIsxs/FkPBHojUxLlA2X1hAYgFn0L/2NXiTc7QcOkn5Ta1k0sgxhG
	 8PuvEm0adilGkJ+1npNxieQNXOR/gipdner1QQavf989Am/qSfNN1DSaP8H1xNSJiz
	 GC1S51ISAWDwg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 95F05F4006A;
	Thu, 12 Feb 2026 11:41:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Thu, 12 Feb 2026 11:41:31 -0500
X-ME-Sender: <xms:uwKOaXffM4dwfmVWPaVG5GjQMWrO3ZXcAnD-HJmEFygmVdfw3Y5P9A>
    <xme:uwKOaZLO06h__nKNxLLPa4nlukmyG1m5x3v6tnlPo1pj4q5us0aA2A8M0chIGA65Y
    2RjE8fsjuRHPII0-UrbjknNUiJ7QEVBtNxeRWageViPm4hi6oI_tg>
X-ME-Received: <xmr:uwKOaWq8P_urQ4mt5Heq_ijUOokE5UL5BlD6MqFIP3eFrR6Ql--oY4Sbf3fL6WsRm0c99fbaZBKKLmbeqlpbaH7kSV1XoQkI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdehkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghp
    thhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpth
    htoheplhhirghmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopeho
    jhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnrdhfvghnghesgh
    hmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgt
    phhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtth
    hopehlohhsshhinheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:uwKOafVNyP1_fEGhdsBtZ8uW7WbjbwR8Yt3TdFu1fptJeTDTIZlUKQ>
    <xmx:uwKOaR0C72Qbkg2MBfKH1-VEyz23hFuSdAFcXCOGeuEXwV0AeQ2lxA>
    <xmx:uwKOaQ2QjmspmBJ_1B4qr_cjYF82HnCYeBlvP7sfi1IFNNzYtCl3Sg>
    <xmx:uwKOaQkjuj3v8hb20-T4_aKrG9Yid48l5ye_kaVBNEyP8MH5twrKyQ>
    <xmx:uwKOaROYIQA5q-Pp9iDjMU1mknYd5BX5K8_Kb3BcFMRjpRi7Yo1HdJyX>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 11:41:29 -0500 (EST)
Date: Thu, 12 Feb 2026 08:41:28 -0800
From: Boqun Feng <boqun@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
Message-ID: <aY4CuCtBfkWZne0d@tardis.local>
References: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-page-volatile-io-v2-1-a36cb97d15c2@kernel.org>

On Thu, Feb 12, 2026 at 03:51:24PM +0100, Andreas Hindborg wrote:
> When copying data from buffers that are mapped to user space, it is
> impossible to guarantee absence of concurrent memory operations on those
> buffers. Copying data to/from `Page` from/to these buffers would be
> undefined behavior if no special considerations are made.
> 
> Add methods on `Page` to read and write the contents using byte-wise atomic
> operations.
> 

Thank you, but in this patch we still have "the given IO memory" and use
memcpy_{from,to}io() as the implementation, is that intended?

Regards,
Boqun

> Also improve clarity by specifying additional requirements on
> `read_raw`/`write_raw` methods regarding concurrent operations on involved
> buffers.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
> Changes in v2:
> - Rewrite patch with byte-wise atomic operations as foundation of operation.
> - Update subject and commit message.
> - Link to v1: https://lore.kernel.org/r/20260130-page-volatile-io-v1-1-19f3d3e8f265@kernel.org
> ---
>  rust/kernel/page.rs        | 65 ++++++++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/sync/atomic.rs | 32 +++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
> 
> diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
> index 432fc0297d4a8..febe9621adee6 100644
> --- a/rust/kernel/page.rs
> +++ b/rust/kernel/page.rs
> @@ -7,6 +7,7 @@
>      bindings,
>      error::code::*,
>      error::Result,
> +    ffi::c_void,
>      uaccess::UserSliceReader,
>  };
>  use core::{
> @@ -260,6 +261,8 @@ fn with_pointer_into_page<T>(
>      /// # Safety
>      ///
>      /// * Callers must ensure that `dst` is valid for writing `len` bytes.
> +    /// * Callers must ensure that there are no other concurrent reads or writes to/from the
> +    ///   destination memory region.
>      /// * Callers must ensure that this call does not race with a write to the same page that
>      ///   overlaps with this read.
>      pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
> @@ -274,6 +277,34 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
>          })
>      }
>  
> +    /// Maps the page and reads from it into the given IO memory region using byte-wise atomic
> +    /// memory operations.
> +    ///
> +    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
> +    /// outside of the page, then this call returns [`EINVAL`].
> +    ///
> +    /// # Safety
> +    /// Callers must ensure that:
> +    ///
> +    /// - `dst` is valid for writes for `len` bytes for the duration of the call.
> +    /// - For the duration of the call, other accesses to the area described by `dst` and `len`,
> +    ///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
> +    ///   function. Note that if all other accesses are atomic, then this safety requirement is
> +    ///   trivially fulfilled.
> +    ///
> +    /// [`LKMM`]: srctree/tools/memory-model
> +    pub unsafe fn read_bytewise_atomic(&self, dst: *mut u8, offset: usize, len: usize) -> Result {
> +        self.with_pointer_into_page(offset, len, move |src| {
> +            // SAFETY: If `with_pointer_into_page` calls into this closure, then
> +            // it has performed a bounds check and guarantees that `src` is
> +            // valid for `len` bytes.
> +            //
> +            // There caller guarantees that there is no data race at the source.
> +            unsafe { bindings::memcpy_toio(dst.cast::<c_void>(), src.cast::<c_void>(), len) };
> +            Ok(())
> +        })
> +    }
> +
>      /// Maps the page and writes into it from the given buffer.
>      ///
>      /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
> @@ -282,6 +313,7 @@ pub unsafe fn read_raw(&self, dst: *mut u8, offset: usize, len: usize) -> Result
>      /// # Safety
>      ///
>      /// * Callers must ensure that `src` is valid for reading `len` bytes.
> +    /// * Callers must ensure that there are no concurrent writes to the source memory region.
>      /// * Callers must ensure that this call does not race with a read or write to the same page
>      ///   that overlaps with this write.
>      pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Result {
> @@ -295,6 +327,39 @@ pub unsafe fn write_raw(&self, src: *const u8, offset: usize, len: usize) -> Res
>          })
>      }
>  
> +    /// Maps the page and writes into it from the given IO memory region using byte-wise atomic
> +    /// memory operations.
> +    ///
> +    /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
> +    /// outside of the page, then this call returns [`EINVAL`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that:
> +    ///
> +    /// - `src` is valid for reads for `len` bytes for the duration of the call.
> +    /// - For the duration of the call, other accesses to the area described by `src` and `len`,
> +    ///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
> +    ///   function. Note that if all other accesses are atomic, then this safety requirement is
> +    ///   trivially fulfilled.
> +    ///
> +    /// [`LKMM`]: srctree/tools/memory-model
> +    pub unsafe fn write_bytewise_atomic(
> +        &self,
> +        src: *const u8,
> +        offset: usize,
> +        len: usize,
> +    ) -> Result {
> +        self.with_pointer_into_page(offset, len, move |dst| {
> +            // SAFETY: If `with_pointer_into_page` calls into this closure, then it has performed a
> +            // bounds check and guarantees that `dst` is valid for `len` bytes.
> +            //
> +            // There caller guarantees that there is no data race at the destination.
> +            unsafe { bindings::memcpy_fromio(dst.cast::<c_void>(), src.cast::<c_void>(), len) };
> +            Ok(())
> +        })
> +    }
> +
>      /// Maps the page and zeroes the given slice.
>      ///
>      /// This method will perform bounds checks on the page offset. If `offset .. offset+len` goes
> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
> index 4aebeacb961a2..8ab20126a88cf 100644
> --- a/rust/kernel/sync/atomic.rs
> +++ b/rust/kernel/sync/atomic.rs
> @@ -560,3 +560,35 @@ pub fn fetch_add<Rhs, Ordering: ordering::Ordering>(&self, v: Rhs, _: Ordering)
>          unsafe { from_repr(ret) }
>      }
>  }
> +
> +/// Copy `len` bytes from `src` to `dst` using byte-wise atomic operations.
> +///
> +/// This copy operation is volatile.
> +///
> +/// # Safety
> +///
> +/// Callers must ensure that:
> +///
> +/// - `src` is valid for reads for `len` bytes for the duration of the call.
> +/// - `dst` is valid for writes for `len` bytes for the duration of the call.
> +/// - For the duration of the call, other accesses to the areas described by `src`, `dst` and `len`,
> +///   must not cause data races (defined by [`LKMM`]) against atomic operations executed by this
> +///   function. Note that if all other accesses are atomic, then this safety requirement is
> +///   trivially fulfilled.
> +///
> +/// [`LKMM`]: srctree/tools/memory-model
> +pub unsafe fn atomic_per_byte_memcpy(src: *const u8, dst: *mut u8, len: usize) {
> +    // SAFETY: By the safety requirements of this function, the following operation will not:
> +    //  - Trap.
> +    //  - Invalidate any reference invariants.
> +    //  - Race with any operation by the Rust AM, as `bindings::memcpy` is a byte-wise atomic
> +    //    operation and all operations by the Rust AM to the involved memory areas use byte-wise
> +    //    atomic semantics.
> +    unsafe {
> +        bindings::memcpy(
> +            dst.cast::<kernel::ffi::c_void>(),
> +            src.cast::<kernel::ffi::c_void>(),
> +            len,
> +        )
> +    };
> +}
> 
> ---
> base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
> change-id: 20260130-page-volatile-io-05ff595507d3
> 
> Best regards,
> -- 
> Andreas Hindborg <a.hindborg@kernel.org>
> 
> 
