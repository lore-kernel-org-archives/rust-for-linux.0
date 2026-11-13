Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558521;
	b=aggOzsn6s2kOQj4NlleTr38TzdMDtUjdAGwdqBL/fVoB4bvYn9Ju2uggKKctAWkRtQEA
	 k67hRyTTcXhjzVOwgr1j6xKx4zELOhCDDjVroC5/zKaOrNKmrPIPhCLJA325c4O2zA+r5
	 JZ5Oq+TYsOX0rGdixILaOZbR1Vj3XXv5823lf/4k//3r5eBW6lWs68ymHYVYNFT7o301F
	 9Wiysa2ahApZbk5ntoOtNagIAnZ9cqKkWf1TpgrMFsHq3/0iuRvbqC9Ick49i+OUjSvz3
	 Jfu/lOFmbrbpaf+1unjCd5p+TXvN6g1dMLhkQKtt1Ww1ggtkWW3cEaVFPCViELY/Kmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
	b=GRtZsI8/BVFDfGTqy+H3TdkjQy+YioSdGEzcBCs0G6kElBI87QW4qtDNiM1RKnOgQEkg
	 NofsVI4eAcT+ZTs+J8efaJHc/4W4JOMisPoAgMM8LVlR4TWZ5jw8Uin6dX9j3clW1CVvX
	 owg+rNPT3s1/bJXT+hDI21q+n/Rgv+IEReGxR8jAsT02xybzDn92yB2rc2NXgzVIsMEzz
	 +PHT0N5wYfhUXVH2gKjPchncMzVJUFdf9iZ30w8aQEQskicMfCyECZZLHuc4L8NnhDajl
	 +0AwE3m00AG5Hndung0XWK5S0IfxvH6dWdDQtqgvL4wivpeVMwN90ToTAdxvcDQ0/DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOulv2aG;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03283606BDF3
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 08:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03283606BDF3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jenhaochen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=hOulv2aG
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so1034275a91.3
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Nov 2026 00:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794558520; x=1795163320; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=hOulv2aGaS9ZeYnKvdMh6U1l4N+M1moW7Kq+ZGF+AV8yNfLpmz1l/YjkfZD+2q1O3W
         vOzcRXS090dMSTIT6ABgDWNRiQNm2rE2Nt15iV1NZr7LyEZ3Si02OiNVzVyNdbANYNWS
         jwweszeCZfe+J6GH7eD/5rQBCOzgueHigErCyhFdE48sdajr2sDn0KhDPYP9ls9Isvk0
         n1lnuFKtsZumrpxUeYPLR/TScqxjbzGJ8oMycyJReOI8ALgf1cGSLMcspEcWGk7i3SRW
         3MvDpqdZwGMumpG0XjIyKcDBS5eIjfL2CLMvQkSay6LsuQcH9Qk/R1HFRs6gf2bBNR0X
         GMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558520; x=1795163320;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nrmFebnjevEyXDZoOWfiZZaPcF3U9vlhmYY98rYqI7g=;
        b=qppl9xjILKPmoAsA8jlBx90CZx1LQEc0gwwUCuYScdSITvAL7Ly8tz1HcnKt3aVtTE
         2Wkm3hX/SHxx8rNyyKJxcIphvicnvJY9/XzWdVadtxW6GezmVZsKI9E42Ys+nloSfwNR
         CH2t3tEu5zdIIYp6auq1RpInrA+Vq44Cy9ODmwNhsMjxqHDXRlpfwqoRT7flFQEzOQdo
         hEC2W0SxWW3WrEHoA/7htjh40wCrsiL65X6KT+ydncvX0VRp/mAQewbpkf2ClELe2RKM
         7nLZsp5hemJl+Qeewf4kmQEEViRSWmX2Ky7OFde0rEyTzH5+FeNdM+S0A4zL8Mh0ndcG
         KjpQ==
X-Forwarded-Encrypted: i=1; AL+hErHrxHJYIt1AiR8JzubaqwrcJOVFwiclf41VatelkObRqNln90rCN+QQ0i0T0S6KJdiw9SvjwuGifLiCNH2zkA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Ty2GhXMyOTPqfHgZOHVXrE+qp4mvB9ncRNQfMzw5eH/U/FYiz
	dUDKQjZcW4tQk2V9GibUYcyxLtRKK/SRukq+OmmUXq423HMvS53s+2A+zPo3K1DBkbpasFlVxGt
	O87Ivsivo6tFOAlmGRWtGDQ==
X-Received: from pjvd14.prod.google.com ([2002:a17:90a:d98e:b0:3b0:9569:4e9a])
 (user=jenhaochen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3d87:b0:3ab:2737:3395 with SMTP id 98e67ed59e1d1-3b1b0a3a2f9mr1460229a91.42.1794558520120;
 Fri, 13 Nov 2026 00:28:40 -0800 (PST)
Date: Fri, 13 Nov 2026 08:28:37 +0000
In-Reply-To: <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261031030807.4101384-1-jenhaochen@google.com> <CANiq72=zg8WeupV5TPTr2tUxAt7imSZXacw=CBf75MdfcAv-rA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113082837.4011638-1-jenhaochen@google.com>
Subject: Re: [PATCH] kbuild: rust: pass AutoFDO flags to Clang with inline helpers
From: Jenhao Chen <jenhaochen@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Rong Xu <xur@google.com>, 
	Han Shen <shenhan@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Qais Yousef <qyousef@google.com>, Ben Wei <benwei@google.com>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jenhao Chen <jenhaochen@google.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 11, 2026 at 7:48 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> This sounds reasonable, but my LLM spotted that Clang will run
> `AddDiscriminatorsPass`  again, i.e. on the optimized bitcode that
> `rustc` produced. So the profile ends up indexed by Clang's renumbered
> discriminators, and then the build that uses the profile will not find
> a match for some code (depending on inlining decisions), i.e. that
> part of the profile is silently dropped.
>
> It proposes `-mllvm -no-discriminators` in
> `CC_FLAGS_RUST_INLINE_HELPERS` so that Clang doesn't add them, i.e.
> using the `rustc` ones.
>
> Rong, Han: is that expected?

Hi Miguel,

Nice catch -- I tested this on drivers/android/binder/rust_binder_main.o
(arm64, Clang 22 + rustc 1.91) and confirmed that the duplicate
AddDiscriminatorsPass run is real and that passing
`-mllvm -no-discriminators` to the post-llvm-link $(CC) step improves
profile matching in both stages:

1. Why the second AddDiscriminatorsPass renumbers discriminators:
   In Stage 1, rustc runs AddDiscriminatorsPass on pre-inlining IR and
   then runs its optimization/inlining pipeline before emitting .bc.
   When post-llvm-link $(CC) runs AddDiscriminatorsPass again on the
   already-inlined .m.bc, llvm/lib/Transforms/Utils/AddDiscriminators.cpp
   keys blocks by (filename, line) without checking inlinedAt and
   overwrites existing base discriminators via
   cloneWithBaseDiscriminator(). On rust_binder_main.o, that second pass
   increases non-zero DWARF .debug_line discriminator rows from 6,245 to
   9,313 (+3,068 rows, +49%).

   In the profile-use build, rustc's SampleProfileLoaderPass runs before
   rustc's inliner (against pre-inlining discriminators), while Stage 3
   sees a different post-inlining CFG once Stage 1 has applied the
   profile.

2. Measured round-trip impact (42 sampled functions in
   rust_binder_main.o):
   - Stage 1 (rustc -Zprofile-sample-use): annotated branch_weights
     increase from 454 to 490 (+7.9%) when the profile is generated and
     used with `-mllvm -no-discriminators` in Stage 3.
   - Stage 3 ($(CC) -fprofile-sample-use): SampleProfileLoader record
     coverage increases from 39.3% (2,832 / 7,205) to 54.0%
     (3,707 / 6,860, +14.7 percentage points), and sample coverage
     increases from 42.9% (757.8K / 1,767.6K) to 56.4%
     (989.6K / 1,753.4K, +13.6 percentage points; 969 -> 1,035
     branch_weights). Against a hardware ETM profile, Stage 3 matched
     function entry counts also increase by +33.9%.

3. Side-effect checks:
   - C helpers: rust/helpers/helpers*.bc is compiled separately via
     cmd_rust_helper (without CC_FLAGS_RUST_INLINE_HELPERS), so C
     helpers still get their pre-inlining base discriminators before
     llvm-link.
   - Flow-sensitive discriminators: MIRAddFSDiscriminators in
     llvm/lib/CodeGen/MIRFSDiscriminator.cpp checks
     EnableFSDiscriminator and shouldEmitDebugInfoForProfiling() rather
     than NoDiscriminators, so post-link FS discriminators remain
     enabled.

Rong, Han, Miguel, Nathan: would you prefer adding
`-mllvm -no-discriminators` directly to `CC_FLAGS_RUST_INLINE_HELPERS`
in the top-level Makefile, or appending it in scripts/Makefile.autofdo
under `ifdef CONFIG_RUST_INLINE_HELPERS`? Happy to send v2 once we align
on the preferred spot.

Thanks,
Jenhao
