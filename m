Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28439280331
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 02:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763952136; cv=none; b=Cj/SP4hOFfO08P/MGmR/j73Sc/ZVKfJhYj2kTiQt31sNJsZknIwpaO2RTMyIL6/CbqM9JM5kaigc6lU1M0Sq9zGIQUggit184+i1/acGiNhrP5+A3Ars2YiQaZoJVzg7W5pphrzH125FjdY+oB5z9/MADANYlVMXKwO144cj2ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763952136; c=relaxed/simple;
	bh=2oubYlvBWNBRgKO7pXURZQwzgGqjYFhnanOmPBQoWHk=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JS3exqTp4FbcglXcRObjid0tqM9dErkdg+MMjtJG8RmDKtdt6b4GkcoMOAWqrgAK0bjVgkgmefNYWMOfysFy5+w8aACf/3+gkiAD2Bt/nlcBFu2o9om1pvO3B4yBLcQXAdmtEZFlqfv9sEVGf5hReNpoSO3bF+Innk4gBtVg0dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQWi2for; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQWi2for"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ba2450aba80so2169443a12.1
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 18:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763952134; x=1764556934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=YQWi2forbBqyO0pBJUMDQ5BiPQFH+WFMP6wB3ieyauAv1DkKmx3CART3dAT3mhSLhD
         mxHSkxtvtTeVv3iScROovCQztiuSVlZUTIWBoIwq+gty0n0HyvLFj82X/xXRLM8Xl+Le
         te6Oq6eEYj9UWGRk93gudUMr1Ols+RQahKAmfgG6jhFqyCajK1DGNcH5VlJIB4gl0kgC
         SGT2bMG9C7pQA+LdSR3nlQLTvzMf8fafOK9yX5YJgiGLafvgjOE9LQighOddP5spp702
         VOtNh4mHBebSMZ+kHaO05ASwT9ublC9E5/xEZBu1HCvi9rJNKyKepC3VC9lfXTPASVbJ
         3WRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763952134; x=1764556934;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DvmpkL2pKIFur0kWWa5PPAZWhiSzKqhwPQTIwYGauJ4=;
        b=q8BTwtpXLVarflF7s9lc9AwpTuJ5niKOuVevditqYH4tlb7WvaQJGKLtqV05aSSwgg
         zdBUuubyInezHmuCl4a3qZwtXi6dbS/SlCcPYZ5iFdVKlyb3uMAIu9Hs1sGLySSXK6gg
         zCkqzUuP2W2ZnMp1WcRRg6UDVKpg0wItSb1ulb9jEH8f9Un9/054Q1UU1V1MRJYcGP9u
         kvdN+xL4VJAMlfOmHbbiUXHKJFg/VurmS6H3K0eBpulEBov+E26i2+TKIcxmLRwk88L5
         a1xXveADwJyDMYArQ114xaXOpvrC0IqSshlHCezwnLVsAGjGzN6dbtsHFwEF8f9YIGZV
         SX+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU8SGDBJzrvPWtj92ZO9DdVnT2aaizj5reO47gJJ9JDm1qHwzQnpP1pPYS9GeMSQemOMmT/+8OY0lp9u+7Xgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOp6lBGy6dKx9wQY0v65cMB+XURjMSD7SO98Hkhom2tEvZfeJv
	Py9FggBjQnj6+J0FumnceTbHfyrH9UYz7ohyeCvmULURY5/mD8EfsaPn
X-Gm-Gg: ASbGncs+eOXtXvRXoxMzwyAbCthmxxHF+UWhKy7x/SvQ6uysyzR4isWjaZMalU7LV/e
	BUlQSlWymNMunX6GScOUs8+t9ZOxNUS3UIqfgQH8VA3928aZpkSFYZa3mdkTJcUWEb864YnRCJg
	pBk5wzUNKGyize/EaH+x+QA1tOBeohApUo/1U3dOBnC7pWHsvIL2G7EFiT1LM+ew7zTuUoFXrmX
	h8/yQ3NKtqKGzroJj0bWNk3ciHl4yJhOEibQpHXH3Si1eTnmPQd9r3qv2YRE+wrWINp8+wARdsJ
	vk2NzAesNxXnvGLo0M5NmJlc0WFADXFyRxLq+nuB8L0DGLGzApOUtaIqKG7fF+/Hrqn5wFrkihG
	lFSZW5xj9ctL5m1/HLb2moHrKKwTGL6MMIjz7753J3uiDVDDx8rgB52EfQXPZjtrB32OFk7jiut
	bC7JzGhgwLcA7yuftJGH0JNg==
X-Google-Smtp-Source: AGHT+IG1OvJ94QxB/0B5dUPh/eDPLHHoAzRcr/MIUUe+KPUWPK22zAbeB/idFdwPhcR+hgsYZWBgug==
X-Received: by 2002:a05:7022:f50e:b0:11b:38c:5370 with SMTP id a92af1059eb24-11c9d712e3dmr5385199c88.20.1763952133924;
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
Received: from [192.168.1.209] ([65.87.8.213])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm67907613c88.7.2025.11.23.18.42.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:42:13 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <ef617970-5539-400a-8717-dd96e82bf271@gmail.com>
Date: Mon, 24 Nov 2025 10:42:04 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] rust: add a Kconfig function to test for support
 of bindgen options
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
 Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com>
 <20251124-gcc-rust-v4-v4-3-4e06e07421ae@gmail.com>
 <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72k=XXRR6pw0Uhk89dmRHFYan6WzJhnDTC0T5oMYAaNnZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 9:48 AM, Miguel Ojeda wrote:
> More importantly, should we just have a separate function for backend
> flags? That would be easier and would avoid having to use the
> environment variable, if I understand the commit message here
> correctly. And, anyway, it is actually the only function we need so
> far.

You are right, separated might be better.

Another reason is, in `scripts/Makefile.compiler`, there is a set of 
functions with the same name provided for use by Makefile. Since we 
currently do not need to check for bindgen options in Makefile, I didn't 
add function for bindgen there. If we add it in the future, the 
`bindgen-option` function in `Kconfig.include` will correspond to the 
`bindgen-option-yn` function in `Makefile.compiler`, and 
`bindgen-option` function in `Makefile.compiler` will return the 
selected option instead of yn.

If we don't separate them now, for consistency, in `Makefile.compiler`, 
`$(call bindgen-option,-- --some-flag-a,-- --some-flag-b)` will return 
an option prefixed with --, which makes it difficult to use.

I will separate them into two functions in the next revision, 
`bindgen-option` and `bindgen-backend-option` (or `bindgen-cc-option`? 
Which one do you prefer?).
