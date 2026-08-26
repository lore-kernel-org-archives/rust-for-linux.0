Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D7B3FF1B5
	for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 16:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762122; cv=none; b=N3fFASTrzaUnxK9q+LTbc5CmvU44S09C5xBR0TSYP3pXlarEbYY1hiOo4CRksdF2zYRGb792faJEs1sGIdxZEARcA7/5G8VjTgWjrgoqkDSw90SKEPCVsJx6u+gcYbrjxELZJvENrGvUDBhgrlyvEghZ887Y3ZhV71eiSQQh5qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762122; c=relaxed/simple;
	bh=92yr8L0aqnkp1k6eWlb3Q2WrL4gH76bLBNkW8QA1IVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ca36BHfl/JzNlMbhtUEunx9G4XCCqGHYWOq/ZiXzfCO9TdshshX5Rhh+KVn4jKK6R3b9/dvmYbaKfj2+rY0tzHLOSTa77B5k/bAKNcgilhWNzqF0jlzIduOPS9mtQR0F2K6+gWJdnVUgTBigfu7NvfFJelaA69phKxCGAZFCmk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=edRvC7ME; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="edRvC7ME"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b966dd74so5601145e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 26 Aug 2026 09:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1787762112; x=1788366912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fib2m4ECpynx9J+amS0YrKz2SnFl+TEiiRaglDGDZis=;
        b=edRvC7MEn/V2GG17xj1feL9Ljavpp4Esgiu7NJXViWqDv9bpNTrbt6mtmomEhRIrmf
         ianxrDCWQcbGp06i5P77+PYoIoI1R7qgRZSzm+HM6wqLjKXVwJLtabsPHIg4PYoRg1GX
         h4ueAJE3on8GBvQ0VdN6+jo8FRCbiAzbub2ObEZon58aBcXmOedd6b49xb0vb/tLWm/2
         oen3bKnuMoIzrbfuiI7HVf/mwfJ+c+FTuGODPocAb8hDSnSHebRSO30QkzuHwYaV7E5M
         pXWXVeh3b0kETAMsBZkbHPQY40uEqaVDQlvJqePomgB5LESD6tioVaOd6nZ9dgloimfC
         M2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762112; x=1788366912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fib2m4ECpynx9J+amS0YrKz2SnFl+TEiiRaglDGDZis=;
        b=UmPS0Jd+X5y2NlIVEKaGoY+1p76VcdYCspxgbvrM8usXo9W8g77OaNY1v2s4SnCFMW
         Pe6z37iAH89MugJXSMbRbuqra7OceeOM7mSXSXPswTiDC4Agox6YUEMFWEtMZ9KVmSnH
         OFJsceTYDNySFmq1fT2i4hWyue3yPGQ2EHEMpfD9hN65LVcSDMPs4cc2FCIbx8fsGnas
         73Sx+TwM5XqXTOQ+Sa+GX8GpXRkAgaaDUfNgPUAntng8y3MPKPZ0Qew1BfYaIF0AHc5j
         7kz/xgrW7zckubQYjg9WpRfMGO8tmUzhFV2hUrrruwNRCnxGYoTjEUJP9PG23poV82C4
         qS0A==
X-Forwarded-Encrypted: i=1; AHgh+RoqJSbiSILLVFCyBcy3Td1HfnHeJtdOE7EbIPN5SWheCCHdOKtWhGAZ/USjEg26k5F/OCVyZl1gNzJ2pKXNyA==@vger.kernel.org
X-Gm-Message-State: AFuF++ll0JkG2mta+1N+0F/4u21PXJlolZTPF5S/u5f6qLB9tVQhOdmc
	gQqUY8p1h0uQCN1QZtFqT8wv+Tw0vWusrlKKmNf5p+PSxRuUI9LEFBAwmntkXfWBtQ==
X-Gm-Gg: AR+sD108u7wgI5ZNqDec1GmxvCIHwyIEiB0LJ7OzAkmybQV6+g72+laFJsREw1O+WhP
	zHYmz3gXKVJ2evATkhNSveeZ7KvLo+pTYTqh8IOjJOQkbZyZZsolN2E/UWnyTd+ashGTk7ogRqt
	c4xPEi2+7mAZgOC5Zdnlsi5rSIQkcLbUGRG+HcU8A5DMI1eDlMSWwtYQIA/YosmkihzgTBeOUhu
	n+PjO9BsRhfJa1HuncrKWt5tmgXXbyh3JAFBpITJNYY24USCbLmOnDol9egl7N5e2FP2RfObz1Z
	Rak62krDgq2Kdnkxt4821S/WvQgxoaEVfNWEsww5T25oV8dqZLserv5a49k5/17BmHJrGAT3t5t
	WBLqlr+FYcJNzppzs2lflGvfUCMQ2qMNN+d5fM4WygiMGOPxTc3TiquEM5tddg7LcKYCXZHu8aZ
	Cj6/AcBh2Tm+n5NNiTKLOoWQXiMWKmsyLOfb+liz7+ZGO/mt1IEMcwQ6HnCOtrzH34Z/MITOMZm
	TC6E45eKkr/y798nKeEccGhLrhl5TGJXjvn
X-Received: by 2002:a05:600c:4e55:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-499dc723fadmr86510025e9.9.1787762112006;
        Wed, 26 Aug 2026 09:35:12 -0700 (PDT)
Received: from axion.fireburn.co.uk ([2a01:4b00:d309:1c00:caf1:6b20:8531:818c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8c75csm31227535e9.2.2026.08.26.09.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 09:35:11 -0700 (PDT)
From: Mike Lothian <mike@fireburn.co.uk>
To: dri-devel@lists.freedesktop.org
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
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v3 6/23] rust: drm: expose HDCP 2.2 message identifiers
Date: Wed, 26 Aug 2026 17:31:37 +0100
Message-ID: <20260826163359.4998-7-mike@fireburn.co.uk>
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

Add a DRM display module with typed identifiers for the standard
HDCP 2.2 protocol messages. Transport drivers can use the canonical
drm_hdcp.h values without reaching into generated bindings.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/kernel/drm/display.rs      |  5 +++
 rust/kernel/drm/display/hdcp.rs | 77 +++++++++++++++++++++++++++++++++
 rust/kernel/drm/mod.rs          |  1 +
 4 files changed, 84 insertions(+)
 create mode 100644 rust/kernel/drm/display.rs
 create mode 100644 rust/kernel/drm/display/hdcp.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 8db7fe00fa1b..ae3017539767 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -34,6 +34,7 @@
 
 #include <linux/acpi.h>
 #include <linux/gpu_buddy.h>
+#include <drm/display/drm_hdcp.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/clients/drm_client_setup.h>
diff --git a/rust/kernel/drm/display.rs b/rust/kernel/drm/display.rs
new file mode 100644
index 000000000000..007ed284c551
--- /dev/null
+++ b/rust/kernel/drm/display.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! DRM display-helper abstractions.
+
+pub mod hdcp;
diff --git a/rust/kernel/drm/display/hdcp.rs b/rust/kernel/drm/display/hdcp.rs
new file mode 100644
index 000000000000..966fb67c6f31
--- /dev/null
+++ b/rust/kernel/drm/display/hdcp.rs
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+
+//! High-bandwidth Digital Content Protection definitions.
+//!
+//! C header: [`include/drm/display/drm_hdcp.h`](srctree/include/drm/display/drm_hdcp.h)
+
+use crate::bindings;
+
+/// Transmitter nonce length.
+pub const RTX_LEN: usize = bindings::HDCP_2_2_RTX_LEN as usize;
+/// Receiver nonce length.
+pub const RRX_LEN: usize = bindings::HDCP_2_2_RRX_LEN as usize;
+/// Receiver RSA modulus length.
+pub const RSA_MODULUS_LEN: usize = bindings::HDCP_2_2_K_PUB_RX_MOD_N_LEN as usize;
+/// Receiver RSA public exponent length.
+pub const RSA_EXPONENT_LEN: usize = bindings::HDCP_2_2_K_PUB_RX_EXP_E_LEN as usize;
+/// Encrypted master-key length.
+pub const ENCRYPTED_MASTER_KEY_LEN: usize = bindings::HDCP_2_2_E_KPUB_KM_LEN as usize;
+/// H-prime verifier length.
+pub const H_PRIME_LEN: usize = bindings::HDCP_2_2_H_PRIME_LEN as usize;
+/// Locality-check nonce length.
+pub const RN_LEN: usize = bindings::HDCP_2_2_RN_LEN as usize;
+/// L-prime verifier length.
+pub const L_PRIME_LEN: usize = bindings::HDCP_2_2_L_PRIME_LEN as usize;
+/// Encrypted session-key length.
+pub const ENCRYPTED_SESSION_KEY_LEN: usize = bindings::HDCP_2_2_E_DKEY_KS_LEN as usize;
+/// Session-key nonce length.
+pub const RIV_LEN: usize = bindings::HDCP_2_2_RIV_LEN as usize;
+/// One half of the repeater V-prime verifier.
+pub const V_PRIME_HALF_LEN: usize = bindings::HDCP_2_2_V_PRIME_HALF_LEN as usize;
+
+/// An HDCP 2.2 protocol message identifier.
+#[derive(Copy, Clone, Debug, Eq, PartialEq)]
+pub struct MessageId(u8);
+
+impl MessageId {
+    /// No message.
+    pub const NULL: Self = Self(bindings::HDCP_2_2_NULL_MSG as u8);
+    /// Authentication and Key Exchange initialization.
+    pub const AKE_INIT: Self = Self(bindings::HDCP_2_2_AKE_INIT as u8);
+    /// Receiver certificate.
+    pub const AKE_SEND_CERT: Self = Self(bindings::HDCP_2_2_AKE_SEND_CERT as u8);
+    /// Encrypted master key for a receiver without stored pairing information.
+    pub const AKE_NO_STORED_KM: Self = Self(bindings::HDCP_2_2_AKE_NO_STORED_KM as u8);
+    /// Encrypted master key and pairing nonce for a paired receiver.
+    pub const AKE_STORED_KM: Self = Self(bindings::HDCP_2_2_AKE_STORED_KM as u8);
+    /// Receiver's H-prime authentication value.
+    pub const AKE_SEND_H_PRIME: Self = Self(bindings::HDCP_2_2_AKE_SEND_HPRIME as u8);
+    /// Receiver pairing information.
+    pub const AKE_SEND_PAIRING_INFO: Self = Self(bindings::HDCP_2_2_AKE_SEND_PAIRING_INFO as u8);
+    /// Locality-check initialization.
+    pub const LC_INIT: Self = Self(bindings::HDCP_2_2_LC_INIT as u8);
+    /// Receiver's L-prime locality-check value.
+    pub const LC_SEND_L_PRIME: Self = Self(bindings::HDCP_2_2_LC_SEND_LPRIME as u8);
+    /// Session-key exchange.
+    pub const SKE_SEND_EKS: Self = Self(bindings::HDCP_2_2_SKE_SEND_EKS as u8);
+    /// Repeater receiver-ID list.
+    pub const REPEATERAUTH_SEND_RECEIVERID_LIST: Self =
+        Self(bindings::HDCP_2_2_REP_SEND_RECVID_LIST as u8);
+    /// Repeater receiver-ID-list acknowledgment.
+    pub const REPEATERAUTH_SEND_ACK: Self = Self(bindings::HDCP_2_2_REP_SEND_ACK as u8);
+    /// Repeater stream-management request.
+    pub const REPEATERAUTH_STREAM_MANAGE: Self = Self(bindings::HDCP_2_2_REP_STREAM_MANAGE as u8);
+    /// Repeater stream-ready response.
+    pub const REPEATERAUTH_STREAM_READY: Self = Self(bindings::HDCP_2_2_REP_STREAM_READY as u8);
+
+    /// Return the wire value.
+    pub const fn as_u8(self) -> u8 {
+        self.0
+    }
+}
+
+impl From<MessageId> for u8 {
+    fn from(value: MessageId) -> Self {
+        value.as_u8()
+    }
+}
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index 786cd9c1ec07..4576d66a6bb6 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -3,6 +3,7 @@
 //! DRM subsystem abstractions.
 
 pub mod device;
+pub mod display;
 pub mod driver;
 pub mod file;
 pub mod fourcc;
