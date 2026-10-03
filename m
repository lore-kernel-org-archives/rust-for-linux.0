Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C6D3AE704
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031159; cv=none; b=mPFkzdhYvbz3XF5nOFVpkepISCJQSLSKCTk5PtmSFFwIWtstBxAXsfM1bzgT5Sz3IImaWFiC2b/5Z3WWBbLoCZa43NL1bq8/zOdTBG7fYmKf4fKQo9UMSWJNIFjHWglTsQeWP5LMLDk8T3hq1IFI9kahhVaraeEq2SsiBUfgsqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031159; c=relaxed/simple;
	bh=6Nab35Dc7zlHbqkD47crE6K2rzQxmGmmg0Kq1A0tYWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XqC5z7XH3kknOZu+TB0iekRud/YlkvpovwTfD+e9DEgqMAf4IxjTy6tDrV2zu0yMdOZ4Wu4uKF8al5zW86fxyuC4h5MmzQL/RzlG4xSPQkJu4PGNLWnmgQrip+yUJ57yP37uSLrpnsmQOR03xczf/wL14MbAy0DMUDNU+IfIrw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=lv7D+FPx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=C9B+d0WK; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="lv7D+FPx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="C9B+d0WK"
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 77FFFEC03F2
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Oct 2026 08:39:16 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 03 Oct 2026 08:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1791031156; x=
	1791117556; bh=M8HycH4w0xpqarbuNKW8Is5k/cTqseRkYHcHn5EvaFo=; b=l
	v7D+FPxJsBUi/QieSnvwxOUK0eGmaW4+mqDubr1+MlkT22onJGbDiq5eddWqmJXB
	hND/tiJWj0XZ45ey0kPxTSDDtMAseOy2GOZNR+6gNSvoPwekwujSz/1A5pbpB1Jp
	sdLV+EZGYR/bCv8PObyjmV2KcVkqBMX391wO2V9JqhpMoV+MvNIgaQDS0R3RgslY
	Yli+7/1VYjFJOzU+EgvSqz5H8F/DtfZGyNcKThrK2S/wrUvmsEciCtEB1l/GvK7/
	Dx7USRe+hsnZk6Bas0Kmh1lLAAfEQL3LWXYbL8l2wSEw5yDge6t9+R8NeLqKaEgv
	JSOk5/3JeSC9OSjwSZ/tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1791031156; x=1791117556; bh=M
	8HycH4w0xpqarbuNKW8Is5k/cTqseRkYHcHn5EvaFo=; b=C9B+d0WKPUj0M3GvG
	wKX+GzN/WGUlpp/GVJvRPTTV+WHnRJXj6nWnyIqalLz7bFpcwwrGSCH6tkSeE92x
	25qmS1Yo+BnMPc4I0OxpDuR2qx/KrW9nOt87jFJOOHH70QAHVpQ5x0UNj6xY0APB
	6ARUKm3PkKTrWK2NRw29A+038E+RSCJ3f7v5YKt+eiMuCVJ0COJQMmzllX1MjjVi
	m966JUerS6vOlkHNe/sz1cnpZooNrxqMJqJxTh905yD3aRy4WmukfRlgTEP7DZ/x
	oASchswCpkKzM+Sf545P6+heOCFEbYrwePFY+9QVb77aXzcC3krMARUduYp/cJs4
	Wtjaw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791031156; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm3:rsa-sha256:XCGNC3V4PhhZA8LK4/C8NcKi+WprualtcvtzxydAehVZ3X/
	G/7GNygvy507JB4sQZEKMqOP1fdLc1FvTsTsCXiP9QhK00T4KrfWT2bj8czwlrFt
	xF7Kdrmalhe7QvUMIOMO4WLOx38X9uy/kzU+PFWTxc3VGPPaFPNuzt64mrY2Pufa
	hS/pvp31g3K7KRWoOjE82NZIvPobt3AyBDY8nXwoSL3zlbVenQ2wwHS8+cTVUS/F
	US1py/s3/oixmpegU/9xp2gBrBY/lIcEboCA9yhB7gihvZ+4zHL4tODGpLxdbiem
	6EqICMkz9BzMZ4zu6nNgePm6Oz7hMrIW/r0xYdg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:8+0gGK7xEL5KdR2J+s2Da0p26NNuWTKEKkKWSX3b3dM=:6Nab35Dc7zlHbqkD47crE6K2rzQxmGmmg0Kq1A0tYWM=;
X-ME-Sender: <xms:dPfAaoswOoaUTCzjkI8usn-e2uPYb29F1zfMu5chTfPFR_smMwjHWg>
    <xme:dPfAah0NaPl54mUPnvq_9H5sfeKqSzNDz_CRhePIg7wxeVm_Q4s8-uJmYUKfi4ek2
    IYLCIKeOLG588lKtpqQC979bZHDHfU8OebHa_DE4gUAy8prNSQxA_NV>
X-ME-Received: <xmr:dPfAaoM0jSxsx-9__0i5VmnENqKrKDdqG7AoqcwStPIuD_wSc2wrkqg2vvnl3zciWyEfX1iqBstgPc5qUTc>
X-ME-Proxy-Cause: dmFkZTGTbfV9H9iKSXjFIvwXx2JyQXFB+r32PBVFa0sA11jZh4p31tLlqygR2H7BjabDhV
    h7v45z6ocwD2dLY413VOneBHZWBnFIB9ws36oIggZHK+iE3DDayxIESCZVeMw9ekNYn9US
    YYP2CDuVwrUdq4fvr/x1TATbhsNHDT3BShzDu/SJhflgqaXDTAGCxmaPuY4aM1yX0ey7sg
    gV9yG6yOJAyaPaCU+g1a5c/JBNUCpIl7GxIhSN7PvLJQKEh4ZzyIaK1exi7ANxISwA/3BJ
    pf1lZfYjydkt10W6Pi29Gq/hWYgnrrCXhbyQTmhVz0C8rw6d2V6iLcebTOlr9ezVkQsdeN
    PtoG01CJ8OKlIqyUUFrD5iXA71Hl4HMeQJm0PVNLVEDwN1lEYjOkWOD3ZFCcAeJzZBUKH5
    4wpe8ZcA+jpiPfDTZV7vh478B8ugQTXLhGgcrY7zoUqau/6sBbI9fd7Fd/WvInZoljqJAN
    lfGxdLO9e3/6LZ776ucxKhTULZbskTpc0bXPgAAmcTDdEMaO45tZq/9oF9Wn/d4Lh+4bku
    qynkswE/1BJKx5UwQgIopXBQguPrbZq2+z6FL3ujHZipPgJtLMzPLDFBaG462FG0YW8nt7
    ciomfhCuPvBaKjbi7fv4GV/brbPmwboxsHmVN2s4uLH06inwnvNJaigbnhwA
X-ME-Proxy: <xmx:dPfAapUiRl_NMTStLAJIvuDXDCCNSyiIqvzq9UegEmjvsKE-54vN3g>
    <xmx:dPfAalY3EVgTTx6WrPrN6JNzsfdTS4TEZQ1XHN2CJxfdJrcno-5XRA>
    <xmx:dPfAar33uqm-DxEfGR0s3oj260bKZrRslIqi3SueuvWK2f-jzBwxwA>
    <xmx:dPfAapBOlhvsmxufZEJxpkKBv9p6YOaGvsFZPklPlPM2xKbagHQVgA>
    <xmx:dPfAaik_YpR-UhneUJud3fXCfFQKYK0TI7v73osAliPQbxcNhRPGh0Ux>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Oct 2026 08:39:12 -0400 (EDT)
From: FUJITA Tomonori <tomo@flapping.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	bjorn3_gh@protonmail.com,
	boqun@kernel.org,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	gary@garyguo.net,
	lossin@kernel.org,
	tamird@kernel.org,
	tmgross@umich.edu,
	work@onurozkan.dev,
	rust-for-linux@vger.kernel.org,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: [PATCH v1 1/2] rust: bug: document when to use the WARN macros
Date: Sat,  3 Oct 2026 21:39:02 +0900
Message-ID: <20261003123903.113572-2-tomo@flapping.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261003123903.113572-1-tomo@flapping.org>
References: <20261003123903.113572-1-tomo@flapping.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

From: FUJITA Tomonori <fujita.tomonori@gmail.com>

Add a note to the module documentation, based on the comment in
`include/asm-generic/bug.h`: use the WARN macros only for kernel bugs,
not for invalid inputs from user space, the network or devices.

Also mention `panic_on_warn`, since a warning can then crash the
machine.

Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
---
 rust/kernel/bug.rs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/rust/kernel/bug.rs b/rust/kernel/bug.rs
index 6abed2c055b1..569dc05d75ad 100644
--- a/rust/kernel/bug.rs
+++ b/rust/kernel/bug.rs
@@ -4,6 +4,11 @@
 
 //! Support for BUG and WARN functionality.
 //!
+//! Use the WARN macros only for kernel bugs that the kernel can recover
+//! from. Do not use them for invalid inputs from user space, the network or
+//! devices, or for transient conditions like `ENOMEM` or `EAGAIN`. A warning
+//! can crash the machine when `panic_on_warn` is enabled.
+//!
 //! C header: [`include/asm-generic/bug.h`](srctree/include/asm-generic/bug.h)
 
 #[macro_export]
-- 
2.43.0

