Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAE5253B58
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764596119; cv=none; b=jDLsqGn2FscUHv81/F3OXLeQRAUIkBJN+UmO2oUEBZAFx3q6+kqkDL4C4vD5dUVLF6fI/G5IRr+lCSGjQQi+08nzEArkXrUo1y+u6g2/xLKydboGiCkPWEo222PhExkI1Pl1nS0Ejm+/F5549mgZKGzPcZTMTmfd/Ptpzff/eqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764596119; c=relaxed/simple;
	bh=Cc0cw1r89/FNN0rBpQWJICsFvF3Ys6XzjsGw09u4wXQ=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiy7KtlguG9KEThRq01R33BgktVFFs4337a2fOlQQXn3kWhQR0lrgE4aOIFqUifyNjRPpaPtDxBDzJ+Trdvoq2ynw4nrQ8p+F7HZIcTWIpUXSOhVRBkln5x+qeT9GzcHe98XUAWJaiC5whSfBeWF4gAkH0zFpiit2j5FqVCY0pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xey3YNj9; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xey3YNj9"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7aae5f2633dso5015644b3a.3
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 05:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764596117; x=1765200917; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=32by0sXyRe7xFfJRr8TdjfVx4gl6WuBkpcCTc1dwp0I=;
        b=Xey3YNj9uBtAcFGQ1ev1N444AFgKXXkK51C3OfT0AdkooGHHiGbDoV5252e3IAVRcl
         AD9xXlmKQS4vtY/9ANlT+t0R3x3UBYsvYL+It7njJBHHIopvG1GUW+sBiGHQzcugA3Tt
         v1VC3aiMlCX28HqO5AYCuCPmKmweM3PnCj1mmieJ2nKhIbIhaq8e0YhoZkCsqfY6QiRH
         hjIyi10zefjVhvmrwkBWvRzBwwqm6Whtflf8ATUfbSPldJMQ5uclTj81LISYfBAZGy0I
         loHLOdiguQUdGTlmzs5BJ1+rTtToiQGNnNp9SugM8i2nnUhvqlX5Wcpm210dwEvhPtO+
         nmwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764596117; x=1765200917;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32by0sXyRe7xFfJRr8TdjfVx4gl6WuBkpcCTc1dwp0I=;
        b=tCRXPmMg03Cr2ezswqROmv53oC/t/hRqPyM4+g4oio+V2Q11Ma2Fkl9jtWNIUmKzm0
         UsBH3a1kzmvdPHuZ1A7MbvHC1OSNKv2JC2ebgQgY9IQRmimQkbznL+3vM4KaLUWtHKEh
         5drslECz1o0h01gcOVZUDvGuLZ37MXrKvnVViwp6pPuCLCnAuDltyLOvZ7QAlApzTEQv
         NppTJtwq00ZQskLAKYCV81yZk+ptBliP9UzOKl5987wY8Dxo3QHF7vLqipTRRrN8Eq2x
         M0+hpzTzJqTDr8ojJ+FggjRCtOJJf1DBhy1Ss0wkL/Jg9LCKk3ZPhUBzn03xqB3wtNqN
         1EEg==
X-Forwarded-Encrypted: i=1; AJvYcCVzrJj8CVYHlqCWAibSLJYqUg4lUs+JzBMCxCHLuz4uf5oZ4WyV6FelvNj/LykwgvVuzV+ewboAQ4+bBzsY9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YykA0nJsi1hXfu1pQlZ632k1q4vC+TZwKEsIq/KfOwrPm8aqEH0
	IJaG6D2b3zmlXvU7WLXA8xks5Eh1FkmBwV+CW56/nSh6qKzf9f4kuCxS
X-Gm-Gg: ASbGnct9VgTkMkUwPd2tLAwI4etsn/jDVUMUL/NXLJptALJB8H70bBsgI6h5y/B9Sky
	nhxxiF62lU2lGKDw0dFksvDUJtZbCAmk+kyBzhwuGR3JlFPSh99O4kfN2u/0SDUC8ELQ3CqMvmZ
	/uUw9rNFMu+xw3m1EcXKrLzV+LkdYnKAeE3dup1i8wY9W65vijzk9kePKBIggZCFlLdzEbNKlgw
	ANj54k1ZdWNaCKQgAw8D6dl9LNVXMTsyOrlWoB4adkj9ws80BzlSp4yMq+gFMZTfkJGmvNJqUUA
	HCccZcWMA3WI11aZQHm+DBqHqDaighFOs8F1/aN7UDOHDgz6ju3rNr2IzWoUlE/g/0WtfOWUEUk
	5t+TB9rxqa8Z7GVOTECdcE1cF6uLuyhYgB5t0vdISVRQzEYq5luLuRSm82z6fT7Fx2uMu2W1YTD
	BB0L7j5gQ+QqiB8xkRZSiUJOPa
X-Google-Smtp-Source: AGHT+IEr1UzXzBWL/i/cTExRaXs3rQXcd5Z7iFAXTqOYVH0uKL/M+UFvPWbESlI6UFHldo1xUsVOmA==
X-Received: by 2002:a05:6a00:2183:b0:7b9:d7c2:fdf9 with SMTP id d2e1a72fcca58-7c58e113a7cmr43258024b3a.15.1764596117393;
        Mon, 01 Dec 2025 05:35:17 -0800 (PST)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d1516f6c47sm13634001b3a.18.2025.12.01.05.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:35:16 -0800 (PST)
Message-ID: <692d9994.050a0220.d1d07.6e65@mx.google.com>
X-Google-Original-Message-ID: <aS2ZkoCcfInCPh6o@yuwhisper-pc.>
Date: Mon, 1 Dec 2025 21:35:14 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: num: bounded: add safety comment for Bounded::__new
Mail-Followup-To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
 <CANiq72=MfmAKfV7GGwkyNVZfmtcxdvCroUCwC3D4Y0dN_f70CQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CANiq72=MfmAKfV7GGwkyNVZfmtcxdvCroUCwC3D4Y0dN_f70CQ@mail.gmail.com>

On Mon, Dec 01, 2025 at 01:44:24PM +0100, Miguel Ojeda wrote:
>So typically we have "fixes" or "improvements". The former ones
>typically have Reported-by and Closes (and others like Fixes), while
>improvements don't (and instead Suggested-by would be used in this
>case).
>
>I created the issue in this way to have you think about whether it
>should be `unsafe fn` or not, and depending on the solution, the
>eventual patch would be considered a fix (i.e. making it `unsafe fn`,
>since it would not be intentional) or an improvement (i.e. documenting
>why it is not unsafe, since it would have been intentionally safe).
>
>Here you considered the solution to be that it should not be unsafe,
>in which case it wouldn't be a fix and thus those tags wouldn't be
>used.
>
>The solution to the puzzle is now revealed, and indeed it should be
>`unsafe fn` (even if it is private), so it is indeed a fix (but not
>this fix, of course :).
>
>[ In particular, functions having unsafe code inside of them is
>orthogonal to them being unsafe functions or not, e.g. you may have
>also safe functions with `unsafe` blocks inside. ]
>
>For v2, you should consider what documentation you should add to make
>it `unsafe fn` (please build with `CLIPPY=1` to check) and what others
>changes would be needed.
>
>Thanks for the patch!
>
>Cheers,
>Miguel

I previously believed that a function should only be marked unsafe when 
it directly operates on unsafe code. I now understand that the decision 
should be based on the actual safety implications rather than just 
semantic considerations.

Thank you also for the clarification on the tags. I spent some time 
trying to understand them, and your explanation is very helpful.

I will address this in v2 by making it an `unsafe fn` and documenting
the safety requirements in the `# Safety` section.

Best regards,
Hsiu Che Yu
