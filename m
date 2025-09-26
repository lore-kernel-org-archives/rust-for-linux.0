Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A592857C2
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Sep 2025 13:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758891998; cv=none; b=k0lpCjtCBpsxhnWlS/lFfbqyUGXXdc0eJb2+b6IZG/GL0N6fQqVFZGzl2AWpf7xgSGJm90rL3ejtBj/XB4hhOqLylDfuf3LLvp5gAI6wJvltl8EwlXICJW2yubV/Q4yTwRhEyjH6FQixK1ZtQ4CpkblFIXJ80Yc0bFKl7VpThko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758891998; c=relaxed/simple;
	bh=FKkIiVgmauLuoE4CX7B/Gf3qfhdLuT98aa1FlsvPKNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P3w4NkSyWDHokiq4IS5BKtlytNjDi1FkJLu2RPyRA4sSEtvBe95QiW19sWiQCPS56L3xVkyE4Q5u9vqBJvEWLkCDSGyLUJMYbjbOb5bl39Oy2sXOE57JiXgmhuAGjGnx9rD9AwJF6qzKEUgbRrMIbcRufBI1gxg0fYwteaGJmV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qye7OXoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qye7OXoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E40C4CEF7;
	Fri, 26 Sep 2025 13:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758891998;
	bh=FKkIiVgmauLuoE4CX7B/Gf3qfhdLuT98aa1FlsvPKNY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qye7OXoc8nQAt5arXQCUc8aIsOoCDhga+O7gMNme9J0DVX2unt9QnkQ/Nr8cFrLSF
	 yp/uWYn977vQvTj5Q6Yl7ehiduaqR0JqvrMnrqoziKn9+wvn5vnDn7q/LeWLn24PrG
	 HwpAIirADiCEFsPVvegGkzKC9BI4AcHripjywC59vQZ2BJU8Ug2M4Qt+WCeQeTEHP4
	 IghEV8SEa3/94sMOX0+ZtvAAyFSOfUxkUkZKzG4FSQ7NDnJzA9+v5opImTsZYEidcn
	 3sUiCOJ7xPQJQ69cC/4yygHIIlTekiMbiHyPuB5CLOQ1TUvCn2/9orD1yrSxZfN8Uh
	 Xlle3kkdgh8kQ==
From: Danilo Krummrich <dakr@kernel.org>
To: acourbot@nvidia.com,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] gpu: nova-core: gsp: do not unwrap() SGEntry
Date: Fri, 26 Sep 2025 15:05:53 +0200
Message-ID: <20250926130623.61316-2-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926130623.61316-1-dakr@kernel.org>
References: <20250926130623.61316-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Don't use unwrap() to extract an Option<SGEntry>, instead handle the
error condition gracefully.

Fixes: a841614e607c ("gpu: nova-core: firmware: process and prepare the GSP firmware")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index ca785860e1c8..6b0761460a57 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -202,9 +202,10 @@ pub(crate) fn new<'a, 'b>(
                 let mut level0_data = kvec![0u8; GSP_PAGE_SIZE]?;
 
                 // Fill level 1 page entry.
-                let level1_entry = level1.iter().next().unwrap().dma_address();
-                let dst = &mut level0_data[..size_of_val(&level1_entry)];
-                dst.copy_from_slice(&level1_entry.to_le_bytes());
+                let level1_entry = level1.iter().next().ok_or(EINVAL)?;
+                let level1_entry_addr = level1_entry.dma_address();
+                let dst = &mut level0_data[..size_of_val(&level1_entry_addr)];
+                dst.copy_from_slice(&level1_entry_addr.to_le_bytes());
 
                 // Turn the level0 page table into a [`DmaObject`].
                 DmaObject::from_data(dev, &level0_data)?
-- 
2.51.0

