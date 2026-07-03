Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72945339714
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Jul 2026 11:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077680; cv=none; b=jDsh4a1gJvkzL7+qbUcuAMfnpelV3RnDwzqU1cfk/OzsUzVkxiPFtcSsxB68oZUnYVptOb9dGLNxKS0rcHehiOxFjYCqiIp436tqgYykgfH7uh5WfkLLXlxuK5MsjzM1i9ga2lPghb7HhEp0pDh4Zh76GkWNSK+txnJZDUwA7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077680; c=relaxed/simple;
	bh=N1KVEx8UfM0o8CvInTg7HyxDx12vFORSwsV1aEqiIOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iYl9YYHmSI+EQ/kwmN5Cp52V0YgDRErCvUFtAP+9X1gZRGbQZSX9VV2cT2nwesx5XEIRVS65k1NTUb5+b+Rb5XDwgkl0DtFTH5N4SwAXZtnX02cxmMvdzi9MgeIwXQCorqI1XYy2DIF38Omm9icoQzmEG5aIxxzSP9P+5+z0Amc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OCKLbD+b; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCKLbD+b"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4758b2a9e2aso279734f8f.2
        for <rust-for-linux@vger.kernel.org>; Fri, 03 Jul 2026 04:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783077672; x=1783682472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69xH7euFjbpi788DxXytXmXsft3AScOOxoTRHn4A424=;
        b=OCKLbD+biy98n929G4e31WOtI7uyotNMCgHs58KLHC9NADysxZ5+NGNAWKrFURThg1
         O6/MLDmK+LZqvJB0fxNtAlCIxKftqbKMpcY941+iYVZdddnV0L6RPfaMIWTl2V7XQndq
         yxxv6aOLKmzUeMbdih8EsK8V9FWsJvXDvpf599T6wJTH617A103yTgugqdEQ+92hBh2q
         2MvswdZafNOp7ehD6BbYeGwZJ4lQbBsdzXGUBu3XqM7kyFHnQKr3lNQx+wtK5eQct+LL
         EAASyeWVx/i2LgvDQuq8hiN70WGlYkBnkNNQTSxe+6pzf9qX3BIFbZGYpfOwmvpXPQbR
         O6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783077672; x=1783682472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69xH7euFjbpi788DxXytXmXsft3AScOOxoTRHn4A424=;
        b=Aeuez3D7gbYc9dN5incd5ZNkI2VhXHmbudnismLtLI8/OygmhM8CyQBVDHFXaTEELm
         ugZ3v98RCwRUvEsVrawWYHCCgcVFa8DyXbPUWGB5FFICWesxDbPRnyjlzK5pREaUve6F
         4xmImc4ThR7NTElPdTRRBAu3wMf/+4TxEkWJxkwb9dnMLGF1PVFpdGZTwTV1BguMc1gJ
         p2j9hcRA3sbEu93jGem6yOQ5eeD+9SCcQIW9hU1hxyUl/mWILTh9+geBts9xmMNFQ0Xw
         L/G2RWYZCAfdD2Ftr+bnJ0dNtL97nDLplpNF81vWeGDIXbGN+sjmLCewvqgUQZPW+Qyg
         uGag==
X-Forwarded-Encrypted: i=1; AHgh+RrT9WFh1rduavOLx08BpLQigDByYthIwOL9rZqib9PVHvZtMRnjr+ansyQCpfh5bUtGC7tGD+HbL9UcltmMhg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6tWU1/FZDeFi44iIfxkSrT6B4IoMa6OwX+I/zEoekg3HydAJ8
	4q8zODMPzeLDyJzN/Xk45rZcuFhCflYWbmEKwdBrRKtEUq+r3IJFTcvN
X-Gm-Gg: AfdE7clAQlDs7amYFDB5mQ5rOfjGaMuBEelm7IN/cemJYb5Hsrz/2Tni02Katuv7H3v
	bIhJEI0pHHP1/DD3C3nIsQqw4xnt0C9jEOw74K6+jnjDoXW++qY4Lnec78VVj8NKrRS7VdKdZ1d
	nG5mDVGbudunndk3bCRzhmXGuqD7v1XZq0FBrv5hZ+DQRhZyU0rnselbk3YBL17SYC4NCQ0m70/
	s+RVU0MuOI1aEEznLDyCUiRSm171EuejkfuIm/txt1lRDUz3tF/X+KCL5gsKQ9eKm684wd5P7+8
	8LIlI3lpEfEYkuyzSlOjtAJVfxsgSOqEiWLADvR2g4n3WE6lw+7tD2GeNPC4aP9suOOfrL7JhZC
	rRgKb1iJh5bLOcszEIRM3Lc5tH2LVk5PBJgcDPUDSy72osFAAu1qbGMqXGalJmgLr82mhYXegqV
	9o7P8b2kXxRN9IXJ6tp0o1K2Bm2l6oNpY9J9VjzWGPZELqnpel6UAAHen/nffsDTXdGeKb4l5/i
	cl7fVouFqes3Yxklz3p
X-Received: by 2002:a05:6000:607:b0:46d:19b6:8653 with SMTP id ffacd0b85a97d-4775a6ce840mr14485050f8f.40.1783077671908;
        Fri, 03 Jul 2026 04:21:11 -0700 (PDT)
Received: from valmpani.fritz.box (cgn-195-14-221-12.nc.de. [195.14.221.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94cb64sm18237091f8f.23.2026.07.03.04.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:21:11 -0700 (PDT)
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
To: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: sync: arc: use intra-doc links for `Arc` in doc comments
Date: Fri,  3 Jul 2026 13:20:40 +0200
Message-ID: <20260703112108.3139558-1-vasilisalmpanis@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two doc comments on `Arc`'s raw-pointer methods referred to the type as
plain text rather than as an intra-doc link like the rest of the file:

  - `as_ptr` said "this arc", lowercase and unlinked;
  - `into_raw` said "this Arc object", capitalized but still not linked.

Rewrite both to use the `[`Arc`]` intra-doc link, matching the style used
everywhere else in the file and making the references clickable in the
generated documentation. No functional change.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1240
Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
---
 rust/kernel/sync/arc.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/sync/arc.rs b/rust/kernel/sync/arc.rs
index 5ac4961b7cd2..b03956ded5e5 100644
--- a/rust/kernel/sync/arc.rs
+++ b/rust/kernel/sync/arc.rs
@@ -253,7 +253,7 @@ unsafe fn from_inner(inner: NonNull<ArcInner<T>>) -> Self {
 
     /// Convert the [`Arc`] into a raw pointer.
     ///
-    /// The raw pointer has ownership of the refcount that this Arc object owned.
+    /// The raw pointer has ownership of the refcount that this [`Arc`] object owned.
     pub fn into_raw(self) -> *const T {
         let ptr = self.ptr.as_ptr();
         core::mem::forget(self);
@@ -261,7 +261,7 @@ pub fn into_raw(self) -> *const T {
         unsafe { core::ptr::addr_of!((*ptr).data) }
     }
 
-    /// Return a raw pointer to the data in this arc.
+    /// Return a raw pointer to the data in this [`Arc`].
     pub fn as_ptr(this: &Self) -> *const T {
         let ptr = this.ptr.as_ptr();
 
-- 
2.47.3

