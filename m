Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448601;
	b=wP4VJAPN+Ohi47WcfyTXRtUiolgDSrZmdV0PTIa63GXIL8e3301fA4UiXDR6W/TBGn4f
	 o3y6hz1/f7FvjVjlAgqXa32NDzzoqvGmGsokExHeUixWDJuqb7241Z6vfN0Rmr6F2IVRD
	 Q7PpeH79PFVvXlfo+UFuIL3LIdjyuyUPjtF6sWKxL1Jl5OFTjsT8tntjoqx0S+IEJ/GxF
	 wGPkUt5SVWlFt6PyP1qQnw6oZNci7TgMVnxpcl0bMrzIJKbp5m4iHNU4qnemy4jsGUVEE
	 Z/uUEaQI56IhG2yKxqfvw6dB7NmhxrYg97n5DpxtEz8wVZKF9mEDY0HHQHvVxXmekwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448601;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=hlfn7lc9oevypWpldjmBuOe0blEFiIYem8k9XKHqejE=;
	b=dghBGkbpKb3sbhRGS8Mc6rYhgcV4ED+JnfUYJdOAq9kzJP0wHPP3i7nu0KRW07fWx2wC
	 vMTKVGRFfHTEYzrNhOcTzZlNYZ4Yh21dSiTd3c/Zr0abcj0V8MnTJJKsYmYhTp4/5KmRY
	 IPG58S0wBWnuWeFP/h9XNLm24/Vvdy+zj5/83wNK0qViQ50PJW8naRxunA/n+UdLj2P4c
	 TIwZsoOoaiTimES/0BD1oHvqLSp10Ndyoo0eUs+at5L56QYIMVtB+yUQgim8lnCOzB3zn
	 4Fe79MjG8j6C0hI/HKDOOvJGMi6Eedkp2JNhngcLKVGH+Q6Y8bWw74kS7xqgHFOw96g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=c1xrLTkK;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QMR0Nz5u;
	arc=none smtp.remote-ip=202.12.124.153
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743E9606A31C
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 12:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743E9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=c1xrLTkK;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=QMR0Nz5u
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id BC99F7A0159
	for <rust-for-linux@vger.kernel.org>; Sat, 31 Oct 2026 08:10:00 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sat, 31 Oct 2026 08:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793448597;
	 x=1793534997; bh=hlfn7lc9oevypWpldjmBuOe0blEFiIYem8k9XKHqejE=; b=
	c1xrLTkKxy5llXlu5BR1RbxaWO5DC97IryuX1T3CvzzOp36m5ukiUPnB146slog0
	rLcbPuqEXGrNJWCD6hlYyJKreIvT9kxWtuxESuiFS2YdDaY9Y6RtcqeUrLxiJcsc
	TJJ2KnOHTxNE6Fsz8opED0MjqUVceUiXUb+pCdNh5pQnSD7CE5vHKNQiSibJStMn
	s2DHyUntBp1Ha20Q7Le+N02hzB1gjwmbEuAyzP/zU3Zt5r46OdPCG/eqz9GhGMg4
	L7vUY5ehezJM8HRrJwvJZosrE6fF+5LD0H74s778AbAB81UHa18UwHg2IN6WVMVb
	13NW/QvVWbU1yRcskrCKTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793448597; x=
	1793534997; bh=hlfn7lc9oevypWpldjmBuOe0blEFiIYem8k9XKHqejE=; b=Q
	MR0Nz5uV3dm/vmj2Jj7Ky7jtApzOo0I13pIho4g9TF9HOMj/JBOmPNrOgzGToWC0
	hYrP0bO/mXw/ESypFbsq89OswwmyDq9ULar1+ac248MuMsM/GRtU4s8Pker1HZTV
	kWvvDffwk68IxImnT6jR/8FQsBYN1IYeD+73oHfy7pqUs2rPjG1IaXyxQBwFskjL
	1QYkQx1mm9mKSXl6n/iwCv2CRFxo3U485/X30s6nSEIXvXWyRjyTjvLaVgttNtt0
	l721Y/XStkFlE6VS3IsfCx7a2cP5ENbCgnF8DF64QzDpb6e3uBibTLMosd8KYinw
	Eji+yHVWq3/mGlGf6cQdw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793448597; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:FTnperOWOO23UyiMemGf8rN2y/qYFyJnBt6JiyMvD1TEjDr
	wXyeYEs0F9hs3PPoECFYgn56S2qKjMmQJoufKxSW6hN/Y1+n/20gs3mu1B2Q4ytC
	ltpwnoVIfkzDTie8YfDsly+TyZbv3cgNiemHV44hYZFMkxKohY2M4CnM+71EJ5mP
	qVTfCn6HMlFEDJ5oFl1pM1eUrCrdcALg9z5J9tibXpBzU1vAYgDhr1hP0x/rpCes
	sjZUAg814lksI6WoEK/MEem2aRv2rOoDONv/1qiGtUVA0BOdfCSIsCnn38hGwi/z
	TxddFIC3k7y4GmY5FuIPUnCPA70jdBdW+cj8hYA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:1j4AXNM8qZnk/hvQjSKI+y5nO9uN5Lgg+C+HjjwnVX0=:mrfi5orC18+YBzwwnYjC6ssU3aGaBlLAZeepo34eOQ0=;
X-ME-Sender: <xms:ldrlanDJpZYTtRgcF-uKXJW6Bxtyqn5qczrHPW_kHG4KOU5dHmvXmw>
    <xme:ldrlau0Vo4jjM16fM05fN53DH-t4DJ3KAlmy_eo9tispi9KTxQWTzWeHgLFjOHh2-
    PW4u6Nhppzag1o22cyF_nIG-hndkeCOGO7Vf8AL7b2TTRtCN4uNLdI>
X-ME-Received: <xmr:ldrlanNIzgr2Pl49ZrGjw0SrdBRfLN15W560C6ZSCgdlM3lDuD4nwW3Kf_MnsItoK_5W-ewkcOqVASjpPhktapGS>
X-ME-Proxy-Cause: dmFkZTE6ln8qXAOhO1jFG7Hw70ZnutcnKutnH0tCmc0FlZXgTP5jutLbwhjpoSiqbuX+j/
    ppAXHWgwodYyYVft/AjwaYg6cnQRlXEDhmMT3q//EIMHA5b2DXfDzFSZNtt4bulhHwl5o4
    QSRWFR67B8rcQZxWrh0T0yCVNKv1fpWTy1aMYA6tRgPVzmxIXaK9ILFy35+FYmJzi9LMBw
    qTRXC6EApZXSACmhXJRGq3SyGdZZPw+nhRbr7DDzx2IZI38Er+BE2rRM8rE/BDxY+7JYpC
    ouK7/i5GylyqVIz9KN7U93WN4NVtqpvwQClrC+PrWgCkuPAjOsN0ivghlbLW8NxIi7B7BZ
    nB+lgKvdZ9FZ2kCUyHDiNImfJLclOzHn+ps/frhG4Sswgb1mQ9OVxCx9Xz8jtj4iEYcGif
    l2zGZKBr+ZzGb7f6iZPLI2DNCY8nT+wbJfheT59p0cCHx+8lZXuwsZPo85EpX52bE4Wn26
    w+qiItHuWfD3dbiSM1Quobv3PYjEbrA5+yUcBWabHIwBwlPFCcgm8J3CZ5FjTdEzW1JCNs
    cwj/XyP5wAGMyxTQV3vMU+GeOEGnqtUSZF18ybepzqm/ZJ6lyfjViWKW+jutAWkmyUFgiZ
    eUl00AMKX0tg+0pDJrrUylqUZIKJ9mD9xbAXAm0kUwHtWXZpxBtV7IQZ/Rww
X-ME-Proxy: <xmx:ldrlasfSqx0YZ2By-izYI3LYhwIEeoSN6LMDTEAjPDC28vZ_U-kj_Q>
    <xmx:ldrlajMmISmWy_R8N7GKHoeg5wLFXcrQvUcSXmh6V7Zxb1lzSb-kHw>
    <xmx:ldrlaubc39cLeKu0FFzTUjf7N0kJ4Q52oJLSFuM2LYWSGammTBu9Og>
    <xmx:ldrlanv1jffjpxh_Wbe9GJ0A_JT3T6lz875uvsyBLdW4No5E5x3Mpg>
    <xmx:ldrlapTa-jsW3g3PJSOrSAOTdr9aQbVgfzijfUPkMJpcOtscLGzS5ehp>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Oct 2026 08:09:52 -0400 (EDT)
Date: Sat, 31 Oct 2026 21:09:50 +0900 (JST)
Message-Id: <20261031.210950.869638156868262129.tomo@flapping.org>
To: jenhaochen@google.com
Cc: gregkh@linuxfoundation.org, arve@android.com, tkjos@android.com,
 maco@android.com, joelagnelf@nvidia.com, brauner@kernel.org,
 cmllamas@google.com, aliceryhl@google.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu,
 dakr@kernel.org, fujita.tomonori@gmail.com, qyousef@google.com,
 benwei@google.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust_binder: use Atomic::add() in BinderStats
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261031030801.4100693-1-jenhaochen@google.com>
References: <20261031030801.4100693-1-jenhaochen@google.com>
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

On Sat, 31 Oct 2026 03:08:01 +0000
Jenhao Chen <jenhaochen@google.com> wrote:

> BinderStats::inc_bc() and BinderStats::inc_br() increment command and
> return statistics counters on every Binder transaction and reply using
> Atomic::fetch_add(1, Relaxed), discarding the returned previous value.
> 
> Because the return value of fetch_add() is unused in Rust but must still
> be produced by the underlying value-returning atomic RMW helper
> (atomic_fetch_add_relaxed()), the compiler is forced to emit a
> value-returning atomic operation (LDADD on arm64 with LSE, or LOCK XADD
> on x86) instead of a non-value-returning atomic add (STADD on arm64, or
> LOCK ADD on x86). On arm64 CPUs with LSE, value-returning LDADD requires
> a round-trip response from the L2/interconnect to populate the
> destination register, whereas non-value-returning STADD (encoded as
> LDADD with WZR as the destination register) may be executed as a far
> atomic without waiting for the old value to return to the core.
> 
> Switch BinderStats::inc_bc() and BinderStats::inc_br() from
> fetch_add(1, Relaxed) to add(1, Relaxed) so they lower to atomic_add()
> and emit non-value-returning atomic increments. This also matches the C
> Binder driver, which uses atomic_inc() for these statistics counters in
> binder_thread_write() and binder_stat_br().
> 
> No functional change intended.
> 
> Signed-off-by: Jenhao Chen <jenhaochen@google.com>

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
