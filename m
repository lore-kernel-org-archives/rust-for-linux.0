Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794405149;
	b=d2EoAD+RNbbFO1kuel3bdytbI/H70Y9BKgNTSfAJLZn02HvSq1FNuj0yv2JZewBFmfNW
	 Gdkkapa/wIWwVOBpYXbuJsY7LlRG1YUOT9fu842MXOmHLQAMpU8gwCB4kigy8Km5RQAWn
	 XgLZpHjpcL18IaRvN4lPiRZCWLJRz6Eu8LWbD5vSsZbSBL3sZ3yQzTkFJCFvsxbVDJ2g4
	 7CDOVGYvj4NHF8iPa/6qLr0NcAg7n9OgKQ+T4ctB9fPr3i4k3aU+o9Ub3zF7D+HJyW+4n
	 dvDjE97OsFlNZ8xgL/h3MyBvUZdO2akRJ/3IESXd/+7fHiCi1lGSgD4qR5Ti3WfRZVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=+2XFINlCbF1zth0AicmB99QJrW9ixPJECxXERtFRMTw=;
	b=Dx0Mk1LbMRvUC+tt0IA0o2MSt64yhnRGG0+VdD6JLAwvpE6NPniEKQtel4WDrWjDMrTt
	 X4fzhuFdoYQoAzIX2xXg0WwxDJYCIEEqTytyNzsc8xVPmBSLktjeD3x7Yf7hWYQrYWRv7
	 Ga116UQu7Oe+g+BnIGicneoTZgh6RV2DLoVF6qgrwvqU+LS0cWCf6jAE+d8svaN/f/0lw
	 MFZdJEfD6jCzX6CmmpIYmgZbm61DeiplZSmDHQv+Bx4kR3zjFebHoaSxY3uyhScCXdW9Y
	 MhAnO/7aJCNeXuM0GBfmHRryv+yOHt7CxBVqT00uy+pGBcG6grcvxEn3OwHB7VJFGxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsiALXzn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09AA606A31C
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 13:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F09AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hsiALXzn
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-677af43eed4so3593896d50.0
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Nov 2026 05:52:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794405148; cv=none;
        d=google.com; s=arc-20260327;
        b=qlFHkZUUCiojR7TpkWtzzAvpvajEnRHCzMW293zhUo39xp66yZ8ICMMyB7Gl8xvIg4
         dWoqUame4qw0RclVRVuuQP4JvXK3Dk7QNAzUQSpMqe+tGDxNZciCC8GzOaWRpBKoZgZv
         Aqnwegk60kZ2rzBoty6EQ5i5sBzbbzMweOSFuui7BoqdjoIzQxZhRnAeRhx6RE0SoBnJ
         rDdKHpZytCRxSunjAi1drLQTD+KedLvPOTupMYUunXMIrTnZFTRYOb3jjnJJC0+cmyoX
         1orQYTGv4vf9v2AlEb5Zl80fSGMKWelLEWVnRtqte7lcvXzHwHb4bYTf/AsChC+x455k
         D2ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=+2XFINlCbF1zth0AicmB99QJrW9ixPJECxXERtFRMTw=;
        fh=ORMnvbT8+1yxRkRoC+Tkhd9x/aaVx8NxBidEAMW1FAc=;
        b=a9wNasfSv00er9AmWjlMfoWx7OarVRefe6ONzMgJCRLPze04ahrExhFoicA9xiL1s5
         XjoxUCUo7PMlLNZ9z95g33yNuNt+nWGEzLxXIS31Wx6kRjsGb/hvB+7WqAa0nzpUGDPP
         xEFLzIbgOgtGo3mlV9Q7nNzxdkoWuM7I2poyTFoxKvrgf+P1PzDL/QTAy0yU4nY5jJw/
         jcTYxM8aXywCS3qV46aD2meTf9HdF+t5mbV7ns58B0H4g6mQeIKbas6IrsvecB8sGIfC
         JikoB2YrMPb6w8p2wTW9b+Sgay9PYxlRUgGfHV/gNdSI9zSdev3/Ea4NaiiAGXCSaAIK
         G44g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794405148; x=1795009948; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2XFINlCbF1zth0AicmB99QJrW9ixPJECxXERtFRMTw=;
        b=hsiALXznod0b7s4QqhpAJjyZ+kW2LE0KXzlepqzfI9y7GwtGewkdMgI018yzCQxUAJ
         IoZLVto+BtzBeUtkMK0+NdxYu6h6R/IOS7gKE4YtTEVEz9WzgiWjim8RMsywJJZ/9A3a
         w25/sU4o2g53eMwobHubnWtpbHqMzxf1sT6Gfd/RyctrSxm3x7I2J+INOYsqH98Q+dJO
         S7kW5ScArQ4GmPXaw0Yk4m47MwbZRNel+T0YeslJj/3eZkUTVd4sYdXFkQRGVmEU6gp1
         V2zMCNrNGIcEs/qT4V2aaJlHHiPEAasDOLlJIHPQb1sMsOKAyxy6FSPWph/eUKQHUKac
         opig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405148; x=1795009948;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+2XFINlCbF1zth0AicmB99QJrW9ixPJECxXERtFRMTw=;
        b=oSK2f/cmBfpQ6LBR6CO1JqL27CDIASZHmBvwha5CfN+0aSxyXJPMpvDrc2lPPp35KI
         raLU4enIK9fu5LOZXO8D+u/CyjV0M3VUCPRfPMK2XAF7TbtGFPv/1yXxVc6grSIvcHEi
         ZtCDCOgOARb7dIYA6C0r2/b/9d8zOStgWICM7vIS7ZGZcDvc1IG0Cto8jvVZXu929E+i
         rsjNBdt/UsdPvg7q6tL/oGV10jGFnZMozUrxWgyvTU1MLA1yw8rYkg8l09HcJFiQUlTR
         TrBfbTDUnfspfj/Xpb4iEubeQ3t4GPMHGrz1QI4OdJ9UoIuKzMlaSwjPL346VYVLvtq1
         DFug==
X-Gm-Message-State: APuU4Z8EMtwQG0BIvj2EkJYJt1upOuwtroAFhDe1hL9kScEgQ6EZ5Wf7
	Pe8+eIlz3+0Q6eV6JYa5LoyBQe9rQMRTZV61KQnRpqJKyIPtDKybJ+TfmZAd2PVcoed88eVMXrv
	UfLpKx1rR8LVYaFen6QAIgDRjpFBDQE95kyrvWHQ=
X-Gm-Gg: AYBFou2XbvF0UR/eRnam27SxM8Gvol3Eh6TSmAqWPM6p3oOB74K4VqhqxbN6PvvPAFd
	7RJZOH/qVbPf04PBPAZRAjqemuQPh/xeccrLRzfLq3HH5UahBISqBLRifft9c+sQZRCgEk0cEIr
	WhMsZL8NFaBlxCeHQmiaS2fSTlD/cCVbStXlZKwdZdmYJrtmpZ8NGJMG11KTxamFZ2Q8942U9yD
	Vb2tjExtS3/ccMDxv/shqeo3YDpvbDaJuKPeyWMFz5orG0MIRnMVFowx4wDxm3aLPbC80bXjqSQ
	sSMODd0W2IDd6K7NYzRRl7inq3NDw1NmtE9b3UnsPi5CM3ibjzU3rmZt3uLfalumTRJudlnpbPC
	v/J5WIWDQPDOkzNSCLqxtBfCeHgLIvL0VV3OyL7GdCNUM7r1n46bR9ylD4Ylk6Bbuls29g9GXax
	kIg4auWDIQ8woT0HWxPbBXn6fagi3TWXaGmBei56r4O9nx+XPG
X-Received: by 2002:a05:690e:130b:b0:677:dae6:51d4 with SMTP id
 956f58d0204a3-67c6804b13bmr2026758d50.106.1794405147616; Wed, 11 Nov 2026
 05:52:27 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Punnay Sharma <punnaysharma805@gmail.com>
Date: Wed, 11 Nov 2026 19:22:16 +0530
X-Gm-Features: AclHuK-8OQfKtr7kd2tK0-A81DqUvdX6w8JvvpM3cbih-ZSsSowvUkNCG9mmulM
Message-ID: <CANw-i3nzboD-O6aKcLqtgCiY7quV2NbmzgO7wMbUKmETti1sEg@mail.gmail.com>
Subject: [RFC] klint: generate FFI preempt_count data from C LLVM IR
To: Gary Guo <gary@garyguo.net>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Gary,

I want to write a tool that makes the FFI data for the klint
atomic_context lint. Before I start, I want your comments on the
design and on the output format.

Current state:
I read ffi_property() in src/atomic_context.rs at commit
898b14f358fa. The table is a manual list of approximately 230 C
symbols. An unlisted symbol gets FFI_USE_DEFAULT (adjust 0,
expect 0). A call to an unlisted symbol in atomic context therefore
gives a warning. krealloc() is MIGHT_SLEEP for all GFP flags.
In your January RFC, the atomic_context lint is not enabled [1].

Design I propose:
1. Input: an LLVM=1 build, a known .config, and
   CONFIG_DEBUG_ATOMIC_SLEEP=y.
2. Extraction: a Clang pass plugin, loaded with
   KCFLAGS=-fpass-plugin=. The plugin runs at the pipeline start,
   before the inliner. After inlining, preempt_disable() and
   local_irq_disable() are inline asm on x86. Name-based seeds
   then do not work. The plugin writes one facts file for each
   object file.
3. Solver (Rust): a whole-kernel call graph and a fixpoint for each
   SCC. For each function, the solver records:
   - the deltas for preempt, softirq, hardirq-disable and RCU
     nesting
   - may_sleep: Never, Always, Cond(param, mask) or Unknown
   - an expect range, with the same semantics as klint
   - the shortest call chain to a sleep primitive
4. Cond(param, mask) comes from might_alloc(). There,
   __might_sleep() is control-dependent on
   (gfp & __GFP_DIRECT_RECLAIM) [2].
5. Indirect calls go into a separate list. The solver does not
   merge them into may_sleep.
6. Output: a JSON database, the klint data, and a diff between two
   git revisions.
7. Evaluation: fix commits for "sleeping function called from
   invalid context", Smatch, and DSAC [3].

Questions

1. Is FFI_USE_DEFAULT (adjust 0, expect 0) the long-term model for
   unlisted C symbols?
2. Which part of the current false positives comes from the FFI
   table? Which part comes from the MIR analysis?
3. Which format do you want in place of the match in
   ffi_property()?
   (a) A data file that klint reads, with the symbol name as the key.
   (b) Generated Rust source for ffi_property().
   (c) Other.
4. Do you want conditional properties? There are two cases:
   (a) Flag-dependent: krealloc() with GFP_ATOMIC. For this, klint
       must read the constant argument in MIR.
   (b) Return-dependent: the adjust of spin_trylock().
5. Is data for the reverse direction useful? This is the context in
   which C calls a function pointer field, for example an hrtimer
   callback in Rust.
6. Does another person work on this now? I do not want to do the
   same work two times.

If the answer to question 2 is "few", I will make the JSON and diff
output first. The klint output will then come second.

Thanks,
Punnay Sharma

[1] https://lore.kernel.org/r/20260127172330.1492107-1-gary@kernel.org/
[2] include/linux/sched/mm.h, might_alloc()
[3] J.-J. Bai, J. Lawall, S.-M. Hu, "Effective Detection of
    Sleep-in-Atomic-Context Bugs in the Linux Kernel", ACM TOCS,
    2020. https://doi.org/10.1145/3381990
