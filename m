Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112B71DF98B
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Jun 2025 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750659736; cv=none; b=e3g6TV9JUjqqOi9BsPh1g30IwtecrQjOl6dhMI/QAbtN2VtZjV11eLzQsRHRW6J0M23OLo/XrSHPQgipRX7ksvh2565npykcVlXkdkYNTviNvatX8i5ugDL3/rhpjjRgRv+C00lyc+tMAHhHEl0S6zDzyZZFU/+lmJApZPvY1DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750659736; c=relaxed/simple;
	bh=0GviJ4C43LDU6PSrh2071vRUi2rtBfBORn6lykbuEsE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TvFnMGl+dAca73KiAspENyWGpvH2TqK0T19ZbzUC025P7vnvxXKs/TUUmPBExaZCSsFZDR3ZzYjKSAIcp1kY3OMC5fsxYt/jvJa4cwEK1hxZDiLkYHusnYfn3/lcm/MHHkP9zo+DqQ3e+0Q/U959mytcm/CMAttyCFIN7B8DuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u+oJqfox; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+oJqfox"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-313154270bbso4193579a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 23:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750659733; x=1751264533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjaVo7z5thcmzA/Idtk2W4NhEJVEWcJtCaNKpGwgS2c=;
        b=u+oJqfoxE1BDc1eJwUUis1/T12Yqa9kCGnmN2ISJ6NGL4Y90YTjNpLcrHWi2vC7sRN
         V7k7BJyQhMSUMtHnH7VwPrTi0ApD257hQSBDPWlbwRnnmV8VWzNUqcZH8U11ZKU+pE6D
         hW1qhi+Kr7GNBRRFQi35gamyh6WI7ysOV4gxCoI2xvX0CiY24IsIjPSklaXOQyTBaDYC
         knHRmrkvJebx7VBrgNq6a2PDzN/2Bx/t52idVdQU1St5ukmK1HArRMG54H3zBrnzHQV4
         QECnIgveaWKpT8qVfotGB5w3LBcIoVxWX+EHnrjCPB5r7gRk42Uw1BMb7mGARpZN5WKx
         mqAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750659733; x=1751264533;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjaVo7z5thcmzA/Idtk2W4NhEJVEWcJtCaNKpGwgS2c=;
        b=f6oQn0DZQj/exGOuzwUClplEYq4O3CcslerAf2tAZCYobd1FFuCVaJivLXIWPKPZlI
         HxWBHGLNn2JvwOs6Fwk3PXucTbmy/Mxs4a4/kCdIIVpChbCpxNMd3zGAiJSOPgsWmJiu
         CEt/GiSqYQOK0rVpClzrHbax8OUEmYDq3Zs3jy/I08heIf6YEcEHrI5pEzf2kyX5e57u
         fAKM3hNhcKhDBG7eNWghO4KjCDYzWT94bi+bB0ohD+PwW8p9Fo3llJ24n2Gaj9OhH+3l
         fZXcAfyv19tJx9DPm5eus6tamgUuTO1aKXp/C3fQcl0VoizQvZWtMevpPvFkHwTDre6w
         JuxA==
X-Forwarded-Encrypted: i=1; AJvYcCUNRKKJ9+fv/2pZl9zHo7Ruq6IYzc5n47KRmnuPz2c320ScYAwMnjNTDMZO65APf47A98g3zExik+GQiewVug==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv1MJIKmkpIMSyqo0KyeHVyCQjyV0Fjoqmpg0NzLcnWY7+6lbo
	V1CLRCuhv2qyoaJ/0Ltux1/mtFhB96LAE+mwDUEJxWoSCKXZP59rqbCcWngyHIMYjF8=
X-Gm-Gg: ASbGncu4mxHcpWdjws8whoK0qyNhyQZGsmvvZ3WeQ3mik6PqpdC6V4TJH7ooY2zi7Uo
	j1ffqiWQI8colrIofevPF6r3PRHXkLXf1sO3DE8y9tokU/83ToC7cTal50u+cydKARaoazP8Xu0
	ys60i7A/ll6n1h90DCfKy7BbRjx7YnNpTRMyCuKwlomzXmvUsr3Ao8KGHqcMBnwSQbUzXvAP0rX
	Devdv2XGcNBOdtCsh2NYulnLaup8aCB7IJmKPBWTwGmtrflPPh5e3oCYF8r9Df9fWTZmvEUhx04
	47+/y/Qu4xfqXHZ3m9OMm5RuhBZpTB81yCxz2zd/aKEhVUnByGiABrJ4HF/4Iao=
X-Google-Smtp-Source: AGHT+IHTC8DDc643Bby1AguMJbpjpU8RoaZSO7asfpNMZjv5HFpnG7zervZfVFZEkHAcEV/Plpb2eg==
X-Received: by 2002:a17:90b:1fcc:b0:311:b0ec:135b with SMTP id 98e67ed59e1d1-3159d8d6282mr19886141a91.24.1750659733212;
        Sun, 22 Jun 2025 23:22:13 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a3c9sm75875175ad.95.2025.06.22.23.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 23:22:12 -0700 (PDT)
Date: Mon, 23 Jun 2025 11:52:10 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Tamir Duberstein <tamird@gmail.com>
Cc: Michal Rostecki <vadorovsky@protonmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Jens Axboe <axboe@kernel.dk>, Benno Lossin <lossin@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	llvm@lists.linux.dev, linux-pci@vger.kernel.org,
	nouveau@lists.freedesktop.org, linux-block@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v12 4/5] rust: replace `kernel::c_str!` with C-Strings
Message-ID: <20250623062210.she33z5hfouu5jgj@vireshk-i7>
References: <20250619-cstr-core-v12-0-80c9c7b45900@gmail.com>
 <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-cstr-core-v12-4-80c9c7b45900@gmail.com>

On 19-06-25, 11:06, Tamir Duberstein wrote:
>  drivers/cpufreq/rcpufreq_dt.rs        |  5 ++---
>  rust/kernel/clk.rs                    |  6 ++----
>  rust/kernel/cpufreq.rs                |  3 +--

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
