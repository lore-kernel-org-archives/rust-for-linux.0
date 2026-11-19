Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106225;
	b=223JZT4jrzhcO6WZ9NCETM06M2uPlrsKVvJyjFXsf1IqB64p8yVwi1IbP0FAxvmo8kGA
	 9ULk2o7Zto8XQatSbRGJZXrlqui49nOcmSoe6lvZg6Z7usJhdRBbuxEsKbwdFb4HskUAW
	 w9qWeHfv9WdmZFLFsrMLtYsA9jCdLX76o7+xUk/xRJ9VoF1UWPYc1LLgJVjbpGYvWEqdy
	 JqN+gulIEIIOIO3A6jSN29Y2x+71orOjLLZrGmBlocHAXX07wSV+6Uw3oisZjggqUgJvx
	 9Wuh105W4KWA0KpDZQB9WbJ/swqq8LhtZ57MrMy0/+06oMydijiIcd9d6R34QbHiQSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VESp6hsfsBjU8MDr+X58zX9DGjPHSl10HXSvMJRGh40=;
	b=m2Pc4NGiq2ljRVfm0OOYdzWnAKvjtNWAfjcvsZRzR2VHvOlNshW1cyRk2IvkHHJ7R24Q
	 9z0/YSc5kt1J+IuozkYyBtsMQ02QF/v3s9pxbBN6RJG/LmgxA16yvdhpK5qQAkEd5JQ4N
	 aJ/IIK0Y9BU/G+ynIz4FBXUTble6bXdC9rBirpn9hITjfAWO8xfpZA/yb8NbSNxYbnqu+
	 vf75gSWJ45qcsW5vnwBvEOSK0RCDYQuG6heWAce4EWJqnRrP2ONDQpu08OjGPmekHfnsL
	 yqxQ7atXhDb7JwDJnjQPRiUmp9xCeseTt5N2UlUU7+HsL7WTC1zDqhJgLgEoxUUqq+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cqpk3ACA;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0170606A320
	for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0170606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Cqpk3ACA
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb66fc3aa6so25826715e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 19 Nov 2026 08:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795106223; x=1795711023; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VESp6hsfsBjU8MDr+X58zX9DGjPHSl10HXSvMJRGh40=;
        b=Cqpk3ACAMjA/LkzAhUUWUONLb4WfxoWIVI58AyTNiyYFoogkR387bB+FREOqy+vgsg
         2qSZtira57MfSWJMiN7/HAFvqF2BP7Ahr5lE8qrNEOGamcwjpUJNZpexASxmAWWjcHx9
         77kqIJs8JRXYGEUi8nwAAUbws0c02CpKAHkuSTTpFHgmK/l3GMYw4H428sL1xIneDIXV
         XvTrJtTxq7R3Fql6FmkpjvNQNlQ5Gwc2lMyFT/wOAoSkD1QLg4bMUfXuXtMNefoV0rDa
         97tHoSWb9/7SNj1j1nr8/nO2JN8VD3oUhbiJzcwgx/h5QdamoOueLaC2Fq5YlRU/b4KB
         nZ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106223; x=1795711023;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VESp6hsfsBjU8MDr+X58zX9DGjPHSl10HXSvMJRGh40=;
        b=koOAC2MtFg/XRyZ6R8SsXM8LTiv8oVRiEaNr67QMWMKQKuKqI1zke1jq/iGFXOEfmq
         ygnJZnVyp1aYzMPIr03xb22NgedAHHlueU+VBNuMTwVS9ltHsr77uaqj2/sUmIVjsaUF
         jtBSOvLuVJ2cZOEMRgFr3LqVmyJ7BqhoL3V+5LYtqgGPcHsY2T7GawtARFgGCsGCOLV+
         aBc47mVxhFTLr1TvoHVXkxEbLvow0Jcwy+kfBGkxta+1FbcHLxEYmgbfqLkFGmvSyFM/
         j/k9+viqo0T06LtDtnBwH3GiaA3tBLrC40nuVLU5MlrezCEkN+Gm4DEip6bkVFY9ER0E
         /Z3Q==
X-Forwarded-Encrypted: i=1; AL+hErEOBf2evGlezzOzzw7YUKSV8xXlclAgz9/aAaNAb+pYvSeGalP3AarBZv3MmExTrtanJzqElMAogANjHFnHsg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/ofBCKI8CtoSqSZxgDfvG81IRYUkD9AOdH83xBLMNLmy5R9Yb
	VpPzHqX4hYl5DgvaYGMmImaZWQ1BoWjwSCWiKBGUItXCl2fqJcvoFL0HUmA9sPKttXpF3bjQ/j0
	jfw5G2hrvT4jouF7Tzg==
X-Received: from wmsl30.prod.google.com ([2002:a05:600c:1d1e:b0:4a2:df9b:ef74])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:820c:b0:49c:d019:70c5 with SMTP id 5b1f17b1804b1-4bb887876c0mr2867805e9.0.1795106222831;
 Thu, 19 Nov 2026 08:37:02 -0800 (PST)
Date: Thu, 19 Nov 2026 16:36:54 +0000
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKUl/2oC/x3MQQqAIBBG4avErBtIIaGuEi0kf20WWWhFIN09a
 fkt3iuUkQSZxqZQwi1Z9lih2oaW1cYAFldNutNGKTVwOK57Y2dPywnRbuDFG3ToB6+NododCV6 e/znN7/sB9gx+wmMAAAA=
X-Change-Id: 20261119-gpuvm-data-rename-cf6e0e59f266
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2803; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=9nHlV2IX0ybZW/nMkDdw/FTgCb1QJu3QEYfuNAVRj0A=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/yWoV/6pHAaJqRouM2ol6MHJianug+Bx4ROFW
 +3RUAa1s22JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8lqAAKCRAEWL7uWMY5
 RixkD/9TEsvRdSu4RFQ4gmgUKRWqfYAK20JPBM8Uy3RWetQUpwN0EKmAxE++IZVd7IALAj4yVHh
 7QZVfsVeEKA6+p968hukuRdOG2rSeXsYkltoY7d3HDV9H7K1l0D9chzC1+Sit2Hwc6P2c+KC7Zw
 zXuxCwDij9gtTdeHHgrh0gIU0F29PAvBaD2Vb3UDcFVrEzATP8XmkJqTDkrsvG+9lmpdQWGKT4l
 8hs+v/VygwdwAQf/uMa/LQ5VOZ4RW3wQrcJeLTZ14b3dLlTTnsbNAWCZrj5gP0MbVTa/juAl2Hf
 rrzzTWw/Vbn4352u+sjHziaHvHAmdBqAbgzQCI5F5KyosGOPIYYjvRzIkUDBPNNmLGggimjMTBk
 /0VF0Ev6rEFJzwhu1ybCBj/QGD79XcHhu4o2vx3ljAW2LqsqsxJcVWLxcCXAbQgR2kRN/t0HMR7
 /MyBvKSqLW4cFoXd2+nrIkOTL6NwQnYxBLmqQkKwf60LIf+8m6QKs0ZlX686VtLJCiMMNfytrKI
 0AawmoOhuZSCS3+KfM55WzY9xyPeDHqMshWIFsW6sTGhPn/sbPCjLLCknfm2KQkv2nXdTG0V8bX
 hGLtXjOULF4YiVZpbHtN5Bf6Xg+7KKPPaEW+WP+SPqJfSOfGOfu38IxFnQGQdpsfxmw4PM7VcAw NV94UCWU3/05N1A==
X-Mailer: b4 0.14.3
Message-ID: <20261119-gpuvm-data-rename-v1-1-8eb773435fde@google.com>
Subject: [PATCH] rust: drm: gpuvm: rename UniqueRefGpuVm data accessors
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	"=?utf-8?q?Thomas_Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>
Cc: Sami Tolvanen <samitolvanen@google.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

`UniqueRefGpuVm` currently names its shared and mutable data accessors
`data_ref()` and `data()`, unlike `GpuVmBo::data(&self)` and standard
Rust naming conventions. Thus, rename them to `data(&self)` and
`data_mut(&mut self)` for consistency.

Link: https://lore.kernel.org/r/20261118111653.448550-1-aliceryhl@google.com
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/drm/gpuvm/mod.rs    | 4 ++--
 rust/kernel/drm/gpuvm/sm_ops.rs | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/drm/gpuvm/mod.rs b/rust/kernel/drm/gpuvm/mod.rs
index d9d43d719761..23e73da865fb 100644
--- a/rust/kernel/drm/gpuvm/mod.rs
+++ b/rust/kernel/drm/gpuvm/mod.rs
@@ -311,14 +311,14 @@ fn sm_step_remap<'op, 'ctx>(
 impl<T: DriverGpuVm> UniqueRefGpuVm<T> {
     /// Access the data owned by this `UniqueRefGpuVm` immutably.
     #[inline]
-    pub fn data_ref(&self) -> &T {
+    pub fn data(&self) -> &T {
         // SAFETY: By the type invariants we may access `data`.
         unsafe { &*self.0.data.get() }
     }
 
     /// Access the data owned by this `UniqueRefGpuVm` mutably.
     #[inline]
-    pub fn data(&mut self) -> &mut T {
+    pub fn data_mut(&mut self) -> &mut T {
         // SAFETY: By the type invariants we may access `data`.
         unsafe { &mut *self.0.data.get() }
     }
diff --git a/rust/kernel/drm/gpuvm/sm_ops.rs b/rust/kernel/drm/gpuvm/sm_ops.rs
index 742c151b2540..9f3fe7c954fb 100644
--- a/rust/kernel/drm/gpuvm/sm_ops.rs
+++ b/rust/kernel/drm/gpuvm/sm_ops.rs
@@ -381,7 +381,7 @@ impl<T: DriverGpuVm> GpuVm<T> {
         match p
             .sm_data
             .gpuvm
-            .data()
+            .data_mut()
             .sm_step_map(op, p.sm_data.user_context)
         {
             Ok(OpMapped { .. }) => 0,
@@ -402,7 +402,7 @@ impl<T: DriverGpuVm> GpuVm<T> {
             op: unsafe { &(*op).__bindgen_anon_1.unmap },
             _invariant: PhantomData,
         };
-        match p.gpuvm.data().sm_step_unmap(op, p.user_context) {
+        match p.gpuvm.data_mut().sm_step_unmap(op, p.user_context) {
             Ok(OpUnmapped { .. }) => 0,
             Err(err) => err.to_errno(),
         }
@@ -421,7 +421,7 @@ impl<T: DriverGpuVm> GpuVm<T> {
             op: unsafe { &(*op).__bindgen_anon_1.remap },
             _invariant: PhantomData,
         };
-        match p.gpuvm.data().sm_step_remap(op, p.user_context) {
+        match p.gpuvm.data_mut().sm_step_remap(op, p.user_context) {
             Ok(OpRemapped { .. }) => 0,
             Err(err) => err.to_errno(),
         }

---
base-commit: e55a991e09e3b44f0b0d8206bb523dc57c086341
change-id: 20261119-gpuvm-data-rename-cf6e0e59f266

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

