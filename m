Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C66B191F74;
	Mon, 30 Dec 2024 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735583891; cv=none; b=a1Wfm5DDkipZZBmk2Z0BbJuFC36+EYfJfPRKSWnEmL7YWiim1qccsPQ3pZq+zG1eeNFmOw54f/J+1E4/0tvTodwjbm45hgmBRCogd2xd2omWs0YX/De9jEWF5zUx3KtwJ7WUTL7dfdKKL/A4eD/E261u6c0j+u0lefrZ02wbAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735583891; c=relaxed/simple;
	bh=OxKoGLMA5oDgBqNyCfSjDGieGyi5EZhoEDyz+xgVB60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWZ9NiOQOuqp5WHnfd4r3W9gaUJKxlhFW0FwHLf6t66z55F+CKjj3m6y+6rES39aztOvswNzKq68ku15hOmhYJo65IsKJ3+w7ZmJR1FkXxr+YvIqiwbIY2EQg95w/0iQYTQrqDIua2JLb/165KRjwAGv4gES1q2USS10eL3Yi1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aplbmm2a; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aplbmm2a"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2163bd70069so21413145ad.0;
        Mon, 30 Dec 2024 10:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735583889; x=1736188689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJh4jVX8GBSdN08otyIk4cVi7mHj5xcF1rf1vKBjGTc=;
        b=aplbmm2aib1wVWbloRd5XRAGP8QRqxjJOuNscLmokeTPMI2FpRQjfH9Lbm3st9VXFw
         XEz2nFcHGpMEXNXIQLLsRepQGTmxqSe1JrYo/+ZghW/NkQvEmFM3lis31LPqlI816kxp
         Iei1S5tStWn4hFH+rBI1f4KK2g95VAEyIVE97V/TlGcPCo2IOZDZfPGoFAXzAW7cKpKH
         YI5MduLiTf+w9UzeTPtVms3UQSaGHApiqgfp8nxZgY/D6gV2914tuq5KIx71cEymae9I
         +KXDQBWG+TnT1rYYcdQaNdMXlXBlviEj1dzeV04BT3Z2j7bz+tBu7NbjLiOkkK1Gp2Oc
         bIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735583889; x=1736188689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJh4jVX8GBSdN08otyIk4cVi7mHj5xcF1rf1vKBjGTc=;
        b=QWNcCDz64LlpueoqqGkfvjlrfeXl3cNchpWLmxvO/yFMar9ShGJwSwv/ed+2WUDj4T
         X+g3GBCa3AG2eY0kT8iOMCVVwCxJ/WzDUW4mncqEfUrm0h2NSOJOxsvJWZtY5oJSWJkd
         W0uryU3SGdqcqEhvxEDMo+blIoEZjjCwHM1HF0dy8eU64+ouFl8LaW0yp/vQA40uKmCH
         Y0aBQferEpcYs/1G0YAw3gV2E4ggmY9NdLzt97q/sAMV+ym4pQt0TswYF4my0xJMnReX
         vNmuwdS2C6RNLOdcTrEDYHNO3k6AFEEk3uynS2wSVVaJnGBPSXBOtUuWunyMpqN3DrS+
         Q4RA==
X-Forwarded-Encrypted: i=1; AJvYcCWM/X+/FAqcy2xLv2hcwT6cZpAqaMvp2cHbhdpIgp/IHb4KrnoA4DJJ75XYsW5sR3SluKzFUebw/ErFkKw=@vger.kernel.org, AJvYcCXDP8wuvWldCLqeJMOohZQgLtL/3izoUOk09Hy6Of8qXuPvXONugOj8EBsqdG5Xg6iQi39gCpJA6Om/ezqhs5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE1b5lSpijNW1LJRKyzJHLT1dOZkIBOG0MlQqnRAoMxWVOVv9F
	yyM6RM+PNJTLC366IjhNc0foqEmjlTTwE3zbQx0WuXkAgJ71Q5gQj3u9nQ==
X-Gm-Gg: ASbGncvOT5F9uaDdH4DgAUx9xsCVYSyImtm69CMXukWqBr8PW5qgZAwZZOmRoAY3Qob
	ygm3oLHDWJtAALG4D1k5g7+80JcXCj4zmH807p6pOE7tUlP/1qTBC/J8HJ8mea34RCDBn/LaZNW
	/P0N3QGmo/LNpSOn3BN9FY/y7Tb+tCt7I64NYhtYQVn0QM3tw39kbXZ5/WQ/Xi5m2Y5pDoxCvn5
	KAm9gpwGaDdMzUF7lHNYKRLtbAx8oI7MpFiz911bjL332HmVFV+oLUrMxHTiRlapZd7sXEIjyK8
	L1p/jAM28D5ZKerT5nHcb6n5Q/DYrRA+4OjgDWP7ehlA44A=
X-Google-Smtp-Source: AGHT+IFywfJA/RZnPgnjQWpQnby9hqofd07jGwI6Jf39LGLy4/VA5sTv/PGe2uZU/Mkk85j80x4TBA==
X-Received: by 2002:a05:6214:2522:b0:6d8:960e:5785 with SMTP id 6a1803df08f44-6dd2334ad70mr568834876d6.13.1735583876823;
        Mon, 30 Dec 2024 10:37:56 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137285sm104911946d6.66.2024.12.30.10.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 10:37:56 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id DA37C1200043;
	Mon, 30 Dec 2024 13:37:55 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-11.internal (MEProxy); Mon, 30 Dec 2024 13:37:55 -0500
X-ME-Sender: <xms:g-hyZyvs0eambO0Isc9G9vJ4wsjyKZGezkB-hyeneuSFGV-E4FLBPA>
    <xme:g-hyZ3dMKivpWMPvfy75UlTKAGXccJRHbjxzlg-FGUcejmmjXLAEg9p41xTTDqSFd
    SajihM9JoM7MPTL9g>
X-ME-Received: <xmr:g-hyZ9zQyQgg5EMHCEDyXAp6lfrXOBPNBOu6qpOoW8h8j4FXd0AIUGEg9yk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddviedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedujedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheptghlsehgvghnthifohdrohhrghdprhgtph
    htthhopehlvghvhihmihhttghhvghllhdtsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    ohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorh
    esghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdp
    rhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtph
    htthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegr
    rdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhi
    hhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:g-hyZ9MBR6fchBp_4V9Y1xOaKh90RTIZuzUx-9sfEJOW5oFnIij0Hw>
    <xmx:g-hyZy8dp-lSDvaLIDaeG7j9DuW130uvTHMBoCNnIXmH-fQP2hWFbQ>
    <xmx:g-hyZ1VDmsooxfVc-ALpPPfnQ1UbJJKwAh7LlsOWZd7xhwvAYmyTbA>
    <xmx:g-hyZ7eaJhfxKQ-PSNCKid_BMb4U46rizguhgPSaNuj0tXrFcMKaAA>
    <xmx:g-hyZ8cW1eX45_NeCqQBwQnp4hxPQvcgQeybtGaYW5U68bMo4ZPMM-Hf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Dec 2024 13:37:55 -0500 (EST)
Date: Mon, 30 Dec 2024 10:37:24 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Mitchell Levy <levymitchell0@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH RFC 3/3] rust: percpu: add a rust per-CPU variable test
Message-ID: <Z3LoZNsWpwvyT1FB@boqun-archlinux>
References: <20241219-rust-percpu-v1-0-209117e822b1@gmail.com>
 <20241219-rust-percpu-v1-3-209117e822b1@gmail.com>
 <5374de79-0ee6-e817-0f87-c800a6fbb733@gentwo.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5374de79-0ee6-e817-0f87-c800a6fbb733@gentwo.org>

On Fri, Dec 20, 2024 at 09:56:54AM -0800, Christoph Lameter (Ampere) wrote:
> On Thu, 19 Dec 2024, Mitchell Levy wrote:
> 
> > +        let mut native: i64 = 0;
> > +        let mut pcpu: PerCpuRef<i64> = unsafe { unsafe_get_per_cpu_ref!(PERCPU, CpuGuard::new()) };
> 
> A bit complex.
> 
> > +        native += -1;
> > +        *pcpu += -1;
> > +        assert!(native == *pcpu && native == -1);
> > +
> > +        native += 1;
> > +        *pcpu += 1;
> > +        assert!(native == *pcpu && native == 0);
> > +
> 
> That's pretty straightforward..... But is there no symbolic access to the
> per cpu namespace? How would you access the kernel per cpu variables
> defined in C?
> 

FWIW, there is a declare_extern_per_cpu!() marco in patch #1, and
Mitchell used it to access this_cpu_off (defined in C).

Maybe we want to see an example here?

Regards,
Boqun

> How do you go about using per cpu atomics like
> 
> this_cpu_inc(nr_dentry_unused);
> 
> 
