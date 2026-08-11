Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB0B3290B0
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 06:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786428272; cv=none; b=ZAsfhVB2gNIqNKeHLPkbmRBLSluiwxYqYkb/+vE0TJhSyG5vRwdrvhJbWkHwZWPXSn92/zbtviA04GMpjGe976jDWmVX07PPwospoHvnQ3DpZHM/pB7gYp6woP07yyE8z/TFBPHR8pX4UOA4is9OP1LEUf784m6jHzDXwIs6RjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786428272; c=relaxed/simple;
	bh=18tPJmB2IrXlw/93X4CGmfMThkYsZlIjuAOdW+XO01E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ycwjc4mPbmzpvelvEKak/PdYjtPuVdkzYUmtlaDr2Mh0gJ/sX+28wCJees4Z6pBDcprYIAKLzwXh04bi0t12+rpTJPaIcrRBCMm2LKcYHf6lQFDHnfCH+IZb8NWPetZVmQGqEpJ2uh1JxGtGrBnsthtsWW5euEdVzT1Iht0rP1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDvLsY84; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDvLsY84"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf50c6f235so5361675ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Aug 2026 23:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786428271; x=1787033071; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DYM1O+Rd8ITfgZXWgWXDbgYDCcPMCN1QFwc54SaPkqY=;
        b=YDvLsY84HG/xHpnZ1ry3LlB4kfzBOTDjwfseoI4mkkvq8tnFCouEUi5AQQx2KDAxhn
         3gX9ndJ4slnWspkAWdSkwgger4hNNR+7TwwJTKSEKzKjjho0p1vubpWKueEHcFSIn6xQ
         7MqGw2BccdVqZDs69J0j8kwRVeih9vWdtNYIwZlPayZ+uO4IKn9HmUzB2qOzdlOS7tku
         739ULllnrfM08ZpkLnnyBOKgrINRTws0KJXeDny8BVcz0ADqj3rQ7Gqj2Kx7wXFyj3TO
         JwexIPNOAr5Ph+CfynhejvhV80I5Bl/3XlUyjbzeNbF/GUwHYIaBUykilenMr1j/IBvN
         93eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786428271; x=1787033071;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DYM1O+Rd8ITfgZXWgWXDbgYDCcPMCN1QFwc54SaPkqY=;
        b=B07YTlkCNrrHE33dtRK5UhUGH1zsSC0auRsaECTtdMqtU5OTtIvRruCJI3NHFICYTq
         U0lwOfW5xj75HkWakiId4E2CWH3tS7pkdTwo/xeEBuu0D7T+145ZkLjc7htlO/R/gdBB
         53jIetDLZHeCQCSlwvS0hrB5+Hm6GoYvL4E6Tjj4PJih/StdR89x2p7mBUJfoQ/wlkfo
         BlAD38Jve6dGF9YfsNjFVZtLCgndiv0UFU5DzV1FHb8eGDANt98J2psPMjpG8zJIDtdw
         swumWgB7KZAMj4uszXPIlYWLxaKbLu9Qzb4ajX10RDBvHACL1i1vt/N5bxk1J00ZtjJq
         zKpA==
X-Forwarded-Encrypted: i=1; AHgh+RojaF9uXxnbZHQ14fgPoMLZxjzHfEW8suXHGyHXDOhvT4TYa/wWOLYlA1ZMnbUuP22voLNXwuPMFRNzXalkSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6MAa38B0c4ge8nPEn+ee0bzXsYnsveS3nHppdJHjrbUInhw4
	oyddXipABE0g6B1QZXMtUB29P3yYb1AcPjUpk6cLihsUVzfTj8VxBUFf
X-Gm-Gg: AR+sD13Wck/BnhHr7EvzslpH8FmabZQMBYiDGdVyXVcfT63GVUxmhD99xJWx34qYRRh
	OHh1FwAdECjP2BcPiIMry7eNwtLeX+Z4920J711cKSZSWj6cfksR8v2yK583e92IIsm6M8JaVeT
	9Rdt2YFzGK3oebF24y3hkFu0HCDdLcLadURh5lXjr9DO8j4wzvfj8uncRdtHPUfidsjgkNeRRqt
	h+g/lHuG55uqDvR8SGbttV9bKTFC99otHLtmhqgczGhbhWLwaubms1mZCVZhIWQuKXm2N3SoGBj
	PbvNHtt3tNhP8OAmM51Jdt8sugyCD9swzlc6ou/wfqDaByqUaQbquQ2JhU+mHKP7iFj5zfrcDf/
	WnU8VK2snyAhueEsoCBDAb6q7QUguCTT+X67xceDH9nv1sEhe9ydwWhjYmnep7kYbdizPsqbzVB
	h+/fCff+b5kkLFMcRt2iwpn5jWafJtvyNBzzu5v1wNtinfUnm/Sbl+20WG9VL10u3uPgPgWa0GC
	J5jKKeaEdvGbt4+36V7pvX6GPvPHy+mt9wA/2DBnfc=
X-Received: by 2002:a17:903:3d05:b0:2cf:8131:75f4 with SMTP id d9443c01a7336-2d317926724mr13979715ad.11.1786428270656;
        Mon, 10 Aug 2026 23:04:30 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3160d475bsm1935445ad.50.2026.08.10.23.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 23:04:30 -0700 (PDT)
Date: Tue, 11 Aug 2026 11:34:03 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, wedsonaf@gmail.com, 
	mattgilbride@google.com, boris.brezillon@collabora.com, robh@kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] rust: uapi: replace direct asm-generic/ioctl.h include
 with linux/ioctl.h
Message-ID: <anq6-zI1NItuRMLR@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260808032143.2767112-1-mkchauras@gmail.com>
 <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nH+7P0PtE5h_kpn2oSK3-CgM-q5f3B=YemJOgQ-AfwPA@mail.gmail.com>

On Mon, Aug 10, 2026 at 05:29:02PM +0200, Miguel Ojeda wrote:
> On Sat, Aug 8, 2026 at 5:22 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_SIZEBITS' macro redefined
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_DIRBITS' macro redefined
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_NONE' macro redefined
> >   uapi/asm-generic/ioctl.h: warning: '_IOC_WRITE' macro redefined
> 
> Thanks for the patch! I can pick this one up.
> 
> I am wondering: the quoted warnings were shortened intentionally,
> right? i.e. I saw longer paths when I reproduced this.
> 
> If so, then we could put the full ones (at least personally I prefer
> that, even if it goes over the line length, because I want that it is
> easy to search for, to avoid edit mistakes etc.)
> 
Yeah, I intertionally trimmed it.
I'll send out with the full path.

> > Applies on linux-next.
> 
> This would normally go below the `---` line, i.e. outside the commit
> message (and ideally use `git format-patch --base` to provide the base
> commit too).
> 
Sure, i'll fix this and send out a new revision.

Thanks,
Mukesh
> Thanks!
> 
> Cheers,
> Miguel
