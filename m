Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1515F3DEFFB
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Oct 2026 06:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046122; cv=none; b=LyA6n1LAThxXrtRoYPJKvd8AjiWvpk+G7cmtzdzi1514WBJRWgjFt5EwT2sg82ATvC3nS5I7oVsHpcsJDGQPTGi/SSolulg2+gbMO7HT+wQDaOx6M9WgROovnAnJmFosdZlpsvm7VtlUJvChIkDvLMKO1IrS9Bz0TS839MlyZ4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046122; c=relaxed/simple;
	bh=5gGuecIY+TLFfIeYkg3QtFYvZvWee+P39tBBX5ycQ9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IE15UvsgmI9usVIYtnrwhIZyvg4Fztszp5P5Ve6bj0+jYaeMrPetSX9SS6lvzEDKsrZA/ffIDtO520tRqiXjbOxsUuMhZDZuEKa0gIhp/RaEAcf1rq6JNtfVmp1kMsFErStL8ATQMbGFiC4oZGmtapgnULpZaKq3tRdoKbI88Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/mFodfp; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/mFodfp"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac77270fbfso841805a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Oct 2026 23:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792046119; x=1792650919; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vx7M7s3SuZxFkSx1BxbOLI08ri7SD/5H0oyHxOOrQc0=;
        b=l/mFodfpUEMG49Kf+Ky6UXNb+/3BmM6VOVJ5+grmzHNCtS/fu6BF49xSeYBQgQ00Mv
         kO5/9xVhuuyrT43GNqeh6xfrF/Ddoldoqw+To3rY52VTcSLm5mhNy99T8vFFsZCPndQw
         +9se9cJlC7t+C7oimCwaOkckdhtDg9nLVckyVSxMjQi5KCgjmXJymKn0XFw3a5nbLwhY
         OEK1r/ZiSp/vjZXGHLMNy20I8EhHSSZDc/mCavnf2+p3yKsF3DXVQDN5vS5ORUo8TX9q
         7admvfpSUBBG1IuhTLRcMN2QT5xQQ7irOcYV6wgJl4MVstoEDxnxZAgVo8TOkrQOQkjE
         1roA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792046119; x=1792650919;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vx7M7s3SuZxFkSx1BxbOLI08ri7SD/5H0oyHxOOrQc0=;
        b=b0+U9H9MIuGfTY+pcQ74+N87X3SblmSEO7mNUNnCNi5/SxlPlsF2Bf3HN4t8LSOmX7
         CD4sa65y/uCZ6GS95fOdUddQU77wmDz2RFSnXoyYKgh6hrvdPhjR7Cd7FUWBtq2ep5qk
         YhlNiRETMPOcLfNpG5X8GYJbVei4WHfQiBTALTjwswqTrurL1Z9FO4k5UArW7QiC/Z9G
         GirXZi4LaYYBQSgDb30DO9s04xWaLQxZLDFjaNLJ9iTtdk4TWWRKyE53sBKePEqgWQHp
         HamiUCyX3x4AxkTZ9R9G2TyWmewJu2HOIlENvx56RHJHt9GxZCHmliKygCCsViyR1a8S
         3PjA==
X-Forwarded-Encrypted: i=1; AKwUvBwa9AOn1sI5k9Cb6Qxd9qY8NuMaw3clHsfRCnzkfjcxLQ5loroYilyLGUztxhk562wSbCYdBgQde9jEvxQTog==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHcR8qzRJjxcQDrkszZp9erGOd8Yjab6FFedfsln6E17AGTfjr
	jP8eQc/sNxU1XaJ538a5g05WW76nyZR4A7MeXR519QM6ycjX61h7RqoK
X-Gm-Gg: AYBFou0I6XSzqY9xq1eHX316Oetp3IHdj9fqFC40oLCmSG9scfq+GZo7l5y+GGCk5ui
	RQzfqTf4jPf+MkcWhSRuP5Qx656yrsnoVWwnIC1LETGkLWupWdFJU796G4Ij6XY7qE+IbmAa9dG
	qil9845ODYrn3fIk381fRg3gx8Nb+xFjaIYYQkYVbY8yN8TJyChB5NROvYFmWnf1t+md8FKP5bn
	eguWlCrhoLAUrr7rf50JU1pKnMw9bPwRyKXJncZf/Lhf1ls2U+OHt89M3TWSDfXUZq+57+20P/g
	2QXIORdkvoLJwgdN/qsaSJ0iCKMgHTZk4TRLxyBHNMYpYPzN+KTi4D641z9mtKvAnZdwNeTZUeS
	80xi3Y0hIoa+X0KflEP2sjeeuDYUOOL4ZZt98sPw/yT4aBiZor3DnFLc0aGDh7KAOjMRPlqsDiu
	kD2rkO/WY0N1UqUhkMBMzDbiyjJnj64ZbPKmS8V3d7KtWklDSuKMTBQRVHDOCkQfouEzFXAM92D
	MuQk4X7EeTKKVAeMcfrVHH9qXYsj0H+2QC7SOg173k=
X-Received: by 2002:a17:90b:384a:b0:39e:6a81:c923 with SMTP id 98e67ed59e1d1-3ab3a90a112mr13973663a91.22.1792046118994;
        Wed, 14 Oct 2026 23:35:18 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac943e755bsm2856756a91.2.2026.10.14.23.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 23:35:18 -0700 (PDT)
Date: Thu, 15 Oct 2026 12:05:07 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	daniel.almeida@collabora.com, tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V6] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <atBzxk9JFdXKYHfN@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260922054311.906816-1-mkchauras@gmail.com>
 <as08wgiYOGOx5Jzo@desktop>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <as08wgiYOGOx5Jzo@desktop>

On Mon, Oct 12, 2026 at 10:02:10PM +0200, Link Mauve wrote:
> Hi,
> 
> With 7.3 close to release, and this patch still not merged, the kernel
> will still fail to build with CONFIG_RUST=y on PowerPC.
> 
> Should the Rust support for this architecture get disabled as an
> emergency measure before 7.3?  Should this patch get in instead?  Should
> we ignore the issue as not many people will use this architecture
> anyway?  Is there another solution I’m not seeing?
> 
> Sorry I haven’t made it known sooner, I was busy with things.
> 
> As an aside, this patch does fix building Rust drivers for a Wii, so it
> gets my:
> Tested-by: Link Mauve <linkmauve@linkmauve.fr>
> 
Hey Link,

This is in line for 7.4.

Regards,
Mukesh
> On Tue, Sep 22, 2026 at 11:13:11AM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > 
> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc with
> > ```
> > error: no rules expected `ARCH_WARN_ASM`
> >    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
> >     |
> >   1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
> >     |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
> >     |
> >    ::: ../rust/kernel/lib.rs:279:1
> >     |
> > 279 | macro_rules! concat_literals {
> >     | ---------------------------- when calling this macro
> >     |
> >     = note: while trying to match sequence start
> > 
> > error: no rules expected `ARCH_WARN_REACHABLE`
> >    --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
> >     |
> >   1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
> >     |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
> >     |
> >    ::: ../rust/kernel/lib.rs:279:1
> >     |
> > 279 | macro_rules! concat_literals {
> >     | ---------------------------- when calling this macro
> >     |
> >     = note: while trying to match sequence start
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
> >  - Dropped KUit tests from this series. It will be sent separately.
> > V5: https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/
> > 
> > V4 -> V5:
> >  - Fixed a build error with DEBUG_BUGVERBOSE=n
> >  - Added a label for bug entry
> > V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/
> > 
> > V3 -> V4:
> >  - Fix Label with appending b at end
> >  - Add KUnit test patch
> >  - Tested on ppc64le pseries: pass:5 fail:0 skip:0
> >  - Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0
> >  - Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0
> > V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com
> > 
> > V2 -> V3:
> >  - Add label argument in _EMIT_BUG_ENTRY
> > V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com
> > 
> > V1 -> V2:
> >  - commit message now has error, fixes tag and closes tag
> > V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com
> > 
> >  arch/powerpc/include/asm/bug.h | 46 ++++++++++++++++++----------------
> >  1 file changed, 25 insertions(+), 21 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> > index 0db48977c70c..bf31ee1e902a 100644
> > --- a/arch/powerpc/include/asm/bug.h
> > +++ b/arch/powerpc/include/asm/bug.h
> > @@ -32,34 +32,38 @@
> >  #endif /* verbose */
> >  
> >  #else /* !__ASSEMBLER__ */
> > -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> > -   sizeof(struct bug_entry), respectively */
> >  #ifdef CONFIG_DEBUG_BUGVERBOSE
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
> >  #else
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
> >  #endif
> >  
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
> >  		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> > -		  "i" (flags),				\
> > -		  "i" (sizeof(struct bug_entry)),	\
> > +		  "i" (flags),					\
> > +		  "i" (sizeof(struct bug_entry)),		\
> >  		  ##__VA_ARGS__)
> >  
> > +#define ARCH_WARN_ASM(file, line, flags, size)			\
> > +		"1:	twi 31, 0, 0\n"				\
> > +		_EMIT_BUG_ENTRY(2, 1b, file, line, flags)	\
> > +		".org 2b+" size "\n"				\
> > +		".previous\n"
> > +
> > +#define ARCH_WARN_REACHABLE
> > +
> >  /*
> >   * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
> >   * optimisations. However depending on the complexity of the condition
> > -- 
> > 2.55.0
> > 
> 
> -- 
> Link Mauve
