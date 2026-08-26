Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA6C46984A
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761900; cv=none; b=K78GJ3fMXESvdanV5ZV0eF9nHErORbx4/Qyj9sbDXhZv0jkX34Ets5a7p5eFcTkj68IhJUk0R2DsdkL/d56PySwyPg95RVL/AtAbmwcnQQnxS8uHTozLCH3CoE3w/UlCMEulzUkmaDIDTk+e1KfeSk1aZJ9bwxG1zd28gawQBBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761900; c=relaxed/simple;
	bh=WZlq9OZ7FAFZLaxFJSphucTd66QV1xZKbxhmcyg3C7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FET5cFQGBiMpwT723HddIE9wJXCWcY787iCBh66qt442+WPat60skkIV7Yz18iq8z5sUmTtVfD/yIp8mSXHAkOMlMbxYi9vCwsMPbew5KJSqLVoOP1kI2atIh2iAZLKkREUXh4pv+Pd9xmgndFDSf5Il3N8hB6KHpqOtppkwfsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=NVWM8oEJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="NVWM8oEJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-499cb997b8fso6962075e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787761897; x=1788366697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdtsQq66n/qz7GbF8KHrVG0ry8nV9A0BZm16SycNCKs=;
        b=NVWM8oEJyWZqqyfJN5aZpNWDonSmlCSDNqgEJ0enNF+vSwfkXLSz+W6gFC/NTLCwx8
         Pyx4y7Oiy1byWQEtsecQE+d6CctwEUNhWE2vHtr25sTU6XRGS7n4r229+RGnfmIeBfit
         r7zIvY6JU4aCd+3l97TGmcpbj9pE4uxg3c+xoLczQk8nIfoUm2oFaaC6EgQXYXvjMi1G
         44usWAc/F9OWabG5f4/aUuqhHWhw2jrXGrbtkvyCozZ5HB/bxZEhTOED3U9kZN4R+rvM
         ZDsfbUYj76q/RhR14c3KzPEq/wL/wX7VqpznkvJhvhh0pbIdC51dVSAe+6pITtb7K9Oe
         124Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761897; x=1788366697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdtsQq66n/qz7GbF8KHrVG0ry8nV9A0BZm16SycNCKs=;
        b=Xl6iW+F0knxl3/80ly/Z4AW5KeJ/ZQF/y7DNtuXKKJV54nTSLeqS9DBBRlodCs8oFG
         OMEzhNjZAg0UhuvSLdbKBPN8chbYW5xKP7BjCGeF5uEiy7jMbZfhz7A3qAooJMICzzmN
         WIrbTGtH0L5WzOEyqWOikBjve8j3ee6kY+23OyyRqd1Iu1d/G0X2UPL51ozf8IoSCvce
         WRDfTWKVIEoXhN3XsQPQ9D8Y9uT9DcTxZP9bj1DuWXbAAyogmKQyHhpReHcq5K4HrovO
         eivch50miUR7I3S847ru25ney1GFX8KzVhuMwaZ2WP+IQEzeybURRvUKe4fMUemxNSV+
         MvpA==
X-Forwarded-Encrypted: i=1; AHgh+Rq4pH9LJc0RVtu7/V0kfkmo30geA6gs9TtmSEbiX0IHEmkICtGnNZJtSWY9/GBaA8JHeZ2xliA0JEyARBQW2w==@vger.kernel.org
X-Gm-Message-State: AFuF++l4zyAym4o1DyXupNWsVwkqKGqgBi1jH6MaJPnOp8i+CkrSs6tz
	r9o6ha4ucfncvljt4wP/MOZR0xOVj9yCOUIpq0L/II6Dnniddeaf8qMpuLZsB5s2U8gjjJQJX1x
	5SxxGCy0V
X-Gm-Gg: AR+sD10nCVsIEBQbjdZEPYqhRpalx87HZgeMk7er49z45ldjFvjGfw4rVkTPA247Jmh
	gepsG63yBon9XpKTl1qzZfbA2pC6IvpeUOjTc7MsaywR+vh+l3QzX0f+Sw/MJAk3GHBuyWrTszt
	D2nzBogS2p1c9JcfVatfJD9rvAaNSOCFfzQPX7KzzzpfF84ZsbC9N57L6FxdkiC8Wi/fuXEfFuO
	YGo4BV393AKZR0bLaEcYS41u1dK91lukq5eJkfm3CxJ6CjrV0BY4Pj+f34E10hs3G/3UaweEvzM
	DzOZKW8X5xfUwm4HfikUPFqDAvIvZr0OkOuh+96NlnX7zFN9ghzhcCuOpLhQZgAK4isP11Toos0
	lBrHnnUqqqgV57F2GgxLr5KLwGbXa2DYJJwGaAtIfK+SivOIrQWTKT9oKaDqYSd9kxjV3X/oY0g
	8aYSjMYqbvRxt+XvvroQakY9trnhUEpL+49n4rDFNLza7vOR3FYxgj6zZYh2aaxVoAx3C62Mj7L
	Bl0pgEZAx+/U8XxWR7zTN2py0vUp6CPEEN9
X-Received: by 2002:a05:600c:8b55:b0:499:d366:f572 with SMTP id 5b1f17b1804b1-499dc81cccamr81292205e9.10.1787761897397;
        Wed, 26 Aug 2026 09:31:37 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dc9b83aesm31202705e9.12.2026.08.26.09.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:31:36 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: linux-usb@vger.kernel.org
Cc: Mike Lothian <mike@fireburn.co.uk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Braun <colinbrauncl@gmail.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] rust: usb: add a vendor-and-interface-info device id constructor
Date: Wed, 26 Aug 2026 17:30:40 +0100
Message-ID: <20260826163101.4168-5-mike@fireburn.co.uk>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826163101.4168-1-mike@fireburn.co.uk>
References: <20260826163101.4168-1-mike@fireburn.co.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`USB_VENDOR_AND_INTERFACE_INFO` is the C macro a driver uses to bind to
a function rather than to a list of product IDs: one vendor, plus an
interface class, subclass and protocol, matching every product that
exposes it.

The existing constructors cover `USB_DEVICE_INFO` and
`USB_INTERFACE_INFO`, which between them can express "any device of this
class" or "any interface of this class from any vendor", but not the
combination -- and the combination is what a vendor-specific function
needs, because class `0xff` means nothing without the vendor beside it.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/kernel/usb.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/usb.rs b/rust/kernel/usb.rs
index 782bae53584d..b2a0fb104ddf 100644
--- a/rust/kernel/usb.rs
+++ b/rust/kernel/usb.rs
@@ -307,6 +307,29 @@ pub const fn from_interface_info(class: u8, subclass: u8, protocol: u8) -> Self
         })
     }
 
+    /// Equivalent to C's `USB_VENDOR_AND_INTERFACE_INFO` macro.
+    ///
+    /// Matches every device from one vendor that exposes an interface of the given class,
+    /// subclass and protocol, whatever its product ID. This is how a driver binds to a *function*
+    /// rather than to a list of the products someone happened to test.
+    pub const fn from_vendor_and_interface_info(
+        vendor: u16,
+        class: u8,
+        subclass: u8,
+        protocol: u8,
+    ) -> Self {
+        Self(bindings::usb_device_id {
+            match_flags: (bindings::USB_DEVICE_ID_MATCH_VENDOR
+                | bindings::USB_DEVICE_ID_MATCH_INT_INFO) as u16,
+            idVendor: vendor,
+            bInterfaceClass: class,
+            bInterfaceSubClass: subclass,
+            bInterfaceProtocol: protocol,
+            // SAFETY: It is safe to use all zeroes for the other fields of `usb_device_id`.
+            ..unsafe { MaybeUninit::zeroed().assume_init() }
+        })
+    }
+
     /// Equivalent to C's `USB_DEVICE_INTERFACE_CLASS` macro.
     pub const fn from_device_interface_class(vendor: u16, product: u16, class: u8) -> Self {
         Self(bindings::usb_device_id {
