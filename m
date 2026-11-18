Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795045507;
	b=m2oSGWvw35quSQQvMHTdzmBjU5/jhnwQszJZZjRXg9HXb9WpWa0kpFIu6WrFGZkNy0X4
	 5DhWVzLlaX5FxzKpX0uN6qkWqQqGFhDHbgNdhEVGnjcUkINxh5hxh8O0oHQCT/m3DABXh
	 NGI3s5Yi6pbIOR0Yc62SVQQFc2zx5IOnAXoG/r+E1NZ0rYZ+RZ/svWRRFaPtf9UrwOSiq
	 SKGqnucYNr96BGYzFUw4nnOKxz/gtrBFm1ieGrZweaQj2Iqal4iCyjLA0MaaSf6izfCLA
	 W5gOCsTatazj1O/CwlfJ9Mk+fHuJPDiSdn38MQmFOgXzvZkqJwDabpFSr+tJCgk+AHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795045507;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SlvQ2VgnsFjXe3sW9Yw5Vu92DAnxWZkCnZJbEo3k38A=;
	b=N4NOaB6mycdQ9e+CcDMKtyImjz9/vSI0vxH4NFS49DSbl8AvhPuj6SIByq4VFhgWRkUd
	 U7qa1tnRwTa6ORfCxdj8i9LxOOOGXJelSFTTTy9Mzs0mga+rbPKHH5I6eRwlEDoLalvhc
	 oRERjNUDxvYjdtCbcmyazSyzdNpprlZAtAHFAe226iu9YdtMrqCd1uNiY6dKJXhu8Or6b
	 U4ARdjHAEKV+rDPpXUHkn/y2cgjfqGFUVgFn9P4vBeKodBLb9R0mDfP/2Smn7njGLA61J
	 O416u463gX+KfMhMKd0JvkNz8LO41bUVO5J0+WiX8WEPbUvVyy6Jx+LKE9CCj7koOGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=dP2PLzA7;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hB8+2G5A;
	arc=none smtp.remote-ip=202.12.124.158
Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E9D606A325
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 23:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28E9D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=dP2PLzA7;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=hB8+2G5A
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.stl.internal (Postfix) with ESMTP id A33B87A02DF
	for <rust-for-linux@vger.kernel.org>; Wed, 18 Nov 2026 18:45:06 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Wed, 18 Nov 2026 18:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1795045503; x=1795131903; bh=SlvQ2VgnsFjXe3sW9Yw5V
	u92DAnxWZkCnZJbEo3k38A=; b=dP2PLzA79OGnxZTiZT4meX2Jm/8OzMHkC3frv
	Q61M0XFL/zJqi11M9D3Y3E0ptf5dz2FA2ADj4Uer5pEsq8fDPWTeLLKYblTp7TZ6
	GcCJ2Zu8Tonosyc0eiOdUBSMpOD+N5ciJ1rirAvCLfknBLtc9aBBz8mvyWRrIj2k
	btPLX778qRqDuN6aKZwOJg78iY/dMns9qd8yw4pbMGZSw6ZPuxGGKBoXb7na1N+2
	gt5FxYIEBrOXCV/iXtHIxcocrzuwb4dCh/Q4iSyIkdYkcJnU+F8a+pexwqgLUuj5
	WEWc/jk3lLoZsuQQZpYfTI0iSuJroDkjgmvWFdbK/ehUedheQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1795045503; x=1795131903; bh=SlvQ2VgnsFjXe3sW9Yw5Vu92DAnxWZkCnZJ
	bEo3k38A=; b=hB8+2G5Ati8KEnUIhjtPkTZFUJO/pSWajZ+YUJPWEnjkSIMDprC
	OYnGnyxqYyrhHGJN9PxUaGA7Z+64E3TIugasxOvfrzSRTGZUNJlfBpmdsWAgUkw8
	89JYj7b3T2gyYBAfqFXleWoAOkZSZJfTR5ds95APr2B4ZQVCnylyBn1zAHdY7aWt
	6oDnr/kW4BucEAQrb/h7nW9udXE3VQ4D5BcHMI6tAXd8PCoDNz9+cUDNnkiR7LHE
	YUQy+IiwC7FAPhOT+iwrR5CKFv30VBLGMHROgOUcOJz+qD+wLIk3BTiG0vx9XCvK
	9UPMBSPYoA8wb4qJ846FULI4KkeodJIyXpw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795045503; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:BAg/+WJ+OfruBr50bNUBAIwhQ8mTbtHYtJZablDdjod+bx4
	ZSxSLAl2LPL0vu3zjX3SGweKHxla80hawza6xZFYgzIfS+QWVgh7crpNuPzc6ZRm
	6vuR9kgFM6q01J3SNkRa3zp9s/qvz7JH/19U5ZP4RKqs/lnIg/9HesvsLZTaXAt1
	WzxyAz8RDfX+k2rk3W6q84EdSOzP8z6Zl21E/hLeNaeC4lAHbnmk6WHucGfhzbEb
	hwLadV5cWNbvqld8HjHA9NFRfBclLHyrVtsDvFBrmLaeGY1SDv7fGSW4duIjNqFi
	l19kfP82/yWQDUvOi5X5ohVF1jUzVPgo18yCrvg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:VdK/h2229Xpb2Ouscnrfx8QTL45tR//+A8G4qFlcrpY=:2WvQt4hIn1L1IHyMFwABT1ha26mfGUfohMSdBTOTfMo=;
X-ME-Sender: <xms:fjj-avZ64KCbFei3aOGwdbcvgdPjQSCncLsGHbNEWPe7QAgNGMpkDg>
    <xme:fjj-aiUejHhMbkA2gn004jcbIyEeKf3uYqVMcNNYxf8eUrtmZqQKhqEKfyrVwQVVC
    4K93QvkDWnkIbL2V3RQqDEFhhAQIudsB7eGbJi7ysE_3Xfa7bx9Tho>
X-ME-Received: <xmr:fjj-amjK0Bo7RKgknAsc4SK9R9W8-aVFqmklnLonKM7dOpcxHce_mBoWoxAhUAXGS5h3AWX-4XDe66UsQTk>
X-ME-Proxy-Cause: dmFkZTE3oiK/yCDjq/eR3tM8m07M9PLaqebQ60WoFpU8jQdGzwP5oG0KL77CbdXuNDVoxI
    sNSobQBHfttlSTReoIBJCx5Oehf/7s8D+PMbiJskxJyRp2H545FxU+JC0U2to3P8DzSvm4
    SmwehFw25/0ctu9/Zijqq2VNS5qplPqILZGGp1NG15PU8QxXJGqfZpfp7JlCOM0uJx7auH
    3kpKTRSqeThx44OEZk4V7MN0KXixv7SP3/qTStUheREYrdRg/d6FDbkSKHDPvDXFbW09yH
    iaYKJ2BNI8EI7UMjXNWmy9VRpMvQTHtjWlD4/60FwmnOPYxMPfqtu/wkepZuYyV4Uwr/jh
    /q/AGzmazt/fhKlgfieFAk9gC//RTZVQNKmcEJ84gTmIVVfH//UsHv51O5mBetj69ZnszR
    ZMOBLzJ1qgriR4nMUvqt7RyCikZuGSfjxECpvMTF/R/org0GWJ2EXQJHJn6RD/P/yLlBTr
    U1q2T42WPCaOn/d33ynZG+j6kOeYJHr4kd+FVX6tPlXfgQC0iLPhP7JFQmYzBOq0DNxnpM
    j5jvPUOHlgdyKdSGLsOMmiajaMDZaN4jLZDrDKmfkz8uBrXkmHknqfe8g9ah3vA9zk4YSY
    MBt7oVGiLygogNu8DkL/Auf+KTzUZ/iZJ8KB9/FHFkGCh3x/R2GhU85D5d4w
X-ME-Proxy: <xmx:fjj-atmnRd4z3Do6G3bCS1oeHsk9_BWIFihzvkMVYS9UiCb7TQrFXA>
    <xmx:fjj-avzKZDfGqkFhr7Lx3D7VICYkkdEET2tapXqFZh0Eb-ERvalSkg>
    <xmx:fjj-aosniH5Brm1yuozVvFVpQ-yrJqnammLEbot6zKQCob97lxLHAg>
    <xmx:fjj-akvwWVaUxIDKXGzk388LiZaoTbpakjTYOTneSOB-BsfBu59MDA>
    <xmx:fzj-asnPD-Y6v37dU7qcx85DOCL6FSL8RJ-hhxIshELOLFTJWJ9OGdLv>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Nov 2026 18:44:57 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: corbet@lwn.net,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] docs: rust: mention #[track_caller] for functions that panic
Date: Thu, 19 Nov 2026 08:44:51 +0900
Message-ID: <20261118234452.2621985-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
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

When a function panics, the panic message shows a line inside the
function, not the caller. Adding #[track_caller] makes the message show
the caller's location.

Add a sentence to the "# Panics" guideline: a function that may panic
should also be marked with #[track_caller].

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 Documentation/rust/coding-guidelines.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rust/coding-guidelines.rst
index 3198be3a6d63..c7404ea7ba13 100644
--- a/Documentation/rust/coding-guidelines.rst
+++ b/Documentation/rust/coding-guidelines.rst
@@ -241,6 +241,10 @@ in the kernel:
 - While not shown here, if a function may panic, the conditions under which
   that happens must be described under a ``# Panics`` section.
 
+  Such a function should also be marked with ``#[track_caller]``, so that
+  the panic message shows the location of the caller instead of a line
+  inside the function.
+
   Please note that panicking should be very rare and used only with a good
   reason. In almost all cases, a fallible approach should be used, typically
   returning a ``Result``.

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.43.0

