Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA89727B4FA;
	Fri, 23 Jan 2026 17:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769191167; cv=none; b=lqRWeWwx8ctOE6Je8o22Lgqa/wcgDl5rs1lEcbg6rQQterXLqsmSK1+hkOefWIAvP2R59kijgNACcWgxGltugaBbfExvd3cK0zCYTFNLQ3G5fBj85QEFj1GLk6+LEr4mRSbYoFF77b/SLgoWRhfJ76vAGC9MdwA8wktw+xF//QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769191167; c=relaxed/simple;
	bh=M+DDYxzSboI/nCfuiIxMEG2aQdWdI4Cb1BK/huw6zSc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eI68/XCvnjY/RHMwdVtikw95JTJuDGc/FFWwB7cwvlxm5mmqC9+NsW1qnlwSGaqEJoVYVGI/uxcH0GIVfIFq832RHXJodLMN7OU7FgFWuj4HJkziu06tNzPI6BXfzTvDXS4VWcx2u4YZO1n2st06znCGoR+ulvu+l/uNiRuleHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ihyEvXZR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ihyEvXZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D38D9C19421;
	Fri, 23 Jan 2026 17:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769191167;
	bh=M+DDYxzSboI/nCfuiIxMEG2aQdWdI4Cb1BK/huw6zSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=ihyEvXZR1SGbYkINb7YmlT2YH+Q+JeC34cBcCKNodEaaSuxzIZDPDS7hpMMYUhmXk
	 6fTUx92hkOZS1m9NbyDavctIhKBQlzCho+PrUv8eiqmhxFMq2RgJ20Yihjij9YKg/Z
	 6yohP46EuSCdy6B/jyNgbp1B+F+gA6AYxFx7Rgg2LQ8XeLFhGMLhAPgV2K6I9SKViq
	 P3W1xlB6mVi48m3FRfA7QplaX56GIPUu3S2VQYbCN5YRp2svo3BFaCwvnq92HL8GgJ
	 nDq/xbFr2GjQDwBDok44DZs1he+Z+6Rl4QsyyzARPJhzKxP/UwkutYsd5pYe9v9oZt
	 QSYWNhknuZhjA==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] rust: samples: usb: remove redundant `.as_ref()` for `dev_*` print
Date: Fri, 23 Jan 2026 17:58:43 +0000
Message-ID: <20260123175854.176735-6-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260123175854.176735-1-gary@kernel.org>
References: <20260123175854.176735-1-gary@kernel.org>
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

This is now handled by the macro itself.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 samples/rust/rust_driver_usb.rs | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_driver_usb.rs b/samples/rust/rust_driver_usb.rs
index ab72e99e1274..1da02fba3d09 100644
--- a/samples/rust/rust_driver_usb.rs
+++ b/samples/rust/rust_driver_usb.rs
@@ -33,15 +33,13 @@ fn probe(
         _id: &usb::DeviceId,
         _info: &Self::IdInfo,
     ) -> impl PinInit<Self, Error> {
-        let dev: &device::Device<Core> = intf.as_ref();
-        dev_info!(dev, "Rust USB driver sample probed\n");
+        dev_info!(intf, "Rust USB driver sample probed\n");
 
         Ok(Self { _intf: intf.into() })
     }
 
     fn disconnect(intf: &usb::Interface<Core>, _data: Pin<&Self>) {
-        let dev: &device::Device<Core> = intf.as_ref();
-        dev_info!(dev, "Rust USB driver sample disconnected\n");
+        dev_info!(intf, "Rust USB driver sample disconnected\n");
     }
 }
 
-- 
2.51.2

