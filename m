Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B142443A9E
	for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 07:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790320039; cv=none; b=kR70PZl4ZMlTc/C7U/YyqKGk/KMniHThE95wJ+C/tNk2KlfoonJJt9v+z6WKKe8okIi0nLa+ohCm/l2yTTSdkREqjY7gprBMq922GWHKbeF/MpFBEHk3MJ+mnpNxvk6vgNoJuLZu3CfkDg3NHx8u+u8YD/fsLJrQSI+htn9Mfo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790320039; c=relaxed/simple;
	bh=vEKdETvCiIJXmAPikrApYzxDElX/8OCENfApSyIQtRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFynmjarQ2XhvaJuDZyRmlnflqIoYxGm781fUHwzligsDfOjs7RpEggV185jlIFtbQ0I01he8mt5P59KHw9PDnVW6GZd8CbjpziUxxBHbxkbVw3lVVm8Gl9XEWweoXAyFz3WOlW5cw1l9wnKNVNA1P0Lu+SwHTbY/AoTzCLk3nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3/rN1xB; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3/rN1xB"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33b9e805130so347072eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 25 Sep 2026 00:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790320034; x=1790924834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JaEAeO+KpKKY3qs5B15P5jzMNjkhf9IQUFD5AfYaJCM=;
        b=s3/rN1xBFUsrdbbaWLznQEcPs3oia00zK8Ro4Ai3o+u8nbyJVnTDSVXhQFUpPGDfEn
         GbL3nV433k3eehDZnwUBEfOoTS1OOrcOijYYg9vljpFSPgux1akQApT3jW8frjt0PKAk
         v3ydakZRR6OoHBkUKJTjMhXk/ExWiJSuYpm3W7LzzI842erHe/JDrAu/yLYoCehXRaex
         kzn9H5vHos0SDSUz6HwWIUhXUzat6ozV+ZECiIDWp3RDlPVmucHdnGhWLOtyYjdE11/n
         8DvzkMfl9F70s9tBCAl+j+OPXxkvEUtyGFjkipTer8fbyLBHzf5JTJGX/q2R4uzY03RU
         JsRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790320034; x=1790924834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JaEAeO+KpKKY3qs5B15P5jzMNjkhf9IQUFD5AfYaJCM=;
        b=TlDYWmlWm4K1uT+9HSoyk7cweAApQTnlMhGtww1Xybev5VDlJhr6COHOPJO3zboHJp
         oaSb7sE4862JRux49ak/6vFqCnIn/++O5NbHAsMBtRvdetNxuzmBC1652Ukuq0p9CB7y
         jYxgetuGRKHn1OhRnm/K/9HT1dLAe0gQWQxB9wRN3SWIjrG+DRO/4OEU1trDIMj+JwHl
         VUQqgmmUY+/TsJ+f+BMLmf5zSg9AsK6mzbm34x5n1Fy2ZZ51q/lXIThUzp2STTgLZXiT
         r5cm8lKGYnR5hW8Svydi6/yM6hs760JT/HEC76wHCtOHDAtDPX05aSxsSq0k7LgRlZWO
         qogg==
X-Forwarded-Encrypted: i=1; AKwUvBx6Ya7O+aB+/spWkhpHF+n2P1Oe2oHChA38spaF7BH/4O4M9mhlA0vPHjYoQGcwoaHtfpU4SlLN5w+DiYeKYQ==@vger.kernel.org
X-Gm-Message-State: AFuF++m0j93tr6e4ZLNyoM9wGqdGbiJgCOQs7Oi0Wc+U2sKlf5OvhT7C
	N3OeWHaXteXWZsQSIe7lSPq14xA9M8crjB/04HzK+biGIwqrvhAMslCB
X-Gm-Gg: AYBFou2WsCYOjD+lHrnanq2KvuL7dfwwxNrwrIswHDg5ulcVyOZKFMRUaIKtZPAwzOT
	yGhWg4iGPzG6/VRkKeGudvJk2MPh2W7FT3SU/VjFIujzd5JD2WCQM+S83n+SjrgE98pk24Z26TH
	Ps3v/TSH+DRKFibzo51eJScGYM0nktk9gLyIS+Dy/Up2/uFXThmasMAPdtJ6O/PLSsiR90AwE4e
	jUxH7kHUmjHGmkHvhHBz0el6ZaIn9yYuAvMhwH4L8kfhRW/wwf3r3cYKQPtndNUioTD4mvPPMDZ
	GhqbbxpE83gSaaskv+rxEm+7sXKamXWfzI13/fgnNIxRVYH9y8JrP6L9SdNrKPDftS6Tg4I/SWG
	v27fkXPkt12hXw9OX+qSsyv/JE8FrKDsk+ah7MTACITO68yIQQKcW3if5EXjlWUJOJiwdmp8XdG
	J5sxPGae6cRp3e9D+kUCcSBAxKzbzXAtGFfelYlKx1L317rj7Jl5kOOaDEGeCwIfqS215kiPDIH
	5arp2AZirizrT8iZcNDjquXTfsYKstFGI2nhOuJfgaE
X-Received: by 2002:a05:693c:42d4:b0:33b:e47c:f384 with SMTP id 5a478bee46e88-34004f81e77mr3753409eec.18.1790320029935;
        Fri, 25 Sep 2026 00:07:09 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3414407c548sm4116769eec.8.2026.09.25.00.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:07:09 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:36:59 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	ritesh.list@gmail.com, sshegde@linux.ibm.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V6] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <arYcMdA3Zn10Xbr1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054311.906816-1-mkchauras@gmail.com>
 <c91d9441-27ce-4fdd-b3c7-10b972f867af@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c91d9441-27ce-4fdd-b3c7-10b972f867af@kernel.org>

On Thu, Sep 24, 2026 at 02:55:55PM +0200, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 22/09/2026 à 07:43, Mukesh Kumar Chaurasiya (IBM) a écrit :
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > 
> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc with
> 
> I'm a bit puzzled by the macro name. The name ARCH_WARN_ASM suggests that it
> is used for warnings like WARN() and/or WARN_ON(). Which means it should
> include flags BUGFLAG_WARNING and BUGFLAG_TAINT(TAINT_WARN).
> 
ARCH_WARN_ASM is a raw asm template used by the Rust warn infrastructure
(rust/kernel/bug.rs). It does not bake in BUGFLAG_WARNING or
BUGFLAG_TAINT(TAINT_WARN) — the caller (warn_flags! macro) is responsible
for ORing those into 'flags' before expanding this macro. This matches
the x86 convention where _BUG_FLAGS_ASM is also flags-agnostic.

> Also I have the feeling that it only handles WARN().
> WARN_ON() seems to have been forgotten.
> 
I might be wrong here but WARN_ON uses an unconditional trap and
requires a register operand in C side. I am not sure if rust can do
that.
> Christophe
> 

Regards,
Mukesh


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
> > To add ARCH_WARN_ASM, _EMIT_BUG_ENTRY first needs to be refactored.
> > The old definition was a bare macro with no parameters, relying on
> > positional asm operand references (%0-%3), hardcoding the backward
> > reference to local label 1b, and including .org/.previous directives
> > inline. That made it impossible to compose as a plain string outside of
> > an asm operand context, and left an invisible contract that callers must
> > always emit their trap at label 1:.
> > 
> > Refactor _EMIT_BUG_ENTRY to take explicit (bug_entry, trap, file, line, flags)
> > string arguments via string concatenation. This removes the dependency
> > on asm operand numbering and makes the labels an explicit argument,
> > so the caller's intent is visible at the call site and a future caller
> > using a different label cannot silently produce a wrong bug table entry.
> > 
> > Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
> > each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
> > as an asm operand while ARCH_WARN_ASM can supply its own size string
> > independently.
> > 
> > Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
> > convention, indicating that no additional reachability annotation is
> > needed after a WARN on powerpc.
> > 
> > Reported-by: FUJITA Tomonori <tomo@flapping.org>
> > Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
> > Fixes: 73b741adb264 ("rust: Add PowerPC support")
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> > Changelog:
> > V5 -> V6:
> >   - Dropped KUit tests from this series. It will be sent separately.
> > V5: https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/
> > 
> > V4 -> V5:
> >   - Fixed a build error with DEBUG_BUGVERBOSE=n
> >   - Added a label for bug entry
> > V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/
> > 
> > V3 -> V4:
> >   - Fix Label with appending b at end
> >   - Add KUnit test patch
> >   - Tested on ppc64le pseries: pass:5 fail:0 skip:0
> >   - Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0
> >   - Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0
> > V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com
> > 
> > V2 -> V3:
> >   - Add label argument in _EMIT_BUG_ENTRY
> > V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com
> > 
> > V1 -> V2:
> >   - commit message now has error, fixes tag and closes tag
> > V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com
> > 
> >   arch/powerpc/include/asm/bug.h | 46 ++++++++++++++++++----------------
> >   1 file changed, 25 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> > index 0db48977c70c..bf31ee1e902a 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >   #endif /* verbose */
> >   #else /* !__ASSEMBLER__ */
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >   #ifdef CONFIG_DEBUG_BUGVERBOSE
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.4byte %0 - .\n"		\
> > -	"	.short %1, %2\n"		\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"				\
> > +	#bug_entry ":	.4byte " #trap " - .\n"			\
> > +	"		.4byte " file " - .\n"			\
> > +	"		.short " line ", " flags "\n"
> >   #else
> > -#define _EMIT_BUG_ENTRY				\
> > -	".section __bug_table,\"aw\"\n"		\
> > -	"2:	.4byte 1b - .\n"		\
> > -	"	.short %2\n"			\
> > -	".org 2b+%3\n"				\
> > -	".previous\n"
> > +#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"				\
> > +	#bug_entry ":	.4byte " #trap " - .\n"			\
> > +	"		.short " flags "\n"
> >   #endif
> > -#define BUG_ENTRY(cond_str, insn, flags, ...)		\
> > -	__asm__ __volatile__(				\
> > -		"1:	" insn "\n"			\
> > -		_EMIT_BUG_ENTRY				\
> > +#define BUG_ENTRY(cond_str, insn, flags, ...)			\
> > +	__asm__ __volatile__(					\
> > +		"1:	" insn "\n"				\
> > +		_EMIT_BUG_ENTRY(2, 1b, "%0", "%1", "%2")	\
> > +		".org 2b+%3\n"					\
> > +		".previous\n"					\
> >   		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> > -		  "i" (flags),				\
> > -		  "i" (sizeof(struct bug_entry)),	\
> > +		  "i" (flags),					\
> > +		  "i" (sizeof(struct bug_entry)),		\
> >   		  ##__VA_ARGS__)
> > +#define ARCH_WARN_ASM(file, line, flags, size)			\
> > +		"1:	twi 31, 0, 0\n"				\
> > +		_EMIT_BUG_ENTRY(2, 1b, file, line, flags)	\
> > +		".org 2b+" size "\n"				\
> > +		".previous\n"
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >   /*
> >    * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
> >    * optimisations. However depending on the complexity of the condition
> 
