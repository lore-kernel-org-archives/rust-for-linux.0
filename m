Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC2393DE2
	for <rust-for-linux@vger.kernel.org>; Sun, 24 Aug 2025 12:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756037235; cv=none; b=t9HoeeEEIOSTNDjEzfc7amE8NdjhtnO5dP6vRw58tPNXvkX2bCa045HPR8IW3d57MjfXpXBXBrWTwHNc2j33sM3CZaUwwfI7RxkzsFayvetaNrUQFl4n1TNLOT5dkFc80/eeRXBA+TtwdH6x6eobAEYkuD6+PDrgCZQ8KzX94Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756037235; c=relaxed/simple;
	bh=SnnzAnydrJppSoNmg6pqynvwYXekvn3ONwJXu1KClTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z7B6XPl1JRgejg9oFQpTLgbE6/Ijtjok48COTVtmug4Ysc3TmQW58tpjhG4zvKtFxQ+pWfEG/xTjZgci93XTjQdGgON3kzIrYaMi9rJBRafvS4jqvXPzx6nEpOiV8x6YtrdibjJSZPs89LVJmdZSlGJz0q+ocxr3mEFix5yOtKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pUtiUM88; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pUtiUM88"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB408C4CEEB;
	Sun, 24 Aug 2025 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756037234;
	bh=SnnzAnydrJppSoNmg6pqynvwYXekvn3ONwJXu1KClTk=;
	h=From:To:Cc:Subject:Date:From;
	b=pUtiUM88K5W6mmm31lkujFyKujycxPO1LTF7vc6vxkYR6/s7LWOHIkRypL2710POV
	 +JD9+UJWAOPUyibvhnDaIzHoz+sKeC/6Mdf5fUAGr9nPfaJ7gcYHcJIu4Ak8VJ3249
	 UqfF/auwwgT53Jcb+eh0cO9TxzJtU2DIIWEE68KFI2aNJpWPG1gZ4oSVvsvnUECCkO
	 6EmBhSQ+L0sw+W67rHpG4VIyt1YQ12C1bQDbUfkU5WzSYaf/U6Gt1a+4ivPW8PNXfe
	 C/0igBdHdwH8yyrpU5KXr+FgZUs9kHIgK82uDj3i6gde95MLOoL7GRjcTDaRPKSBN7
	 jDv6cuo2xvRwg==
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
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: [PATCH] rust: alloc: add missing trait item MIN_ALIGN to Cmalloc
Date: Sun, 24 Aug 2025 14:06:31 +0200
Message-ID: <20250824120656.208978-1-dakr@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Cmalloc is missing the trait item MIN_ALIGN introduced by commit
1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each
allocator"), causing the following error on the `rusttest` make target.

	error[E0046]: not all trait items implemented, missing: `MIN_ALIGN`
	   --> rust/kernel/alloc/allocator_test.rs:37:1
	    |
	37  | unsafe impl Allocator for Cmalloc {
	    | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `MIN_ALIGN` in implementation
	    |
	   ::: rust/kernel/alloc.rs:146:5
	    |
	146 |     const MIN_ALIGN: usize;
	    |     ---------------------- `MIN_ALIGN` from trait

Implement MIN_ALIGN for Cmalloc to fix this.

Reported-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Closes: https://lore.kernel.org/all/CANiq72k0FSBTB2yOjiAy9PnAuyM=-PHxL3uQQ_Cv+zwswnr_bA@mail.gmail.com/
Fixes: 1b1a946dc2b5 ("rust: alloc: specify the minimum alignment of each allocator")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/allocator_test.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/rust/kernel/alloc/allocator_test.rs b/rust/kernel/alloc/allocator_test.rs
index a3074480bd8d..0d3c78ddcd69 100644
--- a/rust/kernel/alloc/allocator_test.rs
+++ b/rust/kernel/alloc/allocator_test.rs
@@ -35,6 +35,8 @@
 // - passing a pointer to a valid memory allocation created by this `Allocator` is always OK,
 // - `realloc` provides the guarantees as provided in the `# Guarantees` section.
 unsafe impl Allocator for Cmalloc {
+    const MIN_ALIGN: usize = bindings::ARCH_KMALLOC_MINALIGN;
+
     unsafe fn realloc(
         ptr: Option<NonNull<u8>>,
         layout: Layout,

base-commit: ac9eea3d08c25fb213deb113d246ff5dadb31fbc
-- 
2.50.1

