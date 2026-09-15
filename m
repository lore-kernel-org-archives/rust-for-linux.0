Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AF342AF8D
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Sep 2026 06:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453229; cv=none; b=nH8+hacyzeSA/HACaObWuBd7AjiQdNs0d5OTrDfBj0yo2ZdcvJuv+EzciJFF5bzb4rnQwzQoFcG4M2dN6Z5fFSP/QOUJ50Bc8pBrwveDh4VHPF4rvGDGppnmaDw/d0qoJI9d4aXFtiRpAf/DbC/gpZJn2B5WsJdGa56B2cfBdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453229; c=relaxed/simple;
	bh=wH+dFeWC6vXKEEbfhidfrbJMkAyAxzT8WWn3pPANH18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t14IsTx1ng8bzx3yPZVQOC9nQmPVwylbQzTWKfe8QtDxzjbzxUxfAGD/yEu+r6VpHPeGZWpqOcvjw88ljxYIijq2DvlTeluFnu77EPhQbCXJP9g2lBmrTeE6LSZ3zvwrpz2/pmpvQylHtiZe/w2AA3pdrw3PTOfqfsFTRTQsZEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0oeJQJW; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0oeJQJW"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so4014314a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Sep 2026 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453228; x=1790058028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=R0oeJQJWpD1lhz5KWL2O/cZdWJGyRc1HZR+Vy2FMasMkGvM3aSlOoWlfu1UYfDh0hs
         ac09C1mn/9A2kOaTzWa7HxsOE12UKj9j9elWUbBFj/wq8wQ8Eh7AQebg9MDzNFq3HGEI
         TAKfpHXPLiEbof77ysiPjeOtK1oHZ1JVp046fV0dNXxo1+kaNC2/SlrFct+t6Fi9Zeqv
         Nq96S8MsyY0zyJjiNBf4Yj8YFll429oqTMxtmqwPZIc1CUt4CivLo95ernq4U3tO9gAc
         j9ni5c/TLUNndMU9R5NiA0x8MX7lu0wIfyrkSeppjLS34wu2G1cca1E9dJVs7SMWxoBU
         jvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453228; x=1790058028;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvj/QENaps3fa980Av3u1jYrzQua2MT1zXpRDbfcu0U=;
        b=aBPWuz7NfEXnWg5hPfmWOUGIkwnKbDQMNB5bESd/gQAsPp7sA/HtEhtkSEesU9k/SP
         MNhTybaBJmdgyG/23KHuCOb2+hB1UcI3Qrx0mTESSHoFLc+y0CN3oVLvPTm4eOyloBCE
         L1X3TV0O/6PWWLkeiKzx5rHh6he19jiGg0CABe98G8W+jdCuy1MU6Cw+TyRlvPbglFcP
         flca31sWD1udONdnzS1d9Q5y6cISHhW2+P/fOL8/vRWHihobviXngHDh/9+MAos97eCp
         Af4g89Vp4nXMRhHisIJGGeXRMXZAjUAJchfRHT81aGGwfFfVIiSy2zL+Z0DB3oCrMKD6
         6oyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvN/23m6bsmVIX2pwuYGBIpgDfJOozG6zQKARKGsyv3zL129ub2cdD+DDBlSOBjcfUzTw8JuEegb/XwvFCIg==@vger.kernel.org
X-Gm-Message-State: AFuF++lz6tlTYvRlUS7mm47UBi8UMHNotPoYzZ5K8Al/Bp1UhD1CP228
	2LVijBhEtWeZOBPIf3Z6tRxB4naI05520n112GmTzC77nK5UR11yq1Wn
X-Gm-Gg: AYBFou0nbvMDUXn1lXOgX4vKbjAmwzf5NeQT67VNqsfbCBem5kZtfyTNXUSEoxOAiQM
	8PxdCSVEH/gQBAZsluFV5jIxQtBoomZp9GEXp1L8vURBTmCZsfhv9+kCE7oV06ilFBQ2XhaEq+h
	cM9IiGEpT1ryKHkNqKnfwfWlfJt8T27U+E3k86TrvVndFQxwg4krDzmfi739LdtWwyme2wuKIBS
	9Dty2Tn2/PpfMor21Va3jbEeuYGGvwkdaQw38tpjVOq9j8j9EHm+HtbppqI5cf99xguXt+WCCfn
	PnEbaHGYmMBwJDMKyhJHX6gXiwZUMtp8QKKMfVhy67O1IY9ZQP117PG8ZjmhELE8rQc6mdnzjrw
	2DrfmJvq7kTl4hwWbzknMiDbQfPn9gckZgQeNCo/Rhp+xu1RcdFgvJFu2g+lfoxDuImjoXiFRc6
	r3a4WbTm8WVAUSPFosLe4AXtpKGk+LWoy4FxtBHqZloOvgHBn5QukfVKrZr4VRa0ndT3OeCqpBH
	xCBYl6u21zYqWl89REGyc99I0EXKzlZuYEy4TQeZps=
X-Received: by 2002:a17:90b:17d0:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-39debfa60f6mr11787559a91.6.1789453227707;
        Mon, 14 Sep 2026 23:20:27 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm3169047a91.10.2026.09.14.23.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:20:26 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:50:15 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, ynorov@nvidia.com, ecourtney@nvidia.com, 
	joelagnelf@nvidia.com, fujita.tomonori@gmail.com, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH v4 1/2] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqji0ILj4gkDnkry@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260912065902.24017-1-mkchauras@gmail.com>
 <20260912065902.24017-2-mkchauras@gmail.com>
 <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLDJ7TNEH9MS.2I386V2SZ5QDR@garyguo.net>

[...]
> From the current implementation it looks like making "1b" a parameter doesn't
> really help anything. The fact that it internally rely on `2:` as label is still
> hardcoded.
> 
> I think you should either make the label custom too, so you write
> 
>     "1:	twi 31, 0, 0\n"	\
>     _EMIT_BUG_ENTRY(2, 1b, file, line, flags) \
>     ".org 2b+" size "\n" \
> 
> Or you should just hardcode "2" and "1b" and document them.
> 
> This stucks in mid-way and is arguably worse than either option.
> 
> Best,
> Gary
> 
Hey Gary,

Yeah makes sense. Lemme refactor this with labels as an argument and
test it out. Thanks.

Regards,
Mukesh
[...]
