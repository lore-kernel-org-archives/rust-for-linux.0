Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5074C212FA3
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 09:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745315570; cv=none; b=ZtlMzI35eBtFs4iO8vsKpJY8DaHeAZjBR2EsoexFv6hyjOmtGoLHwprKo+ObvpHgBbkbJTgT0x4wl+fdJxMWg3MI1Rg6UwqsIczZ1vwdp69r1F3xwYPKvKH167H71J1OOn7EacTyujOsUJ0InKe2+mMcIdZkwRyRRh37882Qh04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745315570; c=relaxed/simple;
	bh=mb+O7XPiHthdR+y4O3MYaMfVR53TvV7CjFTDaLnXoqM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GK0ezPNDbyXw0aR12on3mvCUlUgdV/N3zsR/e/6CFqvNoiw21wsgBPLj8Uokl0WB3XJDxrXKgZYlsLoKNhgbgateHD6nY72sJq0+UlYEN8y91NdYDreHgUR3hZdcKgfPTBVed1fK3fW/xPbqOxUhBg7T9oV9Qy+FE5dxpwuabDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vlVQ1LSG; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vlVQ1LSG"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a064c45effso146461f8f.3
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 02:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745315566; x=1745920366; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2DCVJ0DtabWjawqQbg/BlO9LZ4XfJJVnHx9onycFg7g=;
        b=vlVQ1LSGokWriF4eSos7Z4hFbKndhlUYkbQbOK/8miMUM0PLG25HkjHpYVbIhG6BGo
         n2lX3ZdoXM/z0uv5fnS1WH6OjgiRRgFHtE7Z2SCPI+0fr+qslEY3hFrkaqcQGWwh0Kw8
         ohHe+brRnBRbpiVNp4qm1f8gEvysSHpSFuUw0JD7803aH6DqfDDNw2slkh1R9vGtOHoq
         yYEHsudu89Ild0k7mVY3hBVdzBhq+OD/HLx7LdIPuzf4NMQwYq75GdiN2i68p/EiK15S
         fPXWHPVEwbrDi3iaEowMxqiyj2/1/zMY4q+W1tEG4FV2ahAIJZy9Ndb+YJM1/JAdLozz
         qOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745315566; x=1745920366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DCVJ0DtabWjawqQbg/BlO9LZ4XfJJVnHx9onycFg7g=;
        b=WbbSWB/ZHC8ccRYI9Qab5a+3GcDMsZQQJqcxb2+g9z+y9c8eCsFo5ECumRJKZlGFEF
         DlRhTAoWCFoV9wImXHH3Z12dEJ6OAnmYrlAwAWzu4cyEk9sUWWYHVCQn9Ps8DaFG5uui
         kMZSBe5HJIP68w0mh2wEL27svK011gj255Ugk300QBi2s7S6SJqWqZkuln9/sX4UspcR
         BXofjfWhkPf2qkWpQf4VYvGC3KVK12HkEgrZHuPD/hlCtYRTVIkCXYc+eUjqS7lnmIPr
         +scmGmtly5WYgQRV0VY7eA23runDVu23h9sjwnnpIefH822PmKnA08nLNWQIu8A9veh1
         /3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWPDIXZPxd6B1N3p5xY07AJuWHnKDFQXr3hE7JP70wdjeAHCEPOjQDB7nEnLCob7Ha7TCUmrhd/uCyuFxa+Lw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGSnr0Uiybjv4vTqDvZimW9uinSh0ExopZO65LbRKuM8Pqrrr
	pa/sr4BbOaxQ0awyKIxpwXGcy3GAaafuBkm+wHwxbwHwywXURigQHWTw8Nj86uJ3/Gd+2QwIunH
	6JrQi31iksrhRqA==
X-Google-Smtp-Source: AGHT+IEjIs1PP1IgSTDnsDg2V0e4IMM0C96a3E5gUuieuIiK+z1Yx08h5EmsDcyABmJfcB1dZ3l6N/RlKRYDPYY=
X-Received: from wmbfs18.prod.google.com ([2002:a05:600c:3f92:b0:43c:fd99:1b7e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:188b:b0:39a:e71d:ee34 with SMTP id ffacd0b85a97d-39efbad2b2emr9931349f8f.37.1745315566643;
 Tue, 22 Apr 2025 02:52:46 -0700 (PDT)
Date: Tue, 22 Apr 2025 09:52:20 +0000
In-Reply-To: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422-vec-methods-v3-0-deff5eea568a@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3177; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=mb+O7XPiHthdR+y4O3MYaMfVR53TvV7CjFTDaLnXoqM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoB2bgzL2YXfnjsb+0grk8LTEfvaNgSyI9SVyF0
 M3uPkRGogaJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaAdm4AAKCRAEWL7uWMY5
 RlCcEACPjIjx9RDJ7vcD8aDcHdH+cnxFQBPXi1fTrPvF1JcMsKLVcE6ZQsN9ceI0QdlUlZ8iPt9
 a2IYIFDvB+AEBCNRtfgiA1X11ecn8/425kj74k0jXjbhoiwY16VCdAuisZSAHoJxfmdkHzWzXKz
 Tu8gDGfNehpTvFCoY2rq+qJY4N0QyCt99bziUndoj3FYysy4DthA2t15OAWwFg2QO+2rOxno8gY
 EyfxfCsSiqyV0xC/qkUT0Ct24d0Y5rCTISRV74VQfPgEM3Jq92O7GATpFtSt1gtfwlCXMemkkTK
 V+dHgtcKP+HjXiSrkO0zJSVyxvXOK+ixsXWD4icGA4/ZEw9gCkzHrLH0LNUhx2RPnlLrkZdc2Jn
 LUURUMPXoXjqsnZonpAmL6r0SKHn+bmzjZzkq7tr5UidyjUg2T7lUBJE8lXvw+EAFubER/AU/Q7
 YZAcFIAG3ZSChkFdcKmSFlwikvVI75EPVG3j5RmZKoEi5FOOYAV5R3+UrjxHndksq+DBtx7jzTr
 xeOrr++aF4i534kqOYKuRPNANZKZ57i0m3WZ+Xbxz2I0EMWruKwp4D55mVKFKHWUcbhdSUL6XtL
 FnqT5aH4ek0FPBWys1IO4kfxF0b4nIvGrnPSBnpFAGA0/fBQTh+/6oovLjHj4eCh/LmooE3Ut6g kh2Np/Qp5iGp1VA==
X-Mailer: b4 0.14.2
Message-ID: <20250422-vec-methods-v3-5-deff5eea568a@google.com>
Subject: [PATCH v3 5/7] rust: alloc: add Vec::retain
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This adds a common Vec method called `retain` that removes all elements
that don't match a certain condition. Rust Binder uses it to find all
processes that match a given pid.

The stdlib retain method takes &T rather than &mut T and has a separate
retain_mut for the &mut T case. However, this is considered an API
mistake that can't be fixed now due to backwards compatibility. There's
no reason for us to repeat that mistake.

To verify the correctness of this implementation, you may run the
following program in userspace:

    fn retain<T>(vec: &mut Vec<T>, f: impl Fn(&T) -> bool) {
        let mut num_kept = 0;
        let mut next_to_check = 0;
        while let Some(to_check) = vec.get_mut(next_to_check) {
            if f(to_check) {
                vec.swap(num_kept, next_to_check);
                num_kept += 1;
            }
            next_to_check += 1;
        }
        vec.truncate(num_kept);
    }

    fn verify(c: &[bool]) {
        let mut vec1: Vec<usize> = (0..c.len()).collect();
        let mut vec2: Vec<usize> = (0..c.len()).collect();

        vec1.retain(|i| c[*i]);
        retain(&mut vec2, |i| c[*i]);

        assert_eq!(vec1, vec2);
    }

    // Used to loop through all 2^n bit vectors.
    fn add(value: &mut [bool]) -> bool {
        let mut carry = true;
        for v in value {
            let new_v = carry != *v;
            carry = carry && *v;
            *v = new_v;
        }
        carry
    }

    fn main() {
        for len in 0..10 {
            let mut retain = vec![false; len];
            while !add(&mut retain) {
                verify(&retain);
            }
        }
        println!("ok!");
    }

Unfortunately this can't be a kunit test because it uses the upstream
Rust implementation of Vec::retain as a comparison, which we can't call
from a kunit test.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 4a29ca6e7dedc3e93a58830938f3a51619c270ed..2f894eac02212d15d902fe6702d6155f3128997c 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -607,6 +607,28 @@ pub fn drain_all(&mut self) -> DrainAll<'_, T> {
             elements: elems.iter_mut(),
         }
     }
+
+    /// Removes all elements that don't match the provided closure.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3, 4]?;
+    /// v.retain(|i| i % 2 == 0);
+    /// assert_eq!(v, [2, 4]);
+    /// ```
+    pub fn retain(&mut self, mut f: impl FnMut(&mut T) -> bool) {
+        let mut num_kept = 0;
+        let mut next_to_check = 0;
+        while let Some(to_check) = self.get_mut(next_to_check) {
+            if f(to_check) {
+                self.swap(num_kept, next_to_check);
+                num_kept += 1;
+            }
+            next_to_check += 1;
+        }
+        self.truncate(num_kept);
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {

-- 
2.49.0.805.g082f7c87e0-goog

