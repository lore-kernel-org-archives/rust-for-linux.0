Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7F29D268
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 17:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793635; cv=none; b=pzZkEkN1pMU1Eeozdrf7hwv1rwImTdUCnxSp07p4dDo/VmPXJihutvQ8Z4Oa2eY6SO2gMT5cuXiesYPB6zts4Gg4huRqh/5Ydu1Q613M53FyJ4XbIlT1mv6u4Uh5BETFJgnfkeOn2cLnCMvZdULeQP3KKMDxmfT/koi3xGeIPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793635; c=relaxed/simple;
	bh=nOSHrva2nXHzqZqGu1/iH9kaKHFuQj9BTdYURkrJ2Ik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXUKn+6lVjPyn5OFF69k7ui7ytpzO79XzasgDbLQHw0O3JZQg9/IiOfpcrfYzzCJgK3hQlPFOyG4JMNKTElsMdglxHO5sLzf38sJD8r1ouVjh9+pev3uqknhNoW2N/xoglfX7p5iD23xbsQi+2fCRPkDBchzCh+/9he62mphMNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbcdnD0O; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbcdnD0O"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a9296b3926so26569735ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Apr 2026 10:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776793633; x=1777398433; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H/mDrKOFxxuG8D7mTy6jMBe8ODvCnPyqTfBHZNb5vVA=;
        b=WbcdnD0OL7449H/6AZuUuUEJahFHk46tywTSAFmA1IDY8QI+FrSU3ONZgRnDp4ALKf
         xKUqQoR6tzrO5mo1TeTMmOvs6DGwbmwjJituWG7kHPSTL0po/Ugy/qJh88vR6LVeA7LS
         /xZ+EuOwPlO8pDNfHATvSTI0hPgqywe4J5Mie6e6gbcJ6pC4xHJlEG84DnjqquTolknD
         jkQmxCToayklyghx6a02vFDDRHcn59dpOXurvh/GW+TJXIi+PjK2TdJ5ZtOy4ffFmaSy
         zDYGcyUUYVVbl1V05YWhiF7EOdSeHIYYa/hZMfj9xepLEHA9KT3maSYYSJGT/jWWkS58
         EK2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793633; x=1777398433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H/mDrKOFxxuG8D7mTy6jMBe8ODvCnPyqTfBHZNb5vVA=;
        b=OzqZMu08ssx1WHtvxiolPpOlzLa2+qaZSEGWeOr6RXHTVTnwb6PfHlY+J0rz1ktsIa
         SH1Y2lRJOHUF264rFa+uT3mSqUGCZ37TkW7R12UBGc6kCkm4SlzWcKw7Fg/Iz/NWPRdc
         FPXNGWPSKk6j5eF9CXV9x+N82rn6y8xbGxcz98+p827993Xm59Djn0b+O9aEmAcmY/B0
         o5M6AQYi7kNVygDd8G67oQtLhoJs0xwB7G/0r+di6zQNi0Qpfgqb6bxoog/6DM8/M+nw
         YKTFvq5vpZb19SaK6G1gMbLn3oLs57BAV78EmPeKigzlztC0078phHgH0XmFV5kGX86i
         doOg==
X-Forwarded-Encrypted: i=1; AFNElJ82wUFy0LtzEARQ54OywsjhNmcmKnNxTUnqCFyUtUXDN0xzMs9lGeEp7BhTFOVXGHlVohM0YqleEAMHVjXAiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwmKvx3yh4T8qtr4VvVt5P08l9dJSSSYvcdoh+nZbPAXYkCQszn
	pXNAduGHJGpSzf+jIX9Q+oZcpEQOsWB6zPJj2u7pkrlY0++6WvQMKhUV
X-Gm-Gg: AeBDiet1gQ+YByYekeuVOhUnNkivpIZ6555UkPzOn0CLa30ViXW5+3XRHC7m3X4Rmj+
	yXJY0U4OqWUktoZruOL2wOeUACwVb4WnTkdOZywHf6SRQ2+IYT50hFsZVeC/Mujzdss3uqi5VDh
	Lr5sD3fb46pvC7BQTFp1gkwzOCdzHLqOdS1Cj/qB2D5L1g/b1/c+7caINeddPJCyqnsfs0Hntut
	CjweacrS6mMCrflTfBQC//Hs1k11PcosLv+FU095DYZrLEYRU0wtNsXxx+27I+N2Tof6LCmhHRs
	kF78B7Mlc5q9jknR7r+o3Q80s9clg805oJdQf0xws0sX5CBQH3r7gcTVUA/KoDr5F45lhS5KhOh
	K0ocuVu4AvU+vjEdU/nq0T8pY6Nfh45dNcoYAtZIc2c0fyGNhQHmus7f1j/6jfo2C+1gQYXvhY4
	KNxf3oSvgHCX3PMo0tsqTX+LMtFq+8RqnzxHHYNgvf0lfaL0Wuji6ZbfQ0wxrPmvhXuxHegd1CZ
	3jikYtT27Lbd4GCSHtr
X-Received: by 2002:a17:902:f712:b0:2b7:88d8:efde with SMTP id d9443c01a7336-2b788d8f36cmr33715215ad.7.1776793632622;
        Tue, 21 Apr 2026 10:47:12 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.164.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0d0f8sm132131255ad.47.2026.04.21.10.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:47:12 -0700 (PDT)
Date: Tue, 21 Apr 2026 23:17:01 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Link Mauve <linkmauve@linkmauve.fr>, maddy@linux.ibm.com, 
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, peterz@infradead.org, 
	jpoimboe@kernel.org, jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, 
	ardb@kernel.org, ojeda@kernel.org, boqun@kernel.org, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com, 
	justinstitt@google.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V11 1/4] rust: Fix "multiple candidates for rmeta
 dependency core" error
Message-ID: <aee3ivM9VkbqdQby@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260417152253.2312961-1-mkchauras@gmail.com>
 <20260417152253.2312961-2-mkchauras@gmail.com>
 <aedFgEicDW6LAcuq@luna>
 <aedJGuF9P2V1lOCZ@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aedQ629D0x-5KuKw@luna>
 <aedpk1iaeYyKPSOI@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <aeds6_8Mr_w38oYI@luna>
 <aeec_IzVJwlfarN5@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DHYYG7A745M5.VQY4GMDJNC1Y@garyguo.net>

On Tue, Apr 21, 2026 at 04:57:49PM +0100, Gary Guo wrote:
> On Tue Apr 21, 2026 at 4:53 PM BST, Mukesh Kumar Chaurasiya wrote:
> > On Tue, Apr 21, 2026 at 02:26:19PM +0200, Link Mauve wrote:
> >> On Tue, Apr 21, 2026 at 05:49:32PM +0530, Mukesh Kumar Chaurasiya wrote:
> >> > On Tue, Apr 21, 2026 at 12:26:51PM +0200, Link Mauve wrote:
> >> > > On Tue, Apr 21, 2026 at 03:25:22PM +0530, Mukesh Kumar Chaurasiya wrote:
> >> > > > On Tue, Apr 21, 2026 at 11:38:08AM +0200, Link Mauve wrote:
> >> > > > > Hi Mukesh,
> >> > > > > 
> >> > > > > This patch doesn’t apply on top of mainline, which tree did you base it
> >> > > > > off?
> >> > > > > 
> >> > > > It was on mainline v7.0 tag.
> >> > > 
> >> > > Great thanks, they do apply there!
> >> > > 
> >> > > I needed three more patches for the kernel to build on PPC32, I’ve
> >> > > attached them but they are absolutely not patches which could go into
> >> > > the kernel (except for the second, enabling asm_experimental_arch).
> >> > > 
> >> > > What do you think we should do about them?
> >> > > 
> >> > Regarding the 2nd patch you sent, As the support is experimental as of
> >> > now, Let's wait till we get everything stablized, till then we'll use
> >> > nightly build for all variants of powerpc. Once we mark it as
> >> > maintained, then we can try to push that patch.
> >> 
> >> Enabling the feature is mandatory even on nightly or with
> >> RUSTC_BOOTSTRAP=1, otherwise no asm!() macro can be called and so the
> >> kernel crate can’t be built.
> >> 
> > The stable support is available on nightly.
> > Refer https://github.com/rust-lang/rust/pull/147996
> 
> In that case you should add the feature with a comment that it's needed for PPC
> only and is stable in 1.95.
> 
> Best,
> Gary
> 
There are some other build errors apart from this on 1.85. So few months
back in the meeting with LLVM team we concluded that for sometime
powerpc will be ahead of other archs at 1.95 till others catch up.

Regards,
Mukesh
> >
> > Regards,
> > Mukesh
> >> > 
> >> > Maybe Miguel can comment better on this.
> >> > 
> >> > Regarding other patches, I am planning to work on ppc32 once ppc64le
> >> > stabilizes.
> 
