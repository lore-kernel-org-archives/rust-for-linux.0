Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA6277CBC;
	Fri,  3 Oct 2025 22:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759530464; cv=none; b=FHaZ69Kf5uzxb1R+422nmCrxBGZbUWR27cXr3iTSoE0gSIfYeb4KUT5Rjh7ufFNIhkff9Be0AM8WSFHEkl0nALAG7CsdYBqGQEZISwVdKuHQSRCZk4Lcn+RyEnzrgXumaHsTSLpULYFRF+i8E6bKPnMWs1g9GnUwHiP5pL1l/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759530464; c=relaxed/simple;
	bh=cK7y8EM5TvD+LEZO2NL54xS3FHkoaVuyX5mtLhgeqTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDnlsjmK7T1l0gNbviRpij+zVpMgXOlMd03M1V1J8dHdFYf2E19ii6uFgE7UV/rz+kyHQYPt1u6+7LCS7Dk8ykcPiCWL2q7SSN2S/6CmWBGd7ws6Qgy3YsUKX9zmhtol6QeRpC5urxkicNVOX/iccJfeSd/pSraGPfbfdgSgDdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jpO935GX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jpO935GX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2CF1C4CEFA;
	Fri,  3 Oct 2025 22:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759530463;
	bh=cK7y8EM5TvD+LEZO2NL54xS3FHkoaVuyX5mtLhgeqTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jpO935GXwmuubNHKO8PZdEMZ34j+Bzb5ebPBrJMyBWQRTQ6rCT4vIND80m1FLHI+i
	 0dncc/xmb6T78zx7CzGtkuliF8ZA+c9AXEuHjAncahneG5fq+gtzLLS0+9clv2ObSg
	 VTo4UODgItohkkYwb8TGVLehYChVnm8BdRx6J1WFMbmgqLwG+CHW5npwfHTSgp283t
	 EcnHErrwhT1dkxrGuyLhBsHukg6SW1vVijXV6R4xhYwXMSY6wWIvCYp+R3tHFSakNp
	 BAXntWN3fkM3sBIX7IZ0D+14z9vBzsbvmo1XVpehYxrYkdy1qBuyrpqiRj26tMlY+/
	 leNk9oGt6BVnw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	mmaurer@google.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/7] rust: uaccess: add UserSliceReader::read_slice_partial()
Date: Sat,  4 Oct 2025 00:26:38 +0200
Message-ID: <20251003222729.322059-2-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003222729.322059-1-dakr@kernel.org>
References: <20251003222729.322059-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing read_slice() method is a wrapper around copy_from_user()
and expects the user buffer to be larger than the destination buffer.

However, userspace may split up writes in multiple partial operations
providing an offset into the destination buffer and a smaller user
buffer.

In order to support this common case, provide a helper for partial
reads.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/uaccess.rs | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/rust/kernel/uaccess.rs b/rust/kernel/uaccess.rs
index a8fb4764185a..1b0b57e855c9 100644
--- a/rust/kernel/uaccess.rs
+++ b/rust/kernel/uaccess.rs
@@ -287,6 +287,19 @@ pub fn read_slice(&mut self, out: &mut [u8]) -> Result {
         self.read_raw(out)
     }
 
+    /// Reads raw data from the user slice into a kernel buffer partially.
+    ///
+    /// This is the same as [`Self::read_slice`] but considers the given `offset` into `out` and
+    /// truncates the read to the boundaries of `self` and `out`.
+    ///
+    /// On success, returns the number of bytes read.
+    pub fn read_slice_partial(&mut self, out: &mut [u8], offset: usize) -> Result<usize> {
+        let end = offset.checked_add(self.len()).ok_or(EINVAL)?.min(out.len());
+
+        out.get_mut(offset..end)
+            .map_or(Ok(0), |dst| self.read_slice(dst).map(|()| dst.len()))
+    }
+
     /// Reads a value of the specified type.
     ///
     /// Fails with [`EFAULT`] if the read happens on a bad address, or if the read goes out of
-- 
2.51.0

