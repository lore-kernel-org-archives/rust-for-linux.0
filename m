Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F904E2F3D;
	Wed, 30 Sep 2026 13:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774632; cv=none; b=uk423MgTY5/qp2U/OYfp6lHHqmXInl3kdhAe71SA2tlPhImKeczuLtWJWjvne5XX0hEY/XYA5YKVGo2AZeAl65pgc1I8SU4kaT4cDfovvK4yRR1ZWpxHwxzAXI1kt8OjWA9ofIX53fbkWm1jF29zJ1IFDjMcIt95/xbyD/DIjC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774632; c=relaxed/simple;
	bh=8S7movF99Sr4akm1D/WjYBF9/k/U/PR/3/s/56zwB3I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0RbR0QOtxi6Gc4WOhLP0mbJ8OaW0KL3XP2KPBWW1ZxRMW+WQyilxCD6AkreIyYdY7Dtstct2thYU1gZi3GH6UoPTKy9gJH8yIvyYDtLbXqMm0elc3VCAlLKQ9NCx5lDM9qs2TyKoVuf3RlxTUIMyIY+oVhdOTvZZjczWmCvPlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qptgSK0s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qptgSK0s"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18441C4AF14;
	Wed, 30 Sep 2026 13:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790774630;
	bh=8S7movF99Sr4akm1D/WjYBF9/k/U/PR/3/s/56zwB3I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qptgSK0ss0M8B6Gfg6oWUmidFnT8hYbwjtx50eOD3GCi1+PW5/Kpiz4et9EgQTkb8
	 VIE7yPNhTaprLUWdK1N8LvN8yWunHn08eTJN/mezJmITbqfrbTCedHYTH8PeRhZqz/
	 tpOGwhrBQLjU22kL9+nJo2vVrIgaeyTdk/nV4sumojyBREyG0VgM/cPgOGz7RbUQX7
	 nWUM7fOFv5orbBOWTzqBfEmD6oW5XtwV0dLpRLGVyW0Pjl3jIyLstmdVdxfB0OHxOt
	 c34pCz02Y+IHeUHVM/KVUEr3Gs4wn+H/3TWfBtck5tl/Fjg1HXWsH61rdfNwg5bMHp
	 4w6evDq+aC6ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05668CA5FCD;
	Wed, 30 Sep 2026 13:23:50 +0000 (UTC)
From: =?utf-8?q?Nicol=C3=A1s_Antinori_via_B4_Relay?= <devnull+nico.antinori.7.gmail.com@kernel.org>
Date: Wed, 30 Sep 2026 10:23:30 -0300
Subject: [PATCH 3/3] rust: bitmap: kunit: uncomment
 owned_bitmap_out_of_bounds panic case
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260930-rust_kunit_v4-v1-3-e3b0d45311dd@gmail.com>
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
In-Reply-To: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
 Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
 Miguel Ojeda <ojeda@kernel.org>
Cc: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn1_gh@protonmail.com>, 
 Boqun Feng <boqun@kernel.org>, Brigham Campbell <me@brighamcampbell.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
 Jori Koolstra <jkoolstra@xs4all.nl>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Rae Moar <raemoar63@gmail.com>, Shuah Khan <skhan@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2339;
 i=nico.antinori.7@gmail.com; h=from:subject:message-id;
 bh=s6VeCuzis2IJcLMPOzgr0J64uvSAp4KLvVLQ8SXTshM=;
 b=owGbwMvMwCV2QdXfwqNJ1YjxtFoSQ9Ze3mSHM4VvSs+fub5T79K116Z6u+MPbt5ZcOiJZmaO4
 VtlzudzO0pZGMS4GGTFFFnmcr7/bGxrXlEuvSkIZg4rE8gQBi5OAZiIqD8jw4qkZ3scIx+uFT3X
 I5T7SWbTN8V1ykF6fssFFgY83CYutYnhr9gahvLOhbFNUx4n8aj+uzjrjdn3a9faWBrbH2b9Eb2
 3hx8A
X-Developer-Key: i=nico.antinori.7@gmail.com; a=openpgp;
 fpr=9D09EFF3333D3778771BB252D0254F3848822532
X-Endpoint-Received: by B4 Relay for nico.antinori.7@gmail.com/default with
 auth_id=1086
X-Original-From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Reply-To: nico.antinori.7@gmail.com

From: Nicolás Antinori <nico.antinori.7@gmail.com>

Rust KUnit tests now support `#[should_panic]` attribute. Uncomment the
test so it can be run when CONFIG_RUST_BITMAP_HARDENED=y.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 rust/kernel/bitmap.rs | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/rust/kernel/bitmap.rs b/rust/kernel/bitmap.rs
index b27e0ec80d643da5d5510ee79e24493323e61b72..a9935b2be8c54d1b66d1c1cade1eba1fb06b6cd3 100644
--- a/rust/kernel/bitmap.rs
+++ b/rust/kernel/bitmap.rs
@@ -571,33 +571,29 @@ fn bitmap_set_clear_find() -> Result<(), AllocError> {
         Ok(())
     }
 
+    #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
     #[test]
     fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-        // TODO: Kunit #[test]s do not support `cfg` yet,
-        // so we add it here in the body.
-        #[cfg(not(CONFIG_RUST_BITMAP_HARDENED))]
-        {
-            let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-            b.set_bit(2048);
-            b.set_bit_atomic(2048);
-            b.clear_bit(2048);
-            b.clear_bit_atomic(2048);
-            assert_eq!(None, b.next_bit(2048));
-            assert_eq!(None, b.next_zero_bit(2048));
-            assert_eq!(None, b.last_bit());
-        }
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+        b.set_bit(2048);
+        b.set_bit_atomic(2048);
+        b.clear_bit(2048);
+        b.clear_bit_atomic(2048);
+        assert_eq!(None, b.next_bit(2048));
+        assert_eq!(None, b.next_zero_bit(2048));
+        assert_eq!(None, b.last_bit());
         Ok(())
     }
 
-    // TODO: uncomment once kunit supports [should_panic] and `cfg`.
-    // #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
-    // #[test]
-    // #[should_panic]
-    // fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
-    //     let mut b = BitmapVec::new(128, GFP_KERNEL)?;
-    //
-    //     b.set_bit(2048);
-    // }
+    #[cfg(CONFIG_RUST_BITMAP_HARDENED)]
+    #[test]
+    #[should_panic]
+    fn owned_bitmap_out_of_bounds() -> Result<(), AllocError> {
+        let mut b = BitmapVec::new(128, GFP_KERNEL)?;
+
+        b.set_bit(2048);
+        Ok(())
+    }
 
     #[test]
     fn bitmap_copy_and_extend() -> Result<(), AllocError> {

-- 
2.47.3


