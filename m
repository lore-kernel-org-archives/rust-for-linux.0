Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794795946;
	b=FyH4W46Fi47GjMvEIzBb/Mlxj99LGZK8rRChEjNo5d9PGJDLikxsK1lBp7qbSVdnXoNh
	 8Sg7v9WM5kpSEMhq/Er6qkXEFbM0g6c0wVhtyC9+od41ESYEkf53ZDZt7EQhruE1wKVfR
	 j9i5BozYZR1ARF1r4DLb1Op7lKdMXIIDAnGUJODnHBNibPv9ul5qJQyw0nCfWQI3H8t/x
	 MCb/McGxAqnYGA1ktntZBmG0grTdIMV/CrKNevX23cN71Bokg2cr8hkORzevdqFSBknMQ
	 hs6+FkeNtuNSSnjRjXxMbNzJaiRw8OfYsMIPDYLCUvVCKZGTxStsGN9oL+4PpG0sdew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794795946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t+3HLoSfDTzBHdPUkFEUcxcgDRzkje+Mp5l9yEgsZbw=;
	b=z29Cwn5fwC6k3qpb4Or683oVT5mzc/XhixoZRtWcq4x9nocvqWvXqnAyx15A02y+wLOz
	 D8DPlPGWKIB+upp1Oaa6DrJgmHSJvs8tA9C6aEyrDHltFE7wKRbIJLx7iOGjbT7EvleCY
	 VbAH4TXDR6Z7y6MTBlCOVGyCPeEP/YAV8X1aI1IgSQGhcPlZq+NqUmSFCWBHCNDuguSml
	 VzJvC3t31SI26yJr4wCyugcmE5g7QB/44GqGjQ4P/nhfA+pfFu8fgGM1PdasH2PGMUhcP
	 pgy3cG+rqRdiph6aGGcxHZzZha/VxJ6y2kVbm+mLF4TU2638UHBlrozga9T71PaHl3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYE0g55a;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D9606A31C
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 02:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699D9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yYE0g55a
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1500800a91.1
        for <rust-for-linux@vger.kernel.org>; Sun, 15 Nov 2026 18:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794795946; x=1795400746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t+3HLoSfDTzBHdPUkFEUcxcgDRzkje+Mp5l9yEgsZbw=;
        b=yYE0g55abMUNWqblV4JV7J7pCPUW1u6cYwKKSsTM+jpfCbguIdA4OhsS99C08pkALT
         DbLaOe22nEnzuKj56BPNEyWcL7mszdjNaDllKoBezunLJspGMBhYq6tiXfXaEB+dEotr
         gagzM/minMaGXXcINCBsIYh5KWimi2ubgTlwL8jn0nWRHTM87dFSpbL4xnQ7dWL7DB9D
         4vF/6FVIsoycAne4TkguOTsoBoyeLlfPMVTs4FdQNL1sZz+riheWTDTzwkrpzUeaUo3L
         nEuh2ZUlATF928+4P3wBm6Wu6pEzmuz1SXB5fTxXy4+6iP9djxEu4wzdq4RvNuk5Lelc
         G9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794795946; x=1795400746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t+3HLoSfDTzBHdPUkFEUcxcgDRzkje+Mp5l9yEgsZbw=;
        b=QBgPR0LGzhcs6RBBBRIcGM7SvSO8QahzK2D7wSpJL08ZkR2y+jyqq4G1v1OZm7fW3q
         FHUM5eKFWRgvX4w3SGXYd/2uGgigt2z8Iy3W4WmPZUCQZ9Hd1BQlyxJ0lBmxExc4Lr0q
         rd86w9to+cdbDAWMs1ZFg2HT1uJ+LG6FA/4pppEGRVQcC8LKCzN+vUoELlGkPqDtQung
         SkkkpVrkrvA8O1xytepvtn6zv8dVHPRI8hetd/cB8HlgGS9Mnz6RjRfbf1O9/VenUSVb
         3CHW0oaSlpLQbDYkjwxCPMeDjhQ/X+MYavxBlspPiueOLk64XvkHgCJ+TSppbVqYkgXO
         dzlA==
X-Gm-Message-State: APuU4Z9FXKBc5jSYqank/ZjErnfe4WjIbOL7VW36KMQTU4xLkYPN6oS0
	6xynZVQaCh7hKtudB10ZYpVerqhCqHscDETOkgcSANfIDa/CzAK+pHDs
X-Gm-Gg: AYBFou3TWwHGBX2mVPKxQ9x9hQSBWrSm74/BSq99P+J8TwRJoi1v3EMxH5W773hqW4S
	SfVoDw5kDSGUod43cW+c5aLMUhDjt21nrVICQ/X0ymQ5FiydlB+neRAVgL6LPuXrQmFY4iO0VN8
	hJsm+tAOW5R5kIsLlBrfWOraaNRe8EHos/S2AQnUrQYOso2cTovIc/qbPf95MjNej+gw58s97yj
	9GwX5pQE9gVhTKLPOg2xNJdCRvdQ/2qHx5HkODEoEqM0TlIkSYuGLzrxUQpB3K+D01OqJ0qfvhD
	LI/DikSZCxSOUtzyYeTHm//Q9tlBlO33kmP2DQhIIEKmvxtRDoRKxd32IrhBZZYG2XsSzAzL9Uc
	Srqg8rwjRIFu0AzWw4sz+zqmh8Ny3s+qUyTTYCBXnkvReOgNxaTZJfRteWToNivqOGgbPgJov3D
	gXTXh+9ApdwXTK1i2nu90sXzmMfkDHX9X7jO0L7UHEOV5S7//B2lE8EnqWSgtNsN/CM3JS2/2Os
	H+DUDpSeuL49HgPI1FihlksbQybiVsWiU3JjR8lFqj6Zf2iIQLaobo5FF6K2AJ+utIKWjChm91E
	DhiWkWZ6VxrjThM1q0a2rRNUeivmlAqQDoyIYk3+kjBk5qKUcALBtuEFm9lahP0ZxPFz6SY=
X-Received: by 2002:a17:90b:1846:b0:3a4:6f38:f2a2 with SMTP id 98e67ed59e1d1-3b1b0a3e7bemr8165137a91.25.1794795945569;
        Sun, 15 Nov 2026 18:25:45 -0800 (PST)
Received: from localhost ([2401:4900:1c71:dee7:a061:51ca:fe42:bde1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b2133c5dsm7062396a91.0.2026.11.15.18.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:25:44 -0800 (PST)
From: Punnay Sharma <punnaysharma805@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org
Subject: Re: [RFC] klint: generate FFI preempt_count data from C LLVM IR
Date: Mon, 16 Nov 2026 07:54:40 +0530
Message-ID: <20261116022440.460064-1-punnaysharma805@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <DMSFW4SCHFGN.2551XSD4E2Q69@garyguo.net>
References: <DMSFW4SCHFGN.2551XSD4E2Q69@garyguo.net>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Gary,

Sorry, my last mail was confusing. This one's just numbers and one
question. Thread for reference:
https://lore.kernel.org/r/DMSFW4SCHFGN.2551XSD4E2Q69@garyguo.net/

I ran klint a564b2a on v7.3-rc5-577-g6addb4f38557, x86_64 defconfig +
rust.config, LLVM=1. I had to port doc/kernel.patch, and klint panics
on bindings (compat_ptr_ioctl), so I built that one with the lint off.

The bindings declare 8385 C functions. The Rust code in that build
refers to 281 of them (klint's "Unable to determine property" log,
plus nm -u on the Rust objects):

  281 in total, 236 of them with no entry in ffi_property()
  138 are linked by a Rust object, 93 of those with no entry

Reports with -Wklint::atomic_context:
  - That config builds no Rust driver: 2 reports, both in the kernel
    crate, neither about a C call.
  - With the Rust samples and drivers on: 23 reports. 2 come from a
    C call with no entry (scnprintf, page_to_nid), 1 from mutex_lock,
    3 I couldn't trace, and 17 aren't about C calls.

So you were right, most of it isn't FFI. The 23 isn't a full count
though: a report is a hard error, so I rebuilt failing crates with the
lint off, and crates using "kernel" then had no klint data for it.

I'm thinking of making a tool that reads the C side of a kernel build
and works out which of those functions can never sleep, but I'm not
sure it's worth it. "Seeds" was my word for a short hand-written list
of kernel functions whose effect we just state, like __might_sleep()
or __preempt_count_add(). Everything else is worked out from which of
those it can reach. klint stays per-crate and only reads the list.

With these numbers, would a list like that be worth your review time?

Thanks,
Punnay
