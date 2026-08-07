Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CE841D107
	for <rust-for-linux@vger.kernel.org>; Fri,  7 Aug 2026 10:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097619; cv=none; b=K8Udxtc22VSUkLLlgYFIZ7aaQA8EShyTqVaV85EsLKBFGUJdQeSO0MUJeBJrn6KNtkB3B+EWUVR9Zvns9hEoNnTqmHT+y2mwv6xY0M/7gUSAW/lWDe+fNXb2R+UXOKiDL/Nb/6hZEFqEVnRyo2FzM7jG6bmbSNcnV1SE6VvjJ5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097619; c=relaxed/simple;
	bh=cgVeXfY4D7XgRd61FmsMq2MxGZMe2bl5WW4aV8vgr7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIRb5fxgYUSsHqjsDvNeMGCbXaOSy5Oc9w73R+J5UQvQFQIquQi0YobcQiIkE7hdIEOuEw80syH3K1n+zfIUwyRRGJgpLNvnyf65yMwUOVf1IB0OgQISd4BWgzPMU+YsSvpLI+AFff5quU3MLxJhRewrcQR25xQBjZacL/tlqlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 13D0870A36B4; Fri, 07 Aug 2026 12:13:28 +0200 (CEST)
Date: Fri, 7 Aug 2026 12:13:28 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v14 0/2] rust: Add safe pointer formatting support
Message-ID: <anWvyOP2rISjXkXn@desktop>
References: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260807-hashedptr-v14-0-817009769ffb@kylinos.cn>
Jabber-ID: linkmauve@linkmauve.fr

Hi,

This v14 indeed fixes things, my driver now always prints (ptrval) when
loaded the first time (I have to rmmod && modprobe it again for it to
display actual virtual addresses, not sure if I’m doing something wrong
here) instead of 0x(ptrval)!

Tested-by: Link Mauve <linkmauve@linkmauve.fr>

On Fri, Aug 07, 2026 at 04:14:52PM +0800, Ke Sun wrote:
> This series fixes two issues with {:p} pointer formatting:
> - The impl_fmt_adapter_forward! macro destructures self into a local
>   variable, causing {:p} to print a stack address instead of the actual
>   pointer
> - Kernel address leak - {:p} prints raw pointer values, exposing kernel
>   address space layout
> 
> ---
> Changes in v14:
> - Use `%#0*p` for `0x` prefix and zero-padding (Gary); this also avoids
>   "0x(...)" for placeholder tokens like "(____ptrval____)" (Alice)
> - Simplify pointer impls per Gary
> - Link to v13: https://lore.kernel.org/r/20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn
> 
> Changes in v13:
> - Add NonNull<T> pointer formatting support
> - Add #[inline] to all Pointer impl methods
> - Support zero-padding format ({:0width$p})
> - Simplify SAFETY comments
> - Rewrite tests: remove NoHashPointersGuard - modifying
>   no_hash_pointers after boot panics since it's __ro_after_init; read
>   current value and branch instead; expand format coverage
> - Link to v12: https://lore.kernel.org/r/20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn
> 
> Changes in v12:
> - Split into 2 patches: fix {:p} printing stack addresses -> route {:p}
>   through HashedPtr
> - Test cleanup: NoHashPointersGuard RAII guard replaces raw
>   save/restore; mod expected consolidates 32/64-bit constants
> - Impl delegation: &T, &mut T, *mut T all forward to *const T (matching
>   core library conventions), replacing v11's blanket impl + macro
> - Link to v11: https://lore.kernel.org/r/20260205-hashedptr-v11-1-bd0fec7fe6f1@kylinos.cn
> 
> Changes in v11:
> - Fix inaccurate or inappropriate descriptions in comments
> - Use as_char_ptr instead of as_ptr so that a *const u8 pointer is
>   always passed to scnprintf on all architectures
> - Per Tamir's suggestion, replace doctests with mod tests and adjust
>   test content to make the tests more meaningful
> - Remove the RawPtr wrapper type: it and HashedPtr use different
>   formatting mechanisms (HashedPtr uses scnprintf and pad; RawPtr would
>   call core's Pointer impl directly). This series focuses on fixing the
>   issue that without it {:p} would output the pointer's stack address,
>   and on using HashedPtr to safely format raw pointers and avoid leaking
>   kernel address space layout information
> - Link to v10: https://lore.kernel.org/r/20260121050059.2315091-1-sunke@kylinos.cn
> 
> Changes in v10:
> - Merge all patches into a single patch
> - Improve `kernel::fmt::Pointer` trait implementation
> Link to v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn
> 
> Changes in v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn
> - Refactor implementation to use Pointer trait and Adapter pattern
>   instead of exporting ptr_to_hashval() from lib/vsprintf.c. Use
>   scnprintf directly in Rust for pointer hashing, eliminating the
>   need for C function export
> - Move pointer wrapper types from rust/kernel/ptr.rs to
>   rust/kernel/fmt.rs
> - Split implementation into more granular patches: Pointer trait
>   foundation, HashedPtr type, raw pointer default behavior, and
>   RawPtr type
> - Remove documentation patch, integrate examples into code doctests
> - Simplify API and improve code organization following Display trait
>   pattern
> - Link to v8: https://lore.kernel.org/r/20260101081605.1300953-1-sunke@kylinos.cn
> 
> Changes in v8:
> - Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
>   EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
>   pointer wrapper types (HashedPtr, RawPtr) for %p and %px
> - Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct
>   construction
> - Link to v7: https://lore.kernel.org/r/20251229072157.3857053-1-sunke@kylinos.cn
> 
> Changes in v7:
> - Refactor kptr_restrict handling: extract kptr_restrict_value() from
>   restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
>   improve RestrictedPtr::fmt() implementation to directly handle
>   kptr_restrict_value() return values (0, 1, 2, -1) for better code
>   clarity
> - Remove Debug derive from pointer wrapper types (HashedPtr,
>   RestrictedPtr, RawPtr)
> - Link to v6: https://lore.kernel.org/r/20251227033958.3713232-1-sunke@kylinos.cn
> 
> Changes in v6:
> - Fix placeholder formatting to use `f.pad()` instead of `f.write_str()`
>   in format_hashed_ptr(), ensuring width, alignment, and padding options
>   are correctly applied to PTR_PLACEHOLDER
> - Link to v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn
> 
> Changes in v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn
> - Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs
>   using kernel vertical style with alphabetical ordering
> - Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed
>   Clippy warning)
> - Update type ordering to alphabetical (HashedPtr, RawPtr,
>   RestrictedPtr) in fmt.rs macro invocation
> - Link to v4: https://lore.kernel.org/r/20251225225709.3944255-1-sunke@kylinos.cn
> 
> Changes in v4:
> - Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve
>   formatting options (width, alignment, padding characters)
> - Improve code structure: reduce unsafe block scope, use early return
>   pattern
> - Add doctests with formatting option tests for all pointer wrapper
>   types
> - Enhance documentation with detailed formatting options section,
>   including examples for width, alignment, and padding
> - Fix RestrictedPtr example to use pr_info! instead of seq_print! in
>   docs
> - Link to v3: https://lore.kernel.org/r/20251224081315.729684-1-sunke@kylinos.cn
> 
> Changes in v3:
> - Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
> - Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
>   rust/kernel/ptr.rs corresponding to %p, %pK, and %px
> - Make raw pointers automatically use HashedPtr when formatted with {:p}
> - Add documentation for pointer wrapper types
> - Link to v2: https://lore.kernel.org/r/20251223033018.2814732-1-sunke@kylinos.cn
> 
> Changes in v2:
> - Disabled {:p} raw pointer printing by default to prevent accidental
>   information leaks
> - Link to v1: https://lore.kernel.org/r/20251218032709.2184890-1-sunke@kylinos.cn
> 
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
> 
> ---
> Ke Sun (2):
>       rust: fmt: fix {:p} printing stack addresses
>       rust: fmt: route {:p} through HashedPtr to prevent address leaks
> 
>  rust/kernel/fmt.rs | 173 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 171 insertions(+), 2 deletions(-)
> ---
> base-commit: 6946cd5d0aa4dd10a414ddcb7a10844fdb0ad345
> change-id: 20260512-hashedptr-22469b930113
> 
> Best regards,
> -- 
> Ke Sun <sunke@kylinos.cn>
> 
> 

-- 
Link Mauve
