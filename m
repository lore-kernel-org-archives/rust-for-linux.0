Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF631EF38C
	for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 09:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747648705; cv=none; b=U75k7sFzxKflmXI7+IvtljZr6gcU+WxfPatGAgYquPP39Kwr6tWlXkv5eshPAmuIaf8eTWQQ8kJyFTGo2WhfYulQ7MehtZ29nsYfjo/bRZ0aan0jm5wYuDphbfqDMmDcsqgslHbzPz7WvbsjLCTk4unuPJQ9VQKPTDBz7j0i1J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747648705; c=relaxed/simple;
	bh=9ZrSYtXZNV36ReXjN1cyyFacq399yxsM28VasbnyhBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDpB/V/3PXaptHSAevJ/n46hym8eD8qcbmmrbHVHMgtlPnjmn7glAto3farXof4Dn8w5+h8s9bcScsILocM/LsRqmP/c/o8F1Wy2TuoMPrIjhMuNYKErgEEl1DYTTQssqvSabKvcll8qxWIW/mlWZMnJ6lIQhT+e9B/bEoLTPhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u3kKSL6g; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3kKSL6g"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-306bf444ba2so3986213a91.1
        for <rust-for-linux@vger.kernel.org>; Mon, 19 May 2025 02:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747648703; x=1748253503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8YfUtIKRuXb9JY1BcI3EzXnVUtQz9qLLJZfzR5tXeT8=;
        b=u3kKSL6gRqLTaHbYjSQNPjIj8GY9BRBP7V5Rcx3XxEJBAumzUlpR5Y1fs96DJk4tMI
         g/pHJKFd+TW0fOkd2QJ6AbON7yKY7wSKxY+Bq0TIGabL3bPSaEVdXK0KJaO/uQjawDkK
         R8qvaz/hZ+1ITvJsHZtWwI4EsQJJwwHcVmXZviwxe4T6cPICgbTDUh2Fe2EiLShj7oyl
         9M0W/eh/wuhrAz67FFb/RdLWw51Cyae1MFlw22o9/8U80W8+CYOV1wD/sGkwfq+0xqzl
         iIE/0W2SW8pFGTT0ALvAFvyyXVqerQaR32E2xlzYG31ULHtaalcruQL8MjfquVVIRxkS
         4Rkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747648703; x=1748253503;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8YfUtIKRuXb9JY1BcI3EzXnVUtQz9qLLJZfzR5tXeT8=;
        b=qoaOcwqSCApfmZVUFiR2WriNj80gvk+ECr7dDxQOnwxDvl+yIfgRN6n8UrHRvx9Q9e
         XPKQA6l1l6YJp79M6DmqukkT49pnxYlXb2UeQNTxJGuvxGSWYij/4P3x5Yg8UCSnWYcN
         Zs+EFw8vIcZZI7buBZ2l4B2IsXsuncjqG2vqDr2VCy2a9RV2tXB4QknfZuR28lrdMUKF
         La2SUgpTA9fhPEa2L/0sc1Rf8b51liv12lSJ5ha9e8LsBIQd+XyfFEwxQACEX7u23Wei
         IrRIGEAsQZyErJ9xW5gWUuoAjuw+G6pgt9SUI/I569lCSTDJJEdvc4nR9SRI1hRcNhdv
         hsug==
X-Forwarded-Encrypted: i=1; AJvYcCUVNRTPnOF1HlluU9p23EMbVaUVT/5KbFJRY9sdtYoP+17CWa7LrDwdsdM2CVgiG9Ibb1wykiosQ7DUwVhiPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWv87LV59nW9Gpz2ED+HY9MM/6Vy8WRb5LdVzcJAMx7Jkm1oC5
	EWgHBhtlX34Q7+guHmMW+D+qZWnv6a0Gj+XdTkqnAQj9NE33twJ792DQu9Zjf9/Nkvg=
X-Gm-Gg: ASbGncsp1ZNwJPOdbFghN7udhKB/QRVB/9mDof//rku1IBSQINDmQNHzRF8g4KtMpaN
	iJz/HUjYjBASUhMpzGuiGY/hA2powCYKjnGRF9crQKoz9NNhYMuzzflCg35jY+givARYB3M/CW9
	9J6Mzqu837IcNp4kh1vu34ZrWd1UiasiitOudy1rYR1AfAaw9LiPu1iO8flnCH7VApCPaV7NAZ0
	AuE/yk77Zxr9jL88fthD8rL5QUTjjqYygXbJvdLAh4zqX+t/OTqXu3TqXNbPJz7NPm0gLguO/4Q
	FMAITv47czpxRuMKj5VPaitXLO+jQ22dYizHnJdf5lhgKsv0gWG4by/j0ceCGcY=
X-Google-Smtp-Source: AGHT+IFuN4PIJtc43pQLr5XwTeREs6uTt7w0XKP4X6Augem7eTNNda+/TECXA7tAATZlEUrMWLMBag==
X-Received: by 2002:a17:90a:d604:b0:30a:9316:75a2 with SMTP id 98e67ed59e1d1-30e7d52adcfmr20450446a91.10.1747648702910;
        Mon, 19 May 2025 02:58:22 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26f0824702sm5331260a12.62.2025.05.19.02.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 02:58:22 -0700 (PDT)
Date: Mon, 19 May 2025 15:28:20 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Benno Lossin <lossin@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, Rob Herring <robh@kernel.org>,
	Yury Norov <yury.norov@gmail.com>, Burak Emir <bqe@google.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Andrew Ballance <andrewjballance@gmail.com>,
	Anisse Astier <anisse@astier.eu>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V12 06/15] rust: macros: enable use of hyphens in module
 names
Message-ID: <20250519095820.b2ha3ud2uddfjdya@vireshk-i7>
References: <cover.1747634382.git.viresh.kumar@linaro.org>
 <21b4c30db60f22d56cc6386a18564705ad3a6f4a.1747634382.git.viresh.kumar@linaro.org>
 <D9ZZ93ZGKC3N.9VGUE5QBJS4H@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D9ZZ93ZGKC3N.9VGUE5QBJS4H@kernel.org>

On 19-05-25, 10:00, Benno Lossin wrote:
> I think this is supposed to read "But Rust identifier cannot contain
> hyphens, so replace them with underscores.".
 
> I think we could just name this variable `ident`.

Fixed both. Thanks.

-- 
viresh
