Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227402FF652;
	Fri,  9 Jan 2026 22:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996620; cv=none; b=SwH+fl5dbQLoesV5IOT9m6h2knxrtxTZVuNvWoAEj04Nf7bnLRYhp+suALAleUpGKTxpAGNY5eEopXro/E3VP34cNuYn7DVgzoxUU2vxLYnaNf/DziQxvabJ2/qrQvXlc+tyDzstBQxSS4Sq/s68pzrxa4TMSGbAdepPKJG/pYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996620; c=relaxed/simple;
	bh=CNkIo9NsvwV7c6w44T58l4D4P4jABNgqjrmWc/kE7co=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YeRNXKsmjn2SKoMOgo+hYgulKr5IGopejS1KD0T/EmKsrEy6N6HVgu3BP46aMEov05UiKiqLcwBpZhkLCoM9FRjDKN6oYOwvuoB0e9inp37Nb7fOXNLdp762g4CQrn8034pisqklcMgIO5YKGvahD2CKSslEUEfyA+0hkMt2SXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tA7nbL5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tA7nbL5R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8CA7C19423;
	Fri,  9 Jan 2026 22:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767996619;
	bh=CNkIo9NsvwV7c6w44T58l4D4P4jABNgqjrmWc/kE7co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tA7nbL5R4IpfYInylmeI/6TEhsYFlfKO6PhT+8jzfFd1MqFJeh0U0lLO5DIg3QtGm
	 +zKmhEQ8jzEZe/+TLoCjHVyPR6wsBA0eKFi7mkQGFec1FwcSlTzDyu9HlyNuUxwHzS
	 wow9nBDvs5Rk9gnTmDSqY/1ihyMc/hCFWXxWlOGUdiZNyKadwELfW086p8sqGDHEIo
	 cBTPsW9e4EgEpY0twfKB6yhNTGjqK1KOyE1n45zyb8AmLj0EWsjUjxsF6h0hlOacEI
	 XUp71EzGtnph+mxHwtouwcgC9WHc6+0MaJ0VzpNYzITorT2Rf9deLpyypPspEaE26g
	 5aea7F6jHMe+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9AA6D1A63D;
	Fri,  9 Jan 2026 22:10:19 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Fri, 09 Jan 2026 22:09:01 +0000
Subject: [PATCH v2 2/2] scripts: generate_rust_analyzer: fix IDE support
 for primitive types
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-ra-fix-primitive-v2-2-249852a4145a@gmail.com>
References: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
In-Reply-To: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767996618; l=4187;
 i=y.j3ms.n@gmail.com; s=20251225; h=from:subject:message-id;
 bh=+tPQMcCiMZmTEKJEqCQpRQjsZN53zv5hH8iFQTMRB3M=;
 b=IgKqVR9SLwszTWWbxy+zbxKBzOqNA4a38Jad2lLcsxW08R+o6bcgL8nv9AAVDkYFl2FtyW/hM
 X85fmL2z//ECto6Zm9xu8knpfTRcn1Uij3wjzGYjRvhP9sCJjpN0ebv
X-Developer-Key: i=y.j3ms.n@gmail.com; a=ed25519;
 pk=2yVgO1I+y7kkFSF2Dc/Dckj4L2FgRnvmERHFt4bspbI=
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/20251225 with
 auth_id=586
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Reply-To: y.j3ms.n@gmail.com

From: Jesung Yang <y.j3ms.n@gmail.com>

Update `generate_rust_analyzer.py` so that the generated
`rust-project.json` contains the `sysroot_src` field with
`"crate_attrs": ["no_std"]` specified for relevant crates. This ensures
that rust-analyzer provides proper IDE support for inherent methods of
primitive types.

Since commit 50384460c68f ("Rewrite method resolution to follow rustc
more closely") to rust-analyzer, it no longer provides language server
features like code completion and go-to-definition for inherent methods
of primitive types when sysroot crates (e.g., `core`, `std`) are inlined
in `rust-project.json` [1]. As `generate_rust_analyzer.py` currently
inlines these crates, our setup is affected by this change.

Specifying the `sysroot_src` field restores this functionality by
allowing rust-analyzer to locate sysroot crates by itself. However, this
causes `std` to be treated as a dependency for all local crates by
default. To align with our compilation settings, provide the `no_std`
attribute via the `crate_attrs` field, as the `-Zcrate-attr=no_std`
compiler flag is not visible to rust-analyzer. This combined approach
removes manual manipulation of sysroot dependencies while preventing
incorrect symbol resolution against the standard library.

Note that this configuration requires rust-analyzer release 2025-12-22
(v0.3.2727) or later, which introduced support for the `crate_attrs`
field.

Link: https://rust-lang.zulipchat.com/#narrow/channel/x/topic/x/near/561607963 [1]
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/x/topic/x/near/561607753
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 scripts/generate_rust_analyzer.py | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 32b0da99f17549ecc83e9a68911373310a2c9617..6c3cb1d65d97e0ec414192f9fb867700a99c3d57 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -234,13 +234,16 @@ class RaVersion(enum.Enum):
 
     # v0.3.1940, released on 2024-04-29; bundled with the rustup 1.78 toolchain.
     V20240429 = 0
+    # v0.3.2727, released on 2025-12-22.
+    V20251222 = 1
 
     @staticmethod
     def baselines():
-        assert len(RaVersion) == 1, "Exhaustiveness check: update baseline list!"
+        assert len(RaVersion) == 2, "Exhaustiveness check: update checkpoint list!"
 
         return [
             (datetime.strptime("2024-04-29", "%Y-%m-%d"), (0, 3, 1940), RaVersion.V20240429),
+            (datetime.strptime("2025-12-22", "%Y-%m-%d"), (0, 3, 2727), RaVersion.V20251222),
         ]
 
     @staticmethod
@@ -249,10 +252,12 @@ class RaVersion(enum.Enum):
         return RaVersion.V20240429
 
     def __str__(self):
-        assert len(RaVersion) == 1, "Exhaustiveness check: update if branches!"
+        assert len(RaVersion) == 2, "Exhaustiveness check: update if branches!"
 
         if self == RaVersion.V20240429:
             return "v0.3.1940 (2024-04-29)"
+        elif self == RaVersion.V20251222:
+            return "v0.3.2727 (2025-12-22)"
         else:
             assert False, "Unreachable"
 
@@ -266,7 +271,7 @@ def generate_rust_project(
     cfgs,
     core_edition
 ):
-    assert len(RaVersion) == 1, "Exhaustiveness check: update if branches!"
+    assert len(RaVersion) == 2, "Exhaustiveness check: update if branches!"
 
     if ra_version == RaVersion.V20240429:
         ctx = {
@@ -277,6 +282,16 @@ def generate_rust_project(
             "crates": generate_crates(ctx, srctree, objtree, sysroot_src, external_src, cfgs, core_edition),
             "sysroot": str(sysroot),
         }
+    elif ra_version == RaVersion.V20251222:
+        ctx = {
+            "use_crate_attrs": True,
+            "add_sysroot_crates": False,
+        }
+        return {
+            "crates": generate_crates(ctx, srctree, objtree, sysroot_src, external_src, cfgs, core_edition),
+            "sysroot": str(sysroot),
+            "sysroot_src": str(sysroot_src),
+        }
     else:
         assert False, "Unreachable"
 

-- 
2.47.3


