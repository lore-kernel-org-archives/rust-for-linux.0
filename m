Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C60492E21
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 23:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788908708; cv=none; b=QPbhmYo84B2zEWyYDmaXYyx47DCnbRxXIJPI9HUW4Wyf96B8cKPrRECz4oIhc2ii9A+azXXZuo9wo565Z612UA7s2EWiKKzkYFod3RcWFwyOVpziCl5VlK0h3C3DxjR7oB87qYxeVGZwHakrEBEYH0UfdVuLR9CGuLCXPywtFgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788908708; c=relaxed/simple;
	bh=XpWEmylEzSBX/z1nAeMlOBrxQpGGoAKw+WMgJ7mflPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6TWIbTl8mLyTOu3ZbogupkWMLrd8hMR25WzVTrybmmL0mp/8q5mwtz2UAYpwpurRELxaL85WeNo6Ki4zGmzHeiNp+Fl8erQ0zl0I9E+i18xYFqPZ9yN5J+nAuVW8TmRnV5Dh3BgLrErZjLlGNaZbuxyin0WSlxp5VlupDnFHEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=XCw1mYvO; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=vaDiezIq; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="XCw1mYvO";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="vaDiezIq"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id BAC1A1D000D3;
	Tue,  8 Sep 2026 19:05:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 08 Sep 2026 19:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1788908704; x=
	1788995104; bh=DIKh3NYMXUqEDOkBeQZ0OOJ5tPJvoLQuYbSeRyBaf+w=; b=X
	Cw1mYvO8nYHOWcv9AOCx2cMJPThm4c0BscSaNqYkhFcLcefdZSlc6sL1kljHdn2n
	LHd5Xd21em4kl2jPBeNBJK9cEg7reexK6kGx90a1ddvt2QarwmMVCVWvKh121lyH
	YKRZlWZdGo632se1PTqUSP3iOxJYelFJ56KYSppjFC/qB0MueDx9pxBjO7bmPSID
	k3BtI87J9ZKocSWbHUcfWKziX9kR0XuChMSEgWZDi7X1a5got3+3S5P0oW1BhCor
	g+DqsyvSKe3+BRXlUvf1QY+6hckX+D4nOIHjE40Ox3RLrv7tiZ646duVjdO69ipy
	nAbgnUoxISCPNkSWpCndg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1788908704; x=1788995104; bh=D
	IKh3NYMXUqEDOkBeQZ0OOJ5tPJvoLQuYbSeRyBaf+w=; b=vaDiezIqLXZ42ihJK
	ZehZLG4Tjw8H//bs1qde84DN4TS9w1jPRtPPOKKTfdr9qq38bHJLpZBBVeaueBw6
	N/TFhPPVykBqBaZfNILIkiZCCUcypOcSZ4fQxnQHrP+GOoRICZ5GreLMPOERdQGT
	d7xzzWOjXF8FXowlnYUPzTVbKU7ZUPhtUEZ9D8qMoXLDcGEYda0rD4gIV5vrTC1z
	Iu+9+17WnkKzkq/iTpMwsWnpzIWzV/EFMb9bDX32PLUhR8Z0I/Cj5zM2X4byzXDO
	qo2nH4ETr8o9Ne8/SMYqkQ6OEN6+8emWe1O6hSWjjwA1TqfJHTELBKrnrIWof5Ys
	pXo6A==
X-ME-Sender: <xms:oJSgalLdPkT_1J2GedQLiXD42qMQdjskjhSWQBvccQX1KzeSph6MCQ>
    <xme:oJSgatA2N4nH8vAwtqHd7_suzFwc6njFVMRm6Oowjq1sTT4MuijSeHRNnIhjsxO_C
    UDz21LF_J1YUWivGFeWvqONH-GiLKhKh0HaJu5KkcPNz_NqAJvxcGw>
X-ME-Received: <xmr:oJSgapMdlfjoh7S37pbaLocxSm2g6YupdOu9uxJNqyTQXWwIwksSuceVUVthQcQL2k0e7tbsnhzS6v0kD_I>
X-ME-Proxy-Cause: dmFkZTGfb1s+qsgLQNGIT/qdpsGQbHHQ7uv1q5FEKBydyHq1+WRxQWG5PG0au7kMjFTVjd
    0HVcE4PUszpPQpXsfqUfixscJkMU7ER8ArEM83mcW+nCICmYMwQoRAmgF0SRqTKyWahs5P
    5fLdJGDrjwTYjFzu0NFLG0KZVMkU+vP/JRTB9VrrcxZXYYAlG6WZSBhZZFTDEfmSfZVQlF
    MNIn8ha3Zmf7lWp4G5ZlredgmrcbHp4tw58QYST88AtEx5oACbMQa6+ufE5MqBlh2k3AAl
    oRI5PxkDU/3IYbFSQSokm6XqjBDhM9y+8VVz5YNOLo9TWx0GkT5zueZX1t48f343FmP6mQ
    luqJH1hRcsS/02w3//wSfcS/rKBfq1q174ABRxohW3h7fzPOnXd8YOpFm3sM4m6Cw8sBXX
    ujMCZvLPyqA2RQj0BAKzZWXID6teNA8Kk7G5CmdEaUhqByswhMYEjHlt5uzkLsMsawf3Ds
    f+sy8ZoJBHEWiRrgEwLDYDJXwlDx4IkGG6X26Fu1JDT6QfIaIx2YgQ0+1G3+8vVcmqaKbp
    prsg6B1rIc/x6IxmPQUlkmBeDGfs6V9/wZBGg+ZLqClgc9Zd6IVDmDQUdDEQaENwrGvcb6
    hH1KjkbtATMOG5o40AcnWr55IHJLRu+aLHYPGWOmw6H50Ai+Ayu7Z9eKE8Ww
X-ME-Proxy: <xmx:oJSgaqWTBuEzSNhnIs5dtVCYj8CONinwl0ZkXO_zCxMmbgp0qwkgSg>
    <xmx:oJSgakTU-mWVf4j3xomiLW5iuopNXES2NFF1E9bhRBPTSsDcjPHrPQ>
    <xmx:oJSgao0PjS1WXMAY7r3kVnl7Bed5VE8kOsiU1AYh_4ru_LXkpgYZkw>
    <xmx:oJSgaphuzsYgBgkAjYq1hiiEvsPYeT2Lh7Ucc-ZBhiQyKGzOy4jyzw>
    <xmx:oJSgat2Ut16FILAPh0g6qGlEy6MDQdsrCsBcOZc26lSLp3eQ07grclx4>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 19:04:59 -0400 (EDT)
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
Subject: [PATCH v3 1/2] rust: bindings: set HZ to CONFIG_HZ
Date: Wed,  9 Sep 2026 08:04:44 +0900
Message-ID: <20260908230445.2430296-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908230445.2430296-1-tomo@flapping.org>
References: <20260908230445.2430296-1-tomo@flapping.org>
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
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/bindings/lib.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/bindings/lib.rs b/rust/bindings/lib.rs
index 812f8e5a08d5..c17e6c2b775f 100644
--- a/rust/bindings/lib.rs
+++ b/rust/bindings/lib.rs
@@ -81,3 +81,8 @@ mod bindings_helper {
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

