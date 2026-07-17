Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6957E3644A0
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262205; cv=none; b=btNQ0KUcT2tGMCAC7CKery5uhUbyEot6xvw+JOulPZXgUtOSx+0HnNIpAY8UbXcoxbOceK9PItHG3mz3SkUEhCvp7oGF0S3rOIuF7Akr8S3Rcwuw1wut8qVr2YuomdQBgsOTSf1EsLsGthiqKbJYxEKu7QE4ilrmFLHTEHPcZBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262205; c=relaxed/simple;
	bh=7X8P+YI31Wk0kyKwopciMEQGF8VasRfODoQeFYe1WBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W8XRa9RmwKJHKdHRroC0/i9VT+bHl5+uMFY9wfuPeF17s82IBKz0tL0vYsl5OikuvwSZIte2PKIAZ1KlaoON8DjZhxzc0gKk+toqxzCtubj8VSl3W2BsN766xW+psxNJSzFowyJireQF1Ukf+W2viEsS6DePrO/+rlaKjo02xII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Eco6Xkg1; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=rFkdGgSy; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Eco6Xkg1";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="rFkdGgSy"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 8EAAE138003A;
	Fri, 17 Jul 2026 00:23:23 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 17 Jul 2026 00:23:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784262203; x=
	1784265803; bh=dd5OAN/JiyKBc7f/NPGaW74lfYTVM9tVtfjBXACuPik=; b=E
	co6Xkg1kaflsufa43l8tI8xhB/qPzgFgz48c4ut2+d8seXQR7OZNDvul4c112omF
	1c+XTLcBocJPVOD56H6ndlIi3PGSO0sjgTbjEEEpe4lnCutQJ6Waf7r1MtimUycQ
	1zcjH59zwO0udOuA6LFUxcdHs5ZBmEtXtGY3+TzhIhJHi6ml09bn7ryiyM9faSSA
	J+e3sncOtTXSB/jGD43N5DHEQMwNungBdWBeyERwkq9w8W1d/RI3Pkk1HT2Yrk+V
	4Khf67LTFWn/164+0Byuk3SS/kuPrKCFCXEpHskProAURiCXRE82DzS5GQIzrFVq
	+YBNsjojZNyGlYGZbjb3Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784262203; x=1784265803; bh=d
	d5OAN/JiyKBc7f/NPGaW74lfYTVM9tVtfjBXACuPik=; b=rFkdGgSyscJLtsED3
	gRpIuDCEWyguR+dOyJCjcIfMH8o2tcsrERyPQRCC8zFwkRFqeFiBkn9SfDxRVbsQ
	4yij6LdLdpvK/RanKrM0XMK6A9t6nQklQwadeTGMNDtmeN6OiJIe5auS5id0XhkM
	gx1AXcuubjZQBVqKbM189RblU6rQyh043ZGQeF4d8kKGRVT7CywYMAHLgW5D94uj
	+ScSfADSlMNHNZVmMqDqX2tYGXOqDtwzgko3iTelkck+EWK3PtwWhZ3Cp7UM1THa
	p+n83t2ap4SZe/D1KlZEMVuux8xeY+uLx9W6K9wf6ldXjzTLePr/Lg/c/FgpXH/Q
	//QLw==
X-ME-Sender: <xms:O65ZakwBNeIpgLdLkA2oRnduLUDbf3H1yDIxdcA_rFL4iAS1-YzADw>
    <xme:O65ZakYEbmI5SWxWN8PrwL3YRVOWNXv4fTF9MFq808_96TZB_pqWRmrr8aNfr5le-
    EbYblK6MatMon3I_M8uljNvz_Fzqs1z57M1nhAy8HNLZBtd6N5z6yU>
X-ME-Received: <xmr:O65ZaiICgY26DeO9o4Gz1TPUqtHOuB72eVj5VQGXW0eSXdRdsISGi0lBu4Oc-vwt-2AEpXP3i2QF76RYrE0>
X-ME-Proxy-Cause: dmFkZTFarMiH/F+4IFI5p2SfEmWtawG+ARfypxaffkGsFNHLft9LqR3SzCuysNItlYHGOs
    c96d+Yzcb+FIDQj/nCQUW81kCXen+f9GdsHWbdWhZbP6Wp4h1TfUyUNmq20NtxqiHVnJ6x
    svsqDZjWvkAAxgoTtCU2cY28p67n6RgKPQcXSTqC9JRFX3piH19/A0tXSluF0FqQSZQFnX
    OtpZblCZh/svsVd+Xm8gYTILVqY6QvtpCpwEF4IvDE4Vv//kC9tv6PXx9VdAp1ziHu0WMa
    zfWnm2FOLKpDckCKYB9fvHeeT50FODeUVOtXU4MKN3s14YzC2dHUXkR45PFuVXVBU13esw
    uq3wRWCciaiuCxalTzexEPxldVnCgUswit7SxzPIniB41eKbjHJ6i67Jg/OidgqvalizcS
    tBSmswLu7XEPfj8sRVmkXXSP5wzMQz83TOD1SSQVafEpY3bR7eKVAHX1c0Wdf1xQC/uwuj
    tw/BURXq+CaXpxU0cdTZmAy7TkaL7F732imji267KGLPYB7aJqUPPXigM/o2f0Zn6474Da
    kdlYnuDmzagvvpH6ouYhtHcAvLSJPz1yR3Nzp2Jhd+D/AuQkhl2I8oZiIG1WPc6XoTfMcF
    mgPtP7jBaj4V9d4ipLY6n4kSP9Hrm/hIjeLyyDJghUnP2b81Io9rDTsfB+lQ
X-ME-Proxy: <xmx:O65Zar0PjS7sjMCtj0FEoUo6B87CTiyxNXLbMTA4hvNlcDKOJMLaHA>
    <xmx:O65ZamIybvPRjNPFVvPnmnlAxPfKWQYC239WLNWqQmQ7Kupv6S-rtQ>
    <xmx:O65ZanN19m7jNCxbCSyAOoMibK2EVvF72X3UE56DeZOke2BL4bn6AQ>
    <xmx:O65Zavyw5bCrSz_c8tPETTsqJGsszTAQFGMpxmd4Ije_YtRTBp9nrA>
    <xmx:O65Zan1YYEBYnOx1DOd_8EJyZYRsLSnOhNci9AGzNPJZpekZ67Vxr42Y>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 00:23:17 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	aliceryhl@google.com,
	arve@android.com,
	boqun@kernel.org,
	brauner@kernel.org,
	cmllamas@google.com,
	gary@garyguo.net,
	gregkh@linuxfoundation.org,
	ojeda@kernel.org,
	tkjos@android.com
Cc: acourbot@nvidia.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	frederic@kernel.org,
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
Subject: [PATCH v3 1/2] rust: time: add Delta::as_millis_ceil()
Date: Fri, 17 Jul 2026 13:22:46 +0900
Message-ID: <20260717042247.3634961-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717042247.3634961-1-tomo@flapping.org>
References: <20260717042247.3634961-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a ceiling variant, mirroring the existing as_micros_ceil() since
the existing as_millis() truncates towards zero.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 363e93cbb139..23ef5c77383f 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -468,6 +468,29 @@ pub fn as_millis(self) -> i64 {
         }
     }
 
+    /// Return the smallest number of milliseconds greater than or equal
+    /// to the value in the [`Delta`].
+    #[inline]
+    pub fn as_millis_ceil(self) -> i64 {
+        let n = self.as_nanos();
+        let n = if n > 0 {
+            n.saturating_add(NSEC_PER_MSEC - 1)
+        } else {
+            n
+        };
+
+        #[cfg(CONFIG_64BIT)]
+        {
+            n / NSEC_PER_MSEC
+        }
+
+        #[cfg(not(CONFIG_64BIT))]
+        // SAFETY: It is always safe to call `ktime_to_ms()` with any value.
+        unsafe {
+            bindings::ktime_to_ms(n)
+        }
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-- 
2.43.0

