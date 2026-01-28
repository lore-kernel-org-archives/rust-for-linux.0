Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFCB371077;
	Wed, 28 Jan 2026 18:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625464; cv=none; b=ODfobNgB3DRcwvPbR+2XTqMFODDA0pXnPltkpWoa2l82DXiAqcQxDaP2UE2Sqm7LCLxPjbqEXVr2jfTXYd1vW81YVE72+27O16uG5A70rttkWppVf7v1vI9rHPWLKB+Kd/TGhDFojtYfBHiptapNaOKPt0RBubhM+xi6e4ou+04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625464; c=relaxed/simple;
	bh=I13qmJwfcnCCX0pUmPY6awCKcIVVpjZVGVo7I6TNs50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=E3XWnx8dTMH7sr6uWtTs0JnRo6dCuPbm4rGfqJbcB5/cz0QTKz8+fILmlOmEepEnojMXMIMORtXYbTyw36Z+pRXDVAgNIBKZCVDi/WNBc6lwmv2AHPEkXgOkhBH+ZABk4hrbmaA5CwrddW4Ya5htCt8LT6GyplWwOzRBODvIPNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u9ZlYvLx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u9ZlYvLx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CFCC16AAE;
	Wed, 28 Jan 2026 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769625463;
	bh=I13qmJwfcnCCX0pUmPY6awCKcIVVpjZVGVo7I6TNs50=;
	h=From:Date:Subject:To:Cc:From;
	b=u9ZlYvLxuLrCjuyaGB92q7YwVlXALNV0Md7CUT/dLjXyRhXf1SpW/oB5VNdmBDcEL
	 I3Cxi8BX+eD6/iDqVKAWK7hHOddKuDmrdbpVULIWHUyPLOFyiLx3lm4326hYOtPAFW
	 ugPeXxbE/7nyquoiuvpGTcFiZ+GEjSRBbGbi7obm3L4vrv+GDaZdqjw9sVHcvi985p
	 XKwJ78di6y8l0A9aeVe3YYvYD2D1hZvczEyfzScaaU1vMNW24Y9MO9R7CxGzoomMqf
	 +hEU0X3kIobwZWgqpYUhOqiWwB3hC9EgQeUNDyDla+yu+lRF3RoSD0NFOt7aMgHXsR
	 0CtHCGEuFAnTA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Wed, 28 Jan 2026 19:37:12 +0100
Subject: [PATCH] rust: alloc: add GFP_NOIO flag
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-gfp-noio-v1-1-9a808fc49b44@kernel.org>
X-B4-Tracking: v=1; b=H4sIAFdXemkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyML3fS0At28/Mx83bSkFBPDVENjUwMLCyWg8oKi1LTMCrBR0bG1tQA
 Rw3YWWgAAAA==
X-Change-ID: 20260128-gfp-noio-fbd41e135088
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Uladzislau Rezki <urezki@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1997; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=I13qmJwfcnCCX0pUmPY6awCKcIVVpjZVGVo7I6TNs50=;
 b=owEBbQKS/ZANAwAKAeG4Gj55KGN3AcsmYgBpeldZ9sX7pM2PW6foqrgEDGlxBHgzB5LIVGuHg
 cKM2F46Zu2JAjMEAAEKAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaXpXWQAKCRDhuBo+eShj
 d+jsD/kBy2LvML03X3KzOhGn3rYBrumLdmJH2KE0Q7QxdgDJSWGVUoBoNCN+rzClevWH2GJyGm3
 +AvQQNO4RWyYQz4hmXv/zMqdJyizayFR2oEUa4A6bDkt3J/cToL5MS1I9ZV9PFJ9N27J2WlqxPF
 URlqPc3/1YBYcoSTEMYymAzfdZ7Aa0DcEDlaxMQT4QHlwCIl6uLV6HGpSvcLpV4r9IZg6kwkYd1
 89M385IpAKfLFCzX3fE4n3LbRnuN36IxnJrnlZzrksBdD6rEM6NxVHwJn0Nn0G+pyPFFitoHXnH
 z/sUzZMb1ZlS56hSNmSU34lsiBKb357KWxyYqcQ4TWTZhbij/EFDDc+j+d1vGq4d2DTI+Ck24pn
 ViBakr5Mg4UHXgJ5sS0BAt1bEozIbXvE3ZMEMktRYvATuGgvOL3m0mHMhvucJE2TYzsOFOOgFfc
 r6dJdWlw9NROR5Elh1QiloXA9sUlFhOEZgPD4WmH/pW6yb+08/wEty1jTAXXCfrPfgcLZuP+WuX
 K1h/nYHQdRkBcbSM1uz3JwRIFUwNR5VQqE84dAuaMh02N8tds0QHsj9NxTWtWDFntrhZuN6BWyl
 Kxez3xIuzpE/28aBUBxoIWAUbQwVd1f0rUKvlyzsAlBshh9P9aY+tRgu47OyaX4lPBIF+yuxI7H
 EqtE24TdQVXRsgg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add an abstraction for the `GFP_NOIO` flag. This flag signals that the
caller requires allocation to complete without triggering any block device
IO.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/bindings/bindings_helper.h | 1 +
 rust/kernel/alloc.rs            | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index a067038b4b422..3910ecc5c34cf 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -106,6 +106,7 @@ const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
 const gfp_t RUST_CONST_HELPER_GFP_ATOMIC = GFP_ATOMIC;
 const gfp_t RUST_CONST_HELPER_GFP_KERNEL = GFP_KERNEL;
 const gfp_t RUST_CONST_HELPER_GFP_KERNEL_ACCOUNT = GFP_KERNEL_ACCOUNT;
+const gfp_t RUST_CONST_HELPER_GFP_NOIO = GFP_NOIO;
 const gfp_t RUST_CONST_HELPER_GFP_NOWAIT = GFP_NOWAIT;
 const gfp_t RUST_CONST_HELPER___GFP_ZERO = __GFP_ZERO;
 const gfp_t RUST_CONST_HELPER___GFP_HIGHMEM = ___GFP_HIGHMEM;
diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index e38720349dcf7..5f6a0f7e99c03 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -99,6 +99,10 @@ pub mod flags {
     /// The same as [`GFP_KERNEL`], except the allocation is accounted to kmemcg.
     pub const GFP_KERNEL_ACCOUNT: Flags = Flags(bindings::GFP_KERNEL_ACCOUNT);
 
+    /// [`GFP_NOIO`] will use direct reclaim to discard clean pages or slab
+    /// pages that do not require the starting of any physical IO.
+    pub const GFP_NOIO: Flags = Flags(bindings::GFP_NOIO);
+
     /// For kernel allocations that should not stall for direct reclaim, start physical IO or
     /// use any filesystem callback.  It is very likely to fail to allocate memory, even for very
     /// small allocations.

---
base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
change-id: 20260128-gfp-noio-fbd41e135088

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


