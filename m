Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5682DC779
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Sep 2025 00:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757636878; cv=none; b=ElTL+7wmbkNG8Uaho5fu4vy2bwtcutgrzmJxh/eZ4VB5LjI9FfhUQxb7+LmshBqvNZQYKSbXu+4RQzSnHlZxy0ctJKc6iYyaGyEC+zeEGOscJCRLeuJDsOAFVaL+t3gbj49luE+76i0q8IlNLErUaHnndTccNmLrmqr57ov+e2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757636878; c=relaxed/simple;
	bh=biGpY1eDM9VEF5ItVBBgOSL/52vvAvXvOEFZPEEHIq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tv/xYYFkdsuSanNvUBSlS82hbznSdI1GU6LYJIUbToo4smYmhL23FyO+u978pIxH7plpagseeQ4xbqst7ZzjY//sRcIH8IwjyczPs3v2A+8+FhYj0Wa6Relw8xcr5WPqocKRQZZ2XqrSRT5joI60IN523BngCpdSJTBHL/SJpds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j3UC5jYU; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j3UC5jYU"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-30ccea94438so915347fac.2
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Sep 2025 17:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757636876; x=1758241676; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Idsk6hlADPjxBpEO0KSCdleD5LRDgT/uF9HpZTys4jQ=;
        b=j3UC5jYUdHfeNohaGMNn/SduZyxoh4f8t7yXc219z2Ff0WTTyi3f/GHyQ15tT/cB9g
         GzvZhEtypryoDp7dmR4JrN12KHm4T6ZGcQn0zVzLjNTlmCTS8xx3C7bwwm9zsyiYtUwK
         t4AOtWTStABSxWv6NbiVpbrd1YZem9fACKmh3gBLVoKiv3l/dQqIekTIPOWHJ+fsmSFF
         GNcl54harqZfZpejwMvkdUb1YUNCBGCWJSC5cORYuIHaopfK5nTGIZv/lXIARtKPV4rU
         lHaYwwVfvW8QNLyWISj9/Pe9xef42hU/m4k7FSatL+ipibHuFP1rnBpye5mVbMjLxk89
         muSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757636876; x=1758241676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Idsk6hlADPjxBpEO0KSCdleD5LRDgT/uF9HpZTys4jQ=;
        b=t0NkgGvkjnPXyn1in4KQPevH5sIblA82I1vHb3cMgaG5CxlANsanRhr4NUsuEwEh3g
         C9XQJlfgu30nPa1VPDIrhdUVjsQHaiBDWQ3EJWCMGclWx6Y631YyAZZpF+rMYXG86AaR
         GwWYWJXj7u1JiOLKKzKTb2s6NLIC3EZbBbBPOEHxhO9OL8ZuLq4aeGoLuMiSWpsp5SO7
         P9mKnUm1fYt4yJQeHToWicw0YQUGEFbxQCQJpIprR799JeEDRuuzKczALK0hek0srvwH
         ktVU58SInzn00g3+DoM6E79Cpio0/JGpF2z8GPCDvlbXFH3UFQXqemm0RWqLThHwjWtS
         KKRQ==
X-Gm-Message-State: AOJu0YyGMPgUdCvpr8yBBXMfz2TIaZ8MAWzf79YBamgGefdTemcAkaIo
	fex7mV6xn3I67nWmIZzgc5m2E0JSId6gRULE7ZjIK6+8Y2n6D7Q8WTer
X-Gm-Gg: ASbGncvQsyPUmBkauKyBFpsCS7ixcq5Vts6aNLiR4OzeGXVPcGQEJH8BNc5OEcHAfk6
	uRwVL/ar5reJ7hBJVYnf+KZ7kHny5hrawIxsnjan22+npCOBP0o4KqOWLNbV2DdLPqT3uTxAbwW
	crmq/H8Ml8A6FhZcPaWRDGL2kEY62QCOF2TW+hrWbfhE/ficRG1IiUINhJZ3qqU67CN+JQwJcrM
	K+QZILEg9X9BkMw+VkvYXGRINajXwO6dhALEH18uWA1C/91RTySbCgVYIuL6MzcqtxO3WrZnmBZ
	eRqztmG6T2wTGttV84f9Vh2soxdcyOHmgeX73xkBqV4GtLlbhd8mlTc03f9REOmO8JZo5TxO8yH
	7/e8T29fw+tlpWwrxFgc671r7SOvFrefs31sueqBv2UAeP6Jz0ky/HyGkwKp6sT8SiK7q
X-Google-Smtp-Source: AGHT+IHrcApczyV0/Z9+I9D8KVdIGapYTwq8V/eMviOsp0VNX+SfApS6oDK1nQsIgH7gykwtKQXrCQ==
X-Received: by 2002:a05:6870:7d86:b0:314:b6a6:688a with SMTP id 586e51a60fabf-32e57801ecbmr424170fac.42.1757636876325;
        Thu, 11 Sep 2025 17:27:56 -0700 (PDT)
Received: from my-computer (c-73-136-245-43.hsd1.tx.comcast.net. [73.136.245.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-32d32d56557sm796602fac.1.2025.09.11.17.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 17:27:55 -0700 (PDT)
Date: Thu, 11 Sep 2025 19:27:26 -0500
From: Andrew Ballance <andrewjballance@gmail.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	John Hubbard <jhubbard@nvidia.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>
Subject: Re: Printing with overflow checks can cause modpost errors
Message-ID: <aMNo7qRCp_yprUAW@my-computer>
References: <20250911213157.GA1039411@joelbox2>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911213157.GA1039411@joelbox2>

On Thu, Sep 11, 2025 at 05:31:57PM -0400, Joel Fernandes wrote:
> Hello,
> Recently some of have been running into modpost errors more frequently. Ahead
> of Kangrejos, I am trying to study them, the one I looked at today is truly
> weird, below are more details.
> 
> I narrowed it down to the print statement and specifically the FFI call to
> printk bindings. This was first reported by Timur Tabi on CC. 
> 
> With CONFIG_RUST_OVERFLOW_CHECKS=y and CONFIG_RUST_BUILD_ASSERT_ALLOW=y, the
> following patch when applied to nova-core will fail to build with following
> errors. The question is why does the overflow checking fail since the
> arithmetic is valid, and why only during printing (and say not during the
> call to write32).
> 
>   MODPOST Module.symvers
> ERROR: modpost: "rust_build_error" [drivers/gpu/nova-core/nova_core.ko] undefined!
> make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error 1
> make[1]: *** [/home/joelaf/repo/linux-nova-rm-call/Makefile:1961: modpost] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> Any comments or thoughts?
> 

Io::write32 tries to do a bounds check at compile time and if it cannot
be done it causes a build error. it looks like because a pointer to
offset is passed across a ffi boundary, rustc makes no assumptions about
the value of offset. so it cannot do the bounds check at compile time
and causes a build error.

Best regards,
Andrew Ballance
