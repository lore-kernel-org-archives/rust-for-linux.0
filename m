Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB284734C5
	for <rust-for-linux@vger.kernel.org>; Thu, 24 Sep 2026 23:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790292380; cv=none; b=fe/TmZS7D6/N5eZtEW/iU7jd+OScdfcuhb1CwTl+I6LFoysX6vlJ9Ruwscgh32nJyGoO3WUroQFQorzNtGMPqBC3A6Y0hH1gIyMlTRS95Vvauq7h4Fd1rUqtBIsWEJtHLLdRxgui39eZduWx645CprJnL4UlJgJPzOWvr4v8I6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790292380; c=relaxed/simple;
	bh=4sBXdSfLZUrrvX0GwNip7mX8sZ43vkH+1e5huDMe0+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hyUJNZnC/05JJHKUOOHMJr6NDHEl1spsRL75zFbuZbM7FuEdvEjgLvuf0NIcGlc98As074hDNKJVfKypTJrcTvf4GTUJHEg2Wez3HLQlYWH0pCGF5Enxnt4lRYZ0DHe5CZFHZOe86pt95HJ8LWrewmuK6Tw6lKuWPEjSLARdkGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=mNnvBgiS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BhKrfhOX; arc=none smtp.client-ip=202.12.124.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="mNnvBgiS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BhKrfhOX"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 498CB7A0098;
	Thu, 24 Sep 2026 19:26:17 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Thu, 24 Sep 2026 19:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1790292377; x=
	1790378777; bh=guf+bFb3tohQ+55MCs8ZhxW/7Y0FXbDTUl5IOwgJQ5A=; b=m
	NnvBgiSAeOOfGfsllie1vq4CSLA6sEak0OnHywcqK5oBEANcsvVvMWvsmh2nqS6j
	xNXHfv24OrJRSyAVDt7amLKFXzyWjPFIKOTQTQvts4GNwSAh/CPN4xGRofDfWRF3
	qO5ajrLC2zTSzFzptktw/Mek3bQ3DrkIZrqNWMMrZOVSSmMZkCVpTFrsbwaQoJGb
	7imVHphYerCyRQfE1y+KTwYwvUJq49nvJwSkiF9obOI7d2qP9JvYzsOt213KYhfA
	rS6XKqz9//Rv7CO1lo7nWfqg1rih4WYv4I9OfNctI0nsxKkqL+BYMbc02d5wRFu0
	5pGjbYs9DazalATnpZndA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1790292377; x=1790378777; bh=g
	uf+bFb3tohQ+55MCs8ZhxW/7Y0FXbDTUl5IOwgJQ5A=; b=BhKrfhOXonq852tof
	KMlTE4FPKto5OrqlYjVH0pM7tkCWpGI7ELmvb38aWKbwOWzBBOwAfrQEKnC9xHDw
	jxNdETU2pKQxoXAcTVybLFgMCzpRbmKj+HqP8H4EiwGdwInFkN1CCIDc1TMV16XW
	+yim8u8xCT8eOHcOO96A0u2DcoPrbSoC6iCHvo81EDtlXZSFJ7tviysMTF8d6sUR
	1hDrSW0P2VlhUvcQy+e/v0QIPyct8wvpl+ra6ZCec2ecZ2UdmSQRivgf3kLDjptM
	Q8wc3mpQdyTpB873M+A0wua85Gz0NhqjaB+LSSnBXbSzlSI9knEQuPJUJVAEOE2P
	E8yug==
X-ME-Sender: <xms:mLG1aq489eeWn8Bdzj9EZOMVWTiwcA2VoO5WM7vCHmCsTN5jjrCRXQ>
    <xme:mLG1avx4WshskaAi9XAL0DeNrsdjYltAE9ANEBwSd7Bzbol2bDjVZnizR3mFls1n1
    eCbFa70XLjCPcU1KMpj11aOc3XukrTfj6qXMgjkJm-GfDZpRQhuTcRt>
X-ME-Received: <xmr:mLG1ak_Sm7CVxNgwfPMSFqi9X-x-ptTRYtH8CapcCV0cdv8sMRbP168VfHIqupMWu496fCS708MyKXjKl7s>
X-ME-Proxy-Cause: dmFkZTGbOl1CsLxRFUps7BdJom5bppIhQpu7pBznzb6kn2yGIAPueY895qavc5g3NMtK7j
    ntxwJ4R5IhYXb0s2MqzNYLCBOYgQ8ara+e3VMCH6Dbm0OaHubeT0lT0KdzB/6mCdgrEGTq
    DSNHlBaJXohruxToxVTUauoWmm1SguPcHuk5n8ty/BsZy8xeCBeM3NP1LRR5duuDnQj55S
    798WLu76nL+kmR0TMvafxK80f5dtiN86F7nYwWXfqJqcjBOZKTtNqnSgNqf6EcdhsqzwMv
    U+IJKwA7Lhe4SrOnotLI9Va/FtfjaU6FyBnRbYv5yu9j9GXSaHKZ00lkLwjKhseyMvqVmq
    DwqbM//7J2gkyQ3JwevoI810HpOCN6LqQUEp039KUmdDe7Vg+cnCvVRq1lo6h326MtZCtI
    wOzkE45POR9F6WnRQzc4Fjz9tG/UV8rYzpbBCmyg0L7yP6byhJe0byslka/LjAD1uxbaec
    rBa2r0VeCJjMO7dZBO68NXUqxiNRnFrLQNlFcNncuU6/wcvFwLjN5kiFNkYLjbThLlXQvb
    GJZwdYbd7Wmi2yKqKYXIeppz9IRuqbilGJAfHElCWStFz0RFx6K8ASmodX4UyeggI3q00c
    Vpx9No0H44+FtAlmnIFzCZbcxolh/b5bNDJ8ybxbQj6xpnuNl01hPYuz7VoQ
X-ME-Proxy: <xmx:mLG1arFvkueVIGWMug1iqy1qzIZHx7dpPgo36c2Qt66bBZ_hnS4u6g>
    <xmx:mLG1amBNShrb-R8QCDsdL1mjnK4gamZ4oShdrVzzcbxKp3pdaGNjIg>
    <xmx:mLG1annIAkgkTTEOPkP15DSYN1WjbWJpJ5Xt_21Lo0xasTYmUVF-FQ>
    <xmx:mLG1ahQzovCo-Q9NDNRhyCyhLoLi9z1gheCrzfS7sgKubYfdd1dk2A>
    <xmx:mbG1aqmpQKPGHwsdGeUiMnlKbmEK0nboy1c5ybaaKErirJqyBiznj6bW>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Sep 2026 19:26:12 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: a.hindborg@kernel.org,
	gary@garyguo.net,
	ojeda@kernel.org
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
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
Subject: [PATCH v4 1/2] rust: bindings: set HZ to CONFIG_HZ
Date: Fri, 25 Sep 2026 08:25:29 +0900
Message-ID: <20260924232530.446588-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924232530.446588-1-tomo@flapping.org>
References: <20260924232530.446588-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

include/uapi/asm-generic/param.h defines HZ as __USER_HZ and
include/asm-generic/param.h then sets it to CONFIG_HZ. bindgen keeps the
first definition of a macro and ignores a later #undef, so the generated
binding is __USER_HZ.

Redefine HZ in rust/bindings/lib.rs, the same way compat_ptr_ioctl is
redefined there. Nothing in the tree reads bindings::HZ today, so this
prevents accidental misuse rather than fixing a bug.

Suggested-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/bindings/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 439ab88a5da1..98313fc31024 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -83,3 +83,8 @@ mod bindings_helper {
         None
     }
 };
+
+// `bindgen` keeps the first definition of a macro and ignores a later `#undef`.
+// The generated `HZ` is therefore `__USER_HZ` from
+// `include/uapi/asm-generic/param.h`, not `CONFIG_HZ`.
+pub const HZ: u32 = CONFIG_HZ;
-- 
2.43.0

