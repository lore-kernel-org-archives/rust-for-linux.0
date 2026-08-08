Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC5395276
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170568; cv=none; b=g+/gSNqFprONUiR/iegZCyPMX1qKWdjU+wuughNFmBEBtmq2skPKvqUDMLbmvb4g2Y4G1PXUf8nHLHTSyYs7KGBn9ofmOs8DmTS3urp3CsVsB/9KQgXoODUUfH9Q7NY7qqKroqwlS9RnrZViXD5i8PAlss4RCA28rFgyRCf5Chw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170568; c=relaxed/simple;
	bh=k/4DV9e7BB3AQFcytzAAasUenWxCnijo5kfYbcVpijE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gvAowOG65EyT4wZ35lwM1ACz7F/mgdA5Vl0beQGQpk/lNrSezPK5/7tXxVCAPRqsSPdEzLMu/+w4z1J3GqI7SnNgk8IzzlyR0FVU9/PiEIBdGUPWYWEog+TMkJ+kZgwRa2NW8HdS6X1pmbJ/Y/j39QH/1omsPXNxXaWDni5A58M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=APBGI0D9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=MgbWrIZ6; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="APBGI0D9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="MgbWrIZ6"
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailflow.phl.internal (Postfix) with ESMTP id 3766213801C9;
	Sat,  8 Aug 2026 02:29:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sat, 08 Aug 2026 02:29:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1786170566; x=
	1786174166; bh=pQGSjIHULWl2Sr+CUaUJkB3W6AkMYf3jh5ITIOOfS+Q=; b=A
	PBGI0D9yJopDsrL7Q0obV0shcKYTkNFI6RqWx0WncFVgsoBJGsQ0+UBVJhwpv5q+
	5qeZZjAw0XAT6Me+d1JRZm9b9Cj7Xx2RmGdN16RyH7FKSz+eMbqViwnw/IF493ZY
	XEM3xLDX8ziz73+VBhLFLnyT+sqb5Xw9m+5K2QOfB/CPfM/v5loi3I67cE1+MzPf
	wJebMbdmCdNiS0cBVVjkir2HhAntI5JrHjdpFZx7S8ipYn5jXDL62FZUJtwxHFGp
	bxuXGP6n3uIjx7kUboFFCPir7H8p++huH5rw4iKPe7UcZyEH+HyZQRVNm+U9XgRr
	SUjOxCSRszuFkiWGsBc8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1786170566; x=1786174166; bh=p
	QGSjIHULWl2Sr+CUaUJkB3W6AkMYf3jh5ITIOOfS+Q=; b=MgbWrIZ6HzGP2e8Pw
	S/hX80ish/fbC1VKmYFQlgXVTZ5anknkcBNZSFIp0Gzv9JdbYOntFWSxyhB6uOp5
	hEdS9z7BzFtDpkaCcbTeWX05ZXSfr7dZmzP4W7HfuCJzdgjHFJ8EFmSelFIFYOg7
	vI7de1Yl6/1l2hDG8edeEn9EM0X1+tD4yri9Quo8rzLHCW5P5ceiKMpRJCvQBKSB
	FmAZKyYN3BpDAylh4gkD3/FFcxviFh1X8T6pLMbagRciyMurN66ZliclhtSPfSbE
	qCDZVRjIKW9RjOvyZj8X+AXTE1l6TXKdbUcuGbrapZTca6eT5v2aC5pl/btXjmHU
	D+6qA==
X-ME-Sender: <xms:xcx2akxhiBhnU4tEvI0XZUJ7C016FRWP3kTpL__F5DDmc4JEqYCdQA>
    <xme:xcx2akbkLew2oNc8t6CDw95EK1tXReH56mwlKq4I4Bylwmfrss0na0hbbsjwDB0jU
    cxJw6Y93MuP_L5Fcjgvtjb2zWzQzfWIaG2QaTFe9D18Ae3pOzv4Kco>
X-ME-Received: <xmr:xcx2aiJicxd7T6Y5Gs3XRya-PYD3xHQXp0LmYULPwhgdeNduui4PlGhx4Xykv62KMP-yByJmpc0SAVwG-m0>
X-ME-Proxy-Cause: dmFkZTGPkp/tjUF9QhjmhubFpVsEJiLyXpdymDQrM8aVQ3kZuefEetQxeEW0ZOf4RrEr9P
    LsxjTKn60UCLD1q8TGml7nMYQgaOZD6UryIwVsYw9c3jQPw69RG55VceGwySH18w/RXixP
    9ALHD292JMWwKQ2E2TR4oVe8cE/VF35DjCuy8p2zkKeBmUj7k5VChHrMhTMNGL9/0k+flN
    D/XO/y8C66ZMkHzR5HQRnvxIGNJ22YhihAosFjsscruigf2Ki1At7aI9+pPQrR08nl/TLi
    2PNvSDjqxzYH449vkP95HWg/wP5kxHrjdUvNcOiDpPYzwspfXJSX/omV4B8zmmoEMc26Oh
    llukZD127zZDFnImLw9WRyXm/sRPxKrV3i+vnGRp2JIvQ6q7H52ixWInI0MyUu8/jg5CaJ
    8FTM5+wNW0rsfWGTl62KHrDpsbCVycdJjHhTwFp9Ifr5IT3gP4f4T8A2I5T+5yEHSOE7TL
    uA9TpHQUGpSSxQgVY0EB2llwtr291FfMhCjV9wySZzeaveVG1LToI/CvenPV4fAYcnUPiv
    79PUd3I+40tVxI+fUcWg8X0kcduke1+BqSKgZYpcsXS1ToHBqy1997hDkWF0yrGiJk+d0V
    2JdsBH4sihzWGf2egtDuX7lnQX/vU39+26pCXVq+cEj+8ShWWuWPOkinN35A
X-ME-Proxy: <xmx:xcx2ar3v_yz5H5v5IAZ5aSdWYRmFhaO8VPUCL4grkOF4CAjTJe5KXQ>
    <xmx:xcx2amKSl_-uBo4F3RdbENZZexQlkmCv4eLro6hW6fMO3vEG4kwPeg>
    <xmx:xcx2anNV1EhykCgQ3nu7ROpma8_mOVm6ZoP2R9Oi8E2Xo2GQlFVubw>
    <xmx:xcx2avwQnkvebPMPlFBuXy213fURg3-E4KM0SE6z0DyMENi-yiQT3A>
    <xmx:xsx2an045T6a7N1xzhvpiUdvdkKm_ZwMQ1xVRS3jkaWxsemdL7DeinhO>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:29:20 -0400 (EDT)
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
Subject: [PATCH v6 4/7] rust: time: add Delta::to_jiffies_timeout() for timeout conversion
Date: Sat,  8 Aug 2026 15:28:36 +0900
Message-ID: <20260808062839.1159990-5-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
References: <20260808062839.1159990-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add Delta<Nsec>::to_jiffies_timeout() conversion that rounds up so the
resulting timeout is never shorter than the requested span, clamps a
negative span to an immediate timeout, and saturates an overlong span
to the kernel's MAX_JIFFY_OFFSET "wait forever" value.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/time.rs | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index af144d251f47..83891dab3aa7 100644
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
+    pub fn to_jiffies_timeout(self) -> Delta<Jiffy> {
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

