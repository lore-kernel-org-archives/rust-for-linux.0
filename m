Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40B40FD9F
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 13:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767880601; cv=none; b=E1cL2uUGVPUl+AbZD5O9irNIH++V+uDzJp33KNTrFpGft3z1dT0DsL5NlWVopOKg59okwGvSUlQzSUNsw0HPc0wNG1tjtPhKT2yh/XG9bf+9hOldVMgBXaBqhgARD3SNEZKz0PK/T2CxEjzqwE6vDae6zpoz9bjH9X2NRQHY86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767880601; c=relaxed/simple;
	bh=fPPPbUJkQ4+IX3VALp8am8G9a9TOEFKO/5P0HygmaU4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WZWUcNsGDe64VRKqEGpt5L6Fqd6QOxTbJ5t1pRSbm3nVguMCUEDRAaLo472jzU8P/vJUrd/co9bZHA1zdJ0t6MEWtA6PGGBSR3FLx9mMvt1LjafYnVX5T+fRO0ilAyouMZhWUjNFw2HKRKfD5kDR3ZoUF67edxI4ot+XESF96lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64472ea7d18so2396104d50.2
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 05:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767880597; x=1768485397;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mCQ6woFsUHpMLtRLuq9gP/vCcs+VuUpNB9iIDA09exU=;
        b=Ydm7i9qV/DNsWsmNUeRVcw2lbrCu7S5pGTl26LoLvRxmKuWl4RnsxvNFm5OsjaLfy2
         B9iJoYe86Bah2ASs478poSPeodR01j9h6fcjP5TAtnvV04RZq9/jFYe+xQEQ/9gXfNlW
         20Xl8w+47JxNxBt92gONpFFFwiDNN0hmGfFsrQssrDXKMNMI4U/HUaym/IwZoruqoN+r
         aDV3YEo6aWUyUgLHosxLRxtBgouVTCdupUDaCxTn30dewegdO9IF+97TazN37uFBjpv4
         0HBAUHGTt9icmc9EpO47jTLq25hUNruxUoDmciPHmLy1TqVj3m7haDowULOz5fjn1HDt
         SM8A==
X-Forwarded-Encrypted: i=1; AJvYcCUpUGkMN8R5MUp9isuBsKEnd5OxCcMnnSeQxpmh6ZDe6SSHymF5LVUhFu1WSUIXobA8ut43aAIfDx8xkAuwWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrf/Fv06zwdLTxw79zJRrCZeq9pPffsjXbnXTfNI1LwZAHnvcN
	4Yb3JW2isKIJR+LXgl2SqxyAa3DGJEN63nDcdXUEquZ+PHLwvpx7XNcV
X-Gm-Gg: AY/fxX4hqr38qIR3aJVsQ32kbguBjSQDgpU476du1U4Qm0kwfVzCpKxjWayrF2F51cZ
	eqjMFox1MOBXr3CsKIkisNhZnc+AuQSuI+PPV4BRt/BefGpHAjwnL335VJodIF6dfDh/V80AKHI
	XWEg2AB2FL60XHNW3DgbzD/AboW6dOtdlckQVcKvwUf1rp/82UKCp9mMxpkQG4jOO4rzjVfnIYs
	B9yUZ/lA7wRDgoO9JzLfNw5kwAjLhWcE2MmqcVzLJ5Z2rdQMnYzHPWLcnBCYqPIFFuO4wXi3Zrx
	ze4J4kRSALOcyCJbhqiCv1p6VxlF+7cTKc2Cpf4W4882R5sW2MbwWNuNyn6oxNDFyI8tMfmbd+e
	aj8twc6T3p2/P+5fXdiff/Fckq9JvK8zUlgfCq/TToB/7hG7jhVRBqmz7d1lwd9WXbNw=
X-Google-Smtp-Source: AGHT+IHpibfp8K27fPH/lotcIiTfjq5o2u20YS0w3ehhwDZJwr/juInfop7O2bIGoVgMhV/uFDyjWg==
X-Received: by 2002:a05:690e:42dc:b0:63f:beb2:951b with SMTP id 956f58d0204a3-64716b94f0emr3733733d50.42.1767880596802;
        Thu, 08 Jan 2026 05:56:36 -0800 (PST)
Received: from [192.168.200.2] ([2a11:8080:200::1:10a2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6abc01sm29272627b3.46.2026.01.08.05.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:56:36 -0800 (PST)
Message-ID: <4a3b9aa2-cfed-4cc4-b0ad-d3b257cbf106@kylinos.cn>
Date: Thu, 8 Jan 2026 21:56:27 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 4/5] rust: add RTC core abstractions and data
 structures
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, linux-rtc@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Alvin Sun <sk.alvin.x@gmail.com>
References: <20260107143738.3021892-1-sunke@kylinos.cn>
 <20260107143738.3021892-5-sunke@kylinos.cn>
 <DFJ6P0ITWD1O.2PAYKPU63UFFC@kernel.org>
 <b69749e0-e66d-425f-9d95-2d1bd4104e19@kylinos.cn>
 <CANiq72nbBKpa_n8i1pwoC7yiurDYJQtY1efRqkvtXMZ1sXSfJg@mail.gmail.com>
From: Ke Sun <sunke@kylinos.cn>
In-Reply-To: <CANiq72nbBKpa_n8i1pwoC7yiurDYJQtY1efRqkvtXMZ1sXSfJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 1/8/26 21:49, Miguel Ojeda wrote:
> On Thu, Jan 8, 2026 at 2:17 PM Ke Sun <sunke@kylinos.cn> wrote:
>> Yes. Dirk suggested doctest in another patch series, which I enabled. I also
>>
>> run clippy checks and QEMU tests for every change.
>>
>>
>> ❯ cat .config| grep DOCTEST
>> CONFIG_RUST_KERNEL_DOCTESTS=y
>> ❯ make Image CLIPPY=1
>>     CALL    scripts/checksyscalls.sh
> It may be hard to see without syntax highlighting, but the code is
> commented out:
>
>      /// // rtc.set_range_min(0);
>
> So that is why the example "builds". That `rtc` variable is not defined.
>
> It is also not well-formatted.
>
> Please manually double-check.

Will do. I'll check more carefully.


Best regards,

Ke Sun

>
> Thanks!
>
> Cheers,
> Miguel
