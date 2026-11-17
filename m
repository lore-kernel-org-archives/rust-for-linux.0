Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897477;
	b=fCdTfmz/cW9o6gd7wQMg1MtLE92hD8hbozzoFzDCHYpJ35kUg1uNo9ogivG4eA5KOpHF
	 6Pm5YR24Wle9YiYq9J6brf8wIKPayBlTWkYFPnVOFL8PdssyltRFskffq6qzVsjJh00BK
	 YrEn7HKACd+aWy1lQ+WhhGzkvQNDyskbi4Fu/TOe2AlGbkQcCvAp76dmABA6uJl/338NU
	 KNik+T5dSYIq1hRwFzzoOBpQvb4nOjh4ZSSxrIxxiLu3UscUo36WddfHV1Tw4NXTq1eYT
	 b2fru78GlZMfpDXNwBa0GUWWZmtAWJtn2DJOdNkfVnqmoMqRWknfI97BJz2P+8Gi5nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897477;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
	b=NUZptZo5MKJ6DLq4U3POEqEl/nvennbn7/KqsPLAnYF/ujTlqEEzGTN5jhKvXuTHkF0Y
	 vSt5jskdtAuOTARYvVi29ePxvAR4VG2Q/NH+vCIBSm85vOvQyFHcnNaUiEThCCLEJs8to
	 OhSpkZkGg65bxS4YZwV8+f52iJnWDcmD/JKj7qJyc8uf3PXDUbuXMLr1CktTMYQ9FeWmx
	 5TM/Qf6TNK0BZUFyu/Qe8/GSOwu4EkooRFvejIP/8dnlBc8Zx8Qmh0E8g8eC5UJIqiCBq
	 MxL6WWdiJs2zpgrw7dP8sHZOLAZ1Xxm3Z7w+xKUxzCJWyY+D2EByyfsD6pMQdAjdLbQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZw3HLQ0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.178
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A5606A32C
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Nov 2026 06:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3A5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZw3HLQ0
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3adf04a55f5so4372731fa.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Nov 2026 22:37:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897475; cv=none;
        d=google.com; s=arc-20260327;
        b=k/CnHawaYIZoWtlJ+fkz9eaxJ8T+bwOBXLyJLpxdHsA8vIGjyaeGQmD+Wi+dG5N1RT
         TYyUi8oSRaLKXHfLZADvvgj2neRQwEZ9ZcsCQBjcKXT1Q4Krme30YrO+PHYq6I3TUygd
         Fo/NSQ7WrJ4YEviWPgsGkUbQgnpyOkKqfbGwJjFDs1hDTINcYjVbLPE4qV+3KvLjTtox
         B2tkwiONZ104zkrhCL9nmZ7TNNnvdp5U7N6NMVWA+y+uz9vnZc9niun6zg6tulS3r8fN
         By85Mb38/hDyjwj8mQBnfMnNSTrh0wvIqrzigPhhdm6D2PVzsmeIbtAl2/LBZTyZn1Cj
         6gkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        fh=x/vFr+aCtLY4/pM1xQyal+mHwRehyu2t2zCRZfmgjx8=;
        b=crGi+pIg6A2MGDwN+ES35p2Whd2Uu9W06UtV6sV4IwxYEcQkvHmMNQQqjmmzHFEFe1
         FITIvhDd9X9NdUQES87Mo5yt1RuYyPSb3sOOGYbKkkwAsPBV4UYiVorZB97S/Eml5cwD
         UGMQR/agX6/GWRADBCsUqPh4I0cy9gJpWMLm6aR6Wg6OH4RznxjLaeeQiaqUcjtUz8Ay
         n2UKzev6M9Yn1Kqq8hDcmycsIs2nYlBaIht2QKzk3jHRu5LjXRi+o8IfsNm/XfHrRu3F
         n33D7o46xmCFYNdDQ1s61KgxqZVIvQunzo+W1D9jo7XaPYfLEKKL91ZnNMCAL6Et7rMY
         x9gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897475; x=1795502275; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=fZw3HLQ0nzuknu6xZZPoDZvl/L7k7TrZwsx5O6x0BB261gDfe1j2et0Foeg5z5mrdz
         pdov38qEG4e1cj1Xgv+BF7QG8EpS3uTPToJ/cPxM2P3pBo1pKt88mp1j6l8Lr9opRwrT
         UQol3T/ikaaqCg/kx4o+Pd7HKYdjzlhzq7ad2AaU1FYx4ATArJAAzvoJ61gTlvmuHGY0
         O6JvkVZ1OeI8Wuw/z/I9wPty9+oUFsd5ZIVwdZbnK2TVy5pfasGtQ3u+l7nglYvngY15
         oFQLd6ZP6sSDU4BH7A31BLLxMC5vw8UQ7K+BTZZJadCh3+IJ+RKhSEbeZVDIcTdJoU7H
         innQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897475; x=1795502275;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/vn2gJipiD85BsJ1Ku8SNmRl9thwiwlJMFECHzYcD0=;
        b=UfNZTNS+XfD3XBvl1WfnKMFXYMsd8QFQAA8dvPADA4IQYLJQ+OWWME5Ah06F3F4mi4
         KURwTBAi3j87Xu0/duTv3WM+JJ2T4HfeNMagI1drvIGEvrYDNGAD7DtsfMG+iQiaKN6H
         ti7atjxGkHY6X+CSGiY6rd3ezNaHgCrh8bdaQuvKRWCH3AiYdp1nGCJ83axlsdaBj22h
         TDbLjZBRhENmVhpAi02m5wKNoe2cbKJwVwVW75Z5O4Pp9IdHRIQaNQGIAP2tx2+Vx3wv
         meAD1My0PdjmnOOUka+HQI3gWmsNHaAQXV1JmbdHO1Ui4Hf8NBprXxoeYgb4gBEsf5ub
         jLew==
X-Forwarded-Encrypted: i=1; AL+hErE4nzS3GXxAXNixVsODYprwW9uOAFBsA5KAp0qgC3T+Sgf+qVPhkrSkGprxmC7i2L/xoxeIPrt+CCD8k8jsvQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/z7LACGUTR4mGzWQwW915ck0OxsmbGYcGkYXuUMQP4V34pQEs
	97GEHYgXJjvwrXWv0dDfT2QXfTotuHUo9RBb10QzkcmW0ihvIW8aVEzoYQp2uFqZFvywDrijEzp
	o3mlkcG3OnxDhdG4y904BS6UzmLxzfjQ=
X-Gm-Gg: AYBFou3HQN07YCKRus3QYBDwFAMzjyHtIq9Da2FmWc1D52bhe+BytuEWYG4Mmzq/o4O
	4+fl5n+B3Hu+E107XG1gPF7RGhr8yeym58k2R9UdhDBO+jw2wUtrCwfgWmFFCAsWt7ORsEmrp+4
	O0JZck2nU45KVaR/x2b8msr5P2Z3YuUQaHlhyloLcw8X9PRKrpfAaf/RNTx2M3guzbkghoL+lFm
	9pJGMyR232M9PY+GiNFhI0NeEBwVmjM6kjN0LKiJcrzqvWIJOahOCU2rQ2SrE04rhJxFCe6E9W9
	fxgdopSsz6GsKX0diadgXFGNCLaBB5M86HmPJott1gY2bkm3yv//cRw6sn0SRiLupjicBfJVorE
	tZogBvSWZvbqpwFATPuc4atC5MzyPD0s7T8/UxIq2CPsKY2lMDhT/qDgRzMC3Bm4gb0Q3SUdbw9
	l86TxU4YiDupG5m1xcQLP8QDc4lnbW8YsatP1kg/2i8KL3o5qjhDTdQiV3L3tWVJntiICSwKU8p
	qEK5A6MJWCa1OrQJ/s3razFzut4uF81a4eMf4BF2XG0QnW699aepzDxeYFwLwVdHp31cW7WaQ==
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr5667796e87.0.1794897475024; Mon, 16 Nov 2026
 22:37:55 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261018175457.87803-1-ojeda@kernel.org>
In-Reply-To: <20261018175457.87803-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Nov 2026 07:37:43 +0100
X-Gm-Features: Aa3M54p7eBlg9yL8nKjCRYF_cKn6fvAcKLXbakSS16n9mf6XS8H5ekFNr6S-Wr4
Message-ID: <CANiq72mrpgxyb4d9C5p1KS0n87GmYTXcyUX+dhZ39T2vRtOQwA@mail.gmail.com>
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

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel
