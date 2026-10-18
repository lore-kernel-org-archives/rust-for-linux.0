Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A14523E324
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792346223; cv=pass; b=DwlGZbkYtEEj9C0YrO6li8kN6noeFxBqqLXBc5QQD/vcdWXpO3Ylmu4dIDOo3Vkz+sSbmOwPvXd1fkCCdAFnuTzQiKGLgIYGtXYrAMHzYvmYHX1Hp3ypLyd1bSEOV1ioD0v8y76bgNKpk6EKbHxXyjXfgmlt3cUoPsw+GQe/xDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792346223; c=relaxed/simple;
	bh=ein2Kxm/7ddUQW+oHSZ4NEDEcr868l3pq4onBaj8gos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOzkEZw673R4nYBHXkS1DsKy8n7kt57NWAn9EqW94/uGtS4V8hkdCAXWQ4HyXwCnOSAk0Jgx6Kzh70GQ0gC8psZeeQCfPuzENOIoVDWbL3Vt0G9+IJoKGJu+livPeOb2luXBTcvnWwLkgqcTiZSxMvmRWKIrLe2wvWHdRugIyao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuKSafKM; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuKSafKM"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33bb5afa736so163440eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Oct 2026 10:57:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792346221; cv=none;
        d=google.com; s=arc-20260327;
        b=gNnJNLevRCqt+itbM+S/4Nl/XO9wtyPOedifokan7+RLgWrMzrh6b7zEmbtlATeP5T
         sgCPJoFiYRGhgz4IC9AQIQ6XUe76l47DFObiPIxAA0KFKrWLOnMPUSxaz78bpAZ7mysQ
         H2zJGxfF+u3aQ24rPS2Tl6Bdmk9JG0LirKLPzb26ReKmCxJwlGIVPjrqsG1EV6IKJHV0
         U8DzPGMq6c0O0/FABjBVlb8qBthCzhgtiIO99/yNL4Ipj1k16OlcWlwnVxy34sLWsZ/I
         5A9Ewou1Ybd/UsitsSDeoX7RgAQZ3RQELBqsbXEjrrqoNxtgnDfL3PGZuceIdEguPZ55
         HufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        fh=yCGEvRUdzJvx/0cCABxOfxge4KXM96hToskBJhK8kSg=;
        b=d2WmIjsHWPbyCCbx9c77z9+t310Puu+X2QEqQnttOeFuvlZzA429SMk8sXC3x9krH2
         mYjPHGxRU/6kISX00PQgU/OM+92CkmO1SgP6eEjDWv50vzFWDrCX1IuD73ejTw9gjvLl
         x1EZvngLnfFMvLU0D2STkh3FmiPBuYErDy7lrJOwda4anTOZ9prV6wGivxdruouGS9+r
         WA2UK+v1OFD1kcJz9iajbxZNBZksctBW8+08I7ev5zZER8UVAdE6a7/F2a6KkeYYDccO
         beNwIV+xg3x6EeG7twibKrEkzbstYltGET2QMIRcK0hy82K/jkIkkJWGbaqFqKi6YRGS
         i+qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792346221; x=1792951021; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        b=VuKSafKMez6dANuC4OAkzaUUQ0QhKEUmnTCCRXY4qkh4XjBrgEaJSjU/L2iDnU4m5y
         DMldodLQGCaWyFU5wwiBqhm/xz04Q33b9tQQdfJ6yaShtJHWsB0wSfRWAe/8JQlxBktl
         9AhfCJAfXgNboCcf1hsPkAX4UKanipQNy+CfyO0V14l+njp3hSgnLAzXFWoFcUO+yFGe
         MVIgDXmRsr4ln7ilDaYNIoaVRZKFV1w5JMyCE4PGi7jUIRkJxqLlOoV5sGiedMZ2+/Hd
         7sOd2ty1ExwXoKZdUSAzWD1TZIIKDxx3jP124qr6ZK2Pw57KWCDBE4G5PbF7q6Gxblcs
         cDaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792346221; x=1792951021;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bKssVqS+1fUgzpvGYUPB7GmCd4wpzuePwRHvRr1rp2U=;
        b=Q4vUctNPz9yot57oBFUiQyD5Gmwpu74iy7ag1dKwOM6MYrRctAdlI/+nnnmNr1cqd5
         FkuBWn0TVQiQ81v5IbI6yaOQg9gmQIrmeWu0bVhqfE1fuGtFLlp9HldDBEYY8+WauNsN
         NQfkN1PKjJMrCVTAMvmaonk/sKKlyrrciWRCgDOeIIRxwSCf/2awBZZrwteDQyn/rgme
         NpwC2p3DxQ1dyOFFAj+uAUzn9vghAIwiitXjBPj9C+KSvxl4U5fIbUBYTqgLXqKSmuAi
         UucVJARnsQeRXso/roxWThcUPyVITu0PB0UeK/xxDdcsuNhexK5jGCVZCkhRoi2Um3q9
         qI5w==
X-Forwarded-Encrypted: i=1; AKwUvBwKWdd0NAhe44FYvWUA4s3S+xYzOl6jkJrVcY5hVQZNIc77GFTru8RKqyykIqXOEqKwZtu5d+2TjuIJQ/blxQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKm9ii1IwyPLigy31LY3Ty7jJkXHDZyOLiDGP502sM1SFMsqPC8
	+FBg7ZfkhlJ+jpBfjqXdy2GE/yFGtBDA4ydpZZ+Ak0683NtBV3fMmKhO6FWQRHkomYQhqTRWzYN
	1q1Z/dLdTTkpN9Q8tDmDXDPNQ4OvQF6Y=
X-Gm-Gg: AYBFou0Wa9STLMPLhjQVsXEabtfQZNasBI5Jk0vYfD8ESWT5/kHm0sLFlPj9Rly27Am
	FcUQHT0rbKSNQGRbizoNRD0zpr4Ht6/xxkw0mG9ZKT0zJgCDoVRVu7tpZOSLxhbFt1jB06nop5g
	GPgeESDl3qm+sa1HfshUr2bgPpHtMtVBte/W90zCmrAleTGBjeA5kY9Q0Yxq7EArB0AdQcySk04
	zrlKWp/b9VLkKFwaVmMT1muglfQlgPIJ9xI776CKGNf3Omf5Jb0FVMlKZFYXgubiGAO4Ga4sm8B
	w6F4jTNIj27nqaLjcNuytm2qktoYLcb5Ikb9J/CpWs9Yc/VCPW9uY8qzLIseKQKdHlfdOz6R3hE
	ZfY+GnVCEYdPg1nx+atf+EmXEdfGOYPBsAisrJKnD6zUjGddoReDPSzYcILzusjHhQCYQBeXvu0
	V6xdYalZBuYnFNXvMuEpA5FLmN0U+kMA+5S87zOsgEENcqi1F7Rny9dFOs/ysOdQ==
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr13057373eec.0.1792346221395; Sun, 18 Oct 2026
 10:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Oct 2026 19:56:48 +0200
X-Gm-Features: AclHuK_3ymV6Lp1a_ivM4oJdQMCp7Ooe_ysoxuTMLzooZXb3XPtxZZvpcBg_tIc
Message-ID: <CANiq72=zv6uDRu+x=BpSLWsZnB2XCnPduQ1PXPPQNzxDgtm54w@mail.gmail.com>
Subject: Re: [PATCH] x86/rust: use `-Zindirect-branch-cs-prefix` for RETPOLINE builds
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	stable@vger.kernel.org, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 7:55=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> The C compiler is asked to add a `cs` prefix to the `call` and `jmp`
> instructions that go through the indirect thunks for the `r8`-`r15`
> registers, which makes them 6 bytes long instead of 5. That gives
> `patch_retpoline()` enough room to inline them, e.g. as `lfence; call
> *%r11` for `spectre_v2=3Dretpoline,lfence`.
>
> However, Rust code does not get the prefix, e.g. for a
> `CONFIG_MITIGATION_RETPOLINE=3Dy` build:
>
>     $ objdump -dr rust/kernel.o
>     ...
>       e2b: e8 00 00 00 00        call   e30 <...>
>                 e2c: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> Moreover, since commit 4a1e02b15ac1 ("x86,retpoline: Optimize
> patch_retpoline()"), `emit_indirect()` assumes there is enough room
> for the inlined sequence -- e.g. with `spectre_v2=3Dretpoline,lfence`,
> the kernel warns and dies while patching a site inside `core`:
>
>     WARNING: arch/x86/kernel/alternative.c:736 at apply_retpolines+0x2ee/=
0x400, CPU#0: swapper/0/0
>     ...
>     Call Trace:
>      <TASK>
>      ? _RNvMs6_NtNtCshS2CUL9MEDn_4core3fmt8buildersNtB5_9DebugList21finis=
h_non_exhaustive+0x5b/0xd0
>      ...
>      alternative_instructions+0x1d/0x60
>      arch_cpu_finalize_init+0x5a/0xb0
>      start_kernel+0x1f4/0x280
>
> Similarly, paranoid FineIBT rewrites each kCFI call site into a fixed
> 20-byte sequence, i.e. the 14 bytes of the kCFI check plus a 6-byte
> call. For a 5-byte call, that overwrites the first byte of the next
> instruction, corrupting Rust code:
>
>     SMP alternatives: Using paranoid FineIBT CFI
>     ...
>     Oops: double fault: 0000 [#1]
>     ...
>     RIP: 0010:_RNvNtCsdVypMZsLRAh_4core3fmt5write+0x1e9/0x210
>     Code: ... b8 68 81 16 9f 41 3b 43 f5 2e 4d 8d 5b f0 75 fd 41 ff e3 <c=
c> c0 eb 02 b0 01 ...
>     ...
>     Kernel panic - not syncing: Fatal exception in interrupt
>
> Non-paranoid FineIBT is not affected, since it only rewrites the kCFI
> check and leaves the call itself to `apply_retpolines()`.
>
> We added support for `-Zindirect-branch-cs-prefix` [1][2] in Rust 1.91.0
> [3]. Thus pass it for `RETPOLINE` builds when possible, which makes all
> sites indeed get the prefix:
>
>       e3c: 2e e8 00 00 00 00     cs call e42 <...>
>                 e3e: R_X86_64_PLT32  __x86_indirect_thunk_r11-0x4
>
> The kernel above boots fine with `spectre_v2=3Dretpoline,lfence`, inlinin=
g
> the Rust sites as well.
>
> For older Rust compilers, set the LLVM module flag instead, which
> has the same code-generation effect. This means that every Rust version
> that the kernel supports gets the prefix, that the kernel boots fine with
> `spectre_v2=3Dretpoline,lfence`, and that paranoid FineIBT no longer
> corrupts.
>
> In addition, add it to our target modifier workaround for `rustdoc`.
>
> Cc: stable@vger.kernel.org # 6.18.y+
> Link: https://github.com/rust-lang/rust/issues/116852 [1]
> Link: https://github.com/rust-lang/compiler-team/issues/899 [2]
> Link: https://github.com/rust-lang/rust/pull/140740 [3]
> Reported-by: Kent Overstreet <kent.overstreet@linux.dev>
> Assisted-by: LLM
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Not sure if `Fixes:` tags may be wanted here, since this was simply a
matter of not having added the support after we got it into the
upstream compiler, but two candidates are:

  Fixes: 97e59672a9d2 ("x86/ibt: Add paranoid FineIBT mode")
  Fixes: 4a1e02b15ac1 ("x86,retpoline: Optimize patch_retpoline()")

I hope this helps.

Cheers,
Miguel
