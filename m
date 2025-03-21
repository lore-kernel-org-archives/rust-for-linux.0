Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAEE226D1B
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 12:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742559029; cv=none; b=Ijv8Zfp6ypaURlG3Bb6vl35c1DmYync0WWz+YOihq+RXDzuAAGJvec8XtQo2kQ7gP+Au8B7/K9Wwg8NWSiCzq+lcYUBW0hnFyZjmqppJcjEx9rnN8oaAdkeUyGt6fxtPDFCSQja4o6VHGt7iz7zZGvGAORXRslDrGYpNNeO/Zi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742559029; c=relaxed/simple;
	bh=HshBdY9tyPHXYCABit0wg9iizu5qxvE0QHr6aVv8M2U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LTi0Unr7RJqsU3t9/Q06EtsvV6nJK5knWTB4zaJ2ETY8cZZVPX9fJgb8VcMYbv4qYwK69+ax5U7LBUWkigx70AjvsqVC2ufLKuuqpG3wYsi43g4HnWK8yGRLOIqvBXcgR09IP5n+Rmyqd8EQGRh7z81R2Q84YiF3jjHenZqWGbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=W4Qk1exX; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W4Qk1exX"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so14087305e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Mar 2025 05:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742559024; x=1743163824; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RzX66093NdWDWJT+/2WCtfxfnRGCxGreLydWXedi3Vc=;
        b=W4Qk1exX76iZqx3l/U0VrFChNJC0cNwGPM7VV9Lo4G1hMEiIaBvQa9FMWJigTAQvCc
         hhluYM/nZ0+Ha+volTLs1akaIq5OlxX+t19Bwj7ktdRKv3DbFsYZNRPh5s+Cd5c1UVku
         wa93+9ifT/w9+8bgeieG5Xwcxkq9QjnpSzX+JPt9WOB/9/iQwVHYUReXKiOA67qThaKr
         Nfn/rN2RvfI5ad9fZgQvsSE3a20Z/NuwtJXVOQQGnB62oEpt+wqWjCYWlrckf9mEOFkQ
         qTTI12K7rSiEIOu+Ehhe56Dw7RsxQn5nmGW489y7xXawR7+WOCvvERQY/hpAZY9Z9n/I
         nbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742559024; x=1743163824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RzX66093NdWDWJT+/2WCtfxfnRGCxGreLydWXedi3Vc=;
        b=wvgM+LsBopZxEBwPOzaoxN0O+EHsEh5qvSuEJspW2VqoB2RuX7HfR+B7/d1Af8CbcC
         xwKrhfXTCFiZrK7Cb04kXrDnyi/f5ge40p5ZFyhS9GGgXyxRTPXXOk5nUF4q79nGIee2
         n5CjLNBsSYOwIm6LRSQIxTe6NFv9YQVwJ+DCS7vbn/U/WJW5Yu+5dQcj78FQKVX+R12K
         hkxjPodGGJAeew+l0NPTpFtYOyftjLiAskaw46vdjT1iUAOmvKyCFM/L0cloQ40PNmhl
         j/tyuuWEwUzPVMMTzA19K6MOEBCQbeI5TwGytBHKcahyc0VfszufHsWr8Gltq5PrKij4
         M/2w==
X-Forwarded-Encrypted: i=1; AJvYcCVmXyhpZ2k2IRwdUrvJkY/DcVLo+IuLWJLhBO7c6ZLt37Gr3O/OYl2XN2vyY+GEipBnPclsSWjEi7oWdGYwvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2yxWzN5RQiudZZ0mGdmQyZD8dtoa2ODZQ0THsQoe5bXUPZ6X
	jdoIloHnNfh68HmkPVt4PhzqhbwbMq1qzH1FMp8HHu1X6piFrrodvjWpF2xi7SaYNNWffrWmg09
	WacHseiKEqB+2mg==
X-Google-Smtp-Source: AGHT+IErPZK/k8We6HLKh56+Dy5TRrufv83EZvupyE3hnbr/ycIpO069ol3CrSRNZZquyh8P4yiRGfehrBSyACo=
X-Received: from wmgg14.prod.google.com ([2002:a05:600d:e:b0:43c:f7c3:c16e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c7:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43d509e4a78mr30493065e9.2.1742559024697;
 Fri, 21 Mar 2025 05:10:24 -0700 (PDT)
Date: Fri, 21 Mar 2025 12:09:56 +0000
In-Reply-To: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250321-vec-methods-v2-0-6d9c8a4634cb@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1339; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=HshBdY9tyPHXYCABit0wg9iizu5qxvE0QHr6aVv8M2U=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBn3VcmiJ7Tf2GburnJFnABJO3jD7esdEjzlSvBZ
 Hhni4owZEmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZ91XJgAKCRAEWL7uWMY5
 Ri9BD/42sQd6lHZxui9NajNxPApmfoRB/8zYhbcwQVPtfAsWTcoMGWW3iGfsywI7LDYSqEo04Xo
 qbDeXKQXhOvjfw9Z3c1Wr0ipLN1HI5ExTqApQo2NDFoM0sZqClerI7HVJ2F3H80edJDWfAaF58g
 az+XUfMlnM/SxX+c+sOi9ykJW/r3FIS7XkWu0Lqkmp/3FdKsLxa343rzKLLg4Iu3m0EePcFq+2F
 ZpV5S7sD9tz23uLT8sHnL2WaIjOAR4ONdi02ltvljwpJ8WNC+HEcgpjNuuQJGUj0DIxeJQnKnAh
 KD7GtyL0iUwK7RCJwh6+OvLoj3ae7pG6IO2tVdFyIc5ZuR65Ux0pNpK8cO+eKTjiwQfRvYiVRM+
 W3eISMpU3yzEkjzLfpj9g/T1hZHPRt/zAIQsNFIVNpC2OoQ19+lKMzI1YD+nfzBjSlTlcGt2nP5
 Gz/SRnnWr3hX1XVV+qJxTJ6PrAWBpmsvQFQyycjIBt15Ij4z0cJTN9NuTz0SD5wkm4R+T74kbl8
 w+i29+oEP5Q0SdaMXs0gZlFywFO6qB096bzWEkKnxBUT/dsiIoFs7KkZk9QEphskVQSPEv9i/2V
 /0wxJTpftfprvjS2e7Y5opkMj4hD8Zfs/aqPFl71lxlsFF6p98Gi/fj5OU0KCdgrhNhbAHwyq+5 6xWWR0dMZuvrOLQ==
X-Mailer: b4 0.14.2
Message-ID: <20250321-vec-methods-v2-1-6d9c8a4634cb@google.com>
Subject: [PATCH v2 1/7] rust: alloc: add Vec::clear
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <benno.lossin@proton.me>, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="utf-8"

Our custom Vec type is missing the stdlib method `clear`, thus add it.
It will be used in the miscdevice sample.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Tamir Duberstein <tamird@gmail.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/alloc/kvec.rs | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index eb6d40a1bf8ba45126bd47f1dd4a7b7ef86112c4..95e752ed27395fce72d372976b74fb1b0e957194 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -395,6 +395,26 @@ pub fn into_raw_parts(self) -> (*mut T, usize, usize) {
         (ptr, len, capacity)
     }
 
+    /// Clears the vector, removing all values.
+    ///
+    /// Note that this method has no effect on the allocated capacity
+    /// of the vector.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let mut v = kernel::kvec![1, 2, 3]?;
+    ///
+    /// v.clear();
+    ///
+    /// assert!(v.is_empty());
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn clear(&mut self) {
+        self.truncate(0);
+    }
+
     /// Ensures that the capacity exceeds the length by at least `additional` elements.
     ///
     /// # Examples

-- 
2.49.0.395.g12beb8f557-goog

