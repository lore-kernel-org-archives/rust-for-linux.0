Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8203290A5
	for <rust-for-linux@vger.kernel.org>; Sat,  8 Aug 2026 06:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786170546; cv=none; b=Kf4HCzn4n6OmLvovGJfSydcpasbEaRHx/fZkP4i+TVmLTtMKjktmJdGPT8GD5pHpNKZqhwxK2Rld16bmPn80zUnZDk5wNo/TNzL6kfyEum25LNaTDQlzq4AHKzSlz/h3pcvj6tpghK2mXVhWr1QMzbB9Kjaz7V4fFnMsssrDBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786170546; c=relaxed/simple;
	bh=cAZmH/nrRM9ruRyPwRRao5ij+i8R4QKKmBX+IizErXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DxMOx6k/DrJsUPJKT2cLyoZgxrc70yYS/TIe3xcq+Q3Jj97BqyJiZYaCDh0EoXgE7QsdyiC+cyKnVgcTT/XLe2+uJSzEXRWvr7978TRJV//GWERUeMc8NP2iKWFUuqfgDixZibKKvFLNKD+/pBI96IcyCZljcCuTBnTWaHWW2f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=eIx0yX9P; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GhPXWVMi; arc=none smtp.client-ip=103.168.172.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="eIx0yX9P";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GhPXWVMi"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id 37ABD13801C3;
	Sat,  8 Aug 2026 02:29:03 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 08 Aug 2026 02:29:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1786170543; x=1786174143; bh=mleKnr/ApF+CVViG+frrr
	Wua6Ye24eqDiDeRXHAyNCE=; b=eIx0yX9PQMVFgOocBYwNWzDEcCAk0LK25IwzF
	PFQeJMqB6y6Sx/KKB5pz0AJoy0GyNF8AWmS7byzDFFR/JfE1STC/zDsA389BTaLA
	b64U20pODn0h02uFDT9oMzFZ+HZx/LOVoed8dxQFDsDmn7AI/XJCpBk4htb6LSKR
	NkwrJ5MqYppSiC/hWY/4tfwWZ9JWqRveWigTy6wvlGVN2wJH1P4uZBr2McZON4M8
	Oji8RRRUoqPyS5vrgiXvK6usNa4USXStbZYzg/HXrBYn0lyjYZMn6XriQUryL2QN
	NA3WZvjOgAQhnGnLy6uSgvbclkZ5SiksO8rYqzcAWUVGuZgOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1786170543; x=1786174143; bh=mleKnr/ApF+CVViG+frrrWua6Ye24eqDiDe
	RXHAyNCE=; b=GhPXWVMiVWiraCSIJEjIhrcEEY2CGd8hMhLYBn9TiZL5bBT422I
	35p+NCRA96xYgp2DwE+m1JHmfrt2vkAeU+NiwXxIP7gJgvvYbvi7h/5doF7Hg5zT
	iygxk2Nw3cCZroBtpyH8zOxTVDte7giGFrsgNrutXwR7YnhGV9eALc0/8ZC+gFUS
	CIE9uNnisdDRLVseaCB2QYi1qZf9MVWi2QY2o70jGrUUuonysjXahRaXWq8X6PSQ
	lVgW/knJ16pauuIV9OkCu9/VCd5atix2M6sH8sQgW+jxeG1C8AjrvJCnWJvl/Gex
	D87s82F1DE8tMmzeiBMSpuieobZlY0EjnSA==
X-ME-Sender: <xms:rsx2aq05DRfEo0cnz1N1SxPxOGvNh4UJFBpBnrPRkt47a_lvqe2lGg>
    <xme:rsx2apMrkTz-4DRsmau8CbiEhaRLAbHOPq-9e3WdHCXptChpql6h32XDhaw30BQu7
    8y56CxiR_OAeY1-9pJDPJno8OkRLjyvkSn8Uv8vzSULwgkc7ybTPBJy>
X-ME-Received: <xmr:rsx2auvrwwQejWTDVuTpwz5N3RRPqUqmtlEhmwENyZEBAyoXC5eWHy70eVQAnDDcyDiVslDMosxJhsMP4cQ>
X-ME-Proxy-Cause: dmFkZTGfmbW7Nl6SVL9mHgIFWSL5py1NOMgfaxaNRi8P+CEgr5aOq2gYNRwqr4GRuDYxfK
    yucW6nByge5D4LbxhM9BegnimGbdcQ0xFkn1VMnD1Tp+BK1UHU3HuCQaI2IVPiYk22YrNJ
    yqI2CO5KSD+Xeg28F3oLkegSKTYWtqCquDRFSnFkern+/olZlB8GMfRj7Cq6STMnPD2FB8
    LNn0bJVFdpOKtLwj7LfrTsSGYbHDcLHD+mlNfHClhbYQWpMK3OQERxqWC/7ks2UHYeURgd
    n4L6BebvxlD4OZWUVlqFn+WLL+kYVpOUx2HiJZchOKdracE93B0QM6sAsebzWRsDSn6fSA
    PJO8brjF5QO2lhXggqRpZF/I6x1j0TgTGr2eB+tgoKUhUy5OQfVxGKqqKY1Bzg2lu8pOSz
    7NqJC0x6VHGvVaNZrl0b85yzim25IqBQ3u2xwBf8tOWux4UuWGg1eBQKO9bTonvFqFIYNA
    HWZK1ao818si42aYxpa68MmtDUusCUw9PfD18ffOslTPoxOot5bGAI8vvzpiG8P/MViutY
    0fW/kwTI/If5bpzEY8tPDlaeZjowRXB7JIeZ+0MmgGwNqW3w8AbFAh2skgXyJZbGEJMS56
    CcnpCZzKbussZO32UFiofNjFtIq4bAEytS6tnXUdSH9nZ9vhQeJ7Pb3raNBw
X-ME-Proxy: <xmx:rsx2alIwYeeWPA8KQK4AkXOSF2DNHpx7HE_3N6F7CAsIrtzQpywPtg>
    <xmx:rsx2atPvYXrvnuHNA932DEBXF9xHHw0V4x2ij_ZrQRARJqIS7jCkhQ>
    <xmx:rsx2apCkHYNmbHfMYN2JfI61hKhwzGjY9SCHlwIuP0mOx75rGb4TOg>
    <xmx:rsx2alXOpA525guW45Pb1a5T8jwQXmBEO9aGiIE4P6fU-eYJLVAoEA>
    <xmx:rsx2asL984Yzvp9bN82_daw-PiAhIARA_rlXRAefUSXRfUqZn2iFDkL9>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Aug 2026 02:28:57 -0400 (EDT)
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
Subject: [PATCH v6 0/7] rust: use Delta instead of raw jiffies for timeouts and delays
Date: Sat,  8 Aug 2026 15:28:32 +0900
Message-ID: <20260808062839.1159990-1-tomo@flapping.org>
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
v6:
- Make Nsec/Jiffy zero-variant enums so they can't be constructed
- Rename `Delta::to_jiffies()` to `to_jiffies_timeout()` to reflect its timeout semantics
v5: https://lore.kernel.org/rust-for-linux/20260806073241.1024319-1-tomo@flapping.org/
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

FUJITA Tomonori (7):
  rust: time: make Delta generic over its time unit
  rust: time: add jiffies time unit for Delta
  rust: time: add Delta::as_millis_ceil()
  rust: time: add Delta::to_jiffies_timeout() for timeout conversion
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

