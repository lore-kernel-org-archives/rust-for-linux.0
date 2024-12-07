Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ABC1459F7
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Dec 2024 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733566508; cv=none; b=OY3Wr+JxzpVxGVgp66pB1U3YMHnqAAY3WED/8GrdBV6/w432SLzEmsqrf3IAAqo6BI0lwLYcoddI6KySii1OqI1E3dwjV2YXSrxBmjuD72TJ2lRsbVb/4HR49OVH4fsOAoSYm/If/uD4Q+eEUo1y3lHwAIHjUDTTGrAg/Vky53U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733566508; c=relaxed/simple;
	bh=N7PAAdcZXi4j4vcHrnM2RRLxkONJyCqaRZbhJPQCyhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mu/t0iZ22k3zLzC4bbBjQy0pMTF2VxGngXpQ/J9AJHNRvVaR55gFBQdwGq0px7L6ac42fxDaI9q9E/gXD+ez+UhLKGcwxeGTpvnqayCfmxmHkTQCwpPs+awahqG43lsjFM2EiMDUxIJ0LIg9Hk4uUP+uMqUf7U8w+LtcNchSpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=jJ3cLZmm; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="jJ3cLZmm"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so1343067a12.3
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Dec 2024 02:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733566504; x=1734171304; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ObfMZ37SmD1QbR1Jv5JuQm+mGo6MMRPDunc4/bEgt70=;
        b=jJ3cLZmm1a4D/hudmsPWOIwFAtD0912TaAmuxfrf2Kl/bAD4EuWPP+S3juXxse208Q
         it6w0N0+SapjJHHHd23aR8KMLg373vXeBurhJBl8MHU0jl6qt7RKP3UkrPgaKvDQAA7d
         NY97a3VG/NzV1D77MlnR3Whoxi+f9AxLUcmAN16DtFprRO2uNzU3CMugpOhYmOZY4CbH
         XMovwRRe2EUDBaV1VAT8paOS0eKGse7hPF6JgkY9k0ty2LGklzwompAmZJr5yp6Wcql/
         qJWONrMZFbzH/7kjt1JMCKO766SMVxBjPjjd22NT+hMCnKt1iWQyPC/hhSg7QCM7L7OC
         rcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733566504; x=1734171304;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ObfMZ37SmD1QbR1Jv5JuQm+mGo6MMRPDunc4/bEgt70=;
        b=S8mzg6KRLANWc8y+fGwnPWj6qKhsO+WE+SbyMb4664jzhfALzeSBM+lSBmU71Gi13d
         QKQPE78qNh//xPtEA9n19KkuUBDCvHsBMk4vbuhzovFgIENmSSj2AQqUIja7toJ7LeIr
         40+YiW3mh6kNO/sJIN+PrImlUN6xKSITVzZV/XyidOuE6iZFOgodZNwvhOc3nU1hL89M
         KXUYIAYE6K8kBUBudpSF1l/ZUmXa0nIxw84PPBGdWw05g62nwX6PlWRNTG4iuQTgjE9x
         egcA3+TKv40XIHy0M8wDs7ucSZz36wmy/IyhkH1FxdEEqr09EMgJibB4gRYYSlwT+shc
         FiEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9JJcL38DPUs8c5/LXEOBT+4Ymrl2iiTKTvFm+1eRsgnUhkIMUz1dc3qIOIfPPEzHBUNjVrcbjOug53Q6OYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnMaje4SJfQPgI5030695juUwQMO9PDpee5NxXYXza67u0Khai
	IBFy1CT62g2+D23T9WduqIQYQV4zIM0p+s0SSCG8iSipHAWbweCJpH3tNEll23w=
X-Gm-Gg: ASbGncv+xzvFtEZlWNr8ZkGb42So69zzoLuwJMFg+QJiX+uajw6H57tatb89yS2jpuc
	3R5Wn7sYG6G0MLh5yPyvhF9QBypySXB9n/us+EIoW2D1G5g1QBsYtTbIOtpj6ZJYGXMbi4va5sI
	JSa2sv5n/QEKM60L+fUEwAwhZyPObqBCN5h2oKQt6KQkKn7Wk+oYkws2BRNdQiqsgulxwyd9t8L
	jRCdDTZDQ/5/eadXHWuC/9rXop3wjOaJDecCvEaLZGEMi2Cp4c=
X-Google-Smtp-Source: AGHT+IEqrtuo9wLe8auYpHiND4zw6vEIDKTZXy8pZhJR+nf10wlmcqvAIubi8QS9wcA5sqCFHiMvlQ==
X-Received: by 2002:a05:6402:2350:b0:5d0:c9e6:30bc with SMTP id 4fb4d7f45d1cf-5d3be688a3amr5792105a12.10.1733566504084;
        Sat, 07 Dec 2024 02:15:04 -0800 (PST)
Received: from [192.168.88.249] ([95.85.217.110])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3d51c3c4fsm1212169a12.64.2024.12.07.02.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Dec 2024 02:15:02 -0800 (PST)
Message-ID: <30ddfc7f-4b13-4caf-8859-2cd2e72ef878@sedlak.dev>
Date: Sat, 7 Dec 2024 11:14:59 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] rust: macros: add authors
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 guilherme giacomo simoes <trintaeoitogc@gmail.com>,
 Wayne Campbell <wcampbell1995@gmail.com>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 walmeida@microsoft.com, fujita.tomonori@gmail.com,
 tahbertschinger@gmail.com, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241206192244.443486-1-trintaeoitogc@gmail.com>
 <CANiq72neo_RtANWJu_GW5LxsR5KWxriS1L8nsXkNn7ioiaEQKQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <CANiq72neo_RtANWJu_GW5LxsR5KWxriS1L8nsXkNn7ioiaEQKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/6/24 9:17 PM, Miguel Ojeda wrote:
> There are several ways we could do this:
> 
>    - A single field, that only accepts a list.
> 
>    - A single field that accepts both a string or a list.

Since module is a macro, if we would allow syntax in the macro like:

	authors: ["author1", "author2", ...]

I think we could fight with the code formatting, because when it comes 
to the rust macros, rustfmt is often very confused and we could end up 
with variations like:

	authors: ["author1", "author2",
			"author3"]

or

	authors: [
		   "author1",
		   "author2",
		  ]

and rustfmt would be totally ok with both of them.

> 
>    - Two fields like this (that cannot coexist).
> 
>    - Accepting several "author" fields and append them all into a list.
> 

I think accepting several "author" fields is the best one because it 
mirrors the C API, where in C when you want to specify more authors you 
just repeat the MODULE_AUTHOR("author<N>") macro.
