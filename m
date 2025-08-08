Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B601DA3D
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Aug 2025 18:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754676750; cv=none; b=jHCm0X68PAl7OPTYPuAI7zaodCLBEwnSg9FKdrUsB8NDjIYv9PCd8guiAtFIhZNu5wJv09N2f4vzOKUx71Gyu7GNkvYXACkMkZP5Eo0U6P0VXn1c+W34DMr6RvS7N18ds3HIJ6twgUOURaVwpeGHquDSdDgMzsObJkOEr5R80Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754676750; c=relaxed/simple;
	bh=iJoYPl3qNwWXMrX3Fe3H6Bnv++cB+fO9kMhqD86lXPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4BiY5rgtFCDEURUOpteNL3p1Tj5LO5lA2Ddk6QmFxAuDkM6GN9dKGPMIFlcvM+lu8kOu8NhOCTR9Kjayi0UyAAv3e94Rb8U7qKOyxoMaeeXjomvjPGdkb7GhqvrvCQZayrg88y2w/UUMrPSF57MzAhWYZNhiPm4lrQwmf2f2Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TqiYuvKb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TqiYuvKb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E784C4CEED;
	Fri,  8 Aug 2025 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754676750;
	bh=iJoYPl3qNwWXMrX3Fe3H6Bnv++cB+fO9kMhqD86lXPA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TqiYuvKbhCp0zwV03Un5fPfUeH75SFJcT/qi/VRVTrk1mwgKZIH9sx7cPlrHQFWiC
	 Yi9hdiAmoR2xWFqRMPtimDzR6FlMh+AJ3Qu4gKTsUqbmZ6Q6c7TqLJNnHcd72PYcB0
	 TLlUIvm8yR0+BbFifLAWD7QISI7e+gagQg9e+MTvBQuEgGrHiZlJdztaAy580GyRok
	 kdlTZOLo24wXmAw59if2P3WHFmd4B8CPQStualybYSnnxSB4ByGyM3ZUgTX8CEl1cx
	 UD+mfYtlu/0V4VeZbMc8HHqFWsEx9yalGfE0XV+Q1dEkzh+cVZEvpYguTYzCuxhxOl
	 /d8u/IZiKSwJg==
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
Subject: [PATCH v3 6/7] rust: alloc: layout: implement ArrayLayout::size()
Date: Fri,  8 Aug 2025 20:10:20 +0200
Message-ID: <20250808181155.223504-7-dakr@kernel.org>
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

Provide a convenience method for ArrayLayout to calculate the size of
the ArrayLayout in bytes.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/alloc/layout.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/alloc/layout.rs b/rust/kernel/alloc/layout.rs
index 93ed514f7cc7..5c3db8e9f930 100644
--- a/rust/kernel/alloc/layout.rs
+++ b/rust/kernel/alloc/layout.rs
@@ -98,6 +98,11 @@ pub const fn len(&self) -> usize {
     pub const fn is_empty(&self) -> bool {
         self.len == 0
     }
+
+    /// Returns the size of the [`ArrayLayout`] in bytes.
+    pub const fn size(&self) -> usize {
+        self.len() * size_of::<T>()
+    }
 }
 
 impl<T> From<ArrayLayout<T>> for Layout {
-- 
2.50.1

