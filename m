Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDB03B42FB
	for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031586; cv=none; b=YsTf1aWtPxT9oKWDyYVj4TO2PYhEqi2SOTw0u7w9e6lribgE92cfDrgIEOwEX/r/tCM3wKe1ZQMCh8dgtudTGW0sdhFVav0Z6KpH3V63qRLG04y4Rwx8xuvq3orFm74mnWsb3CJrNNjTl8SeWiTsAKqWt+/K1XSy8ZFIZ6kYY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031586; c=relaxed/simple;
	bh=cDfsE8IHyC52uAD/4z5EPkacs3O/hXTyhEglW45Cva0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sss6k6HdjqqHP++fyMo9H2OZz6pZ+yyWZuKJaGE105EpVO/Tk0lpfQagS96L2916+mo2CsSy2QvvwviZwruiGQLhajMx3SKsqEpVTzB0QGylOvcrisFlGB8CrPWk8kry25vb9zAGLdmD+7KiMHTbkuffsafGq8Qr00i00uvdQ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phxj046R; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phxj046R"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1ceb47d53so646757a12.0
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789031580; x=1789636380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x80sULQ0zZu1BIKAuLseVrEbYl+Sg0KA4OXi22FchTM=;
        b=phxj046RDed7ck9ETMtCGnxjXRXVuHXtPAk99osKdu9lOarCDFPCsvoQ2KJsnwfDSz
         9xuhOPyNMOGpog05Itqso69ZqcDDQj1JOAC5DPinu7ddTNvy0ZUwEB7OF6f0+ubyQHGB
         cDISy3KabRCb/KfPfUGPEauYulnduPhTofPPdDottTxO6AUPM6p9YHn0YAAjeZ0/K9aI
         N85ilndXs/vV47rBYBUYmHI/dHX7ie5wqUf/YxLxQArb8SX7vSjfmK6s6yUGFJzFO72J
         sdwiCgwlZVsn7t9gu4AYvBPzU1QcyYbF0MIwR7hJRQrCcvzGNP83B3Ouk2Rewz8qYrrw
         ksgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031580; x=1789636380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x80sULQ0zZu1BIKAuLseVrEbYl+Sg0KA4OXi22FchTM=;
        b=UeaZVivZ/F/cnLV8A6MA3UlYXSWyjtoIII+Uy56Xw8XiQwDyDDtAFvzK/UP3ttpIKN
         VG5RTzJP+U68FS8rpB9BnI1amPkql6ki2Ilb6mFfP6Pv+GDrCQ49jMSmNwgdVyMW6zi0
         q6KyQAhPwfs19zNFeTTIGnW2tOu4Si/grzKmGx72VI0rlma8RwcmKgD2ea4EAIz7JYwK
         6IW8NQ6/QhiitsbKI8A8DKlDShuHe+ZSro6F5JjyUVvHJVxTP2lXx2GH42DRLt4mMNES
         AxVU4bHF6lSW7NfIUaadPvBbeI16xT+xLsqLzc+KCi4UeVJXKXANAcNaMMT/1VRdQpTx
         w/4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxTvD9TfqubvIjYwrJJ872hdXdf1/ociryaiCBahMuNmYLW+2V7Elm4M+u8p0axnwurovIfJd0Ie2/u50IIKg==@vger.kernel.org
X-Gm-Message-State: AFuF++kP1OqlHVxK+XRFxHrA5hHAzn6niY4j3sup1suogA4qxqx2vR6b
	bdi6Z8f2e7vgkDGYQHtDvj82BVm98ROV+wBAYp1WBCvaAAiat5nCHrR2
X-Gm-Gg: AYBFou3lyGKsAAw4RTwmJ/qBtgMmC57x7FmxRSh0+WbArzWvpcIDlnggxEp3QPERbTL
	PsQaGA4lBhfpwP+dD+UpriNPc1to5g/rcngDKInNefcOBsZqPhbJqhrrSq/Qrsc324ebtJxSlL3
	s/K8mO28miMuoS1oyZWn9pa145FAaJnTOTtXAuIzu5/SD3UPtRgzbQVh9R42yDa/XZ9/uW5Sdey
	//05Sb90hiYIuH55tOW/Uuwzts8rmW9XVLP+1VZpxaAvb6GKOgvGhtbp5fzhuMMTjt3wjEIPVJO
	UcDoDQ5FS3rootniUKRVVFVJX7eDPV+eAdcp1kwEmNTRhD25pyfz6jksqpgdsq2PUg4INDSBCJZ
	V2DNLc21zBq5zz4K1/C9VZRIUumXclWv8rW3xmkCrShceMxry8QIj7hL9hnlwVE8gshVVbStam8
	lKyW71h2TkT6BWeqVopNT6NXRErht+NuH1zM7mzTg8ykqghgytVymgHLZ7VP/JjgTe/+3HCnMap
	/waIzmdmstE4hehRg15jBh+y8Kxb23hja8Ur9h8lqQ=
X-Received: by 2002:a17:90b:2b4f:b0:398:c6e8:3fc2 with SMTP id 98e67ed59e1d1-39d77a029c6mr3299345a91.4.1789031579674;
        Thu, 10 Sep 2026 02:12:59 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d7e82fa21sm3426201a91.9.2026.09.10.02.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:12:59 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:42:47 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V2] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqJ0QZYuft-VWrnW@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910071252.1950488-2-mkchauras@gmail.com>
 <0605f2ed-32a1-492d-850e-d1080007b4bc@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0605f2ed-32a1-492d-850e-d1080007b4bc@kernel.org>

On Thu, Sep 10, 2026 at 09:36:34AM +0200, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 10/09/2026 à 09:12, Mukesh Kumar Chaurasiya (IBM) a écrit :
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > 
> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc with
> > ```
> > error: no rules expected `ARCH_WARN_ASM`
> >     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >      |
> >    1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> >      |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
> >      |
> >     ::: ../rust/kernel/lib.rs:279:1
> >      |
> > 279 | macro_rules! concat_literals {
> >      | ---------------------------- when calling this macro
> >      |
> >      = note: while trying to match sequence start
> > 
> > error: no rules expected `ARCH_WARN_REACHABLE`
> >     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
> >      |
> >    1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
> >      |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
> >      |
> >     ::: ../rust/kernel/lib.rs:279:1
> >      |
> > 279 | macro_rules! concat_literals {
> >      | ---------------------------- when calling this macro
> >      |
> >      = note: while trying to match sequence start
> > 
> > error: aborting due to 2 previous errors
> > ```
> > 
> > Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
> > arguments rather than relying on positional asm operand references
> > (%0, %1, %2, %3). This allows the macro to be composed as a plain
> > string concatenation, which is required for ARCH_WARN_ASM where no asm
> > operand context exists.
> 
> For a cleaner _EMIT_BUG_ENTRY() macro, shouldn't it also pass the label
> where the trap sits as a macro argument instead of blindly relying on it
> being 1: ?
> 
> Christophe
> 
Hey Thanks for pointing it out.

Yeah the assuption to always use 1 shouldn't be there. It should come as
an argument. Will fix this and send out a new revision.

Regards,
Mukesh
> > 
> > Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
> > the BUG_ENTRY() call site to preserve existing behaviour while enabling
> > ARCH_WARN_ASM to supply its own size operand independently.
> > 
> > Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
> > convention, indicating that no additional reachability annotation is
> > needed after a WARN on powerpc.
> > 
> > This brings powerpc into line with x86, arm64, s390, and riscv, all of
> > which already define ARCH_WARN_ASM and ARCH_WARN_REACHABLE.
> > 
> > Reported-by: FUJITA Tomonori <tomo@flapping.org>
> > Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
> > Fixes: 73b741adb264 ("rust: Add PowerPC support")
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> > Changelog:
> > V1 -> V2:
> > - commit message now has error, fixes tag and closes tag
> > 
> >   arch/powerpc/include/asm/bug.h | 28 ++++++++++++++++------------
> >   1 file changed, 16 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> > index 0db48977c70c..8aba39e0cf26 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >   #endif /* verbose */
> >   #else /* !__ASSEMBLER__ */
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > +#define _EMIT_BUG_ENTRY(file, line, flags)	\
> >   	".section __bug_table,\"aw\"\n"		\
> >   	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +	"	.4byte " file " - .\n"		\
> > +	"	.short " line ", " flags "\n"
> >   #else
> > -#define _EMIT_BUG_ENTRY				\
> > +#define _EMIT_BUG_ENTRY(file, line, flags)	\
> >   	".section __bug_table,\"aw\"\n"		\
> >   	"2:	.4byte 1b - .\n"		\
> > -	"	.short %2\n"			\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +	"	.short " flags "\n"
> >   #endif
> >   #define BUG_ENTRY(cond_str, insn, flags, ...)		\
> >   	__asm__ __volatile__(				\
> >   		"1:	" insn "\n"			\
> > -		_EMIT_BUG_ENTRY				\
> > +		_EMIT_BUG_ENTRY("%0", "%1", "%2")	\
> > +		".org 2b+%3\n"				\
> > +		".previous\n"				\
> >   		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> >   		  "i" (flags),				\
> >   		  "i" (sizeof(struct bug_entry)),	\
> >   		  ##__VA_ARGS__)
> > +#define ARCH_WARN_ASM(file, line, flags, size)		\
> > +		"1:	twi 31, 0, 0\n"			\
> > +		_EMIT_BUG_ENTRY(file, line, flags)	\
> > +		".org 2b+" size "\n"			\
> > +		".previous\n"
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >   /*
> >    * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
> >    * optimisations. However depending on the complexity of the condition
> 
