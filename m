Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFE02D23B1
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 03:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761105103; cv=none; b=tjKFpIKJzbwmWqNsCF90u5Io8L9MboG49TfVwFfD3CLuu6lgLTqoy8dunRhIl1Kk4o7cSFdceG8hcYOriblBUK6qDKu3of1Ew/l4dAXxy64aAPXyONRXsujo+7SXFxE/X15WLghUEufoXpo+hcaPf/qBdtZ15xL0zKvJoKphHKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761105103; c=relaxed/simple;
	bh=pdiQSk4Fi4cmsTBMiS+1YGWGFe8bT5UbTzQTJFqBPdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8Ptr27n8L/F8kSMCrbCYteOSHEXKFugkSQAFZK2W89bdoSwmJBR8aRr9sCUdnyWj3jTGHvz3JhYy4TfQxZQspNxrtJM9rApyYaOsbH9kwiY/9JCn+63QqIoh0LfYrBFn9VlJiv+mC7DyzFvEQ1Pvg11PM2BQGU5jFp4JMhjz/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IYuErM94; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IYuErM94"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-290b48e09a7so76527565ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 20:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761105101; x=1761709901; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l0fINMYlT3Eigm/x3CBbhagxF515t1HkjauS4M0nlfw=;
        b=IYuErM94ZCZ96fer1GDzVG7kbT5n01Jv6VhLUOyecetfc3kxgxecAjbjnBqsYG3xbe
         q1rnD8xt/GsF5bIFqE+GHGxz569MMst2ru9zp1cakvADmJwUnC5sqBAOZoKhg4JuJMvI
         cI5Pw3tkfc+UodgDUo0VysGiTPWACzP4ZOUVX5VJtGnl5bVnUeU0/9Mywru+kl2arF/o
         M7iXMu8jSNyuCaNGVaR5ktJtPF7GpOOg3Qmwdctv/Rn5dxL3P0k/H/+dnw/CZUpjXj/1
         vxVrOqhA7FXO7P6hreXFmbxNcprfNpcdQ7qWFy/mjObI1BaFrY2BdFWREkQ0tMc0MsKx
         2J1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761105101; x=1761709901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0fINMYlT3Eigm/x3CBbhagxF515t1HkjauS4M0nlfw=;
        b=ddoQwXf4xkgfs8rnZZaYAg8uLG/dwlEHyLg488umn/1nTzLemnHz3B0G3fi/+6Gcrw
         HdQIqlhnJnI6pKycZi5Z1+fy2UIyHpirM17oNSmQsAhLyLO5msaWPAltbz9Bin3Crty7
         JaWVDkO60fHlfN3/vhv+FEoJpO0bFqi1Av28gdMRbMo1rcpadBBuuCE34SglAl0rxAFQ
         H1wqtNFYPrZ9SGhnHiREfW83TXP+5UzKBHRZkdiayl0foEwVY9Bvf0ZlzJIJHjjoxEck
         56LtKTiKM1cMXSwM71PGexzcza8j0q1pHI6U4LPHADzv/bTYb4Zvw8/r6zg6Oerg8Ddq
         29zw==
X-Forwarded-Encrypted: i=1; AJvYcCX6PAKDARg402hR0xTlzMCYqjtRZ5EN6/PNhhjkj7Sn3wcmy/n+AxrGpJZVJq1ycaJ65wQf5+yJ6YpMqh7ERw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQB58rusgwiMXvNXuAXYUDNwkt7o56ZeFjxhKE63izwHyyxMmM
	w7kNXPLyJpEWdHuCGrZgCc7Z9TGq70iDZ1evjz1hRuQpnCQ1FSLU5PKC6yjzPhLWgUw=
X-Gm-Gg: ASbGncvSMfzT6JDwFWuHfJ7QehFaIcDmz85wKs1bqZ/KMudECFxavooZqTwGNgoVmN1
	CJ35xUtfMfnl3b5GPaaEyVqicGzbCIq/8eRKgj144x4bo0ntbrFTnAIG6XH5lJwOF68mnMTQEhc
	oufggsBbfX9O7rUh1JzE7EWMQv+FDO5ozK6BP0wPyfJCCZeXgnmhgL5tlQy7S41ZzMCGonBHLcj
	d5dUIynJhY6JCOlib+XaBk2kK2MKW81LJO+gjjk7gq4/WJEnk40CPOURWM7D8Pvjj+zjTbtnIK+
	DWfRmMHieoVAuZ3XAHP1aBCuj2GsyRZ7lQa8nvf3avL6Uow2WicsTEXmwx3JSMFq2S9wU84ez98
	7OBSFcsffiw3Hz53phe6wGGsLBCrXxIB4jnzIP7z8KG1v96FftJioRZcVe10EgNsETfux/+jGXK
	H6TtqWo0svna1H
X-Google-Smtp-Source: AGHT+IGDciG6vViP4hTgCaODxmJIH8hJ/wjl4CRNsOUT4mlkT/H7ue4PN1kkXs0mzWXK/CzHz1MOqg==
X-Received: by 2002:a17:902:fc8e:b0:267:ed5e:c902 with SMTP id d9443c01a7336-290c9cbcc96mr256553125ad.20.1761105101098;
        Tue, 21 Oct 2025 20:51:41 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2924721b6fdsm124657385ad.118.2025.10.21.20.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 20:51:40 -0700 (PDT)
Date: Wed, 22 Oct 2025 09:21:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rust: clk: implement Send and Sync
Message-ID: <ghaqgzgnk6mkv6tm4inm2e24jyidsk7qhbff6zwc46kefojw5p@3jvwnn3q4bxw>
References: <20251020-clk-send-sync-v2-0-44ab533ae084@google.com>
 <20251020-clk-send-sync-v2-1-44ab533ae084@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020-clk-send-sync-v2-1-44ab533ae084@google.com>

On 20-10-25, 09:35, Alice Ryhl wrote:
> These traits are required for drivers to embed the Clk type in their own
> data structures because driver data structures are usually required to
> be Send. Since the Clk type is thread-safe, implement the relevant
> traits.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  rust/kernel/clk.rs | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/rust/kernel/clk.rs b/rust/kernel/clk.rs
> index 1e6c8c42fb3a321951e275101848b35e1ae5c2a8..0a290202da69669d670ddad2b6762a1d5f1d912e 100644
> --- a/rust/kernel/clk.rs
> +++ b/rust/kernel/clk.rs
> @@ -129,6 +129,13 @@ mod common_clk {
>      #[repr(transparent)]
>      pub struct Clk(*mut bindings::clk);
>  
> +    // SAFETY: It is safe to call `clk_put` on another thread than where `clk_get` was called.
> +    unsafe impl Send for Clk {}
> +
> +    // SAFETY: It is safe to call any combination of the `&self` methods in parallel, as the
> +    // methods are synchronized internally.
> +    unsafe impl Sync for Clk {}
> +
>      impl Clk {
>          /// Gets [`Clk`] corresponding to a [`Device`] and a connection id.
>          ///

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
