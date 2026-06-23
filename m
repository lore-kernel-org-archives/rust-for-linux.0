Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDD23D45C1
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 11:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782214636; cv=none; b=kPF2Y5h0Uo7v4GV/nUNfNrvCF5FvhTC5AfhHzjK1FEBjBh0himxPse1WB30hKSw/vYewjAmxNhUXOdDCknWpMa52B9KOSwMVXybDrsY4a5gRBXJ4D5f4KsLE9WGYsVdah5RS7J8337L1BnsEV2M59uCdP1Omtq7HV2SRgXWu55o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782214636; c=relaxed/simple;
	bh=lra4pcJ/vKRB8CVYqb5bH1lHUYNPrtqwXyzo6vWU0V8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JVY7/83bDyC7GiS/lnGbWCLdAerSvHreqI7seOV6WTQhQ48qBTRxAp1nZYDZTIySoe230fGGTeIPLBN6JZCHGG7LLUNTN/Yc8nY/V4coYkbdmP/Q/tSAdSxM6p8cWEu88SZ7SirfA6CF1euirUzZVy23cNdSD5GOksfV6qTfoGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GNsBaq8j; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GNsBaq8j"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4924207e640so24958205e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782214633; x=1782819433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=avMSkvtdj5olX4vyz/UDjZnR1hYBFduxY4Z2gcaqz28=;
        b=GNsBaq8j/XJaOISIbd2ZEGiCZjWmXsBDA4f69LGf9qLeai2BPP1AtRE/Ej2KT/Li5Y
         CJqDAvEs9WTXZJnfYQXJicK/UMRDgDTZLX3vswS0pLHHj6kCxYfAqnUeNNDCC2t1Moca
         pA+EyStuDrqmtYb2XFFZ3MssCpoW9S3DsrO7lbkMUDvSfis+ISAcppHnCJtyek2i0wWf
         0viZwvNOoslZ9EqGTOxrbjZMCwpLnxL78zIlzuTHd8mrTcdt+v3pVHmRxweU0iQtLifg
         jLNFHJ97rkHHC/7cc2WfDFC+6tYfA1MGwI6gKcD4eA0x8HiIZRUKQgjoqyfCivRjTFqU
         fJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782214633; x=1782819433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=avMSkvtdj5olX4vyz/UDjZnR1hYBFduxY4Z2gcaqz28=;
        b=IiDEUJyeTQ+k0G4jpnj94lX+USCToUCNDCj2bWRGd79FE1j/vVd+OtXqlVhRLeO8R7
         B/7rmZhxoj7D+78/m5kgbOwdKzOYKTgECAVV9z7+/RQMiqL8JlgITv4MVlPBZFASlx9H
         okce7mx2LfBSmQqXLK9uqm63v4PtotJVHBRm8CeYXjzHZkRmYY4WhAqilr3ie+X+XBMa
         xDsBlftOn857DJtTmcpZ2UzAuthYCWtHUk4EJVVdoUBBi1VdjwYJ9Q+zr5EZnUzTbQSF
         P7p1slmnD4MPlRzboDpNiZTHOb/1ePevgJIRj1ZmaZUNlA/ZAmJPDPqZbvMOTrNCE3u5
         l3Gg==
X-Forwarded-Encrypted: i=1; AFNElJ/laWgyoKWP1u5QQ7fsiR2RJrXf4CZNh2Nfj8dAi/U78o6OaZ3FH2PVrSmAVU0KpEkt2iRJ2zIHA/jj3ik8PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwDngAHfq4OeSuFVuk+VPmbn3G3z6wbm/cTAp3kPZ2ApPGIn8
	B70XCCr3xVqYugMVcP/nOAlAE542FU9tku27Z419G6LnPUtj05GMu1c95p8ROTb+ydEuxfczVap
	fTZE13lpyvp3PWQirrQ==
X-Received: from wma7.prod.google.com ([2002:a05:600c:8907:b0:492:42f9:b559])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3113:b0:48a:5565:ec3d with SMTP id 5b1f17b1804b1-492490a790cmr199392115e9.22.1782214633089;
 Tue, 23 Jun 2026 04:37:13 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:37:11 +0000
In-Reply-To: <20260622145801.344-1-iganschel@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260621210134.441-1-iganschel@gmail.com> <20260622145801.344-1-iganschel@gmail.com>
Message-ID: <ajpv5xkakp06ArMj@google.com>
Subject: Re: [PATCH v2] rust_binder: reject context manager self-transaction
From: Alice Ryhl <aliceryhl@google.com>
To: Keshav Verma <iganschel@gmail.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=" <arve@android.com>, Todd Kjos <tkjos@android.com>, 
	Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Jun 22, 2026 at 08:28:01PM +0530, Keshav Verma wrote:
> Rust binder resolved handle 0 to the context manager node, but it does not
> reject the case where the caller owns the same node.
> 
> The C binder driver rejects transactions from the context-manager process
> to handle 0 after resolving the target node. Match that behavior in Rust
> Binder by rejecting handle 0 transactions when the resolved context-manager
> node is owned by the calling process.
> 
> This applies to both synchronous and oneway transactions because both paths
> resolve the target through Process::get_transaction_node().
> 
> Cc: stable@kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Keshav Verma <iganschel@gmail.com>
> ---
> Changes in v2:
> - Compare the underlying OS process task instead of Rust Binder `Process` object.

I would prefer to compare the Binder Process object. Rejecting
transactions between different fds owned by the same process doesn't
really have any benefit and makes fuzz testing much harder.

Alice
