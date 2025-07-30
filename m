Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9FC1DC994
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 03:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753846623; cv=none; b=sh4k/uU/3FJMRcqDvW/BZwdjOO1xQEfXxZxBoM1IzfW9rRidMIgqBW/qfc6FUUI2wRb2qLDs+EDIEes9cSEBolQ33gdnWGfW7KHhjhT81JJY2ZgxtV37tfPwHMNOVhTijYRhLBOLK5xlkHSWShtcZE9bArdtcB+Gx/iAlaV+Ayw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753846623; c=relaxed/simple;
	bh=pvUw3HOxO3kubIOU4lbfo6vjGrJWhVYRfVOKaI+9+8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nS7qOAQeEEBrtYW5qSw/AIi0w5/k3+cwcfTManTGRnAbtewB1SkKiupocRav2EmS60OAKoVOfAniUJQ5CheRFaVPKwNTS9gFbuTz5MXRIm4ym/WFuz7AUUJxgO2o9uK/VTPLJslmrQVCguDQrT++nGIm15uuCAxVof8doxda1gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZWQS7OOk; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZWQS7OOk"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753846620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NL2NutqI3C7y42/84zE/Wv89v2yejsQI2VaLqtRerjo=;
	b=ZWQS7OOklMFC9W+ul+VI4zzg8VSkwyMOMMCucZcuPFggFQbbPgvcAMKkmYU0n1hcfhf1HF
	Lo+6JUnF/JU5C1ezmtOeFazDHaoSXitcs5UfnA2FKhIq/8VmH3YmBkjZ3tJwV0C0GlkmLB
	w1NM+2lc/T3ebLela9Xh/M8NHQU2KjM=
From: Hui Zhu <hui.zhu@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	bjorn3_gh@protonmail.com,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	vitaly.wool@konsulko.se
Cc: Hui Zhu <zhuhui@kylinos.cn>,
	Geliang Tang <geliang@kernel.org>
Subject: [PATCH v6 2/2] rust: alloc: kvec: add doc example for as_slice method
Date: Wed, 30 Jul 2025 11:35:22 +0800
Message-ID: <786e88abea2557080bde65fa9892df3b956731f2.1753841900.git.zhuhui@kylinos.cn>
In-Reply-To: <cover.1753841900.git.zhuhui@kylinos.cn>
References: <cover.1753841900.git.zhuhui@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hui Zhu <zhuhui@kylinos.cn>

Add a practical usage example to the documentation of KVec::as_slice()
showing how to:
Create a new KVec.
Push elements into it.
Convert to a slice via as_slice().

Co-developed-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Geliang Tang <geliang@kernel.org>
Signed-off-by: Hui Zhu <zhuhui@kylinos.cn>
---
 rust/kernel/alloc/kvec.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 92d0ed3f302e..f57e08c64929 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -224,6 +224,16 @@ unsafe fn dec_len(&mut self, count: usize) -> &mut [T] {
     }
 
     /// Returns a slice of the entire vector.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = KVec::new();
+    /// v.push(1, GFP_KERNEL)?;
+    /// v.push(2, GFP_KERNEL)?;
+    /// assert_eq!(v.as_slice(), &[1, 2]);
+    /// # Ok::<(), Error>(())
+    /// ```
     #[inline]
     pub fn as_slice(&self) -> &[T] {
         self
-- 
2.43.0

