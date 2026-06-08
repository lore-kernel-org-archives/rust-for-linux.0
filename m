Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE76025D527;
	Mon,  8 Jun 2026 11:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780919271; cv=none; b=RiviEgmlwLkDVoQyTdwabie8SaYK7WJtZvMu0/fw3cdDTtWSA2slXYCON0tXoqbLT6dnbF5etp4pge+u8r/wpt4W4xYHrS3BxfGdaiX9f+2XwhQoo2/cOkaAUFzijK9w7f9MAIyI4kC3xPNvk7IK6y51RgB1qWA2mWosuqSci/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780919271; c=relaxed/simple;
	bh=6pZUE6nr2ji/Ksxu2gPhVUmuM8hjJVCRFoi3291f6is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sY8+h34a7rOgKLllHB4MIH1NQ89GzjK161LJVN0/VQKxryuzbLVZtc+5/GRfFaFEAOHxEUuz9LxoJkAz1QKSFpn6yIii90LNhKT3GJX83+XNZB3G8kSYTJuux4zHqn5D50B3Mr8ebK2Otw7jMdZ+yd0Aq3bY9cugVHQYBjH9cMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsIGLmOT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsIGLmOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0CD71F00893;
	Mon,  8 Jun 2026 11:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780919270;
	bh=PxqUCT2KZyVSdTeReMYgFJQToW1ypSg2NFb0ug/hJT8=;
	h=From:Date:Subject:To:Cc;
	b=jsIGLmOT9M0s1bc7a4XF/FOVctP4I/pzgI/W07m3WUfARhHvDWVND6054fPqxXgiS
	 /0p1cIkccy+CEE4jilZmsRaopAjqTD0mXBEoJIIF1pLmtiCOtGeF3KLRJTQKVDrWFo
	 3ZgNawjkKpCmR/+BRrbbierbgVK1hrPtdvOMs4XFWCZ8jzhHXT82HtXSc8v6MgwsGM
	 EOoRNBPSba485gqgcCZvHwyAv9wI+t9mIrHGpkqcITbyRwJngdv18DsmnBlfd6tAGp
	 2IW587w5W0QoZ4vVTHFt90XelH/N8f3468oM+TN88JgcYbxP2H1S2Rnmg5oeXz/nHq
	 1V+oPNUjai/ww==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Mon, 08 Jun 2026 13:47:35 +0200
Subject: [PATCH] rust: alloc: add `NumaNode::id()` accessor
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-numa-node-id-v1-1-28480299c62d@kernel.org>
X-B4-Tracking: v=1; b=H4sIANarJmoC/yXMywqAIBCF4VeJWSdYdJFeJVpYM9UEWWhFIL57V
 suPw/k9OLJMDprEg6WLHW8mIksTGGZtJhKM0ZDLvJKVVMKcqxZmw3cQqkSqpcKCFEK87JZGvr9
 c2/12Z7/QcLwNCOEBcdWqyHAAAAA=
X-Change-ID: 20260608-numa-node-id-85de708d4e8d
To: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=6pZUE6nr2ji/Ksxu2gPhVUmuM8hjJVCRFoi3291f6is=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqJqvZb34EKyVvqWp18h1axxj7vVCjkq6F9+PqV
 BZSW8s049qJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiar2QAKCRD6UCkIqsW9
 0ImvEAC3z0F7Az0dY/2pVv6iWHDf5fgxlPWwCrilnPuWUT9DHC0lqYfCWk+AnGmlv5Y5qRJ+Bas
 eJRvNv4/AOd3jJAH7AJ/9jWEX+ZJegyfLU5Qp7aRhesmaLiphQSQ7V1q18uNQ9wb07gVpJS9/VQ
 9ncrtgApWwbDKse4TISVqWyRB7QTfOJIoa8yrh1W+njsfuf+golCmcM3vWLBodM6H7Wjs6T85IP
 Orkr+Vbyh2k75/mFtH+dBKs/kdisZL8MtH6Gfa569oWoh8ST6O9DGfeuACJAhfkOPUFgXBTnf8i
 0JLtzfk/s7kw4/t3RxUoM5/MSzAZeFtGhs7Rbzs1QMExlV73nYiss9XAvK3kgosERT9pOkA7kQH
 h1T2njFemtOrKU/w9WAhwDbBQrf0mm+W9Ws8waG/hxxPyIqJAkl29KXBHXUf9/Uu2YTP47YglU0
 kw7yPa41B+hNGldy0J8dIdAJ/wNV5XwUImleZSXffXobV1S+F2RzyMbCnDxRZeORErj87EXWLG8
 HukWFWKDUCKDUui8xPBdBg8f2fgi9c1kYlAFQabOk/gSxm5lTVCPnjOL77I2NWOlB1Yk4bJSAvR
 cYUwuMNAgN7LX//aALKEhPuwqg3jPM/S74JugZgkxO7+TyKBOCRkwcGeQWTJK4Y7Mb+POH6/Kqf
 dKlNRxGNjkVwpMg==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

`NumaNode` wraps an `i32` but offers no way to read it back. Add a
trivial `id()` getter so callers that need to pass the node id to a
C binding can recover the underlying `c_int` without reaching into
the private field.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
This will be used by an upcoming change that adds a home node parameter to
the block layer `TagSet::new()` constructor.
---
 rust/kernel/alloc.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/alloc.rs b/rust/kernel/alloc.rs
index e38720349dcf..c02290bb79d9 100644
--- a/rust/kernel/alloc.rs
+++ b/rust/kernel/alloc.rs
@@ -126,6 +126,11 @@ pub fn new(node: i32) -> Result<Self> {
         }
         Ok(Self(node))
     }
+
+    /// Returns the raw NUMA node identifier as an `i32`.
+    pub fn id(&self) -> i32 {
+        self.0
+    }
 }
 
 /// Specify necessary constant to pass the information to Allocator that the caller doesn't care

---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260608-numa-node-id-85de708d4e8d

Best regards,
--  
Andreas Hindborg <a.hindborg@kernel.org>


