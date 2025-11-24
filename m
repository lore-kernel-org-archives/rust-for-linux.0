Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB9E1EF09B
	for <rust-for-linux@vger.kernel.org>; Mon, 24 Nov 2025 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763949945; cv=none; b=Z9NCFT/DPPnSVzqNEUpk5mw4tYFmr/2Xo2LscfAUw6ldD56t6qM/90PxyuO/tlHsW9WwaWpscQku4pZ4njl8SXe7eZDBZxg7urjAd2AKCBqz7/cLUAdmRzVx0/RsxxeoYazTaWqw7Sii/RWcpYwC7vC91/zDIpaTMgNK7hWNWsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763949945; c=relaxed/simple;
	bh=byQsvqzs3+jJXLfXlRtgFq7/4U+Fvw8GjOACkOXEkLo=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hSMoMZSwQCwaNudM9HxBQYahMz5Tjy+P8Xhrlx0b8snKqKvrwyV9feRnK+85wcTjIoMcd3XJjp9SXws/rGaC21y+Xd5chxU/S3u+pO9A7ulyJX6VMYFB7qhj07B/7GkNXdchZIN5ySrCfwAA+VFlm6Lrp6AEmGpeyGy3zG56VvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmFwf4q9; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmFwf4q9"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso3510951a12.3
        for <rust-for-linux@vger.kernel.org>; Sun, 23 Nov 2025 18:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763949943; x=1764554743; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h3iOSMJ9zcmFH6xEZljPRpWDFCLxx5tCFMpn0x0652k=;
        b=lmFwf4q9wxy+e1saYew9D5fK2Lv7ZkHSloPW56SXDJCHJhg/pzcFxjdlR+1USG3qSp
         dQRozci5DQg5wKJgSDbAyQKu/qDD6FPLXlEi/GRZHsyUiy1buBU7wEL2hK/GBL6epYy5
         Y/ZZ0YEBPwOmXkDFsVTE4FbH3v6uEKhYDUQstjWibuQAyxGOG7kXjKedAgMQkf9moVGe
         wv0dvN76ezSrz3tcC3Bntx2XAaG5jiojSdi5Ffc20bnShiLI8Kl+Y5wYYGn/SNhF8kPv
         3qf1sv9aaUxcAMrsX0+TJIp2fRi6MgIAX7wTEUgvdESzdeel/9zb3SQhCXqRBCz27cAj
         AHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763949943; x=1764554743;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h3iOSMJ9zcmFH6xEZljPRpWDFCLxx5tCFMpn0x0652k=;
        b=Ra0vS3Jxf1rPI2hA1GGiVwJjXf/0CPkwI+43xJVwaYuyiHmKPyZ/uWRBoDRxwK1MyY
         Rl5E3Etf4YaLK4PwixaB9zbwfvfGr2yDASiKtICdvjQMepZEFpapMo0YWYJq3qQPe08F
         Jbdg3Rjp+Tc4WhUvEaIXrSckFs+DkfvBMuYLKWg1rmT23mmg2cA3UCDsDzLhL45hH136
         wpdAAjg2hsQxmkBieKAeOUKPx8/zdRYNFOwA3LPWEIcIWHuFwZsAzcnUIlEmEcsUC2l8
         1NwA5NQTfj65K813FnLIjeJFveXU//+wh8MlcH2Qfz1R4nxX0piNGE96HAjMheJl2p9M
         FP+g==
X-Forwarded-Encrypted: i=1; AJvYcCXNiPwm02J7P7d7+aWQHz9I1Zz/m+G48hGRkjcBk3h4/1eoGVrpzilT0tgiFq7CltzJtMNvhx2MWM/OmFx2zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzU4DJ+Hl0JJXoPj2968i5HMksEO+Ko76CN1VoWfqvXiW/iU35p
	gTDsqGpGC9biGjPFhhCBtxhPtJ8zLtP8hQfXMiOvev/kjW2aHh7OIx5r
X-Gm-Gg: ASbGncvK59mCqe59EJtFkygeIMAijln2YVlWTu0HjJExJzdP/unvmJ2EOiZbAW3K9TY
	nSWxsU5ssq+0eBjXwWB5Dm2r/BgP+VtNZk+lFmj/RUrg4w2IbXKJDbQZozF/7Mj+20cTE2fXFyb
	c7NUNPWCS65wKFE8BQMTyp8VO7ok3PR0awNz+1sEobCRMfsYuXkGJTWq5g7vn0PVGLapgW6XvYW
	eUzWcV1ttMDKaT9HwencMQN6k1zXiHhcJt7qjJvj6oWmTNHvOGsznepSsM0BeMSvkjxTGEG9Tv7
	NsZd251OJg4OdcPgq/r/tIODYk2rWChGEnQSo/QFUXJGW0nay433tzqw+CTPcB99Z22IFPTwHGq
	BO3CxkRZFKnOtu8hI6IaREPCqREDzo9KgngcE69ewG2hN+GB1kAzpjbgrdTWBVCbulIszrtD2Q1
	5MLWVvqQG8skCgnJphj/eArw==
X-Google-Smtp-Source: AGHT+IFKY3YdfCmC7U4vR5iWTGdpuOG0/GJ3f4HCetsCRvAfTLhehlcgrAWCqygjrtjCVf7VO3tB4Q==
X-Received: by 2002:a05:7301:e22:b0:2a4:3594:d534 with SMTP id 5a478bee46e88-2a7195369f7mr6681434eec.1.1763949942657;
        Sun, 23 Nov 2025 18:05:42 -0800 (PST)
Received: from [192.168.1.209] ([65.87.8.213])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc3d0bb6sm67099107eec.2.2025.11.23.18.05.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 18:05:42 -0800 (PST)
From: Asuna Yang <spriteovo@gmail.com>
X-Google-Original-From: Asuna Yang <SpriteOvO@gmail.com>
Message-ID: <6e0165df-4e24-4387-9b2b-3ba3df2d5095@gmail.com>
Date: Mon, 24 Nov 2025 10:05:32 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] RISC-V: fix gcc + rust builds
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
 <20251124-gcc-rust-v4-v4-4-4e06e07421ae@gmail.com>
 <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72nqzPiiefC6Q9C0_rzoS8saL_EJ5qiTpMhZtG8pAsmmUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/25 9:21 AM, Miguel Ojeda wrote:
>> Add `rust-bindgen-option` conditions for the availability of libclang to
>> the RISC-V extension Kconfig symbols that depend on the `cc-option`
>> function.
> This is now in a different commit, right?
Sorry, I may not have made it clear. I mean all these changes.

+	depends on !RUST || !64BIT || $(rust-bindgen-option,-- -mabi=lp64 -march=...)
+	depends on !RUST || !32BIT || $(rust-bindgen-option,-- -mabi=ilp32 -march=...)


> (By the way, I wouldn't mind if we started adding `MAINTAINERS`
> entries on who is maintaining particular architectures for Rust,
> especially if there is someone in particular involved with it etc.).
I had some contributions in rust-lang/rust repo for riscv64 (PR #131955, 
FWIW), and I'd like to be added as a Rust + RISC-V Linux maintainer if 
that's okay for you guys.

For the suggestions about commit messages, I will improve them in the 
next revision.

Thanks for your reviews!
