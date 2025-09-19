Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12C30CB45
	for <rust-for-linux@vger.kernel.org>; Fri, 19 Sep 2025 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758280899; cv=none; b=EIVsf/w96xofOdebHiIRKfjWXvzchhKMs6IItuL99ndaXotmP2v+/0XqiVdcHci7xqv2GsNAkYenbRn1gc1EuC/hURgytxiCITlLFeQb9Apxv8o+dH0BHWvE2lX/+Rvu2WcCinNUwe4Jjo83Y3pSwe4B95w79lwtaJtrJymIKs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758280899; c=relaxed/simple;
	bh=A4xG/hhI5H20xjSK3ATLZhg7mH6LCnkDNDxdK8t8kEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qqy0YkIGelO1lnjlEjeQm3bP/m1LtuOKzDT0ruOFj4em1N5iCqp0BncuUgImXSKLT1lwvyYzaorwJinO6bydLCmC0v08pfFso05XjnvLQ3+cl4XcMWSOsyVuLPo/4BaBK1Umk7pxwHoPYgJf0YvGkN79wxv+c7P9MzhwCam1wQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=V7a53qq+; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="V7a53qq+"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758280881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1RTqmv+1E+QFMuOy+5mQ8UkGVboO7NXJZS9ix522hHQ=;
	b=V7a53qq+yTQMa5IzHR4f9+NvU9KCOuXDiGJR8s5Wd5SK8nAmqVT0JdlJZX2oLWyeycOORD
	ZHDl9GwKZN8UVSjF1Bhg8VQ4WWgfspa9jbNH2ath3vpEalhG5TPcj9HCsigRwk7vdV1gWy
	ZtsXEAC/N1ipmDsl3Nc/1MMv8pHl6yg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] rust: net::phy inline if expressions to improve read_status
Date: Fri, 19 Sep 2025 13:20:08 +0200
Message-ID: <20250919112007.940061-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Inline the if expressions for dev.set_speed() and dev.set_duplex() to
improve read_status(). This ensures dev.set_speed() is called only once
and allows us to remove the local variable 'duplex'.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/net/phy/ax88796b_rust.rs | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/ax88796b_rust.rs b/drivers/net/phy/ax88796b_rust.rs
index bc73ebccc2aa..2dfd37936689 100644
--- a/drivers/net/phy/ax88796b_rust.rs
+++ b/drivers/net/phy/ax88796b_rust.rs
@@ -56,18 +56,17 @@ fn read_status(dev: &mut phy::Device) -> Result<u16> {
         // linkmode so use MII_BMCR as default values.
         let ret = dev.read(C22::BMCR)?;
 
-        if ret & BMCR_SPEED100 != 0 {
-            dev.set_speed(uapi::SPEED_100);
+        dev.set_speed(if ret & BMCR_SPEED100 != 0 {
+            uapi::SPEED_100
         } else {
-            dev.set_speed(uapi::SPEED_10);
-        }
+            uapi::SPEED_10
+        });
 
-        let duplex = if ret & BMCR_FULLDPLX != 0 {
+        dev.set_duplex(if ret & BMCR_FULLDPLX != 0 {
             phy::DuplexMode::Full
         } else {
             phy::DuplexMode::Half
-        };
-        dev.set_duplex(duplex);
+        });
 
         dev.genphy_read_lpa()?;
 
-- 
2.51.0

