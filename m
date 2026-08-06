Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAFE64A35
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001611; cv=none; b=SamKJDAychBoLPS4scrf54YsoLPFxZ7gz1CjqK1iuPFKMZaqdsJubWFIQmlEtuNL7RMvxhTufw68+E46RLGqZkiNkIshs110zrAIlKC7WFmzMUxOcWrg0qcsMqQ1GQw0vMM+j923rYbARaEWyg8W6TdcJALavnfOcZNJIh9Ij4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001611; c=relaxed/simple;
	bh=800OsD9JJBNp5Wc9vvPGwL/Z5l/OPAhrqYEyDw5tpjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIXtxFvslgLLWJ3ZGQzqaUkTc2BnD0qKuKLX9ewtVfCSGgPuW46gzA96i92+WKX7THOLeLvAEAvDaUl3+JfnNT/ukS456gG24TxOExQzx1qCG7xmfTTWy7HzlyghyGRYCmJqNMOkWcK/HkN/bYCeEFJbgO4C4ci6MvbEfm5wctE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=MmJ5mhel; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iO0e9F0E; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="MmJ5mhel";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iO0e9F0E"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id CC9311380231;
	Thu,  6 Aug 2026 03:33:28 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 06 Aug 2026 03:33:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786001608; x=
	1786005208; bh=GEwCe7d+3zLVuXZ4HwA54l0YvfCnGUdA/UC+VnQEOvY=; b=M
	mJ5mhelS1dE2prHMPM3OeXbyi6l8WNBG03gqGzqh/PbnajtLXo7SAP10W1LUz0yq
	vEecVYoQntamwKB94gvSGZzdv/aMAnS+h4uRCYWMkh0vYtzEoJQlL7I03mR6bnuM
	I3JM+XADnBab2xhEjbUxQn5KHbBb117D7VMOasVgVCgUY1TQrYROLJRopEBIOyfO
	baVxTavyPk8kqfNoqm+q5t6MnPTO71oXlZHJUvpyp2AJznuFTPxDTEQnk13P+PQ/
	VUD5HhfJ8lNn2CWP+TzPFZ2vrHJntj6ZaRIG79Uaiombeql7UG7A78ml9Wo2W8qK
	pf2EM9w3rPUGPMFDHvxzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786001608; x=1786005208; bh=G
	EwCe7d+3zLVuXZ4HwA54l0YvfCnGUdA/UC+VnQEOvY=; b=iO0e9F0E1oF4iyLfJ
	UD029r9DClnkOhNOSVlIYAWkvLEgFtL0+opEpYHwvYOLoQB8XiF2bfktT9VJnoM6
	/KI0gBhjUJl+xwWuhhv9pI7okqsdOSgHevS2gC5NIOztINsaarn8sS0n0mDC7tGd
	f40YjYAupVmQWoID2nBWrPaZOsPjaONtuwf3CeuHTIy+cLUjYO5X6bhYVIDFQa16
	OhrdIcOYIGlCU47ZPESYd7g0ZOFWlUUXAP9qLIlpXP8o8BujeAXlK3v02Bg4xr7d
	3GOUaZu5UsZHUJ1TDekx38GrMFjv/arq0BIIA+XpW99wBV5mMR0uz1bCC7ige3vZ
	bRZWA==
X-ME-Sender: <xms:yDh0akT_N8G9oYlZzrKPqmLgIXrSIgJ3ECh8nbisoMKtTDP8FcDMbQ>
    <xme:yDh0at72gDdBJaQKGtgIaQKSqWZjuxqPePyNEK_mZZ37pSqwV6Q7TnuknywpxK3e3
    Orp3PG7fnwRlHM00mYST_bJct5dCRx1dYlwnzEipmleSt0ajvrnGgQ>
X-ME-Received: <xmr:yDh0atrcpsDxzH7DissAi97pIxs3TyWfjhMJu-kpcSmfWzturRuuPnEmOpll3uOsg_Mp16QRSIEeOABzNMQ>
X-ME-Proxy-Cause: dmFkZTEgjQqBj2bjEymb1zbMZpPNtcgeFkIN1QZzQbxZUKA/RuRyg2DJgajv+NSiGStCeT
    yaYOrCQ7A9gm4WvsiYs1D5t6pPIrllqTbL1Ixlpbf00exSovWm+XcO2G2nbZr0gIMU9T5H
    LqUZEZ7mYO5L/yzE2XzC75M8q4ggUCox/oKRet71npKs8JL7T6FFF0IbK70RPW0nQUZLVJ
    G9VXR8Ti169JZ3zIVViQPK2ghSiO6EeNfHPs6UrpsWSoqkR8yv6qZOHEJ6g0y9pV5MgB8E
    MAD3aacXBW0NxzgaSjqINGlK1Su9gqkNfLS2YhXVvxpfxNqUzyd441y62Y4/nFeExS7hrt
    KPSozSkZ5tU7x54eWnipQMdR8mblrbds2d2OxeCjKXkMsnPAm8m9ZiT+STGI9Zo45QcDlj
    g2SeRLlFHdv11djjY2pngc3WTFd/Y8QRQg5c7y3DNZl5J2hE4Im4gekqz8ImbYGHfamAUa
    uUruuSx/Yb+IObZM7VShimN/qLRsegr5b4q1qgQskuOHuCi7mio9oNvFwtsDAIHpNIS8Dn
    8BxGenJnmyuNzwdTathBpEiWmOSPMUMPUmQGPE5aRbepVywXSijqNoRIWwNByEOqHP0dFV
    rqyrCJExIf9zZZmUkmq4+WEnaZbGEfVBxU/WUsmJN53eqRAIs/BvNW1w/05w
X-ME-Proxy: <xmx:yDh0ahWAzCmju2_SPU0UEgc5EMN_L8hxnxiDrU-UWVhIyMkEojhv0A>
    <xmx:yDh0atoXgM0dU23h3Ujg3p90kgsnIac9ZhME9VOiVvzLYgSXwB_Lyg>
    <xmx:yDh0aov5XveQ5ZtQR05llRIZoQyUyPDf6sE5CdVCoq4ngwXLaCjxbw>
    <xmx:yDh0ajR_M0LkPew0wjrTKZWm-Pvkg5D5WNcSnSdjWUFoW5FVa3nj2Q>
    <xmx:yDh0alVTavbYKqvUJjg-2EBHmmxy12q_wEU9JZWTzUi0tIjjRw0WCjQL>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:33:23 -0400 (EDT)
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
Subject: [PATCH v5 4/7] rust: time: add Delta::to_jiffies() for timeout conversion
Date: Thu,  6 Aug 2026 16:32:38 +0900
Message-ID: <20260806073241.1024319-5-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806073241.1024319-1-tomo@flapping.org>
References: <20260806073241.1024319-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add Delta<Nsec>::to_jiffies() conversion that rounds up so the
resulting timeout is never shorter than the requested span, clamps a
negative span to an immediate timeout, and saturates an overlong span
to the kernel's MAX_JIFFY_OFFSET "wait forever" value.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 9d65a6c1992a..5844ee985a7b 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -551,6 +551,27 @@ pub fn as_millis_ceil(self) -> i64 {
         }
     }
 
+    /// Convert this span to a [`Delta<Jiffy>`] suitable for use as a timeout.
+    ///
+    /// The value is rounded up to the next whole jiffy, so the resulting
+    /// timeout is never shorter than `self` (as `msecs_to_jiffies()` does).
+    /// A negative span clamps to zero jiffies (an immediate timeout).
+    #[inline]
+    pub fn to_jiffies(self) -> Delta<Jiffy> {
+        let msecs = self.as_millis_ceil();
+
+        // CAST: `msecs` is clamped to `0..=c_uint::MAX`, so it is non-negative and
+        // fits in `c_uint`.
+        let msecs = msecs.clamp(0, i64::from(crate::ffi::c_uint::MAX)) as crate::ffi::c_uint;
+
+        // SAFETY: `__msecs_to_jiffies()` is always safe to call.
+        let jiffies = unsafe { bindings::__msecs_to_jiffies(msecs) };
+
+        // CAST: `__msecs_to_jiffies()` returns a value in `0..=MAX_JIFFY_OFFSET`, i.e.
+        // `((LONG_MAX >> 1) - 1)`, which is non-negative and well within `isize`.
+        Delta::<Jiffy>::from_jiffies(jiffies as isize)
+    }
+
     /// Return `self % dividend` where `dividend` is in nanoseconds.
     ///
     /// The kernel doesn't have any emulation for `s64 % s64` on 32 bit platforms, so this is
-- 
2.43.0

