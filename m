Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B37D126BF7
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753083321; cv=none; b=PPUGuvY1NMQ4S67EH7xQPdW7bt5i2g1lqooRm64dwtVb7SsB0qWDj2zAeBr/0uHGH0WF89vlGQQ/j9lkt0PH9ylJKYGyh0pE+TAOLHdTZDIX9d13r5XUI3OyGfaMmP5gUavB6iAmF2BYvG9FImwngKtu1TvHF+5VCsKb/ksXFUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753083321; c=relaxed/simple;
	bh=75yem3WjluK+t3HLkk9qsg5NT0tv+wkaJxCTWsY2V44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NfUb0CGFBrB5onNHwmCxg3a5dHmqFcFc1isvkThZVEZpZE1M1DQu0jbbNMZ6i8hbxZf6ywMfi/HgCMauOWKxNYe3/Yf9XYNS8PJ73w+XijUXUZVvHFZAGzv2u2+ChexyiMJzXxN7DhkRgCSfsqucKNlZAb8ABooEBA+ZyTGoV5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kGGSv0HF; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kGGSv0HF"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-236470b2dceso31114705ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 00:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753083318; x=1753688118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z5dBnPu5UuatkXMTVj9BGvrncU8K1V9rUHxc0C/1nEk=;
        b=kGGSv0HFtXZDd/hf8OoliuSHGqTcVMDJmtt+p69A1UB+zSfVBODkqmNY2aiPHYoJ14
         jKSpkiU4TkRSUkRSbw0Ul6L+xEDsIRhAU14VTBOpBdsVfZ7bDP/mYjfhawa56kHmO+yt
         VfYUKhjdZ2yZAEx7YrVTb7EJhbrpEa4qkk/D+9qoZPDhY9pwkq+GWNJR7AA4k9U8D+cP
         FlcC0hoB9s2ztApoLKJoZi4qBmhHvI9z5cGSCjJzgfSWVGJrSElYYe8wV54Z7Y/UyQcg
         GrZva1rov1N6CJUCRIDCDHOpo6BODt7/TRHIWuLhSAAQYB8fZ/Trcnban2blXlBgKjbp
         p/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753083318; x=1753688118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5dBnPu5UuatkXMTVj9BGvrncU8K1V9rUHxc0C/1nEk=;
        b=l/vrr9l0xV6jFuoNFcsbj1toEcNe0TEkK6VFXsXdYdVMxy07YHJCeXDLR7FBXLrdhZ
         c3jaeMrWmh0qCi70k5WKWGSFiCJ85Q4SbTQevVZ3pVfmkUXCH2cP0f6prVlu3IEKlsnf
         kFLUZsYP/EehRMayq7bluwzfN+Iea6HpX6U1VWpdQYIeYS2LJI2O2wvuZiAHLz1k6UiY
         8ZR6eK+0zjnIxHzWJoyxASir4bb0ZgU+RqdED48glu/VlVoFKVQhxI2LSP6hHkRGphyN
         tNFSCKpnXPm6k+2zvdcD1o5ZOs3LES3WO9FsIASUqyo41Gqyrh4l/BRJj/3yNZEsgnCF
         yUUA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Zt//h0HM5AaegK3vpo7LjRXpMDuOyi4HWX3+6QWNcPIs7wadA0/LLykzZk39CJJS5B5B20W/ERrq1nPe1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGpFjz7uWImgxWCehyoMd7gtmQ6yGidFS40wPMtTWSdoB5B+ZW
	Etc7DTTaw5SzctglQv+8sdKFPbIped0a/NPCM8JJ11E91jZJs+cvg6dx5xLC6AhQRBQ=
X-Gm-Gg: ASbGnctxbeTWHOR/153EAsxQDaUImKvuf1k8aRupAfN5nxZf+B8trPXwIFzAY2pOMqp
	KrLLwwsAOS1rZv9xS8F46lUgXjnldTOshqidT8yBtwf1cgi4FADGgG1UR1BAOwd4QzA80PY/zS1
	lKtg78mMBpdkWMrzVjgTRVSVc81u6ooM/Ohmv23W6MfupczUcbl1KqHmR3JKufdz5zkJee3e8VM
	em45vPi0YjpWaLaZpx9rZDzkcwBuNUzPbdu9wa/kq/kiPqrrOBAWKDm42RWzF9gQY+IoLJFJ2zG
	ii5OjRPrtscT0wGrOx7kjsNi5Tl9JDS/537oRZFwGvBqRbdF6OnDXfXQprE4IV30BZ6yXco2UMV
	pqyCwHRPI+CkZJHksB5adWUsY5XWlOaznDw==
X-Google-Smtp-Source: AGHT+IETNDRZoddMesKOQhKRvcZzakzOmMfiCHJxW7eO5wvM2qbmpmfxE8rY5ugFlkzEUO27/HUOzQ==
X-Received: by 2002:a17:902:d58c:b0:234:a139:120a with SMTP id d9443c01a7336-23e2572ab00mr258734915ad.32.1753083318367;
        Mon, 21 Jul 2025 00:35:18 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6d239dsm52577175ad.155.2025.07.21.00.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 00:35:17 -0700 (PDT)
Date: Mon, 21 Jul 2025 13:05:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 04/10] rust: cpufreq: use `core::ffi::CStr` method
 names
Message-ID: <20250721073515.2srip46utnyap7fb@vireshk-i7>
References: <20250719-core-cstr-fanout-1-v2-0-e1cb53f6d233@gmail.com>
 <20250719-core-cstr-fanout-1-v2-4-e1cb53f6d233@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719-core-cstr-fanout-1-v2-4-e1cb53f6d233@gmail.com>

On 19-07-25, 18:42, Tamir Duberstein wrote:
> Prepare for `core::ffi::CStr` taking the place of `kernel::str::CStr` by
> avoid methods that only exist on the latter.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1075
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
>  rust/kernel/cpufreq.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index e8d231971276..71d601f7c261 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1018,7 +1018,7 @@ impl<T: Driver> Registration<T> {
>      };
>  
>      const fn copy_name(name: &'static CStr) -> [c_char; CPUFREQ_NAME_LEN] {
> -        let src = name.as_bytes_with_nul();
> +        let src = name.to_bytes_with_nul();
>          let mut dst = [0; CPUFREQ_NAME_LEN];
>  
>          build_assert!(src.len() <= CPUFREQ_NAME_LEN);

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
