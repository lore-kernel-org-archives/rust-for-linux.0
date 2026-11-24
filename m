Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525083;
	b=nvt9hZ+5rf23LpAJPvhttODN3VaEUHSSg1y3N1IQltyYRYOisoGrfG93Xx8kabnpYdVo
	 zCuSSbCv9J9j44pjFsY8bKs6mq+3/B5Br9No3q8REWrBYF63Q9njbFxF56BdNbfzTby1i
	 7XJfkoAXGcUs1HMreYLgGFW9Udt2xX3itL7ZeZ9X0wp9ItQTVvRvFptr0NsMu6ZElAhkV
	 HAA6oTldZy9zNJYByVPzzQeGAuX7xj2mThqfiNbyhdZaWTK+YiTgOYRK4Rc8v7Ye7EKxz
	 L08ssj2pzOp9uNl1Fak+vc1YHlLqYxmriDD+0665hk4U1whel7pzEplOz5dU9DVJM5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525083;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=;
	b=Iase8dw8UaLhd98TE0vcD+w0O2Aj0uON+ob4NNSsknT7AcUkm9HBzufsMMuwjR9zUy3l
	 0lW/dVMIW9sEfU8dGOqnXlbNDfjO9dySPjO5OMz2bJzpwobrLxNc+4/amamFx8HbWnucq
	 9EDNtlez7TgGc8TPLeo5IxCg7wl3zNY07z3KG1vAzys16+zUtmXKenkmiDfAXRMxZ5PTz
	 Dtj+2fa1S7pDvjcXN8VqIJupRq+exl2EwTGmhoovBVYd3SSBWfSe6r3WGs6hnDkXOZgJM
	 RAP7RDRbkOJa+FxvuRF4vt9Wro5n+yj7cI/kmVfeH3x2y9/4Iqiv4Nv/oe3NfYGWXhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=eDpyyERx;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=esNsEjvv;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED8606A331
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 12:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7ED8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm2 header.b=eDpyyERx;
	dkim=temperror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=esNsEjvv
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 17D71EC0A63
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Nov 2026 07:57:57 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Tue, 24 Nov 2026 07:57:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1795525076;
	 x=1795611476; bh=hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=; b=
	eDpyyERxpuV96dyUK926kxx80HLyWj9MdZKX8P8+DFHuH31qV6gZCmOCE0qKmH1M
	tWXUx0r76SYbf3F1gRwMuFzpYWMlLMzK478Cz0Pue8Iu6kgWpSVFb6CIWTf5N+rO
	UDN6YazGX4y4qb3/pSFdY5EPV2HlVX8JrMrOCin2wNs6cREub+UKXBunFbM/93Tu
	eMWw1jBwrRjwKIWWhxcj8aEC172v49Iq82GQuuFm4QiGsZYViAym1XcMCbzbAbYK
	71UGy6R/lKo2miqnIgcgQRfBuCATVvywIlJTz4kTjpIgel5B1xTBpoDKj7VFX+EV
	UXM3hai2reGYt8kmJhR4IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1795525076; x=
	1795611476; bh=hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=; b=e
	sNsEjvv552J4YmD7VAyP60krX0/2U7LoMBbM0Cip+w+r9wYEzrWLa6YQbu8uXqhm
	RHVSRAiUmLOTUKy72gMZS9WjPwx53r7Z29JWfV5ZY/ETP5f9N8JiJT6zTr65v7Ll
	5yYS1ChB7YlsW0QuzriuwV7X1DxFDgTlwfb4z/C1CmpAIzcVWeHJ9YB9T/HEgSis
	pSDbZJO9rBSnofmdspNxkAXCh6jM4xpqfPsrM4dkXhz4rGEUzOQYwse/9iYSgHkf
	/18qBeFeQ5n4WaZk9LLLNa5LQT2vuHTedyn59lM1eREDmTkux+Ja86addJWfb23/
	D3y1rGb9e5T7kZaVuk0Iw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1795525076; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm2:rsa-sha256:EihLYVsJ+XciSI5T8DICHMIyFYaW/PgHizBVqRp6nKhhJrf
	2n39bbcsi/MunJpf3cfXmuujDtxYZfC9CWz92tc+uORia6icscfuDfxy9hsYOXUV
	r6r8JRu2pRHmsIIQzTIBY0FiCWFUGUG7kSryRHzjCoB6i1m6P6RmDrBFD9L+qTLF
	0jToXdHLEAeANvFsCvNK9ZpKD5Yfs47309F44E2ixXRr8kXmTTZ/ri7g2yk91EuD
	2BqkKaqDnr4grdQtMu6LLFk9Pf0VnzhAYcYBvlZNy1ktRHOx0BaZvFg7mSZCxI2G
	clKPQWlnksyLNJLB+D/POktSHscJkh3IbQSpjUA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:mUPQZk/Ugd2v+S8N8Y/P93mAiOmiMDPbR22XCMDKqMw=:hgAy+eka0cAq0+QLxxyu37spq/OlHMuxJnqZfMfj3RM=;
X-ME-Sender: <xms:04kFa6Is6eMTnH3UGp1Z93XbkM6ztBwL1JcYIJ2DFcAia-vXaMNjAw>
    <xme:04kFayAMnEogDuKb_gAhNsBVDaSBjZZqV6_-lKM5_aYVC0G4OEOVUjw35gdnMd0ms
    vpDqjIj3mtVnBR_5oOqW7vFJ4MLjhNTkFD3ewHIlTLV_CPJpe53sk59XA>
X-ME-Received: <xmr:04kFa4DwrTsQ0QgNywj16oweAQEprr8Yq3eAFkvPdyxBnt6F_5-IG-5ylZ3b5cpWIMNrFl3gIcz-itW9CfyvgRkM>
X-ME-Proxy-Cause: dmFkZTEIJF2hT6SkjZWf7xNt2XDmCYfGF2ip/5vZexfDeqOf035NIyzz0cdKl9EoKDuWKi
    nibDGO1sJjmVEDNjIq3NtdquANV561dfZJt+nszeBvZhj7SZGLhojmu4Z6RvH4hYfk2hvZ
    0ZkBmmaq69L4JdadAx4NDdgmuWtvC7Ey7Yw/pZZcngjaG0jGQ4PA7SAMqGbarSd7Oh/t7/
    f0ek4HBMDHM294XxzXsEAU0MkLPlrknytVmQRSCJGfE/iQ2irKDtAgBc4AOGr5IsddAXBb
    JfoC1YWyJmwpEqRM8vZmoSM+3Qubgs2NuNd7hzZV6aAU60IZCGQPh3VkmBHQW70vjDSRjH
    iUsbCrX+GlPcSLrpFVdv1UTyGEX6iB+daDgX2DSqRWcy2AmOy5whIUCbTe74/pmEbM6U2V
    NkDc/rVZVc00tE63uEsGZSqzOUM6TewSYQQ8BD6OGj3EEIIseKKlssjnF6tOWvLkiau10p
    /zaQvT0JBRiprjP1wZaFc3qMU8iSny6c2lZDpEVWoZv9Fywc7OQRIjJQBIaGzhALX1DdkD
    MycD56i0LHfu8+4UNdPL/rHVMuDCVn96w7u3l+vAU5HaJUSDLUb/wqGSZt0MeMd60P2rsC
    3ZD36mQoVqIo1cw7nYG5OjI4PF6RELLnhKI/pzjQh5BZQJbx+pqa5nfItZFQ
X-ME-Proxy: <xmx:04kFa7kd00zGchPtlvZ3cGOdPcuW62582j838Tq6t1E7_DncD9rD5g>
    <xmx:04kFa-iyq23-n5Guy_sDtfvqTnAUILTTbf9_F8FCn1JZHNMDRje9jg>
    <xmx:04kFa8fikWXyV8Z6iVyux7F2XrY8Yhe8ZruTBwsttWCvV5YS_JqNrQ>
    <xmx:04kFa2AUoRApSiF21Ow6TOYuHjqeN2F2RF71Low0sDOtnOVG6lxZOQ>
    <xmx:1IkFa3ramOV1_1ewOyGZDY8B6Xpt_zVj_q0u_X0g9I2X2bv_CMYiJcEC>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Nov 2026 07:57:50 -0500 (EST)
Date: Tue, 24 Nov 2026 21:57:47 +0900 (JST)
Message-Id: <20261124.215747.1090155063373507910.tomo@flapping.org>
To: engineer.jjhama@gmail.com, andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 hkallweit1@gmail.com, linux@armlinux.org.uk, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 0/3] rust: net: phy: suspend may run
 without phy_device->lock
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
References: <20261117-exp-phy-rs-maybelocked-v3-0-4e183a7366a7@gmail.com>
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

On Tue, 17 Nov 2026 19:36:18 +0900
SeungJong Ha <engineer.jjhama@gmail.com> wrote:

> Patch 1 drops `read_mmd`, `write_mmd` and `match_phy_device`, which make
> the same claim but are called under other conditions, and have no users.
> Patch 2 makes `Device` generic over a lock context and documents when
> the `Locked` callbacks run without the lock, and patch 3 gives `suspend`
> the `MaybeLocked` one.

Can we use &Device and &mut Device instead of the new context types?

&mut Device means exclusive access to the state that phy_device->lock
protects. &Device makes no such claim. Methods that use that state
(state(), set_speed(), ...) and read_paged() take &mut self. phy_id(),
read(), write() and genphy_suspend() take &self.

Then suspend, match_phy_device, read_mmd and write_mmd get &Device, and
1/3 is not needed. I would rather not drop callbacks. I want to make it
easy to write new PHY drivers in Rust.

For phy_mii_ioctl(), I agree with Andrew. The SAFETY comment can just
say that this path is outside the guarantee.

I tried this on 7.4-rc4. It builds, and the only driver change is the
suspend signature in ax88796b_rust.
