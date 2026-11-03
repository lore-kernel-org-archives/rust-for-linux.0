Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793673399;
	b=QnrzJs/+LYPeJyAOvkMDntHWhEs4g2rEUtk9/p9Ksd1RuyvMWnR6AgTyzR+9BKwfyl74
	 ra4HtdW4S6YE2/02vrhC3nbIZuxUlsOdTV5FtaLgKPMOj4xZ8jhGRTR2+WeTTWTgx9Fzk
	 hT9jurowMpQeIxIgQlzivvfnNgNdpP/AtpJs0CpkMJzirAdDgq3XkLC2G6isMQDwSELNR
	 lZtclhw49eAmd0rqbG5dv5IA2IV8mhd7Ju8ZqRtngs2E/mtvW+tfU+hKIWn4Bx0lRxxAJ
	 hJaA8Yd9tq4/J910DUXePVnNtcgGm4BzYmC+0B1i/TZTeDQcs7xe1xwCnkzr2MFT1qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793673399;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=6HzdllEYqAfXc7yyMTW0VhUYFVqQc3Lkfnb7t2HZDwU=;
	b=W8n/Yoscx3P7e2hRcmPaGESXPij+R13HpXC7neBhLXVOIknQKASIQdYpQz8yXZWD0Zdh
	 baNg8x9ZeIE0pxa4OvZEXhZdGzl33CMhkUVS13D5vqNR+OH/oigJohF9i1BSym2BweDoN
	 O7m5UVDbSMbNHf1HLErV7wh1VmO25kqzBe/XFWjJ2lJvb2p5EHRl7dcvJvfq2nuZNO3Kh
	 tdTu2/WOpxglyaDTpHlFqYg+jwCIyNDMJ3DyrsmIoiASCFSbE9Ek1RhR+yLBW7jzszDlp
	 AB6XkIVqHiQx01aRUttmTCNtwY/+SC9tKjxvO/Bql7wjtelCnVXkizWfqQmiVroDy2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=k1XpWegw;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ETnk90Of;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F7A606A324
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Nov 2026 02:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F7A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=k1XpWegw;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ETnk90Of
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E734A140022D
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Nov 2026 21:36:37 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-08.internal (MEProxy); Mon, 02 Nov 2026 21:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793673397;
	 x=1793759797; bh=6HzdllEYqAfXc7yyMTW0VhUYFVqQc3Lkfnb7t2HZDwU=; b=
	k1XpWegwPt1Sb1REpb2wncCoGjajIyHEDA01bZqoRUzF7pMb9wIOOc4ttWWZn4Al
	NJVr+HfDrbkRxM6Agna2Ma5TVaR8+MBh/Z7wbEFBIimiVtuzQPnsDdILYjIblgcs
	y0G+Hhbta6s/JclLjBEh0Wi782hc2D1PQNviCrqNLbvAkHU3OXqYYkwFpv2DpqGf
	/zT8Nd8XwYUeOoXJfdG3prN6cmYmRKXYzBYUQyGEUm/eUAoLPfXSDzggNmTqOmly
	NanaPoxTLZvzng7YOfxY91D7iliOSXJHdXo6VrnOqIRhobzVAoFO6cI4Z3eniVLu
	SFDnlTDf2v4ZNCB+ASp0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793673397; x=
	1793759797; bh=6HzdllEYqAfXc7yyMTW0VhUYFVqQc3Lkfnb7t2HZDwU=; b=E
	Tnk90OfSBLjYT8w+GZO7wtb+ALoYAcWeo+dvszYQR+/hbpBzn5soFUCvHW/HDIW9
	vjxwjocM5GGzOqrdRRcAATeF+NCo8EzfptXHPem+/YH9ukyKzPqFB3awX/NZI40G
	G0jaQmXEQr14SDUP7bZDYCeHwgbIAwTLjvmMyqmthMqwKll8v/6b/CUQyXWP+jK1
	2TCC7ratzWDlVvsCN7c6E2d/SrhTjy77Lk6i8JH9MCpyAMXpvF/rELKqbBsslPsT
	uF6fA8liCmOAXrKmnjebLpUmIFrunu5YRfDwh8hyxevYWfnNEJaSHEatYBBDUFMg
	fuvur8J3bHJgnUhzpP7AQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793673397; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:CwOKe6BY3c+W+R/WhOxXQAsZzxCY4uYx+tzMuDe+gbfWyqd
	OgjdVzRK/dNKGppzy29On4KRyQlTpydMGNX9l814Ca7hS6KaPj8FzfTSCSFNR0DM
	0++a/U0Zdti6lenuiMzrfi0TcfM0I5NfcwzG47WYrbLMZH2abjN0sgg6fs22G6Qp
	NSgx0VgpqCMIy9FqyPSLOuUbbsXmT8PocYBJR9xKGPlPCxWiz81Z1c09xRqlWsTT
	5msk5HJH0bFIr1lnRGYHfQAlfbhJvVOG7DWLefxEN71q3ZPH7pTu9vR2NUh8TJrU
	IFNJj/6z0MoIOEozcp4bO7TiWTtH54EFX8LuzqQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:eqY0Gez4winLF8q/U+dehk+ZMH9T8Bx820HYygrXdTU=:zeNri87izygVr3C/ug3XTwZBQcg3KllJxAVBipX7nBk=;
X-ME-Sender: <xms:tUjpahCfbWNB6vHiV6S8FDuP1SCYAYSQtEb3et_Ihm2Np2bm8wujiQ>
    <xme:tUjpar6ZNZb8evaaI_iRmnUKNy-hoKUyCXx8bU0okzbR5xXkpYOLoLxUyqLFwIwKl
    GxJVpWmJwTC4IIpeeHsjs-ratoTdV-Orvg0A_o6p06kqUOn2Nu0qzWs>
X-ME-Received: <xmr:tUjpahC71t5MMC78PEYfxZ3-AdeUrpNu0ExwkTEaWJoARLatD4CsibrJUIqNeeAovMSAVAcFzbexV9Jr4NdOOCV4>
X-ME-Proxy-Cause: dmFkZTFs+0JyBDTZ/zGvzAb1YiXZiqyRRgMIdlgqB3uMuJt/WYgwYsz2tI1qkhCjbY0sIG
    TaG++ie5B5qXy3G7EpVBH0GStCQf45YcL9hN2CJUeSsktPRdqYctokccLk5+AVjde3NxWY
    aR17AIR8tTzDszEMNcF7hXZfVyNDwBz4Ivny5W5SRlU1Y5GyPTwTBnClF2Id/UNx8K5YFD
    4/ELnSZpD7cpsQm79MPdT/n6xmf/UBgm3eJDJDh8z8fgFELetwvp8wi8SXbGP5JEm5Ok4T
    vRT6X+xfJ9XHkiJ9VDug+6BimFRBxWbWTJSU5qa54aUKO2nPRsJFX8k7k0C6kV6DpwJxAh
    lBu2+3rrXpHorDJHR0yE0BfPvNAA+YjDAGxqlsBA1aC08ZRvneq7hVwMYz5pkDd1/LvpQS
    q7ZJ9WUd60WqzrPFKAhxJ3a2sBAoBtQRjeBBv8pi6umzb3C7Xz4MGoCY2pD/QVyOM7+fBV
    J9CI/0nMf5TbUBYU0JhPuGX1rc1sTv9HI5Ydkf4/Gx2bM/HdN3SHk+wZ3QlsYJ3d0B2wXV
    tqG+Zj9Gfmy+WGvBuY5M7ousUErWmSxk+JseJlcymmZX1E7TRTJHBxmDB77ge52kSZnvV4
    7n/AzBqDhj8F56ktly1rpf20w4PgQyrBVYDE0WfFdk3xkJaivY1UOBk6DqBQ
X-ME-Proxy: <xmx:tUjpap4ac6cB0vhqxzEv5tFn9td_j7KVqsa8Q-F-qdJMALbrOkt2zQ>
    <xmx:tUjpaivpWvB6-rnkQ0cMCHQvlY2bSOD4kCxGE8C2w8w-psJ18vyl_g>
    <xmx:tUjpam4NPV3Jls_RsbEoOGqMzEDN39jYmvj_h7bUIMuqW6MGQQffZQ>
    <xmx:tUjpau2QoubJvWSlZB6W5_PR4cFng2dEzuL5REFPyOlun04q_OSFew>
    <xmx:tUjpaj76oLZTx92Pb2A7WHmasOu5czMIS-1gLuDlV-Lj7iLNV5YqKmRu>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 21:36:34 -0500 (EST)
Date: Tue, 03 Nov 2026 11:36:32 +0900 (JST)
Message-Id: <20261103.113632.1174343293202898622.tomo@flapping.org>
To: ojeda@kernel.org
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org,
 daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org,
 tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev,
 rust-for-linux@vger.kernel.org, fujita.tomonori@gmail.com
Subject: Re: [PATCH v4] rust: compiler_builtins: Fix silent trap in
 prohibited intrinsics
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261009224626.1331914-1-tomo@flapping.org>
References: <20261009224626.1331914-1-tomo@flapping.org>
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

On Sat, 10 Oct 2026 07:46:26 +0900
FUJITA Tomonori <tomo@flapping.org> wrote:

> From: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> When core calls one of the stubs for builtins that should not be used,
> the stub runs a trap instruction that prints no message, and the Oops
> shows a wrong name. For example, when __rust__udivti3() is called on
> x86_64, the Oops shows:
> 
>   Oops: invalid opcode: 0000 [#1] SMP
>   RIP: 0010:__rust__adddf3+0x0/0x10
> 
> The stubs call panic!(), but since Rust 1.79, rustc does not allow code
> in a `#![compiler_builtins]` crate to link to functions in other crates,
> and it silently turns such calls that do not return into a trap [1]. In
> addition, all the stubs have the same code, so LLVM merges them into one
> function.
> 
> Move the stubs to the kernel crate, where panic!() works as usual. Add
> the name of each stub to the panic message, so the stubs are no longer
> merged:
> 
>   rust_kernel: panicked at rust/kernel/core_builtins.rs:56:1:
>   __udivti3 called: `u128` should not be used
>   kernel BUG at rust/helpers/bug.c:7!
> 
> Weaken the stubs in kernel.o, as was done in compiler_builtins.o.
> Otherwise objtool treats them as noreturn functions and warns.
> 
> compiler_builtins.rs is now empty, but the crate is still needed because
> rustc requires a `#![compiler_builtins]` crate.
> 
> Link: https://github.com/rust-lang/rust/pull/122580 [1]
> Assisted-by: LLM
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Gentle ping. The patch still applies cleanly on top of v7.4-rc1.
