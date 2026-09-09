Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F611397
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Sep 2026 03:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788924817; cv=none; b=EG0FATQprw7zTnIOXxt6idF0SrIpLpoJIirxPOLxoPx9sRZEnEWhA+1AQxoSTe9v6sSVdLCJHsw0WU2uNw0IRuJ7wmOlcAER83J56hM2BXnhmLNGx8zh1WHFNB+bYpp3OtLoMj/9E9eaogmQc+rrkA7E+3vj2+IltNrxpozSM8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788924817; c=relaxed/simple;
	bh=9i9o/ilOEdPdQ52LKqv8CmqkloNbd+8uOtKzKeA/MzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ucyaFtwbfw4nPwyhjcdS214IcmmzXaPLColcyunGkzFhjwd8bw9p+VmYr66x6fXMGogtbITgLkWyp90fSaKyxdTH7sSRkRa9kL6dRpRtI5ZTSzJPKdX+hjU/piRjD1B5KYVMxUpZeJgvCY5C4fCydzzRShvu+ZoUr3ctk3F0MjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBR0pSH6; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBR0pSH6"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-9103f5b813aso43384236d6.3
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 20:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788924813; x=1789529613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0xYmUfmeEhmPnSVBSx2jrGqsQw1JgtPqNfXTg93gKs=;
        b=OBR0pSH6PrcBnMOMmyAzZAbqbEZORF0qBmvtKA/8LfqGZjBZRnfrhl/RcCYeTTNU9C
         9jWQtxLAvzFmH6dsQ72iwO+ag/cQs1YAIoLuGU6F8jEkD++BEApcBY1jUmuajTk6ExxP
         CQUAQcBbexEVS58TbnVkcvhF2g2Tge64s4q37vy+KwaolCdFxPEOkRQ7evLTQQfUM+jk
         Sk+MfdYu8hETlG57Za6yJ5SDd2Ck6CuNtuYkNeeH65hRYCrfpj3UvdSaiQGLVJFM9erz
         2lZslfdKQSxUHP5Fqs13FQIHC7DFIqrPad058D1fXjg6pdcldeUBqFoHNTUpdH4OPmVR
         n+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788924813; x=1789529613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0xYmUfmeEhmPnSVBSx2jrGqsQw1JgtPqNfXTg93gKs=;
        b=qR592eOe94UMykY5kkFMvtlqIzXZbr0Qh4SlJ6Zm7ua5CizhchCDvH/9lhgf8xViUK
         Gto18h7DV4OWRzs1gkhROPA+m0KXkurVat2vyyO7Gf5QdCEQ3MC5Cyn4s3wRS/uDVyQ9
         /q7QHYWGlC2IVS4I2Cq+aaN8RA3+U/zICCSlqj+qRajDZnnvrpF3UAMNsY5h5bs2h4Dl
         oFYBVUMQ4KHGQM2N93hWdb7G/yCJ47sIRMQFLzhuusnE4TIvvKR+5lqVkxv9quplAaKz
         CEJpGj/EGoj7r3lGpUldEZjV4uz/A93QFylzY4Erma0yL73tkeK0cXeUpvk02wtoOmv4
         Sq9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxA3ebYeI36Op9qJSyJ7fOInKgVsVzudTmE8lnNeLYBWx1Ayn2uP9JmJiKZdQMXKCj1up0CcYVOpuzImGIPJw==@vger.kernel.org
X-Gm-Message-State: AFuF++lyPZMihTdfc64wwmIuW3J01pz/iukx9yhWmmcbni/K05Ar4qxR
	+lLDOFBO9th2XwOfK9pRdfjlXKcslWS3WA0Z5X9WD/cv0MuPokQJ+H/E
X-Gm-Gg: AYBFou2IMfqobcnam8s8WSg8zMpf0U6TXkPeJYXY1FeQP4bkw5v0Q1QeURC/hnwVq3k
	TnmGXY6eShGAsU7vBB5hCuozDsiI5BUzw3wf78efHoU04GUCCjEv0auCfSdKu1BeTxwU4DDLnzl
	8tW+0d0xn06fhVC3zae7BmtPgv7UZBST8y8vIwNXSGESSrYNm1moETqH9lJyGQcVSanDr0c5wH5
	Q+tlVnCgQPuGD0QL6T172ZHxHSHWlssELELN5WK3km+hJimWgOk5exGB5QiWQGzpVSTwXD6CeNP
	BJiq8I0mPGKHraMa0+wwKCgLrhNtDQbYeCbRexT9eTj5mjX/BpMKfunbcjKIVvChPYzg6MNI0wT
	PCx5VMc3LDyIdayXvHvii7e7uDg6iO4x19k/QTR6RNou97WLKamLRVfmnXrwnRV4ILxmdtiAH56
	VxjHjcq/84xIBgk5UJdiiN/+HH/owTctuC+lkXC9/TbJTwkSKYA1dqsJI5CBmlnZ7CfoXF4A==
X-Received: by 2002:a05:6214:2b06:b0:910:345c:57e5 with SMTP id 6a1803df08f44-9103efeb90bmr420056646d6.37.1788924813465;
        Tue, 08 Sep 2026 20:33:33 -0700 (PDT)
Received: from tofu.. ([128.210.0.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106ba5b95dsm11910696d6.21.2026.09.08.20.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 20:33:32 -0700 (PDT)
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Subject: [PATCH] rust: auxiliary: validate DeviceId name length
Date: Tue,  8 Sep 2026 23:32:46 -0400
Message-ID: <20260909033246.2779303-1-georgeandrout13@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`DeviceId::new()` copies `modname` and `name` into the fixed 40-byte
`auxiliary_device_id::name` array without checking that they fit. An
oversized name is caught by the array bounds check, but the error
reports an out-of-bounds index in the copy loop rather than the
constraint the caller violated.

Check the invariant explicitly instead, so the failure states the length
limit rather than an array index.

In a constant context exceeding the limit leads to a build error; at
runtime it panics, so add a `# Panics` section for it.

Fixes: ce735e73dd59 ("rust: auxiliary: add auxiliary device / driver abstractions")
Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>
---
 rust/kernel/auxiliary.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/auxiliary.rs b/rust/kernel/auxiliary.rs
index 60dfbec8f330..1f3ba86d6d96 100644
--- a/rust/kernel/auxiliary.rs
+++ b/rust/kernel/auxiliary.rs
@@ -137,10 +137,20 @@ macro_rules! module_auxiliary_driver {
 
 impl DeviceId {
     /// Create a new [`DeviceId`] from name.
+    ///
+    /// # Panics
+    ///
+    /// Panics if the combined module and device name, including the
+    /// separator and trailing NUL, exceeds `AUXILIARY_NAME_SIZE` bytes.
     pub const fn new(modname: &'static CStr, name: &'static CStr) -> Self {
         let name = name.to_bytes_with_nul();
         let modname = modname.to_bytes_with_nul();
 
+        assert!(
+            modname.len().saturating_add(name.len()) <= bindings::AUXILIARY_NAME_SIZE as usize,
+            "auxiliary device ID is too long"
+        );
+
         let mut id: bindings::auxiliary_device_id = pin_init::zeroed();
         let mut i = 0;
         while i < modname.len() {

base-commit: 28924df2a08f440c73991b83028032c901de2ae4
-- 
2.47.3

