Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4E8175A6B;
	Thu, 24 Sep 2026 12:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254564; cv=none; b=NN1dS6UmMy3bl0gPY01reSPVnLQesgRV2gTzQe2cOW436OIkEkB6rtN8AWbSY9ckc7PMhWYBcIdO2f/1mF9t24DllVeWYnRSDpcntaywAQCPKGauQSY7E1ethySnlPCZteSQ9FLQ+hETpMRWUzZDahQRVZTBXVleX7rpBhMm3HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254564; c=relaxed/simple;
	bh=87bhEHeWGKWPBP62oXsPYEyQTEnRyhvNdRjqb56DU2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVb/YhQDtmbe8RiMbN+2+jV2lfZJ/TdmnU+6IpFaHUvACTvWQHUvL1lsGZilY1JZCmNL5lk9QnBWg3EM26CPw4jOFGB7BT+50HxyGJjmF9mjmYQTrgAxLwThvj5pEuEFYPIiExgZGiPJosdxxDeGWVpUK8fN+es0koXtWoiiCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n8ME2WW1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n8ME2WW1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631041F000FF;
	Thu, 24 Sep 2026 12:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790254562;
	bh=hReg+YrKi6p88LgT45UuedITnL9D2a8DFEpWy5aKpeY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=n8ME2WW1zA4ClZSOdimLs6EYQOSgZwEzRkaX0FzZpd5/HTBczwP4XebXykdZjtjpd
	 R9VcB3hqGRcDo3af4xflbtjiegQE8H3z0thD8yPsJkat4rfyPCymFrGrqhe0Co/ay6
	 nT1bbebP7cete3pbfmR+8Kf2m5CAoeQLtmeufa3FF0mjJ4/JBCa2kNYGU3cBZHtgFA
	 llxdfAFJdq7Tt+kHP1+/V9V8pl9gRtbQJXKkFuMjONZ5zHI8UAmsZDNxrS1YB4d+vT
	 osgzjqgtD8FHYFWZblBrEntTbC5DlZP4PhZJSFKgz2VAVEzs4dpjW57BuIKsWKsUhR
	 Pfswdo+YZtyAQ==
Message-ID: <c91d9441-27ce-4fdd-b3c7-10b972f867af@kernel.org>
Date: Thu, 24 Sep 2026 14:55:55 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 ritesh.list@gmail.com, sshegde@linux.ibm.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 linkmauve@linkmauve.fr, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <tomo@flapping.org>
References: <20260922054311.906816-1-mkchauras@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260922054311.906816-1-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 22/09/2026 à 07:43, Mukesh Kumar Chaurasiya (IBM) a écrit :
> The Rust kernel infrastructure generates inline asm for WARN() via
> ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> arch-specific asm template string for use in Rust's core::arch macros.
> 
> powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> Rust builds to fail on powerpc with

I'm a bit puzzled by the macro name. The name ARCH_WARN_ASM suggests 
that it is used for warnings like WARN() and/or WARN_ON(). Which means 
it should include flags BUGFLAG_WARNING and BUGFLAG_TAINT(TAINT_WARN).

Also I have the feeling that it only handles WARN().
WARN_ON() seems to have been forgotten.

Christophe

> ```
> error: no rules expected `ARCH_WARN_ASM`
>     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_warn_asm.rs:1:28
>      |
>    1 | ::kernel::concat_literals!(ARCH_WARN_ASM("{file}", "{line}", "{flags}", "{size}"))
>      |                            ^^^^^^^^^^^^^ no rules expected this token in macro call
>      |
>     ::: ../rust/kernel/lib.rs:279:1
>      |
> 279 | macro_rules! concat_literals {
>      | ---------------------------- when calling this macro
>      |
>      = note: while trying to match sequence start
> 
> error: no rules expected `ARCH_WARN_REACHABLE`
>     --> /home/linkmauve/dev/linux/wii/rust/kernel/generated_arch_reachable_asm.rs:1:28
>      |
>    1 | ::kernel::concat_literals!(ARCH_WARN_REACHABLE)
>      |                            ^^^^^^^^^^^^^^^^^^^ no rules expected this token in macro call
>      |
>     ::: ../rust/kernel/lib.rs:279:1
>      |
> 279 | macro_rules! concat_literals {
>      | ---------------------------- when calling this macro
>      |
>      = note: while trying to match sequence start
> 
> error: aborting due to 2 previous errors
> ```
> 
> To add ARCH_WARN_ASM, _EMIT_BUG_ENTRY first needs to be refactored.
> The old definition was a bare macro with no parameters, relying on
> positional asm operand references (%0-%3), hardcoding the backward
> reference to local label 1b, and including .org/.previous directives
> inline. That made it impossible to compose as a plain string outside of
> an asm operand context, and left an invisible contract that callers must
> always emit their trap at label 1:.
> 
> Refactor _EMIT_BUG_ENTRY to take explicit (bug_entry, trap, file, line, flags)
> string arguments via string concatenation. This removes the dependency
> on asm operand numbering and makes the labels an explicit argument,
> so the caller's intent is visible at the call site and a future caller
> using a different label cannot silently produce a wrong bug table entry.
> 
> Move the .org and .previous directives out of _EMIT_BUG_ENTRY and into
> each call site, so BUG_ENTRY() can still pass sizeof(struct bug_entry)
> as an asm operand while ARCH_WARN_ASM can supply its own size string
> independently.
> 
> Add ARCH_WARN_REACHABLE as an empty define, matching the arm64
> convention, indicating that no additional reachability annotation is
> needed after a WARN on powerpc.
> 
> Reported-by: FUJITA Tomonori <tomo@flapping.org>
> Closes: https://lore.kernel.org/all/anG67Q6Y59kDqh-c@desktop
> Fixes: 73b741adb264 ("rust: Add PowerPC support")
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> ---
> Changelog:
> V5 -> V6:
>   - Dropped KUit tests from this series. It will be sent separately.
> V5: https://lore.kernel.org/all/20260915090453.1227034-1-mkchauras@gmail.com/
> 
> V4 -> V5:
>   - Fixed a build error with DEBUG_BUGVERBOSE=n
>   - Added a label for bug entry
> V4: https://lore.kernel.org/all/20260912065902.24017-1-mkchauras@gmail.com/
> 
> V3 -> V4:
>   - Fix Label with appending b at end
>   - Add KUnit test patch
>   - Tested on ppc64le pseries: pass:5 fail:0 skip:0
>   - Tested on ppc32 QEMU mac99 G4: pass:5 fail:0 skip:0
>   - Tested on ppc64le QEMU pseries: pass:5 fail:0 skip:0
> V3: https://lore.kernel.org/all/20260910100801.2159785-2-mkchauras@gmail.com
> 
> V2 -> V3:
>   - Add label argument in _EMIT_BUG_ENTRY
> V2: https://lore.kernel.org/all/20260910071252.1950488-2-mkchauras@gmail.com
> 
> V1 -> V2:
>   - commit message now has error, fixes tag and closes tag
> V1: https://lore.kernel.org/all/20260819084825.969116-1-mkchauras@gmail.com
> 
>   arch/powerpc/include/asm/bug.h | 46 ++++++++++++++++++----------------
>   1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 0db48977c70c..bf31ee1e902a 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -32,34 +32,38 @@
>   #endif /* verbose */
>   
>   #else /* !__ASSEMBLER__ */
> -/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
> -   sizeof(struct bug_entry), respectively */
>   #ifdef CONFIG_DEBUG_BUGVERBOSE
> -#define _EMIT_BUG_ENTRY				\
> -	".section __bug_table,\"aw\"\n"		\
> -	"2:	.4byte 1b - .\n"		\
> -	"	.4byte %0 - .\n"		\
> -	"	.short %1, %2\n"		\
> -	".org 2b+%3\n"				\
> -	".previous\n"
> +#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
> +	".section __bug_table,\"aw\"\n"				\
> +	#bug_entry ":	.4byte " #trap " - .\n"			\
> +	"		.4byte " file " - .\n"			\
> +	"		.short " line ", " flags "\n"
>   #else
> -#define _EMIT_BUG_ENTRY				\
> -	".section __bug_table,\"aw\"\n"		\
> -	"2:	.4byte 1b - .\n"		\
> -	"	.short %2\n"			\
> -	".org 2b+%3\n"				\
> -	".previous\n"
> +#define _EMIT_BUG_ENTRY(bug_entry, trap, file, line, flags)	\
> +	".section __bug_table,\"aw\"\n"				\
> +	#bug_entry ":	.4byte " #trap " - .\n"			\
> +	"		.short " flags "\n"
>   #endif
>   
> -#define BUG_ENTRY(cond_str, insn, flags, ...)		\
> -	__asm__ __volatile__(				\
> -		"1:	" insn "\n"			\
> -		_EMIT_BUG_ENTRY				\
> +#define BUG_ENTRY(cond_str, insn, flags, ...)			\
> +	__asm__ __volatile__(					\
> +		"1:	" insn "\n"				\
> +		_EMIT_BUG_ENTRY(2, 1b, "%0", "%1", "%2")	\
> +		".org 2b+%3\n"					\
> +		".previous\n"					\
>   		: : "i" (WARN_CONDITION_STR(cond_str) __FILE__), "i" (__LINE__),	\
> -		  "i" (flags),				\
> -		  "i" (sizeof(struct bug_entry)),	\
> +		  "i" (flags),					\
> +		  "i" (sizeof(struct bug_entry)),		\
>   		  ##__VA_ARGS__)
>   
> +#define ARCH_WARN_ASM(file, line, flags, size)			\
> +		"1:	twi 31, 0, 0\n"				\
> +		_EMIT_BUG_ENTRY(2, 1b, file, line, flags)	\
> +		".org 2b+" size "\n"				\
> +		".previous\n"
> +
> +#define ARCH_WARN_REACHABLE
> +
>   /*
>    * BUG_ON() and WARN_ON() do their best to cooperate with compile-time
>    * optimisations. However depending on the complexity of the condition

