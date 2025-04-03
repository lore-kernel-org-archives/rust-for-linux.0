Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594ADDDA9
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Apr 2025 07:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743667048; cv=none; b=qXQj0FRZK3FTS7dUt3LivaLq11r2rBb1FY8l9LyfNxJ3R/mG+K6bZaWi9NaXMtaFYIPQ2nDcLqP0dw4MktOYVniMxIKgtmcs2vgiRF+7optnfIOVu9wsgd5JOzolWkPZErhw6mhvKQ+WEciGWxh1tXbO4snuqb4Sfsj8jM1eQl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743667048; c=relaxed/simple;
	bh=ulZEU20t4pOPgUUCyNOsy77myQk/DUqd6pbMJwMzPEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmDsRj+dnQrxkejHoHKckfg+Dv4hFOWrSBgooEjQOjJ3Me2rTH9VwHlNdxTKmilAM/Yrz50BMuIo2doXfzB+N2mah9jDcnCOKK1pBJ7ZnLLKBWy/N3aNuCssH/uNinNsfJ6jZHMgvlO06dbSGvYYPLLkN5zzoySS6Rj3BG23/hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yU4RjSHX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yU4RjSHX"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2243803b776so9148635ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Apr 2025 00:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743667046; x=1744271846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tm5EsSWIqrkwolxwqlfjsnkuKZMeruFnGvUj7zCv6z4=;
        b=yU4RjSHXweA+JvTOPW26Q7hnUYQU/tcJMRK+Fo4sAf/2S3ZhnJVmWN4/p06fggOW24
         YoPEDZl5guydcS73lhzgBYfx0r3SSm/7/BN76aeqa2TVJdG3FVXmWfeDrrvRcd63Hz33
         w2Dpv2eGt2uH/mwP8/VuiLPoYzol10HUgSCw8giOObEEmwYf3NjDPV3G5TuBtzAeEG2O
         8p3b7MoRoqh8JT5+1EWewmrjlwxvJnouLLIH0+bv5XWXa4MzsmUFc1TpJyy+/Eef/mIx
         VYMqCQQQCXq5yi67s5qWfHiZONIRNGX6yZwhbRDXoaT19aSXoAGpuTCk72jlOhiClAsL
         YQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743667046; x=1744271846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tm5EsSWIqrkwolxwqlfjsnkuKZMeruFnGvUj7zCv6z4=;
        b=gjhm/gdszMGGtfI0WB4ti/CeqIs9+0nuV7VJ1yhZO5uiIoRfdqXltzPmtZUamhvzri
         I6xKso/VifiijXuDpNCfM8AN2j9x6wabpedFmPHDyvNAnxlXPqdHOYugIQyAxDeJ1MAR
         RyNFaOdA87qU2ldsnYkU7OATNp7eFqBaWgzTb9dr/tzai/yhpK9vQVWsD79I4PlLCaoz
         1EoUZULJJ/n5j4PMiRlvci24eWn4ZchqOPkG/Cq580zqkw7X+DIAPF8EB/KcNFXCHKQc
         N7rtZA6KUPAryic5edEaHUjTgt7fMrn6ggpAwsRXMeijAfxWGk9GML0Oav2xRusZMMpx
         vKUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP0oBj3mwiu28rF0e08TCYsofj1b64eg7J6kTfJ+C3x5RbgbOSxe7lStkBL0Zg2G4dc6Zp32r58muuBZ/Hdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ3986R6h+OpmZrG97+FxXECDW736wI4Q1q36TCOikW937eyP6
	/BGcvKj/2ebGVNsDIO5+c4wah9G3dqUaDY0AagNqbOafH/KOubc5iQeVnfLG6i0=
X-Gm-Gg: ASbGncvUithKCVUZW2xaPqj+5Namf3g6+z/S2D/vd28GQ48S6AHhBsOz2tHUeN8qsBc
	ZGXnxR2ylcOdBPdAp9EHRJa6wmvS0oeh++At2CjuT/NesyuJObPFFLLTLC60opIOn697WOKS9Rc
	dU/hHf0hJo76U5IR640Y5P40iBLXg0ddJP7vy4RCYhmjVDbGjr+iynghpU3G0YzuTiXIjrVxwEh
	iEdwlLiVokMGIooxpQXoTI5ySJFtKGoeCCxmsheGWyr1dluSkNEQNaXHCNifYuBNgr5fM7AlvF3
	swb9ePA7pZukIs9D3s3tbugq8F6EukPK5J7PUDa/vK26LRMjT93eLJg+
X-Google-Smtp-Source: AGHT+IH5BDfNgjBBdIX8pcMqnlQusnwGrVgvzsavmh9KRX7XN8rfs1J8H3JDZgZq58QV0YHIxQCF7A==
X-Received: by 2002:a17:902:ce8e:b0:224:1074:63a0 with SMTP id d9443c01a7336-2296c85f3c5mr80035605ad.34.1743667046548;
        Thu, 03 Apr 2025 00:57:26 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee5bdsm837235b3a.49.2025.04.03.00.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 00:57:26 -0700 (PDT)
Date: Thu, 3 Apr 2025 13:27:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>,
	rust-for-linux@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Burak Emir <bqe@google.com>
Subject: Re: [PATCH V4 2/2] MAINTAINERS: Add entry for Rust bitmap API
Message-ID: <20250403075723.v34zssaombavrcmp@vireshk-i7>
References: <cover.1743572195.git.viresh.kumar@linaro.org>
 <bf2d798034e5f2c6fd5fbc561a8bd19431e6a9cb.1743572195.git.viresh.kumar@linaro.org>
 <CANiq72nzrjh6S2bh0GQOKtjFqMcDzrBbtSVhaL-i1kja1zW3HA@mail.gmail.com>
 <Z-1RLYyTE7pxAyzk@thinkpad>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z-1RLYyTE7pxAyzk@thinkpad>

On 02-04-25, 11:01, Yury Norov wrote:
> On Wed, Apr 02, 2025 at 01:39:22PM +0200, Miguel Ojeda wrote:
> > On Wed, Apr 2, 2025 at 7:38 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > Update the MAINTAINERS file to include the Rust abstractions for bitmap
> > > API.
> > >
> > > Yury has indicated that he does not wish to maintain the Rust code but
> > > would like to be listed as a reviewer.
> > 
> > Will patches go through the BITMAP API tree, then? i.e. you will
> > maintain it by sending patches to Yury's tree, right? That is great,
> > just wanted to confirm after all the discussions if I missed anything.

Right.

> I didn't plan to, but I can move the bindings if you find it
> reasonable.

Sounds good. Thanks.

-- 
viresh
