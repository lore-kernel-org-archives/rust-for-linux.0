Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721311A76DA
	for <rust-for-linux@vger.kernel.org>; Wed,  6 Aug 2025 20:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754513472; cv=none; b=LC0gqlJ/VNr6BUmhur8ufppuBik30DMdjDSke/2/5aPVkbSFrjRWWLfAwBCF+QkZBq4ACigZSohI5Rv8C4SQbJMQqGdWZDrA5PLArNcStt/H5xkSUXItKIHsLuTEehO5J6OWzJHgIRu35tJnjVLXHqMwl4be+Z0TBm8ftL9Ry/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754513472; c=relaxed/simple;
	bh=0lwkPZPW30SvR10zaaZcIyeXDGh3WcmqgvZ4zDQIKeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bVb/jRiWciUpuQUskOam5O3Bj6VZhpS4SGDzvq8STFV2rlvv7rDbKuqREgCc1oxq6DAP/7dapPIqzhxLd+HSs6srWbhqHJOA2/WECcZD8rywTJnpjpwp7yqZhIuhPSU4cxNUU0QSC7cy/6wCnzRlyBRr66lPB4pMVkG5yd908iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOpb2un4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOpb2un4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662F9C4CEED;
	Wed,  6 Aug 2025 20:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754513472;
	bh=0lwkPZPW30SvR10zaaZcIyeXDGh3WcmqgvZ4zDQIKeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOpb2un4y+oNJTtooyoAexELj3quADh/+XzWO/m+4mPIKAgQSyzwk+hlw2zCr/lLn
	 QOWVvUqjtfIHpO5X+GMWAT13lBa01IfMYc7zacnZo7J9V5lt1YJM9lq4KNqTOQicSF
	 RcqVhglaW6sIBH3Sgu+NPOWAeJVS3dvf6+BZtH1UdHyQh9on4Yvw8TCKugMeebztip
	 CmNQpTSIAeFq/gTEWLYN7/rqWqhHenSeVrH9l9bMZ1DE6X+T0FCNOxB01qHdQ9fozw
	 w/OXsdYCP4rC/HTlNvJaEP1uEN1/GyHfy8n2UXqVm4/y1LeTk+NUH5t3JBY/J4RgH9
	 S58t8vkqmG/mg==
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
Subject: [PATCH v2 4/6] rust: alloc: layout: implement ArrayLayout::size()
Date: Wed,  6 Aug 2025 22:50:13 +0200
Message-ID: <20250806205044.85085-5-dakr@kernel.org>
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

Provide a convenience method for ArrayLayout to calculate the size of
the ArrayLayout in bytes.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/layout.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
index 93ed514f7cc7..666accb7859c 100644
--- a/rust/kernel/alloc/layout.rs
+++ b/rust/kernel/alloc/layout.rs
@@ -98,6 +98,11 @@ pub const fn len(&self) -> usize {
     pub const fn is_empty(&self) -> bool {
         self.len == 0
     }
+
+    /// Returns the size of the [`ArrayLayout`] in bytes.
+    pub const fn size(&self) -> usize {
+        self.len() * core::mem::size_of::<T>()
+    }
 }
 
 impl<T> From<ArrayLayout<T>> for Layout {
-- 
2.50.1

