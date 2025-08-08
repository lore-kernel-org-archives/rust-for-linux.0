Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5EF1DA3D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 18:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676743; cv=none; b=aZUdthhUxn4mxzg+jAWGYc8Qp1nSWPhjxYV6lzCCEOfieQBWQGXBd/5KJuCc+Clq9vnmEDxMOVEFQg6ZysA4KGDTlSlwDCsDH7mJtcbc0umDN4Qnyo1rDeG9vs5VNbeRVtHKj08TEKf3BrrBhzsWbnRyoTOn+YNH9yNp58voSRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676743; c=relaxed/simple;
	bh=oYesJmIJp0PAia0LKzFLtEpcWtG1FumPIbQCyxsRt1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FOTe2Z+rGYo9imqVRvZ780AFr3mlBoDlJ99p1aGxZrQhNM6lyQsuAaVkRuWoQ/dtVCtHo+WJ0MFaeEA672afhbbQ0PzPpqC0+8K6UQg3QKSsstE7FK2Kn84WwGNkrbnfd51tK9D4bhHSjYgFUKzinr211aThsPYcS1y2gFxeo+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3xlCaj0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3xlCaj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3AFC4CEED;
	Fri,  8 Aug 2025 18:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754676742;
	bh=oYesJmIJp0PAia0LKzFLtEpcWtG1FumPIbQCyxsRt1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m3xlCaj0B0De4WvpgyrgCp0m4RlJlz3gT/hH5Ouncv5vnp7WAOD8jRJ6EmE34zy9V
	 F8WodsXJMulJmYLQVO36WoRFvIKaRmWjBJVml4yt6JSTG+itxy5+iemVJerf1fm7O/
	 kkQGjMPJq7mEduH+epSL4qMaIlwqEzoBq95paGOeM8pv5QWhDnfZh2CA9ND1Mo47xk
	 XpNfCbLJYCXrrjARZF1MVtHWoHNrml1rxCAHXB506kDc5sQCiGFiFtz5MnRIbV3juF
	 eoDkwk0LoSCE6VC8FjSzu8r7/02Vg/O1IT97PSYDzFkemVGg1DxUE0vGp4Rotz5qhb
	 xU9Yfvl2nCxSQ==
From: Danilo Krummrich <dakr@kernel.org>
To: lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	Liam.Howlett@oracle.com,
	urezki@gmail.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	acourbot@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 4/7] rust: page: define trait IntoPageIter
Date: Fri,  8 Aug 2025 20:10:18 +0200
Message-ID: <20250808181155.223504-5-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250808181155.223504-1-dakr@kernel.org>
References: <20250808181155.223504-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IntoPageIter trait provides a common interface for types that
provide a page iterator, such as VmallocPageIter.

Subsequent patches will leverage this to let VBox and VVec provide a
VmallocPageIter though this trait.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/page.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 631718a6ad7d..bfb5898ab4b5 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -103,6 +103,16 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+/// Trait to be implemented by types, which provide an [`Iterator`] implementation of
+/// [`BorrowedPage`] items, such as [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
+pub trait IntoPageIter<'a> {
+    /// The [`Iterator`] type, e.g. [`VmallocPageIter`](kernel::alloc::allocator::VmallocPageIter).
+    type Iter: Iterator<Item = BorrowedPage<'a>>;
+
+    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages owned by `self`.
+    fn page_iter(&'a mut self) -> Self::Iter;
+}
+
 /// A pointer to a page that owns the page allocation.
 ///
 /// # Invariants
-- 
2.50.1

