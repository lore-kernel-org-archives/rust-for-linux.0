Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC9721FF30
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 02:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761100072; cv=none; b=f65Qbp3Qc7oUtAHZJnfhNLJasZzyIUH30RUmzBrbs3V9j33J6rOvVkGXQ1t2WejL3YVJeVJhRw8d1RPdk7eBL5wwnJKYEElyrfeY44JXR4jkOxyQHUEKV1QsimrAMju9gt/07/965+op7Aw2JTUdQmHQCuNFzDXUuczx/Jg8HC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761100072; c=relaxed/simple;
	bh=gtxXSsibCJLZR4eJo0X6XeizsPLCRJKnPsqSUiDcNsA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UASISn+h7hEGY9Wy0pvbiIGvBW1jPnT/UB02iLuGhqzqBrNz771WOqk2h0D7NDfAZODMU0z5HRiwK62S9M/IG1uJ3FSp73qHQH4RsuvBJFbtipu/ZwJMAlYIdu6ZV+185f+meyZtVoBk0ShXodtCZacgq3nKVe82oCXe1xWXjas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ns7datzf; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ns7datzf"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-793021f348fso5643188b3a.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 19:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761100069; x=1761704869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xqmP8PXFVjPtIGVNVJySqdODosEn/uc3qt8eNXsbPts=;
        b=ns7datzf8icGOKTONAAVfZEYX2gMWHAvcdFwbStWebO0Rl/Du5QVFmBnXqRSoiZU6F
         ptf5P7YAZ3aoE7s/Q6aHquXgljNMj4Z+TxXz/HRHggRHwGLOK6rVwuXlMjLRhzddmEyc
         /a6aU+en3DTez+1SXNrDFb3/tQ6sHTGk02umTReHZF43Y/BdECOHhJXF60IYCuXL+cJN
         NTZLYpFA7z5SJO5wFP7WkGsflKczPbG4jpAELRMI5vtL3D6j75XXzKArcmcPSy5dvNNL
         kPHckmZcRpjqHq1jtHBqc67JbXw2PwDBNFk0/Ma9yM29KWvHwFt4UmMzb3KAngK/Rsi7
         4FSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761100069; x=1761704869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqmP8PXFVjPtIGVNVJySqdODosEn/uc3qt8eNXsbPts=;
        b=g1HMgk95WgZ7X5N3HIsn1suDx+HmeHvkAqZcFomtn/B1pHDbn1WHkOh0yErWvBmvwZ
         r7RZKKusFF+Ck98vJzMcD7f3qJo2t67g+Kn2SgfpcAH/zQ0/j4Wb/vY993UhdyZgihQI
         xNa+Mx062AUGLBUNdFSUPxQfuYq3aYo3/u6K2PY3LV+2muu4eZMgKNkn+HobmutYPJLf
         fO1T1UVpXTmia3TzuCF3VgYS34vBeHpDI9zmkfAfvDVvl45QkVY6Vq5pmYBMDDzVXGLW
         oH9PZPGRmOxSh4/bqstmXAlpVtexpvPYHIuYDhLlZU3vOUllZNVq7A+PipnAGgWtICmF
         QSLw==
X-Forwarded-Encrypted: i=1; AJvYcCXcQr/q4uWn4AxP66PfoKNzk+CSsE6VYCCB9SrWkQVx5xCC4Lcyk4QGO+uP18FuUvLYT7BgQJ9+fUBJDBK/5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxR7hErIXpsBZP71pWtOcdpT4/IMOIucxF6pdwpBFD1O4gXe6Zl
	tv/VwFG5htPLa+SJgNCyCsmm4zfoAhgdqg3TMOHnRJqmQX8mSXVtwHGdU7QzhjkgoPU=
X-Gm-Gg: ASbGncsrWamflD0emJBpS1PmgJZucdNf3HM4dZ4ckRFl0bySZf6Pji+xEzvNFTTIxun
	A/ftM1nS+SbxsCwlChP8gEm1ujZ/eYuSL0j6Gh0FKzCHOR1jtUsi2WvXMDjfyG0XABtmnCmse14
	I13SbOBs6/pctxAXCifJK/ITsLE7uib5aGmqyUF8RWn0rrCYz66IFCuFcyak4jduLIQl28Qd8uT
	IWTLZVte0mMq+DB+UXuQBepeqC/n6hlfXc7dULKItxzZcqfAHRoszLUV0/HcqXbtJGFPsUZnyI7
	CtqHjRcS47sRh5Iu0egj20PsPGzHqlpmhCRTWRX1fJ8ldXP+ODhhXd5mcsjjxnyErcthMCK6piT
	PhZB/bbGq3tth89iIRTaUshmDrBAYpl7vwIfTk80AVQHOedHGYVPYh9iK0hyc8FLOc3Kp5S+L5f
	2qgA==
X-Google-Smtp-Source: AGHT+IEkOxWVQSWldQc/gAwbJEjuX6oOPBwr0g1WUs0jQjHOfnCn6OF8lZVM21AQiTMGEA1gGzxfjQ==
X-Received: by 2002:a05:6a20:9144:b0:334:3a1d:536 with SMTP id adf61e73a8af0-334a8536f36mr26023352637.17.1761100069036;
        Tue, 21 Oct 2025 19:27:49 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e2247a7cfsm940817a91.11.2025.10.21.19.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 19:27:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 07:57:46 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: tamird@gmail.com, Liam.Howlett@oracle.com, a.hindborg@kernel.org, 
	airlied@gmail.com, alex.gaynor@gmail.com, arve@android.com, axboe@kernel.dk, 
	bhelgaas@google.com, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	brauner@kernel.org, broonie@kernel.org, cmllamas@google.com, dakr@kernel.org, 
	dri-devel@lists.freedesktop.org, gary@garyguo.net, gregkh@linuxfoundation.org, jack@suse.cz, 
	joelagnelf@nvidia.com, justinstitt@google.com, kwilczynski@kernel.org, 
	leitao@debian.org, lgirdwood@gmail.com, linux-block@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, llvm@lists.linux.dev, 
	longman@redhat.com, lorenzo.stoakes@oracle.com, lossin@kernel.org, maco@android.com, 
	mcgrof@kernel.org, mingo@redhat.com, mmaurer@google.com, morbo@google.com, 
	mturquette@baylibre.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, nm@ti.com, 
	ojeda@kernel.org, peterz@infradead.org, rafael@kernel.org, russ.weight@linux.dev, 
	rust-for-linux@vger.kernel.org, sboyd@kernel.org, simona@ffwll.ch, surenb@google.com, 
	tkjos@android.com, tmgross@umich.edu, urezki@gmail.com, vbabka@suse.cz, 
	vireshk@kernel.org, viro@zeniv.linux.org.uk, will@kernel.org
Subject: Re: [PATCH v18 14/16] rust: clk: use `CStr::as_char_ptr`
Message-ID: <rd2jyc57e5p6zjhypnxkfnjwsnihs5tsr7r55qnuwbho5jmkxh@53grgiitw725>
References: <20251018-cstr-core-v18-0-ef3d02760804@gmail.com>
 <20251018180319.3615829-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018180319.3615829-1-aliceryhl@google.com>

On 18-10-25, 18:03, Alice Ryhl wrote:
> From: Tamir Duberstein <tamird@gmail.com>
> 
> Replace the use of `as_ptr` which works through `<CStr as
> Deref<Target=&[u8]>::deref()` in preparation for replacing
> `kernel::str::CStr` with `core::ffi::CStr` as the latter does not
> implement `Deref<Target=&[u8]>`.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/clk.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
