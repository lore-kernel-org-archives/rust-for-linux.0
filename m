Received: from mail.cock.li (unknown [37.120.193.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFD923741;
	Fri, 23 Jan 2026 13:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.120.193.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769174670; cv=none; b=jaSVdtfC7AecbNIGwvRYLY/O28AZ6dBHL78z7gWcqEkiVWINTwKhZIaAPZ8RWml+d9GdneG6ueF9gb8VDzQId13RPTo56v5Dp+Hh6EkA9YqJmxyn0Bnf7ay2QR0wwIqvyodDHMYjXKiLZQ9MO79VjLpKvKiS2iOHG8sK7NT1NKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769174670; c=relaxed/simple;
	bh=qNWanRdkWyeGd6Z3j5HzGe4yV/wK7+tQyL54yQG2cek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lt/PX2gHlYVvd80yX0etb9nX15hIaxEjQ/WS+v/eYIUthTZkLhXzWXpjtNvZmYM8BJ7iP1qhTv+brk7IAJPWSjG4qNW85W67WIoW3GXvDVCGrBkVFX58St6+m4voyn68vN8MOyxnjBcq8XDgclNgdoPcTlfE9QmodjWkXol7lKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li; spf=pass smtp.mailfrom=cock.li; dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b=lFklW2fM; arc=none smtp.client-ip=37.120.193.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cock.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cock.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cock.li header.i=@cock.li header.b="lFklW2fM"
From: Shivam Kalra <shivamklr@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1769174656; bh=qNWanRdkWyeGd6Z3j5HzGe4yV/wK7+tQyL54yQG2cek=;
	h=From:To:Cc:Subject:Date:From;
	b=lFklW2fMT8wtox4lz1cwihdl+GDf5J5tDHTFh2P9mwnsZtS1jrcjl16K9nUvRY9Qy
	 dAkmmyRFVTZTe6hziI6DT/he7YuOf8cRwprl7Deffmj0cLpU4uD/cZJ931OLmp5N6k
	 97iu4QmHtb+wFTBKkwYhtRk0UBvR5VetiTV8lUpOayYkaLpE1qyPCh5MtVcfuqose0
	 oDjv5JqVyRUPYhsEaDGpgcaRpvWvSY1zbk9+CGlqefwtPsX4wv6l2OV9LL+3JVEfgb
	 PRR7K7qfWD14XuRPleDK7yLWncWDbQOfOjQU/eGsACZ2LgM0ktvAXSv8PYklIUn08l
	 vJsDDn5tdp+NA==
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Shivam Kalra <shivamklr@cock.li>,
	Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: num: clean up Bounded::__new documentation and comments
Date: Fri, 23 Jan 2026 18:51:13 +0530
Message-ID: <20260123132132.53854-1-shivamklr@cock.li>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the redundant paragraph in the documentation of __new now that
the Safety section explicitly covers the requirement. Additionally,
add an INVARIANT comment inside the function body where the Bounded
instance is actually constructed to document that the type invariant
is upheld.

Link: https://lore.kernel.org/rust-for-linux/CANiq72mUCUh72BWP4eD1PTDpwdb1ML+Xgfom-Ys6thJooqQPwQ@mail.gmail.com/.
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Shivam Kalra <shivamklr@cock.li>
---
 rust/kernel/num/bounded.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index 5ef8361cf..fa81acbdc 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -282,9 +282,6 @@ impl<T, const N: u32> Bounded<T, N>
     /// All instances of [`Bounded`] must be created through this method as it enforces most of the
     /// type invariants.
     ///
-    /// The caller remains responsible for checking, either statically or dynamically, that `value`
-    /// can be represented as a `T` using at most `N` bits.
-    ///
     /// # Safety
     ///
     /// The caller must ensure that `value` can be represented within `N` bits.
@@ -297,6 +294,7 @@ impl<T, const N: u32> Bounded<T, N>
             assert!(N <= T::BITS);
         }
 
+        // INVARIANT: The caller ensures `value` fits within `N` bits.
         Self(value)
     }
 
-- 
2.43.0

