Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B4B26E719;
	Thu,  5 Feb 2026 08:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770278988; cv=none; b=BiCWk8olbCP8uICIjPF5PflOBpM4AjlgOnDkUmlXGlaNkO7hs8BIJs/EkeH/bkkiSyIi+VE1f/6ta7LwuTtLB4gHnjGXeTZC81wgzItorkIHnFoLDyGbowU7eCQsujTMNBvcF9Xz6ZBD775usIphPFSC1RgYEphloF2eCkC+38M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770278988; c=relaxed/simple;
	bh=Gk1rpoOJ3qlMNhZI4HdytNI08bOgFElC6mEKS/IYXNY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WhZdTHzZpz22jg2/5K4jN1pxtbQAbXmVy1Y1KhSqR0/M9EGIhpezAcrWgW1KHqv9jOyD6auK+uYu3EGusIkRFkPJLCi+xyE7/edf2k3+foA9M4V30asWpyaFC3XX4jI871evj4QDVylAn4AbnA80Ll4tpTcqyGnByl7HpZ7FJiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pB2e8MNX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pB2e8MNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33374C4CEF7;
	Thu,  5 Feb 2026 08:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770278987;
	bh=Gk1rpoOJ3qlMNhZI4HdytNI08bOgFElC6mEKS/IYXNY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pB2e8MNXaRPUmdj792704a5mCJ0O/XIcY+O/2uRB8F5ajnD4PcWkA5KMzKdeEv6lr
	 1uUJN8R989oRBO7EdhPbQ6DY7ClEQcXN6BH40hSFaFL34sfY2LJiOslN+vusKxUq5M
	 7AinykT94Vuh8f1ztqhVGOk6b3g7bai93vDS+1Fii6v1Eooi66xu05r+3tGuW9REsC
	 HHy6KSI7JjgIhhbLQNpDPf/rhBrUvbebMayFanIA0pa7w2sSqk3ka0qoG7MqSLq2O7
	 1TNzuHjjOsM9ii53boG+MXTyhUyTTv1CEpljC4vj5gNuGBrgBzqfZnfe1x8M1yTlje
	 VRvEXr3Tb4PMQ==
Message-ID: <306b01a2-caba-4c15-89d4-849c3f4848cb@kernel.org>
Date: Thu, 5 Feb 2026 09:09:41 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 1/3] powerpc/jump_label: adjust inline asm to be
 consistent
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dakr@kernel.org, corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, peterz@infradead.org, jpoimboe@kernel.org,
 jbaron@akamai.com, rostedt@goodmis.org, ardb@kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260204210125.613350-1-mkchauras@gmail.com>
 <20260204210125.613350-2-mkchauras@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260204210125.613350-2-mkchauras@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 04/02/2026 à 22:01, Mukesh Kumar Chaurasiya (IBM) a écrit :
> [Vous ne recevez pas souvent de courriers de mkchauras@gmail.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> Added support for a new macro ARCH_STATIC_BRANCH_ASM in powerpc
> to avoid duplication of inline asm between C and Rust. This is
> inline with commit aecaf181651c '("jump_label: adjust inline asm to be consistent")'
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>

> ---
>   arch/powerpc/include/asm/jump_label.h | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/jump_label.h b/arch/powerpc/include/asm/jump_label.h
> index d4eaba459a0e..a6b211502bfe 100644
> --- a/arch/powerpc/include/asm/jump_label.h
> +++ b/arch/powerpc/include/asm/jump_label.h
> @@ -15,14 +15,20 @@
>   #define JUMP_ENTRY_TYPE                stringify_in_c(FTR_ENTRY_LONG)
>   #define JUMP_LABEL_NOP_SIZE    4
> 
> +#define JUMP_TABLE_ENTRY(key, label)                   \
> +       ".pushsection __jump_table,  \"aw\"     \n\t"   \
> +       ".long 1b - ., " label " - .            \n\t"   \
> +       JUMP_ENTRY_TYPE key " - .               \n\t"   \
> +       ".popsection                            \n\t"
> +
> +#define ARCH_STATIC_BRANCH_ASM(key, label)             \
> +       "1:     nop                             \n\t"   \
> +       JUMP_TABLE_ENTRY(key,label)
> +
>   static __always_inline bool arch_static_branch(struct static_key *key, bool branch)
>   {
> -       asm goto("1:\n\t"
> -                "nop # arch_static_branch\n\t"
> -                ".pushsection __jump_table,  \"aw\"\n\t"
> -                ".long 1b - ., %l[l_yes] - .\n\t"
> -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -                ".popsection \n\t"
> +       asm goto(
> +                ARCH_STATIC_BRANCH_ASM("%c0", "%l[l_yes]")
>                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>          return false;
> @@ -34,10 +40,7 @@ static __always_inline bool arch_static_branch_jump(struct static_key *key, bool
>   {
>          asm goto("1:\n\t"
>                   "b %l[l_yes] # arch_static_branch_jump\n\t"
> -                ".pushsection __jump_table,  \"aw\"\n\t"
> -                ".long 1b - ., %l[l_yes] - .\n\t"
> -                JUMP_ENTRY_TYPE "%c0 - .\n\t"
> -                ".popsection \n\t"
> +                JUMP_TABLE_ENTRY("%c0", "%l[l_yes]")
>                   : :  "i" (&((char *)key)[branch]) : : l_yes);
> 
>          return false;
> --
> 2.52.0
> 

