Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623B37CD28
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 02:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783304703; cv=none; b=s6XthwYxkCyoFWvZy4SczTbnmYUMQVuWnuBwLLX4hHicPXb8tcthseX+pLkDFMg6SLl7lISZhEgrIjMwS4CIBhaERlBOMrjcDnh96cJO04uHn6vMWlLiDiK8tMae6eX6q0EtzVY8T19RQxUdov7L7EcXnGpGQ4OtQxucyZibaDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783304703; c=relaxed/simple;
	bh=17zsfCFJB4fhKu0Vq8Lj1R1lAP1yvkcMjskS4hG6GiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAzNv+uzZJd6A6rq7P/QTdp4NIazzveCc+3xR+215msyprV4k5QfhF2kqrez5N+wsnXJ4nAy+P0jFMJbmXLJ+PtQc02bHr4da+eIE3A/H0J2BfdJ7mfuIVOYeqTIkK9gZKwbZivcmYnVGruQoTPMgN90LsXtvCuBZZcMRSk6ZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=F7Oi5g0i; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="F7Oi5g0i"
Message-ID: <f28de0ac-0ccb-49f1-9e8b-4d13de55ba1b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783304699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PYcV0cC3oRewXPB0MvdVJXcGV8oI4V3HWs6AGHQV5n0=;
	b=F7Oi5g0iP7s8YII5cs+kumtMfvxlPxuMYs+m8EXtR0KHEXsr6Zp+M0EJ9au48a6rdjocUy
	eaFsq+koWG/gr8ATDJgmGBZbO/IrzqgNWJShVTPcYbQceYoQnNisU/f/7dyPgH9W+pguFk
	h9CcptSyEcH1rZCmfmfgU9nUgw/2M3o=
Date: Mon, 6 Jul 2026 10:24:48 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v13 0/6] rust: Add safe pointer formatting support
To: Ke Sun <sunke@kylinos.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 David Gow <david@davidgow.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Jann Horn <jannh@google.com>, stable@kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20260706-hashedptr-v13-0-e32a15ee2854@kylinos.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260706-hashedptr-v13-0-e32a15ee2854@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Please ignore this email, as the b4 command was used incorrectly.

Best regard,
Alvin

On 7/6/26 10:09, Ke Sun wrote:
> This series fixes two issues with {:p} pointer formatting:
> - The impl_fmt_adapter_forward! macro destructures self into a local
>    variable, causing {:p} to print a stack address instead of the actual
>    pointer
> - Kernel address leak — {:p} prints raw pointer values, exposing kernel
>    address space layout
>
> ---
> Changes in v13:
> - Add NonNull<T> pointer formatting support
> - Add #[inline] to all Pointer impl methods
> - Support zero-padding format ({:0width$p})
> - Simplify SAFETY comments
> - Rewrite tests: remove NoHashPointersGuard — modifying
>    no_hash_pointers after boot panics since it's __ro_after_init; read
>    current value and branch instead; expand format coverage
> - Link to v12: https://lore.kernel.org/r/20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn
>
> Changes in v12:
> - Split into 2 patches: fix {:p} printing stack addresses → route {:p}
>    through HashedPtr
> - Test cleanup: NoHashPointersGuard RAII guard replaces raw
>    save/restore; mod expected consolidates 32/64-bit constants
> - Impl delegation: &T, &mut T, *mut T all forward to *const T (matching
>    core library conventions), replacing v11's blanket impl + macro
> - Link to v11: https://lore.kernel.org/r/20260205-hashedptr-v11-1-bd0fec7fe6f1@kylinos.cn
>
> Changes in v11:
> - Fix inaccurate or inappropriate descriptions in comments
> - Use as_char_ptr instead of as_ptr so that a *const u8 pointer is
>    always passed to scnprintf on all architectures
> - Per Tamir's suggestion, replace doctests with mod tests and adjust
>    test content to make the tests more meaningful
> - Remove the RawPtr wrapper type: it and HashedPtr use different
>    formatting mechanisms (HashedPtr uses scnprintf and pad; RawPtr would
>    call core's Pointer impl directly). This series focuses on fixing the
>    issue that without it {:p} would output the pointer's stack address,
>    and on using HashedPtr to safely format raw pointers and avoid leaking
>    kernel address space layout information
> - Link to v10: https://lore.kernel.org/r/20260121050059.2315091-1-sunke@kylinos.cn
>
> Changes in v10:
> - Merge all patches into a single patch
> - Improve `kernel::fmt::Pointer` trait implementation
> Link to v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn
>
> Changes in v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kylinos.cn
> - Refactor implementation to use Pointer trait and Adapter pattern
>    instead of exporting ptr_to_hashval() from lib/vsprintf.c. Use
>    scnprintf directly in Rust for pointer hashing, eliminating the
>    need for C function export
> - Move pointer wrapper types from rust/kernel/ptr.rs to
>    rust/kernel/fmt.rs
> - Split implementation into more granular patches: Pointer trait
>    foundation, HashedPtr type, raw pointer default behavior, and
>    RawPtr type
> - Remove documentation patch, integrate examples into code doctests
> - Simplify API and improve code organization following Display trait
>    pattern
> - Link to v8: https://lore.kernel.org/r/20260101081605.1300953-1-sunke@kylinos.cn
>
> Changes in v8:
> - Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with
>    EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two
>    pointer wrapper types (HashedPtr, RawPtr) for %p and %px
> - Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct
>    construction
> - Link to v7: https://lore.kernel.org/r/20251229072157.3857053-1-sunke@kylinos.cn
>
> Changes in v7:
> - Refactor kptr_restrict handling: extract kptr_restrict_value() from
>    restricted_pointer() in lib/vsprintf.c and export it for Rust use, and
>    improve RestrictedPtr::fmt() implementation to directly handle
>    kptr_restrict_value() return values (0, 1, 2, -1) for better code
>    clarity
> - Remove Debug derive from pointer wrapper types (HashedPtr,
>    RestrictedPtr, RawPtr)
> - Link to v6: https://lore.kernel.org/r/20251227033958.3713232-1-sunke@kylinos.cn
>
> Changes in v6:
> - Fix placeholder formatting to use `f.pad()` instead of `f.write_str()`
>    in format_hashed_ptr(), ensuring width, alignment, and padding options
>    are correctly applied to PTR_PLACEHOLDER
> - Link to v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn
>
> Changes in v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@kylinos.cn
> - Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs
>    using kernel vertical style with alphabetical ordering
> - Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed
>    Clippy warning)
> - Update type ordering to alphabetical (HashedPtr, RawPtr,
>    RestrictedPtr) in fmt.rs macro invocation
> - Link to v4: https://lore.kernel.org/r/20251225225709.3944255-1-sunke@kylinos.cn
>
> Changes in v4:
> - Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve
>    formatting options (width, alignment, padding characters)
> - Improve code structure: reduce unsafe block scope, use early return
>    pattern
> - Add doctests with formatting option tests for all pointer wrapper
>    types
> - Enhance documentation with detailed formatting options section,
>    including examples for width, alignment, and padding
> - Fix RestrictedPtr example to use pr_info! instead of seq_print! in
>    docs
> - Link to v3: https://lore.kernel.org/r/20251224081315.729684-1-sunke@kylinos.cn
>
> Changes in v3:
> - Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing
> - Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in
>    rust/kernel/ptr.rs corresponding to %p, %pK, and %px
> - Make raw pointers automatically use HashedPtr when formatted with {:p}
> - Add documentation for pointer wrapper types
> - Link to v2: https://lore.kernel.org/r/20251223033018.2814732-1-sunke@kylinos.cn
>
> Changes in v2:
> - Disabled {:p} raw pointer printing by default to prevent accidental
>    information leaks
> - Link to v1: https://lore.kernel.org/r/20251218032709.2184890-1-sunke@kylinos.cn
>
> Signed-off-by: Ke Sun <sunke@kylinos.cn>
>
> ---
> Ke Sun (2):
>        rust: fmt: fix {:p} printing stack addresses
>        rust: fmt: route {:p} through HashedPtr to prevent address leaks
>
>   rust/kernel/fmt.rs | 173 ++++++++++++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 171 insertions(+), 2 deletions(-)
> ---
> base-commit: bb1459368dd795c43380057523f571d5eb0ddded
> change-id: 20260512-hashedptr-22469b930113
> prerequisite-change-id: 20260512-clean-fmt-use-5c2289d13741:v1
> prerequisite-patch-id: 4ad50fd407b8f4aeb3a0e148e34b298077fa5754
>
> Best regards,
