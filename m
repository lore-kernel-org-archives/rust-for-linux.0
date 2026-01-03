Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8B31E487
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 21:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767474974; cv=none; b=opwOXV5PCPve8Sss9NrPckcySTSSGG8PWk4x/goRllpj+q3b+hAsMrk1yThuOIZ6Naow6x+iByMpkSN/5Qw/uxcZ6AKwRqWIbEqlc7lSEvbClUcL79H2Sok2WmAlTog0/EsAx3SK87iaF58WS5PfI25xJ3WArp0nwx/vWSbWZ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767474974; c=relaxed/simple;
	bh=uiOLYSm61ERq2gPGbffcOs1yp9L6ssLDhSpjJurNdxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOCrfTCVMXE+e0+hSxisCkwcLTTy3HePrHFVEwTk0NRWcxbDihL/cG0VilPLCPwMep+/HJlpu57jldTfhpN9KwCa3DaJsgf1HzXszNVOEaqm9AzHaVTqKIxtuggOs9o1aUS9MnDWW8Rg5fEUdYEdGy+5u66FtWAsxNMpNz1gW2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info; spf=pass smtp.mailfrom=markoturk.info; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=markoturk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=markoturk.info
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b61f82b5fso17512368a12.0
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Jan 2026 13:16:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767474971; x=1768079771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7unVhQC3T8DNmPkvBEAcaa6tSYQmAuHw+iiC51rCJE=;
        b=oFazzUTlF1Yqbj2iw9p9eYCLjQxS94Tf+j3l7SedFOFN6XLOOo6JUX6jyXD5WdPGPd
         3WMajf49Lx8PKfAiM2Wj4eVTh4LnYsfhDBHPjCcr9AFxwlkNN68EUcYx+Ymgf50fJojS
         lt6C4TjKi95glDS7g56nZohvQYEzpfCC8bG044WcxzVrAMK/wGUEXfApqngDiAdnzdmq
         w9VRyGvXDKcmv/11SVNgYwiH9LvNdMb8b55HZAsD/6y8aa45IGxFbQrmDzF7hrHTEjZV
         DueQvmLn2mFZ48eEASXY8V2QkWU3ki0fQQntXNVaday0vUoRoTJazqw8QX5gHhW3DWXb
         15wQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+E8nypwlMCKzlLr3loKV83dwpy8stx7hTQKE2T6VlkX4NvF/nRSyGw7AftjyLQ/bIOoeStQoeMDPoUdUlDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxIzQD9sAdKzC1fnh/d/qBz39mnncHF64ydHSTvdLfDDdiSXq1E
	wL7bmZp2Eq3CrXlf//5mZz9P31/CsSDMbswxjjUd3E6VqNzgqk0vZW3CU7hX5QOcKaQ=
X-Gm-Gg: AY/fxX7MFaqwYkrdNs0dw5kL0WId9RVi0jeGiPczZNfkVXQ7i+g7e8qPWrF+5WJWL1n
	JH20ggrOtA1P4qqsWXz0dDDjfgXXlUOnkyXFgKfIA9KY6PUv3R27WcBuHMeQZgr9aG1eGDYF8Xv
	xWZMiyzDCo/DuV1nib3aYpup3xl7mBAceLuu47u6yeemsMXKRgVF3uR6Isud/J0f5ewnBWvD6OQ
	aO1dRsH7cSDa5eN9dVU2+t8I1N8sfsK5ux6YzFtmbBeMejMGrBMNMYLWohpWUyF5fVpW5On0K5K
	RWUiXTWaxRm9g3Q8ot4gfrz3/GmbJtqASBBvcYPU4k8/4j1zeuctfsB8Jm0GB1Ip/2xDkIfxKHr
	RzDwpAoTfZUydoBbBxz1mUZe+s2rBrgV0KK/+W3Wbykrv1uXYGlYWDkfXj52fs53GDOWeLK46Gk
	dbRbxAHWqs36k=
X-Google-Smtp-Source: AGHT+IFuGObiLaYcEpCLsdnPWy/fW1azgSOUQs/3/+r6mlDFstD9ErqMY1MnRi+0ZMkkAUAoABOzjg==
X-Received: by 2002:a17:906:f598:b0:b79:cf10:a17c with SMTP id a640c23a62f3a-b8036f2d2e9mr4343539166b.10.1767474970707;
        Sat, 03 Jan 2026 13:16:10 -0800 (PST)
Received: from vps.markoturk.info ([109.60.4.132])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a60569sm5170024166b.4.2026.01.03.13.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 13:16:10 -0800 (PST)
Date: Sat, 3 Jan 2026 22:16:08 +0100
From: Marko Turk <mt@markoturk.info>
To: Dirk Behme <dirk.behme@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, dirk.behme@de.bosch.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: pci: fix typo in Bar struct's comment
Message-ID: <aVmHGBop5OPlVVBa@vps.markoturk.info>
References: <20260103143119.96095-1-mt@markoturk.info>
 <20260103143119.96095-2-mt@markoturk.info>
 <DFF23OTZRIDS.2PZIV7D8AHWFA@kernel.org>
 <84cc5699-f9ab-42b3-a1ea-15bf9bd80d19@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <84cc5699-f9ab-42b3-a1ea-15bf9bd80d19@gmail.com>

On Sat, Jan 03, 2026 at 04:38:36PM +0100, Dirk Behme wrote:
> On 03.01.26 16:24, Danilo Krummrich wrote:
> > On Sat Jan 3, 2026 at 3:31 PM CET, Marko Turk wrote:
> >> inststance -> instance
> > 
> > It's trivial in this case, but we usually write at least something along the
> > lines of "Fix a typo in the doc-comment of the Bar structure: 'inststance ->
> > instance'."
> > 
> > Please also add a corresponding Fixes: tag.
> 
> While looking at this some days ago as well I came up with
> 
> Fixes: 3c2e31d717ac ("rust: pci: move I/O infrastructure to separate
> file")
> 
> But that just moves the pre-existing typo from rust/kernel/pci.rs to
> rust/kernel/pci/io.rs. So I'm unsure if that move-only commit should
> be mentioned in Fixes:? Or if we should go back more to search for the
> commit introducing this typo?

The typo was introduced in the original commit where pci::Bar was added:
Fixes: bf9651f84b4e ("rust: pci: implement I/O mappable `pci::Bar`")

Should I use that for the Fixes: tag?

> 
> Best regards
> 
> Dirk
> 
> Btw: While we are at this file, do we want to add an 'is' in line 57
> as well?
> 
> // `pdev` valid by the invariants of `Device`. => ... is valid ...
> 

Should I do that in the same commit?

Marko

> 
> >> Signed-off-by: Marko Turk <mt@markoturk.info>
> >> ---
> >>  rust/kernel/pci/io.rs | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/rust/kernel/pci/io.rs b/rust/kernel/pci/io.rs
> >> index 0d55c3139b6f..fba746c4dc5d 100644
> >> --- a/rust/kernel/pci/io.rs
> >> +++ b/rust/kernel/pci/io.rs
> >> @@ -20,7 +20,7 @@
> >>  ///
> >>  /// # Invariants
> >>  ///
> >> -/// `Bar` always holds an `IoRaw` inststance that holds a valid pointer to the start of the I/O
> >> +/// `Bar` always holds an `IoRaw` instance that holds a valid pointer to the start of the I/O
> >>  /// memory mapped PCI BAR and its size.
> >>  pub struct Bar<const SIZE: usize = 0> {
> >>      pdev: ARef<Device>,
> >> -- 
> >> 2.51.0
> > 
> > 
> 
