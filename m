Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07F2ECE86
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790917585; cv=none; b=DrQxksbWV2ncJBKrnGYf+Thgd/j55y2EAbpKRbBEHCbkkI4jZgWRgWewFTpkf3VGR/5Iio9jEx5IIBCRyGVGqOJsc9QtwkSEUy2uRWBk1dOVhjBl0dMMVe/z7WqsPGYJe0hpcQ50GxSztNE7yXtaVmcg2mBjxCkvo68sUbe4qPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790917585; c=relaxed/simple;
	bh=pgBEvUMxKp6yixJDiug2rj73LNxj3AEhlPas0tbZRBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i0EbD43kn7qTLy03O3gan8hYtEqh0TBnXDsEG4MTF3jMvXiI7epYpBwpND9qwIAodpv8XW48w042cVfX9V1CslWPfgNFYN0oTgdc5ZJJHc1/iV1fxBZScYhSUVkXkVf0dmbgweBiTMK3C9gNtaAi4cHGJmwfmKj3t1Igk3wKG34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=dUBxaAjn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=nt6ZsEom; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="dUBxaAjn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="nt6ZsEom"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E8F65EC0297
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 01:06:21 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Fri, 02 Oct 2026 01:06:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm3; t=1790917581; x=1791003981; bh=f09qFjWDEOS9Uhct2Ua9j
	4MVgttvpQCDUTPGURnFv3M=; b=dUBxaAjnBgcDMWHFG/yCAAeAZjeQfKZf6Tva5
	OTRX+9p66uQlpP15flD24mH3yZUQ+6Z0P4rttbi153Nyx+kQE0BaBpZUNUhWzcx+
	7V6jGfczQjg/TYp8a2OhjqZPFhK+e3wozs3FtMuo6FdNxEjnlVLaBQH65yWfhhww
	Pz9pKCqfuHqMOlAxtE1pNqg775Ic31Q4uk/2WmNApTdcbzaCOu774gEqtVggTQNb
	irKp616bhd1k7vCOVBFvaK28+1k49+w3GSy5DKiE9vzBj3lPLeAtBSzdaLc9uNd9
	D5zOYz0OaAe9UG1hMc8n5HJBfsH//fS6LVDMsyswimxwYAqNQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1790917581; x=1791003981; bh=f09qFjWDEOS9Uhct2Ua9j4MVgttvpQCDUTP
	GURnFv3M=; b=nt6ZsEomHd6q5K3qAewdo2gMXuheXwk9nDTyRWbSQSWvPpuYgn9
	37uK59QaN0Z4AT/5oNQuqlG4XQqY8DfK7+hzpbJzj0Gxt1LDBbpfiaFd1NKtuHtX
	Npz7T9CNaNNTOkqOgKs/RBTUmG1ZR10YRusHP60sEdyfcKv+UWXxcI8eXJCLdEWV
	Zh+UqV3IDwcb1s4iluNr5/XM8YdmRAf5+90KU9RhGM6CvOqaw2pGOqBj6d5hG48J
	G5YHjJrU3VSBdn/7014G5YcmOs5izQAGp8+3EctQ2x62bfvJqPqryj3VTOGXyrso
	yVgvwqwXHCP6PnKLO9TRuH4Y/CCQNtkIZEg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790917581; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:i2tD7y7iJNU/8h3w+TxBuhk+0nhgnVLmfMReu6rzHyAJvNd
	W6cgxh9LTBecXKjou8aVDwTL/kBu8Lg+YTP3geAej1MZ3D2hfi1QmhuiW1V8De/U
	kdKaNIxy+116a4xLRr4siD2GOjbLYVTNaE32NAYIK7llU+S5JBxJcYBGp+tkNcuX
	ISHVcDkFiD3g6AhfqZhiJFUujQDEkTGs87NpSHpHx/O3zFEQfKpE0DUVWdFnRxcX
	3M4AfHS8pY2a7v3Ay9NyiFyvnZxpjhku8DYnXf+LBQXZ0Ks+GHWbhGDGl/I/Fc7R
	3c2R+B1aSi9t04ij/M1bqIl+7UakG8jAwcOB/cg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:CTvBs42B2tCRhC21Zvi+fIi+MKDij5LQeRx1QtqF+Ps=:pgBEvUMxKp6yixJDiug2rj73LNxj3AEhlPas0tbZRBQ=;
X-ME-Sender: <xms:zTu_akme1LrIcmc6xmAlhscF8YhDHrQfdO_T4q8jGlru44jPZJW2OA>
    <xme:zTu_arVSAIRAW49xRfvkuXSre9P8kg29f_5A_PllMJu-eBkMeSV26WYYp0eZA6wy-
    GOpvPTyjHLxxUMaIM9Ia9z6th4ZymnO9EkmMEpEJPTvAl832kexTNw>
X-ME-Received: <xmr:zTu_aovr8Tx590lomZGLCjx27N-jbGCQyyHljO98q0V8r8-7jbSNhxBiPUj-JcgtplOKo1sGG2eGZ8hOOAM>
X-ME-Proxy-Cause: dmFkZTGc27jLAbjRuKVauAhDCgdVcNzfcoFoD8BKmms1sCoJlcPinGwF4Hc3Ghpp1jTEnu
    GnnPf2cKdN1a8mKz8x4YaXAH1prrhuNJkw+9OsDuAvpnJvdjsICs5lFjTTzw4eDIxdRcl2
    s2aU6CA2Xhl/+h3Qi0iwFneAb6DWE0HAfnX7YSL+CvUFW2/o6iJLjK2HXEiv7rZVEK2eul
    Vf0xXCi5KkhVfPP8rb7RU6KiN5Bcl+VPn6DAf6XITy9Ffj1wfl0lIsyaBN+WfcPJgCvkLb
    eaC3lCNEfmo2R8P1s0f55lP+0HM31nQIDIbYQ2TfXI6j6BhsVv2jM1P/tIEkkgX6N1WyEI
    tdutyi9MqiIMVid0xY4lAqRCVw4Ks4MUGDHiNNk2BpeFGUA4SGgGL/+Nuqh9QuW7VtORIT
    XfdlnhlnEIGcOR586LZwjqzMz383OSkHT3ASu/JeAC3uxuagurI5Ke8MoomNGKr4aZPSSQ
    BnsEWV5YoJbIBXcMcqHGJ/OD+TCR+VqoOnavpI7uKDqwahWvbWlw3c/oAi25mUqLPSx1HV
    tNyUPqzk5GB24CIa4sJh4rWDdxhrXYfAGnmFZNpEF5iXqdvikvqgTv95FvQnfLs6kW5owl
    aCtB/x1q2EUCLLn3MuWqYScWtdMc+Bw4+YNMacG0juc4w+Oz7TCjc4XY7AbA
X-ME-Proxy: <xmx:zTu_auo1dUoI8VOI2MUfVZ7EIpKCIqhCldB60kzrT0Dvi8jIm2oTBA>
    <xmx:zTu_at4Rvp-uAjojcJ3VqJUyBe-Ud9SlD4XvY7lbKEm2UosuVWRytw>
    <xmx:zTu_asFixgGV6LXn62hfjXPNnX-hSkGdYer4Hn4bY7wseb7eBIFSrg>
    <xmx:zTu_ak5c2EqG6DKcfi1NAHREWQX4i1jhne0fd7Ao049VFO0cDAoQsg>
    <xmx:zTu_aj4vusOB3goXQYMvLS0nRNa4zM9UT0YjCwoXLFg9taS8Ho6NY38K>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Oct 2026 01:06:15 -0400 (EDT)
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
	tj@kernel.org,
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
	jiangshanlai@gmail.com,
	markus.probst@posteo.de,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v8 0/4] rust: use Delta instead of raw jiffies for timeouts and delays
Date: Fri,  2 Oct 2026 14:04:24 +0900
Message-ID: <20261002050428.2746277-1-tomo@flapping.org>
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
a raw jiffies count (a plain c_ulong alias with no type safety).
Callers have to know on their own that the value means jiffies and
convert to/from it themselves, which is easy to get wrong (e.g.
passing a millisecond value where a jiffies value is expected).

Both APIs just take a span of time, so they can use Delta<Jiffy>
instead. The condvar patch also updates binder's ioctl_freeze(), the
only caller of wait_interruptible_timeout().

This series is based on timekeeping-next, because the binder change
uses Delta::to_jiffies_timeout(). The workqueue patch conflicts with
Danilo's workqueue series [1], which also changes the signature of
enqueue_delayed(). The conflict is trivial.

Binder and workqueue maintainers, could you take a look at the changes
to your code? Andreas and Boqun, which tree should this series go
through?

[1] https://lore.kernel.org/rust-for-linux/20260807165252.3849875-1-dakr@kernel.org/

---
v8:
- Add a patch to make Delta::ZERO generic over the time unit (Markus, Gary)
- Add a patch to add Delta::as_jiffies_unsigned() (Gary)
- workqueue: use as_jiffies_unsigned()
- condvar: use Delta::ZERO in binder (Gary)
v7: https://lore.kernel.org/rust-for-linux/20260930014124.1454138-1-tomo@flapping.org/
- Drop patches 1-3, merged in v7.3-rc1
- Drop patch 4, reworked and applied to timekeeping-next
- Drop patch 7, rust/kernel/serdev.rs now uses the Jiffies alias
- Rebase on timekeeping-next
- workqueue: keep the parameter name `delay`
- workqueue: document that a negative delay is treated as zero
- condvar: document that a negative timeout is treated as zero
- Reword the commit messages of both patches. The condvar one now
  describes how the binder freeze timeout changes for 2^31 ms or more
v6: https://lore.kernel.org/rust-for-linux/20260808062839.1159990-1-tomo@flapping.org/
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

FUJITA Tomonori (4):
  rust: time: make Delta::ZERO generic over the time unit
  rust: time: add Delta::as_jiffies_unsigned()
  rust: workqueue: take a Delta<Jiffy> for the enqueue delay
  rust: sync: condvar: use Delta<Jiffy> for timeout and result

 drivers/android/binder/process.rs |  7 ++++---
 rust/kernel/sync/condvar.rs       | 31 ++++++++++++++++++++--------
 rust/kernel/time.rs               | 34 ++++++++++++++++++++++++++++---
 rust/kernel/workqueue.rs          | 13 ++++++++----
 4 files changed, 66 insertions(+), 19 deletions(-)


base-commit: 2ea0119f72dba597aa8a98cbdb72c564bfc5cb38
-- 
2.43.0

