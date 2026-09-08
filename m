Received: from out162-62-57-252.mail.qq.com (out162-62-57-252.mail.qq.com [162.62.57.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851554CA288;
	Tue,  8 Sep 2026 09:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.252
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859602; cv=none; b=IB36/WLk1RcBfY2EXk0PtcBdygcuwE4i7GLTcSuHJjVEMizLRz9iqgDYgfXoxOBxZbTTWWprsYaTWUNjS+c4nr1p2PwMLCqL1xxBgbsSTyb27x65dGy0DtFkbsqRt/+khGVGMnRwvxlDEIfOwkKuAhYnxzlpBFabcHwBtwwDDk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859602; c=relaxed/simple;
	bh=T2c+MrFCvUYsSxzNKVB10vbug6cnyJGcxZGjZsVQEZI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=E8+lPZbqYd3kQj3klLyFmxLoifAxjwP3lY9vuf/TmXZ1p/gRwo88NwWybQyl2A+u8mvP3ZNNLmNTQepJtjUN15KifSvaK+k9Svti/wstXfxTXOVQHwHOspov0Qqadvf4yyYTLdwmbQUArc9pOQoqaG+VMR/KrBR8642ArK+w1N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ViGkSUhL; arc=none smtp.client-ip=162.62.57.252
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ViGkSUhL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788859594; bh=gvxwUOb396K7iHMCJjYc4DeX5IFP84qAwIQq44IcqkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ViGkSUhLsfI2SUd5J9jBxDRhpEjoy3bzOJqOq/jXcezu8N7/3dpKFXDf//9dIzuGB
	 +nfsD/U07IOzLDDZQqZG7LNYsagEZw+zuh79ztsz81Cm57wlvhU0HmgBGFAy/pEA81
	 GR5AT8kF0jL96cf+4SdGP+Ge3RLd4Ho8vsAad7Qk=
Received: from localhost.localdomain ([240e:342:b241:2200:5415:9e:37cf:c860])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 6999861F; Tue, 08 Sep 2026 17:26:25 +0800
X-QQ-mid: xmsmtpt1788859590tsyf96io9
Message-ID: <tencent_DD87A0F7B21501AFDD1205B7FE797FF85F0A@qq.com>
X-QQ-XMAILINFO: OWm3msKA4Noej9dA/jSqHOXeAWS3je7i9XWuP0l7nnSpD0VbMamtJ7FD/1Fz4p
	 bLngQCOG2hlERIwqYwyE+i/DuDxN9lP5IUeYHrgi23CeSrgm3wCeT1FlydUg4ZswVAjGoji2JinY
	 lk6DSWb9tqyOF3+3Z1oykDh3E+ybjCYZ2TzB5AF5zO0x5ZymKv7dqk264SiwTG5EbMe32MporUSr
	 gdwpmsCcBbEMD2Vx1K9Pw4MWo6ZAfFgumvl6w0agMqMoEHQ5nF+NVLrObSy/FPgM7j2FHjJv7rjq
	 GZFzftAVsRYzxdYjwprUtQ4jmgCx8mDr7QU0LIyUte6z6vkXxtZ848WK72MAzkRfgX+WJwq6YJkR
	 a4e/Uek+f/u0XJRPNfKdW6wCyPv0aBdYx6/7TUo5WVafYVSuKKXs0TPDv3beCbGkML9sMOULJzbF
	 TU/06SYXAsyNemq+CX4eL6doabMtTv3xdw/EKn9upp38uAQy2MoshXVzoNqIB2TVPXMH63S4Tceu
	 G0c6719dFWc5Qt0iDU5GTqSmFiwEmtWpu88TcNJ3hJ1twvQwF0YKHn54jd49BPh0KkL/C/+bcpRy
	 2qi9the9DrxHCX07sT8TV5bsXCt1ThSsRcENLDixMx5L/iJdIfsyhsz92q+lVzdbeCbsOeijwT79
	 L/dyrZmlUYI2Swb3WNP1JfT6d0B4ufhrlwrus2yVo20I7zRnIcj0VVeyqGglEhCLQkxoPyfKpA/w
	 y6SnIZ/rLp9flfh0Vns5mnKGg9LurcNf5PQYKTRliUJGnajxfnhd7Dle9lN1x2cRB4je+qVdJ/38
	 jPKHdS9TyzVvJESFJWtEBdkG/si2aBfNGqPrcsa3ia6DDttldaJguN/8eiXVB/DKK13Wiu4P/vU1
	 fHod+n3TpkycS8m7Mxqnmtgq7s250yR4tKzM/6TO/3kTyaKl3dd0hEo9YOLAXeU08QmHevInjLjx
	 58a51Ua+JCnh6i8JVhdPYkg5tWEOR8jrLIjO7QV67bG88EXa0YosmmUi5t0Smw45rEk7BILjw97x
	 cPkVqrdvO5kCcRRC6JmBOKNu7mbU1JdHsruLuQZ81KhTRN0CAuzxoOp99BWRLjnmnTkrqenjHptR
	 msETWrKTsfCxmI9OhUkSs+591uQA==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
From: JX <1239989762@qq.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] rust: alloc: use unsafe_precondition_assert! in Vec length helpers
Date: Tue,  8 Sep 2026 17:26:24 +0800
X-OQ-MSGID: <20260908092624.63350-3-1239989762@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908092624.63350-1-1239989762@qq.com>
References: <20260908080604.34070-1-1239989762@qq.com>
 <20260908092624.63350-1-1239989762@qq.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vec::inc_len and Vec::dec_len are unsafe functions whose debug
assertions directly check their documented safety preconditions.

Use unsafe_precondition_assert! for these checks so violations are
identified as unsafe precondition failures. The inc_len use also keeps
the const-compatible macro path covered by kernel compilation.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1232
Signed-off-by: JX <1239989762@qq.com>
---
 rust/kernel/alloc/kvec.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index c7546b9da4..9216a4a304 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -23,7 +23,8 @@
     page::{
         AsPageIter,
         PAGE_SIZE, //
-    }, //
+    },
+    unsafe_precondition_assert, //
 };
 
 use core::{
@@ -230,7 +231,7 @@ pub const fn len(&self) -> usize {
     #[inline]
     pub const unsafe fn inc_len(&mut self, additional: usize) {
         // Guaranteed by the type invariant to never underflow.
-        debug_assert!(additional <= self.capacity() - self.len());
+        unsafe_precondition_assert!(additional <= self.capacity() - self.len());
         // INVARIANT: By the safety requirements of this method this represents the exact number of
         // elements stored within `self`.
         self.len += additional;
@@ -245,7 +246,7 @@ pub const fn len(&self) -> usize {
     ///
     /// - `count` must be less than or equal to `self.len`.
     unsafe fn dec_len(&mut self, count: usize) -> &mut [T] {
-        debug_assert!(count <= self.len());
+        unsafe_precondition_assert!(count <= self.len());
         // INVARIANT: We relinquish ownership of the elements within the range `[self.len - count,
         // self.len)`, hence the updated value of `set.len` represents the exact number of elements
         // stored within `self`.
-- 
2.54.0


