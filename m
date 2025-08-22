Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5072E2EED
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 05:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755842035; cv=none; b=WEgGXArg6IpKdWzsDrOEb54X6fr6hYlLQhq3uqp+MEZNWBIdqOgX4KUNnABIjehakltBUKYxOhnzq3ut/N6Vy6+1EtRtzWm1odaNsRr7WAFjbMPxqh+KeNVNYX2aJwFwVU8695BYIwvpG3Cxcw9rX3N98vYKxUTO5E9mTFdXOJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755842035; c=relaxed/simple;
	bh=4wc7/VqmVDfbilpC+4CI5l9qIomR32O2gKFjfvsNibE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E3/W3NBDa7Vvhb9B3I7T82wGvfAWHicUo/zJdEFEjKWdfbZC4MYG68FOp2Ppn9RbaHjn4S0i/EPE1zW6fhLNb9gaPaYfFa2pFDtzx+51G7E0pldi2AnPeIyCt20y56EkYT1mKMNwIrcgzkPdu0sSQuxiZ3QnAdKJ7IadypMFqdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NHnbbGFB; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NHnbbGFB"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24456ce0b96so18355435ad.0
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Aug 2025 22:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755842033; x=1756446833; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lRfMPsVFFjc7ryDHEvdpPmW3OI/EuSPBqar4AEujing=;
        b=NHnbbGFBgQIZrMexdm3Z4j+W+4QwNcCd/G32h07PtVrBS2ffFgtJa2FOCy84oXI9sM
         +jAldJjA6bAuNTJxc5J3B9xiKrYV4DRt7oegzLz+k+BbnQQXEqblyqOx5uOngtyIu8K9
         YZ2531sH2I0DEqTk/CWAPpk4DIqc/ij641PI+WOEseouwcyf/EU1nAwrKQLIRXI4es0F
         0XpXQUetUGxAjCitGp0a+ZZPKvsTBVvw9dP6NWsVLlIBk5vnGca4b5fr/rTAebBZhesi
         Z511LgOVKS2CjISXrNH40I9iiMqyf3nVkHVQVGmHPbKiloBC+BL7FezIEXd/i64pAZfz
         9ZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755842033; x=1756446833;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRfMPsVFFjc7ryDHEvdpPmW3OI/EuSPBqar4AEujing=;
        b=Hn/v4xyE+JLoCtdUo5/gIkxHzuGcA09T1iuKcniLUyT4pjB+0FlSj73yORaQ/zo3dW
         lCP+GGBjKk6GmPRJEmNCjvB9+zW95k2w0wNgVviscVpmLNL3EhWJK54Irco86gqIvczr
         mfYsaiUknZ7kdVRa+1y9iHXhg9C8OXnMNyC34bToB0jzh8VuQ/BumS81yQF+3lYsJVWN
         gtc47so6TpWnvEKljsb7l3TCiQBtgwwdZhVDe9FBMQo+DtB0FDJFYDoGhrvhIUxLERYX
         X2v5KK958J3HnEbm3jEiFPxCBDP83+vzTvEJ6Y/bIXvGYsuPzW1aYTUTfG7rv3Tcv1gX
         p0Tw==
X-Gm-Message-State: AOJu0Ywz4LNlhK8deTtF0fpAk88iM3Ndspvg5d2H51xpM0icahDR4erp
	pNre63p7LIoxSaqKpN3AnHdFM+FUYB6m/nk+bVDp25TCEWe1lWPFV9GH7gPs04Tj8Os=
X-Gm-Gg: ASbGncttjenYbinw2akYBYFJ3juiZzhbpPTbw1dvL5CvmhxML7weeX57690WzLaFqf4
	jNDNo6KcxxYpWqgDp7MZS23FX3riP+l/Z/Ut8GeHJZK+RGQx1Sp4u/kU/hADrGLYREXciVvudIH
	do15LeU1q3x7QeBCr+U/tuI+63nIdd32nfMTZHcULPYNpCkJg0G+IhW6HkHvtLfKPDFuKW6rMz1
	yvqNZg0MgnQ1ap1ue6TlatiU006vBUGvB3rMwtEXqPcc1rQzzaYRYLqfev/7uG2ljKVv8Szf/r0
	W3r5JIZyCEtAlovWJWCJbAiwU2KW2IdD2hNNGPH2DB4qdNrgKAyqDMohjJbxVNJjF9k9mnbj6ip
	YxlyGnHVrsFza6PNBuTrVtXJF
X-Google-Smtp-Source: AGHT+IGDUhRl59xu9W6ouXglnOGMNfVPExl8Z8m2MHMr5khzXc/sDm3TLhU4hJY5umoiXpIgj2VCDw==
X-Received: by 2002:a17:902:e888:b0:240:4d19:8774 with SMTP id d9443c01a7336-24633d6a31amr21624495ad.24.1755842033049;
        Thu, 21 Aug 2025 22:53:53 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed51b3d3sm72222245ad.147.2025.08.21.22.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 22:53:52 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:23:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, vireshk@kernel.org, nm@ti.com,
	sboyd@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu, dakr@kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: opp: use to_result for error handling
Message-ID: <20250822055349.6brvcxtljkz2k6p7@vireshk-i7>
References: <20250821091606.7470-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821091606.7470-1-work@onurozkan.dev>

On 21-08-25, 12:16, Onur Özkan wrote:
> Simplifies error handling by replacing the manual check
> of the return value with the `to_result` helper.
> 
> Signed-off-by: Onur Özkan <work@onurozkan.dev>
> ---
>  rust/kernel/opp.rs | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)

Applied. Thanks.

-- 
viresh
