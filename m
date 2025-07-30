Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72202D97AB
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 14:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753886920; cv=none; b=hujoKki5i0m3Galg/NleGOmjVpt1yItB/MO9jhArWDI/FgqphPzKjP0FWy8oojoCSc90gx/g97rKtC2q5TXPaP34LOo0BQrM/QiT1ubUBoFThm1xTaCnWqlC1/8rUgZKUlNBefoxS1lyPGWj1D9HjjNl837dcsI1nUeS4iC17K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753886920; c=relaxed/simple;
	bh=4mghgj0xXZRMOa8OQQTs0VAQ/GrOCZpAVNjw5jYHVBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJb+ELfuKlLNzppTtcERt5S8VOjnpZ4NMhe8UtjyGT2AOD6NYuTKZOnIFriDwvyvlI82GEqpsjGxSA401GTtYue4JIt/bn4B3lf3aAZ/SKqD28m9c+s/+kglJEUWyiZJr3EN1sAiVIyEKaz9+feM+JUjty28edWLAq6Ax6P+P8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fYSJWg1z; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fYSJWg1z"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b271f3ae786so954291a12.3
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Jul 2025 07:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753886918; x=1754491718; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eK8YzK7uzNlS0kJpPPbP/f3p/NVOP3trKsIT7CAtwKM=;
        b=fYSJWg1z3upgR7mX58kGIWzE/MkbHsQvSCtqF3eCG7lyVcEp5t4yBujU+hiyvNqxqJ
         0yWSiR3h2/pcid4FTsNW3IwonfspKXoDkelAL8E9UV+GWjwxZTtCHdolKm3D9wkwSGoM
         nqn0Fg12Jwe1HieChZWaP5BhPL9WuWpkOfs6Va72C4DOoKNP8PJI9b00DM4jC3PyuYyg
         eYuLPXCj1e9jfHHnCJRQR8l7u3TVvRCQmhr5N4SyUFx+Tky194a0ihc9vuzWs8edyhhw
         FuNFPlpmCsQbIIcj4cfbonQbZv0XU0W60l5pWZTsKfieE7/NgN39HtQWvn4pJN5tIEbS
         e4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753886918; x=1754491718;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eK8YzK7uzNlS0kJpPPbP/f3p/NVOP3trKsIT7CAtwKM=;
        b=Neu4ku9G6Ob2nC9YvkS6s9YpAQX1Sd5e3pnjtbHm3m/+kIUN9pIdXAxROQnMpyaxnv
         yVOrAu3Ei98oS3eoMT6VycjkthN7EnsVJF4AX9qrvbXBFofbUcQMWdlwyg1/mlXoUxMx
         iO8XB2OtKhqxxtcJBxNMPx0Fpn2DMiACYTSzhC/eUHAWHkUcH4luotSA6B6CMAVlO8V1
         2oC/pT9ZjjMhfgMBs6ZEY/BZ8mI/Eag8zod0ZKGXspdw+Vco7SIqqM18l5ihvHYbo0DA
         Zy3EQIxK9Qa23ecSJL8O8mgKl80jS9RFWXcA9aBaU1sRi/NkoxcXAD9vv0TfQkME/JP9
         f1ww==
X-Forwarded-Encrypted: i=1; AJvYcCWdWrEsfk/d2Iz4qfEixZ0Byk8g/rC7EJ6TjHOHB9/6uVHvEHjT9tIxDSpjV5vunnhUEqwvsrgiqZOFxRLFWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0LDeyuwUI09m0u6/r5ZVfhGN2VXySo29x9eHjdPqpsAsE37/
	Mbl2+Ss8AdNiE1KbP9m8RjpctEma6UEPx5tY9KwH/i9We56qn4FGoKmjagJsDWOkhLY=
X-Gm-Gg: ASbGncuBA+POg0XwXzkeYWDYCXobE/8pIX1Qhy1gKeQQpju2f9fwqMA+3gSI0xEc168
	hd9SVZVih8an/v6QohlN0UdV5p8nIMJvxzga6tcjfJtb9DLn5hyxFmi3cvnlpR8x2qlHSKdCtBk
	0r2cEtMPKu+fQdblp65Vc63OCrmltDTrz6ZMgBHm7RPh8KbD+//cvZzLo95Ykqpjj4MoczEE6Mk
	wHqTJD1s7U3p+DOEMzXFIdr+2t78k0t+egoM3EGASidotfVpvKmkMGcUPEY2Wu2tZkRBSXeB6ij
	OnHKkw+wt4f8dMCdWDeejdUsvXoOYD1Z63LlWuDSU7IomS+JpoL0YJjLKydSYuu5YZ3icMknVp4
	fKHByKUpTYoucu2wTWt9M+Bg=
X-Google-Smtp-Source: AGHT+IHmCtoI/bWhXT2CXJZ8Yc/kzIn37kaOEzx4dcyEFnc73WRQhsLOgyrX+5HPgOGkzvXZtaUfVA==
X-Received: by 2002:a17:90b:35d1:b0:312:e6f1:c05d with SMTP id 98e67ed59e1d1-31f5dd891dcmr4980616a91.2.1753886917853;
        Wed, 30 Jul 2025 07:48:37 -0700 (PDT)
Received: from localhost ([122.172.85.40])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f0cb39sm2209790a91.30.2025.07.30.07.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 07:48:37 -0700 (PDT)
Date: Wed, 30 Jul 2025 20:18:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>, linux-clk@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH] rust: clk: use the type-state pattern
Message-ID: <20250730144834.63pnrsoyrmrkjfrw@vireshk-i7>
References: <20250729-clk-type-state-v1-1-896b53816f7b@collabora.com>
 <20250730062355.bqifrzvxfmaaugnk@vireshk-i7>
 <9746F6D6-488C-4562-8FB1-BE268C69BA97@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9746F6D6-488C-4562-8FB1-BE268C69BA97@collabora.com>

On 30-07-25, 09:27, Daniel Almeida wrote:
> What’s the issue with clk_prepare? You mean that the parenthesis are missing?

Yes.

-- 
viresh
