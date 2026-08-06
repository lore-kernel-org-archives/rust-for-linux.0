Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EC9392811
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Aug 2026 07:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001588; cv=none; b=dCoTcJAU2IYh4yk1Ogdpxxfep/Up+QSPraaCgT3D3TCvZibyUU2lW8YqK5daIpUGiF8AnM4tMzZvQdh97Jqu0LD45gOWgykky+83odpLG40hFtdyGf78+npck28474QPft/hvi0HUOi0AHWVy2Q32fJi1m7AwBNNqLc4Jlb0Pgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001588; c=relaxed/simple;
	bh=5ykYl1rhbstT5kH52tkMWI2ILqiSDPHD7Ual8jbn404=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YuWiEvjgi3mIOrZn7LrjY9lqJSqysaNQT2WKWaJbT/ndCQkVyW/et2BJNkNQFmmIDNXRqbAvEw2Pvuf4nGepTn2ZS4k8JpdhoZXWg8qrBz9nBOdQnoW6mDRo05ltDqPt4bgYpQOmfmks0FPsNPL0kJP0P/YIERDz+NifgT2e4NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=Y5PTEPSD; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XOjYDtvp; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="Y5PTEPSD";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XOjYDtvp"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailflow.phl.internal (Postfix) with ESMTP id 3DC92138022E;
	Thu,  6 Aug 2026 03:33:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Thu, 06 Aug 2026 03:33:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1786001585; x=1786005185; bh=gwdTHGlSc1xyQJypHyaz1
	U5oVZ/LQo2GXvh8r4kGCfU=; b=Y5PTEPSDJdcis57DFjPoNlBVFORNuPChxV77e
	PUa0NC7DZBKiSaIc4oKJXXo+KB/EQWK3v8xML8asqegRCG0UhzUXi4cvBEXd1Gk1
	W2irs4QcDo0eGebZZlYCh/0Dn4yNgsn7MJDnW8v60nCS0l3p3FBnuOplxjyJw/7+
	zLdJQlJTCH6R7sCz5YKRZSJeQuK0Ljpl/CitRwFE+FnS8FXDOKWEhTbhLAenmKty
	EKA8oTH+VLuJ9234mOyusRxtmAUOXAQdeJnPhYo6HrB2qw/jnFqGPk6msIwBLT1z
	vRBvOk/esRMQObq/FnRp0dhc5PWJ4bkqwgrM5qDmMz7COmlxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786001585; x=1786005185; bh=gwdTHGlSc1xyQJypHyaz1U5oVZ/LQo2GXvh
	8r4kGCfU=; b=XOjYDtvpy6mqhfcV87+45LkhJ/RBQHbFDz1tN3NgE60OPvziqXs
	v+tO48bGZTJP7X+0ZXJWiEYzCAx1ao83rwh01YTPoul3is/5wUdl+dQyA/vk58AR
	ngPpRJPjTOCULZY00VHCD/UCaVEUH3+GtMLgBlnG+hz1su10esoquKJGajWvvku+
	0T6Gaz6h+RctZn6T7jfLKZho8f36Wbi9ZSoPM9g9VGuTzSUjU2jsxiH83WWfhJ4O
	qDhRnEgklTiUd6knF9ff7t1hBkJuYljoo5e0zpEkqvPVPbn52McCt8VlPUYS2+D0
	0qufsqA5SGGbeBGM+dG9wgfkdN9zghA7w/A==
X-ME-Sender: <xms:sDh0ahBz3qzAKC8vJvl0xJ7XVatzV_5Zd82JiJLVdeOn2BOlXVqcDw>
    <xme:sDh0arqMecHirZg_IpCvBgqpBmsmQhzDpqweVvE39f4LIurbiGK-f1jEsAmhSWsIJ
    EU0xCZPQWkC9-li3Ms6ZItpdx4mWQrdmjy-jLPLDBhFtQiyLgdgNeo>
X-ME-Received: <xmr:sDh0aoZT8sQJUpXVtAX4sEKBnz-zKCqpLDJLM0ppJWn98UfIy0YhwtrBf1LSMxuLmVc-nine3SX-EWRtZ_4>
X-ME-Proxy-Cause: dmFkZTFBNNOj+FqaBpOa7k4iTaCR5SHSpWdocC2NpNn0WBlNjgB3iYHVkyEkl/zDQaJyUS
    SCHBn3Yl8w4kHYgBVgKYsqTgX6cOJkiKeY4voIynzO72AGGaAnnd6wCP19pZsMbS1Bpw7T
    RZj4777SBR7n19awkx33hAjGtgMyZilGW7ZEUwQ1mbW6HvdLo8Xu0SOphwuzameKo7ByH+
    W1n57GpxXHb5tLa1OYgr+VvHMIWtibceELI7+MlWHo14DlFvfjhZfyJyhz8oequtm1+mtV
    BKHszeVr+SFjbKAzqnJocleqJatz240isVm3c/gwLzimt1Nhc5w1m+Z/4KkE4bw+vnDaUy
    6SjqMOEsQnCeCxAlVodmh7YvpQ3hnQuhvWw5Vz+Apn1vTfVlhdk7VhmW2UowCCVvakVSm2
    FK1qiUnhoGxOCe2s+XRDZ5Vbo4SaA6RceU9mP8x+NV3KQA47uwJrL3eYchBB/v0s/RIwKZ
    HI1Fjc/eyj7YV0flcW9Mn9UXNOdBeNaVCdAk39pTnkUKAZ0b6MJxtFJ4+Wu6+tH6kDvZ9B
    /eECPVQzEQPEYi+F5jRyjQi59OQAv3zSRQI/2cFjjfm2DAx3ED/uUz9SBGGIGm36HgaQYb
    xjH4BvZyEe4NYb3mcTqMWATd4pQAQXBTyzqhGrNpUPZiDE4elC1PHzF6YMxA
X-ME-Proxy: <xmx:sDh0alGPHFn6Nkyi4Yhja3jFlcA7Yl4HF8jHhrbmee1K1DEHlBBqrw>
    <xmx:sDh0amZ8lvM6R4Rc44vu4RgL1zzXTefD8Fdpv0J4DhEGG2BCwfym5A>
    <xmx:sDh0aieRTWbL2sZWkK9xqhdHRviejRO-_AQCUYTZgmHpg_JBF2bhEQ>
    <xmx:sDh0aqA00OU8C0Qv7hkGZZAeUmJYQj0LqigOJ4WIgorirb2f-uwSnA>
    <xmx:sDh0atGW8R7J1hpA0g6aN04R3q9G1titT5bB4ZcYp26bmjWelkw8uUry>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Aug 2026 03:32:58 -0400 (EDT)
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
Subject: [PATCH v5 0/7] rust: use Delta instead of raw jiffies for timeouts and delays
Date: Thu,  6 Aug 2026 16:32:34 +0900
Message-ID: <20260806073241.1024319-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

CondVar::wait_interruptible_timeout() and Queue::enqueue_delayed() use
a raw jiffies count (a plain c_ulong alias with no type
safety). Callers have to know on their own that the value meant
jiffies and convert to/from it themselves, which is easy to get wrong
(e.g. passing a millisecond value where a jiffies value is expected).

Both APIs just take a span of time so, they can use the Delta type
instead.

This series makes Delta generic over its time unit with Nsec and Jiffy
types, switches CondVar and Queue to use Delta instead of raw jiffies
(updating binder's ioctl_freeze(), the only caller of
wait_interruptible_timeout()), and then removes the now-unused Jiffies
and Msecs type aliases.

---
v5:
- Fix as_millis_ceil() rounding near i64::MAX
- Import Delta instead of using kernel::time::Delta twice
v4: https://lore.kernel.org/rust-for-linux/20260722214951.72941-1-tomo@flapping.org/
- Make Delta generic over its time unit with Nsec and Jiffy types
v3: https://lore.kernel.org/rust-for-linux/20260717042247.3634961-1-tomo@flapping.org/
- Add new Jiffies type and convert the APIs to take impl Into<Jiffies>
v2: https://lore.kernel.org/rust-for-linux/20260712235246.3069713-1-tomo@flapping.org/
- Fix potential overflow in from_jiffies()
- Fix inflating bug in as_jiffies_ceil()
- Add a patch to convert enqueue_delayed()
- Add a patch to remove Jiffies/Msecs aliases
v1: https://lore.kernel.org/rust-for-linux/20260704132558.2253275-1-tomo@aliasing.net/

---
FUJITA Tomonori (7):
  rust: time: make Delta generic over its time unit
  rust: time: add jiffies time unit for Delta
  rust: time: add Delta::as_millis_ceil()
  rust: time: add Delta::to_jiffies() for timeout conversion
  rust: workqueue: take a Delta<Jiffy> for the enqueue delay
  rust: sync: condvar: use Delta<Jiffy> for timeout and result
  rust: time: remove unused Jiffies/Msecs helpers

 drivers/android/binder/process.rs |   7 +-
 rust/kernel/sync/condvar.rs       |  29 ++++--
 rust/kernel/time.rs               | 159 +++++++++++++++++++++++-------
 rust/kernel/workqueue.rs          |  12 ++-
 4 files changed, 154 insertions(+), 53 deletions(-)


base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
-- 
2.43.0

