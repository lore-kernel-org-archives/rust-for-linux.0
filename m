Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CAD3EBF28
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 18:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192130; cv=none; b=BybVZLSsemLM6TQ0k11q/v5sZUZ+Y2yJNC9xbw7Pu+mqWE899euO3r93MFvFAdWu/sSfJ6LLt6HEkLcpkY21w11MM63Icq0Pg15ZNDqJ44j2NKuTpB9HtfOpN2yGaHELWICYSsuAHmIdIuvtiNN3rVwwffyN7s9mmGMmP2rjJHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192130; c=relaxed/simple;
	bh=GeiVkoys+ZV9WCFIh+pTRLKwojT6VShoLOOSeXRMB68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cf+c/gWbixU5/C74xILzkXiVYnHLpLBTL22goonWOR+3um+f+SCwpQZMhtAmY0LoFoKx3R0RtQB/mI29BJwWWhUVevsLppgFmJlnZqCGPhuwQqTh1jj2MkRmzUG8rOwppg9Zhaex1wu06dBL3qaiU/VoE1FheHUDISBP/8O1opo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+VDZZxn; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+VDZZxn"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a35ae38bdfso3085ad.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 10:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769192129; x=1769796929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IohDYNeHkOn/d8TkWg/ylD9BddFNWCchlmynMRMxh7Q=;
        b=k+VDZZxnMZYiOqjaqAw5FpFZqRBVX5FQ+AuKWuFKPk7FiZlaVyNaZIEjDlZqU2e8oi
         AX1oeE6dDoHMnW+3PZiwtSEcQ+C5W4Ls1oPm2EjLDEPXSj81gspckTyqt1XRgFGugcIT
         XVElu56DwH3M1FyN+3XEnr4Cv2GyPjJMyLUYGelAfRM6Xvue3LQqawzVctDAGKbfSggu
         8cbqS8UR3aTxXZ9J4hunUf5TsBik0/3mfT4I1IX+hI/kaX0RotmYtxXXbr2SziKw3SiS
         W10HaoHg85UlTs46h0mEYLBYjdGMKYkVDfu2Oumk+Fy5hm5yCkZAB6bTFwtv2EcTOMpg
         FnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192129; x=1769796929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IohDYNeHkOn/d8TkWg/ylD9BddFNWCchlmynMRMxh7Q=;
        b=Q5nZnk83souBrcGpX/+tmz7/RVBTFsmn0C5fJtYKfQRr4xgBIqwxe1XdSWfrveLoOa
         wKH54kZqso/gvRdeSgAGn7Ph0ntfN694GuUzKhP5YlxZlFP1eXz6WyR/y3Os+JRqTqig
         1TO6aZ6B0d/qUDZbvfEKmejiWbQqYPGOCW7XTiwvxJI8am+6ZhKrOPJap83A3bSGIcv2
         YRrhZh3qj+tIrNcZgUTGs5biX+aUFwzMOag4XnLUAMJGXOJC2Jhq1FEiNSOXWCypv8Rg
         tefKGSCWQLWjWD2ycV2sYg0Xm9VmYcR2YcNPgh4C7XAmCxySlD7tTENw6RAuw01SzZR4
         T36w==
X-Forwarded-Encrypted: i=1; AJvYcCXuuY8mqX7545O/qoAtJJDGAFJTd4Lg4Y+Z0O+SaSM14OjXSg7xhh+7tLhxgBXvk5LAdD+pcVb8bzMIZ/e4gg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPMr0x19K9BUYN2lJdJTjSEtzaVv0UWBrls9MGToTXcwWn6F22
	Mpoipox8R6HWAasDjjHqCgX2exKo5Ho24mIhAslGypLu/UAJPllZkTe31Ij+p2yB7A==
X-Gm-Gg: AZuq6aJOCq9Xu2EEvdlaoITImaEfFAqH6WLSnkzk/NvUpmdtLU19CTRKcV5ENYcAXoZ
	G6tqKcTML38A3C2o478aiaXpxza/UQV0z84puBUNbLCad0bnP4ONPrkWrP8v9dT3GYGZBIC379c
	xZ6VQO8QzvOpx5hdrIrhztTRZswk//gQJIA/j06L4Q6/93B9gwaGHmQdlzvFvhuT5FuRoRHG/pl
	g12uDBnzPZFIXZWzegWNvs44d6/MuMpkj0a+n4ZMekHwcdWGI0071v7aLpWKUASHPKQGJ+Awj+K
	6ionFLzGP23s1raXfG8tJbfsCvjHRMq+zsFKxbMii3iyfRxneCJq/O6hX/gJlZB2OhdPrRdN9EL
	0mO3A/peqHnt5GFYHOFsiltcRr5UyT9TlXAM9rVMeSgCoBDSuGDSs0RZCqMJHrT+QmkcyYJPpCw
	mhZx+FBDmychN4+lqcpAR9SqRGrftRYVPGeWTWUAt06QKmaT/zGRSIXskPEPae
X-Received: by 2002:a17:902:b216:b0:294:ecba:c8e with SMTP id d9443c01a7336-2a82409033emr18055ad.3.1769192128631;
        Fri, 23 Jan 2026 10:15:28 -0800 (PST)
Received: from google.com (210.53.125.34.bc.googleusercontent.com. [34.125.53.210])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcd97bsm26088195ad.35.2026.01.23.10.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 10:15:27 -0800 (PST)
Date: Fri, 23 Jan 2026 18:15:23 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] rust_binder: add additional alignment checks
Message-ID: <aXO6u8weGao9S-c5@google.com>
References: <20260123-binder-alignment-more-checks-v1-1-7e1cea77411d@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-binder-alignment-more-checks-v1-1-7e1cea77411d@google.com>

On Fri, Jan 23, 2026 at 04:23:56PM +0000, Alice Ryhl wrote:
> This adds some alignment checks to match C Binder more closely. This
> causes the driver to reject more transactions. I don't think any of the
> transactions in question are harmful, but it's still a bug because it's
> the wrong uapi to accept them.
> 
> The cases where usize is changed for u64, it will affect only 32-bit
> kernels.
> 
> Cc: stable@vger.kernel.org
> Fixes: eafedbc7c050 ("rust_binder: add Rust Binder driver")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---

Acked-by: Carlos Llamas <cmllamas@google.com>
