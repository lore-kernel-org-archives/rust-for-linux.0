Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC051DF736
	for <rust-for-linux@vger.kernel.org>; Thu, 20 Aug 2026 06:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208586; cv=none; b=ip8zlp1E6RbDrQJYp8uR2uEDglH99CYDXE+lxtY0USiQoEg8XbUCgJ1BZUJsW620e0Y183Zs9yCu8J1rgPaMKZ6H+jZ29BXK5x6tO554r4KxyDOU+kp/gsCxQtUYlNvAYFdPj8uVzelfM2DvxidG8devtIDVKV3HD11wfFr8vw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208586; c=relaxed/simple;
	bh=67QlTCNqHAMiKhenPiXBZCQN30712Re984lC/sJZm4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzJb6AOhRVsHzqu1ISDHuPC94tpAeADlYY4GNvNeh5xj08T7iQhk6y+BhOWE1463dA6zQkILnyegznoG7Wr1EXnIbnC8tOv8iD/6nkJC7HGsb348VRBQ4IAzkx8lQ6Vxxb6XduHXeT9ELcjsc3520IkQGSsQ2vA2tN+hFOAzj5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtDWe30Q; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtDWe30Q"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38deea72eebso1952021a91.1
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Aug 2026 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787208584; x=1787813384; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kRc1eSHVwu1q1qbvgzDIPRU3EZV0cBSELC6VRfYKDj0=;
        b=XtDWe30Qr7XwHeuWO+9938QNU0sPNrpd9T0rTHco856W2bxsdI50WFOuptr0m9eUoZ
         rRbSgEMCoROadZNftnseIJyN/MnPA7vQ+htX53aQ1bW3D1D05uKASgRe5VvbZP0yX6Qz
         w2BMUA3UfbLSrycr7aWfd2eiAxQFKMcBRwAKmuWaxLFo/KurLg/mor2KoB35ozkqC1pp
         C0tHyhNAiA/GkFAplcHRc7SV9QaTkd3Pqltmmb7k2xHRQta4A5M2Sh3SdAbpbb1Yt5WE
         Zf3oAngjV/Dq4zayCbgLqGkX7rKmcAIfMa3DVZDwJmGgDFZXQid1cRnxIQPNqCUAXfL3
         L8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787208584; x=1787813384;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kRc1eSHVwu1q1qbvgzDIPRU3EZV0cBSELC6VRfYKDj0=;
        b=YNSz4vm89In3lMCOHZ+xTcQ157iUpzwt1trvNfrxjIKXi/48JsuMww4PusuXZNGfVA
         qR4b3iE0jy4wwXwN2koSkkuhX3VLrtaKTEh/cmBDd4hlpGVSWXcGTtUJAVpC/wJzu+qs
         Im3ErvxrycuhvwjzSd7BsHFJH8CfYW2mqHI/0STN8CX3DDwmUZ/LVBjy3EU6vxZ+cin8
         /OnHz++4AzIKxFNzoFAoAD4MzohI8FrtWcGvaIVzBLVygf/RY3AHhatcnNJxJGuaBbxy
         dCznixhzRVJNf2ANrt+1mbmELr9M+jFuEJk/cstlcSrAXyvZ0stb7Gl9a3WGHq7EJn85
         A7hg==
X-Forwarded-Encrypted: i=1; AHgh+Roptx3iNCEJQAGI/IGJdQcxBkAKS2523mWwJRZyBog+FF/a5KGmf7efvATR9dXxi50QSEhPuLvlRd5HQSM6lA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpjzRdi7dAaNptOuBzEkos9vUc/RhUI8NOTpeYWRI0flNk3RP0
	OqPXW50ft52tT/S29m0YI/unhjyEf1rzP0RrxNqwI06+AELpcpGqx8Eo
X-Gm-Gg: AR+sD13jGcVWMRl7ZDCA/635X1tHFKs/bCoBci/mnUVewH51pds7otv0UI9ytow5IP0
	DURecNuCvb1V2KxdN3rdw3f2JMRaQJCYqtmsR1cC3Z7SAGJJOFKan4tcU4HS6PFnde0YIKxxctP
	GSNQLb7eUw8lRF4fwTF5tyFHkKhySinp5oykl2QEpv/MgAmaDmzvZv17IS+/xDvWhdRJZ/B7Br+
	jq5IJMwJt+GIXbPm9gGG5VvXEqGhuJZM1z+GlNbrNdGYVr869EqEHKdCdZFEAlmUyb6tagyo1O+
	zwgkcXAkiZBIIyEqZeOpFx9fA8PlxRRBt0cvi1vf6JMHHYo902wktz2ZFZ9EDAUczxo30qPn/H4
	kx10Yc0ZfJSAnM90VfryTvKeUeLx7Ex2BlAf5yWawRZVpxHskNTfsI9gdYjXkaY7K4HTBAuLT97
	4H2uCw+Ll7SfnEu1Huc4keAkdHSmlcqeCLy4c2rrquW9r5fOGBhiXzl6jwVneUQDm1aYmfrzkYj
	0Pj9DmmuTSvfgcwLamzTlICQtZ7X3uY
X-Received: by 2002:a17:90b:4e8f:b0:38e:bfe:81e9 with SMTP id 98e67ed59e1d1-39580a80a58mr18755677a91.1.1787208584359;
        Wed, 19 Aug 2026 23:49:44 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb3069csm6696864a91.15.2026.08.19.23.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 23:49:43 -0700 (PDT)
Date: Thu, 20 Aug 2026 12:19:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, thuth@redhat.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aoahpef37-7EaTrY@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260819084825.969116-1-mkchauras@gmail.com>
 <4c5b2ab5-83f8-4ee7-bb02-3046ed01fd84@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c5b2ab5-83f8-4ee7-bb02-3046ed01fd84@kernel.org>

On Wed, Aug 19, 2026 at 01:50:43PM +0200, Christophe Leroy (CS GROUP) wrote:
> 
> 
> Le 19/08/2026 à 10:48, Mukesh Kumar Chaurasiya (IBM) a écrit :
> > The Rust kernel infrastructure generates inline asm for WARN() via
> > ARCH_WARN_ASM(file, line, flags, size), expanding it through a C
> > preprocessor pass (generated_arch_warn_asm.rs.S) to produce an
> > arch-specific asm template string for use in Rust's core::arch macros.
> > 
> > powerpc currently lacks ARCH_WARN_ASM and ARCH_WARN_REACHABLE, causing
> > Rust builds to fail on powerpc.
> > 
> > Refactor _EMIT_BUG_ENTRY to accept explicit (file, line, flags) string
> > arguments rather than relying on positional asm operand references
> > (%0, %1, %2, %3). This allows the macro to be composed as a plain
> > string concatenation, which is required for ARCH_WARN_ASM where no asm
> > operand context exists.
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
> > Suggested-by: FUJITA Tomonori <tomo@flapping.org>
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
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
> 
> Sorry, I still don't understand. The only place the new macro is used is a
> .S file (namely rust/kernel/generated_arch_warn_asm.rs.S), and the change
> this patch implements is inside a #if !__ASSEMBLER__.
> 
> What am I missing ?
> 
> Christophe

Hey Christophe,

The code calling ARCH_WARN_ASM is a .rs.S file that goes through the C
preprocessor as part of the Rust build machinery.

The intended mechanism is essentially

generated_arch_warn_asm.rs.S
          |
          v
         CPP
          |
          | includes <linux/bug.h>
          |
          v
ARCH_WARN_ASM(...) gets expanded
          |
          v
Rust source containing the generated assembly string

The patch therefore needs ARCH_WARN_ASM in the non-__ASSEMBLER__ section,
because that section is where the macros intended for C preprocessing
are defined.

The thing is .rs.S is not using ARCH_WARN_ASM as an assembler-time macro,
it is using the C preprocessor to expand ARCH_WARN_ASM before the
Rust/assembly processing stage.

This is my understanding of things, if i am wrong somewhere maybe
someone can clarify.

Regards,
Mukesh


[...]
