Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BCA2701D8
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 04:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105707; cv=none; b=Vw/RK0EGtZ11NL6K2slqlmE2jd8XSJDP9WSQogN9sr5Q0BngFSS6Yv7C7aivM0FJLErknLX+CPfNpi36VvoFU3X54L9dG8sWbD7ocBHnpaiocV8v+q1DSnjSfPY8TGC9VNjD7uNW9fiMTvGb3UBO6DbGRp9tadSZ234YuOc1X74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105707; c=relaxed/simple;
	bh=9jY3EA5gEkdui7bFU/atDea6tp+oL2Xa05/E1ZXf344=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+HmVPzvJd+ZUTZHwVgE9vkvd5XoxdCG4O9s+J7xfnRw+1NMPG+MozCK0WuWgtFMEhsRLhUQ9upVHOQKqEIFaUNn2M2EsI0O2YGJ9/IF1VN5gzhSN/Nq5Vz+0UueXkNbjk9nhE8CDCS1uTCXH1gKCRlzfvI6MhKCMDoKoCHSg6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iFw8Gssu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iFw8Gssu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-27ee41e0798so101310745ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 21:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105705; x=1761710505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5XEGeI2U2r41+s29akUYCWbcwFKMTqkQOw+6CMAYMfM=;
        b=iFw8Gssub0rHLihQtmEQ/Py/Rtd0e0Q826rqACMtralrtUXw5FLLIuwfqr+fSyv3Ac
         1fH/5SRTMeCM9vG6TIoj6OFUS+O/s3PgFqMQXwqxleXqoIupf5/h65xAR9gv3cuSVElx
         PY+UEN8qoZF5rW0PVx6Ll2Yy6/DegeLAoSp5wA2pAO+k3HcbqWX6LWMM0sWqrnBntCn6
         xdnqvYfXboFd6mfCMC49Py0MmynGJcSmCWl2oqToAheHUCr8b3FoPmeTcLrlBpe6w4oU
         kdfx2KenWYD3Cqblcxs4S5JPijSu33S44Vq0qJHDlwFFuSr221qiGHJkvVBBy3Oal/Ov
         HToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105705; x=1761710505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5XEGeI2U2r41+s29akUYCWbcwFKMTqkQOw+6CMAYMfM=;
        b=gd8roPDsjH27GQsYXC2ZmU0uxKcjDJTt5caAjQMcqx95bs4EbtpWUiaTLR/JtMp/47
         KbUd3LqkAjVGG1uUPTI0IbIrCz+e2itWtk+EUQ3+e/Mu3AkY8dm6htyHs/fhCo0SaJnD
         O3fZL871hSE5Lo9848YnDxfy7IjhmGT7qwR54cWNEx90QvpaGqiF+F/VW0YqUAykECXI
         +DQzJoQJ9YBSmIXfrGtwq7E9Mj6rmWbNsQJoANyHZGkYLdaMmiRHHR7T2VQ97+lmD6gO
         H50Dypy7F13nMKHZoa63Hk0h0RPu0WpI/Jy7iZ/LSrqSyefwIUBM5GEvo2uaXJb8scYi
         E2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyuQ0o71zG+AaYxi37NqRY9vhamJnA1daa0e2CCT1zvxGRGrmZb+FkiLcufAGXWE2wi7MDVa2yeMwFV6LB5g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0AGhSiCCBoiGo8wgRfeXLtJPZSftptasqfgxRpjHA+flkr0Kr
	fguLlyiAOqVdjkQrLF04Sudv31YxSs/Lvw3g7e1r5beHMfPA4k8+ODwUQtQCE7uq0Rc=
X-Gm-Gg: ASbGnct3XxpbrwzroaXaZwiGnJclPhRW9Vc4csvx/xmImJ5ERRRcVrhhUwMqsCER6NB
	Z6LUIXqhKbXQZDTFoi0OUApoBsQv6Dkh2CIRIp0bPRdi80xDa5/9z2T2kZveFx0nWpX5RXZWvKE
	UxiBGjd3JSuSAiwk44DO9M8QCizEBhvxE9bUCPjhVQHjfr4eoOPvaChv2WCWD+FqbtTDH8/dn2N
	cU8+8LlFik4kmPnrIWJ34IwK4Qtmt7wKw8nMyD2Mig7zniZDqfq2Gh6PFMrV/ms3/B5L8hX7RIx
	Z3X+e8Q7eko3G4IUvm3t7cSBeuo3BmJRcfP1Jug3T02eNtox7Fs4DhnHp8N8f/YFkLYfcrrjQqB
	uIMz86x/f3RLlycY08/fFoOTm+CHwPmAHKNDrA9s80cXuSbvCbaezHnk+WvsCPVYWhlSaI2yhNP
	unZQKzWmNy8GF4
X-Google-Smtp-Source: AGHT+IEYWTGPLkVLKAMGZYnPNOk1bG7CyHUMxRahoDXL1MDVvSzLtlyzXLVhQRT4L6q1WhaGPTRqNA==
X-Received: by 2002:a17:902:f70f:b0:290:2a14:2eab with SMTP id d9443c01a7336-290c9cf8f2fmr233326615ad.11.1761105704778;
        Tue, 21 Oct 2025 21:01:44 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292472193acsm125225365ad.108.2025.10.21.21.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:01:44 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:31:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Arve =?utf-8?B?SGrDuG5uZXbDpWc=?= <arve@android.com>, Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Carlos Llamas <cmllamas@google.com>, 
	Suren Baghdasaryan <surenb@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v18 11/16] rust: opp: fix broken rustdoc link
Message-ID: <bjoulx2acrfpnqmwmnamunihzuaakyk3i6m3gvtcxklssmznt2@azfbrjhiedi3>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018-cstr-core-v18-11-ef3d02760804@gmail.com>
 <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gcdcwpotzidrksmsnyvesnojcylbb2fqpiue4fijhj2cmayli5@7lpyessslxka>

On 22-10-25, 07:57, Viresh Kumar wrote:
> On 18-10-25, 13:45, Tamir Duberstein wrote:
> > Correct the spelling of "CString" to make the link work.
> > 
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> > ---
> >  rust/kernel/opp.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

I have instead applied this one now. Thanks.

-- 
viresh
