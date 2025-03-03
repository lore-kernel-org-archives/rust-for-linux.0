Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646F11E9907
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 10:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740996332; cv=none; b=n2U4zw8jTbFVjEkH3mtwsFivjXf3EyItZWX4hsJlN57w27tJHT1MdKgfhZ/KTRGtOiNQqnZCZJH7OcYzg3aO7Oa1oTQHod56YSW1uPJx3ou5/UrbBIcTPs6lU7PggQB/7ADD1pi0DAgFzgtrVjj6tezRE3aAOdQCI6SdwoGd1HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740996332; c=relaxed/simple;
	bh=7QyQstdhk1iCcfADNLha/6aG2uup2vCJ66MTtxh2nZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XZy9CBRuE0UlzP6DYm9xON4mfDSklDRFOzPT27mVo108aSoOH9Yo7jeSJsuePomK8sW1wEsC4jLwfoxPVg6HyPBSo23DLpqHyvnQr1Rigg6gnJWW1bNFVSiczfdWFHRGPCmI3WF4ae4f/TolXDoY4xQmVOFjVrS/q4bL9tQInrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=a0brHlXU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="a0brHlXU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so2534397f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 02:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740996329; x=1741601129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QyQstdhk1iCcfADNLha/6aG2uup2vCJ66MTtxh2nZg=;
        b=a0brHlXU2on+kl7ovToLUczsXU4U8kwPaZd+PkQlBdcT51KLmbcFyk8WXmNC5Id9JU
         jVKp424O8JTFpuMgYReujkGEZ4/W9b++mGMryJYsuU62kZRFjPyOJPgIwafLoTu6OJa/
         aJmVc/6kobfsq5QfM3mV/rvEE6V6ajHMBcyzV7csVOT+sKOKY4B6KkG8EBii153iqjkU
         VwayvXd/BX/eHY5mH7v3aIFl5CvcOk7H2ALFsCrq26M0+BQEF+Hw3kT2iKB7JS6B7rnk
         7R27n9fSJHTHui0z6wkapCp2B6KjsOUp/YTE/Eduo1WiYVd/Bcp4ExLmu1VFgqjRvSrA
         nq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740996329; x=1741601129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QyQstdhk1iCcfADNLha/6aG2uup2vCJ66MTtxh2nZg=;
        b=OAE7VGao4GmmQ8vO6DnzhdirLyuLTDXZUGuKdSNAR9LZ7rkgE0HBd4YJJE+jNu1Rbu
         +KorSg09PDvBy8fDrRNoZyyutUaVh7gIfbQoqpY6lWnTIN44/jhq6zGTwQfu3c25+qhl
         DRmWbusAVayku+0j6zbECfvxz1fF1Y3zTf+DpY0vMNnNr6HvVz/JtjQBh4jqFkv9rDqE
         gmqN3cRyPLZUA/qxYZ6zzcG1QS6JfnNOoiZGl15+qKe6LHVrGsNnGQypZt7GkL4Kb4IH
         5kMVnIzI/ZDPy5kVJXsWIuNHkkzYD4o8oYjmeDNqltQfYD8kU57ReAz05+GtFyhpedo4
         FhCw==
X-Forwarded-Encrypted: i=1; AJvYcCVmKSN7CZmKR/bfUIhankKaaPrNNyU4sC5NjHNf4e+mmVLil7eDPBwdKZPVJEoXMQyjpU78cUoBxAmzLNkqcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUlGjemi1UzbojFUSbFNWsr6kZLJezmWokkeM3mM4+1+NnLKz6
	7TUYfV4IMDhzFLLliMjHZjqMuLmDx4lBRb8NsSyF1osCa0ZMr6jQ/1El69+V2FO8XghQPBrxtep
	/2S1WYubOU7+/pOX8ai5xq1y9FT1bQSZGynKB
X-Gm-Gg: ASbGncsuU9Br4O/lAw9VmGA1dCCbRACln3Tqt1V6LASto/RZwr159h5ZBs/BJmYSF65
	FrxwIHg6WQcs8Hc1JyTg00FS97SnlAv16eXQ/h5YSinMySGXV7FlyW1q4Jct2RniK/OF0I5aS5s
	DG6X8NntiKSiHch0/pxluzAI/+LmiJ9u07aHfaqWelLccnw2UVO/gRDEEx
X-Google-Smtp-Source: AGHT+IFEmyW0EbB6Ka9yQFfGVEPvOJqwYCEl504db3Ko2DygqJYxclr7CKQSdflmS7+pNsrqn4Y5OCDx9d3jRQoSqPk=
X-Received: by 2002:a5d:64a2:0:b0:390:d6ab:6c49 with SMTP id
 ffacd0b85a97d-390eca138ddmr11915449f8f.35.1740996328672; Mon, 03 Mar 2025
 02:05:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740995194.git.viresh.kumar@linaro.org> <171b6cd811ff4e913880ab33bc11e634f7cdeecb.1740995194.git.viresh.kumar@linaro.org>
In-Reply-To: <171b6cd811ff4e913880ab33bc11e634f7cdeecb.1740995194.git.viresh.kumar@linaro.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 3 Mar 2025 11:05:16 +0100
X-Gm-Features: AQ5f1Jo64QlrJ8dyyVG_P39vJUDGWo2eEl4f6vfHkIrvzl7tE2S1Ro0v3PDYRZA
Message-ID: <CAH5fLgjNE7BF7fC6TxO3NjKV1OHXRxZFKn2Bs6fy8h_0zYd1tg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] rust: Add clk helpers
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 3, 2025 at 11:00=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> Non-trivial C macros and inlined C functions cannot be used directly
> in the Rust code and are used via functions ("helpers") that wrap
> those so that they can be called from Rust.
>
> In order to prepare for adding Rust abstractions for the clock APIs,
> add clock helpers required by the Rust implementation.
>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>

Did clk maintainers ask for this to be separate? We normally just add
helpers in the commit that need them.

Alice
