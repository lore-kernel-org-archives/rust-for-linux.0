Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A15213E9A
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 14:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737556695; cv=none; b=mT+BFcJyCS6HI7tByCWXMmXMOfV8K2EVKGbPBHpv/LWh6I9dDuKHyxVOvOzPluX2m+Y6dkJ0FTPOfhucV8Bpmq8boPGy1mLnGn27E4Ao11wZzkL7T/h0IlCAeUOY9nTkI/8e1LZpqW4f+VKwzwnlrcA90PGPtzgW8cT82do33Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737556695; c=relaxed/simple;
	bh=mmUxMJ6D295FPfIkByhKohQ5sM9At8FovJKGVVwBaOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkXlCCF5lSVrQlUted31ySuLK3LcbcgPWqN6pPchzP5YPcAU8DZ4iPL5SGE2RGz3SOfVgDj97TL1mGlhd9a7MfMlhbjDI9JUYEekau3x7vgG3BKaln9KPJVyRAiahV4hVaFQFn2x54ndBclMYdbb7rfYnFTRiL+Ry+pKkgzwJYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wZ9kE0R/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZ9kE0R/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21654fdd5daso122454175ad.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Jan 2025 06:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737556693; x=1738161493; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A7oe3oxBlbNLrA51+/iZ7xTjxkXjstCHhMW3t6qQe5M=;
        b=wZ9kE0R/Pdx6Tk8fvq7mEhNXk0hTodv14JHu5dInJXksM3ozOyt6ppoTxaofn33mA/
         UT69l6AQxjRJ7EBJjP0bqJf+l0V/8DlzPSNA/B8oKdkmSwSfc/6H6Makdwb2222QSoLY
         Au6thnBJ/EjMZKd9+SFKBwZXLOnX7beWIXO/4dckMMBYo7MgGjrMJw9siGyu6gY5JyfK
         iqw/+mDzzcGeAiEzjjrlEdwaQj2CCxawaXyEbrzBAo+JW8CSkmKtCkNPrHm5DOLSipuh
         /G+owxqr6ta6gr8gnmLpn7wB6X39MRjfgFR0ak2DwHlgOHTk+ukkDEb2Agyx4yIOukV+
         RVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737556693; x=1738161493;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7oe3oxBlbNLrA51+/iZ7xTjxkXjstCHhMW3t6qQe5M=;
        b=P01u8zl4Fy0JULrNcJbk2f+XOGqTq/roPjlpxeCX+OEsk8p1GOQpSztDEaYAxh5tqh
         5MsZYUSzl9Ysa6kJk3ZG42FB8oVL5G6fK768azUkn8d2uIdMYOPeuW1ALnZ5T0sSjAPU
         EvwSNo095C4zS+a+X1r7y0/h4WPxh6g6T7TPbFdWUaKHiL4ORzf5I+405j/iCoFeQzza
         MLbUmzHjFv/8UE2/qUlCXga0TJ40cMiJxPoxgistBs3TX+1RiygS+ecwy8lNfYUJYFHI
         bLM1c//VO+ei/mgMAjt2ykCy2v+GCYemdX2F6trZnIwQXEOSjgDQu1vhW0ZXhui1ZsnL
         jiNQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7jQDRTNC/uxoDeYT8XhXlgqd+QMjtLxsjJb+rHn5bq6M/Mo1R565TEBY44gsXeeAufOkKNCC8fKqgetL/HA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLR3SkbSBcaBT6htwhmPF+HLv5/M6YrK3Zl1L8yMJwYrZpOnRu
	9hFqyavjvsQ0ln1U3hjzeFMV012bgM3KojcQiZnhhN93ffd570xY3AjvIVxCodI=
X-Gm-Gg: ASbGncuzdXWL2UWR1SNKk6DiEAYS0WM+2sFG7NJyh8nbXh4RyExAeGrUtVnWujq25SW
	GhQQf0oCW2K1PPtyhQk3+5iDc9r6DHrETyFe+/uW8SStAp9/HGnABlN1Tmdq22U7uXJ1Qyg2evG
	OfOJw/R8iyV7PwTTYIa8O7pHiRxlu61AXXWfKjhd7aqjdLC5b5anFDmVPZw6hafC/2yAKT4oPHX
	VDbvpzqmUpz3sT2vRrf+GvsqpN7Jb3mxmLmukerN2lT8Pl9SFzowgf/3iA3GzJxQ8Dbgc5t
X-Google-Smtp-Source: AGHT+IFEZnS24okXDcrrm/sT/fH0xlL4+dFvMOfgSXuD/OhLXvOPTny09cOpOIKKCXBB/6EhI64J0g==
X-Received: by 2002:a17:902:ec8f:b0:216:6d48:9177 with SMTP id d9443c01a7336-21c352c7976mr318465665ad.11.1737556693318;
        Wed, 22 Jan 2025 06:38:13 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdf0b43aasm10668624a12.66.2025.01.22.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:38:12 -0800 (PST)
Date: Wed, 22 Jan 2025 20:08:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anisse Astier <anisse@astier.eu>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: macros: enable use of hyphens in module names
Message-ID: <20250122143809.gpbhvz4tz3j547pn@vireshk-i7>
References: <20250122131812.466080-1-anisse@astier.eu>
 <20250122133952.501055-1-anisse@astier.eu>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122133952.501055-1-anisse@astier.eu>

On 22-01-25, 14:39, Anisse Astier wrote:
> Some modules might need naming that contains hyphens "-" to match the
> auto-probing by name in the platform devices that comes from the device
> tree.
> 
> But rust identifiers cannot contain hyphens, so replace the module name
> by an underscore anywhere we'd use it as an identifier.
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
> Hello,
> 
> Change since v1:
>  - rebase on branch rfl/staging/dev

Tested-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks for the fix.

-- 
viresh
