Received: from mail.nessuent.net (mail.nessuent.net [188.245.177.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B139EF33;
	Thu, 21 May 2026 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.245.177.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779359357; cv=none; b=NyFwvyMWEyp3w+9Tm0bwGm2Phze0sqSPGCpZ2XCZLAhjAEXFj84ZLB6dS6CFKmAYLJoCTraKLnn8deTp7jnHshJ4PmITs0s8ItMtZKuztnGrzlyPGZqeLPmFGcy9i0faofKiYQDNI1Kev5PCOJIfa7vmg/QI/YrYUTOsN+DHhBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779359357; c=relaxed/simple;
	bh=WC+1iNTfK5Fw7cQ8d/7XaHMziGgU2Y9q0ezaVzq+F4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JX+DDpPXwQIolkkkPKUERaUtNFbZaDBPhQQDASShZ7XlWOOigqziuq3wL8I9nWwaaqBleE3b85F7PF0upA6CValcE/KhaRayOgg3VhCEO+C9o6212lvwMZKOgMr55D+6bvAR5b0ceuZSWde/Tha9UzB+OcEYjOtD09LRFWqT13U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pitsidianak.is; spf=pass smtp.mailfrom=pitsidianak.is; dkim=pass (4096-bit key) header.d=pitsidianak.is header.i=@pitsidianak.is header.b=nPIhqvDZ; arc=none smtp.client-ip=188.245.177.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=pitsidianak.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pitsidianak.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=pitsidianak.is header.i=@pitsidianak.is header.b="nPIhqvDZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=pitsidianak.is;
	s=mailSelector; t=1779358883;
	bh=WC+1iNTfK5Fw7cQ8d/7XaHMziGgU2Y9q0ezaVzq+F4A=;
	h=From:Date:Subject:To:Cc:From:Subject;
	b=nPIhqvDZz6WctZzu+6R+NYQd//Q/jXXxr69rSmPi5fGY0COo97efcjlCJ+OgjbBHI
	 QbX29EsHIdN6V1v7OZOcSlju3PmtTopK2ad50Y86W38Ys33mac8mXh76V33rEjzZWD
	 B8pKlrkfqSl4eYodP/3u96JUslVSN2fibSyBFcAHe4JPYcHRWcJ/zwvA/nPeZDayLs
	 h390Pk1NTe41uIZmIyfb5eXlPTIYm+vCkLOEK3wnF3cAddbkyLV+iM71gpByBaXc4A
	 Kmx1PzqNJ2WdPOWuzLmKN5ZZc7m9wVARV1MUOTTTK/Oaqp+FIpIX6NblsADdVEzmvK
	 3bcoAuQtqFlbtbsxlf8goRFXbmrXvHZw9LCKuQe+C2K7VGN7q4uVBhzJoOLL1np50T
	 zZQUHb1D5mavXjWQ3f7yM7nC9oXgwxWlrG7Aa+YJJtKuwn8bY6oKjjh9RFEpOR/ViH
	 GIfVont6KXi85c4Zra462g24Ng/Lp/bbwpJZjKrdVoDRVqVmLqd9geAxCSAI734d33
	 hgParBlE9P9ghnzDSVL+V3WnNJpRnK1VI2iN7kG+QSD2OxUKAGARBIYVLXWed7gMct
	 vEECZRjti4YnbYE3oX5ZHnPoPcIxM461GmZ22/+WqnrqcjYlowecMFVFF/gyvP+2Z7
	 I5505uZ0kr22jufxMPo1+fjw=
From: Manos Pitsidianakis <manos@pitsidianak.is>
Date: Thu, 21 May 2026 13:21:15 +0300
Subject: [PATCH] .gitignore: ignore rustc long type txt files
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-rust-gitignore-long-types-txt-v1-1-5be5e6fa427c@pitsidianak.is>
X-B4-Tracking: v=1; b=H4sIAJrcDmoC/x3MwQqDMAwA0F+RnBdoKk62Xxk7iGZdQFpJMlHEf
 7fs+C7vAGMVNng2ByivYlJyBd0aGL9DTowyVUMM8R66SKg/c0ziknJRxrnkhL4vbOib40jcTSH
 09KAW6rEof2T7/6/3eV5oYQGfbwAAAA==
X-Change-ID: 20260521-rust-gitignore-long-types-txt-c1e5d0071913
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Manos Pitsidianakis <manos@pitsidianak.is>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=manos@pitsidianak.is;
 h=from:subject:message-id; bh=WC+1iNTfK5Fw7cQ8d/7XaHMziGgU2Y9q0ezaVzq+F4A=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQnFEdHlpWUgrTTFaVEtaeE1JYTVJTjB6Z3d4VkxNCmdibGxPR0h4RVZYcHcyMGtq
 WnFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYWc3Y29nQUt
 DUkIzS2Nkd2YzNEowRWgzRC80emNBSzF6UU1jQUQ3RHpwRVJsb0tRd1BiNzRydHV6aUNDaENQaA
 p4Y1lhdW8yWHd6NDgrQUFHMWxFeFdIeFFNKy8wMFJwQ2FpaXF1VG1LZ0pMTXNTK2xWZ3hUSEZLM
 TZMUnROS0dyCngzSlhGdzRFeWJZajcvbEhtZ011T3hCckRSRzdnZTVEQ3VGK0xZOWdQanZHVWs3
 U1dsWEs4SWR6M0pUUG9UR2IKYkRabk1sSEgrZWxLUVJjS0p2K1hUeDBsYks4T2VLdEVvNloyZjg
 5UlpROXRtOVMzdjg2eGVobzl1d1pTMXZ1MgpRck8yb3lVTnNQQkFMaE50a1pVVkQyNkIvMTBVcz
 R3WTlqVXk2N3JPMGxWemZ1NDFRbmI1ZURrNWZnMkJ5cnlVCkhkU0NoUlRhMUJRQ0IwTlhGMWpke
 Eg1MUNsVGxIenRpSURXdDRlV1FWaVhEMFJKZWltZzQvUTNEQXg5Y0VIRnoKWFhMbWJ3K3dYWmQ4
 bHZ3aHNzdjlIOUdrcFNNUU83R253VWo5eWJucm1EZ3pDR1JkU25jMWhycC9NdWJub3J6TQoxb1d
 Yb0tNR0FmVmwxR2RYem9UYm1mdlhZeG43TkpZZXVXTUJ6WkdodXkxeEt6NmhDeGNQVndrZU93dW
 RrZ2FvCjJGSnZCaG1vWWE1WWllZ0UzWmF6TmhEKzh3citGRi91ajVBUlZCTE8yMUdxVHhTOTgzN
 zNHZnlLd2lpL2tsSFcKK0dMdDJzbjlqOWsrSWxDckhPZVdDS1Rid2dPdmlLRE9HL0VybDZjc2FX
 MHNSZ0E1SWNKdndGeTNVM0dHSDA2SApBMEFoMGMyYzk3b1VoeHhScjV0c3h1S1FNZUUyVWNyQmR
 jR1cyRXJXdWVTOGhxV05BTnZUNnBqVHIxY3Q0M25OCnNtejFMZz09Cj00cGptCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos@pitsidianak.is; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

When rustc prints an error containing a long type that doesn't fit in a
line, it will write the whole thing in a .txt file and print messages
like:

  note: the full type name has been written to
  'path/to/subsystem/module_name.long-type-11621316855315349594.txt

Long types like core::result::Result<core::pin::Pin<Box<_, Kmalloc,
kernel::error::Error>: pin_init::PinInit<Box<_, Kmalloc>, _> are common
during development, so add a gitignore entry.

Signed-off-by: Manos Pitsidianakis <manos@pitsidianak.is>
---
 .gitignore | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/.gitignore b/.gitignore
index 3044b9590f058f94fb5334d75765444066488b8f..529c02d9bc11d17672019e49e5ebeacc168a6cb2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -188,3 +188,6 @@ sphinx_*/
 
 # bc language scripts (not LLVM bitcode)
 !kernel/time/timeconst.bc
+
+# rustc error message long types
+*.long-type-*.txt

---
base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
change-id: 20260521-rust-gitignore-long-types-txt-c1e5d0071913

Best regards,
-- 
Manos Pitsidianakis <manos@pitsidianak.is>

