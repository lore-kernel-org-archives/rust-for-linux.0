Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1369D27057D
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Jul 2025 18:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383448; cv=none; b=E+aj7HNu8utkHUCuhdPoJNJ5R4ojLI3qjLgwCiX91W9a7o5Czru7s54VY1PAm3xrVjdUe7BUiI9mZQqvfQH0nWsGiJX4R4WS5YB3TOSr71FkxztlQ/OHiqnY/Io5cC5+kfooJ16cvBn7ozv2+oVYYVSQL4GKeeWmppjjbez9ljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383448; c=relaxed/simple;
	bh=h5hI7HGml92xI3DYQSIePz1ZzE1Vq8x5F4sEEdPFz/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Sx9L5K30QsrDjAGefLQ2UJvLglpfJFc23ufRc7R23UAxgJgIcJ9Y/ws74WvHcapzAvgX2tEThHlFFovsqZWKP0pmCaeOeq2Q0I3P65PVHEnUzoCWIye8uNpxP2XI6CDMukba4qa1pm3NeqvLbZ3y+lKn5DNc13xeC5Wdgt1Z/4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hrs9n22P; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hrs9n22P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753383446;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vggLTsKtvmQ811u+vNiK9glPzjIwTelZUeVe+TVbnL4=;
	b=hrs9n22PwoSF8j0LbQfRw3YMXb3r03GxxRm7swMBrLUxNJIVz2pq3KD2Es20nTIo7hsAeU
	jQvrGsD97LylbPrFmrUoMcZQ0eN3vA4547ImI9HYtZCNwHRTB+md3oDsK9FcVoSekPGkSm
	alQrGyy31B6isMjpEyAt4mHOypjzn/E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-493-G8I2k22bMDyGD1SlaWUEyw-1; Thu,
 24 Jul 2025 14:57:21 -0400
X-MC-Unique: G8I2k22bMDyGD1SlaWUEyw-1
X-Mimecast-MFC-AGG-ID: G8I2k22bMDyGD1SlaWUEyw_1753383439
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20879180034B;
	Thu, 24 Jul 2025 18:57:19 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.88.223])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6E848195608D;
	Thu, 24 Jul 2025 18:57:15 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: rust-for-linux@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-kernel@vger.kernel.org,
	Andreas Hindborg <a.hindborg@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	John Stultz <jstultz@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] rust: time: Implement basic arithmetic operations for Delta
Date: Thu, 24 Jul 2025 14:54:07 -0400
Message-ID: <20250724185700.557505-3-lyude@redhat.com>
In-Reply-To: <20250724185700.557505-1-lyude@redhat.com>
References: <20250724185700.557505-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

While rvkms is only going to be using a few of these, since Deltas are
basically the same as i64 it's easy enough to just implement all of the
basic arithmetic operations for Delta types.

Note that for division and remainders, we currently limit these operations
to CONFIG_64BIT as u64 / u64 and u64 % u64 is not supported on all 32 bit
platforms natively. The correct solution we want to aim for here in the
future is to use the kernel's math library for performing these operations
so they're emulated on 32 bit platforms.

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/time.rs | 86 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index ac5cab62070c6..8ece5a5d5a11b 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -251,6 +251,92 @@ pub struct Delta {
     nanos: i64,
 }
 
+impl ops::Add for Delta {
+    type Output = Self;
+
+    fn add(self, rhs: Self) -> Self {
+        Self {
+            nanos: self.nanos + rhs.nanos,
+        }
+    }
+}
+
+impl ops::AddAssign for Delta {
+    fn add_assign(&mut self, rhs: Self) {
+        self.nanos += rhs.nanos;
+    }
+}
+
+impl ops::Sub for Delta {
+    type Output = Self;
+
+    fn sub(self, rhs: Self) -> Self::Output {
+        Self {
+            nanos: self.nanos - rhs.nanos,
+        }
+    }
+}
+
+impl ops::SubAssign for Delta {
+    fn sub_assign(&mut self, rhs: Self) {
+        self.nanos -= rhs.nanos;
+    }
+}
+
+impl ops::Mul for Delta {
+    type Output = Self;
+
+    fn mul(self, rhs: Self) -> Self::Output {
+        Self {
+            nanos: self.nanos * rhs.nanos,
+        }
+    }
+}
+
+impl ops::MulAssign for Delta {
+    fn mul_assign(&mut self, rhs: Self) {
+        self.nanos *= rhs.nanos;
+    }
+}
+
+// TODO: When we get support for u64/u64 division and remainders helpers remove this, until then
+// these ops only work on 64bit platforms.
+#[cfg(CONFIG_64BIT)]
+impl ops::Div for Delta {
+    type Output = Self;
+
+    fn div(self, rhs: Self) -> Self::Output {
+        Self {
+            nanos: self.nanos / rhs.nanos,
+        }
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl ops::DivAssign for Delta {
+    fn div_assign(&mut self, rhs: Self) {
+        self.nanos /= rhs.nanos;
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl ops::Rem for Delta {
+    type Output = Self;
+
+    fn rem(self, rhs: Self) -> Self::Output {
+        Self {
+            nanos: self.nanos % rhs.nanos,
+        }
+    }
+}
+
+#[cfg(CONFIG_64BIT)]
+impl ops::RemAssign for Delta {
+    fn rem_assign(&mut self, rhs: Self) {
+        self.nanos %= rhs.nanos;
+    }
+}
+
 impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { nanos: 0 };
-- 
2.50.0

