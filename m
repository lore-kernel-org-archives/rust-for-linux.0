Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8691ACED5
	for <rust-for-linux@vger.kernel.org>; Sat, 16 May 2026 02:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778899196; cv=none; b=s6Yk9CWl5dKDasXCAxnmncL2MlVxy805b75qkFLagLqXYfuuUEIxD+C6fnlkkm5q0WEQKie1aBA39CoLpYE4LZ27nujivwUEHv20N0FQkTj7F+6agcqXANyaxLNEUb6GQzxjrrHr3Zir01hmW6EjW7/ZlIwbfqVaCsc5DxFGw3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778899196; c=relaxed/simple;
	bh=Vv0Ktk82Klek2UkV0sKZPG9ErwIfcAdeXmiVLHbMyZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2e0lRC49coW5An3fBnunUvJWt8TQiiKREZwUNGztmmKXXaiXVP6zLXZAQYVhzXWwH29Rim9my6CgnT0BpC+t+h/5SQVtyCDIthA+jnqCB8NJHtcDdCTpzAtHjKdPof1sO9va1aHfBCveWNJ7Rvr0XZdrwxZbd7Y+HdngEgSDFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=OCWo1lrN; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="OCWo1lrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1778899184; x=1779158384;
	bh=/7ZTKQ8pptyWWcITBOwoHXKLiLNo+g3KMhG/i/Fb/+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OCWo1lrNdLyR8k/drjR6UhKHS71VMU4kPMqGi/kwNQz0s+E2c71YV6BbDUwHv7J9X
	 dCn8Q9oSJsSXUOSwews85t0Q3wXevJyd9UmRTy2rt83eae51PzgfdhI4+Jsj7vbTpp
	 aq9KYV5UPZ7YgbeX82CmiLBI6L9lRZFWmisVjUcM3Y+yh9tPCV1mhouoMz+pWK4190
	 W90JgaGsR4KLxAbd0A0xk12psdD/Hn2jMl6BPOTIfeWifynNUQBTniK9JsvbxnU/Ir
	 /qaPx1XsrFO9oXzJDwVAhopYofadP4kmT9mbJz2SdDc6JH0lOuACz+9WJlr9J2sMRg
	 JCComM2MhvcpA==
X-Pm-Submission-Id: 4gHSvd49Lzz1DDXM
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v12 0/2] rust: Add safe pointer formatting support
Date: Sat, 16 May 2026 05:39:34 +0300
Message-ID: <20260516023938.12863-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
References: <20260512-hashedptr-v12-0-61d5c7786889@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 12 May 2026 16:55:26 +0800=0D
Ke Sun <sunke@kylinos.cn> wrote:=0D
=0D
> This series fixes two issues with {:p} pointer formatting:=0D
> - The impl_fmt_adapter_forward! macro destructures self into a local=0D
>   variable, causing {:p} to print a stack address instead of the actual=0D
>   pointer=0D
> - Kernel address leak =E2=80=94 {:p} prints raw pointer values, exposing =
kernel=0D
>   address space layout=0D
> =0D
> ---=0D
> Changes in v12:=0D
> - Split into 2 patches: fix {:p} printing stack addresses =E2=86=92 route=
 {:p}=0D
>   through HashedPtr=0D
> - Test cleanup: NoHashPointersGuard RAII guard replaces raw=0D
>   save/restore; mod expected consolidates 32/64-bit constants=0D
> - Impl delegation: &T, &mut T, *mut T all forward to *const T (matching=0D
>   core library conventions), replacing v11's blanket impl + macro=0D
> - Link to v11: https://lore.kernel.org/r/20260205-hashedptr-v11-1-bd0fec7=
fe6f1@kylinos.cn=0D
> =0D
> Changes in v11:=0D
> - Fix inaccurate or inappropriate descriptions in comments=0D
> - Use as_char_ptr instead of as_ptr so that a *const u8 pointer is=0D
>   always passed to scnprintf on all architectures=0D
> - Per Tamir's suggestion, replace doctests with mod tests and adjust=0D
>   test content to make the tests more meaningful=0D
> - Remove the RawPtr wrapper type: it and HashedPtr use different=0D
>   formatting mechanisms (HashedPtr uses scnprintf and pad; RawPtr would=0D
>   call core's Pointer impl directly). This series focuses on fixing the=0D
>   issue that without it {:p} would output the pointer's stack address,=0D
>   and on using HashedPtr to safely format raw pointers and avoid leaking=
=0D
>   kernel address space layout information=0D
> - Link to v10: https://lore.kernel.org/r/20260121050059.2315091-1-sunke@k=
ylinos.cn=0D
> =0D
> Changes in v10:=0D
> - Merge all patches into a single patch=0D
> - Improve `kernel::fmt::Pointer` trait implementation=0D
> Link to v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@kyli=
nos.cn=0D
> =0D
> Changes in v9: https://lore.kernel.org/r/20260119033006.1453006-1-sunke@k=
ylinos.cn=0D
> - Refactor implementation to use Pointer trait and Adapter pattern=0D
>   instead of exporting ptr_to_hashval() from lib/vsprintf.c. Use=0D
>   scnprintf directly in Rust for pointer hashing, eliminating the=0D
>   need for C function export=0D
> - Move pointer wrapper types from rust/kernel/ptr.rs to=0D
>   rust/kernel/fmt.rs=0D
> - Split implementation into more granular patches: Pointer trait=0D
>   foundation, HashedPtr type, raw pointer default behavior, and=0D
>   RawPtr type=0D
> - Remove documentation patch, integrate examples into code doctests=0D
> - Simplify API and improve code organization following Display trait=0D
>   pattern=0D
> - Link to v8: https://lore.kernel.org/r/20260101081605.1300953-1-sunke@ky=
linos.cn=0D
> =0D
> Changes in v8:=0D
> - Remove RestrictedPtr (%pK) support: only export ptr_to_hashval() with=0D
>   EXPORT_SYMBOL_NS_GPL using "RUST_INTERNAL" namespace, provide only two=
=0D
>   pointer wrapper types (HashedPtr, RawPtr) for %p and %px=0D
> - Change API from HashedPtr::from(ptr) to HashedPtr(ptr) for direct=0D
>   construction=0D
> - Link to v7: https://lore.kernel.org/r/20251229072157.3857053-1-sunke@ky=
linos.cn=0D
> =0D
> Changes in v7:=0D
> - Refactor kptr_restrict handling: extract kptr_restrict_value() from=0D
>   restricted_pointer() in lib/vsprintf.c and export it for Rust use, and=
=0D
>   improve RestrictedPtr::fmt() implementation to directly handle=0D
>   kptr_restrict_value() return values (0, 1, 2, -1) for better code=0D
>   clarity=0D
> - Remove Debug derive from pointer wrapper types (HashedPtr,=0D
>   RestrictedPtr, RawPtr)=0D
> - Link to v6: https://lore.kernel.org/r/20251227033958.3713232-1-sunke@ky=
linos.cn=0D
> =0D
> Changes in v6:=0D
> - Fix placeholder formatting to use `f.pad()` instead of `f.write_str()`=
=0D
>   in format_hashed_ptr(), ensuring width, alignment, and padding options=
=0D
>   are correctly applied to PTR_PLACEHOLDER=0D
> - Link to v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@ky=
linos.cn=0D
> =0D
> Changes in v5: https://lore.kernel.org/r/20251226140751.2215563-1-sunke@k=
ylinos.cn=0D
> - Format use statements in rust/kernel/ptr.rs and rust/kernel/fmt.rs=0D
>   using kernel vertical style with alphabetical ordering=0D
> - Remove unnecessary SAFETY comment in rust/kernel/ptr.rs (addressed=0D
>   Clippy warning)=0D
> - Update type ordering to alphabetical (HashedPtr, RawPtr,=0D
>   RestrictedPtr) in fmt.rs macro invocation=0D
> - Link to v4: https://lore.kernel.org/r/20251225225709.3944255-1-sunke@ky=
linos.cn=0D
> =0D
> Changes in v4:=0D
> - Use Pointer::fmt() instead of write!(f, "{:p}", ...) to preserve=0D
>   formatting options (width, alignment, padding characters)=0D
> - Improve code structure: reduce unsafe block scope, use early return=0D
>   pattern=0D
> - Add doctests with formatting option tests for all pointer wrapper=0D
>   types=0D
> - Enhance documentation with detailed formatting options section,=0D
>   including examples for width, alignment, and padding=0D
> - Fix RestrictedPtr example to use pr_info! instead of seq_print! in=0D
>   docs=0D
> - Link to v3: https://lore.kernel.org/r/20251224081315.729684-1-sunke@kyl=
inos.cn=0D
> =0D
> Changes in v3:=0D
> - Export ptr_to_hashval() from lib/vsprintf.c for Rust pointer hashing=0D
> - Add three pointer wrapper types (HashedPtr, RestrictedPtr, RawPtr) in=0D
>   rust/kernel/ptr.rs corresponding to %p, %pK, and %px=0D
> - Make raw pointers automatically use HashedPtr when formatted with {:p}=
=0D
> - Add documentation for pointer wrapper types=0D
> - Link to v2: https://lore.kernel.org/r/20251223033018.2814732-1-sunke@ky=
linos.cn=0D
> =0D
> Changes in v2:=0D
> - Disabled {:p} raw pointer printing by default to prevent accidental=0D
>   information leaks=0D
> - Link to v1: https://lore.kernel.org/r/20251218032709.2184890-1-sunke@ky=
linos.cn=0D
> =0D
> Signed-off-by: Ke Sun <sunke@kylinos.cn>=0D
> =0D
> ---=0D
> Ke Sun (2):=0D
>       rust: fmt: fix {:p} printing stack addresses=0D
>       rust: fmt: route {:p} through HashedPtr to prevent address leaks=0D
> =0D
>  rust/kernel/fmt.rs | 178 +++++++++++++++++++++++++++++++++++++++++++++++=
+++++-=0D
>  1 file changed, 176 insertions(+), 2 deletions(-)=0D
> ---=0D
> base-commit: 50897c955902c93ae71c38698abb910525ebdc89=0D
> change-id: 20260512-hashedptr-22469b930113=0D
> =0D
> Best regards,=0D
> -- =0D
> Ke Sun <sunke@kylinos.cn>=0D
> =0D
=0D
FYI new versions are usually sent separately and should include the changel=
og=0D
(typically in the cover letter) as well as links to the previous versions.=
=0D
=0D
Onur=0D
