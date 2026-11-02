Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.157
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793660976;
	b=cd2aHLRtO0MaoTDkvPj2psNivO12okzyY3NHJwpSiczEppvf9lafv6vwJS0hn4Dp0NAM
	 TlEU+Fi2LBuuy84QrhLVW7Zsu/4JQKh1BvUPUObfeUqTHOfAGq53DHf6gmRdgYetUcV+H
	 Q8WxmMr8Qgcw0gZ1uBP/WKtZUpnOcrDzT/nL45/o/TQjK86NdVx3tRImAWyw6Nqwmykzl
	 TyToRiYzHJXnqVy6Qv9b76sz8EMrjYn8g/hlo14sxel5WDUf8PIO65h3G2pY7nVj/SRC7
	 Ox+8Bm7GYx8tlT9oi8UEgh4ZEZTwW2nQ6/WWIvIqGgpMaq/pTP1DZy2nOEzIPmglEaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660976;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=d1SznHmdOXHTYguXYLF9TsRkQxL68MdCyFRjXg6fFKM=;
	b=BdrumnQnFD8uMc8TawSlAMlytnIOCdd+SqiQ3SJaQnWRI5Uh7JTo+IqNmbqm2Uduq4UZ
	 ucUzlioMIiuP7eVtyMnFuAwMZcTMIP4cIzOiIK8GAY8j+7TtNo2qFqoP38DBD7+xtEeFp
	 H9BzFsXofBp/gE1xOxh9PQb06rEL1Syy+HOfErP+tp1NxqP7OmTLcAePOkrRcPPM23ZCy
	 yyj1UQ+mz/LM7psgN3tgSAfKfcpHyUciEuOTEP2O+5Ngu6SfF82tUaxatIWZZLjLv/3Kp
	 v8DzVX84quYWUl7rJqR2iEwlinQufTOUKzdMeiDm09Hwr+TLVOg4UAt9evmI/am/E0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=jO18FwXB;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ksinwixC;
	arc=none smtp.remote-ip=103.168.172.157
Received: from fhigh-a6-smtp.messagingengine.com (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81ED8606A333
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 23:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81ED8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=jO18FwXB;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ksinwixC
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B94C91400255
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 18:09:34 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Nov 2026 18:09:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793660974;
	 x=1793747374; bh=d1SznHmdOXHTYguXYLF9TsRkQxL68MdCyFRjXg6fFKM=; b=
	jO18FwXBwmDA5OBgq9qMpJJqRLGQt0PeSTXnlAGADLDqvT1P18PATD47x3WKxVxp
	W+mSUsgbyl/pkCfXI+xy3NpgSbcJj4E5qR+doL5ujVVyfMF/giLO0Zgn23gGZCuV
	3pcTm0g7+JLWqfxhEcRPIyLdyD+KoQMU56gWZIgH20yiNvsECQrXSo539IjUgsTF
	TnZEGWyPRghXzfsUzrRv1XJdkjb7Z8YGOhg2XX1X0OJO0MxPNFB7f6wazloZwURa
	UEh47b6XhxIYzc2OfWSIuGxY2UqzAS1wnxrxN+XJqMjHc+avkF+h41Sxjv5w9CFt
	xGZLwgkIf5f931FtbbnLzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793660974; x=
	1793747374; bh=d1SznHmdOXHTYguXYLF9TsRkQxL68MdCyFRjXg6fFKM=; b=k
	sinwixCE92lOZS7CXJr0E4wynI9nn/kUfALLdz5bKJ0gxB6CBeU+X7RchXpQbEag
	Yh4o5HuOPtfFT3kgDlvmvCnLp1Rjq9+KhPOtC29jR7pPTt/sqLCTuiHLW9Mq04rD
	A0Swo7C0wpTiw2UsqbuZOy3CUBDQSo5gYcrQ41XFaJvi2f4VQEPdZ0LIUGJS4Xth
	dBXnwTV/SSk9YJo3RSxLJa2FAiMa9zqUu6hLqOa0oOo4SNwYvcplI/OxdFEQMRMj
	4B/GfZUW0hoaC/+wcxU8pFAq5B0iupaKEx7A/c6PAxH7JfRmc6UaVxDQOrsr8aRR
	4LmrENrMuIpcGUv4ZwIhg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793660974; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:uGCpNd82f0DDPQWOtsV78lt3uZ4ZfSp4VMR9j0N/DWFnsv/
	bfdyNKwUVjgCmM4K/HMz7wDDiBgEMNh5WGRoefe7sf5Px4KSD+KQ+WdSccVHhX+x
	ELJ5EobE0XcJGPFJeWgKueR8nmdUAwd0/SRzkgwXakHBPHHnWHAsGl77FKR2twrv
	3brYFmTs36vZQF/r2hvyDWSd1EtRlBTTrLjiNcASKWqZjnFIpNmZV9jipYrdeaQJ
	6dhs+YDtWsNU3FygsZxEKxprKZR1kP2wwah6SzqIohHfSYScTVIaAs+gKHY4TMaP
	4aKIY54sxdcON8yrZNEzlmS4iFN9ZfBbC6h8CGg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:tL9NiGpWdoFKDDHz0ihcK+ZwqYuEpYpJtHSbhHcQAcY=:1GRWqtGWQGmDL8gv2G7sPNpD6i4J/tUnZWWB2vhgFA4=;
X-ME-Sender: <xms:LRjpais9T_0065VVdzl3pxDRqyFkTitJQZGstwterdprpOppJFsR7g>
    <xme:LRjpasWgprspA4qz5jopQwCN0UlJzRGH7CGIShtilMpOESlstphWvZ3UpJmZ6FU1k
    EYFebvJKNVrfYQD0q0AjDOc6rVxX8XJYUAnDGaJqC9TOq-wSXqK8uCL>
X-ME-Received: <xmr:LRjparWCK_74GY2aqwQank-OxW_e60rJ8H_cpnpZXeQ5C3HeoMAd8YrxdTyj52vsi-dGSaT5BlA1IpPb2HNd0bWo>
X-ME-Proxy-Cause: dmFkZTFMkllA8k7khiEh+mokhgwaWU6/CWw8l3fm5p1DMRAXT+PAyQJpp6rJWK6a/yjEtu
    hRUgiqjW/J4gtxLTMkD4FqupSvPRyeZEwmB+RWJnCRuI5s6DM99LOb6zEUvPM7K60U464H
    T8hpFNtqOvVOKPZQEDQMfhxnnGyeQbuUeQHD+OEf5vx8eiXnOq0gEp0oFYrCa2gjDnqaSb
    NqgPQZd33OaqI8L6tFkZPB8V22Nv9W16MxgJjk4+iBIRcphf0brphGkQ8R5xCWF4/nhOxy
    OFCF3aABwY4OuCvAbEVz8Co47cbGAF8id+OzP9JFhWFVpJau/nMPGArhASY+Gk06dCmaHK
    sOrYTuHufU9xK7KsjnZVluF5rTQM4LmCtwRtvpeoFbNNYPuvyfnS+K4S5SDcKELawYNnyF
    PQQyxeKFQuqbxASlUGWgH2hFMb1Dv2X7d8GjNREeNn/nJDA6E4bMuIIXd3aCdxcwfPtaYr
    vP25UMKLC+XUlAReWVfTPmqUA/NMkiUsW3QCp03Fv8IwLQ6cMwlgt0y/Dk/ytE0Bcmqewb
    lmV99z+sWvqtoBaK34x0vWpedQBaOy/Pjs7ZnkW7SumZGpaZ7VF/WANsBJ/M5FW43O84jk
    gnlXWyXPFAZ5OH+vAEBehDoUFDwCMRk9gnsBPogmdOxlwASn458MdgUwJ+jQ
X-ME-Proxy: <xmx:LRjpavQUdNFT3iSJrYI_l-cF58AJ_FH1QOYye195RP7OWoytE0_Qbw>
    <xmx:LRjpaiF9eP5mRtHFmam7plnXYgSKZLQsjQj-nirlRNu4ZeBO2ol5AQ>
    <xmx:LRjpanQ0T2AegXF3F8WiX2soZYS2eafPBMfyw4FdqfFMHd8bcbCODw>
    <xmx:LRjpakrNhmbmkNv7QZjS9TwnNphYBtoeqTh8ngjL0cKog3yU_isBEw>
    <xmx:LhjpamPovL-Hk02urKU-QGHj2qjYFYcjhEGbRkVT4BncYG2fm0khxaPu>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 18:09:28 -0500 (EST)
Date: Tue, 03 Nov 2026 08:09:25 +0900 (JST)
Message-Id: <20261103.080925.1532537293803570859.tomo@flapping.org>
To: a.hindborg@kernel.org
Cc: miguel.ojeda.sandonis@gmail.com, tomo@flapping.org, boqun@kernel.org,
 ojeda@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 anna-maria@linutronix.de, bjorn3_gh@protonmail.com, dakr@kernel.org,
 daniel.almeida@collabora.com, frederic@kernel.org, gary@garyguo.net,
 jstultz@google.com, lossin@kernel.org, lyude@redhat.com,
 mike@fireburn.co.uk, sboyd@kernel.org, tamird@kernel.org, tglx@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1 0/2] rust: time: seconds based Instant
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <87ecd3m6ao.fsf@t14s.mail-host-address-is-not-set>
References: <8yvpSoQ7ihtTj508nQU_nAlk2eMmGH5zK6H5pow6z5cTYGO3yL_DvqwbFMwqzhtbL-52eMYXpT5Cyg0g7fUN7w==@protonmail.internalid>
	<20261031003334.4161188-1-tomo@flapping.org>
	<87h5hzmfui.fsf@t14s.mail-host-address-is-not-set>
	<-ovJnxcOvJAiKzPtfo11BN1FAx0pLVrkWbeFGFEQEPR4rxdbT819-RaUD_zMHLXqn-9oyUoPJFT2YexekcZMKw==@protonmail.internalid>
	<CANiq72mjFLQbgfW_f7vAJ+M-95d5s54sBTRfMGYekcRmm7xTAg@mail.gmail.com>
	<87ecd3m6ao.fsf@t14s.mail-host-address-is-not-set>
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

On Mon, 02 Nov 2026 19:34:07 +0100
Andreas Hindborg <a.hindborg@kernel.org> wrote:

>> Another point is whether we should align also our methods too (e.g.
>> "nanos", which comes from upstream Rust), i.e. with your suggestion,
>> we would have all `NSEC`, `nanos` and `NanoSeconds`.
> 
> In general I prefer that we match std on naming in general, which is
> also why we have `as_nanos`. However, chrono is using spelled out names,
> and I do prefer that to the short hand used in std. Worth a discussion I
> think.

I don't have a strong opinion, but I slightly prefer the short names.
Our method names follow std Duration (from_secs(), as_nanos()), and
short type names fit them better.

Either way, I would like to keep this series as is. Nsec is already in
mainline, so renaming only Sec here would make the names
inconsistent. If we decide to rename, I will send a separate series
that renames all the unit types in the tree. It would be easier to do
that after the pending Delta<Jiffy> users (condvar, workqueue and
serdev) are merged.
