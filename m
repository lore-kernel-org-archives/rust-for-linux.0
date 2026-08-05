Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12553947B0
	for <rust-for-linux@vger.kernel.org>; Wed,  5 Aug 2026 14:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941135; cv=none; b=X/rukNh9NzenWDqFnP32qH+zKL23gCkKr43uoeb/jvZs0C8B4sfnYA4wLLscL67x6ZvX7hrOre9Zljz02iPdDX/Ov4X0DvTK2hox9N51Y6lvCGGjZudYNP8Nu/ccLgwUWlY5vpd8CGcQh1UJIhuhJPbY71Xk/JUJ/SxJtU0QgyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941135; c=relaxed/simple;
	bh=7VbnAvKoRWiogwuVjI8W41lUoSWxth381Ls8jXRz1fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ovrm0UHKwqKrrIafmqjxn2QGtTXiYlPoJ2F7gho/yy9yA5XovWgz2GAC5EfwnZKMpzuJ8l6gCSmzy7gFFmje+dil++zbcMRVVDviWrGcnmb/KC0Z1YHbj7mKimqDh7FPDCwxXKaqicvLdygCeO/0EdlaF4jHo29N/XFnvu6SxOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBHKenLH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBHKenLH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FFF1F000E9;
	Wed,  5 Aug 2026 14:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785941133;
	bh=5fH3GJGQkZc4X1LUlduyzneKyR8YoUFa5zrDwn4VTtM=;
	h=From:To:Cc:Subject:Date;
	b=YBHKenLHC9LhgM6jPbuHtxBSVkEfjZ+1XmQxqitA3i/A4SI5ExRvi5ANAv/i5rIAJ
	 gTTnHTno26uc8+nMjG8rXwSPZkE2FPwHMz4vIE8h58svTN9zpv165kNACmXvsRgRsi
	 Waz5SpOFr4xc3bhf8swcW4c3gCkTTbg5b8MMHaAFWpICptZ6zC89pLY6NOBENpyMIg
	 92Mw5kNWlSLRCVwXikCgEX8T1NSPYTx+hjnDtnbo4rPvde8JwNrLJplUoqVbN5Q261
	 6cFI/rrM8g99wJVnpnPctfh20Nok5+Jiz2kkf7OaGTTDEkKBcsYmt9rdDXbVY8vW5x
	 GnfsoRiPCJqdg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org,
	Ke Sun <sunke@kylinos.cn>
Subject: [PATCH] objtool/rust: add one more `noreturn` Rust function
Date: Wed,  5 Aug 2026 16:45:24 +0200
Message-ID: <20260805144524.233362-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the pointer formatting series [1] is applied and KUnit tests
are enabled, `objtool` would report an error with any of our
supported Rust versions. For instance, with Rust 1.97.1:

    rust/kernel.o: error: objtool: _R..._4core3fmt7Pointer3fmtB7_()
    falls through to next function _R..._4core7convert5AsRefNtB5_4BStrE6as_ref()

Or, with Rust 1.85.0:

    rust/kernel.o: error: objtool: _R..._4core3fmt7Pointer3fmtB7_()
    falls through to next function _R..._4core3ffi5c_str4CStrENtNtBS_3fmt7Display3fmtB7_()

This happens due to calls to the `noreturn` symbol:

    core::str::slice_error_fail

Thus add the mangled one to the list so that `objtool` knows it is
actually `noreturn`.

See commit 56d680dd23c3 ("objtool/rust: list `noreturn` Rust functions")
for more details.

Cc: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Reported-by: Alice Ryhl <aliceryhl@google.com>
Link: https://lore.kernel.org/rust-for-linux/anLxXvCKBcAVf91_@google.com/
Link: https://lore.kernel.org/rust-for-linux/20260706-hashedptr-v13-0-377a07f2f78d@kylinos.cn/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 tools/objtool/check.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 87db9f4ed9e2..3ab5b9f1c6a4 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -195,6 +195,7 @@ static bool is_rust_noreturn(const struct symbol *func)
 	return str_ends_with(func->name, "_4core3num20from_str_radix_panic")				||
 	       str_ends_with(func->name, "_4core3num22from_ascii_radix_panic")				||
 	       str_ends_with(func->name, "_4core3num28from_ascii_bytes_radix_panic")			||
+	       str_ends_with(func->name, "_4core3str16slice_error_fail")				||
 	       str_ends_with(func->name, "_4core5sliceSp15copy_from_slice17len_mismatch_fail")		||
 	       str_ends_with(func->name, "_4core6option13expect_failed")				||
 	       str_ends_with(func->name, "_4core6option13unwrap_failed")				||

base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
-- 
2.55.0

