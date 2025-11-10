Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37B3194A73
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 23:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762817848; cv=none; b=pCC8YEqrZ7aMkVyEC+uPmKgoNuZNV5QEdtJMY9CjyK6xBUtazlevnP7r7cDhva0DtF20Fs3l4fcYZjY9c/yCxRX6Ja8e0RD2n8z02ph6imaAyiaLKp4IRkyDxSXKL8W/XfLeyp9HsH3+PjXGHHGgZ2EXEpqO71Aze/P2W1uXwZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762817848; c=relaxed/simple;
	bh=rXO4cV7y/7KRb7+PNQISNcMuBYWSEWB/8HSqi1ED97Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KmyRPJKxcPWoa0MPS27YJiJO6kdVDHvJ7c7ixlWsNsX47VyX/MaM/MlPwOTLKjaQVEQl9YWdXpzrcfnx4buu//bhY+pmBWnhBSTiyaz5fZfZ4wf/B7WdhoLXG1rWVLqPS7Gi9N6h9y4iaqrGN1Odr0hn9AqNJw2zCFUq9CdFyVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU4aKmJm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU4aKmJm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7afd7789ccdso3379883b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 15:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762817846; x=1763422646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sONTki0cwOLfaZkpfYHcU55+KIViW3n5GsMd/O6clDo=;
        b=iU4aKmJmPQFFu6HuGPy+dniFZzsRzu93Dztck37kZux+NCANth5dS/vn5Kf7tl1cs8
         8eDdYdJ7kqKRx5Woe7IEOo5m+4KdS/EQ6G9g/wVpwJF/altfX5qGUBq3hYXA1NXgDAdA
         kikT3CzIf85oY4pC/aOdq9t2PL2SwtLaQE5wQnqcMxJ1+c1TlL1ChasGIUmjMtZTXbMi
         G0KyCDdObgOvygJQge/6ovktyRI+joN0I7ZblWsQCk+tft329gQBzPU7TedOe3PERrk1
         MONBz4NxHCjuqQTIWdHtiHWF+KZDJ10mQBFn5YED7t+I4sFzPTziFLSPPiGq3Xw2Qwxn
         43PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817846; x=1763422646;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sONTki0cwOLfaZkpfYHcU55+KIViW3n5GsMd/O6clDo=;
        b=S6Jnv9gJhUpsplJ5hQGDM7sO2AbzGSKDI7uBoIUA9vW1rn2oi6W0Qc8JKMalwASATp
         Bhh3S1QPakglFQzvfEmcKcdJs06wP+pg8SRCLxuRA3VatpYhe6p0SlHR7EuHZ8HCSH1n
         W5Ba5l6QrG5RKaV+Xw1XwR54whKrrAoKYu1HJYAMcy0M6FN+lp6x3ft9D4Y4O08gqezb
         QLrTVkWK4wJT6NU6BlKHFyg/dxt22IJvD6CZnZ9ljDEY78h156FhsxGGjscYXo6kdxuj
         j8FGLrTWZ1kxXs2Kf4AEVsja167epReUkj/NapbGxbQVg1xB1ZXrxTJ7W2NejvxppRBC
         E3jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUamehB7Vm17qKCN8pODJCuQ9uDcN2rz7AvJwvlDMOOOcT5U9e1jcLMbmF12lIhvnRTurLMvjM1IFMPHdyrfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZdvZDNxBg6Oju46L8IoUwGAdGwD2STVDxkjvtpCApl8O2OIgo
	X6RAi/OCWr9yIZPPpKl+Ol3tWtI2YRw/bew6CFT/vY+j6lmOEsHQIB6KIUxGdA==
X-Gm-Gg: ASbGncvKBprqs4xTkPQ12ilGY5bkRTbOLvqucNK44y/qqb9kvUckd1vzoW5Zb+F4VOE
	PCNyu9ADgL+peyIGG/Iy+uhmYB3vFlkiwh1IQsLegsApcHIxLyveglmzKbqvbADi5yrKJP38IOx
	9Tom6m2SIj19LWJv9d+GfZWInFKorvysb0VTa41Rk0+xQP7E9l3g8ahIk1HzeFnWPlhSrluwq+P
	qL7FehArGlxPtZev1lGk9O/0ZeM3j1o8RhricVpOFt3har9zF8nvltPGhprcP8/U5ge5A1+7w8s
	xlu1O3utSdGHgo8S2SxWaMkQyozRDRy0ChvoMoWsIvbxeckpOzs/xNWXNhHPRLQanDJlwiY55S4
	XlpsjC0MBfsAxeWnOEAM9F2za/4uRKifgSgSwMlWmTh6JrJUn10dPNZKvukB6rTaA0rmjLH3H1c
	9Fgr4Da+2BMucL/8KnLaap11VxZ2pWa6lJI5FTjuE9LlObKaJtWUuMOpDBAuJkBHxF
X-Google-Smtp-Source: AGHT+IHk0TS6U1teQSHT2W5LJ/UoVkLAhqZnFd416dWAUwj/XxNWZoZkE3GEbfX7u/ERSkanItOk1A==
X-Received: by 2002:a05:6a21:6da0:b0:2df:b68d:f73 with SMTP id adf61e73a8af0-353a3355034mr14081651637.34.1762817846261;
        Mon, 10 Nov 2025 15:37:26 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba8ffd3f6easm14277596a12.21.2025.11.10.15.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 15:37:25 -0800 (PST)
Date: Tue, 11 Nov 2025 08:37:20 +0900 (JST)
Message-Id: <20251111.083720.572544715756974945.fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, tmgross@umich.edu,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 dakr@kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH 3/3] rust: net: phy: follow usual comment conventions
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251110122223.1677654-3-ojeda@kernel.org>
References: <20251110122223.1677654-1-ojeda@kernel.org>
	<20251110122223.1677654-3-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2025 13:22:23 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> Examples should aim to follow the usual conventions, which makes
> documentation more consistent with code and itself, and it should also
> help newcomers learn them more easily.
> 
> Thus change the comments to follow them.
> 
> Link: https://docs.kernel.org/rust/coding-guidelines.html#comments
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/net/phy/reg.rs | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
