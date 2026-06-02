Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D42374721
	for <rust-for-linux@vger.kernel.org>; Tue,  2 Jun 2026 07:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780384567; cv=none; b=kEMtxcYaOw2H3StV+4LiLoqxowwQEU55nMtH43kLutoz0RayqO+TbbTCoRaqq0h6FnkpwHCAzjCF5Cbpf9CqNjelftPlXsadgu5xr/GnKePMuo80+F52SaJzUBmh3R3eOWD3DXjI84uafuS++Jgn/XIaXv0SBwk6ssJXx8gQ/3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780384567; c=relaxed/simple;
	bh=NcxbZhoJuwI2oRvDEpq2snWYy2SZI6F9jCQ5SNiw2rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XD8hO2vcFr2+LRHi5PDbeVdktvgUvb19vYSOtpv1k9OrC+BT6bIaIQr1/WLWbrmLbBm7dcoHMByPWx36bhhupRFIqU2iv4n+jY25HulLsr2fzIvf+HlpTk55ggSoIkTgbpUQf98Hn2r5lhdisN+Ki+EzmhdMlsyhNXIJoQqhNl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EqKGiZG9; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EqKGiZG9"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36d98c9b596so1452157a91.3
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Jun 2026 00:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780384566; x=1780989366; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+tr7lju0eN0VwcHqpO/c52DT9rHJ2kZQnj1NlP5AASY=;
        b=EqKGiZG9pwjO2vHNuCmjyJ9RhBTKQxoz+oVAw+Hd2lnWojSfINfX1LojBVYrmxFn/L
         JbcB7Y1AkuYr50+yrf7+7blL71iHA1+QCsMeJGov1EjrIYhSoTU7e71G96SS0iUE8uQK
         mg+4TVW6ZKYrexyNDuqeYGfNEI9pL6BRm4sRYiJIW6twTv9ku3btEQSL4ZYIHizHeylo
         GseVWC/iMqkSiyyumZAbJfDy8d6GcoC1vOwy5Bv+p7ugW4RPlTHGu/yrOiAQaBX22v4Q
         14LJpPbwootnOMnU77lZKlzHJa7tdO2MjkM2hYO8wtSxRsULc0gXfCBq1S4yx72X5sGK
         TrOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780384566; x=1780989366;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+tr7lju0eN0VwcHqpO/c52DT9rHJ2kZQnj1NlP5AASY=;
        b=anmhbnLntstyjGaGdojUUc+kUK24z5ykahy1ZaDJu6Sf5VoB7BP/itssvvilcf9LbU
         X1XTWJ6DzbTJqnGr2bwTsVRmFgupJbhCiEzfHfpsbnTAFDdW2UkeiHlUnRqwMIxLMq6p
         iZhA/DdV14O8SrNw3ZoOnF0oxVBYvmPOoUUDuLJXHhQfupjvCCMc4JRoXKmap6L4MSlu
         XZMWQnVKPHOuWGuQsDGy02puK6Flry0BAT8Uwluuj0OkrCDpUeaCB6mEtt4w2asesRk+
         om5TCqwn8Z/FHyI7MXwzqwmT32BOXjJqMSVlRR/YmTyqpkmL1L/IqYUNmBGBY+I0F+NM
         e9bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+kHuVI6TVVmODLJ9w9E4Inu1JLbE2uq/ItSCLOFjgdnqswmMmNkq/KPVhcZm99mhD2ThDKEvt/s2p2b1wVbg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUHTY8/UnDNxZjVPRI8gGStVJ3Eig/ps39bGNBfam71G5+hK+6
	zQ1iZX/W39k0fCtd85mS7lG/XfbBIixuJ+dZoAbDsVpg+xkfxZxe6au1
X-Gm-Gg: Acq92OFq68khQHH5PcsA/LK62+nDcye+AFgIYy/GG7NuWyyWtu67D5ivtdcIMN2kX27
	wu19urFiXFo0fVWWHp/F4z8YF2ZcHvFk92qbAwre3U/ru2SGl7Ot+CnCfDtbBLT28Wms/UTP6wY
	XObmmtmg7yX9CIu2gGFcjgSOLHXDGbDdAWWDksbNfghjTNhjVFwQwT+3ZXwEsswAwyWoy16+L4U
	Gk0Rlbxmz/lsEXLQE/lduR/5yyQBivgdnSaXB1Gzo2wBoeyrq97VEYQW0nrwcBjiizxDTWNu35W
	5HxwhGDzB9wl7mTwULCVb8PHofRgslYxYyYKDkDu113JT4uvwaxPMx6rnHbhmbZ0k4BzLWZlOOo
	OXyjCsq0ECfR7hJzFkK/KKBmrqufZNxMDEGyq+e94BM+c29cBwM5S4BGX8VDAt+GGK2UeFbBIjl
	q8B4rOczbAEJabWJRIL2LWigDkyGmRf+hmFcNCNVZtZV2fXY+PR1jk0eycqhOxQMZI+kd2V+r2j
	mQxbQ==
X-Received: by 2002:a17:90a:c2cc:b0:368:147f:bd2b with SMTP id 98e67ed59e1d1-36c5020a69fmr13824981a91.23.1780384565532;
        Tue, 02 Jun 2026 00:16:05 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd98797fesm1680774a91.13.2026.06.02.00.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 00:16:05 -0700 (PDT)
Date: Tue, 2 Jun 2026 12:45:33 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, daniel.almeida@collabora.com, acourbot@nvidia.com, 
	fujita.tomonori@gmail.com, gregkh@linuxfoundation.org, prafulrai522@gmail.com, 
	tamird@kernel.org, kees@kernel.org, lyude@redhat.com, airlied@gmail.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH V16 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ah6CsIo3N09q0Kj9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260520064630.1785283-1-mkchauras@gmail.com>
 <20260520064630.1785283-5-mkchauras@gmail.com>
 <CANiq72nPOMkZXpMpwTLFg4xjFfmyf_O_x2FN_nrNBsxeNu178Q@mail.gmail.com>
 <ahVb4k-2rC4EYZF9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DITEZRMNTOX2.1DKO9U58508S8@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DITEZRMNTOX2.1DKO9U58508S8@garyguo.net>

On Wed, May 27, 2026 at 12:15:39PM +0100, Gary Guo wrote:
> On Tue May 26, 2026 at 9:52 AM BST, Mukesh Kumar Chaurasiya wrote:
> > On Mon, May 25, 2026 at 08:16:53PM +0200, Miguel Ojeda wrote:
> >> On Wed, May 20, 2026 at 8:48 AM Mukesh Kumar Chaurasiya (IBM)
> >> <mkchauras@gmail.com> wrote:
> >> >
> >> > Minimum `rustc` version required for powerpc is 1.95 as some critical
> >> > features required for compiling rust code for kernel are not there.
> >> 
> >> Which critical features?
> > Hey Miguel,
> >
> > Right now i can only think of inline asm. I can rerun the whole thing
> > with 1.85 and figure out the issues with 1.85. I'll get back on this.
> >
> >>
> >> > For example Stable inline asm support which got merged in 1.95.
> >> 
> >> It is not needed that the support is stable, but rather that
> >> everything you may need works.
> >> 
> > I wanted inline asm be stable, I was skeptical about inline asm to be
> > unstable and potentially messing up the whole system. That's the reason
> > I waited for the stable support to get merged before sending out this
> > patch series.
> 
> AFAIK inline asm is only unstable for archs for their surface syntax (i.e. name
> of register and classes). The rest is just LLVM inline asm. If there're codegen
> issues, you should gate on LLVM version instead (Rust supports multiple LLVM
> versions in a single release and distro may use different LLVM than rustup's).
> 
> Best,
> Gary
Hey Gary,

Sry about delayed response.
I'll check if the codegen has any issues. If yes we'll put a guard on
that. Meanwhile i'll also test out the 1.85 for any other issues. Thanks
for the help.

Regards,
Mukesh
