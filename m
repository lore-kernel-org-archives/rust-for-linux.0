Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BBE470EBC
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757105; cv=none; b=XENHAc168YupvrWMZEgzorwqQ4j411+PY4wDbeuG9qQPwUnW9JpbQs8rrBWh832Ry8sVMEaQECtdfjCb0wo3uJXYyViT7Qy3w+N4CpHkki1HBB+hxLkG81orZs72JHwK4U1JsD9RiJaKLXlRFlx7pRKAdQezq5oN3it0ASeR4zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757105; c=relaxed/simple;
	bh=3jetGCwFnGJx1Nj82TQ0OET9A1eFbLFJ7GQN5vBgIeo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M8WVac67U1RQAcp2pGzKG/E6GjEP/xsCe6Y9/OBK1IZwacO308/miiPDktIqtXxD4zJY1Mu2ua/gMYaed/UnfqRvsQxxkr0N1ZzEabtf7jjUtg7nPOjb/xNqF99qhwaTBg+i6xV79dbzcR/tMLe/9jUfj+xYt2gvheh/pmTyy1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=SUtqBj+8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TwVjpH/u; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="SUtqBj+8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TwVjpH/u"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 41C8E1300153;
	Wed, 22 Jul 2026 17:51:43 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 22 Jul 2026 17:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1784757103; x=
	1784760703; bh=MtNln29hVZ9IWALJerNipSaK5loKjj34NfnBOk6q6qQ=; b=S
	UtqBj+89lMIW0Qjtnob4DeFxEYZnlY4Raw9Lg9E8Q2zkIU2W3uzF9H7/UchgfFUe
	K1V+KTBxgLId6TvcVOGLSWobV6pVB9Kkrrx4ZlD9vbt11F7Gt79bX8wX6rTPVm9+
	Jr52fAYHRnnGC8k/N3X9X1doapO5Qala3qkzykagnwdbH3l8qnYLK4zZu000uqqg
	zEvYb9bYhgMGOILDQC6B/ehzjNmms/alnm3aNGNmHkEPxYAqRSLkg+4JisdxokCT
	/po0aLaFH2WTlaZDIxaKNO5QLq0waT7XiYYyLXXxs4df9KHh2hTK/HbouTD6hTac
	WtXsytnr6m3Lgtqa1eYHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1784757103; x=1784760703; bh=M
	tNln29hVZ9IWALJerNipSaK5loKjj34NfnBOk6q6qQ=; b=TwVjpH/uEYUNXJN3M
	wHOLgR1N9BUtcchHP0EKCnLzSyqGSNDfyZ6iRidDHmuudoruXau99+eRH/ROW3yE
	BZsH5cnF26f01l2uXYupMskIxN19ebSIS/aBDomIq9ThvEo8q0MCZotetMgcN+sI
	rGVfJsQ28J0MxzfsVUVrCg7p6mcZCHCBUq+Ul4QO+isVwxL2vNnidz7XKpKp7f9Z
	wt2/KaVVyzR7t/6Dr6jCo6IOTSb8RyjDu9ce8+lDeeWJt2OblD/zFPw+pMwFBJ2k
	fLrVUSvazpxkXww0c3T+AoYghAt4eaRvmRPm2hqdfYHDO452xZb2SeY6erGQvdzn
	8AWNQ==
X-ME-Sender: <xms:bjthamRT1oApASwj7klVyv5sXWq5ffyxMQn4KtFj7OnobC-XqKgP6A>
    <xme:bjthan6I_1rYEHpZk7s6q5rSdZDgseeGyxsEDq5k_n014PclVbD7q6kfV_O-_VIbb
    rCyTjnkGvmWEl_e0fKr3Tb9U4djdJc7i7XdM_rn9NcIh4sWtuObwpo>
X-ME-Received: <xmr:bjthavqd4JO9kOyJWlqaLbyqeU-NLH9LSkBr1kmVkX46_NUlzr82lkpz95AQCix6jlYb1cGMJ7T7EMexcMI>
X-ME-Proxy-Cause: dmFkZTGOSirqeokS0ZXsw6G9GVEOg6iKiIq8G0L2KqrYRg+AcxY3WjDvGDCH8hahcJXoia
    4OSFdZ1+KIUBNcnVNSo3+wpA6eU3xJ5Z205LSCxk0uSApRcaf5A0PjZzlz6yfpdtfh9HVN
    kZwFUIKk1mEIstjileX6PqLIAWL+/69XKM8Xm4zX7K6ZvnqfogWSJicmcVS9N8I6hP2ucd
    BTHHQS343IL8K6QuWjSzt+Ex0onEg/SZ8TTW9wt+9x+bGBM4wRMUq9MMDsv4CUrWI9zawB
    heaWyq9x3Ko6MTPLlYC7y9qjRfdlpJq4l4VO4Zlzkx9ISJGGfrEVCSHl+5chGfqEQmJcpg
    IHDZIi6g9c0kuySGgEmJ3w6thntlQPKESxA68a7+VZHIXPYgP0g8fxjRi0eyFXW+B8Xl/z
    F+DZGAERcyiZlNAK9sQPEFo0chZTz2NHwtBK8RPst132S6RTqtPxw6XFx8lyYEkz010J7X
    sqDLR6RzQDlxzLx+IMdwyDmpXe0WPAYgTmrS0ZXGp2bu634bwJBUUkMbc1TLHoeOtgML2Z
    FqoQOReUzU+oMdUZksalNr99rDD2S2fHKFxoRDNfUYgDsc1SEkJQl6Bsy8qeSJLKgiDqlP
    IswRbr/fvjJ/lM0r5+0DpT+eX1D8n5f12JAN1o4PGcOQDND6KU3Ev1Xg+rIw
X-ME-Proxy: <xmx:bjtharV6ZsYVn21TB51u96XNPD1OK1nPu1mbyLm3MOOoDHXhFSYUcA>
    <xmx:bjthavqNu51E_LdAxbeIJSBSliiBC0_gxQbSng5bLUB5SZnA6qnvuQ>
    <xmx:bjthaisFUbIVYGbTgOQUPrUgbUsOFdGvccr89Wa_gcq81bPHNhYtyA>
    <xmx:bjthalQyNMnaTsfxgMl5tZcYUHTLsnFZhovb9BRLqgXlhwARKdJi1w>
    <xmx:bzthavVjhuG67S4TuS_g0DTHbbx2u6c8f-gEY4MHdJqv-TALFIHCKCQL>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:37 -0400 (EDT)
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
Subject: [PATCH v4 4/7] rust: time: add Delta::to_jiffies() for timeout conversion
Date: Thu, 23 Jul 2026 06:49:48 +0900
Message-ID: <20260722214951.72941-5-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722214951.72941-1-tomo@flapping.org>
References: <20260722214951.72941-1-tomo@flapping.org>
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

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index f890c2d03932..900481a3cba2 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -541,6 +541,27 @@ pub fn as_millis_ceil(self) -> i64 {
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

