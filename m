Received: from flow-b1-smtp.messagingengine.com (flow-b1-smtp.messagingengine.com [202.12.124.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8694399C2
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jul 2026 21:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757078; cv=none; b=BxSfuFwoz7m1svA5836J/zyMosv14tkqtsfSUfiHROTreW3JiEMTLE0aUUebH7G7Y+sMiUKoAUqv2wuHMFzWBSLwKSaG/dp8+uhknae7Vj6RqHmdxse8znAhmG1+jJLK5U9SconTTSSs7/kJWRyGCE4IS5u6cAPIebd8jWixZJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757078; c=relaxed/simple;
	bh=O0I1e2Bk0Tw8zf1/LmStHjNmkXeKz5UGIUUowbtzoFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVz96yIqjCmkFhZz10ZUy2HexfOir0G87EkHkSHt2kCbEK1UDA0fRJBHn+0/XdbmB1iki/qGVHeOL8PQAzdKa87QuBTWTqkjD6oP+aC//xA1yG984AdTfpYWTjkiFEJ/OhBIk+g0YsJUfe11ffSFRUbt8JzUrVVf4VQFQjyvt3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=cOSN8s+v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=DbCLrt8J; arc=none smtp.client-ip=202.12.124.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="cOSN8s+v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="DbCLrt8J"
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id BC95613007DD;
	Wed, 22 Jul 2026 17:51:13 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 22 Jul 2026 17:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm1; t=1784757073; x=1784760673; bh=QYmF4fH4M3RBOy2wazKiE
	Lyy/CXsQs07nJ7J1Jqn1nY=; b=cOSN8s+vYLT74q2/i3tKMIHyCeyWru3cAdgnR
	R52fl3GU9kDrXE9uuc3NBfnK2e4IJ9p7MnqkXFvlfN/rxHL/gUIAYWnFqaL/IOSy
	6OmDKvzzeZYGYx4PUySxbRid3op+CgqV+kJd1YtFj/z1ZjM9ZmGcVxXJJzeW8IQv
	77XR8Z5w4x5RmBHFou1hTo60FbtVA6gnQSLyqWzIpLnHUCH+2Kr1FVBAckH5gfvO
	p3cMkqnHanSKdnEusfKyvP/b/D8lnH/rmoRUa8vpDIGPR/+gQ7C/WIDrBSsAzaFw
	aykkEfyKcPQDj/SYvbhtN4dG4O9Puj4cM3VsIgh5Bh3AITxTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1784757073; x=1784760673; bh=QYmF4fH4M3RBOy2wazKiELyy/CXsQs07nJ7
	J1Jqn1nY=; b=DbCLrt8J/H26cLqAL/CcXnFyE9T80z8WVeQW1iH59hX/tdbw9p2
	c4GJ8EtPjXjRCIv8T73J/5qvOOXXsgrGsDAgmYxEK3FJZqQQ0cNRUhkGlUZt7QFn
	6x27Xe6oYNAPPDZB0TBA594uoUExiSxasA6BdIwJ+4FZOnoHAx1XgmzNTOWu0A/8
	zL+74lmQZxfWoNwcFnuwFmo/sZfiVrck7CRg5Cf3417gTgNbG7KH9G9FiQD09tG7
	IACCARQOawMnKY/tLz5gBovBaC5vkRZaCNFJnoATPGibvp2HtHQ0tG4vQDTolCfT
	AkxPqBUaPYm/xBxA+Wuey++6Dzkv/4EOWPQ==
X-ME-Sender: <xms:UDthalcwIIaooA5qALXjBEyUd9MoMwUv7sPshGC8QK6iP5s9CzsO3A>
    <xme:UDthavXt-GGOl-6i8G8Bk707OEtGAggPqBqnLm7YG6LsUjz4Ac_R9Ch_RflwIkG7s
    j4rK0gfGipMN2jx5Q-Fh7lkSQv-XkVDDplPvxz2VtmIF7gPhVIxjMs>
X-ME-Received: <xmr:UDthaqW77VisJzdej7ssHuXAvswh2CZ-Nw2KXxPLAEQ-QWOARVN0Q0jbTKeDDdvlva_eUTTW6_vcfxwKHrc>
X-ME-Proxy-Cause: dmFkZTErXtdv56SFmi27pPV//FaV0qEmiGnGxPg+cIZJxJ4gelyy0rNwMTgu6zOzu8hFwN
    QShFDCogkOqdC0eovYNbG8k0io1N0Z3TpEVGeuMPneCAKM4CdSPobInZsCmjbduAbfF0OR
    ZFmoAoVZERIvsIsgxSd4lXeXwRlJ/v6k8hFntKmxQKfBxAIqmsjGsJYWKkwM7Pcm8pgsf2
    z8r5vYBRJ51dXCa4sI7uBwrLa9RXQUMzHT8MdDyYyD6vv9Pjey5iAph8bcMWjuyhLp+AVn
    m5tENGL7FAVQx18lluTj4wx0vFy9bku5QVERGQfIUR+cSs1g8/mhHJrUj+PAM4r7orD7SA
    UT494YltmRqdv5KXl4kn2tiw7YrWHdkX23zCWOLjZ0ZtgadBwlZP/eNjKq12zJD/QAM6eu
    jJsbgjq4ztgPc7K4dEqIF12yxOZYAhINSBTib01OA97MElOSis9OEsNpvpWYTYS+smeZEg
    UXcJeL/xJWpmWPFDHxmNpTHLe7/ZsUlhcJ8pQZOTCt8/Pi/p+B7MTUPgah1S8DbT4Mk5q/
    Q5btsGDVm5WHcMR+e3kQoO7/838skAOEZUlXCmEZDvCD3unwftANsugowLF2dY2nzxI9kf
    WAY3pQU4cW5lmeFrXdS7iCOmtA4RnTIIRDcwXF0BQFaNRlx4gJ1//fS8AOCQ
X-ME-Proxy: <xmx:UDthaoS-RxmiC3AMIU9jSW8NumMp7PT0c7-pYM3ZnBgekCEUhFtYpQ>
    <xmx:UTthah1nZU-Bu7F1-CQ9EqsKib6N95E9twJA9-hDpczrJ0Oi7D8Ojg>
    <xmx:UTthahLr-3b-T3uobHwZuAWaXMrPsax8f34EU9ohb5DF5wm_6Z_MlQ>
    <xmx:UTthaq-feVM2W9vgfQiD0AJdu050gHVrvMKW1NjbicmxHTybjqfOIw>
    <xmx:UTthatR0YVXzosHP10gvxdzui9Wt6kvBMg5tM1ll5v46qsYIYxICs5SJ>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Jul 2026 17:51:07 -0400 (EDT)
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
Subject: [PATCH v4 0/7] rust: use Delta instead of raw jiffies for timeouts and delays
Date: Thu, 23 Jul 2026 06:49:44 +0900
Message-ID: <20260722214951.72941-1-tomo@flapping.org>
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
v4:
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

 drivers/android/binder/process.rs |   6 +-
 rust/kernel/sync/condvar.rs       |  29 ++++--
 rust/kernel/time.rs               | 156 ++++++++++++++++++++++--------
 rust/kernel/workqueue.rs          |  12 ++-
 4 files changed, 150 insertions(+), 53 deletions(-)


base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
-- 
2.43.0

