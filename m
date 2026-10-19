Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452894;
	b=yKMx9663LPo1jeKwLZCXeX0hmBR/S+v3B4aJK5YtLSe8HndpccIVJFXhJ4UHxHZa6pfj
	 wBiDn+V5ZvbItaqod75dq0/f/GUo2uBhYhLn6MDspkGYxhwb0SHBV+Jend3XM6trs6XlL
	 xZOYcSwAKSnweyk8eODptvzHMBdqrxpx91SKqGKV/+ZyZfuom1tuRQjaE5DFC2h4Xi2BQ
	 fiDeSL96YwkOJMfbxX0Fz5mmTiZVAG4lATi+QpCvFpzeMTOUrEvvfHnoiDnvIm1NAJkSO
	 x18Bnbm6FK3Z+6/ik4z3tbR8BmDp0POgO3avrwmjW2/56YY+zlwcSpm/qznnxY69bug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:In-Reply-To:Mime-Version:
	 References:X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=hL9z3sxmqPHu6DZpQKLBUOtEfTvn2OY05fH87pUmBmw=;
	b=ZP6EH3anjMK8dwEO0o2IpAA4R8SvaIYbmGcfP3IkMO43ZqDJUHpvWEt9+FY9oY5C1WBL
	 sDcQS7M7XGghm0g7dPjGlpEYdBgtD9HKObHs340epciebAQkWh1HEsqViF3ISEKwYCRjo
	 ga6s93x/nL2U3fZOe1NLjyZ+z9Sq+eA+iMKCZM5yLlULZiTF55i+h4xFulhmyaJS30d6M
	 xz7R/dCv7S63mL1qvnEivwKheN24GhD2uxJ9hCt7nikmS/pI1YHFtxZc4o7P6TvXeXxR6
	 GuTifgMgfFYI8AYVNcbu3b1n6vtam4RUxa6V9r5JBBYwwaRLaW+5chjVLWSBCQB4Lzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=orLK+din;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D949E606A31A
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 23:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D949E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=orLK+din
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c3c370b17so5235531eec.0
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452893; x=1793057693; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL9z3sxmqPHu6DZpQKLBUOtEfTvn2OY05fH87pUmBmw=;
        b=orLK+dindxJMUSaNtTwwlimiW4FxCTJdbtJDVOcpZq1tCufIfWB9RKuUSVzqvYJh5x
         5uuPOSlvknCExmqKXQwaU7piZjcWpSl7QnP4rfQuZFixxWAIZmX1S6U/CDq3UQsQ8/yA
         WzzAf8XmCj5CjjqoqAZDkKKDftDusldDduaia85ngyHKi4vGrloaAjcPfH5MtTX153WM
         p+xQl9/5UsvPQiooH+ExmAY3p8sOpE0+yZTh4T53t4hJ+1QjYg1xFes3BYHTMoPCm12F
         r7F5k5LjZxXbPZPgdxvVDyw+PQlgudcKg66I/HHhUK5LVxRc+/gZvBPUUYNMYpstGk1y
         Fi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452893; x=1793057693;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL9z3sxmqPHu6DZpQKLBUOtEfTvn2OY05fH87pUmBmw=;
        b=FlHqCH/9aNcMFQVdutu33fdpkZcT/aBoqYjaXLVmUijKD4ZWtybaQwQH8phDKzXZfu
         lxM/5vX352ixlmS3DmDjUdnLWV9uSnUFVXciljErJO5tsAnkcHTHeunJhddl9WgLqagA
         0NDpJVOknmxDnyffBmudRc/x63xd4EqW2bWYectgKjFA1cM0dslRME+Qom1/xq73sJZM
         pnk3Q0C8lt502Hn2wmkiNn2mtv+lZlGjRlkaOHnMZYQA4RALRUGwHvHpytW/nLaYh9Dz
         siHY6tl82pL/htvPhdBhYwlqODkWcmMrQWFg7n8yQiPgFweLLQ3UHY79imNZYOtDwoz8
         GLCA==
X-Gm-Message-State: AFq9FYJFDgO6ozbxJ9ZS1Y5c6CbSgskW8Cm+WHFB8juQrpmvbQ+z5CYz
	FswaHLL8CD5PAJpU1maRfXah/7kBTFvQiR8gsfFdGSJeEMjR0r4dEJXINC2+8yvb3tuJGu19ClE
	W1fMfcmqMg+hnqM9CZ1kZvSxcYVd2fA==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:14e:8121:6eda])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2414:b0:18d:2a:370b with SMTP id a92af1059eb24-18d002a3854mr1805095c88.9.1792452892724;
 Mon, 19 Oct 2026 16:34:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:39 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4650; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=JwJNlGuBiQ8g6xhZrLGYDfrsZ7obgLAdDp/5rBj/R3w=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVoqpNN3YtdNaKtPpfNf8v2pbOA2L7kS4XOWS+3y+6
 ca3TNYrHaUsDGJcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAit1cy/Pdz9JgoqsF//5WP
 /8kXnHIfMktTw3VL/ul8bz6xSPPHTEaG/+UPS0RPqF6LKwmKPy5dsOvXipQri4xiTrnO33daUuX 8Sl4A
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
Subject: [PATCH 3/3] rust: dma: declare cfi_encoding for dma_data_direction
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

bindgen generates bindings::dma_data_direction as an integer by default,
while C callback tables such as dma_buf_ops declare the parameter as
enum dma_data_direction. kCFI encodes enum types by name even with
integer normalization, so the type ids would not match when C calls into
a Rust callback taking bindings::dma_data_direction.

Generate dma_data_direction as a newtype with a cfi_encoding, as is done
for lru_status, and convert DataDirection through the newtype's
constants.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters |  2 ++
 rust/kernel/dma.rs      | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 6003d5127676..8577e7663e02 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum dma_data_direction
+--with-attribute-custom-enum=dma_data_direction='#[cfi_encoding="18dma_data_direction"]'
 --newtype-enum hrtimer_restart
 --with-attribute-custom-enum=hrtimer_restart='#[cfi_encoding="15hrtimer_restart"]'
 --newtype-enum irqreturn
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 2ce09f8e90c6..2ec5fe7d56bc 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -310,25 +310,25 @@ pub enum DataDirection {
     ///
     /// This is used when the buffer can be both read from and written to by the device.
     /// The cache for the corresponding memory region is both flushed and invalidated.
-    Bidirectional = Self::const_cast(bindings::dma_data_direction_DMA_BIDIRECTIONAL),
+    Bidirectional = Self::const_cast(bindings::dma_data_direction::DMA_BIDIRECTIONAL),
 
     /// The DMA mapping is for data transfer from memory to the device (write).
     ///
     /// The CPU has prepared data in the buffer, and the device will read it.
     /// The cache for the corresponding memory region is flushed before device access.
-    ToDevice = Self::const_cast(bindings::dma_data_direction_DMA_TO_DEVICE),
+    ToDevice = Self::const_cast(bindings::dma_data_direction::DMA_TO_DEVICE),
 
     /// The DMA mapping is for data transfer from the device to memory (read).
     ///
     /// The device will write data into the buffer for the CPU to read.
     /// The cache for the corresponding memory region is invalidated before CPU access.
-    FromDevice = Self::const_cast(bindings::dma_data_direction_DMA_FROM_DEVICE),
+    FromDevice = Self::const_cast(bindings::dma_data_direction::DMA_FROM_DEVICE),
 
     /// The DMA mapping is not for data transfer.
     ///
     /// This is primarily for debugging purposes. With this direction, the DMA mapping API
     /// will not perform any cache coherency operations.
-    None = Self::const_cast(bindings::dma_data_direction_DMA_NONE),
+    None = Self::const_cast(bindings::dma_data_direction::DMA_NONE),
 }
 
 impl DataDirection {
@@ -340,7 +340,7 @@ const fn const_cast(val: bindings::dma_data_direction) -> u32 {
         // CAST: The C standard allows compilers to choose different integer types for enums.
         // To safely check the value, we cast it to a wide signed integer type (`i128`)
         // which can hold any standard C integer enum type without truncation.
-        let wide_val = val as i128;
+        let wide_val = val.0 as i128;
 
         // Check if the value is outside the valid range for the target type `u32`.
         // CAST: `u32::MAX` is cast to `i128` to match the type of `wide_val` for the comparison.
@@ -358,11 +358,12 @@ const fn const_cast(val: bindings::dma_data_direction) -> u32 {
 impl From<DataDirection> for bindings::dma_data_direction {
     /// Returns the raw representation of [`enum dma_data_direction`].
     fn from(direction: DataDirection) -> Self {
-        // CAST: `direction as u32` gets the underlying representation of our `#[repr(u32)]` enum.
-        // The subsequent cast to `Self` (the bindgen type) assumes the C enum is compatible
-        // with the enum variants of `DataDirection`, which is a valid assumption given our
-        // compile-time checks.
-        direction as u32 as Self
+        match direction {
+            DataDirection::Bidirectional => Self::DMA_BIDIRECTIONAL,
+            DataDirection::ToDevice => Self::DMA_TO_DEVICE,
+            DataDirection::FromDevice => Self::DMA_FROM_DEVICE,
+            DataDirection::None => Self::DMA_NONE,
+        }
     }
 }
 

-- 
2.56.0.212.g129ede20d9-goog

