Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242748;
	b=VkawIl50A7tMBQidB5B7SD96xObcLQ5yXMvNwo88VuLbD5VCKqsadViJkJApXCyo6ATv
	 lmjTCiY+Hgpxbk+upJVUjDwGMsfg998aYr7XccYep3r8BrCSWg54wDdVB4Kc4eSjBp1y8
	 aezn79slO5zzka9z/Xv49RWFhwLCqlACHXFCXCiB4VPWD/ftM2zR4YVwp/kqxhhh327zf
	 HwAcu2+OdTTeVZ+TX4hm3vGy/VXgAE2yaPkDVDLjI/6wim3J52QL2UDIx3bvDg9r0IYnp
	 opxQvtsCDLMzUjQD6uNeXLgrfOnezyJ8Wcqqrcy7zLMGp1UZnDsS4ubEOcv8hiXDTow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
	b=5LV1NKtLuA/0BRQ66LorgNgulXHzzG6cXjHuQarSjkn4nPQ+w8juQoc3mKn4UN7AdvI8
	 k4r5y85GTqCRdEUX7sdgC18bUeZxTlz7VhaMRcgUImj4IKhDWgxAQQ1xSy40RHJYSYuUQ
	 Q4rl/0NXH6h7jqn1A8oKAnHJfv7dA7wRty31hVXRTK0sPmxyyFq1j50c8YhvGwEWcX1dG
	 LHZZKK45rmD0XVoVDLu+KwrnwXk3redlJ0be1q5xGhJrTm+cGULaZOhmI7YPw71pedQMA
	 Ce9DkCLDsk3CUATj5oto4VTBDOpqXIAViBrk6LEwIf7FYBFZ7OOgaBCFXffGiQNmRqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IVc4xmHR;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C660A2605
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 16:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981C660A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=IVc4xmHR
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e09aa5264so671334f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 08:45:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794242746; x=1794847546; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
        b=IVc4xmHRUI7l0d1aI01B1bf0TgxhgAWqtMAsztsXJDiGo9QYkOa5VcjnsqiEUEW094
         +obdWRcpaN+j/B14EgCb1KFG4LUdRJV+GvcaWubRrOtQazg82Ix3i4nQYf/jMIEHX2tU
         ObAWnI3isjfiH/yuAvxeUlSdxCVgZvZqsNiqWudHZdY1CeA0GDvuzZKyEo07VSJB5Ahb
         AkgMpN2gR8U3WlRYJOmZsZme0ERrSqL4LiPSZuS2JprQ1rmSLrAT4/GHrebv/GqHlMzY
         v6V4vdWFB2UPahEWWeEq02QTnTWgioPULqgClxAVoK/PJ41XSdFU191pmOOCiiUzrCYI
         QHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794242746; x=1794847546;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KaxLEDS88ItrKwFFpF3PUgaqHFKPv05h6XZaeYQUHW0=;
        b=2Fn1kDYmFlhGxgDrsRJ23SqNGLLXq/+sTHjZDRqQan/yAHEiROVav5OVvGcjy6c7u1
         3QaEe7JkJwdPz1paIVf/6h1T7OFaix/XDYJm3lTZ+/S09V0feYzksrE8vgCwfz+EwfIX
         Q1jjRDC+x6ON7BARQy07scs1Y5vATaCN+3Ehc6mbev9kdw0A1Xk2HT/ohtVpWKCSYQQO
         htl2bz5+AY7VgKWF0OLe3k7nQIj9XajLaG/PI09jjPfy76VMDA+l2Hd98zsADnw7XTR0
         u6BBFwE+NJxzW8UyClStWYluhF0utwe7ZGyS4S3+eYAbF2hyKuOqG8J/6WSCSjCTOfkl
         5KQw==
X-Forwarded-Encrypted: i=1; AL+hErHlE0PQj65XGqEPNJtwE35EENr943+IzRk690B9NdS9J01Wx3Txq8y/O/040N5NJf5GtO/JoLXPGA7vHrLxkg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+xLSUpPBz7RgjtFghmlt08auiW1yG0wp6fjlytPMwqzTwY1/kW
	vZo3A0iVLlS4fzMilQEvKtij9O/EkJZ70wpoJmvOOve0hg2t3bUmsY8/OPc0Jbv4WmI=
X-Gm-Gg: AYBFou2O+WlwBP1GIQu4nWeU/A+kWqA/Rebo4Fe+EX7/w+4m0yJPaTBp0ThaJmXyGO+
	cEz7wtOPoUCkZOy2qZo6XdtWyrM0lGMJ3ka7si7ZnXBjnb1DmhpkMT44jklVsfnFM97aULTssLr
	mi5TcmK6xS0aQRhc4K09GGzvKQnUw3EOaZBCE2GoeAOgM0wKIdCJgOHQOaIN5so+Pw+G1aQtvoZ
	shJenWRwnth13OMdFRevh0lLI1zKYg/76r/FPTjPZaFjUhyzKe5+Y/FVLzdRBoPgUsLqHh1HFt2
	h+truRDjqtQmBOE0QX9O9wYcjaNUeQdhl5L38/Qa3JAzypEMQFCA135OKqUPpit5H1R0fye+SN0
	jYvE7lVSzH+Q8D5eQe7M0qpUNNec0uLvNSIpHQ8BxR0EnD4wAQ5ysJCCbWrBwIdGIdnAXc7M+Or
	dsvuEGqYmGQ/Deu5yt5WbjM1xkZ4ren6F1CttoZMfpduqXghGaO+0UnISxBfcPBjEZtyYwOu481
	YpfPrPSVVcNa7nyJ7z6iWDX0pWFBzk8o4Y+tv595OAR3IbQFdVnT3OVGasktsfjrgKZLbU9SAqc
	y72iqCgxGQA87PuEEFvcVy7U7IyQW4FXY0YB5bZGCP3MmMDZSrTdwVUFgvhR4jov
X-Received: by 2002:a05:6000:2389:b0:491:8462:20cc with SMTP id ffacd0b85a97d-49830d8186fmr7425f8f.37.1794242745831;
        Mon, 09 Nov 2026 08:45:45 -0800 (PST)
Received: from ?IPV6:2a07:de40:8100:0:89a9:fd0e:583d:4a53? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597187162sm11283249f8f.34.2026.11.09.08.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 08:45:45 -0800 (PST)
Message-ID: <b5abb55f-202d-458b-ba6d-92af16f80137@suse.com>
Date: Mon, 9 Nov 2026 17:45:44 +0100
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/11] modpost: emit module descriptors as assembly
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20261104-build-speedup-v5-0-0f6018be8dae@kernel.org>
 <20261104-build-speedup-v5-4-0f6018be8dae@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20261104-build-speedup-v5-4-0f6018be8dae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 7:20 PM, Lorenzo Stoakes (ARM) wrote:
> modpost generates a descriptor for every module in the form of a
> <module>.mod.c file with .modinfo strings, the __this_module descriptor,
> exported symbol tables and (with CONFIG_MODVERSIONS set), the CRC of
> imported symbols.
> 
> These files are compiled like any other kernel C file with all of the
> -include preamble, as well as including linux/module.h, header dependencies
> generated by fixdep of a few hundred headers, an objtool run and if LTO is
> being performed, a link is performed to generate native code.
> 
> On an x86-64 allmodconfig build 11,189 *.mod.c files are built, each
> taking ~0.24s of CPU time to compile, and module finalisation as a whole
> 6,300 CPU seconds, or 64 seconds of wall time when run over 128 threads.
> 
> It also generates ~1.3 GiB of *.mod.o.cmd files that every subsequent build
> has to read back.
> 
> Avoid all this by emitting the descriptors as assembly instead.
> 
> The layout required (size and alignment of struct module, struct
> modversion_info, the module's name offsets, init, and exit fields and
> whether the architecture uses PREL32 ksymtab references) can all be derived
> from scripts/mod/module-offsets.h.
> 
> The fields of __this_module are emitted in offset order rather than
> declaration order, as CONFIG_RANDSTRUCT shuffles struct module so the name,
> init and exit fields can land anywhere.
> 
> An assembly file avoids all of the issues previously mentioned so this
> conversion results in a very significant performance win on kernel build.
> 
> As a consequence of this change, since module-offsets.c includes
> linux/module.h, scripts/mod is now built after the generated headers in
> prepare0, rather than before.
> 
> Also update .gitignore and make clean to handle .mod.S files, but keep
> .mod.c files there to ensure that users do not end up with untracked
> changes/dirty trees after the change takes effect.
> 
> The sections were confirmed to be byte-for-byte identical to the C version
> produced - each of .modinfo, .gnu.linkonce.this_module, __ksymtab*,
> __ksymtab_strings, __kcrctab*, __kflagstab*, __versions,
> __version_ext_crcs, __version_ext_names and their relocations - for all
> 8,135 modules of a clang allmodconfig build with CONFIG_COMPILE_TEST off
> and CONFIG_MODVERSIONS, CONFIG_EXTENDED_MODVERSIONS and
> CONFIG_MODULE_SRCVERSION_ALL on, and for a sample built with gcc.
> 
> What differs is what the compiler added around them: the __UNIQUE_ID_*
> locals, the KASAN constructor for the .mod.c globals, and on x86 a
> .note.gnu.property that the linker already drops from any module containing
> an assembly file and the loader never reads.
> 
> None of these have any impact on the build, however.
> 
> The assembly carries no debug information, so in order to keep describing
> __this_module in each module's debug information, define it weakly in
> module-common.c too, in a section which the module link discards.
> 
> Nothing initialises struct module::arch from C any more, so
> MODULE_ARCH_INIT is removed from include/linux/module.h and from m68k, the
> only architecture that defined it.
> 
> x86_64 kernels built with gcc and clang, with CONFIG_MODVERSIONS,
> CONFIG_EXTENDED_MODVERSIONS and CONFIG_MODULE_SRCVERSION_ALL, were booted,
> every module and an external one loaded and unloaded, and the srcversions
> checked against modinfo, i386 and arm64 defconfigs (gcc and clang) and a
> ThinLTO build were also built as part of testing.
> 
> An x86_64 CONFIG_RANDSTRUCT_FULL build with clang, which places the name
> field after init and exit, was checked the same way and produces the same
> .gnu.linkonce.this_module sections and relocations as the C version.
> 
> On the x86_64 allmodconfig with clang 22, "make modules" with every
> *.mod.o and *.ko deleted goes from 64.5s (6,306 CPU-s) to 28.5s (518
> CPU-s).
> 
> A consequence of this change is that the make jobs are now so small that
> make cannot dispatch them quick enough, however the next commit in the
> series addresses this issue.
> 
> This impacts clean and no-op builds with a large number of modules most
> noticeably.
> 
> Whole build, 128-thread Threadripper 9980X, best of N runs:
> 
>                                          before   after     delta
>                                          -------------------------------
>   x86 allmodconfig, no-op make, gcc        12.7s     2.3s    -10.4s (-82%)
>   x86 allmodconfig, no-op make, clang      13.9s     2.8s    -11.2s (-80%)
>   x86 allmodconfig, clean, gcc            342.6s   306.6s    -36.0s (-11%)
>   x86 allmodconfig, clean, clang          340.1s   290.2s    -49.8s (-15%)
> 
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

Looks ok to me from a modules perspective.

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

> +/* The equivalent of KSYMTAB_FUNC()/KSYMTAB_DATA() and SYMBOL_FLAGS(). */
> +static void add_asm_ksymtab(struct buffer *buf, const struct symbol *sym)
> +{
> +	const char *name = sym->name;
> +
> +	/* The name and namespace strings the entry refers to. */
> +	buf_printf(buf, "\t.section \"__ksymtab_strings\",\"aMS\",%%progbits,1\n");
> +	buf_printf(buf, "__kstrtab_%s:\n", name);
> +	buf_asciz(buf, name);
> +	buf_printf(buf, "__kstrtabns_%s:\n", name);
> +	buf_asciz(buf, sym->namespace);
> +	buf_printf(buf, "\t.previous\n");
> +
> +	buf_printf(buf, "\t.section \"___ksymtab+%s\", \"a\"\n", name);
> +	buf_printf(buf, "\t.balign %d\n", KSYM_ALIGN);
> +	buf_printf(buf, "__ksymtab_%s:\n", name);
> +	add_asm_ksym_ref(buf, sym->is_func ? MOD_FUNC_PREFIX : "", name);
> +	add_asm_ksym_ref(buf, "__kstrtab_", name);
> +	add_asm_ksym_ref(buf, "__kstrtabns_", name);
> +	buf_printf(buf, "\t.previous\n");
> +
> +	buf_printf(buf, "\t.section \"___kflagstab+%s\", \"a\"\n", name);
> +	buf_printf(buf, "__flags_%s:\n", name);
> +	buf_printf(buf, "\t.byte 0x%02x\n", get_symbol_flags(sym));
> +	buf_printf(buf, "\t.previous\n");
> +}
> +
> +/* The equivalent of SYMBOL_CRC(). */
> +static void add_asm_crc(struct buffer *buf, const struct symbol *sym)
> +{
> +	buf_printf(buf, "\t.section \"___kcrctab+%s\",\"a\"\n", sym->name);
> +	buf_printf(buf, "\t.balign 4\n");
> +	buf_printf(buf, "__crc_%s:\n", sym->name);
> +	buf_printf(buf, "\t.long 0x%08x\n", sym->crc);
> +	buf_printf(buf, "\t.previous\n");

Nit: add_asm_ksymtab() and add_asm_crc() emit unnecessarily .previous
directives.

-- 
Thanks,
Petr
