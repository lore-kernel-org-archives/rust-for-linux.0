Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1F82DC32E
	for <rust-for-linux@vger.kernel.org>; Sun, 12 Jul 2026 23:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783900433; cv=none; b=sRO4/O6qGG20FpQYRaQ+DCblCbDJXkUBZh5oBb7XIdizUocc5iy/TEn5JEL7rcsneQ+6OfOnwY8MLZdhOnY4i8FeHhdM+9gVTXrg8PvqQCNynj6jBousZzf0wfW7d8/anm0b/eLiibWrs+AKDr6BRl3y3AKFJgnzNS9yoL1pU8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783900433; c=relaxed/simple;
	bh=xlluU23SNoFjjRzGAktsNAJ5pN3Ewp1OizrLSap/h1g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q+maIZ7L2NQBoMPzs+21BHLD8KMD34ofGE70vJ0s4EH5O+qqR0UMYNe/HC7pax610zugwcJ5oCzgCUFaU28uoj/usvg8V9/THg6Ou4RWXsS2x4IKOfAglIZkQmmC+xEq+B0sEhGVFk66etsHzHR51Uec2zapoc1/6U6MAOVC5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=P9BqyuFy; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JXCh1MkV; arc=none smtp.client-ip=103.168.172.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="P9BqyuFy";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JXCh1MkV"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailflow.phl.internal (Postfix) with ESMTP id 0B4661380204;
	Sun, 12 Jul 2026 19:53:51 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 12 Jul 2026 19:53:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1783900431; x=1783904031; bh=b6rtf0cdA+9Spavi+sS40
	c3HkB3WBdJJUklvIGC3xfo=; b=P9BqyuFyMKVzLKLYc42lJxliTVEY+o2HQjM7l
	lMz7IhmK7gDUrhj17WxpX4shifmbz8z8mVk7jlqGyxERChaIIqJxyETLxZQrGep3
	n7wBZYtVxO8vdp6hk6aCJePAVHZyGlsfxuJEHpAcoOMDj4PZMWEn1WqPWpMdL8Co
	0IHsbVGXF+lSr1Qtvvc51/Z3qzK5BbaY8nz1V/Bvupuhrne13R/C/DNwfQR3yFg+
	M5gUPOxOXrDGhdTGWxl6ch8FMPToZtLmXY04ysDL9UyVgI0U1HRBxbXEu0hdf5/r
	VQg2uv7Ri2/h5oy26uLYD/cJJRvRGOf9tcb8EiBPJoFoAPFXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783900431; x=1783904031; bh=b6rtf0cdA+9Spavi+sS40c3HkB3WBdJJUkl
	vIGC3xfo=; b=JXCh1MkVVEHZ+I9sS2gV4Vr1ORFRmbpztTg1Gt+vw6W9TxcibBr
	j/zSnpeq3oRpjEFvzh9JA/2xbLYcuTNRN6YBMxiVXIiLFoaiSs0yuKk0AEeHL2Wd
	Dp9MLQox15NCSJiPocER5dqU0gaiavqbnabUP9WWRIQI0apO9uZCfnPM4c+/M9k4
	xy9Jr3s4yRKEZK2gWdjGjnOdy+k0v0PAjVoBRkGtAY9zeUE3dK/hHasLfcpwWchF
	YbtLX86YHyJ16iXO1vtimkWdJVdWyebs2PphBoRCADJkb5LxtArGq2rvXP1vyB1U
	kKPkBmScvJDPxBzLRykKicUFBxT79SJkq0Q==
X-ME-Sender: <xms:DSlUahkWRjNQ5K9gns3Ar5aDtZxWAidp-4otKnqCG7X6fBJf3ouQnA>
    <xme:DSlUao8NYDLocGsS6mnKdv27fSlwxGjAc8I8HaVNStgoretGcCWPlamV-BFbI5TjW
    80ZRkSpiADbiUWDlOxKXwMX4IsVQKL4s-VC3O6PsoYKlSKnUHK5G6A>
X-ME-Received: <xmr:DSlUajeMMmn-1wPg2R6JEJtjy_FgoAtbeq05FSBqzs00BQnDVzur9ncOCTlUb-7rIuyWEbwVAETCeToqiFY>
X-ME-Proxy-Cause: dmFkZTGZZjFp/HWikA9VBOSPzpSnxXMR5QxSg7OvBpjlo+kyNPASLhdOXA9lq+2YwC4LPR
    7pezq+5c6lhsRfYDr27zjWPvZQHMicv1yv6Nvc0tZNjAVTWwFzxOvfK9J6VkZ+eAmrZRVI
    xETP2KTqoImxH1kCnmOmt80naSeUcrVmss3X854Tc7vmXPcYamSsM1V/XAKxXfmMNJnhNm
    /N1/y9sySTKae1PZBTENWhgyG24Rn3iODVYbjYroBxvLBxZHsSBNK2KBE3ztSCNHdtB+68
    uQIFwJSE68EIvcTsYgSPnQo/gLahbvZESSVK7ILhNqlrM6GtsOABdmsVB/8XIyoNoOewG8
    2YnAqTxxrPseFKRpRWtLIqNB35TEJ9s7ZMniQgIocIfMtX+65/qCFcEk7Od6zkF2fdpOZy
    575xq0d5d+WV1bOY76y4sBgc0LGahUCBpq32FcRMVXj/mHLO+fucCfWd0Kl5b4j6rebCwB
    gGm/HpN4BNk0AJfSSEAS5UvvIsMLjgJLFrA/PM0YgdOqtUv1Km8ttXAZ/YIWI1WlbxnjZH
    q5s8mX9nAyowPz/Mwalpy18rdtFY4tfmw1Ma0LrOKbtUaRKcTnbrswd4CynaC+x3ZrvNb9
    hoeqaNnnbAoun089xl8ODLMV+KU5DqETA2sL+tPUg9fX9AihW/ikzLXPiWGQ
X-ME-Proxy: <xmx:DilUaq64j7zHf4mEA6InSEv6ryhsD0s2Dp3qcm-8safsDqAGwI74YA>
    <xmx:DilUav-mhIooIQmKHLWw9-GH76OZR9GMUSlmOlbhqBkcGOU4jyfwcg>
    <xmx:DilUakwqB5eVWMfAnJPnPamwTCK8e9FV2KmbLa4G2MDBY1jGoo2lhQ>
    <xmx:DilUamGniajFJxmsB0WvaOA3KbPhfC8FYkfHD4LmU9Ng_DlURQIzcA>
    <xmx:DilUal7o0ietcPWYC5oKzMzFiNdbNlcNg5JMAg22oIgaoDat8FwolG8G>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 12 Jul 2026 19:53:44 -0400 (EDT)
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
Subject: [PATCH v2 0/4] rust: use Delta instead of raw jiffies for timeouts and delays
Date: Mon, 13 Jul 2026 08:52:42 +0900
Message-ID: <20260712235246.3069713-1-tomo@flapping.org>
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
instead. Jiffies are just another time unit, like milliseconds or
nanoseconds.

This series adds jiffies conversion helpers to Delta, switches
CondVar and Queue to use Delta instead of raw jiffies (updating
binder's ioctl_freeze(), the only caller of
wait_interruptible_timeout()), and then removes the now-unused
Jiffies and Msecs type aliases.

v2:
- Fix potential overflow in from_jiffies()
- Fix inflating bug in as_jiffies_ceil()
- Add a patch to convert enqueue_delayed()
- Add a patch to remove Jiffies/Msecs aliases
v1: https://lore.kernel.org/rust-for-linux/20260704132558.2253275-1-tomo@aliasing.net/

FUJITA Tomonori (4):
  rust: time: add jiffies conversion helpers to Delta
  rust: sync: use Delta for CondVar timeout API
  rust: workqueue: use Delta for enqueue_delayed's delay parameter
  rust: time: remove unused Jiffies/Msecs helpers

 drivers/android/binder/process.rs | 12 ++++-----
 rust/kernel/sync/condvar.rs       | 20 ++++++++------
 rust/kernel/time.rs               | 44 +++++++++++++++++++++----------
 rust/kernel/workqueue.rs          |  6 ++---
 4 files changed, 51 insertions(+), 31 deletions(-)


base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
-- 
2.43.0

