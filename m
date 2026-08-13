Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C64E420463
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 13:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786628933; cv=none; b=W3Z2YwGzde8Q18b9lz99e8IxMJzTkAA1Mn8EmwSovGhyIAqrkDc/hfPj5DD7fjRoRnnMCsj1+i39EPBXaQwr7vsdJZ8kQmjhgYHRq+MlWvCrIGZp55WOcZSZom4I/E8SMsyZJjKQibW2fm8+moC9Nulc99n/KoxzdGSKLh3SaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786628933; c=relaxed/simple;
	bh=edgi3KnvhUrDD0psdq9hYjPQYqbgNcOgzfCDH2LTDuk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nA5CGCezR4KhTCa3NqBAVmZlnnWleUJ6PTTgHbzDWcX8Ojptshww3dXMpSbJnZM3yVZNpuOg6bQYtwu1gk+Mu25uYY5XXr/9588frYQMcOSM0hxKPxg2+QEd/nI4TRwv/m1lkb0u/1Fm+OUDfp7AD3cI+lXLEF05MmfCtcH6xF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=pFDeivV3; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=dMai4hqa; arc=none smtp.client-ip=202.12.124.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="pFDeivV3";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="dMai4hqa"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.stl.internal (Postfix) with ESMTP id 2ADEC13004C4;
	Thu, 13 Aug 2026 09:48:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 13 Aug 2026 09:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1786628930; x=1786632530; bh=UpH2PFQ9xzj4Q9jzarY9I
	jpIA78Z3xzjOkRPr9qfDeQ=; b=pFDeivV34pI4xYsuxUbpIXr9SQPQZFPvEPEhd
	pgKxICP5hPKuvetjkhUv32OG2bor/27swHRu6Dv62BxYFzqVunNAVwdc7D/kvZeB
	HB8JmzE7zwMir+Mxa4xQzpN6aa77cxHeQP9nGmjtXpfa6zRsPgT05M+3IPRVpbHC
	3DcVQuh9qmXop2If954BlT0K+/QYZ7VMTmKKS1jq1inlh/jx5P2HbdgN93w3Hk9P
	cfusJWZFkwqAcO3uOJxHPDsW90H4nm+ajVcQgkVcqNvkEqE14c7Wyr3DxDZGC475
	k0nf738Jwzm4VBbog+kfNRwA+B0k8quJyYLBrx8+Cm12YSn0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786628930; x=1786632530; bh=UpH2PFQ9xzj4Q9jzarY9IjpIA78Z3xzjOkR
	Pr9qfDeQ=; b=dMai4hqaPA9Njq0L19VBvD3WbqsK66tsTSxRelrjUkmCFM2Ysr+
	rrjsH4eeJ7W8Q/B73pVywe0m0OTtHI8M99Sfq5xQtuAtlxy6fHIL6keCduupgNwJ
	1SHt5bfWPDiN4ivUCm8n3deKwDdoBg0ldPNgRxiyAFsvqKwItWSqSdy5P01TPDr9
	j+GY/+TpDjkpZ9vO4c+gxNgrcUs5gjUZtJJqAtQftgOPrDVLNHVBD+BoogSrRvLn
	5mUkkKzZt3bGCRoiAvCmaCoA6kOyT6O/azzS9IfCH9ZHzetveb3Qze0XVF7mK6ro
	JszBkdszFHOCDWJAxRSul3s/kvgDDsLLyQw==
X-ME-Sender: <xms:Qct9akD8x-zY2UC-yapmdPuTRloAH0NoHBRKc-N5UlWKvdL5ixrB8A>
    <xme:Qct9aiY2y2SRSnJWnBorBr_ZVoM4rWUG9KhsZ59SlIVb1XVMP2NmdlcH0XJmam8fR
    6v2XKuJlvqaQAPCoa1V9ZxrZnEXFLHWW3czGTZVE2C46iajLYcgNAbr>
X-ME-Received: <xmr:Qct9ajEZSGWzflU3RZLIErUoXVeeMxQ9744aAH0ErxtWTMJYZxxuMpfZcCXdm4ifPd9qJn30b5ecjQE9c9Y>
X-ME-Proxy-Cause: dmFkZTFunpfozn8MbnC6V6t3geMm1or4khWqUGWkU6sYcah9b/n2RxoXFJn+yNvv5zhlrn
    IEX7otYvAYAbIJiqemgd/MPQ26GmfhduJGdnTGuAUlfnVYOfwERlic/Xpr0mDtOLkk1bX1
    X/UH8LiOyiT82VRf9vYEbOshMDqZVcv/I1LBw8aAZswPKFJSWAG6X7NhU1sSt8+A4/YRjY
    UXs4YCCbH2q0+NoI8/K9mottAonUKZnrRNmwnMmlMEfrN2oa1m2IaGMD3eMLa7evkQ9yrA
    CM5+tLNsRduyKOghHPbR+wJp+FX2XUISmeQqVIcirAkXLVFueYsKw6V3ogfEUHkLEcuuoe
    K5JyDaNnUorZ6TPw76V5rL+bw3xk1xgZQSxjQTXhpV/XjSLt5tleI52WjP1Q8ME3k3vAFb
    bJh4/0wftNO/aZKWwe4FfF6nE6PriYvyyIGGBo4no7qBJBJ6H+ZHmxjXv80pJ7oC5XCH30
    sUsGwRfGaR9q0vu9/s8NLOpmxZ1p9bqB7frO0ipvJYbndPL3Q5BBJG9QGmve0QsxJIeo6W
    1UBwK3ph9H1MXPp0iG4FYp4ZXsuXJWbeCHneAwKY22FZ1eOBbZEqkNszgYWOS+/zR55oPm
    gpE7lSApq5S3WNQpwtQoXNgfVkay2HQURquC5oQ+BL9IWB2Ey+50HJpbM2wA
X-ME-Proxy: <xmx:Qct9auup8_AorVPpdJMvH0Lx1GLz50onpwQJYpF1eIsd-REsSLSNyw>
    <xmx:Qct9ahI0eGyvWneQFkAKOF9oYVsRvcSJB7wNpfELVMbwBUXY6tifrg>
    <xmx:Qct9akPu6YoIVKlw55axWQ3VhIg8gISyaMQD7CfOGsE23E5T0TyudQ>
    <xmx:Qct9ahbGOBuN5xdMpAErYXusO1LrwuEIrFgaHrGxSaIr-q3dxy5HXA>
    <xmx:Qct9aoNLeIr5CGto2odVIeQMkNVy9KtD4ApX8XgHJNt2rh4Gyea7a2t6>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 13 Aug 2026 09:48:44 -0400 (EDT)
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
Subject: [PATCH 0/4] Fix forward()/expires() racing with concurrent arming
Date: Thu, 13 Aug 2026 22:48:30 +0900
Message-ID: <20260813134834.1562995-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

This series started from the review of patches 3 and 4 [1]: a hrtimer
can be armed from any CPU at any time, including while its callback
runs, so restricting HrTimer::expires() to the callback context is not
by itself enough to remove the race.

It turned out that expires() is not the only problem. A callback may
also change its expiry time with hrtimer_forward(), which is sound
only because __run_hrtimer() dequeues the timer for the duration of
the callback. Arming the same timer from another CPU puts it back into
the rbtree while the callback runs, so hrtimer_forward() then changes
the expiry of a timer that is queued, without the base lock and
without re-checking the ordering, which leaves the tree unsorted.

Two of the four pointer types cannot construct that
situation. Starting a Pin<Box<T, A>> moves the box into the handle,
and starting a Pin<&mut T> consumes the exclusive borrow, so in both
cases nothing is left to arm the timer with. Arc<T> is Clone and
Pin<&T> is Copy, and both of their start functions are reachable from
safe code, so safe Rust could arm a timer whose callback was running.

"No arming while the callback runs" cannot be expressed in the type
system, because the callback begins when the timer expires rather than
at any point in the Rust program, so patches 1 and 2 use the stronger
"no arming while armed" instead. hrtimer_cancel() waits for the
handler to return, which makes that the point where the right to arm
can be handed back. The right to arm is split out of Arc<T> into
HrTimerArc<T> and out of Pin<&T> into HrTimerPin<'a, T>, both
non-clonable and consumed by start, modelled on ListArc; the object
itself stays shareable through plain Arc references and shared pinned
references respectively.

Patches 3 and 4 are the previously posted expires() and
repr(transparent) patches, unchanged. With patches 1 and 2 in place,
the callback context has no concurrent writer of node.expires. So
HrTimerCallbackContext::expires() is sound.

[1]: https://lore.kernel.org/rust-for-linux/20260807233039.1091842-1-tomo@flapping.org/

FUJITA Tomonori (4):
  rust: hrtimer: Introduce HrTimerArc to make arming exclusive
  rust: hrtimer: Introduce HrTimerPin to make arming exclusive
  rust: hrtimer: Restrict expires() to safe contexts
  rust: hrtimer: Make HrTimer repr(transparent)

 rust/helpers/time.c                 |   6 ++
 rust/kernel/time/hrtimer.rs         | 135 ++++++++++++++++------------
 rust/kernel/time/hrtimer/arc.rs     | 113 +++++++++++++++++------
 rust/kernel/time/hrtimer/pin.rs     | 107 +++++++++++++++-------
 rust/kernel/time/hrtimer/pin_mut.rs |   2 +-
 rust/kernel/time/hrtimer/tbox.rs    |   2 +-
 6 files changed, 249 insertions(+), 116 deletions(-)


base-commit: 643a7c306b8ce32743d4f94dd700c8588be37e66
-- 
2.43.0

