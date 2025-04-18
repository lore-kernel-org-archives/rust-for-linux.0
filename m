Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED072144B1
	for <rust-for-linux@vger.kernel.org>; Fri, 18 Apr 2025 01:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940561; cv=none; b=Kp8/YYJEyad1ePyYaGhl6yWbkDJ5R/uT65RyzGAPsrUO3fu3NWcvJ8HNVOKx9C1uar9VQgy0pQp4U+8mULyZyd8B90UOdEKD5P6N710eU9VomU07USoNx/U4/A/JBrVb0wQV4IMr4A1WWGMK0ia3sz1eLgg9QUmKz9BngV3clZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940561; c=relaxed/simple;
	bh=FyzfpjuzV37kb8DXdRAf2JVqbI26cGWJdP3ZB4YA9Uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haHYeGd49EFJeWTlgWRGyc7xhQjxHVBGNESxFvSbBZpTSvtyksgm1l+NH52ruxrTXdXohqrsxrxyQmVDwukPDX3W6UcXm2uAMWpkv4/5r3YNNGoOakTbwqiX6SZw5EfrYjR+Njvk7jpn627c8Hioy2T7vwzT4u/fxKKOONjW+aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=wlT+Yzs5; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="wlT+Yzs5"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6ef9b8b4f13so12461537b3.2
        for <rust-for-linux@vger.kernel.org>; Thu, 17 Apr 2025 18:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940558; x=1745545358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ypjYaS2bCdOwhFfUcatnP6T3YhESxrRRKhPIWxfjEY=;
        b=wlT+Yzs5oqxQ8z8ppn2k2kKpXKkVUTE/fiMNimu8ArT9FF1paMb6rQs6GYnIY92Efu
         w4PLktPsOWE3vAE9iTXy4mJj0IKi5HHmQWrcqqSKTPae4rW0XBII/+C2Syy+TnKqfsMV
         lv5pNERE3yRcyHnb5vxlSoLxNxzt08ZphhnW9noYNNELQcIohHlKgbw1xYzhvBIKY3L1
         Yje7OpJyyJ8bXmu27au8AGTErtxnn02H2f1KHkSBWpD3s+o7P/frp+edLGSeoaH1pVoy
         SWXAptR6C7BeykAHCymK5tLbKvlko0vqJlWzLYrN/yki8I9Z9O6VVSXlh8PIrrm6hJhv
         uRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940558; x=1745545358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ypjYaS2bCdOwhFfUcatnP6T3YhESxrRRKhPIWxfjEY=;
        b=NZ9a6V/BusEEisURirZ0CsTstldFBx8Fwcb3UkWCvD9Y2NmZBrp/001/TOstJZGrFj
         dhYsW76YWLT16dRzlTUVRjWtihxiqhtfGXfH3zURBvLBylmBf+jx2jXB9QHZZpm7akBy
         602Rsfuh/+/EYDpeck8vIJ2Z2kMSZpeYwoW3KRD3e4uTm636STVh0aaHM9y829H1KQEC
         GmJosdHlVAEXevK4PobKSixZiFyMWqMxNcqKdRz4xpn2diErkIO0jm6JKOgI470b2KbX
         SA13ucGsSfd4vtGOc4pIObYWPtqQln1m2PTKqmuaLarydDkS/+9cZ6bWtcUd1cEVgZoF
         eh9A==
X-Forwarded-Encrypted: i=1; AJvYcCXYFf7gR1kX7Z0du7OP6/JlmX73OlIqeqDx8rhCLg05Rh2SAZVY7HBpiAr+mgONHERuNx1K9FBtuWWX9xm2eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzqnbKaDdV8WqygrliiYi/JLooRuJla4vs3B5D/W3I+6wZXuzU8
	lXZ3HjRfoluM82u0kL8aMHmjLBISFnfNArfcZdO5mc3TxNg0U92dvjR707u92oA=
X-Gm-Gg: ASbGnctW7iEp/re04DabjDx/Bf/ocZVMU0xPnhoooQxJ2HmYmP6hUp3dVQplVxbnb+A
	2yLRzER4WjLM/vbYZqgl1fBCfuJ7/iAsOTXPlp2Q3G1woXj5dLhky9hO8Sd1NSriYpcSTnG/Ccx
	r2xsD/M7HOu9b5bOhwbh751ojovJeCKNh2EL2KNrXeCjEgRux2oaHXDOi4apRGUl5RuymL/r1pX
	pbiCvMo1oEsMFtHDxay5ywNCGkzCxJfAD5pLie5A6DzLfC4wYjKpX5H9+pFM38eEFJfFto56SQr
	7IyYeB/zXNqhJ7PL3MuxMscabLuH+jyiyXay+X0oa2dRgfSpA5b9srAbYnqYpZIn0gwHXOKzAUJ
	n7VFIhR9xLCU/+qbjhdRU3zoK2U6fBPJYKGfs
X-Google-Smtp-Source: AGHT+IEHJ+6Pf1f8ODH1sVykiKxg8GkjoeffCbwbuKrlLP91ZhaDAEvmG3W3nEPzfRzvLTxyNUCQWA==
X-Received: by 2002:a05:690c:6a0f:b0:702:627e:a787 with SMTP id 00721157ae682-706cce2592amr16062067b3.29.1744940558537;
        Thu, 17 Apr 2025 18:42:38 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:38 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 14/18] rust: pci: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:35 -0400
Message-ID: <20250418014143.888022-15-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of_mut!(place)`
with `&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/pci.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index c97d6d470b28..4ad82f10a8b3 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -17,11 +17,7 @@
     types::{ARef, ForeignOwnable, Opaque},
     ThisModule,
 };
-use core::{
-    marker::PhantomData,
-    ops::Deref,
-    ptr::{addr_of_mut, NonNull},
-};
+use core::{marker::PhantomData, ops::Deref, ptr::NonNull};
 use kernel::prelude::*;
 
 /// An adapter for the registration of PCI drivers.
@@ -459,7 +455,7 @@ impl AsRef<device::Device> for Device {
     fn as_ref(&self) -> &device::Device {
         // SAFETY: By the type invariant of `Self`, `self.as_raw()` is a pointer to a valid
         // `struct pci_dev`.
-        let dev = unsafe { addr_of_mut!((*self.as_raw()).dev) };
+        let dev = unsafe { &raw mut (*self.as_raw()).dev };
 
         // SAFETY: `dev` points to a valid `struct device`.
         unsafe { device::Device::as_ref(dev) }
-- 
2.48.1

