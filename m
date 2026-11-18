Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974387;
	b=YHIbE+wcxWQwttt+6j51pwq5rCHaWjljdWtRSH8lavLCeURhYXyJcYTU/WOPL9BT06sI
	 LR4t5LHWM3xbCQ4lQhCXQ404mQt2jdvmKuHRz1tHEmi4OIcMqcCp1YAojfpyjcOCDP0Ca
	 lqXtQf8phGA121jgCIugM3mi2oHkYSZoNWb3KI3/ZVPQ0Z8KO5QtUm5SadiJRv7gebTJa
	 P0T9ey06LmqQ90x0ROP/b0uqEfRev0jp5X6gRz91KDtlA9jWqi0qj9bS6MTYwtfhP9+eN
	 q0sXbJWPeW/pamTn8nWdE3MQjIsyyiE6+vSyvP/AhnMb5LR0Wc57tI/KlNUpQbJUOPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974387;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=To8dBNHSQXCgtFljQBQa3HiNdIIE2PU2SiFVazSeS0M=;
	b=C4bAHWhGLfeSZv8t+0tn1ekGzyrA2uQmIZz/d3TQOhEli4YFXt+3j4JOiA3AzWU4hABi
	 ZpwvRzT6BGGDW68/DkusJrnEnoyhMReOKNVEYNoRztlnln1znj7EShP85l/vFOtpnD+3q
	 EKVq2pB0OQSpu10L4BmtLOxZdzfHOwXONTGK57y9gpMo+ecTDl1zEqhKQ/i+s1Zd/lZqM
	 Naa6YKHH2/YUrfDC/icDjtbV1xiBVCk2tMQb5Pe/YauDjupZCZtw6NaOyjicJuJoljvxb
	 fFePhlqXBPkT5s4M/OQJc6Gfwhw6evRcfHszAkXlRkt13k1JjRUtPf30ZWQETGDdjqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=LaepfhCx;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vggEvyXQ;
	arc=none smtp.remote-ip=103.168.172.144
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EF8606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 03:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EF8606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=LaepfhCx;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=vggEvyXQ
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id C3F69EC08F3
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 22:59:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-12.internal (MEProxy); Tue, 17 Nov 2026 22:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1794974385; x=
	1795060785; bh=To8dBNHSQXCgtFljQBQa3HiNdIIE2PU2SiFVazSeS0M=; b=L
	aepfhCx4z+wa2harp1xWvPJnJUy7piQeOHmEeXK5IL1P8plKovs5FxCp+4EPfdzP
	23ahfKk8bvMW1Q+OAddAQ3XwnjfQsfUZHePWTj2ikppYR1Lb+x775TN2R+yRkrMo
	wI3P9pPwhQtLEu37NQpYVvNvaahdVaCymnKFbN4xyrvkI5St9iXbZCO9j8V8vNBt
	bah60tc2MELZjxdCafsZyUfCEJ5MdEbTSOWiIEX6O8RR1p8OjIgyMQlB8TFBcQNw
	pdqC0FJJ1FA3erX2X/xL/rPfloHSdzUdpYZW5pFgMtKsCF+Zn2lBcVy6SiS8wYB2
	QBMP9fpZ6z838T1wSTthA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794974385; x=1795060785; bh=T
	o8dBNHSQXCgtFljQBQa3HiNdIIE2PU2SiFVazSeS0M=; b=vggEvyXQ2r2KY+edY
	3nReJFAJ7LjvV1+k7F/J8cLmjloTA6hQcJYPyDoSG1F/teVa3jMBpOMCLB2dQouV
	jqGMleEK3CJkn33mMJsJW2LadJIw4vKWn1Txy8baPTjHl5963eDaaoh2NlZBQVfF
	8iRd1wNCyZV1j6CgZSn6tn85Q3bAn3EpKvFV7Ccyw5v8pYsZ+yIDUvFmlJTedWhn
	PyuCF83TYrNxmP6Y3wNknWiaol99gBPy35EUJ90pmUSIXHARZ17la9xgEwKte0hg
	DsdzrhKueXPts40iHleys1jYGnRdV/9Fq77be14YB5G8VJBo/cGt5rR5JNtzu4XY
	vnmSg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794974385; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:atUSv+ojUs8IKsbvQQjsJCkazXwEOqhKFhzrBgbEi5Ddgf9
	9KXCa0NfPh85Zrp+L9QBgOx5/aVyoJT5q2PoK+sRH0Dhc2kaokmlTe7snMIyjrkE
	jw/tORM7lGkDv/OEGNCIAnGHON4kVbGrMhhpT38MVk54m8rC0PfKxZCiXxi13WEm
	YeDbGzJUTuX0oqcLCsKG+xXYhh8n/X3d12gNX42PBFRziFYNgeINwJBK1xgochDX
	Un8IZeWIRzMjEmCBkGF3awSQYkxYj/amy6HCi/QdGlH3B2D/BVdKOXZxJxWawlzn
	x5I1Z+fGdhgYFtq2NplpPYbytQrXSSl7BEPCfGQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:JuLKAqqlxn2WBbpeTgppEL1c+lc0VTG1JqpM2AQOlug=:LHlUJa6oduRIQL221ZFaRD6e7j3tmPbxhiqCYSkmOIw=;
X-ME-Sender: <xms:sSL9aq0AKFHmmndUwQcseMJEzHY9_RgD_NsoJCr_wkhTMe_ymM0sjw>
    <xme:sSL9ao8GIwBiQxWocUKdpCHLxkNuzXO_-KWOe86aV1dwQ4pTSoiSxtOHcg3uzSRwB
    XjEU7lyFs3XhqqEFLxIjsGhPZ0i3GFSJFlWO0nb1EqFzbgSyiSxYI0O>
X-ME-Received: <xmr:sSL9auYrtp14AhaKOJ3ul0QTG3b2fiwupl2vasRl8FiUZJqA3dFWoU3f-NVe_tPTVITCULgwTz-bA4e-l2Y>
X-ME-Proxy-Cause: dmFkZTGNuUNLuU7Pu6rh5IU169+6hzvjVpdTChBuf5wIDbq7LDIdzE+38X99mwHspETxCr
    UEI4DjNke4I+Tpbt/QcYvbUp+GFbE9FK+GCL/zqS+g7kFLtY/zzcAs+aDOVnyb5Kd9Z7LE
    T6y7YVqW4XD9Ic/AjwYWm18JUdJBgAS0tBJ4OFGii7oiEh8XOjXpHEyhXL4irLLCE28x73
    Irh4An0BV732sK60nJrxqV0CDAwno5OPA+dHqCBTLYoE9we7gioosxG6lVriqbOcslUiip
    MyDprtX4D9RjCIaBbutmqrf5Kc5Nao8uy6mBDtjyZNWRSGDYMevstBaqza60gicMak/8WA
    pl96U9XYPmlOEcnclB9TygG/9qyc7Y4wTDJvzUbbok+XJcUJ9ct6w3q39NAVYCjhWjyfny
    DqPMclv8IqY1KAGM3aP7ajYSQPpSe1iiwRhbrQqMMUaf45tihzcKltfte5oDGnuBsBax8d
    VDz9N8Xx6rRiXUJdiGk/W12p6Ravcl88TgWn6smBFEGXn0zeC2sHB8Iwh5FUPIYi3IITZk
    GJ9yZnDejZlBD+QOFYq0GBx8aeDYQEmRq2D7GW7r7/IcGEFSFuyL1rJCzoEp0PYaq7lYAr
    FVwvkbPHW604cWPHYj8t+PBtbQsrSLhOMq8o1o11/HTkWpjC3qQn1TI86HRg
X-ME-Proxy: <xmx:sSL9avw-fBFtZFzrTYiAks8rA-UrqUElJ7VwODVpQrXuaOV91oRL0w>
    <xmx:sSL9ak_yOCavpZfk2LvgdXEVRaEVsWSn4K8SZpQjO-av-jUYTVaehw>
    <xmx:sSL9ajy8IRMFNn9oreDcFMqlGcBK4RsK7TalsglQnoHgxqeDgD2t8w>
    <xmx:sSL9ahsvlQ1hWYv8OI5_hr0Nv886GxyKYEB9K904Iu11Bjfr1Z60oQ>
    <xmx:sSL9aqQbdNlQ8KUmZn6aMxzipD536bYM5StBbKD4Ez3kU7ZMoYatAfQm>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 22:59:41 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	lossin@kernel.org,
	lyude@redhat.com,
	sboyd@kernel.org,
	tamird@kernel.org,
	tglx@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 2/2] rust: time: add KUnit tests for Delta boundaries
Date: Wed, 18 Nov 2026 12:57:23 +0900
Message-ID: <20261118035723.2380960-3-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118035723.2380960-1-tomo@flapping.org>
References: <20261118035723.2380960-1-tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add KUnit tests for the boundary values of from_micros(),
from_millis(), from_secs(), as_micros_ceil() and as_millis_ceil().

The boundary values are defined as constants in the test module, so
they are not part of the API.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 63 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index f0e36077bb4a..a5d1d011c077 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -846,6 +846,69 @@ pub fn rem_nanos(self, divisor: i32) -> Self {
 mod tests {
     use super::*;
 
+    // The largest values that `Delta::from_micros()`, `Delta::from_millis()` and
+    // `Delta::from_secs()` convert without saturation.
+    const MAX_MICROS: i64 = 9_223_372_036_854_775;
+    const MAX_MILLIS: i64 = 9_223_372_036_854;
+    const MAX_SECS: i64 = 9_223_372_036;
+
+    #[test]
+    fn from_micros_saturates() {
+        assert_eq!(
+            Delta::from_micros(MAX_MICROS).as_nanos(),
+            MAX_MICROS * NSEC_PER_USEC
+        );
+        assert_eq!(Delta::from_micros(MAX_MICROS + 1).as_nanos(), i64::MAX);
+
+        assert_eq!(
+            Delta::from_micros(-MAX_MICROS).as_nanos(),
+            -MAX_MICROS * NSEC_PER_USEC
+        );
+        assert_eq!(Delta::from_micros(-MAX_MICROS - 1).as_nanos(), i64::MIN);
+    }
+
+    #[test]
+    fn from_millis_saturates() {
+        assert_eq!(
+            Delta::from_millis(MAX_MILLIS).as_nanos(),
+            MAX_MILLIS * NSEC_PER_MSEC
+        );
+        assert_eq!(Delta::from_millis(MAX_MILLIS + 1).as_nanos(), i64::MAX);
+
+        assert_eq!(
+            Delta::from_millis(-MAX_MILLIS).as_nanos(),
+            -MAX_MILLIS * NSEC_PER_MSEC
+        );
+        assert_eq!(Delta::from_millis(-MAX_MILLIS - 1).as_nanos(), i64::MIN);
+    }
+
+    #[test]
+    fn from_secs_saturates() {
+        assert_eq!(
+            Delta::from_secs(MAX_SECS).as_nanos(),
+            MAX_SECS * NSEC_PER_SEC
+        );
+        assert_eq!(Delta::from_secs(MAX_SECS + 1).as_nanos(), i64::MAX);
+
+        assert_eq!(
+            Delta::from_secs(-MAX_SECS).as_nanos(),
+            -MAX_SECS * NSEC_PER_SEC
+        );
+        assert_eq!(Delta::from_secs(-MAX_SECS - 1).as_nanos(), i64::MIN);
+    }
+
+    #[test]
+    fn as_micros_ceil_handles_extremes() {
+        assert_eq!(Delta::from_nanos(i64::MAX).as_micros_ceil(), MAX_MICROS + 1);
+        assert_eq!(Delta::from_nanos(i64::MIN).as_micros_ceil(), -MAX_MICROS);
+    }
+
+    #[test]
+    fn as_millis_ceil_handles_extremes() {
+        assert_eq!(Delta::from_nanos(i64::MAX).as_millis_ceil(), MAX_MILLIS + 1);
+        assert_eq!(Delta::from_nanos(i64::MIN).as_millis_ceil(), -MAX_MILLIS);
+    }
+
     #[test]
     fn to_jiffies_timeout_converts() {
         const HZ: isize = bindings::HZ as isize;
-- 
2.43.0

