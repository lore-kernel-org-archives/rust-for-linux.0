Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621903B14AB;
	Fri,  5 Jun 2026 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780664698; cv=none; b=SboThdtvgnjkgY7y/Q6DQ4WNc5TWf2TcxUs2hqkqVHLlqexPnbPoGUAkxU35K0s7lYOKjf9n8qBPECziVmRnq+am2KybMwYKK+vX07fixxV96JHT+Z3tzROCI9Dies9yhFSpDBO9HXHHIRqH2yh7w499eGAIJerIxXYaYZl/Hnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780664698; c=relaxed/simple;
	bh=y8SrsZf4Er1k5T4KxEmOkOYdCLVERYK0qajWVQobk+g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tdJyMlm5fu2CuNHQBUFON5UEcHNQJ1R889oZDZJXRCqNgLeVOPRsDnz5gRnN82rjrUvnxTU915t2/kR95MCt4vjOv+dJqkOBaX1yeKrxaO7aYMuPa27QrtBjVBWq1JcKYwmfty/6dRltJuZ+paolUdp7++3eSv+kPcVYjJojBAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JSEgcKUs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JSEgcKUs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590441F00893;
	Fri,  5 Jun 2026 13:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780664697;
	bh=J8xWN6FwFJntxASihgK6OAXFm1JzLZteeOE+ZioOK3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JSEgcKUsg+yJVkb9iYduhcgHuxOM0UK445MNEB/QOyjamoX/C8+KLCaoR9SMuJQZz
	 OJIuqpR+XCAlSTE1ILatHnBZLNwgUWnZCe+I005hQhpkb8yF54rnm6Ll+A5qucRHbV
	 JoRfa3T6cFocEQkJ61mwDqbfyoD0rVx4fG1FoookV5v3ktcG4cTff1DX2aDs5TDgVj
	 +2fI17BXd0ZydDzZjnQdZrcy3Hk615Z/58e6XinXW9xFzLnTmtCgUadh2HFvUiuteO
	 Jne+fZ4x5gR3FK6dkxekj6VmO4i4/KOPRCJb4WuX65F8HNuL5tNUQsroOJIUZK4jE3
	 49Jp/lo7rNByQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Fri, 05 Jun 2026 15:04:39 +0200
Subject: [PATCH v2 2/2] rust: impl_flags: add bitwise operations with the
 underlying type
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-impl-flags-additions-v2-2-0d27242f460b@kernel.org>
References: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org>
In-Reply-To: <20260605-impl-flags-additions-v2-0-0d27242f460b@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Boqun Feng <boqun@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=y8SrsZf4Er1k5T4KxEmOkOYdCLVERYK0qajWVQobk+g=;
 b=owEBbQKS/ZANAwAKAfpQKQiqxb3QAcsmYgBqIsloYZBCseRps0SseKyEZHcMuXu4a1vgsADpn
 NP2dRMVpnyJAjMEAAEKAB0WIQRXitnI2WZ2JirAaob6UCkIqsW90AUCaiLJaAAKCRD6UCkIqsW9
 0H86D/4pSci7tqXk4gsSChFFDPjYVNmSnDk1ukzTJWo66JIjGq0KKM10xlONbxtti9nmCkxxj6b
 hYjSY+u4AkFwVXtwdtGA7jxAAmHcD9xIqLw9beJpLLuTuDUFXGh2nEbxt3erU1UtjQrSzAd/1oK
 Ul/TVqafteiinMz6jeeY4VGUVe8c1RQU33CUxdLC6q4pKpN0e0L+NDiJn0mA2ZeFYhrcCEOj8QT
 Gbq48gXCcYTXetPBMcGkyqg+EAOijBJVg39e3JtpBlghi/mKSr802QSM1rzrLhyzNQaOc+fDvWj
 YRbaZcP1LNRLmCoVIWtNbqKmEZ4PXLYyxG+6N7XWT0Q6XIjy7cOt/sy+x1UxOwq6qondIPTVLhJ
 BEyr0Rzev5pQRUqk2AFqYgHAazTfHunH/AW0dHtqVoYzIMqWx8puRlsryR8V1XnF/LqXvrb2ziv
 fUk2smGUMyFFR9b+6DNaIrf8DJo8SvXKEHzb4mTbrsKJJdRzJEqvyE6P4ehvP7+bRNEAFWkm/Mc
 bhO82+TbKFaKrVyidQJSSdC8FzlxhZbFSJnFmp49XaLZpuDOggeUD9507/wLozEGyuZC7NfjnQo
 xn4qZJOJcCDJsb7GxgYTDQQSICy3ZvElMYU3Iz8P8SgiXCjSDAro73aNRBSxwChaHmBWumI9Tjg
 ojmN+24K3TwuQPQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Add bitwise or operations between the flag value enum and the underlying
type. This is useful when manipulating flags from C API without round
tripping into the Rust flag container type:

  let mut lim: bindings::queue_limits = unsafe { core::mem::zeroed() };
  ...
  if self.write_cache {
      lim.features |= request::Feature::WriteCache;
  }

The above code would be needlessly verbose without this direct assignment
option.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/impl_flags.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/impl_flags.rs b/rust/kernel/impl_flags.rs
index 04a4b0a356df..8340740b2efb 100644
--- a/rust/kernel/impl_flags.rs
+++ b/rust/kernel/impl_flags.rs
@@ -280,6 +280,22 @@ fn not(self) -> Self::Output {
             }
         }
 
+        impl ::core::ops::BitOr<$flag> for $ty {
+            type Output = Self;
+
+            #[inline]
+            fn bitor(self, rhs: $flag) -> Self::Output {
+                self | <$flag as Into<Self>>::into(rhs)
+            }
+        }
+
+        impl ::core::ops::BitOrAssign<$flag> for $ty {
+            #[inline]
+            fn bitor_assign(&mut self, rhs: $flag) {
+                *self = *self | <$flag as Into<Self>>::into(rhs)
+            }
+        }
+
         impl $flags {
             /// Returns an empty instance where no flags are set.
             #[inline]

-- 
2.51.2


