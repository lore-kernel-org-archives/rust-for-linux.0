Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4BD1E8837
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 20:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754513464; cv=none; b=cZJQ4c+TuPTR2gE9m+9/Szl7N6Y6cqtZp19n8LQWTQgc2QK7/klinZD5JrTqd315af1utGEdY58i+npmDigPPrrJna9CgXE8eDVF9JNPp0iboGMFlESQzj3rVZ6TCMRuXxaprt8sIWkvWI154kBwd53Q2PJYvN7V64rNOomgn+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754513464; c=relaxed/simple;
	bh=rKKeW1brxHISOjb0LnTTDBApo4+CXT1/F/MeYdJCe7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KeOpzoInZAYMGAKl2Sm6SXViJXjZqzRYLJB02fQokIdyzaUFHCdYrpn8rmqTCB3IpT08d1td/zvd2G3W27uUOh8+jqJDxRPTb0a6UDmHwLCQeZnvFIwQQ9O+475WtMtPn4RUR04dROF0WD91xDg1lvCYnjmliIZhmOjMN3nLW6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZ/QhXPm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZ/QhXPm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4231DC4CEED;
	Wed,  6 Aug 2025 20:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754513463;
	bh=rKKeW1brxHISOjb0LnTTDBApo4+CXT1/F/MeYdJCe7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZZ/QhXPmsKkxAjdP38r8HZP2itDXpsLwaEPo5V9VneTemEA4Lt7NuKsWrEFEXRVYb
	 68H7K8k6fOQ/IjMisHa3CQ1L4fG3z5GELdbyqQAiMMtn7/Ius1pWvVaY0HexVDO2rT
	 puZYKfet2UQa6rqwEyTEfBqBTfIoLfFjeGj1Hm+ieYttbHmmHtnfp0a9DkuGoM5IkP
	 fbJ0/kp6VbV1WEAWEVmP5gNh76cBp9ykpY78P4f2gwIG7FF7Il2wSnYqlPXtEqzCd7
	 jqdVJUGMoF3NLvpkhNUGijF6Ez+lHLlIq1E1oJ2EzQ3clZ2zcxh3qBhkMyy1y8iTHW
	 +u5vUmq3U7SAw==
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
Subject: [PATCH v2 2/6] rust: page: define PageOwner trait
Date: Wed,  6 Aug 2025 22:50:11 +0200
Message-ID: <20250806205044.85085-3-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806205044.85085-1-dakr@kernel.org>
References: <20250806205044.85085-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the PageOwner trait, which can be implemented by any entity
that potentially owns one or multiple pages and allow users to borrow
them.

For instance, this is useful to access and borrow the backing pages of
allocation primitives, such as Box and Vec, backing a scatterlist.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/page.rs | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/rust/kernel/page.rs b/rust/kernel/page.rs
index 631718a6ad7d..93ce4956f782 100644
--- a/rust/kernel/page.rs
+++ b/rust/kernel/page.rs
@@ -103,6 +103,18 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+/// Represents a potential owner of one or multiple [`Page`]s.
+///
+/// This trait may be implemented by types that potentially hold ownership of memory pages. It
+/// allows users to iterate over those pages and borrow them as [`BorrowedPage`].
+pub trait PageOwner {
+    /// Returns an [`Iterator`] of [`BorrowedPage`] items over all pages owned by `self`.
+    fn page_iter<'a>(&'a mut self) -> impl Iterator<Item = BorrowedPage<'a>>;
+
+    /// Returns the number of pages currently owned by `self`.
+    fn page_count(&self) -> usize;
+}
+
 /// A pointer to a page that owns the page allocation.
 ///
 /// # Invariants
-- 
2.50.1

