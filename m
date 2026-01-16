Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CF033C532;
	Fri, 16 Jan 2026 20:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596368; cv=none; b=T/KBM6aeDukrVkB6UZUbSdV8iKQISdwM1kkvQftAW7WEQ7zxue5zeB1i39obOY5T/MGycGvKvMe9rA65TCc+Rd+kapnnOmqR5EacrGw9b7Ve19/0vS+xOtP/poDZDn0FFvMqfUV08E74iCrZjny9BiwnV4888K02mLbcv7HVu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596368; c=relaxed/simple;
	bh=ZAfu8fO2jdVJa4lMD8PWbP4kBRyvOewQpP82j8KuwNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X5eCou0PFtv/uPx5Ozc9vRQznz9JtAsK2Jknu4NNEotx6mzMDpemfeSq8hbGdRBl43YRgacYbS3uD/lGd+FKw7x9IHeYxiHbx4poZT37natKen0xXwjaKcJwXLkIvu+8/eYbzm99gD4xG0lS2LneT4VJJ21FlWKcod25wLnpyRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYLcCeHf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYLcCeHf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845CAC19423;
	Fri, 16 Jan 2026 20:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768596367;
	bh=ZAfu8fO2jdVJa4lMD8PWbP4kBRyvOewQpP82j8KuwNA=;
	h=From:Date:Subject:To:Cc:From;
	b=pYLcCeHfPwhcL1MVWyzjKTsa5IPa4SW1EkfahcU3sTgNsCKZDcZiw1Uxyo7ACOxvc
	 ZT6J9dr/L4nZBKwyaj6LYgFXc1DFc6DyGXown522qCPszr6Dj1Sx57iKJCU2gb0cRG
	 3u/jThdV3T5KLXvZZLhLix/p1vpWtfhFdXDhhq2cSEh5bjRflk4Fh/bZNUMD56Satu
	 96UgFAcymh6FfF16DvW5fCjZjzSVzbDgRtYnAowzwjFmdRCUcXaLcDPTYuneY0zq7q
	 q+5W3HyP/Hqx1cN0O536svyu2elMzmtXEe9pE483gblnKmhfORaC3QCe3At8WJYM8f
	 NWGLreOnQWgBA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Fri, 16 Jan 2026 15:46:04 -0500
Subject: [PATCH v2] scripts: generate_rust_analyzer: compile sysroot with
 correct edition
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-rust-analyzer-sysroot-v2-1-094aedc33208@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0JmbQ0t1IAr72FYFDrAGKCkU4hIu
 LuAB3D5kvffX4HREzLcoxU8zsTkhh3UJYKqNUODguzOoGJ1i6XUwk8chBlMt3zQC17YOxeErst
 cG5Nn2irYt6PHmt5n91n8mKfyhVU4YofREgfnl/N4lof372OWQorUYpZIW6skNY+mN9RdK9dDs
 W3bF5RLu/XMAAAA
X-Change-ID: 20260115-rust-analyzer-sysroot-5fb95aa985d2
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1768596366; l=3360;
 i=tamird@kernel.org; h=from:subject:message-id;
 bh=ZAfu8fO2jdVJa4lMD8PWbP4kBRyvOewQpP82j8KuwNA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAFv/uF8sKPUSH7xM4aOKLq2KMnB/sn7q0kYgqtS5Dd43S0sn1v594WyCtfEQlKhoPhjTqZk47/
 3f0jyReRCgQs=
X-Developer-Key: i=tamird@kernel.org; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Use `core_edition` for all sysroot crates rather than just core as all
were updated to edition 2024 in Rust 1.87.

Fixes: f4daa80d6be7 ("rust: compile libcore with edition 2024 for 1.87+")
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v2:
- Revert rust/Makefile changes and add Miguel's analysis.
- Link to v1: https://patch.msgid.link/20260115-rust-analyzer-sysroot-v1-1-4de831df234a@gmail.com
---
 scripts/generate_rust_analyzer.py | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 6061bd6e2ebd..187243f7f7a8 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -61,7 +61,6 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
         display_name,
         deps,
         cfg=[],
-        edition="2021",
     ):
         append_crate(
             display_name,
@@ -69,13 +68,37 @@ def generate_crates(srctree, objtree, sysroot_src, external_src, cfgs, core_edit
             deps,
             cfg,
             is_workspace_member=False,
-            edition=edition,
+            # Miguel Ojeda writes:
+            #
+            # > ... in principle even the sysroot crates may have different
+            # > editions.
+            #
+            # > For instance, in the move to 2024, it seems all happened at once
+            # > in 1.87.0 in these upstream commits:
+            #
+            # >     0e071c2c6a58 ("Migrate core to Rust 2024")
+            # >     f505d4e8e380 ("Migrate alloc to Rust 2024")
+            # >     0b2489c226c3 ("Migrate proc_macro to Rust 2024")
+            # >     993359e70112 ("Migrate std to Rust 2024")
+            #
+            # > But in the previous move to 2021, `std` moved in 1.59.0, while
+            # > the others in 1.60.0:
+            #
+            # >     b656384d8398 ("Update stdlib to the 2021 edition")
+            # >     06a1c14d52a8 ("Switch all libraries to the 2021 edition")
+            #
+            # Link: https://lore.kernel.org/all/CANiq72kd9bHdKaAm=8xCUhSHMy2csyVed69bOc4dXyFAW4sfuw@mail.gmail.com/
+            #
+            # At the time of writing all rust versions we support build the
+            # sysroot crates with the same edition. We may need to relax this
+            # assumption if future edition moves span multiple rust versions.
+            edition=core_edition,
         )
 
     # NB: sysroot crates reexport items from one another so setting up our transitive dependencies
     # here is important for ensuring that rust-analyzer can resolve symbols. The sources of truth
     # for this dependency graph are `(sysroot_src / crate / "Cargo.toml" for crate in crates)`.
-    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []), edition=core_edition)
+    append_sysroot_crate("core", [], cfg=crates_cfgs.get("core", []))
     append_sysroot_crate("alloc", ["core"])
     append_sysroot_crate("std", ["alloc", "core"])
     append_sysroot_crate("proc_macro", ["core", "std"])

---
base-commit: 74e15ac34b098934895fd27655d098971d2b43d9
change-id: 20260115-rust-analyzer-sysroot-5fb95aa985d2

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

