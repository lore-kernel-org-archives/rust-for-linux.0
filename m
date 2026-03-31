Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178353A255D
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774983950; cv=none; b=VvQnMY6IopKHL8pjj5M/DDM+21uM4upmj1HtggWPU1ENjI69Vf3/84ILLoHhDeuVEwU1b+1uXbGYM7LlCH1udIBw4NJJnJkq9nNuWOW8nMCfhldnrhtJ6BRirPgmJtIohu4BUghpH/StzwfD0JPcKZek2/VaqVbisoCRpe6XolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774983950; c=relaxed/simple;
	bh=rwXOOM6sWbh+ZKezFIx/0/jzbwwDH2mjkppwq4KsNLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O2W0nlGY8HRwa6cDZdHLZDXjiZcIrKZQOpxK/EjtiS6SmHgifzMZxfbsEJ4qr8Wlk2nS1FTH5/M9KdWu/T4x3mmZOmS/s/wubFYFpCYLwIJo/27h9d00o392p1hA1egWwMUsHGtKL4/8/BCbjKGm4thOOS2XqObbtW0WbnU9/hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=GxmXPA4k; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=tK1lexX+; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="GxmXPA4k";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tK1lexX+"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 736C51D00190;
	Tue, 31 Mar 2026 15:05:48 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 31 Mar 2026 15:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1774983948; x=
	1775070348; bh=ZBF+iKwi19f8C5g74RheJ7UetFkwQU76C6AWPjWO9K0=; b=G
	xmXPA4k2L1YNEms//3sqctXkvam2/r13QM/l4RzbW9iMOtks/HG51jRcmjn7u0dX
	LjpgpXudbpExf3UwQVHph/y5w87eMggMVikS6GqMWxjQXInxDpWZuXrUvc7GRI/H
	vk2Yc77XZD/6ycP4HmuGHTDIbx6wHGrnEkdNhyJNpoUR6CULtCB0QKTby80gMX4I
	jt2TF0WtDXZgoxTUXqW5tCe030nG8uHanZONuacTrB1YTO92QrRqi4olCEDXhAJt
	34Z05xcuuUdd8sxGk94N7lNlKQGCer7qfx3V/lF6N3dQK8iUwaYkofHKUV6cOo8N
	FNYd7jCoN/Hrq/IS95v0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1774983948; x=1775070348; bh=Z
	BF+iKwi19f8C5g74RheJ7UetFkwQU76C6AWPjWO9K0=; b=tK1lexX+vSZ9EhOvU
	EjEZVcxJa2W6lXavA1d+cOJuTGpfqemdOHx3A9PYWzcJvDPbuQ/CGlc4k2QYUnBC
	VSDpnS+q2fgf7BKw5/vpVmqsYJvxBPEEyx+zSZTUbJTd1UeuBFXu5b+AzoC0D+31
	X9BAym17rEbi4QoMeBSUgRnRtRiu3WxW/OX3TzgzMgu7dhR5HHwUkDgtfCsFviYz
	65xeYk2IKk7JOlDHLFzdHag4nI21zBDLo2tpNHbze8JxjcJ55SBCIKTN8sPZy7iO
	BLa7LsXZJKWlPCBqEQ7MRAkt/59Zw8mZi/lS+XwlM/uxuG+bjfIlov8AUbxlDlhv
	2a+7w==
X-ME-Sender: <xms:DBvMaR1qDsT6tijhrCIw99coDb7wHaQUVFu-DWM0rjnnXIxHFs8nwA>
    <xme:DBvMafH8Y8m62p02Y6b_bjwVDG_seys6IrDh1rq_a_697Rd_de7RWcrb15Q0epxsI
    xmBaJXfNTC1E3bs61v5T0NOpJ7_DhaXORWGeur6Gg3D21MvLVbpFYY>
X-ME-Received: <xmr:DBvMaW5G6S6f7hk2YGLkrdL-mqXiwTVxH5nmrTtf1dE7peWktUl3M4OkCD8E1GdO6zl1-ED5kkNfI9blNtlCAF6nQ04FiNTbwyzqO_7Wx1F3fZCUilxlgISzNZx-Hf7_fvAYAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    fhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffrghvihguucfthhgv
    ihhnshgsvghrghcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecuggftrfgrth
    htvghrnhepueduudehfedvtddtudfhtedutdetffdukeefudefieehveevudeutdeivdfg
    teejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepug
    grvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhmohguvgep
    shhmthhpohhuthdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpthht
    ohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhhiugesrhgvrg
    gurghhvggrugdrvghu
X-ME-Proxy: <xmx:DBvMadveIbnSZDYH77Jj2gx6hzoO_nugOoCtsKjmZppMgLqr-I11Yw>
    <xmx:DBvMaf7ayUoQ9DSdabtjKGrazKrzaTVYIqv0IkegkwLfKJ0OtjyNvQ>
    <xmx:DBvMaQXAcKeHj8OYevA5qzBmVfIUA9rGm8z5mttyMb25pk-hC4xN4g>
    <xmx:DBvMaZ9TDXrlbLb8hPMaECZAkko43fSZi6Hv8lFFJ0Yz4alqYusrdg>
    <xmx:DBvMaVno95kXhKtLxkIk4udi5-d_ubGFI35QerCJyGiKKV3Xj_ak264P>
Feedback-ID: id2994666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 15:05:46 -0400 (EDT)
From: David Rheinsberg <david@readahead.eu>
To: rust-for-linux@vger.kernel.org
Cc: teg@jklm.no,
	Miguel Ojeda <ojeda@kernel.org>,
	David Rheinsberg <david@readahead.eu>
Subject: [RFC 04/16] rust/error: add EXFULL, EBADRQC, EDQUOT, ENOTRECOVERABLE
Date: Tue, 31 Mar 2026 21:02:56 +0200
Message-ID: <20260331190308.141622-5-david@readahead.eu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331190308.141622-1-david@readahead.eu>
References: <20260331190308.141622-1-david@readahead.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Import these definitions from their C-equivalents.

Signed-off-by: David Rheinsberg <david@readahead.eu>
---
 rust/kernel/error.rs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..1cce6e9dbf22 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -66,8 +66,12 @@ macro_rules! declare_err {
     declare_err!(EPIPE, "Broken pipe.");
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
+    declare_err!(EXFULL, "Exchange full.");
+    declare_err!(EBADRQC, "Invalid request code.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
+    declare_err!(EDQUOT, "Quota exceeded.");
+    declare_err!(ENOTRECOVERABLE, "State not recoverable.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");
-- 
2.53.0

