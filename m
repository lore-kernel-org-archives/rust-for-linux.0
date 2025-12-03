Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FB525BEE5;
	Wed,  3 Dec 2025 22:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764801368; cv=none; b=QW1VOO6zzfUsbQEPibhzpwl+qCaR39rxvEx+A8Y22VpMLb8idfh6DbNkUmituw5J9eIGItVlS8TQ2T04y3WPzGfbr5zd2KJ6CUmnTS701DsS6+fbZlSwPN9qL9eAtpsIms3Uxnir3gYE3LNOqraTRK43g9VWQdw6U+YVNHOJVQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764801368; c=relaxed/simple;
	bh=vW4Cbjor/q00oA7vfnZMEnZyPmWgP0e98tb3LwIUcxc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GILf4FxVAiCYV+wvIaTB3pN3+Ig+UbK3VUGqAl8fAd1F8BIah5jMmf72PqJhQVewPwmki5srSkQ2ztH95Dv7Ir+uzi/9DNXcHkpyfqcBfPwKT52DBqlu/PdwyuARLr1G3Npd/7MCKzGhtp3bEkw6guEsFlzpdI/ZrtEb+fwdCDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7sXL1CX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C7sXL1CX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5576CC4CEF5;
	Wed,  3 Dec 2025 22:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764801364;
	bh=vW4Cbjor/q00oA7vfnZMEnZyPmWgP0e98tb3LwIUcxc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C7sXL1CX6TU3ZEJ2F0dI23XNoQrHqm9DcjJfhAODHf423+Mw+SDFTgQ4Y7GDpdETf
	 KMCm5EtfiMTyfoaDEzirM98QApBARh7R/REHLvy8GD2FvZfFXSTpMqGQeUanzF9AWe
	 S1MT/6eibO75wySJhgVlnx+YGRkQlwluWtEJr5UfGyFBdnocUFln91UG9z8fZxE/cK
	 r2rI+lpD43AESEDsVm6R7Q0gqXfUT6LDnSt1FGjFbf97ekjidTV7NV24QcWG4L2nNE
	 SSA5A4H6RiEtXqq3vkD5yiWKkLLCiKwdUW3DyB5fhWihBxOmyDALLyE71hpr0vuWJr
	 PszHArLpFM2TA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Yury Norov <yury.norov@gmail.com>,
 Burak Emir <bqe@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary
 Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, Danilo
 Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH] rust: bitops: add helpers for _find_* functions
In-Reply-To: <20251203-bitops-find-helper-v1-1-5193deb57766@google.com>
References: <20251203-bitops-find-helper-v1-1-5193deb57766@google.com>
Date: Wed, 03 Dec 2025 23:35:54 +0100
Message-ID: <87ikenw5v9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alice Ryhl <aliceryhl@google.com> writes:

> On 32-bit ARM, _find_next_bit does not exist because ARM provides that
> function through a #define instead. This means that Rust, which calls
> the underscored version, fails to find it. This triggers errors:
>
> 	ld.lld: error: undefined symbol: _find_next_bit
> 	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
> 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_borrow) in archive vmlinux.a
> 	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
> 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
> 	>>> referenced by bitmap.rs:459 (rust/kernel/bitmap.rs:459)
> 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
> 	>>> referenced 10 more times
>
> 	ld.lld: error: undefined symbol: _find_next_zero_bit
> 	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
> 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_copy) in archive vmlinux.a
> 	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
> 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_bitmap_set_clear_find) in archive vmlinux.a
> 	>>> referenced by bitmap.rs:479 (rust/kernel/bitmap.rs:479)
> 	>>>               rust/kernel.o:(kernel::bitmap::tests::kunit_rust_wrapper_owned_bitmap_out_of_bounds) in archive vmlinux.a
> 	>>> referenced 6 more times
>
> To fix this, add Rust helpers in this particular case.
>
> Fixes: 6cf93a9ed39e ("rust: add bindings for bitops.h")
> Reported-by: Andreas Hindborg <a.hindborg@kernel.org>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561677301
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/helpers/bitops.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>
> diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
> index 5d0861d29d3f0d705a014ae4601685828405f33b..84061af591a261f7268ffe6535282bf3c7608e2d 100644
> --- a/rust/helpers/bitops.c
> +++ b/rust/helpers/bitops.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  #include <linux/bitops.h>
> +#include <linux/find.h>
>  
>  void rust_helper___set_bit(unsigned long nr, unsigned long *addr)
>  {
> @@ -21,3 +22,34 @@ void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
>  {
>  	clear_bit(nr, addr);
>  }
> +
> +/*
> + * Rust normally calls the single-underscore-prefixed version of these
> + * functions, which are not inlined. However, on some platforms, they do not
> + * exist. In those cases, provide a rust helper for the underscored version.
> + */
> +#ifdef find_next_zero_bit
> +__rust_helper unsigned long
> +rust_helper__find_next_zero_bit(const unsigned long *addr, unsigned long size,
> +				unsigned long offset)
> +{
> +	return find_next_zero_bit(addr, size, offset);
> +}
> +#endif /* find_next_zero_bit */
> +
> +#ifdef find_next_bit
> +__rust_helper unsigned long
> +rust_helper__find_next_bit(const unsigned long *addr, unsigned long size,
> +			   unsigned long offset)
> +{
> +	return find_next_bit(addr, size, offset);
> +}
> +#endif /* find_next_bit */
> +
> +#ifdef find_last_bit
> +__rust_helper unsigned long
> +rust_helper__find_last_bit(const unsigned long *addr, unsigned long size)
> +{
> +	return find_last_bit(addr, size);
> +}
> +#endif /* find_last_bit */
>
> ---
> base-commit: 54e3eae855629702c566bd2e130d9f40e7f35bde
> change-id: 20251203-bitops-find-helper-25ed1bbae700
>
> Best regards,
> -- 
> Alice Ryhl <aliceryhl@google.com>

I messed up when testing this patch. It actually does not solve the
issue.

It appears that bindgen will emit an extern "C" declaration for the
missing C functions, even though they are not in the symbol table. When
we add the rust helpers, the declarations emitted based on the
non-existent C functions will mask the rust helper functions.

We can circumvent this by using another name for our helper. While it
works, it is not fixing the root cause. I am not sure why bindgen emits
these functions even though they are not in the symbol table at the end.

At any rate, the following is a workaround:

diff --git a/rust/helpers/bitops.c b/rust/helpers/bitops.c
index 5d0861d29d3f0..4f15315bc47f2 100644
--- a/rust/helpers/bitops.c
+++ b/rust/helpers/bitops.c
@@ -21,3 +21,26 @@ void rust_helper_clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
    clear_bit(nr, addr);
 }
+
+/*
+ * Rust normally calls the single-underscore-prefixed version of these
+ * functions, which are not inlined. However, on some platforms, they do not
+ * exist. In those cases, provide a rust helper for the underscored version.
+ */
+#ifdef find_next_zero_bit
+__rust_helper unsigned long
+rust_helper_r_find_next_zero_bit(const unsigned long *addr, unsigned long size,
+               unsigned long offset)
+{
+   return find_next_zero_bit(addr, size, offset);
+}
+#endif /* find_next_zero_bit */
+
+#ifdef find_next_bit
+__rust_helper unsigned long
+rust_helper_r_find_next_bit(const unsigned long *addr, unsigned long size,
+              unsigned long offset)
+{
+   return find_next_bit(addr, size, offset);
+}
+#endif /* find_next_bit */
diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index aa8fc7bf06fc9..88af73edb0c21 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -456,7 +456,7 @@ pub fn next_bit(&self, start: usize) -> Option<usize> {
         );
         // SAFETY: `_find_next_bit` tolerates out-of-bounds arguments and returns a
         // value larger than or equal to `self.len()` in that case.
-        let index = unsafe { bindings::_find_next_bit(self.as_ptr(), self.len(), start) };
+        let index = unsafe { bindings::r_find_next_bit(self.as_ptr(), self.len(), start) };
         if index >= self.len() {
             None
         } else {
@@ -476,7 +476,7 @@ pub fn next_zero_bit(&self, start: usize) -> Option<usize> {
         );
         // SAFETY: `_find_next_zero_bit` tolerates out-of-bounds arguments and returns a
         // value larger than or equal to `self.len()` in that case.
-        let index = unsafe { bindings::_find_next_zero_bit(self.as_ptr(), self.len(), start) };
+        let index = unsafe { bindings::r_find_next_zero_bit(self.as_ptr(), self.len(), start) };
         if index >= self.len() {
             None
         } else {



Best regards,
Andreas Hindborg


