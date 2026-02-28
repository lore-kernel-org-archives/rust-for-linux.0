Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F72143C053;
	Sat, 28 Feb 2026 11:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772278657; cv=none; b=HKQy82gAplJW4ZX0GVzbxaIW3xfmhbVHDrysk4Z5KOLZNVaw5d16sW6Llas7dSRNd2JPNa1fNfFzdhtKQdXoEFjYGPxQfutTPxrh937x4uDNzlDZ/1Ye8qWtvwKBkXTB4q8KwagzABvzraWQ8D08/vi4E70PfqJ5ROHALiJZres=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772278657; c=relaxed/simple;
	bh=+vMG44yaFfHndimlYaLDups8+43jdR5M/ZVgvXTyjhA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzjSAnEkR2/oTDg5eCzkAMmSQbAzuuV1T6/96jrweFzvZ278ya46wKOD42lrg+Yzn3aeRvvmYeWzXd8uKPX1u5MGRnmb/sAq6HhGMzbexAqmph9DsgO3MSmSy19Y4hRJohcPPnqwAJdVfjBkaLFEFZ7FbTWxpcRPERaB2yNZy3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AeCj/edv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AeCj/edv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D577C19424;
	Sat, 28 Feb 2026 11:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772278656;
	bh=+vMG44yaFfHndimlYaLDups8+43jdR5M/ZVgvXTyjhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AeCj/edvImjJ1G5iO7pggCH+RXZgHhJVNFtdBK0hk7T13MUgxyvG9BfzgrBO2UtUz
	 qOs9+1Fiy6mdUWL50N5eWVXou5yLIfmnElDSUr91EH0WCfm8gbSh1Eidknhz6xXc97
	 iXUCfg2PBGq3LtE31c0jcRJUIUxnI0Ur01EMKhKmwPhsfTUl0MhTu3QdUFSuFVn7Gc
	 aMjwQBVedarrrtr19CxbSlL8DZjSiRPW27MuKktm8THU5kVEXgRXyKWCz1ulQcidV8
	 NunWXWufLgWLCS9yP/nwF6a0SeqZX4TMdBpo3vwokZLirHShwcTlpWCJKhcAKkpaGL
	 3Ca6g1vAaDeHw==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: stable@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: pin-init: internal: init: document load-bearing fact of field accessors
Date: Sat, 28 Feb 2026 12:37:05 +0100
Message-ID: <20260228113713.1402110-2-lossin@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228113713.1402110-1-lossin@kernel.org>
References: <20260228113713.1402110-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We cannot support packed structs without significant changes [1]. The
field accessors ensure that the compiler emits an error if one tries to
create an initializer for a packed struct.

Link: https://github.com/Rust-for-Linux/pin-init/issues/112 [1]
Fixes: 90e53c5e70a6 ("rust: add pin-init API core")
Cc: stable@vger.kernel.org # needed in 6.19, 6.18, 6.17, 6.16, 6.12, 6.6. see below the `---` for more info
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
As already explained in the previous email, we discovered an unsoundness
in pin-init that exists since the beginning, but was unknowingly fixed
in commit 42415d163e5d ("rust: pin-init: add references to previously
initialized fields").

We introduced pin-init in 90e53c5e70a6 ("rust: add pin-init API core"),
which was included in 6.4. The affected stable trees that are still
maintained are: 6.17, 6.16, 6.12, and 6.6. Note that 6.18 and 6.19
already contain 42415d163e5d, so they are unaffected.

We still should backport this piece of documentation explaining the need
for the field accessors for soundness. For this reasons we also want to
backport it to 6.18 and 6.19.

Note that this patch depends on 42415d163e5d; so the only versions this
patch can go in directly are 6.18 and 6.19. I will send separate patch
series' for the older versions. The series' will include a backport of
42415d163e5d as well as this patch, since this patch depends on the
`syn` rewrite, which is not present in older versions.
---
 rust/pin-init/internal/src/init.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/pin-init/internal/src/init.rs b/rust/pin-init/internal/src/init.rs
index da53adc44ecf..533029d53d30 100644
--- a/rust/pin-init/internal/src/init.rs
+++ b/rust/pin-init/internal/src/init.rs
@@ -251,6 +251,11 @@ fn init_fields(
                 });
                 // Again span for better diagnostics
                 let write = quote_spanned!(ident.span()=> ::core::ptr::write);
+                // NOTE: the field accessor ensures that the initialized struct is not
+                // `repr(packed)`. If it were, the compiler would emit E0793. We do not support
+                // packed structs, since `Init::__init` requires an aligned pointer; the same
+                // requirement that the call to `ptr::write` below has.
+                // For more info see <https://github.com/Rust-for-Linux/pin-init/issues/112>
                 let accessor = if pinned {
                     let project_ident = format_ident!("__project_{ident}");
                     quote! {
@@ -278,6 +283,11 @@ fn init_fields(
             InitializerKind::Init { ident, value, .. } => {
                 // Again span for better diagnostics
                 let init = format_ident!("init", span = value.span());
+                // NOTE: the field accessor ensures that the initialized struct is not
+                // `repr(packed)`. If it were, the compiler would emit E0793. We do not support
+                // packed structs, since `Init::__init` requires an aligned pointer; the same
+                // requirement that the call to `ptr::write` below has.
+                // For more info see <https://github.com/Rust-for-Linux/pin-init/issues/112>
                 let (value_init, accessor) = if pinned {
                     let project_ident = format_ident!("__project_{ident}");
                     (
-- 
2.53.0

