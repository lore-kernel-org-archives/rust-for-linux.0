Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878E62EC097
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 20:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770410634; cv=none; b=gdmDxCo4oaJ3h3PsT3Y0wDikgWxaTSmhgocqv+08nQCl+QEGhwKVcpunNlkG5vWt9r3GGCjn5PEOhyHgsqXLxlbLAX5coCTjxwQMXSLXiqj/Mfo9CPFnUn9AUjgl/e0HrXjFxAc2IGLjoNt+CYNGIcTUd/EveSHoD0v+CRXGTug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770410634; c=relaxed/simple;
	bh=lOQTh3N76+pVqpfnPAj9BUHW9/J+eWirnb9+qSPVER8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqF2M6bAasslrqkY6NX0gl4hexdZ48oB7ueE5A/tObRwgU8EDqUbyziNjSXTygc8ymVZTVWE8kZVeQYjpM0V0lTSvPJHjRCkZo8gLZCuteGRtHPTIcM4TAwiDEhPQXZ1JYo+MsL9McqcTMziBuTJzmebuEbyijz4TjYkkrYcsQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EeFHLj+t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EeFHLj+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 081D6C19421;
	Fri,  6 Feb 2026 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770410634;
	bh=lOQTh3N76+pVqpfnPAj9BUHW9/J+eWirnb9+qSPVER8=;
	h=From:To:Cc:Subject:Date:From;
	b=EeFHLj+tTElyLEltU7mlAn1VFsIwIQixdqDGTsbY9kcLd76AvFpjcannx/5EkRLbS
	 3zqqL52zH8Q+Gza00TgS6xm2KxuM2rWU4Q6BDJT2VOyDrX0aLOo4BxZrqwysKXib+G
	 zY3GZ0n1RzIQa2+Oisc7KOZqPOAHfxXk6uDaLKBbO6RiGz7rHKbk8hM99WOydxfx3z
	 mBykLF7zvfr/MITV6OjubEG6R14UPL6uIsQskd9K+/hJpOmZZuvtmoSEWCczdvcjez
	 mTyBTW8lAYb7n/KVUWn0yoZbX25y+PANP1KcAD/B5/4g1zDiqGz3Nn5sktulVegMYu
	 mq2HgFuRbZDRw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH] objtool/rust: add one more `noreturn` Rust function
Date: Fri,  6 Feb 2026 21:43:36 +0100
Message-ID: <20260206204336.38462-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`objtool` with Rust 1.84.0 reports:

    rust/kernel.o: error: objtool: _RNvXNtNtCsaRPFapPOzLs_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix14from_str_radix()
    falls through to next function _RNvXNtNtCsaRPFapPOzLs_6kernel3str9parse_intaNtNtB2_7private12FromStrRadix16from_u64_negated()

This is very similar to commit c18f35e49049 ("objtool/rust: add one more
`noreturn` Rust function"), which added `from_ascii_radix_panic` for Rust
1.86.0, except that Rust 1.84.0 ends up needing `from_str_radix_panic`.

Thus add it to the list to fix the warning.

Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>
Fixes: 51d9ee90ea90 ("rust: str: add radix prefixed integer parsing functions")
Reported-by: Alice Ryhl <aliceryhl@google.com>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291565/topic/x/with/572427627
Tested-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 tools/objtool/check.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 719ec727efd4..7cfb8c8f2fab 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -197,7 +197,8 @@ static bool is_rust_noreturn(const struct symbol *func)
 	 * as well as changes to the source code itself between versions (since
 	 * these come from the Rust standard library).
 	 */
-	return str_ends_with(func->name, "_4core3num22from_ascii_radix_panic")				||
+	return str_ends_with(func->name, "_4core3num20from_str_radix_panic")				||
+	       str_ends_with(func->name, "_4core3num22from_ascii_radix_panic")				||
 	       str_ends_with(func->name, "_4core5sliceSp15copy_from_slice17len_mismatch_fail")		||
 	       str_ends_with(func->name, "_4core6option13expect_failed")				||
 	       str_ends_with(func->name, "_4core6option13unwrap_failed")				||

base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
-- 
2.53.0

