Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE52E296BBD;
	Fri, 23 Jan 2026 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162570; cv=none; b=sTw6cy6LM2Rky3LFYGw5CVBOfpWnhsTFR+vl5KaCwsEveiqNpAk99ePEKcZRna7ujIc6oLsGR7LhUF3SuZd7u/Eebbf8JFfRjo/E86T+EoIIbF2HrMNNDOavD1/oxB+V3RZjuTH0niWP1bsyi1B1b+uIL1k3U9z/HXJNshT3Gks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162570; c=relaxed/simple;
	bh=4kYFFmVPI/eprmUhrULa9W6q5qrXEQlXjSGa8KeOSOo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t4LJ82gDVOpHNXEo73amPYBUSchJdbvOy7qPLhBhZHFfLRJeSInkTGUhUnrVoIwhXLIrh7gMvBjx9mz/C9Uz+Gj30XyoT6ywIUvBVPHK7W18eqI5pRl+AGsCJomLEPPHaHAilk64yWSCpaRCqCeAyU6sVRQ0P/hzyPQ0EEsUxV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WKeQ5BXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WKeQ5BXH"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECAE5C4CEF1;
	Fri, 23 Jan 2026 10:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769162568;
	bh=4kYFFmVPI/eprmUhrULa9W6q5qrXEQlXjSGa8KeOSOo=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=WKeQ5BXHoLhaKxPzIbNoojXo6zD8EWfSUDh3TmlfyjHWeuDZQsjWkigKCnWWi6XNC
	 EP84embZpT7K8gm+F0q/pfSBujh5F8kb4pg61mG2Er1rRwKA7v+22J5uoQwownxo7k
	 eTktiklVJw3gcqO90533SJ8VvzNpEI0o+xwRqCxdV9yLK5eVsMpVJAcHJ4ItQKM/Iz
	 WYoq9ty6BW5reqLsgm2t87vaY1HEunJa57N4Sm5RNtM/uW8Hfk5VwvB63wb0zTBBry
	 R17D4tyiUhGa6amLAS89B8Qi2m50T9PAKzsMFtFR2Bt47dufE/a6fxtQu9hXXU8bgx
	 6GaVimkxieQSA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7938D7234F;
	Fri, 23 Jan 2026 10:02:47 +0000 (UTC)
From: SeungJong Ha via B4 Relay <devnull+engineer.jjhama.gmail.com@kernel.org>
Date: Fri, 23 Jan 2026 10:02:45 +0000
Subject: [PATCH] scripts: generate_rust_analyzer.py: better pin-init macro
 resolvea
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-fix-pin-init-crate-dependecies-v1-1-1c6cfe9aa352@gmail.com>
X-B4-Tracking: v=1; b=H4sIAERHc2kC/x2NwQqDMBAFf0X23AWNobX9leIhJk+7lzUkIgXx3
 108zmFmDqoogkqf5qCCXaqsatA9Goq/oAtYkjG51j3bzvU8y5+zKIvKxrGEDZyQoQnROjy9fYj
 e+VfwA1kkF5hxD77jeV7cntPXcAAAAA==
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 SeungJong Ha <engineer.jjhama@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769162566; l=2124;
 i=engineer.jjhama@gmail.com; s=20260103; h=from:subject:message-id;
 bh=+X4zr6kdvi4oIiyjF3Tjs9UDmHAGo3XY3Bau+3noR/I=;
 b=GX3iubRy+ziATd5+KV++EBfG7k5Ul6g+5g1l6RGuEC9nGzyl5lnygPdW0xNDubSJ7a6FoFZAp
 aZePNC4VEywAR+xFXl07BPf/t+M1qYQKKTgSkM+jxcBOzUqVKEb7yqt
X-Developer-Key: i=engineer.jjhama@gmail.com; a=ed25519;
 pk=G5nmjm+RTiWBpyCvc5xjR1b3li/2zipLSMyz+T4fj5E=
X-Endpoint-Received: by B4 Relay for engineer.jjhama@gmail.com/20260103
 with auth_id=590
X-Original-From: SeungJong Ha <engineer.jjhama@gmail.com>
Reply-To: engineer.jjhama@gmail.com

From: SeungJong Ha <engineer.jjhama@gmail.com>

Signed-off-by: SeungJong Ha <engineer.jjhama@gmail.com>
---
scripts: generate_rust_analyzer.py: Fix pin-init configuration for
better macro resolve

Hello,

I encountered an issue where rust-analyzer fails to analyze
structs decorated with the #[pin_data] attribute while testing
Rust kernel modules.

It appears that the dependencies for pin-init and drivers were
missing from the analyzer's configuration. This patch adds
those missing dependencies.

I have verified that my rust-analyzer correctly processes
\#[pin_data] structs after applying this fix.

Best regards, SeungJong
---
 scripts/generate_rust_analyzer.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 147d0cc94068..0c6c0444917f 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -123,10 +123,18 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
     append_crate(
         "pin_init_internal",
         srctree / "rust" / "pin-init" / "internal" / "src" / "lib.rs",
-        [],
+        ["std", "proc_macro"],
         cfg=["kernel"],
         is_proc_macro=True,
     )
+    # pin_init_internal uses #[path = "../../../macros/quote.rs"] to include quote.rs
+    crates[-1]["source"] = {
+        "include_dirs": [
+            str(srctree / "rust" / "pin-init" / "internal" / "src"),
+            str(srctree / "rust" / "macros"),
+        ],
+        "exclude_dirs": [],
+    }
 
     append_crate(
         "pin_init",
@@ -190,7 +198,7 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             append_crate(
                 name,
                 path,
-                ["core", "kernel"],
+                ["core", "kernel", "pin_init"],
                 cfg=cfg,
             )
 

---
base-commit: 2ad6c5cdc89acfefb01b84afa5e55262c40d6fec
change-id: 20260123-fix-pin-init-crate-dependecies-b94ac4247a48

Best regards,
-- 
SeungJong Ha <engineer.jjhama@gmail.com>


