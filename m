Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC83803D6
	for <rust-for-linux@vger.kernel.org>; Mon,  2 Mar 2026 05:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772430961; cv=none; b=oVodV5Nx4Dd/lgmRmCTZBbqIDqMpQn9YVZwReHZijCQtn1uTR8w3H8A2B/ao/UT74YzinVyNJ1HZfz+VWpO+XWnPaihIro1nqXR/ZcWytvbZKayuWB+b+BE9xRVMv56sJYbU0215+JskoTCwR6Fi9Gz9MaEQGs0PVvKCn8BXZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772430961; c=relaxed/simple;
	bh=T9vF3OMJTb4zP0n+PnC1NLELNKgx2s4uAe1AZmq6Z3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8WckzI/iJI0Cou02QQxgjO5WLolojEd160M6x3Q/lr7XQDy0KyymF5owv1dWaGqK+GeFznVBmUPv/7DQFARIvXjHTDia6rKbVJG/CRuPEY7dxmuGxmF6Wi947yKU8iSkE9tR1JUYiCC3FiLYtSRqGg+NEcaxv2td84CpUCPdiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hT8JNpyk; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hT8JNpyk"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2adff872068so19851305ad.1
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Mar 2026 21:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772430952; x=1773035752; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uEUolpT/Arp1A2P5xnAR07p4qbMZiaO92OoqOxRTnXU=;
        b=hT8JNpykw7ROPnz9LzSdCKAf+V0lv9juBin709wv1qWOR6y4hTPBEiQF5p6NyjsaUX
         CRuJRtYqxIesHH33nk9eWgOEquPMjQ7Uiop9FWLQ2ngz5G8Q1P+C84y8S5e2WYJBddU0
         kKlEC4f+YtsKe3mZ82jCQiF4M6mzmO9ZDeNRrDqloUNVu7aWeO3dIGe+Z6ho/HeolAS/
         36oRuShga27WzEDf7MLeYWmg0CYdIuEdjojctUxXwjZvlZ061Z21vUKotTmzVXC0Yxdi
         PL6d7NfBWZvU+JntkLxLk+BJkJQzmIYMmlX1E3EV/nXduy+cnKcFH8+H4PBnDKJGwjtw
         1V9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772430952; x=1773035752;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uEUolpT/Arp1A2P5xnAR07p4qbMZiaO92OoqOxRTnXU=;
        b=a//bMnjY5duADtXlxw9wwBXm7+4F1D96Zvw33iw3UW9nAfaMETSYL0Y6IILhxAaZFu
         4lQ9aanpGUbRLsi4yxB7EdQFtAvjfayLCL7Iq5tzGxy38FHq0W0zYNxCAgQVIlyjR8r6
         xTyb2X8443XlCwkDViAP+tyPXK2yIGPafiduhUr2puWNnG2HeDbSJQ4jvautqb5ReoM+
         vo+YVW7AFOs0w9wx3SxcNhRHy0o64D703HOuGbfhDdl/4teuXPrDdcW8JhdK1zeqZ0YR
         KA02p6utpGe7IkNbRXoEdCITGr4TnrDamn9+A4oXCCiQTVDn+KiWKk1TGSgtOnKJKdbO
         00PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIOIlBX6SuJAMagh4V04OhgWH8qCTMi7mK5FkMhRToejOHkKAZgkS4xOLg//Np58Hj7ZwZPL9J23mIhkBzrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnkTfS3gwtdlQDsrtZ/WCVd68pkIMGCnLXpbiPb94CB+/b9SBS
	hwSKlRZpREQUtHE/WU4llcHPSAbwCZWbM9J1uTLho6OB+U0AgAN6J+Gr
X-Gm-Gg: ATEYQzxPar7O7NXLkUlLxw0Ajfr+/i9Vk1mX+ccIIXuafKJu5gkORD570paL81dqmWY
	iJug4lBRlPFwJZ7lU9zxzBXljYzJ/ul136p5hbjlFNJFRcfb/kv7XmAM9hLdJ4S15TPrkZTxoRF
	LG+DEJTVUrFou4xxFRfipHV0TiTIJpvwLLbIOcZmfv5zZVORVtt+k3gyAl3SSeZVqYY9BkrpG/c
	mfhiNUFU1CtjLHKm/7IuEDWp/aDBpJdT/FfdivUkDsmSq5LhPNxFMCejTWv8DhCsiBJx8eUikDN
	dvF/ztmURNI2SKnb3DSsisYMRNvdvi5hkfgikfVuh16vGVm9KUZ9pHwIzpfWW5dBC1rY6PT2AkW
	d4RP4sDmTH9GRSuHaNeSvGxuG3XQIY1DcIIzQLE/0NlNy6pUKSCjjv1E1E92/FpvP9U31KFx26i
	YClWYzNN0wvMysJeiOGnyDFIPHmDDYrSTEEv64y0TBd4eCvZOsVLCQE/a9lAmvkHZ3UOHgrdgg
X-Received: by 2002:a17:903:1786:b0:2a9:2ab2:e50d with SMTP id d9443c01a7336-2ae2e4e1e73mr98276195ad.51.1772430951599;
        Sun, 01 Mar 2026 21:55:51 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([103.219.228.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c2e4bsm179629825ad.32.2026.03.01.21.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:55:51 -0800 (PST)
Date: Mon, 2 Mar 2026 11:25:54 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Ralf Jung <post@ralfj.de>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Link Mauve <linkmauve@linkmauve.fr>, Alice Ryhl <aliceryhl@google.com>, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, corbet@lwn.net, 
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, 
	peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, 
	ardb@kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Jubilee Young <workingjubilee@gmail.com>, Matthew Maurer <mmaurer@google.com>, 
	David Wood <david@davidtw.co>, Wesley Wiser <wwiser@gmail.com>
Subject: Re: [PATCH V6 2/3] rust: Add PowerPC support
Message-ID: <aaUlwfP72ZpshLPL@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260210090023.2587534-1-mkchauras@gmail.com>
 <20260210090023.2587534-3-mkchauras@gmail.com>
 <CAH5fLgi3Owm4=4g8wQ5Rnr7Y63XJ1D8apOdkewW6WpRfg6vV_w@mail.gmail.com>
 <aZtT4MH0Q8Ic9ZiM@luna>
 <CANiq72nEam8n_daX5LyYrpH=i71k+pb+HLn6EEPdJJc-Zi9Q3A@mail.gmail.com>
 <aZu6cSqnvO91w1m4@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <CANiq72mg+D4QZmBhrNj7dB+V3GHsQoZT2cSG1ffHYDYJWXyopQ@mail.gmail.com>
 <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a176f95-eeba-428e-b19b-b08503d9ca5d@ralfj.de>

On Tue, Feb 24, 2026 at 09:58:10AM +0100, Ralf Jung wrote:
> Hi all,
> 
> On 23.02.26 16:31, Miguel Ojeda wrote:
> > On Mon, Feb 23, 2026 at 3:26 AM Mukesh Kumar Chaurasiya
> > <mkchauras@gmail.com> wrote:
> > > 
> > > I think, disabling altivec, fpu and vsx with compiler flag will work.
> > > 
> > > What are your opinion on this?
> > 
> > It is really up to upstream Rust -- for us, i.e. the kernel, it
> > usually doesn't really matter much how things like that are
> > accomplished: whether via flags, a built-in target, a custom target,
> > etc. However, we need to know what the path to stability is.
> > 
> > My understanding (but I may be wrong) is that upstream Rust prefer we
> > use built-in targets for softfloat instead of disabling via
> > `-Ctarget-feature` (and that the other options may go away soon and/or
> > will never be stable) -- at least for some cases. For instance, for
> > arm64, please this recent change kernel-side regarding `neon` as an
> > entry point:
> > 
> >    446a8351f160 ("arm64: rust: clean Rust 1.85.0 warning using softfloat target")
> > 
> > So please ask upstream Rust (probably in their Zulip, e.g. in
> > t-compiler or rust-for-linux channels) what you should do for powerpc.
> > They will likely be happy with a PR adding the target (or whatever
> > they decide) as Alice mentions. And until we reach that minimum
> > version (in a year or more), we can use something else meanwhile. But
> > at least we will have a way towards the end goal, if that makes sense.
> > 
> > In case it helps, let me Cc Ralf, Jubilee and Matthew who were
> > involved in some of that discussion in the past, plus the compiler
> > leads.
> 
> Upstream Rust dev here. Indeed we'd strongly prefer if this could use a
> built-in Rust target; we can work with you on adding a new target if that is
> needed.
> The kernel currently uses a custom JSON target on x86 and that's quite the
> headache for compiler development: JSON targets are highly unstable and
> directly expose low-level details of how the compiler internally represents
> targets. When we change that representation, we update all built-in targets,
> but of course we cannot update JSON targets. So whenever possible we'd like
> to move towards reducing the number of JSON targets used by the kernel, not
> increase it. :)
> 
> Kind regards,
> Ralf
> 
Hey,

Sorry for delayed response. I was out of network zone.

I am not sure about the process of how to get this in rust toolchain.
Should I raise an issue of github for this?

Regards,
Mukesh
