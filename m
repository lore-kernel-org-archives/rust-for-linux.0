Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182835DA6B;
	Tue, 17 Mar 2026 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739799; cv=none; b=Qvy/ezzIYwNPVFWv0hiivnMUHdTEXo6RrtAWcNFp3ZC19JDTpmyragVASgT7S1k+tEbxmkijemgOJ5Qm5M7nQT+WC9ZT6m0BG/KVKhGSDWUJ5ntGAto3ehEdsUlfXFCpmcQZsZX0ujHf/VZrPoNOKkKrkkHnkvlwX1ZmEh76l74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739799; c=relaxed/simple;
	bh=p4xln7+imvr1opGag9IpA2Wtpjs5w7Yi0d6aHEa3TTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tsjpuWOnI4rv2FXIAzdpYg3fZ5za+S1ufYjuPc9sIPoIMXOHancNBgy+z6Aq671UK8Zsfsgi3hduoDdX4/TVgq1kiDbjsg/aNppbrnTC3sdcBa5X1K7zvrodFkX4ntxViq3K0UpJVD5SSa//1lD/AvuHV3XCvHXk2PdGJ8cSRpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+O5b3HC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+O5b3HC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2ACEC2BCAF;
	Tue, 17 Mar 2026 09:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739799;
	bh=p4xln7+imvr1opGag9IpA2Wtpjs5w7Yi0d6aHEa3TTE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=I+O5b3HCsIcw0T4hepUBkFumD7RkJcmES6y6lpgHQJ4hN1sbSuohPJQ7AB02ysT0n
	 J816XGoOHTFAd7l6kJtYRPPlAtfgPBYjMp13e9MQ9QXwrHCoqaETEeA6xW/5dJNC5g
	 Sphp5ZI5V1W/Xwzf9C6sLt3Jk468yXLWQSRTwMGVRPCMWEJk5TgEVwoUWXKaOJTYyN
	 cO1ESLGLjmxOENADcC79e22mAnoJDeVRfe97Rt1/M01pyj17MM7jPb0HWGRBvtbVwI
	 4pHfV4MlzZzuz4NOtrxaW4ArHNs9I7Mh9R579D8rOkhdEPZYuYCgy9Ay58zf4cs8St
	 M/rTcz15mQOUw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9200DF33823;
	Tue, 17 Mar 2026 09:29:59 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Date: Tue, 17 Mar 2026 18:29:55 +0900
Subject: [PATCH v4 2/2] scripts: generate_rust_analyzer.py: fix IDE support
 for primitive types
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-ra-fix-primitive-v4-2-bc06709c8243@gmail.com>
References: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
In-Reply-To: <20260317-ra-fix-primitive-v4-0-bc06709c8243@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3147; i=y.j3ms.n@gmail.com;
 h=from:subject:message-id;
 bh=Z1STuUX4hAMGH3VklRQYXGekyYm6ECfBYIvk95Ds4BA=;
 b=owJ4nAFtApL9kA0DAAoBhnBYoOPQ2LoByyZiAGm5HxZMOwLkBGoVsrC9CyPC8lwrGsUJHfnRq
 s4+zURYc42lvYkCMwQAAQoAHRYhBNJuBqTTLsbEgOaQ0IZwWKDj0Ni6BQJpuR8WAAoJEIZwWKDj
 0Ni6c1EP/0SxOz8cxIDDaZ3JkFde98duxs773f9qZ8qib/dJU9kAnlFN1WtTthraE4YtXR6agc0
 kRooIg6Sj0FgufG5uot7TwiqCWLv0BvqmYb4znairZZP6K9a+Au+eA5h4nkBnjucsUngm9jeAWR
 P8WYT+6LrvqpjF1PXy08TakVzFmQ5ma9DuS8laaPuCy98fcGwde1cTvtL89mdI379Yt+McHLkLE
 P0vVajdRHlSR1hTTkwOVhwiGoomMsymok+DwPnNSNHxwhbciQBS6F6lsQaVqs+WzsWZwyle+3eG
 wK8Bl30JVEYq/7rxh8/oaHlL4M4c1jxEtzmKi4kk2Daup4XYoW5bIOa6QsWUOFy18n8TjGsBEfH
 NuahmJ86BhSiKrD411CEtg22GTI1ie+i4EVpcUb6Zna1q770KQBb8R75Z590V5+EnQSgQdZ7PP5
 nekDzPH7/v8plJoSC8SBsjjJCbOfNsnljOwxf52crEubtvqedoiMjxMdoDur0sDv1jVmmcAGSBe
 M0DVYtfVzPhHBb3i22h3zkeyIgeemE3Yc6kJV5CtA26OPOvsp7ezCwbj486U10B7z2+v/4wLlZ9
 xAX89/ZwewevVh5IzK6sUKimYLh78T9JlIZ3xVy2J6bpxeZAeFvN/GMhEHSEUuVf23R81goCjzN
 JfuNqYuoAlW6BwhvYb5s1eg==
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
 scripts/generate_rust_analyzer.py | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/generate_rust_analyzer.py b/scripts/generate_rust_analyzer.py
index 21832763c5be..bf5a0f16995a 100755
--- a/scripts/generate_rust_analyzer.py
+++ b/scripts/generate_rust_analyzer.py
@@ -54,9 +54,11 @@ class CrateWithGenerated(Crate):
     source: Source
 
 
-class RustProject(TypedDict):
+class RustProject(TypedDict, total=False):
     crates: List[Crate]
     sysroot: str
+    # TODO: use `typing.NotRequired` when Python 3.11 is adopted.
+    sysroot_src: str
 
 
 @dataclass(frozen=True)
@@ -372,6 +374,7 @@ def generate_crates(
                 path,
                 sysroot_deps(core) + [kernel, pin_init],
                 cfg=generated_cfg,
+                crate_attrs=["no_std"],
             )
 
     return crates
@@ -432,6 +435,18 @@ def generate_rust_project(
             ),
             "sysroot": str(sysroot),
         }
+    elif version_info == RaVersionInfo.SUPPORTS_CRATE_ATTRS:
+        ctx = RaVersionCtx(
+            use_crate_attrs=True,
+            manual_sysroot_crates=False,
+        )
+        return {
+            "crates": generate_crates(
+                ctx, srctree, objtree, sysroot_src, external_src, cfgs, core_edition
+            ),
+            "sysroot": str(sysroot),
+            "sysroot_src": str(sysroot_src),
+        }
     else:
         assert_never(version_info)
 

-- 
2.52.0


