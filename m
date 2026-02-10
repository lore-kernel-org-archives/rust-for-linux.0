Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF8F32C306
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 05:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770701404; cv=none; b=WPmjWLfUxSU1qzFYvtHYY5KWS7Ta4Qk9MTp6f/zmaBoc6CLYfjve5m0KthuSWUcOp3g+a4XA4rPL3cZ/nMs61zW8X/lwbINKf2v8su9ds2/CvE8aOJzs53AU3y7LAYOLh2YrWhVcS6A6ohjqwNtucHxEcDm5oukDE1okVodiuU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770701404; c=relaxed/simple;
	bh=R1TJuxsI503WfcCrotW5cXAfKLO0OybYlEBIncV0Swg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=reEJkfusgyYKGnM0PuXZ6Uj34abhD0WSYK1bwB4px3rNx99LEtrdsO6xMhuF/LM/snJFtuJxBe0BgzN1JO1CvcZ0kkS24+Oq70vM6XW1xOy6OQ1pvv1o/E2LAYujwW7t+UjFqpWejtc1K5gQGR6a/tSxGYX+Ec6kF1x/V1Lcu6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IdLrkmj7; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdLrkmj7"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3530e7b3dc2so357282a91.3
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Feb 2026 21:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770701402; x=1771306202; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fT9Mbpxo4W8Zi0n9UfpqQos4iWb4u6iEFbRZ4NRj4C0=;
        b=IdLrkmj7shgAWJUiu1p70jpifZGt4yu9WMiyjsCgR3YeP22FzWxlMpWWwIKedO/8u0
         /PoPRMgxcp625XMDxkx+wpNlpgifIYWlp16buj9U8BPGXFWxVtceQsMkk7yM8uMiMr2a
         ZOpHfiZXRtkkoYuKoxLFgtpsbd1YDf38Idp2jFI2LNz2cU/oiLBCs+ZONkMG7XZqYsAy
         sRydi5q5LEBCWJaZWMIWmDPmZIvdyHcJXXhcYwP5cWY6vyId7rpLS5I7Mg98OP3NNtXw
         2w6qUnpIPzFY6lEnUIZhlIangJLaBhN5LfhmeZCiiiY8MiGh92XvOgPHdozFT3JR5bva
         49ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770701402; x=1771306202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fT9Mbpxo4W8Zi0n9UfpqQos4iWb4u6iEFbRZ4NRj4C0=;
        b=n+CnZc1v6p6Fl2ETPXrKZs5VT74j+PDLaneHdCOHHU6640CyTxib+rC4fZ5uEOBHxv
         q9boIh1T9Wny0itMnwWL3xsKJ1A5Ef1FP3VqEqyC6Bh+rxCztXEdS5ZgTisBs3uu3Y/J
         rYSluGkRsXB5TdgIkUBtQEyeZMb8RdokW9FERVP3KbBN2N22j+Rq4mllkPIxuG8AdOPr
         lbqt0+i8nlYEvFyEp/vdsGOwRPFyJUVppyzAFtN/JLaRAux7bqmBvShAMjHAetprlbov
         s1cMbwI3ZVSbxFJxxIi+kjSe4iPEpXddudSRobyKwv2dCNtL5w8bgfAscxuysfVbmFFl
         19Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVzbLeZig9sDI+Pzcnl/IGRiHyrSPfQBKfzMoJJLDpmnOUNJeGJj0qooPbpaGh7dl1AOEb/XTToyK1xXL59Uw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj+3KndjvMtG46tbV7L9di35Rv8OOah4otXho4M/muMURK3bAL
	9peUtc67xoWb7GbhjNMOyTR33jfmJ2bdIu/8WeWXGHo/+xJYuTC2Y8gT
X-Gm-Gg: AZuq6aLjv/HpQ/jaB6ObYUSVcQsxYtld2+PrRSzgijkxPy8Miz0kjGXCUUk6rff65+p
	OAQB+J3bN+JEt9WblIqt+k6JTbt/W9Zo8hPKMc4E9fw99qADZ5TDMysgCdeNT6kZf5TSP9CavFG
	dIYb0gFDHaGVpvOQqdr7hhA6meOd7nKhjGE/WKRsMzd/zCpkd2FSiphtdXQ5X7LqMxCjxH5uahs
	vZC3xbvNmTx4QHkwFyBbAHZOfPXDs9SE/1bbI1LaMDiu+t0Y2Pk5dKphay3Cg4tqHiqZ4Wkxdlz
	QO8PzEmqB5iNA/XiQ7JDecOnQooIzDr7oygp8LsD5IaaGGnwWMEShpK4rdEMUsESNo+78ePq88i
	uzoy28sj5ojp0ctg61ReJXWXegHKc/yrs/FxllY0rxGnkMmmyfYvzbpWu7PdsM4QCKTVTt2QFKq
	MmF0/9c3JeF7F8GlkVxxWru7I/Uf4DIwE2GEM16FDh+CbX/cnZjnh2pRNIrUVsNUQeuJ0=
X-Received: by 2002:a17:90b:3fc8:b0:355:35b0:8b88 with SMTP id 98e67ed59e1d1-35535b08f56mr8262973a91.32.1770701402185;
        Mon, 09 Feb 2026 21:30:02 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b465df46sm5168250a91.7.2026.02.09.21.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:30:01 -0800 (PST)
Date: Tue, 10 Feb 2026 10:59:53 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V4 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYrCFCg2yEpCMPS9@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260209105456.1551677-1-mkchauras@gmail.com>
 <20260209105456.1551677-4-mkchauras@gmail.com>
 <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=V4yyOwsxvWzGkXQAcMhoTaFZ8aNAe15Aa4BU9JtDGhA@mail.gmail.com>

On Mon, Feb 09, 2026 at 12:52:26PM +0100, Miguel Ojeda wrote:
> On Mon, Feb 9, 2026 at 11:55 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > diff --git a/rust/Makefile b/rust/Makefile
> > index ae22f2c5f0b3..14febe9c7643 100644
> > --- a/rust/Makefile
> > +++ b/rust/Makefile
> > @@ -392,7 +392,15 @@ BINDGEN_TARGET_x86 := x86_64-linux-gnu
> >  BINDGEN_TARGET_arm64   := aarch64-linux-gnu
> >  BINDGEN_TARGET_arm     := arm-linux-gnueabi
> >  BINDGEN_TARGET_loongarch       := loongarch64-linux-gnusf
> > +
> > +ifdef CONFIG_PPC64
> > +ifdef CONFIG_CPU_LITTLE_ENDIAN
> > +BINDGEN_TARGET_powerpc := powerpc64le-linux-gnu
> > +endif
> > +else
> >  BINDGEN_TARGET_powerpc := powerpc-linux-gnu
> > +endif
> > +
> >  BINDGEN_TARGET_um      := $(BINDGEN_TARGET_$(SUBARCH))
> >  BINDGEN_TARGET         := $(BINDGEN_TARGET_$(SRCARCH))
> 
> This looks reasonable.
> 
> My only nit is that we could trigger an error in the nested if since
> you wrote the if already. Otherwise, we could remove the nested one
> until ppc64 is supported, or am I missing something?
> 
I will remove the nested if till we have support for the ppc64 big
endian.

Regards,
Mukesh
> Either way, for the Rust bits if powerpc maintainers are taking this:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Thanks!
> 
> Cheers,
> Miguel
