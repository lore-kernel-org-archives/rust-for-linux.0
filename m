Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8271C471437
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762230; cv=none; b=cWBpZ2trNkZUgMjqiASQDxcwDC2BAccYp1zZ8/Pug9L40VD8EIMfxyuzx7UyjhlCy1d5+Uvoy8Za9sMICg3OLjLA/ui7itc9yQfoi0p/kckvz780z4O59r2j0ZMqt+BRP5eRlWYz8ffRPgnIiDl8CUPTHgee7i2AbRazVI3Kjj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762230; c=relaxed/simple;
	bh=IgO/Oy8GX2mLKijlYbJqHBxo01d3pEYgrjjJjDkdEjU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjBmqnKwvgo+BGVx8lE82Qp0NbaVSv4K8ZWd4htbvzdByLlQxh1oULdoqVavm1RnxLzNOtdQzERCLN9WV4XiIqr7jZhgOmA4bMMjLzBRlS/9aY6abLBqg8kQPT7t93ZckvdNWuiouJLyMj7uwDZdLNPYz3DJjfb8R4xzKFNAgd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=apFCPZBs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="apFCPZBs"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1163505e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762223; x=1788367023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdJB+7gpvS5WCvpUSsJAui6rgsKkc8CSJW/uARo52jk=;
        b=apFCPZBseM2Cf6E4OLtR1kJKheX2+1ZOD0aM+9io/PwChZDujasiFysexWzB6Q6/f1
         gqPlOszMoEZciJ74Q0MJAPutexEgRxy6g32Vf4umeNcBmUx45YklFehjmEiSCJMpyLB4
         a6aWVlYT0z2sgzJFhZv67kGAkyOekggSnU42INK41DsyWLhf6ulDS+slBQMzHpKJIzee
         IO9IlPJ5izw8C7ubu9ESl+tcvIVmRK3/xzlSm6/j7cE2hJNSL5DNcJhQk1GKWh3lTPez
         69n5OqGmYT5UPGG8rF2tAOyrzX3R7KUZx6/bn46xyZUTNVe+fSgZlcyNDqUuMtA6hKxj
         /kqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762223; x=1788367023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdJB+7gpvS5WCvpUSsJAui6rgsKkc8CSJW/uARo52jk=;
        b=jsIJcEgMxz/zpEy38B80oX+bFa8/Z88Dk+UO+Mye/K1Ape9BHVhb2LJ3NN+hTI/Nzj
         3wzbKuYHBxU6XinJQ/LyWWgfadJA6//rrJzWoByqd56k28sW2w1bnCDBj0rQgHmXso7H
         EibxVOyghBsuSBxFQNRXxoZw0ZDRlWxbhRHfFkK6vwhSgkOjzm5irCLjQ1iERtRmAFqs
         rKwBXRotugv969Dyr9d60ftH4zDFl/h1mzjC8rD9Uh9FBMSYne7MNIcewiT9CsyDbs13
         J5fxolmUGIcImsM8rUB4wcYShgXjHRLAQH0Wd6AS3ROzQG5Q9WVGGOZKgKaifZoGgptr
         ZRSw==
X-Forwarded-Encrypted: i=1; AHgh+RrumlUe7nNYgS2zyqKYa9YhpcCoQyIepI8L3bW37sx3P60JdnKtfs8WGj8f3o85m+dLoRUOG50FpmiPDwuWRg==@vger.kernel.org
X-Gm-Message-State: AFuF++nCi4h4TpNwpx8Cv9xLGcvNGfJpNtYjogUazJITCxNdtAEGVJ5g
	MLkF36C9aajVoaBJlPfaLWWiIJ2Ukb0/XKrOfpi4i9heFYSbHKDNLG7eRdJKsgQSxA==
X-Gm-Gg: AR+sD12/MaozUUHIwUJZVYrBHpxajFJjtVjjt3dy38ErAeoEuK3LfusPVxENHNzukqJ
	fGKMWVDi1/2GmL1rKtrgdUcuN2rVbwxBZ9hxUgx2m8sT1BTNfzdeTwLI8xvaMoOG4tl/yYFurhq
	iNPV7WNtf0ChfPHh1DHLIAmy1z7uGL+I2cIzqJpdW7NGW5bNJVu/6Z1K9OE13cX4TI7dQnpC5Jv
	Pv47qQpP5zb3eQNdJvbW7gfje9sJ6I0PbJ+CxHIann/CPHg0Ll+YlCLStgVcebBMStDPSbtS2uf
	E7ROizJ1lZvw5yYA66SU9UOosGCFID4dKou6mZP90UgTz4uO3jAEzea0bb4hpo63rnN9hCkX5Oe
	RGYJ/12bqY4HoKzsFwC7cXsF5cmpH+/UNxl/BmAtb7RaRq8A6V/fECcMYUeJ97MLxgw5OwIZg2J
	ej4UMCGKLl5GB6QxTES4ydpGM8su4pufLosKljx52DWkIsJjz1YUPjlrYzygf/2+n7hC92EvGVb
	wxYiX8M//FKKq+lC3tmoMtTJ9/2k5n5eoxh7A==
X-Received: by 2002:a05:600c:8486:b0:499:49f3:77b1 with SMTP id 5b1f17b1804b1-499dc6e1267mr91011085e9.3.1787762223039;
        Wed, 26 Aug 2026 09:37:03 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:37:02 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 23/23] rust: drm: kms: expose a connector's requested link depth
Date: Wed, 26 Aug 2026 17:31:54 +0100
Message-ID: <20260826163359.4998-24-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163359.4998-1-mike@fireburn.co.uk>
References: <20260826163359.4998-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`max bpc` is how userspace asks for the number of bits the link
carries, and it is deliberately independent of the framebuffer's
format: scanning out an eight-bit surface over a ten-bit link is the
ordinary case. A driver could attach the property but had no way to
read back what was asked for, so the request could only be ignored.

Add the accessor, and make the linear format modifier nameable outside
the crate so a driver that accepts only linear scanout can say so in
its plane's modifier list rather than leaving userspace to infer it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/drm/fourcc.rs        |  5 ++++-
 rust/kernel/drm/kms/connector.rs | 16 ++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/drm/fourcc.rs b/rust/kernel/drm/fourcc.rs
index 010823c4c86c..3a68af66f236 100644
--- a/rust/kernel/drm/fourcc.rs
+++ b/rust/kernel/drm/fourcc.rs
@@ -13,7 +13,10 @@ const fn fourcc_code(a: u8, b: u8, c: u8, d: u8) -> u32 {
 // function-like macros in bindgen yet.
 pub(crate) const FORMAT_MOD_INVALID: u64 = 0xffffffffffffff;
 /// Linear framebuffer layout (`DRM_FORMAT_MOD_LINEAR`).
-pub(crate) const FORMAT_MOD_LINEAR: u64 = 0;
+///
+/// A driver that accepts only linear scanout has to say so through the plane's format-modifier
+/// list, or userspace sees no `IN_FORMATS` property and has to guess what the plane will take.
+pub const FORMAT_MOD_LINEAR: u64 = 0;
 
 /// 32 bpp RGB with unused alpha.
 pub const XRGB8888: u32 = fourcc_code(b'X', b'R', b'2', b'4');
diff --git a/rust/kernel/drm/kms/connector.rs b/rust/kernel/drm/kms/connector.rs
index 231857cc1f20..633f4f76a610 100644
--- a/rust/kernel/drm/kms/connector.rs
+++ b/rust/kernel/drm/kms/connector.rs
@@ -935,6 +935,22 @@ fn colorspace(&self) -> u32 {
         self.as_raw().colorspace
     }
 
+    /// The bits per colour channel userspace has asked the link to carry, through the `max bpc`
+    /// property.
+    ///
+    /// This is a property of the *link*, not of the framebuffer: userspace routinely scans out an
+    /// eight-bit surface over a ten-bit link, and a driver that derives its output depth from the
+    /// framebuffer format alone silently ignores what was asked for.
+    ///
+    /// Meaningful only on a connector that
+    /// [`UnregisteredConnector::attach_max_bpc_property`] was called for; everything else leaves
+    /// it at zero.
+    fn max_requested_bpc(&self) -> u32 {
+        // `max_requested_bpc` is an `unsigned int` clamped by DRM to the range the driver gave
+        // `drm_connector_attach_max_bpc_property()`, so it needs no validation here.
+        self.as_raw().max_requested_bpc as u32
+    }
+
     /// The electro-optical transfer function from the `HDR_OUTPUT_METADATA` blob, or [`None`] if
     /// userspace has not set one.
     ///
