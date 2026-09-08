Received: from out203-205-221-239.mail.qq.com (out203-205-221-239.mail.qq.com [203.205.221.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABB33A784E;
	Tue,  8 Sep 2026 08:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788854876; cv=none; b=L42MR3DgEtyRqfinJ+O9e8IHxaxt+9hJp2HDGDwIMfTiJJ3EJCJ8W3CIzlbOP45/x/6gRjRKzRqTBtrv6fYwV22HqXfhqBiq0qM4XgH0JKfT5QSj8KlBLi3BNBgNLGERUT59hpf388khBHP5IaIOHGRuQUV4IuCceY6UfElxAJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788854876; c=relaxed/simple;
	bh=T2c+MrFCvUYsSxzNKVB10vbug6cnyJGcxZGjZsVQEZI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=MkjrKCcaYZM3Rl0pqkSrcv+hW2T4GRllyOEXPDpZUGIp+Q1Hh71tG3aNKLbunC5fat2+VYwzXqipTXZwP0jdCSnD+PfLrlgTO26ENsUNx/GckA0UPHZDuKdW9iqQTrwHFzc5vRo4MNOQDXRRSumZBZ/QvrORg0CoY/9+cH0YZUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=sHOTjVhZ; arc=none smtp.client-ip=203.205.221.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="sHOTjVhZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788854871; bh=gvxwUOb396K7iHMCJjYc4DeX5IFP84qAwIQq44IcqkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=sHOTjVhZfqwauEnGnXvuC1Fhp1OZmwFtU/TTvC7wIHPE5yPcPglJ3qAj8sELCcKJh
	 td8WohAr36cRxCxzAbF3QAeLsEB+w7G7K/pxXKF8MiDliojRZLhY56vEykXVJA0Ii7
	 CbxJVxjjm/LUGwlxzrxTAypkFys5mBBvhRslaZ8k=
Received: from localhost.localdomain ([106.114.216.75])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 185190A2; Tue, 08 Sep 2026 16:06:05 +0800
X-QQ-mid: xmsmtpt1788854794t795kp610
Message-ID: <tencent_B230D7AD5070ED9FECC7DFF5163A0D9B1906@qq.com>
X-QQ-XMAILINFO: NbgegmlEc3JukfmWWJoEchQT6XC1wdXKgtMNTthKR6Df6KFQP7KLwF7TY1241h
	 uG5hSxMkA8n5mxQUpMgDrDaB0HeiPnDNq1zIBmfAH8axJBYkC0DtkQsaklfA4v5xSYj42uBMWx9W
	 zCslvj+miY4AcXqjdVBRvp90notS6dwdUTNkPKsHsvi+tX3hAKvonildarB3GzWimV4g6otY0DVl
	 +qtYlrsQigq1wRJaHKIHB4ZpT5G38bBA5eBf+sJk2muOx2qjzsKVtdQpU/ZVw3Jc9JHWwF1zmMYr
	 n38EjI5Zabrf9JaNobzTedI2PYQ/6oxb+gSyv8sdN6Td9z+KKi6MXSSL3MEW6OTmHVA51IV5f/WZ
	 P8U3HgbmJXcZovMQXo8+MB1aKMhPlftunBgHOj+7L/yMY35D5tmza2kdyuhsN5CyA0LFE2H6eRac
	 daJ6jDTa6boKqq28dOS4k5+FJ1LzkdmDXrOlKuk+GzABUVvS++WnL174OekNLEo1r/pS9SCBVWJg
	 3VXLzgTv8C9VSPKAt6osiszuZvXZ48nWIOYkr1PtxzNEgf5RLE2WkXcPk2KqyRIYNOzdn1KpH+qz
	 v5pWp3nAOCVY5NiWqaNqshyD8YtPJp/Ho/YVgOtwV9ctEHOPsbQnns8hJvzuxOGL3+BOXbGO7rzn
	 tqtdTxS4cT6YjI+Ra498zNvlspDVFZxJTWlnoHNe7jyUjVSnX9G4VSbQN/alk26qLnwxzNdyUnvT
	 Z1b3hsoyB8zSooDa80yNp0NMOJyUxiz1j6a+fw8Lgjj1v063s45JeAcvJDqO00lx4m/oxCiIRMPS
	 J3ZivNQzIfzfC/eKw8TwoXxu7YwgPgBnYqbiTbDZyNA3Nxb8/74bIotk7HEhIDOLPZVQ35NWgMb1
	 HSLD91z/5GYOB8LJHRMoFGSeYFPJbPU3MFfPKsWieTmeelvRGwEzbti5dD9D/Wy+ScY46/on2OtY
	 ETDCONcmxUP3U/x1oDvOsFmTiYmcPDR3BJPwuFzGy0Iz3tpzkquy0CAjT3IpYnoXZwaCn9Z1xNW6
	 snp5gQd0FUMzLpBZ4nzqTeugnzooo=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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
Subject: [PATCH 2/2] rust: alloc: use unsafe_precondition_assert! in Vec length helpers
Date: Tue,  8 Sep 2026 16:06:03 +0800
X-OQ-MSGID: <20260908080604.34070-3-1239989762@qq.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908080604.34070-1-1239989762@qq.com>
References: <20260908080604.34070-1-1239989762@qq.com>
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

