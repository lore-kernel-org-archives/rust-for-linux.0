Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6049E398F85
	for <rust-for-linux@vger.kernel.org>; Thu,  4 Dec 2025 02:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816266; cv=none; b=U13USeI6zKyZOkJhIwEvjEy3hA0MQ0YMd0dp/ksxQFAiD8AJ48z6K8uDi08gpct7uLeqKb2NSPlRJin7ePh6VDRyaTJv9CcO+WSwfM8obr7dARyeg05dY00IHSLDYQ769nr+BzcwSxRiyRYBn7PPiWGHNi/BwbKC1LX3FXo613I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816266; c=relaxed/simple;
	bh=R9Itk2r0ZY9WI/5KEEWDRBPmHQ3/RCrN7LiJpYe7X9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=baK/M8V9dlEsVv/GabuC69qry+tnAfJ2c/pbMekFeE/etcYJ/2PVWAJmrdRKax/fEgtsF48j/D+lwWzx+fWgz8wZc493gFVen7iFC2C5jJZQ6TW1Y3LcQ7vsY92x3UAz4eaowEUEC3BWICc/l0xaKPeRnrpTHrm4C5WK0akFG1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRF7l6HH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRF7l6HH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2953e415b27so5174855ad.2
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 18:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764816265; x=1765421065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=axOHePUdMjXEL0yOaxPqWBLsDVcl/Dx1M9GLCFD3Il4=;
        b=SRF7l6HHXVCI+DlR04o21k5apcZcmJ2FAnrcaWpxWaRF63s0DXeKhnZPM4sj6DHzB1
         78dtmh5MU2Fa+043Xl7Hi0YXzYhheh3ef+IatQJc3juR/Rcq/nr2L05zOSz6VlXYsBr2
         C53aLTyp/K34vqWRpUxCl0gwxXsR7SCQX9Ds/UWMOMEuFU18khX15Ui9WzVNnCSwjQuJ
         0U8Z4a84/TVlArNkvzBSej/IsR5+Fi5V78yAj+V1GgJkrc1nVsvc7h9M3vmEdb5Cajag
         /UlWZrYut4i5vX6mREch4RyTJiUAWmBa+PCTtmNU1fIZXaObJvjr6wsVY6cCk9G9J4bc
         ftZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764816265; x=1765421065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axOHePUdMjXEL0yOaxPqWBLsDVcl/Dx1M9GLCFD3Il4=;
        b=D9ygtm5p41s5EuFfqgcGBsuq+O93cdYUCOFY+ardMiSJ9UE4Kf2c908sHr9xbPxIDj
         ggWrkP0gIhmy4GJcNRrNwe5vU9vJVRt/E6Qu5F8bfdoAc5eQcvRFllJfxGKxdNcBJAyz
         pg6Yj090YIzAiGHs4GRlRLFLXYKYEtfBdIGjDL1wwrJcEBrx894b8WzJ2T/jlLgy5inr
         +voRZTXEROCp7IuJquntVF1fVJ0RazWenchmuc7mx3GsvS97wD7/2YoKHs/C/d/dlY4C
         H6xj7JuDGtxTtEWgFwMXt392dXi6F/EPXvDACm25KXckOIhKE3qFj0KqqgN6Jal/Q0mG
         cEnw==
X-Forwarded-Encrypted: i=1; AJvYcCUgijNsgPt3lKHhYCqZevhBTVIzORi5hNA/qZCvTmrjx2K2Mfn6M4n4w8jGd7/nvsTVOY0tuGiiRWdVMy2sUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyAQ5/92VZgkIeb1Qlxicngdolw+w+8KYsVBFNtypHxL37HNbws
	oNPjcvCASKdPWo5ut8f6hJdkZ9g7UliKWRR4t1EchdlGey4wcb0Y5TPN
X-Gm-Gg: ASbGncuWMJ10/c07E73yOjzWP+3gFLuYOWiTWq5LD6x+kipy4F12EldiUQ1s5ev570Q
	PKQc0Q8GCBSfsN8PBhncwUGMJU6Qil4e9JkzURrvPK0C83nidLln00lyDR216438U+DsKP7s3xm
	n9ca1EcQudirMxv9Scrwrg3LoX5UTOJoVWE4SLm6+VtBN+ivO9sY7C708bwb+prROeh6JDu1UFE
	Q0X/rhJ7W6QpOlioIWq77vRWKdUqeWoutREjWez2qwA8mJ6l2aK/ESi5s1Preoytrj1E6wJmI6N
	CTn86vlxkI9DhiQ9aEyp7VDtrYmamkqO/fl14VzBDAotq5IgF8OfN35nD+HJDkRK727Zzgps527
	c35FZ1bte/LevCb0thjCGkwxe91KbhK2XDhBv1y2Vh4dUaxXacTBMh5B7JEEyUleLZb5FOAExxF
	vJQ50DUWqF/bltIonQeYh8rFI/dklqV3nbjfz2wqM+ojNNe4R1CyU=
X-Google-Smtp-Source: AGHT+IE/1oRW7djj3PF3lllhD2jsqIUJ4YnrzZc5/HveUGINDV6PilKjKnA12B11wB2yhwFfIGW+4Q==
X-Received: by 2002:a17:903:1c7:b0:29b:ab3b:70c6 with SMTP id d9443c01a7336-29da1ebb12dmr16881485ad.30.1764816264563;
        Wed, 03 Dec 2025 18:44:24 -0800 (PST)
Received: from ubuntu (softbank060152129044.bbtec.net. [60.152.129.44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf6a1306ce0sm108330a12.17.2025.12.03.18.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 18:44:24 -0800 (PST)
From: Nakamura Shuta <nakamura.shuta@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org
Cc: Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	Nakamura Shuta <nakamura.shuta@gmail.com>
Subject: [PATCH] rust: num: fix typos in Bounded documentation
Date: Thu,  4 Dec 2025 11:43:36 +0900
Message-ID: <20251204024336.246587-1-nakamura.shuta@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several typos and grammatical errors in the Bounded type documentation:
- "less significant bits" -> "least significant bits"
- "with in" -> "within"
- "withheld" -> "upheld"
- "//  This" -> "// This" (double space)
- "doesn't fits" -> "doesn't fit" (2 occurrences)

Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1210
Link: https://github.com/Rust-for-Linux/linux/issues/1210
Signed-off-by: Nakamura Shuta <nakamura.shuta@gmail.com>
---
 rust/kernel/num/bounded.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
index f870080af..c3ee79ba9 100644
--- a/rust/kernel/num/bounded.rs
+++ b/rust/kernel/num/bounded.rs
@@ -40,11 +40,11 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
     fits_within!(value, T, num_bits)
 }
 
-/// An integer value that requires only the `N` less significant bits of the wrapped type to be
+/// An integer value that requires only the `N` least significant bits of the wrapped type to be
 /// encoded.
 ///
 /// This limits the number of usable bits in the wrapped integer type, and thus the stored value to
-/// a narrower range, which provides guarantees that can be useful when working with in e.g.
+/// a narrower range, which provides guarantees that can be useful when working within e.g.
 /// bitfields.
 ///
 /// # Invariants
@@ -56,7 +56,7 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
 /// # Examples
 ///
 /// The preferred way to create values is through constants and the [`Bounded::new`] family of
-/// constructors, as they trigger a build error if the type invariants cannot be withheld.
+/// constructors, as they trigger a build error if the type invariants cannot be upheld.
 ///
 /// ```
 /// use kernel::num::Bounded;
@@ -82,7 +82,7 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
 /// ```
 /// use kernel::num::Bounded;
 ///
-/// //  This succeeds because `15` can be represented with 4 unsigned bits.
+/// // This succeeds because `15` can be represented with 4 unsigned bits.
 /// assert!(Bounded::<u8, 4>::try_new(15).is_some());
 ///
 /// // This fails because `16` cannot be represented with 4 unsigned bits.
@@ -221,7 +221,7 @@ fn fits_within<T: Integer>(value: T, num_bits: u32) -> bool {
 /// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bounded();
 /// assert_eq!(v.as_deref().copied(), Some(128));
 ///
-/// // Fails because `128` doesn't fits into 6 bits.
+/// // Fails because `128` doesn't fit into 6 bits.
 /// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bounded();
 /// assert_eq!(v, None);
 /// ```
@@ -501,7 +501,7 @@ fn deref(&self) -> &Self::Target {
 /// let v: Option<Bounded<u16, 8>> = 128u32.try_into_bounded();
 /// assert_eq!(v.as_deref().copied(), Some(128));
 ///
-/// // Fails because `128` doesn't fits into 6 bits.
+/// // Fails because `128` doesn't fit into 6 bits.
 /// let v: Option<Bounded<u16, 6>> = 128u32.try_into_bounded();
 /// assert_eq!(v, None);
 /// ```
-- 
2.51.0

