Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C56C38A73B
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Sep 2026 05:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103784; cv=none; b=IBWCMSjRMnYFfaH6NqRr4/6MFfFABDI0Du1cjWXK1Qs67u8AEPZKTZOyDu3Gh1JfGVG1UjsM42TWEewB2nCmhK14bUPclD4hDUY4h/C3KTVDod2D5vixXk1VqVs4MveTvkmIkWnQ/jLOrGrS/rvoa7qqquzGVDGVhfW5qRJ8zk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103784; c=relaxed/simple;
	bh=m2uyPzp+R3+sWOW8xYa+N/Car2zCoXVJYfU/R1QYc+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft6ngSwO0K60irJaodqDKxSI+v07LVTDu7DiJz9YiACxT+u+3Dnaix9q8BeCwdf38zogiR/TYMJnu9WtjbdjwdgoPPqH6iRJ+1hY9joyLx+R2ATM2SSaNRtUVYl1ENRmjxVHnbaKWtew78Or82SWQlrD0Jz0F9wcfEHi24iovyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSP9lae3; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSP9lae3"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso465203a12.3
        for <rust-for-linux@vger.kernel.org>; Thu, 10 Sep 2026 22:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789103782; x=1789708582; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JQ54+lD2n/aIXsWwyvLa1NXcPj36AMrVbfAkkYOl2fw=;
        b=fSP9lae3pplaMBlzvB9Lk0fi6l2gK1A1CbROx0lvrLtSXU5yzGCHz585uGiUtSX0qR
         ElMA+fefQ/bA2A09ENDv63FrS5zwqITJh79nMae7SiE38TZjk7SH6tLlMUIExY/zbvQZ
         y/ouRJ/FRsH2Lg/8vBWc9rlm7tcPsCzg8DgrHcxnRSq8PUQuSy0kSO7c4z2qNcc+XbHS
         CU3es571RWHwQd+WHVxIFzKJP3puGDE+YRWV57+cfB4AKuYMFsyD5A3tGhPpbR4BxB/b
         c6rBBQ42ujhYVQRhn/DEJ+sXkx6ID7V73LgbVeiP+UdBcxh5KbTisTX/YIM2rcp9osqt
         CD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103782; x=1789708582;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JQ54+lD2n/aIXsWwyvLa1NXcPj36AMrVbfAkkYOl2fw=;
        b=SuEtcyeGHcdNJzofV49Cb8S8jR8arFPaF/qff9bnUCeku1wr+Ei0iERd5qE1fTX+DD
         CVm7vs8a6tafpnBBCA3rF6DX80cRQ+FiEjMzDZ9Ce5lJnQ/Lf9U/1+9kXob+C9vFUIzU
         F3d0MXxr2RFZu6xkE2Mwoi8N8Eo52S5P+EbQKCxgLUFAW7zAh/0orxX4VYQJVwcvyJO/
         nMIADPTNIyRMr7HrDJBSm4xd7hpWtefnQ7WMWahbe2hRdwDpnd+LysF5x660rJpnFh0A
         uAHnkwkSAaf+dW+P+GFSUqCi4jkEkNJ9XUuxwZoyhqRSQePLRqsCoIx/BWPNTFCJnWng
         kSGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnbz2pq9TBTsMJoT04pGUblYKlJ0cSxXLftcD8eDxAjuqysr8/LVRytY037ZNEzowtSkLP3FiFOJJRufmyVA==@vger.kernel.org
X-Gm-Message-State: AFuF++kCD2Bd8wG1YlCYaGiqoeIkRDKUd4Qs480FjIWMd+IOvueajs/p
	QWzeM0/uXe+8oWf+JtHayK3WwskWg7nXSch3oYUPrN3VsHxuu1P8fuzZ
X-Gm-Gg: AYBFou169Jk+ZTcDT3UUvzE5VoVVwtoS2NXNt771Ror7cWr7XuF905/XIlsJPtfwn2J
	zVffWNI7Kk2NAgPD4koUbW6KhHeDT6lU2HDfheu8qhpIRA3jvAhpozxDt7aYX18En7WDv501Nni
	sT+JP958BWJl2d05WrR7zX0CWqJnfee3wFW1wnFiAhi5nee+CqIoRkq0zh82MXB/AmKc/am/q4/
	0wnZmAHxped//76gRVDiorZVdGNkBdhrk9dAijkQBnDVzAyuswRLs0WTn2lbn4mW4mc6UJ9u3x3
	xloK2VRy1pMuDZ6c+vVLEH0TFmXPyhRelz5wl3i+tLjHxwuOanaydpsusk9uXYqBljkhgVl6MH7
	MzH8xt2f7UIto/12PxMI7cIzqWwY7imHcDClxxUrYaNZorhZt+uqyyuYtU8Ufe0dbs0RUUnJMk6
	a5Y81f0zqd7An2824MeSb3hUJ4XTVG25JJnf76qUqdJgcrP649QnP0r4f3ID1Z/po9v/2oLH250
	Jqf//EtDMftweX8gBEgvQ4CtwKiyfOAoMaXf3b0TgKZ/WDW9iNWVEZB
X-Received: by 2002:a05:6a20:7347:b0:3d1:39e9:b269 with SMTP id adf61e73a8af0-3daed15388dmr4300321637.4.1789103782257;
        Thu, 10 Sep 2026 22:16:22 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.165.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed79absm3295201eec.17.2026.09.10.22.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 22:16:21 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:46:10 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, linkmauve@linkmauve.fr, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <tomo@flapping.org>
Subject: Re: [PATCH V3] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
Message-ID: <aqON9aluXdKk8nNq@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260910100801.2159785-2-mkchauras@gmail.com>
 <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLBMFNHCKSJ6.1I36FDVEACEUF@garyguo.net>

On Thu, Sep 10, 2026 at 01:05:27PM +0100, Gary Guo wrote:
> On Thu Sep 10, 2026 at 11:08 AM BST, Mukesh Kumar Chaurasiya (IBM) wrote:
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
> 
> I think we probably want to catch this earlier by have something like
> 
> #ifndef ARCH_WARN_ASM
> #error "ARCH_WARM_ASM is not defined"
> #endif
> 
> in generated_arch_warn_asm.rs.S.
> 
Hey Gary,

Sounds good.
[...]
> >
> >  arch/powerpc/include/asm/bug.h | 36 +++++++++++++++++++---------------
> >  1 file changed, 20 insertions(+), 16 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> > index 0db48977c70c..df2183c35945 100644
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
> > +#define _EMIT_BUG_ENTRY(label, file, line, flags)	\
> > +	".section __bug_table,\"aw\"\n"			\
> > +	"2:	.4byte " label "b - .\n"		\
> 
> "b" is part of the label. "1b" itself is a label and "1" is just an integer.
> 
> If the code uses
> 
>     _EMIT_BUG_ENTRY(..)
>     "1: ..."
> 
> then the correct label would be "1f".
> 
> Best,
> Gary
> 
Thanks, I missed that part.

Will fix it and send it out.

Regards,
Mukesh
> 
[...]
