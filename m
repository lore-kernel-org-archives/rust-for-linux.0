Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A85741C62;
	Fri, 30 Jan 2026 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785195; cv=none; b=shlFf/w74qXSANu4ana+NOsk/YcwDlaYXagZE38/xKgFM683e2HdGaHhMefSErqi/bUvhc4lfTihXeDZsKC/K4QRta292xEYndTwpOMcNM7+6g8J6Q48d/xVBEeNAz3unlHPGHsAsoneJUnbhQcsDY21kacgdZxCFr4N4c688ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785195; c=relaxed/simple;
	bh=lMEqqMQPpdhLXQusTbRz7AP14O0OG0XHa0Hddnv123E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M4xwA1YejJWnxWweg9zSlo7TqRFqJ0F5qM1TFobPEfpRkxtm7oipvZ0+5zG9ZTWaTk9yPAbqXe/81BSafxLy3CJyKcxha/GpJWcrP1xI1chSJ3ruGLH1Cex2iEH1VHwu3WaIRY4cJGISbV43bcV7BydnRAWlSJxuREGorpbuJ0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doI2PWug; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="doI2PWug"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1839C116C6;
	Fri, 30 Jan 2026 14:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769785194;
	bh=lMEqqMQPpdhLXQusTbRz7AP14O0OG0XHa0Hddnv123E=;
	h=From:Date:Subject:To:Cc:From;
	b=doI2PWug1UnGxBEZBdo4J7zmg46UDjelDcOqN9uREWFc5s8smdwbzpvqPEJEHEdjQ
	 hlMgDKJsRrHW8flCwaQGUQDwlUS5JOJ/o0Dc8o9fDRZQY+ega61UU5NfGd7VUJ37VV
	 KlpmDY7BR3/f5F6WdZaEgs37eynj405hUkPPithZ3kDOVRBRgSrOwKTTV4aG9RR13f
	 wlcN3CTYa80hNC2mLUSILezVgwfO+xLcJpAU5/wzCnGHFjDQYz0DnMQWCk+hPx8wPa
	 zvbNab5VFVNoUVlLrqlIzHt/ymb72+z9V6k5sFMR8S+KoSOcUGmo7PBeaWNuCOf5wp
	 F6iMtjcLZGssg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 30 Jan 2026 15:59:20 +0100
Subject: [PATCH] rust: dma: update safety comments for volatile memory
 access
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260130-dma-doc-update-v1-1-bac46939cfea@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEfHfGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ2MD3ZTcRN2U/GTd0oKUxJJU3USLRANTEwsDE9NUIyWgpoKi1LTMCrC
 B0bG1tQBpVSquYAAAAA==
X-Change-ID: 20260130-dma-doc-update-a8a0548045e2
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3692; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=lMEqqMQPpdhLXQusTbRz7AP14O0OG0XHa0Hddnv123E=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpfMdOpgJHaIP6lucm5NwJoOzskb70PLjhW/tDj
 ocpOAqXN3uJAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaXzHTgAKCRDhuBo+eShj
 d5gMEACCD+hBdtkkHANT74zHHH7NJo1BLgePTqB3SrasNJbnofD97wQ6SQ8d0Rm0bxS5qdBHIrW
 VBgW4KVLvUH8yJ2RWazKg35t71PI6/9kbBwyLo1bLIZ1oXd6XJZs1HzSrpFTvRhpxNZ49/b94pP
 esdA4+t7zCbHbRlGtwDgVhPkcEz1D8zQmT+phJczBrjL0D4WwZ5R2g8AHDPbQwwHmoGrda13v89
 FAZ8vst6ZcZ/ecWLEri43fAUEMCfTK1c6ufd29Zp4TOOppl/TfDSeKSCq8oZXVgjR+p7YWLU4Pt
 i5ABG3FKB6J89bhlvOBzQmcCrrfVI5zqBSX98rf3EPf/5saIYo7tovHn165rO6vxCOSnAYHZcul
 deoYTvIEvqPMFXYOWhsnohARYY5jVa95fxWicJodtFhgNpS9jvmgwC1e88swhCnKmuKi36JjObL
 zn2rWforyUwf36XiDsu2n2tyE7Cq7r5ccxiNkEp2GifTFsCeFE4R+gHgqQbExr9Sd8xtrGHHypM
 kASTiIoDMxXcpM4enfxeDFZMjiUrZn8RA2TSSS/tjOZ0/MzXgab38xDDvynFyGgHA3sbshwibuo
 FA4XpqVAYsH4o1Aza0jYaOVdLwKmbX2623Oa6h9EakMDmQjsOerge6mivREuu5soTgaC//Gm7QH
 C5JSiKApnJ3Nb+A==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

At the time `CoherentAllocation::read_field` and
`CoherentAllocation::write_field` was merged, `ptr::{read,write}_volatile`
was under specified. The documentation for these functions have been
updated and we can now formulate a proper safety comment for the calls.

Update safety comments in `CoherentAllocation::{read,write}_field`.

Link: https://doc.rust-lang.org/stable/core/ptr/fn.read_volatile.html
Link: https://doc.rust-lang.org/stable/core/ptr/fn.write_volatile.html
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/dma.rs | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index acc65b1e0f245..0b55671a94faf 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -593,14 +593,12 @@ pub fn item_from_index(&self, offset: usize) -> Result<*mut T> {
     pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
         // SAFETY:
         // - By the safety requirements field is valid.
-        // - Using read_volatile() here is not sound as per the usual rules, the usage here is
-        // a special exception with the following notes in place. When dealing with a potential
-        // race from a hardware or code outside kernel (e.g. user-space program), we need that
-        // read on a valid memory is not UB. Currently read_volatile() is used for this, and the
-        // rationale behind is that it should generate the same code as READ_ONCE() which the
-        // kernel already relies on to avoid UB on data races. Note that the usage of
-        // read_volatile() is limited to this particular case, it cannot be used to prevent
-        // the UB caused by racing between two kernel functions nor do they provide atomicity.
+        // - `field` points to memory outside any Rust allocation.
+        // - As `field` points to readable memory:
+        //   - Reading `field` will not trap.
+        //   - Reading `field` will not change any memory inside a Rust allocation.
+        // - As `F: FromBytes` any bit pattern is valid for `F` and the read
+        //   will produce a properly initialized F.
         unsafe { field.read_volatile() }
     }
 
@@ -616,14 +614,9 @@ pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
     pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
         // SAFETY:
         // - By the safety requirements field is valid.
-        // - Using write_volatile() here is not sound as per the usual rules, the usage here is
-        // a special exception with the following notes in place. When dealing with a potential
-        // race from a hardware or code outside kernel (e.g. user-space program), we need that
-        // write on a valid memory is not UB. Currently write_volatile() is used for this, and the
-        // rationale behind is that it should generate the same code as WRITE_ONCE() which the
-        // kernel already relies on to avoid UB on data races. Note that the usage of
-        // write_volatile() is limited to this particular case, it cannot be used to prevent
-        // the UB caused by racing between two kernel functions nor do they provide atomicity.
+        // - As `field` points to readable memory:
+        //   - Reading `field` will not trap.
+        //   - Reading `field` will not change any memory inside a Rust allocation.
         unsafe { field.write_volatile(val) }
     }
 }

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260130-dma-doc-update-a8a0548045e2

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


