Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF22F205E37
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Mar 2025 15:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742053491; cv=none; b=DJ4M1hmFH6zhV6WUJJQDTuRXWltjNhgJkrjohqTbf4V59hEn6BKHtaizZgBxEsZtFKjnIepThVYPeeBhD14lhcAclg/+z76gZnNsq8Cm+iokMimWTmaXeiyiCzEMC5vqn7DylYA1lBMlW+Rf72cPYE47Vi874bLyiGVMnZ2hxWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742053491; c=relaxed/simple;
	bh=K4DIQFf0+Dc7ZTM/US05VTixG10TJ9y6ZbCNXQ7jyhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NErm7AJzoInmk1MMvckgSGxlno8jfgV7WSVvJfWC0/LgtxcyUTtDIIqcKG3T59PSgx2GLaJU4LBLIY+bx8DUKi49ifies4fk0XSrOmEwi6XIZ3Cr76yTOftaU7CrLvxmtQWtUVdwK47BCWFwCK/GKQk6CCu3jRal+fKDJwl8wfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCglUYuu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCglUYuu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1393CC4CEEE;
	Sat, 15 Mar 2025 15:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742053490;
	bh=K4DIQFf0+Dc7ZTM/US05VTixG10TJ9y6ZbCNXQ7jyhE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TCglUYuuGj6Y5y/cEAacU5qd68bbwKGICil4VKNZPDwhwp24iEKV1x3ce9xjddfl7
	 iAnYcsQ1nF372iYu1tW/y3GSC0szffqvhljJcYTPzLpccNAuctaeySBd+HMHoRJ6mA
	 G5NhCMEm1DK6uiDTPqap3sqaSXJQecgQ6cKZCfu5Bcyl85guQTfKhT/Kw5OIksMX16
	 cPHTaz9XbAN/ZtNpCgoxKkc4KwJtHfcCg9uPuU/uRU8/V9cgBqQsl+iU/Emst1MxKi
	 XnXGRfn7uxqs+X6XBr4J1CzsVV+rBSAcfFm6rNCZ63a6EmLlIaXZhFaE/W/TbyfBDG
	 9kQ6Qh9Hll7Cw==
From: Danilo Krummrich <dakr@kernel.org>
To: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: andrewjballance@gmail.com,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] rust: alloc: add missing invariant in Vec::set_len()
Date: Sat, 15 Mar 2025 16:43:02 +0100
Message-ID: <20250315154436.65065-2-dakr@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250315154436.65065-1-dakr@kernel.org>
References: <20250315154436.65065-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When setting a new length, we have to justify that the set length
represents the exact number of elements stored in the vector.

Fixes: 2aac4cd7dae3 ("rust: alloc: implement kernel `Vec` type")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/kvec.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 8540d9e2b717..0a4681ad4ce9 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -195,6 +195,9 @@ pub fn len(&self) -> usize {
     #[inline]
     pub unsafe fn set_len(&mut self, new_len: usize) {
         debug_assert!(new_len <= self.capacity());
+
+        // INVARIANT: By the safety requirements of this method `new_len` represents the exact
+        // number of elements stored within `self`.
         self.len = new_len;
     }
 
-- 
2.48.1

