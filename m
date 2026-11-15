Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794778904;
	b=OW9U5c6JJj1mBuhFwOB+GyA/mcUKoPy9ppz7T4YX75cnFVMVMZs2zDxIE8OHs09CBLxA
	 78YeYU+FY6/A05wueJy8H5Rp5WwbZUjar0vwAObi8gS2bPFQttl1HXWslZFdDVJFAOnTE
	 I4hAwFDPqp4KPyOCwCKP2lUO8Yfhk/y9IH4uhNXv+HxTxmqFpXQ6MEQSQrPCocg3TcCoR
	 fw2VGi8gIcIj4do4QWMvRP+tNm272aqXaJN8TiunXXEsR/w1iyDvTGp594WeZQq/bTWiu
	 14ArA95rGqiNM3Wi3Q+3cMOoNuCcoz1HxLOTBDs72r0Qbfq35s2oqZJYN97BGyjR2Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794778904;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GB/JC7h5OGBUp9Nk2xOeVywvFJe8tMuVU8mfvdMIBJk=;
	b=ipgD99kXixHBPjQhxaav8FM8mF09nUuciq1+wxrRlV8cJqN2clJsK4MQ96+yWBwP9jNz
	 4K4jmznI7Gt5pJzNhKM53IGEm5DcJtjZJgvjqEiBdmg0P21XqcVdJ7YlPpvGWScgJmqGI
	 pn8JbmI7iZC5B5iMuuyvwSd2OQbcMGbHzLYOA/w/kDHg1g00x3STU9DUIgLtPuyhaheGe
	 MTBQV1HRaTUnXvGonQX6OFvtY3zb9nTrKADirgI3+6ZxSHB3PPH+cmjkUh3aKVAiIoQ9g
	 Z/ATYTeoBMKfkrvw5MiJu/S/nLuf2lOyhIPpibKL0W51lJo3J8guHTAoAEXqwbBywYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=JX++cgOv;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jHF5N18a;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 133E0606A32C
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Nov 2026 21:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 133E0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=JX++cgOv;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=jHF5N18a
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 06C34EC01DB
	for <rust-for-linux@vger.kernel.org>; Sun, 15 Nov 2026 16:41:42 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Sun, 15 Nov 2026 16:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1794778901; x=1794865301; bh=GB/JC7h5OGBUp9Nk2xOeV
	ywvFJe8tMuVU8mfvdMIBJk=; b=JX++cgOveCJHoYZBuhWG4SMJPAeGSIeHdS3am
	WAR6rECRHW5fFYMJEzC/kYoM8bEdlhfqXIRfwDi76tvOGQcVaxTxGO6wOyG26utx
	G1sh0qPhb9w/JrVEBAn7QO2/KgMk/VN5xolHUjPZioFTJnBCeokum2w12eSvckxe
	S7ivpVfgbZp5JpPGYNbNG13VuxZ1w5kM6a6q6dwLx7j1HVtdon4aX/+j7sNTPTBY
	OTCgWhRpjLnecrxFZd2rZ3gIk05JFOlfP/J7y1RceZMccR3Uwq1DlbVmPNtGNIFr
	toor4Aa78j53RF/tXNmp6ooZoQiZgbPilIlwoeod5/4e+z0NQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1794778901; x=1794865301; bh=GB/JC7h5OGBUp9Nk2xOeVywvFJe8tMuVU8m
	fvdMIBJk=; b=jHF5N18al/8wla0ie7w9R2GS2d2JobMPwA3Q/f5SpZ9q/rPHrmD
	nZdyLL28OIU7cVcYCZhyTaOJKQy5sHYPh1vLKVL1ODYZC/e4wSAYIfJx5VxXr+g7
	FIns4wzjbncumJe7yCcr8S/s7pbppbUrFJHPspbZSpTrDZK8HHwYhXCgjHLDXieg
	138YTA5bFZzgR+P8JWnhiGBTqnY0jU0+AGLOA5F95KxDgJV9uv4THxFnLBj9r/i0
	+QYItGNdcuXwlYAcJJx7ee00xiM0wkVJqLVW711w9ojfKnkV7oKSqRBL1Ab7DORX
	dVeGkg2nLgPb09BYmtFMHVEh5Hq+WwfSbbw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794778901; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:IMQz9SpTDLld5NqE0bfgOQJ22R0ZzC0YwiO36/sm/XI2nrT
	AM6PHO53flfvlT16DCBylV50zPuG56eeHr7UE61LfREt+htyF6wBCN+JxS/DCHan
	0ShnU2tRp7mkybiunX2TIWuMwiKDE4VweJqD+ZW/bidxZrGWmJ6JoUM8UQgJ7P8T
	Sfi7DUEVfgzL5GZY9Poo5ONIJ2l1Ty50C4rNijmq8CtxGIfCkZz8SbM53ExOlNR6
	7O4KUEhSEoT1fqDDwGE5klZdqwQGxW29JVav1anYItr30rQTubad36sdz8Oy2fTy
	nJ4DGfE6XjVMoR7iYkUco0aeC4eXZ6wxOdk3sqA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ey3i4jKRAMWQ/EUzBri/JGZ2T7ThcVkwUJEtULZDA2g=:RlPPjZBGV8azsEj1TUVTlQTdCj4VGFqxVLa/V+0boGU=;
X-ME-Sender: <xms:FSf6aqpgq-MvViHqIElebfyMSFTZ5M6NSQxSNGJxrM8nw9aEly-RZw>
    <xme:FSf6aqB7o9M5gLZZUNF2XGX6J2OVIAegBTG7bQh26LRELwCk2KEplJnAHUKEpz7mY
    EgTEpMyNkZeCHRXorhoHPwZw--Tn83e-rNVbSZARtj3KXFHSsYC6oZz>
X-ME-Received: <xmr:FSf6aoci5FCt5YQrpN8YxgUfn96fMEaTGoz7LonJRLhHqS4oZAAD2KPaj5_iF6A9jbfNFNI0CF5-9QLbHyM>
X-ME-Proxy-Cause: dmFkZTEIsGbILGY9khc5hUU08HVkon6AENbp9Y0ehysLeDD2UF86o/T/iHPL3+JesA6Rxl
    MSbs5gCAGioqc44C94WXqBXDYGC63AMjxjIQZ4ScVC3qkwXGo5sDGhCTDnWiIslLserU43
    tC7Gais8xOACKdJjN9KXYe3qjQU4V1AlpU5JnVRpUEhemgIvdJen1vTvsdfaJGHI/F/OKC
    cNymXHcaTr0S4RM8UfQ4KuuQU9sti11zhxz0/r14BEvfFirGc3QUeyiye/fO8MXkoWMPll
    PT9g/gQr3aSWb2ETD0exaA/THO+SWw19O35xAegRxzBVpkd5tTKHFXeqEBVNXeuQCyTATR
    Qw20nZcNH28hoF6P06nX+5pzr8CZ6rNhvuAaGHc+Sg3xqjbGQABCGccmf2kZ9LmSAdYU29
    SgFloYd/XOAsgV0GGxJT3JXtaNA/qXRGZJK1pJcYMbVQu6qMoy7jVyk85+AC2TTf0rwEy4
    aodgDlm5kdj+oAvgIZgmuEpkPk+Tykf1wuQl0sLH0kkeuy8oVF9H5i8Xk9Qb1tdNA7i8OL
    uUMxLrccjIReAAoVHdHX+s0/ZpkoRzxRxkRWsSx1OIiL4j06UqDFS8F84C9CQ/PHHJzLW+
    oja5+u0HkFJtSB4CeNC350qIJOLmxawYBvtU7jDkIwXE7N2GLVhYIJztX/xA
X-ME-Proxy: <xmx:FSf6aiK0klLzZjBAbRxuydc79qjb8aoYyQPxiKS5Y1qX1FdxSc-9cQ>
    <xmx:FSf6agtIS5c_kOmX3hB2hqWUq53NrqHYlRoGBPwr5ECcK3J6_0Q2-Q>
    <xmx:FSf6akbszhbu6rAEZAqnlDLQP3O11BOX4Y0jCEgYKcgvAfCtZJ1Jrw>
    <xmx:FSf6ag3Q2NT8Aj76OVOcgiXE5MNRNsAhCTUn6y4zLgW1uJqoQi0p4w>
    <xmx:FSf6at9yi19_vsTchHOF2QkDFepDNy1wOVyRUAHpZ-yDag-UbGWt1qkn>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Nov 2026 16:41:37 -0500 (EST)
From: FUJITA Tomonori <tomo@flapping.org>
To: corbet@lwn.net,
	ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	linux-doc@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1] docs: rust: add guidelines for Display and Debug
Date: Mon, 16 Nov 2026 06:40:25 +0900
Message-ID: <20261115214025.2122718-1-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

The kernel crate has no written rule about when a type should implement
Display and when it should implement only Debug. This came up in the
review of a patch that adds Display for Delta.

Add a section that follows the usual Rust convention, with one kernel
specific point about types that correspond to C types.

Link: https://lore.kernel.org/rust-for-linux/87se19qgeu.fsf@t14s.mail-host-address-is-not-set/
Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 Documentation/rust/coding-guidelines.rst | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/rust/coding-guidelines.rst b/Documentation/rust/coding-guidelines.rst
index 3198be3a6d63..90e6fdf886ea 100644
--- a/Documentation/rust/coding-guidelines.rst
+++ b/Documentation/rust/coding-guidelines.rst
@@ -333,6 +333,28 @@ That is, the equivalent of ``GPIO_LINE_DIRECTION_IN`` would be referred to as
 ``gpio::gpio_line_direction::GPIO_LINE_DIRECTION_IN``.
 
 
+Formatting traits
+-----------------
+
+Rust kernel code follows the usual Rust convention that ``Display`` should only
+be implemented when there is a single obvious way to format the values of a type
+as text:
+
+	https://doc.rust-lang.org/core/fmt/trait.Display.html#internationalization
+
+For a type that corresponds to a C type, a format that the C side already uses
+also counts as such an obvious way, e.g. the output of a ``printk`` format
+specifier such as ``%pe``.
+
+On the other hand, some types have no single obvious format. For example, a
+quantity with a unit, such as ``Delta`` or ``Hertz``, can be printed in
+different units and with different precision.
+
+For such types, ``Debug`` should be implemented instead of ``Display``. Its
+output is for debugging, so any format that is useful for developers can be
+used. Usually ``#[derive(Debug)]`` is enough.
+
+
 Lints
 -----
 

base-commit: 23c62304dde29abe92013d85910d03a77dada35d
-- 
2.43.0

