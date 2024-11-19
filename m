Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14F71D14F3
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 19:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732044986; cv=none; b=PVU3ETV7U6uvaTgBfgvHmUWpE9h3eRYefQNUJmnDQkw6/U/VzX71bBX2j+hfht1jZ3HZfj6Ny+92EW/VrkmnGwQiRCSmrzkoJOcBllDlQgoRfDIiBBxo8tsPOt150q/9N9ZC2/IoNfEeQsWsniG09OLsZEXnF/qAJIj1aC5woJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732044986; c=relaxed/simple;
	bh=zNklq6FuM2RgcDyMZKvtfZemOxmW8IgYxK36hRboK6U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRnZ0Hm6FVxrYN2qnpjdFFISPg1A0yjaAtzAv7kpzdDBKQPtW1ZGFm2ifrLLQZVpYQ8hbkY0zbSgfIwlYnCDxif2Hw/VN3+julzzpEsxhCrARvel5M4DGcFyLVtKiuy2+xuWwIpWMfHd2UVRtzVqWK6YH4PA+s86b9eluM4O0PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=Lpol7hRz; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="Lpol7hRz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4319399a411so12248875e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Nov 2024 11:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1732044983; x=1732649783; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXQ6HP6w5Jvqc2fX+L1T32kVFbmSpm8cioGq3Vvw3KI=;
        b=Lpol7hRzgqdERXCIiX13oOxUG7PirVHQ0r/humBGbwBYr1RLXodNiqDdtDyFakTpFr
         qqiOTbMgYj8ODNRNoowEkUC9mknviH3vNQF+KbO19tnvY3Bz+CNg+5J4uTghLRutN0uJ
         tFk1rok/+ijJGUuZRDpT+FazWeGyJHT4j12HcGow/Fs0K3cWcgm0/ycKefBUncdZoGNr
         JsVlMYeGMxNNxKEoibCmKwa8oAS1kMoPmPHNfkQikibDykLQw8pFSk58FZB7EUcw/Wtv
         yjzr4SoDqnI20WPcv2nror0CC7CLllqM9o7h/Zve6u3HRVGpiDS/zA1NF/yc6CM4ZRSv
         I5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732044983; x=1732649783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXQ6HP6w5Jvqc2fX+L1T32kVFbmSpm8cioGq3Vvw3KI=;
        b=ghK7iVquWHPBQL/FsIjv+sCxUjb6gwpV8xWP1Ur4/DPCD4KLYejGTwIu10lT3W/niS
         El2C1oBoYkzwBZDMyKPU29C12ggUvZeJ2M+nqqzuljhs/yLNn6jNGBPdekYIvTkjAuGU
         maI1/E9HyJ/o+N61Kd98SCV8DHsbetqVOy4FNIX2+RyUBNApMjcSU+dnvkCAzP+5dPh8
         /MJLJduGo0QYMIQlXEHgurCE4Dy2oPueNncSpC4c7770Bx34+DaFsq5yyLtk/tqKHeYP
         mYPjq3BTlwYjYe5K1/kKafj6O+pfW/XG2sUwA1TM4Z8mcx0BQrT023+4Hrf8x6/fzzin
         XDtg==
X-Forwarded-Encrypted: i=1; AJvYcCUW6xrNe8nrPJeHh65/VPiFjLK+TRzdwd2MsHJnZxSTf9JX3xzG2NTozSA7pVWdNnaMHzhkAJxP2OXqp09Dpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMx/PQqUI+jhEaFEZimX+OZRPJm2T7+xTXjGORB6EY/Spahmf2
	ngkb5qHXRobjOYxN9LbOf3gFGoDsxQHe8iuLBSIg0Ha+i+Kfqruf+c37iVDRFBM=
X-Google-Smtp-Source: AGHT+IEpotRJQLjwxI2k6NA8pLnpTgmMWAlAQmgfQ6oqohK6DoZfDqrv0KG7vxYxf8mBshtRYqkojg==
X-Received: by 2002:a05:600c:4e47:b0:42e:93af:61c5 with SMTP id 5b1f17b1804b1-433489b4d8emr1556635e9.14.1732044983320;
        Tue, 19 Nov 2024 11:36:23 -0800 (PST)
Received: from mordor.lan ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab80869sm203127355e9.22.2024.11.19.11.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 11:36:22 -0800 (PST)
From: Daniel Sedlak <daniel@sedlak.dev>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Daniel Sedlak <daniel@sedlak.dev>
Subject: [PATCH v2 2/4] rust: kernel: rbtree: remove unwrap in asserts
Date: Tue, 19 Nov 2024 20:26:39 +0100
Message-ID: <20241119192715.38282-3-daniel@sedlak.dev>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241119192715.38282-1-daniel@sedlak.dev>
References: <20241119192715.38282-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove `uwnrap` in asserts and replace it with `Option::Some`
matching. By doing it this way, the examples is more
descriptive, so it disambiguates the return type of
the `get(...)` and `next(...)`, because the `unwrap(...)`
can also be called on `Result`.

Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
---
 rust/kernel/rbtree.rs | 48 +++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index cb4415a12258..1ada2d274c7c 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -36,17 +36,17 @@
 ///
 /// // Check the nodes we just inserted.
 /// {
-///     assert_eq!(tree.get(&10).unwrap(), &100);
-///     assert_eq!(tree.get(&20).unwrap(), &200);
-///     assert_eq!(tree.get(&30).unwrap(), &300);
+///     assert_eq!(tree.get(&10), Some(&100));
+///     assert_eq!(tree.get(&20), Some(&200));
+///     assert_eq!(tree.get(&30), Some(&300));
 /// }
 ///
 /// // Iterate over the nodes we just inserted.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -61,9 +61,9 @@
 /// // Check that the tree reflects the replacement.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &1000));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &1000)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -73,9 +73,9 @@
 /// // Check that the tree reflects the update.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &1000));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &3000));
+///     assert_eq!(iter.next(), Some((&10, &1000)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &3000)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -85,8 +85,8 @@
 /// // Check that the tree reflects the removal.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &3000));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &3000)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -128,20 +128,20 @@
 /// // Check the nodes we just inserted.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
-///     assert_eq!(iter.next().unwrap(), (&30, &300));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
+///     assert_eq!(iter.next(), Some((&30, &300)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
 /// // Remove a node, getting back ownership of it.
-/// let existing = tree.remove(&30).unwrap();
+/// let existing = tree.remove(&30);
 ///
 /// // Check that the tree reflects the removal.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -155,9 +155,9 @@
 /// // Check that the tree reflect the new insertion.
 /// {
 ///     let mut iter = tree.iter();
-///     assert_eq!(iter.next().unwrap(), (&10, &100));
-///     assert_eq!(iter.next().unwrap(), (&15, &150));
-///     assert_eq!(iter.next().unwrap(), (&20, &200));
+///     assert_eq!(iter.next(), Some((&10, &100)));
+///     assert_eq!(iter.next(), Some((&15, &150)));
+///     assert_eq!(iter.next(), Some((&20, &200)));
 ///     assert!(iter.next().is_none());
 /// }
 ///
@@ -677,7 +677,7 @@ fn drop(&mut self) {
 /// Nodes adjacent to the current node can also be removed.
 ///
 /// ```
-/// use kernel::{alloc::flags, rbtree::RBTree};
+/// use kernel::{alloc::flags, rbtree::{RBTree, RBTreeNode}};
 ///
 /// // Create a new tree.
 /// let mut tree = RBTree::new();
-- 
2.47.0

