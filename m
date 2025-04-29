Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1711C21D3D1
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 14:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937890; cv=none; b=VNK1W81+DXWcgNdIjGMRVvFeX5YctmRO9P3xR+iVIiEYVQgxXzgktO3Vku/WtLza8F38IfinNjGaQM6JAl5FQXsQ28pbEQfuhvozsiB3M/FATpC36kLdF8WZ010iaIg5pK7tsc3x8FFl+UbB+APELpPsLolkov7bszuOsNtq1Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937890; c=relaxed/simple;
	bh=1X6QV7LMXeaPLgyMDH16gC5yJhAadudg+klWVEnNVAM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WOHAV10+RjemwfD8nT1WyE/i4jyRB1vzsmAYKGPEswzC/D/g5YbZheisDifqeOZk57eFUjXf1BpdmDtZNr9omsA2fs6vZq/YVtFM2PqV1wWXODX3RYyucDD1dz5A1geomL8Ybhp6EIK5xY6CBLNDfeK/EtffatnBfBBMJLOFRM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zzsSK0Ff; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zzsSK0Ff"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so26750545e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745937887; x=1746542687; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw8SMoJoJ0vdE9jmgPG+tjZtPjb6PDbEV0V4jzbTcEc=;
        b=zzsSK0FfLnMBW80HSTpgEo9msUUFPTjDtuI0tLHCJTZ5EjLo62Mi9kWMP1HsGut6j5
         6bx0bafpQP4S+DxHjia7vVGS/fLnrhvYK0FCU9uW33vhAcnFu2NLNRB1DjjgNYAgezpe
         w/CRywMKyybcZX0RxCYdUDqdiYfsLFW6chowMLWJMnlkuHTaucgRbHJEJ4sUAEXC8Rtt
         RjM/2QDQVtTjivkKAVngfzRv3fbEzwT9sIAuSufQCf1VRvDZDNFPCx+lYJB6RUAwgIBn
         aWqcPKnLVno5ukB0Sso7c3kueyj2XinTafbGYaZJn4ZXnpJubQ+KdIoNbCZxfHyvl2as
         6/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937887; x=1746542687;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw8SMoJoJ0vdE9jmgPG+tjZtPjb6PDbEV0V4jzbTcEc=;
        b=fpUs2X94/4HGaMlyMLkdeHqhPhwhUZB0L7wzBCz1+3rqWmNW7+7ELtRT2fpuqrqsej
         7eiTry1oJSpzYvUGX3sMkCIuhk794Zz4TKx71AzG+AVpumu0nPA9/FeLr57Y6wfYwTOH
         zgPm1lZOGjuUZTPI1ZsuIl3WOsWhwN7J7a9gHbvfFjOcIVRCpyRRyUwYSWa4yeIgEHnn
         QPqSPJK1YPrTmJjDbPA2kTH960OhbhksyiohvIhvhRB3CgX+1J4erP5Vh46WQaSvbse+
         2ZBKKh8B3FTTuavBULif2LG0S5A6uewHz4pah1PW1GYuJiwe5h1NWuRYdskodqojGzA5
         MaKA==
X-Forwarded-Encrypted: i=1; AJvYcCXMeMiH1Ih5BhhVJvQ2ZdDTXSFdb37/3rm5ZGQSNtpDgla2zHTepqBAcDD5BdCV2PkAEX92kXDKHHRQJreu4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq42y1qAcJLGdx44QwbiUaqQ6mLBvv3gmLj/sslk4Zp9K/oBKF
	w8oOsX6P2k7FXoYmNYsI/+3owjunSdhAYkvF0pJz2ZmYTNsuIKkMyCP9m1cTDQFJmZbUQD5M9k/
	NATyNk9nP/61Gmg==
X-Google-Smtp-Source: AGHT+IEfHbIDKQuLE5wpGBwNgeZINiUEJCFamqt7ahLjL7XOWrQKYyH+IX4HnUMIxYOYQr0FwaVvzbF57EkyitU=
X-Received: from wmbfk10.prod.google.com ([2002:a05:600c:cca:b0:43e:9aac:5a49])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3d10:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-441ad3b5e87mr30499135e9.13.1745937887639;
 Tue, 29 Apr 2025 07:44:47 -0700 (PDT)
Date: Tue, 29 Apr 2025 14:44:24 +0000
In-Reply-To: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3070; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=1X6QV7LMXeaPLgyMDH16gC5yJhAadudg+klWVEnNVAM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEOXSsgahz5UZI6rrsTFFn4ZKTCFt36ztjVPe0
 0im3Q4BYoyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBDl0gAKCRAEWL7uWMY5
 Rn4pEACy6IOo7ljDLEYh2+6Q+g56vuW3HAgDo+OWg5l0Fp1RRnkD+YObjDDGK2UWNitixoJXYmm
 ddsjl4Et9UTH9YiZg5VAuVaiM5Nlev4X/KkB/Ie4Qk8+XVvWPeeR9OMyrkOzOxrkmhC6tWhq5Hj
 ubXqxqc34eFhtBHjeu9tWtN3toKW7c1CDmTE+uoCp1eosUIh5Vq5Uf5zJyV9iEV5qYMctxZFGG7
 5Tc8t2ugdVFqqTwvdEODNyuN0sbqK4L8IuSKkUDlRlHvaXFyWKJ4MxxwJxZMYMu3ISXOdMq6k5y
 EOXsb76N2wjCrSb6nzi7Xe4EzFW5mj/vTJtHBV3pUCYo2KiapcgEmBDrwKirPgsNX8c2Gu0VTnA
 JkVOXh2f+SUMY4vNZnifJRAzi/PAT7Brskf3SQCs1+CBg3qM2qdgeEIAOadZSZMOC7GjZMDb7Gp
 SBov5+I7fE5N/tyunRFFqy0IcjAt/5JLPhW5FdzWwcn3PLKLO0vjP63fLBLJNUfGZYr/Pal82Gp
 V71Aa3J8tLC85+a+iX+yBG3rM/KiO1ciERzCg3yA1siZk29GzhFHMP/rbczs+zyUyCEZ+B8lqbF
 1sR3BHg9HEuySlOSWLZb/Mso+EffqUxIVdKZgm/QZIMa/NKlkEA0VHPEFGOt+FDDZskmgnFsqxc 0VD2DQi+gg9WTug==
X-Mailer: b4 0.14.2
Message-ID: <20250429-vec-methods-v4-4-dad4436ff82d@google.com>
Subject: [PATCH v4 4/7] rust: alloc: add Vec::drain_all
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

This is like the stdlib method drain, except that it's hard-coded to use
the entire vector's range. Rust Binder uses it in the range allocator to
take ownership of everything in a vector in a case where reusing the
vector is desirable.

Implementing `DrainAll` in terms of `slice::IterMut` lets us reuse some
nice optimizations in core for the case where T is a ZST.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 60 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index 78a602e0f00494a52df0e0aa5eedc68967a3011e..72bc743ec88bf7b91a0a1ffd9f830cfe4f983ffd 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -583,6 +583,31 @@ pub fn truncate(&mut self, len: usize) {
             unsafe { ptr::drop_in_place(ptr) };
         }
     }
+
+    /// Takes ownership of all items in this vector without consuming the allocation.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![0, 1, 2, 3]?;
+    ///
+    /// for (i, j) in v.drain_all().enumerate() {
+    ///     assert_eq!(i, j);
+    /// }
+    ///
+    /// assert!(v.capacity() >= 4);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn drain_all(&mut self) -> DrainAll<'_, T> {
+        let len = self.len();
+        // SAFETY: The length is not greater than the length.
+        let elems = unsafe { self.dec_len(len) };
+        // INVARIANT: The first `len` elements of the spare capacity are valid values, and as we
+        // just set the length to zero, we may transfer ownership to the `DrainAll` object.
+        DrainAll {
+            elements: elems.iter_mut(),
+        }
+    }
 }
 
 impl<T: Clone, A: Allocator> Vec<T, A> {
@@ -1070,3 +1095,38 @@ fn into_iter(self) -> Self::IntoIter {
         }
     }
 }
+
+/// An iterator that owns all items in a vector, but does not own its allocation.
+///
+/// # Invariants
+///
+/// Every `&mut T` returned by the iterator references a `T` that the iterator may take ownership
+/// of.
+pub struct DrainAll<'vec, T> {
+    elements: slice::IterMut<'vec, T>,
+}
+
+impl<'vec, T> Iterator for DrainAll<'vec, T> {
+    type Item = T;
+
+    fn next(&mut self) -> Option<T> {
+        let elem: *mut T = self.elements.next()?;
+        // SAFETY: By the type invariants, we may take ownership of this value.
+        Some(unsafe { elem.read() })
+    }
+
+    fn size_hint(&self) -> (usize, Option<usize>) {
+        self.elements.size_hint()
+    }
+}
+
+impl<'vec, T> Drop for DrainAll<'vec, T> {
+    fn drop(&mut self) {
+        if core::mem::needs_drop::<T>() {
+            let iter = core::mem::take(&mut self.elements);
+            let ptr: *mut [T] = iter.into_slice();
+            // SAFETY: By the type invariants, we own these values so we may destroy them.
+            unsafe { ptr::drop_in_place(ptr) };
+        }
+    }
+}

-- 
2.49.0.901.g37484f566f-goog

