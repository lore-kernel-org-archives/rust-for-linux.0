Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14C02DB78E;
	Sat,  7 Mar 2026 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772926238; cv=none; b=kF5Aq9dNJ6ToyaJ+iEI0tczGoSazcRlcD6+cDUyNhFcdh80bEKERvxF3XNFedAVUn0KbaVGwa0V1Bz1eBWiPghKt6GC7oXCDFJ1pqVgV9NnOhxjTRgtlJzM3xVT07VZAez/5cvbc7EE9+ovxVPHVDtULVzmxO60vPl4wzDMC6zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772926238; c=relaxed/simple;
	bh=Gx6A/S1TzMEzEE5XOkXbEx8NqGI/MsgmHIxyFUmgtLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b+IPrsDhCh4D8ZlY0x4Kmf+nzkt4Zxeowzrb3Drqbjd0DUTQpiV5bAyY8VJcY84putratJk9NAv4GC1jCki0BWmDGs1XqqphpP4ZTmTjaKS41F60hJX4jmHSVHE6Vdlk4PCbLbLUdUCNcEo2I5RhtVMeb/fHpyddhYXBF28eNps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YqvgSDTs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YqvgSDTs"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 995B7C2BCB1;
	Sat,  7 Mar 2026 23:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772926238;
	bh=Gx6A/S1TzMEzEE5XOkXbEx8NqGI/MsgmHIxyFUmgtLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YqvgSDTsg79L1BMkRyWIvJQ8/ZqkN3kDSGJKmh+hmfxOe9FVYgePj3V0zzyEpWQ0Y
	 KINzccbKTE2TvI8OHbXOcy+sWKTv8NfZmvA3BruefqvTdW8Ujkzn7xRPp2wtvqw2DW
	 EyZjAJCpoYmESrYTeuLR5bJtUrwGpttVjgMF3S2vV41+SrdUkw3XFTIPB9UAsw0CQs
	 HA5+iZz7hx5WI+8seZ96t4bZtYwiyv3tlWzEJ7HsXpcP6yCe/uh5HJRV067PDkeeQV
	 42GY2GFkEfu7g4XrQhYKre6p5D5xlWh+q9hEQFjDjIgsdDM3y1M0uzmBAREMVuIzRT
	 rJLaj8L3tr4Dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDBBF55113;
	Sat,  7 Mar 2026 23:30:38 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Sun, 08 Mar 2026 08:30:35 +0900
Subject: [PATCH v3 2/2] scripts: generate_rust_analyzer.py: fix IDE support
 for primitive types
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260308-ra-fix-primitive-v3-2-598017bcefd8@gmail.com>
References: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
In-Reply-To: <20260308-ra-fix-primitive-v3-0-598017bcefd8@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Tamir Duberstein <tamird@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3661; i=y.j3ms.n@gmail.com;
 h=from:subject:message-id;
 bh=lTIOc32qDGJS2pqa5syVt4LAlRUmC40tsYei6GzEin0=;
 b=owJ4nAFtApL9kA0DAAoBhnBYoOPQ2LoByyZiAGmstR2mzodhCqSTkK14K79zN1dPKP5iV+Egu
 c9vfpK/ZkCM0YkCMwQAAQoAHRYhBNJuBqTTLsbEgOaQ0IZwWKDj0Ni6BQJprLUdAAoJEIZwWKDj
 0Ni63MMP/3/+WJ6rNBzH4EGuaa/M0GE7Fu4LqLwz9lVGNiIq5s+YghZMKM9N47o29OiocDcBNBr
 DJxRzbyacMjF1H7l14ma+iyV/lIYTpP1RHJab4xjAUsa65OcTYHfLFopdgh7ZLwPkpoFodZLGtr
 EY9UDvnnAkK32iyPvCjjS0UWf8hokJiYFsn1745QoXegh6iQEOY3IGY2S0mP0E8RJ8LBfI5Bjxi
 rcQAqSW+sOQFgQcjDzSpXREgOQIVqi6VnzcyMZ+/gH3QCmqbYJcTjCv+ju55GCDrSDgND3xf5TT
 GlJUlngFg3KKQDV/rX4V+vlYw1obskq9kwrwz/vRpCzBO3VfNqtLlMSzJTC5SoTg8zp9whbpR2C
 1sqDoFcpD7OaPTQAeUM10DS22tsLtS0C2FHwRL/gtQXSbW35u200Za3AQbMo8Wokz4M2VkGK0tN
 zoCnuYSo9TCVaGNyiA/zPFeqqmySmIc6nyG5Ka5gtWTrIa3gOYjaiK/cClqE8xQLj5rZbuK3kV/
 ROH4iRz3VqJAqMJVjAYgCmFvY6JPiXwbRMzbfJwA0QWs1LKyEU71hGgrb5gE+JCFjnVz1JLzEFp
 oPKQ+UM1z9x1iH3VVZuPtI7QCXACMgLqsdildaw2sz6Nl1xx/Te5eZK6N4EdcUgbbWsDA4XAfRO
 WNCfCfqLvIvir0I7OaQ8qEg==
X-Developer-Key: i=y.j3ms.n@gmail.com; a=openpgp;
 fpr=D26E06A4D32EC6C480E690D0867058A0E3D0D8BA
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/default with
 auth_id=602
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
 scripts/generate_rust_analyzer.py | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index a4d25bb8b602..ab399f6044fa 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -52,9 +52,11 @@ class CrateWithGenerated(Crate):
     source: Source
 
 
-class RustProject(TypedDict):
+# TODO: use `typing.NotRequired` when Python 3.11 is adopted.
+class RustProject(TypedDict, total=False):
     crates: List[Crate]
     sysroot: str
+    sysroot_src: str
 
 
 Version = tuple[int, int, int]
@@ -80,6 +82,12 @@ BASELINES: List[RaVersionInfo] = [
         "ra_version": (0, 3, 1877),
         "rust_version": (1, 78, 0),
     },
+    # v0.3.2727, released on 2025-12-22; v0.3.2743 is shipped with the rustup 1.94 toolchain.
+    {
+        "release_date": datetime.strptime("2025-12-22", "%Y-%m-%d"),
+        "ra_version": (0, 3, 2727),
+        "rust_version": (1, 94, 0),
+    },
 ]
 
 DEFAULT_BASELINE: RaVersionInfo = BASELINES[0]
@@ -407,7 +415,7 @@ def generate_rust_project(
     cfgs: List[str],
     core_edition: str,
 ) -> RustProject:
-    assert len(BASELINES) == 1, "Exhaustiveness check: update if branches!"
+    assert len(BASELINES) == 2, "Exhaustiveness check: update if branches!"
 
     ctx: RaVersionCtx
 
@@ -422,6 +430,18 @@ def generate_rust_project(
             ),
             "sysroot": str(sysroot),
         }
+    elif version_info["ra_version"] == (0, 3, 2727):
+        ctx = {
+            "use_crate_attrs": True,
+            "manual_sysroot_crates": False,
+        }
+        return {
+            "crates": generate_crates(
+                ctx, srctree, objtree, sysroot_src, external_src, cfgs, core_edition
+            ),
+            "sysroot": str(sysroot),
+            "sysroot_src": str(sysroot_src),
+        }
     else:
         assert False, "Unreachable!"
 

-- 
2.52.0


