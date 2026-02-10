Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D1533D4FC
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 08:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770713069; cv=none; b=tJb9BabbiI3ZRA3DAdUWJpVKatQ+LJSKHDZqmIZkxZ0RpucKf5IMJ7cCn+CFC3aMDIF5GRKfauAawyzC7UdOu9FwYZ/ksmTqfNOzyToQl2UhEOwAwa8hdhtBn/GYAHRm5mx78ryig93RZFY/RBaPanrvmMYv3P7a9WMFuYDSl1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770713069; c=relaxed/simple;
	bh=OUxjBS4Rkr6nocfLv8sYXTRp05YRB0jmAsFlvQZFJoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rw/5T1i1FfGz3MMgEAkFAGvcYixgZbrdC3vE4KQVTFc/CnxPBubWZs5r5pzgcmzfr4rTmYWoF0vEcD890/EDMKKNzJ8l2C4CWX+JyCqh2ynGyyDDFBYMZv8Q2GCG/1OGgcL3beprphFNPO4niGaUOnPAsGn5Ll4aoPRcTJVozCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfZLeIsn; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfZLeIsn"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c65822dead7so1573545a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Feb 2026 00:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770713068; x=1771317868; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vtWtfkgKaXxmdLN3poPHKX+M4yianssOSoYxmXvp2DQ=;
        b=YfZLeIsnYfjyFbB8wZJnh0q0XJGubl6cMq5PuX5E7N++4Tc4xniMVFiwcJYAS08Xix
         65ppLjmDJp14R8hfmRvl1OPhbqZ8e6Yxmgi2vGPiW2UHBxW12Mv9UG0AMqtzbxDh9Gy+
         Gr5a0pbAKJyiwKTLfnF0u0BJ8hLtUAWZrFpNpr/u79yXWqTTSSm3EdD+0aQ9g20DSjm7
         GlpeWStofSi0fYsdToxrd6r4/V/rSAU+bK/7mG7/a2hD904lCYAvX42EF58e0c+CNvs3
         Ec5HZz+fvdyoJ8Vi4L1L4/hYG/AU9zOd65p6byOEBe1tfNuR5EJYPmzZdwnt3g8BrRkN
         Nk1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770713068; x=1771317868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vtWtfkgKaXxmdLN3poPHKX+M4yianssOSoYxmXvp2DQ=;
        b=nfi9NkpqGxl62n6x+Tn4g4Uf7qald4XPlR3c7LbboTned4lZXFtd6r8jgQr1enwxr7
         RH4PqCl9ZnOy+yH51hDmJz3QvjcvmC0VuHSKGTmMNBpmVvbo+ALullZjru2EPtqh44X1
         hAV4ic0+Ecgf/uGMmgcIC82WMDJxvffLnqONi/IqCpEZK/FOSt8Re7HoeY08GdpOWc2f
         txgQImev4WGi9K5uYw9MA5P/tmQJQJWPyqPu2Z8zxiFuX5mqkyB8ya14uKtbHhSe1VIb
         6Pdmjj6XDe7P4j8SJuKru9Fe/tphU36saheldV98pxEJtizg/YaU55+N5zqkcTWsnnr8
         Jiaw==
X-Forwarded-Encrypted: i=1; AJvYcCVovm9JBrb0sReRmbTDiXDlTuSCkml+YVVc5KqCpZDd95uEXBYL+IqsOw3PeSLzHwbAO80t/zZMSPzH/xmISg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtGOxecxZMG5nPCz59b3ZFlL3b6NenGuOu67qatOx87yqMb8e
	AkoiLfEBbEH7XIe2Vx+PHRHW0Y2CfiQq5bdCowT6NyFlTuHZKDWCU21t
X-Gm-Gg: AZuq6aI4yxoaIrL1SAKkhl7/G0GPrI8KxtqGctlGEk693L3gRzTO5+MwdcxTbuzqlJf
	JHClHviZGLDWzRge5y6VosND6YjzBDa4/veg3+NA/qSONVfMIe9/SkFfkNJAi5pPWPCq8TZ43z1
	YhNtQQVQvlFwZZrharc6mPI8XSXsMjw9SNo4pOHRPPFFhtDmBqeAS+IQ/d4vLPJ76UvGuENm92U
	AL2fgWHzC+lPCY4no7BfuB6l3RXCbkwTAM3V5VSdgYG4b1FHe15MsTeuf+dv5/DZ38RjzuQx1Ec
	GOlSwf0+qeokQe+YFJAAjkNaxNL9Cghwf+knA4xWuFtlmj8tmHLfN7d9CpCtPCnygCHHCTvsB9D
	m9coUnXw+34LMmJnMuH1LOFWVn6NZEf3Js8fkqobkH9ga7wvHY0kdOeh/DZMwS8nzpgl4vzVRQy
	1XxYtEPdpTAgtG31EGc8LDWAzM/lFN9o/Wu/2rQL2DefnEHd47sMoZrQXA7z1rHyEeqY4=
X-Received: by 2002:a17:903:1aa7:b0:2a7:9ded:9b46 with SMTP id d9443c01a7336-2a951633be2mr147756965ad.17.1770713067767;
        Tue, 10 Feb 2026 00:44:27 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c809desm125873775ad.30.2026.02.10.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:44:27 -0800 (PST)
Date: Tue, 10 Feb 2026 14:14:17 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linkmauve@linkmauve.fr, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, 
	corbet@lwn.net, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	rostedt@goodmis.org, ardb@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH V5 3/3] powerpc: Enable Rust for ppc64le
Message-ID: <aYrvZB0FeiV5NzpD@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210053756.2088302-1-mkchauras@gmail.com>
 <20260210053756.2088302-4-mkchauras@gmail.com>
 <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72=nc901311qq3C_Lg7rZObFjTkZ7sQoCP1UpufOOkp3eQ@mail.gmail.com>

On Tue, Feb 10, 2026 at 09:22:36AM +0100, Miguel Ojeda wrote:
> On Tue, Feb 10, 2026 at 8:18 AM Mukesh Kumar Chaurasiya (IBM)
> <mkchauras@gmail.com> wrote:
> >
> > -``powerpc``    Experimental      32-bit Big Endian only.
> > +``powerpc``    Experimental      64-bit Little Endian. 32-bit Big Endian.
> 
> As I mentioned in the previous version, this is not a valid level
> (same in the previous patch).
> 
Ah sorry, 
Will fix this.

Regards,
Mukesh
> Thanks!
> 
> Cheers,
> Miguel
