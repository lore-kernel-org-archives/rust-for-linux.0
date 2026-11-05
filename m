Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852441;
	b=bLYzdqOo+09PBhIo510ummlRuBsa4/sC3kZw3FkWXDRuIodMRpKZLGfD0jCt3nezqXDg
	 WVK/WvaC2FOwLjMpNelrf0bXHB6FvMNpEhLKC4NyIYsnQF72Y9rxs74BH19Q1gROBOaCV
	 EzBKhGBK69ySZPcWw1wxl2m9fZl5D3Rg2nZmxMOXrl3fvySBjwBbmtvYQZY0IOdCI4WJX
	 TUTagpCZqxAyq48AwLLqEgtwH5SjksGA65KuSjvbLsnsHrmeRtBttjq6GYfRAfDJF+YgQ
	 fg6neam6lYarn0PeFiCNZaLowJLLSwhpZ+IylwKSTbH4ly8BSJoIYupW0TaWqGezdXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852441;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type:Content-Transfer-Encoding;
	bh=HzGdVuKfaxoCHLs4sxabrmogQfwjrZQP3GXvj9V58n8=;
	b=KAQCEiMwObr5idqynW6jgrL0enPmbs4EeJxM2/DL+cidLkybA+/GRJe45h9cwoHRxK7a
	 4v5HEtbF5bynQUsZXUIfHsx2ch2U/yg/uPpmz/8FNlFIhTVyGGs8s7u1siHuPRrQQwM4+
	 CteuAAWdVWuyDX06TMD0TTzvz0ZOQNBxcI7GJEfBw/ORf+aXZSPeAuN9OL7JaQJA56Tkw
	 y1r8qfZAWnXpt6XyFTgMkzy4FLS+L60Kl37Y7VdsOx2elg9MTgeBhaXlSk9h+gC6n+qM5
	 KxclQwbCyWkjPusN3JCDZ+7LhMU6WCR/oLbouB3wF48tnsWwgHZNaoPeF4ku4uzcd9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=flapping.org;
	spf=pass smtp.mailfrom=flapping.org;
	dkim=pass header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=TAruSG1G;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q5Rrnnfk;
	arc=none smtp.remote-ip=103.168.172.151
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA72606A329
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 04:20:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AA72606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flapping.org header.i=@flapping.org header.a=rsa-sha256 header.s=fm1 header.b=TAruSG1G;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Q5Rrnnfk
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id 6E438EC023D
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 23:20:39 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Wed, 04 Nov 2026 23:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793852439;
	 x=1793938839; bh=HzGdVuKfaxoCHLs4sxabrmogQfwjrZQP3GXvj9V58n8=; b=
	TAruSG1GoneYyaCrWQmY5gmwrfprMOJTV7mgOcTyyKP3r6LzO/0AuiH8H1neCtrT
	/UsrNsOLC5gXLZhxCETh4YWcghFChy4UQSLfmno2/LM1SjYsJUYJWYmtOtNROQ8t
	Bk0B+6nPeG/u7SwTwxohc+XFee2L+eHjWpgVO+joT4anxMrWZ1ufzgSWugn/HTJZ
	7gmccwWls/g37IubvYSUpRLKgcyKR0bdSQ5ASv0fSkQgIaSJRyesfwXnpe6jImbZ
	wKmMW6RxA84hSYXoIF6+dNpiD2HJC1XAm4mz3WW2y4Hj/25Rv2mmHMlqiHOr0DNo
	evacCNdu/mRhUnbAisKUgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793852439; x=
	1793938839; bh=HzGdVuKfaxoCHLs4sxabrmogQfwjrZQP3GXvj9V58n8=; b=Q
	5RrnnfklqZ9h7iPMlP6uBaGtr8cUGezoC/nkpHnchw/LHGT0ovLKM9LWqOk3y5kX
	iBFGcebznE9qzPsHt/ZFxE79Sbw/FKiYeJX985rP2v4r5V6pEGnEtqsGHVCKiWan
	5XSFoVpYiipQMeYLnb74dkJqUS8qHJepFwW3UZvPoS8/+qatOpdIXKeRVIXQY3wI
	OE4XXFfLlr+8Lgj1zRpLE+Jc2flUf0PQVCAae/mzyQX+mzKI2dQi5MYuxrBdFjqr
	YbaktNjx3m1Bl+vZTAp9cUVAbQAbwybXz34TKhhSO7rTd00LjZ6TP/TQEOLPqCIk
	JgYXqRUXqKTh4OkbpUO4w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793852439; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:jG/PDEDxttxjsmV//+48sQtHSSdULLBbj0eKNk5qEZDbh81
	jTkGJTKqRzEv8GJqcXlhjHU/wnbOTTSIoXswPuPMC1ozVZFDbqR3jnpDA+0/jtyZ
	eh0PyB2MkLiSSCUs5vHxW1ErWV5eGIw7o8dhrUIQnrDBl0gQWj2bjpgLP5hcCqVN
	eiAmp40cXidXBTRjY02eeQrel/KHLynFX2pFJk1gwAAN6VpEXmVYkKsuqmH6AiTe
	Y65C/K0E8KX8n1NdhLf4LV4i4dp2G68QiWlCPWJFUQGkBKM/0sXpzNMT2NYN0zK+
	8Ok3/Jlupz1eTaJVlxCCe8C2wwMzvOwRYUmkDVg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VCmNIkCxe3ud6Y66TW3ee92cqQj1wp4OBuBM/uJF/PY=:eThNjHzssFM7BnMUPb12DtxguAsdmbEMW+IUTJHsNXo=;
X-ME-Sender: <xms:FgTsak7smipsnLsw6BOuoDxTnLtY0bMquV3zD54dnncen5ff6U-eGA>
    <xme:FgTsakSbnyOllo7FLrTfVQtAZMOpDWyOCoornbnQj0VAWGRdVD0SZ7caLzB9HszM3
    FjT3nEEP2QNl7c83bA5fA5dYj2UI2unDHC8_DIFsfplV3mxjnTB-Q>
X-ME-Received: <xmr:FgTsavfsjyZTdE_PaT4hmZQ5bn_nbdYQcCwpxtdr3WgQK4GbcGxzmLZqtRb_iqjLBU1fGiibSHSHfUO3R0xqbjv5>
X-ME-Proxy-Cause: dmFkZTE29mSY7vx5v8IH+e10ONWO6Z1HP+4WZmAAatZbaOoEqhBr1kviQBgR3/GVImrqMO
    nsG1i1GAE47f8WaFWc7MNHX7kN7uuwmpqX2hNTtfwy641w1MBH3IzqKz7W7IuSqJC/UA7n
    /hS1aB9eXzmpxVVT2ZLi+9RvMaAvpC2xHFSod3pQVOZIUKHK0a/rbbYFzCwCII74yaU3Gq
    I85XZ3NHbX2dKvX5YV6uw2FSj1vXAy1DVBbsVTk7e3Yw/4pOoHRhKfDQWn/dAIXY2BPcx4
    5Jxd8q67eUfueG+cQybkw4UPspiR/sk+7ZFZTo94DYqXRuMNk9R4HvU34KXNJPeKDvF9tW
    kPo0MHpUWEYxnDndhPNXyzkVWHSXROoA1UcQT8TPAdpPngjBIKI+KqUbzizKSw53czhq3/
    WQfA8FwqmTsNnssdbdHAkiuneMdFsclldU5HFnWwYEppb65DG9Q5H1m0OtvXWJ/IiZJ+Ut
    h/f1gqPB5tRQ+lNC7bIogRZbUVa+h8GHmDUNKUsLgCQzgx60NuuaBcIypaP0lJvgxNi2ih
    AK2OKKY4dxrjwekUib9HivzmWfAy0rfhVTmLXoYocjX71nix9YTxdPOYVorKZyXdqywUQS
    yviYsijTUxAp96suGZAL9h1DfJR0ULFC0+MpW8XSvaCsokEw+51bNhTG6fHw
X-ME-Proxy: <xmx:FgTsasRlPSCdsLp4W6YqJUT4dchOY0DjBodRGWNVqujZwf6-daHJVQ>
    <xmx:FgTsagOODLYV6KtRMFFWlR2AfirsLrncKLaz0740odrVBri2I_llIA>
    <xmx:FgTsanXdwRmXPVtQhy6sraEKgzc4YMDCxWLTIj5CLuyAn4nujtXbxg>
    <xmx:FgTsaoZ2GEEgHcM1w7Wgm7CI0vUim_be3MVRdbc3VKfH1djP8IOI9A>
    <xmx:FwTsany884P1nLxEf4wnW_lQQ5XbEBHnzCmvJchW1J4XhHQtwx7dPI1g>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Nov 2026 23:20:34 -0500 (EST)
Date: Thu, 05 Nov 2026 13:20:31 +0900 (JST)
Message-Id: <20261105.132031.1626373229852235546.tomo@flapping.org>
To: dakr@kernel.org, boqun@kernel.org
Cc: gary@garyguo.net, aliceryhl@google.com, lyude@redhat.com,
 daniel.almeida@collabora.com, work@onurozkan.dev, ojeda@kernel.org,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, tamird@kernel.org, acourbot@nvidia.com,
 viro@zeniv.linux.org.uk, brauner@kernel.org, jack@suse.cz,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] rust: task: add safe schedule_timeout() wrapper
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <20261105005951.756157-2-dakr@kernel.org>
References: <20261105005951.756157-1-dakr@kernel.org>
	<20261105005951.756157-2-dakr@kernel.org>
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

On Thu,  5 Nov 2026 01:59:38 +0100
Danilo Krummrich <dakr@kernel.org> wrote:

> Add a safe wrapper around schedule_timeout() that takes and returns
> Jiffies, handling the c_long conversion internally.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

[...]

> +/// Sleeps for the given timeout in [`Jiffies`], or until woken.
> +///
> +/// Returns the remaining time in [`Jiffies`], or zero if the timeout expired.  The task state
> +/// should be set before calling this.
> +///
> +/// Timeouts at or above [`MAX_SCHEDULE_TIMEOUT`] mean an indefinite wait. In that case, the return
> +/// value is `MAX_SCHEDULE_TIMEOUT` as [`Jiffies`].
> +#[inline]
> +pub fn schedule_timeout(timeout: Jiffies) -> Jiffies {
> +    let timeout = timeout.try_into().unwrap_or(MAX_SCHEDULE_TIMEOUT);

The Jiffies alias will be removed, so could you use Delta<Jiffy> here
instead? I think the code would be almost the same as in my patch that
converts condvar [1].

This series conflicts with that patch. Boqun, how would you like to
merge them?

[1] https://lore.kernel.org/rust-for-linux/20261104235929.1282640-1-tomo@flapping.org/
