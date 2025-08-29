Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B3C8EB
	for <rust-for-linux@vger.kernel.org>; Fri, 29 Aug 2025 05:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756444803; cv=none; b=Dy4BGwG2LQ9qaYax9p+Cu01OB/ILYFJXK/SIYY+WKzdEDabHNMY+Y3SUuKpiU41CQ9/f3QbbAJIaLJRw8CWwtcnQhYvtNu+R0Nz265pGBbKZG3vAZWV/dCl44i5oa4i9xOZynd2SMa0hHVGUbhlx7XvqDfEQGLMCcj1bQNr9TDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756444803; c=relaxed/simple;
	bh=wknwVsea7dk4TZRwIgYgEBL1gm061dQg4hfpunhqPGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KTp+BNeLbQnoH75HHR6yZnCa0+Vz8oCKH/Gdi1ca04e5CQoEdcwyqx7qpJL242f9iKS/CyKZojywvMZbkzkIIALzAmvUD+/vkE+/B+SZr2jaxCis2XUkBc4JXfZ1a+g8bVDYZzGAZi7ntWdy39Pbn+l0HOWoqS7mgHNkTq44GMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NUIV6qea; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NUIV6qea"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77201f3d389so1862993b3a.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Aug 2025 22:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756444801; x=1757049601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w4CA+JjSxoJjZGOZZpzLlfb+zTcQOsCT88TOzSkzLZw=;
        b=NUIV6qeaavh8DE+h4Gr/Ht8K8VcaDLPeaHddGAd7uLtqkzjaSBIzYYwQoSoQrOdtsP
         0k9cwcOc4NMJgyYj2ybQKXc3Dlv0oinhZR9TuX3mIg6w6A4JWXr2wrxc5xrNvgYBkx3D
         3bVimFroah4pJUKnPiPlhMKsqOEiJTbfBep/ixn5ULw7BwjiTQsL7oOf0Q/sym99eoMs
         5WOWwuFqRdYTbgIzKYHT/rplEpKpWwX7+Zi2gnCBJNft4yQgsPCdnJTZi7kIeICHRW0S
         TD3ZH9l2ywLjxp8hyXhW02AMu+XewTsNYvUv3fV5rauctycl2qdmNnQEx/0hswCX6xIZ
         cOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756444801; x=1757049601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w4CA+JjSxoJjZGOZZpzLlfb+zTcQOsCT88TOzSkzLZw=;
        b=MSzTT3sKkMBFCR/jN/YVAnJxYUtDYXFt7KSei0ukGS79Lgs7MmzEgZVB8mvonjFoL2
         VuT/sPTyv0kS7FqIT77fawdTeYJoMSOkdrKpo1Uxqvnt01Ow5TBJu2AMxZ5XNFkYvnYj
         Shg5zapZgb39sVblwXLP4fykISDYDGC5vdpFGHC3SrLn74KBji1vjx3j8XPE8qpm+PoW
         R6Vl4hWQYnqEIdg+PDNsCGyXI2bymYnJ9O905dAYWiVfTbCBgHggJEgN1/l6dnlFMujI
         NZrloAe9gy1DQTVcVtCDwdaN5YZZqcGW/snMbao05sIWyabTo7M5I0JBPaB/qf7qFojE
         EaMw==
X-Forwarded-Encrypted: i=1; AJvYcCVARxYN+9j+XlMOCUAqFoZVGGGGVXUDqx32Pxzsd+SLbIFpncC8MsOLJNnFOL+cRq80GFc+AGQhltqosDWKHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAWSPPUohlN3uoobZomffjKugw69OMekxp3Ax4fsF3s80kX0y3
	xbmUNwweYQ6oxDOyl5s67HYoD2mQ45LwRGJ6k9Z7fuYOPfs5tnQMeI+wuR4e9ru2aEQ=
X-Gm-Gg: ASbGncu3sPAJTh+AjGpBP6Ip5jAh1HlcCVlg979SM84Wc5wA/bOo14lY/l3JOsGTyo0
	tNkZdhqfh2GAi5Ms+hzFYuv2JAF8fpIyCwEtqV0BK4vvgFEtMqXkhSlOHk51UCJCGbDN/nFP4ma
	2sCdPlJ0JlRdjtaSKOfFNI6K1Eaw48gkfeNlSbaQntUdd093wr9ApijKZ4gXjB4OTQREO7AcWYJ
	hcWLr2c64WdhA17Wi/+1/ATGsdmE9uqZ6O2dEHzaJpiL5sIRQwQu5lbUG03tZAR1Zvdf8Sx5ODV
	OpU/aQ8wFjoMCWybddbvOq+FtRpjMboCmHER0tO//F5u709eqJfTP7Hwrm2it0bEDjzd1nFENKJ
	nltoKUueEflOCMZAWYeW5e1LuvHKWAmiS/34=
X-Google-Smtp-Source: AGHT+IETrKdzQi92QZKgjAfQhANfI2QmqLxzCiedM4++QowtrwcfkvZwuaEDKRt3EM2lOAmU2MJx8w==
X-Received: by 2002:a05:6a20:7291:b0:243:b144:adaa with SMTP id adf61e73a8af0-243b144b09emr7531411637.54.1756444801693;
        Thu, 28 Aug 2025 22:20:01 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd006c340sm1082278a12.1.2025.08.28.22.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 22:20:01 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:49:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mitchell Levy <levymitchell0@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 3/7] rust: cpumask: Add a `Cpumask` iterator
Message-ID: <20250829051958.s4635ztvmctki7ol@vireshk-i7>
References: <20250828-rust-percpu-v3-0-4dd92e1e7904@gmail.com>
 <20250828-rust-percpu-v3-3-4dd92e1e7904@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-rust-percpu-v3-3-4dd92e1e7904@gmail.com>

On 28-08-25, 12:00, Mitchell Levy wrote:
> Add an iterator for `Cpumask` making use of C's `cpumask_next`.
> 
> Signed-off-by: Mitchell Levy <levymitchell0@gmail.com>
> ---
>  rust/helpers/cpumask.c |  5 +++++
>  rust/kernel/cpumask.rs | 48 +++++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 52 insertions(+), 1 deletion(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
