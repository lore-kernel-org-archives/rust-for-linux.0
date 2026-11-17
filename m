Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913657;
	b=DualimVqnCbR7fwPtTH2BzmFNiUqIQBdmRjKzg6E7dK5z/JCYbWqlrbV9vKDJYROZUUp
	 zMGEVp+JN3cDn0ar7ucNRo3LuPr7T0xSQco9F8M2ZYubFuBSh6Is1XwTnw5z2xIU+QFhA
	 32sR+Ck1N1l9IiA/epFcI8/aBnqRW6cuGIfhyRTirHkAtlsJ6CF9CLzqul6Ov1ytRaLqE
	 Wm9vbvzx98l165L+uyD5rOVy3VM56qwgmDUf7ipuaCd1wr3KUoEND7O1k8ikdB4E7W6yS
	 6VjFVI60ynqOY+EIcWmQGQWU2l709QR5veaBd23xF/UQxWz3uLhCuBH+8vsg6358Xuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913657;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=vjRIjcJkrzYCae4IvHKKcwL/pOC/E5LbFizE3ysUIzM=;
	b=cf8dJfBtJLyD+oF1LQLgf9+7Cd3zXvznLoFBVGaBdmqpzoD2ChCTDFochxx0yhPnKm4i
	 5zA6w20xe9UUqMqKMT7ksxc+8SZXcYqz+Ks1paQprcq+1ulBjOemsxDbSlZs2nC0Cs2aO
	 Ibc0USzaRrbfsTP7LQJd21NntEvP+nE3IkAUxFmCCdNFae1jJlLpi7LilmQnoul7Y8UK/
	 3Ol0IJrjEONmYyxfVartoZQYYzJ9ZUEo295thw/MgrisLyh3c6pzJAvudbn/lcyVrWeEF
	 S1XCy/xxdUdagBIEALPAfU+l5YUGFzhrUvz2qk6g7q8gicloNM2o8v6Y8fZsiFySROQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=fZXPoPVV;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=z8L3qdAu;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63B0606A323
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 11:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A63B0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=fZXPoPVV;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=z8L3qdAu
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id ED8071D00268
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:07:35 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 17 Nov 2026 06:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794913653;
	 x=1795000053; bh=vjRIjcJkrzYCae4IvHKKcwL/pOC/E5LbFizE3ysUIzM=; b=
	fZXPoPVVMtS+aoGlzcGWSrapsUvnkMk/a89ZDZ4LGR3W8nPqfqHmAqxf0Tz8Gc+e
	6FXimqR1kKenrbEyEIzokbRIWBdztXtVwbkmY9aTVvQni+GviGC5FynR2oNf4W+9
	y3qonbtz/yuZ4pgrSjfMsoho8aR0uPqLXqnigPJKD/4cDhmSnFpn6avS/8Ry1x++
	rQEHSVbLBvgZCghGI4edDBSsNv9U09JVJ2GT+DFav0CF5G2xyuIwd//HTdRSgkP6
	qPlrLJF/h8G+H+9prxoRILw4KCRxn7ghEPMf3EbLLkJRnrFB0+wSjvWzkvP8sxsr
	KAQNK6oU/z/YfNBEVLjyDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794913653; x=
	1795000053; bh=vjRIjcJkrzYCae4IvHKKcwL/pOC/E5LbFizE3ysUIzM=; b=z
	8L3qdAuteiIWWFEYQENmkdROwygG23zeVZkzAMdM2xrx4HKVYVvOYPk0cdqv7oBq
	rW65YLsRi6gAFU6eE6VwaC7vS424b9ipuOeDzAs9uYUU1QFBAl4RgMW+PGgr089K
	6tM7Z0VKa2Md+4PeFoN2tp3qkxzJugloRAz0uKxwZ2SNi4ewo6/dg/yNzMtSmIyX
	1FgueAU+uH4gFzGPVDYX5xmlSoncxevWytzm21AbI7JXOTV1JG3TYLu4SpATV8Vs
	aeP22sAKulTmMHYXmv5YlbwS58dFNcvEE3KGMXHrkHv5dNAnsPLPxcMOGsBaC39/
	ulzwpAjyeLGMihBAKo7oQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794913653; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:NGVGKfXuyGl8nw49RMcQ44AVxEL+SD1/lsYxCqJjcimGy7d
	5+BR4jyCzB/S3VmzR3iByuQZK0iwz3IrIlRDXb7ylrp+usdoi2q4DHpOD8s1PIun
	5v9t8hbapwkOvG2ueB7sJWMWY/rEYvM4bOhNjLS7hkU6U5x9LjuIpTYb2av7DSwH
	uJEu+q7kPxe3VO1v2v/4Qd+v2hx4ZXkQGyUYolJX6c7uaOCaFfhh9AqKyitMaBtK
	rojyk6m0DJHzbewjXzdA94/5siblTSbH3RVKCP7xPWt/KJZwaJNgkAFbMvQ0i8Z7
	EPiQLNJcevsqdeTVt36L/PakviPmhE/32Td3KrQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:aYG8VFvwmB3rFG37NVHmc5AynBsHYZB482v9B7cYIkY=:MlonHz3UvF8UUTSu7Irht5Uln0/wOK3NL5qLgJImQ8I=;
X-ME-Sender: <xms:dTX8am5l4D8QwaTqDZ5oHVw6EXz-TQBSgf7i8v3CDdVGla0a-LNQpA>
    <xme:dTX8apRPeoT3m0VsxbCZnW1MQncmG5XSSK2ssu5yNh7ap7EyLfaV_GTM9yjc-L2yD
    i2y6iWdxB8yAovAr7ywKIldMSRimILegln39ZPHoEA5HQlUB8mHguc7>
X-ME-Received: <xmr:dTX8at8XAtBE4HhvAvavTBwJgoDPuRQshEEnoxTakagvne4EWcfR02o0yAHYWuFmu91QhYeI6PVuzwNyG6cpFCfV>
X-ME-Proxy-Cause: dmFkZTEO9ZukNi5VTW4VOF/0Bzojt4gQGj6efg/G1TEgFO0ghA8Bl87pHu4eQBFXlhkypT
    CsZc5DqJRPKPnZY1zNqeFV06hlHCIcwkDic7xJwV131WQt3IQg2ZL2ODgioKqQAhotgdZ8
    leJPY6h99Rgm3/KBgSJ+MSJAk3PbFx9MrMyVzhUdvkdv5Hrfl7MlnXn+GyVFot9ka6ZBaq
    eArAfeWLplhASdr9psyQwIkI0FWpqRjtrVn7yBwCmYswFGj/bRktNkwld35Yw1XE2kkvPn
    Mu4rI5pocDnRe4PXhxrzDx/XxnTtbDgi3ZzbyZbThNEaeCSB3y86pmbqzfdm3H2BJt0pZB
    GYLNYPD3VEgKqadzHEMkpv+t3OhOIiCRC6zdNqdxUlsB71/bsZeYg2J1NtDLyVJOI8LSr3
    pR5p0gMK5lh14ikBGnl8NQSwxtc8IY0Aev8nnHbb8MmeZCd3+3Bk31y870yu7XBNo7oo30
    AsOp+6ks9ujVljvpjHNIfl8tzpkSOiIpToXutIWmEWBPU8e0exv/2ZAEoroMqUFI0mrLcf
    Z2+0a+jvMmC0eRj+MhfeIz05eaF778kII8QOb8/o5xq4PRcFFbulP/7fs4LKBJKaIFC7x+
    apD65sq6O6kZSFMqcUGbsdWTeuGs0hS7FmbomkKSf7y5Iwe+1KIx7vbbR8mA
X-ME-Proxy: <xmx:dTX8aioCIxIE_CFExXc_wY-xBqnHBzMnR6SAtLCByysTfx6M8Tecew>
    <xmx:dTX8arWtPnYN1bsf5zEapBuLmCpMSiQgLwcel6tXu9LMP-bozMr4FQ>
    <xmx:dTX8av5dHm8H01aqE2_1Eewt3X2WQj5zXBUmJ8N5MfMRmS5g3FYXag>
    <xmx:dTX8apDbfTyj3qnh6hzG4rbmb6T72uZlM3VYYqFVVenZJxjzdEJCzg>
    <xmx:dTX8auEFM_mvNssaDFUM_0B3a7KOt0slYjS2nohrZAJOlPomYO42FWbK>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Nov 2026 06:07:29 -0500 (EST)
Date: Tue, 17 Nov 2026 20:07:26 +0900 (JST)
Message-Id: <20261117.200726.1503876918333666825.tomo@flapping.org>
To: dakr@kernel.org, markus.probst@posteo.de, ojeda@kernel.org
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun@kernel.org, daniel.almeida@collabora.com,
 gary@garyguo.net, lossin@kernel.org, tamird@kernel.org, tmgross@umich.edu,
 work@onurozkan.dev, linux-serial@vger.kernel.org,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v3] rust: serdev: use Delta<Jiffy> for timeouts
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261103011143.917147-1-tomo@flapping.org>
References: <20261103011143.917147-1-tomo@flapping.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Tue,  3 Nov 2026 10:11:43 +0900
FUJITA Tomonori <tomo@flapping.org> wrote:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> write_all() and wait_until_sent() take the timeout as a raw Jiffies,
> which is a c_ulong alias. The type does not show the unit.
> 
> Take the timeout as Delta<Jiffy> instead.
> 
> The C side treats a timeout of 0 as "wait indefinitely". The Rust API
> does not keep that meaning. A timeout of 0 or negative is rounded up
> to one jiffy. A caller that wants to wait indefinitely passes
> Delta::from_jiffies(isize::MAX). That value is MAX_SCHEDULE_TIMEOUT.
> The C side replaces 0 with MAX_SCHEDULE_TIMEOUT before it waits, so
> this gives the same wait as a timeout of 0 did before.
> 
> Reviewed-by: Markus Probst <markus.probst@posteo.de>
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Gentle ping.

Danilo, could you take this through driver-core? It applies cleanly to
driver-core-next.
