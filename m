Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A73A1B5
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 00:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791850403; cv=none; b=TVg8K7k8HAbfCvoZ9w7AbKj3mQEJjynJAoe3q6Mwo6cpGthxafOQMfG6xDX8O7WocQye99vbmHBSxWvrQqnhtebtGdIrKyU5uruoGYY8vfa8Aye9V7Dkb/0m9L0FY7bgrKa2L96VzP7vqjEHJnMHuorYUQubStggjStAIfHVHiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791850403; c=relaxed/simple;
	bh=aCew9WynhJsD+bl1J+fBJMkAbh5Fg1SXr2HMrKEqdM8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=g9hz/9r6vDqBmNAx9P2EJXC6OhQmChQLDFPmIm76EunJVzrHww76ghX2sdJatdiZuLLHTNDm9QBlwBuHtq6txPZzMtJ9uIbJAmY9K1KwBgXhxKcEBbg6SJPdV9ZHevjHNg2UWwbKBoTXdyFRHW2TynwSQEzv2KBByuT+Nq6HZPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org; spf=pass smtp.mailfrom=flapping.org; dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b=L6JRppu+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IYleQwOQ; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=flapping.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flapping.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flapping.org header.i=@flapping.org header.b="L6JRppu+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IYleQwOQ"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 16BE2140014A
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 20:13:21 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 12 Oct 2026 20:13:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flapping.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791850400;
	 x=1791936800; bh=14ao8EHBap22fVJyCEOCQvYoCHgf/xUTG6x7uWb0O8U=; b=
	L6JRppu+eQUChBAHFm5Bfwx+oGe/F/FZMLg1nNRQ2wshibHp7OTteeK24yrZcoCX
	bkXnG8AjCfJ9mgKBx61lXspRtx/OcFW9/cpy3Z/YiW69YoCiElZjqDRsGN4TdsVC
	ezJCgSyk2bF/laFK8I/0agcvggs+EpGMWVUkIdY1+8o+jKvuLqNzeejOfkTVOZ2D
	eWdU4yqNB0xtgyDbAALNlDU4PKXs9nWQhD4O+M4HpXjfCgBAzICgDNAZcpiYUHwC
	WgS2VdRfLma5xfhyvamy3Y7lM6siKV/b/uHC4si0V7p+uT1mTFJlRAnFQXV9hRWm
	JlhRl6oP73qHjw3yRCbn3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791850400; x=
	1791936800; bh=14ao8EHBap22fVJyCEOCQvYoCHgf/xUTG6x7uWb0O8U=; b=I
	YleQwOQ6NeP4p8+mp+UuPRQieKMzpyZ536o9h/ufo6tpemNDOq3LNwYm5vh2YqIW
	z8t5ItjLtfKmHWrQGmDgYjjIgKrx7w6HsBKuWPQF1A4WDu+ARDy4VOgTtKUbMczO
	LAgRWpBRevlQdVCNNU46EyiSFya+FSDnXLJ7IpNz7elIqutW7YKlPDx6VMtR14al
	0ss5KBMfgXKqAAEjyv6G6Uv8b+RvssjkMlDyE4Gacsg33wRuc++NIc6BCPl4u56/
	guURdZLyWIXsvvIwl5mlHl/kg5C+7xhFYzqJ+jq3G+36/TFBSiiF9N//PzFeEhMI
	gaz0y/+SzdqKm9PZMEdLQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=flapping.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791850400; d=flapping.org;
	mf=PHRvbW9AZmxhcHBpbmcub3JnPg==;
	rt=PHJ1c3QtZm9yLWxpbnV4QHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:Klq1mGXf5rG/bZVM1sExAIYBqmp0e/S/DavgtCZ64jCH4nG
	KiQM5Fx20YCluLs//zpEyiZAhB5h3K6/OsDC9JFqmUs2dzikWvYwv6qG+ONjfA3e
	hQHWaVkqaI/3C6hnMGOa1nZqVXwtvQNcIv/gbRvBfqczVAlPoVWdNHOyFESR06id
	F+bC4JbXHHNDQvvjBIYFln8f+/g6wDjz5n7nZV5ZYSNe/HuLk6U8ZnyRPvNzNF7B
	/HIkdrEPt7pLUXs+D2lGx3x6xJAF7uFUvat1ydeUVHf5QKA0OJya8O/RsBYhwxIT
	jpEush3/oLZdKzPN2gAbFVHIAQoEmkkXK9oERHA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:+nhnj45/AY07AP1YRI30Xb20jN1liBAM3bPV6iJu97w=:aCew9WynhJsD+bl1J+fBJMkAbh5Fg1SXr2HMrKEqdM8=;
X-ME-Sender: <xms:n3fNar0J6Y7t9QeI805sFr7-GFxYRZbVThGGWkWU-SzPl_1LpSsurw>
    <xme:n3fNaofdp2vtv-bafZQrotOiWkTX28Q7acyYKQF3AUIC7wPKhCibtjkoJgCqAGyo8
    TUORjG0ZCR_pbYsuL5Ze8SKTi71Jv8-vU8SY3JcJAaSiYru_p1K7KYDnQ>
X-ME-Received: <xmr:n3fNan5VYG2TxrswSUkhPldoTryQvYm4JyQEedJuT2bfndC4CPhGPwWH6Pf1hAvZ-HC830nOHhtSLc44Xw2LR75a>
X-ME-Proxy-Cause: dmFkZTEQYGfmXA9pNCTuDq0PIvAptLlZZm8vBUMzc+rrSn9LyHJCcjxAa4jptEGZwrZ2uU
    BSjPZuU+QK+7dI6dg2De1ora8gkuGwsdEkNXJdB8clraK4Y0zoCrUu6u3pOfPWFPrTaxne
    fYZ3NqCwDZ6t7LVRuEXk1fyURIjrozSTUytaTsSYEqzuY95v8Uzk8w/fl0ndRa0ZNSJdx5
    /BVKEXJN777guVmny2loLxYpxi/HUq2X4F7fkRT9A2ciqMBElXhago03BKPDB9avXOLZeg
    7dvsZviaYD7jbx/mm+3cUQHz3aXhhHZvw5i4RNVstwVlN7CIro+sOf/vQxLaFW51VhQmrg
    PtzbO7oIO5kPQr89TYKJpUkvrwjZPco5vw3wTQjaZXpO31WvQLGUOQixbB1o61df2YohGW
    sT6pB4C9Jx30/RtN+Iaa27Uh2tS2Iz/VsSBqn8/8U5b63Oa12FHdMPL6VlFip7r7CPZ0hE
    XH/9XuhogK9PQdjx806sR30j65WLXIfGtSd4VOfGonpbzC3IY76O2uRBUOPmfCHMf0sXGe
    H27oznxO6k9Sf9I39y1sfH+uaWrVjcE5+DEaRyU5kje9TVToW5b6BBODSdvm8N0AmI25pp
    G48EKOywt9oEc7b+yEzwdXo6pqog/BSM9MoTS11lBWUGMiAT7r9l6zO2Wtlg
X-ME-Proxy: <xmx:n3fNaj8xV_N_Twkw7BhRI9rBlrB5jV6FmOYhOXm_T96D3fHZBEv-gA>
    <xmx:n3fNamKzPAQcRDPat7Wprq0WzKNPKxvkBFassLEON6xSngue23yEvQ>
    <xmx:n3fNauggaXvnLvHOFUxmgGLtQXXf1YcOEpqH3NsRrRp4W07cg64Kig>
    <xmx:n3fNan2A7QO5cektc9ckeSOF047YjPYN7wBFnNH7tTmjpuZjG20V9A>
    <xmx:oHfNakjyaMxH67xy1uoDXhpgvTjK2vWjbneyeD2t8Uy19IfxwogBGBx2>
Feedback-ID: i51fe4b43:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Oct 2026 20:13:14 -0400 (EDT)
Date: Tue, 13 Oct 2026 09:13:11 +0900 (JST)
Message-Id: <20261013.091311.1532284295597570022.tomo@flapping.org>
To: miguel.ojeda.sandonis@gmail.com, david@davidgow.net, richard@nod.at
Cc: anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 ojeda@kernel.org, a.hindborg@kernel.org, acourbot@nvidia.com,
 aliceryhl@google.com, bjorn3_gh@protonmail.com, boqun@kernel.org,
 dakr@kernel.org, daniel.almeida@collabora.com, gary@garyguo.net,
 linux-um@lists.infradead.org, lossin@kernel.org, tamird@kernel.org,
 tmgross@umich.edu, work@onurozkan.dev, rust-for-linux@vger.kernel.org,
 fujita.tomonori@gmail.com
Subject: Re: [PATCH v1] rust: arch/um: Fix loading Rust modules
From: FUJITA Tomonori <tomo@flapping.org>
In-Reply-To: <CANiq72kEM1Z1yb6SVSCrEBfFVim2R-fXfSSJG2xphPGABq0H5A@mail.gmail.com>
References: <20261004121230.373216-1-tomo@flapping.org>
	<CANiq72kEM1Z1yb6SVSCrEBfFVim2R-fXfSSJG2xphPGABq0H5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 16:40:50 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Sun, Oct 4, 2026 at 2:13 PM FUJITA Tomonori <tomo@flapping.org> wrote:
>>
>> arch/um/Makefile adds -Crelocation-model=pie to KBUILD_RUSTFLAGS. This
> 
> Hmm... That was intentionally added by David back in commit
> 905a77077573 ("rust: arch/um: Use 'pie' relocation mode under UML"):
> 
>     UML expects a position independent executable for some reason, so tell
>     rustc to generate pie objects. Otherwise we get a bunch of relocations
>     we can't deal with in libcore.
> 
> So it seems David faced other relocation errors (?).

I think that at that time, vmlinux was linked as PIE with clang,
because -no-pie was not passed to clang. A static libcore cannot be
linked into a PIE, so the errors probably came from that.

Since commit 846cfbeed09b ("um: Fix adding '-no-pie' for clang"),
vmlinux is linked with -no-pie with clang too. So pie is no longer
needed for Rust code, and it breaks modules.
