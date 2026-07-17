Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F75366546
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Jul 2026 04:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262200; cv=none; b=gvoEtPdryMkapsNPNnWM3vMuLb1NkssE8BwsoDJLlEsUSEvJihK00UXYPpIlpGaVu3M/DtLoP+7ppIAi/7m6WhLHLfwk50Dxs3WEf6nycH+lmv6c/PwD97GBBJMuUkzyUyBvWPnHkJqWIEqIAI5K1m8+xgatk/tJWwgi6iolwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262200; c=relaxed/simple;
	bh=UUCw0OxVJdMolh77N4CterHQVW5CaLCNAJk8QTrhwrg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Po+5qGpvRf/PmAdhmHsj/k+WFXDYgWCMnVU4pGZYV2Ub2Fn3h0ssxzNQZvoTMfGiDupISXzUJrAWRIO7Qa5FJFaXySPBHa/AzFvwkfNK3e614vt+Zb27Sk4kynWLNDIP4GgEQt8jnQPxTW5l0Q22sNme0QAw2YOursKbOq1NYSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=F8CjPwSs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=T8POPG88; arc=none smtp.client-ip=103.168.172.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="F8CjPwSs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="T8POPG88"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.phl.internal (Postfix) with ESMTP id E6FE11380043;
	Fri, 17 Jul 2026 00:23:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 17 Jul 2026 00:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1784262196; x=1784265796; bh=uMH6G3jIIZci6cj1zPrT9
	PXyP+oSk4q/lcDOX42VT38=; b=F8CjPwSst7yLLAUttZ3TX3+RKXlszmsEEMXpi
	/8Xf+4ezqqKu5dlXdhjCv+YtHj9GUpxeZlRY9PXgjkTeKN4nO3AmlNNkSGxWX1CR
	Hy9KEXuSUQhPdqLGtEAhoBpUlJDAo0Sboil2vzVFFwO8vwoyssAn+sR9BhV+dqEW
	xANRrh4FGM/rsPvV0sDSNyhfZ0pNuweoUkCeNG0MSLg4ttUZw0JpQBcFkUNUXDcf
	0Kb/yjBw9FSOWPMgrtXk9TpH8eCjCV8MqqmDBgApXssYdp0NdQDNGnPRlKQHWS4v
	bDfP7tscg8oPAyVLJKMF1g6gto+l41cJmaLF6S+o+eDNnGO+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784262196; x=1784265796; bh=uMH6G3jIIZci6cj1zPrT9PXyP+oSk4q/lcD
	OX42VT38=; b=T8POPG88lxagxIXM8EajN13QPtV6qrYbjxQi8ATcFDDJwu8skSI
	coPp28uWJubjGk+l0OTQmFNoWUEAM92krIjSJ4TIf5m7vN6PBIXSmqwSUDKHHFjp
	fcdDBWQgMgdVhcUHkUJusbxAHKrjyVcQo5fdIs4LP7x4GKtZLQFpXxUkZ1acBKVN
	KrM6O0oJaEhdmKPl7TT/mFY4SYXotXYdDlUraTuqaaLeUcgF/QnjQGKqjZwSpA6Z
	P5xg0D5GEzVR61y6SwlLBn9+2i1ZriiqKj7WeTQEUvLqUDdkjQgaPLZNTNQBAPmb
	LRI2W0JKou1WzTJPywvprmdi61TdEXKkTpg==
X-ME-Sender: <xms:NK5ZarWHk6VUIsRv6cKSznDbq5uv2-TU9H_dhlD24khUkPHs1xHiVw>
    <xme:NK5ZamWy40R6nepMccSFcXtt4My8VkAJFE0qdNsa-wSdMbWNStA7t_ePmQBJnhI-h
    De4fPRSpf1jYKrwqkfksHmNhChR3-vSR8tXUV6YGIYL0yw62CV-Tw>
X-ME-Received: <xmr:NK5ZakROsoVVYqFcBNIwTIXKPpmDfwZoOcbC7hkwYilAedfJMQp3-0IONmZ6lORZ64-nr6yKpovk6w4gBro>
X-ME-Proxy-Cause: dmFkZTEi7ITbiXD1RcKLeuJ6pOFVXQN3WYBwxa06DDwBX5EANgowxJMBjuYYncfX6N4Fyn
    a6kfclq9/13fdNjg57+xRtTa7RK512cyKDYDvOf8HqRCEkXvtY5uBQu8kU8XZTAVbchNRq
    iWLHs6LmkH2iiztTwDk7SCFCW6y39PsPf85PDXnH8ppbnb8rNQBgdhWZnsGnRZF1Mno9kQ
    3pqiT20EQy+hKgHVHDaTFjRlEo1CxuGQBB1j4cWXUDG+tkGGiiVhjR3a/GVLXHp98aelPk
    u3s2mFoXfPuw5FUioHqmSRZJqOMg7whD0V3+eaQ+EqzGl6jSo0nUUjptJE/w7imzv02WjV
    pZWnPNUK7yMjl0jO4DGb+oThXN8K9Rhwzv8E1IJcihOJDJkumcvYalvfzKN+s8OKGILB2b
    tu20qOouvMA4DT5zb1+ejk9K8F676mcbIPRNUrTBUwoGzqzRlLrv72XW/DVLBkIpRK+yhI
    z9bz6NVSx8XLT79TldZ7mTCSLh6IA8t/MJjqrqw5PYCusakHzwpdhXkKBH6HZjNh/0Z+nv
    sIYli4ItA+LptrUtnADZHJM+i5Fz7Z2go72wC1UpfORx74qdhNUanTcVmgkQvybiOLRT8G
    TzVDbb1gBgSvMBrz1irS+VS78mq9AvsIQH0bqlBdPJJaJqWsEfUA3z5ySLFg
X-ME-Proxy: <xmx:NK5Zat0b6zrsZKSWb9YV7VVApwLHv5P7AW8oiNuz0XNMXm8gYYyS8g>
    <xmx:NK5ZatJgTgCmvKrEspwtlJeGPxYjWeporS3aIdVkTFsIBBwCBDNbAQ>
    <xmx:NK5Zam9CYO4kbGutAdJ6kAnSU9jJgyfd52FzOnytIqSDI_F8NVzT8g>
    <xmx:NK5ZammC4puMr9Mk0di9N6pYYSuw3XN_3aWMFCScnrio13Vqj3u1LQ>
    <xmx:NK5ZaoUMJip_2Ox3WZehuXE3TrHTlVXGF874CBaiF2pg0NPFGI_eeQIr>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 17 Jul 2026 00:23:10 -0400 (EDT)
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
Subject: [PATCH v3 0/2] rust: use Delta and new Jiffies type instead of raw jiffies for timeouts and delays
Date: Fri, 17 Jul 2026 13:22:45 +0900
Message-ID: <20260717042247.3634961-1-tomo@flapping.org>
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

Unlike the previous versions, v3 introduces a dedicated `Jiffies`
newtype instead. The APIs take `impl Into<Jiffies>`, so a caller can
pass either a `Delta` (the duration is converted once, rounding up) or
a `Jiffies` directly with no conversion. Jiffies returned by the C
side stay as `Jiffies`, so a caller that works in jiffies never
converts and the round trip is gone.

Why a `Jiffies` type, but no `Micros`/`Nanos`/... types?

`Delta` represents a span of time as a nanosecond count. Microseconds,
milliseconds and seconds are exact multiples of a nanosecond, so they
embed into `Delta` losslessly and round-trip through it losslessly; they
are already covered by Delta's constructors and accessors (from_millis(),
as_millis_ceil(), ...) and would gain nothing from their own types.

A jiffy is 1/HZ of a second, which is generally not an exact number of
nanoseconds (e.g. HZ=300). Converting between jiffies and Delta is
therefore inherently lossy in both directions, and that is exactly
what makes a jiffies count a distinct quantity -- a count of timer
ticks -- rather than just another way to spell a Delta. So it, and
only it, gets its own (unsigned) newtype.

The Delta -> Jiffies conversion reuses the C `__msecs_to_jiffies()`
helper -- the same routine the existing Rust `msecs_to_jiffies()`
wrapper already called. The arithmetic (and the range clamping) is
done on the C side so it works on 32-bit architectures.

v3:
- Add new Jiffies type and convert the APIs to take impl Into<Jiffies>
v2: https://lore.kernel.org/rust-for-linux/20260712235246.3069713-1-tomo@flapping.org/
- Fix potential overflow in from_jiffies()
- Fix inflating bug in as_jiffies_ceil()
- Add a patch to convert enqueue_delayed()
- Add a patch to remove Jiffies/Msecs aliases
v1: https://lore.kernel.org/rust-for-linux/20260704132558.2253275-1-tomo@aliasing.net/

FUJITA Tomonori (2):
  rust: time: add Delta::as_millis_ceil()
  rust: use Delta and a Jiffies newtype for timeouts and delays

 drivers/android/binder/process.rs |  7 ++--
 rust/kernel/sync/condvar.rs       | 21 +++++++---
 rust/kernel/time.rs               | 64 ++++++++++++++++++++++++++-----
 rust/kernel/workqueue.rs          | 11 ++++--
 4 files changed, 82 insertions(+), 21 deletions(-)


base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
-- 
2.43.0

