Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FEB21E0AF
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 12:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733747393; cv=none; b=ZJex6p8Nm30A6kJMH5MyDJ0ctWuLxK4wCRkqgOWE8D/OGqPXkobLUTTUgdjUtOCXwvnonOP+yevOy8ejmxWawuISuAvQ50h7qEwLP0LdR7x2hXVL+Q+okTHhfWljSNjAvwiCBXOyExFDSe0WnFRkUL9Z+224iuAr0yGF64sDk78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733747393; c=relaxed/simple;
	bh=sUfST4In6BFaz4cncct0K9JmI5C47/iyHU7EzK2F71Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMbjMUn2zEodM9y17l22vILoVCtpcsbUlrFfAkRLlwoHY1/waaQGmmF28+yHgS3q8zn/zhhYnYP7GvtMhukSOhuuNoCwX+AmwTVjK8ev0lteOxc4CINiJxEtO9wJTuKyUA+Hgr2qFi9YRiceFUHqt18SRbNOSr7qHOL2biAbn9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=RVWcxYod; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="RVWcxYod"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d34030ebb2so5546140a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 04:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733747390; x=1734352190; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sk/tDYD6KLC2uTv+ULUwwSmFTXAbs0Ll7BQ/8lxfZoA=;
        b=RVWcxYodI0YpVJkAhsUQbzs5+/kzV9uTotJZz7CrK44j8RGSupfw1Yvg4yksjEzUyz
         h5iXHMniNuh4nNVPZVAlNfaifp4ekBuv2ls0UjsOCOXnEXfaOKdJfGVlSMJeu+aXNtvY
         uoaDG1v075EwWmMsRfalRKsTcMIngSYAE0dDb8skSzhoHSVIi0bBIc3hLg1/+MI/1c9W
         NyEi60zosZai9gKfRIrYooGc8wHJCVnNBVk6Ja2zo7DyETuDNJ0jXi6Cdl6iDfGBhLPO
         G6TYwx/vSuc8HL2KRv5bhZVLU/GLuzGurU7dSrpn9zF9L4L2WWmfDZ06LoBQyLTrOEyt
         45zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747390; x=1734352190;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sk/tDYD6KLC2uTv+ULUwwSmFTXAbs0Ll7BQ/8lxfZoA=;
        b=FuDzMd0tvwF9KDFx7wgFJfKhb+vqVdeaVRUENEwh/yeHgMgbcVBChrVA9BBsiY+8cL
         +JCNjoUPDuNP0EbRiBIrXXs41bLRB3YCgML+k1+6hE9dAEX36mrz8s8MfhYKtplUo/k5
         pOzSnpRX3j0bkk1kS5twQt48jTqUUL0MpAp5UPfcSBP9fAhxF3ku41v7tICTXoKyJ3JK
         M3KoVDTaaOwTcThkg/46np14TkfDTkmdElRfF1ueGdQ+jI3DYTc+kOS/JnNCX0n5VKL+
         PsPQ41RpNk9IkuhW/Ksh2f72IeTpPD71KguCAtkRDe/kR9DUOp6oaZ58nw4qxx8kUwVq
         1Zkw==
X-Forwarded-Encrypted: i=1; AJvYcCX6XFnG7gEQogudDKnfrs11esMyfOTcB2qqW9zy0Cs/tsidvXv4DkyuEGjDjcq0fSBpjYahZsMRPVX4p1tQjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YypFaAwH4InBJcFxUU3zOnJOoRiAK0QAOUloPW9t52ySJPFatai
	Qzj7OIGXH318lVIzInCD15g7OuG9yCt+WnSTFMkhe8jrBB0qHRSfNx1vo2Ic9Ho=
X-Gm-Gg: ASbGnctRHXzdQRpnDy3TTBrleQqE+bdqgtVIPaSHHTe/qTQ7+6c/F95IJqZ1jVT5ue8
	SeMhdgjN3dg3Kbp9EjOsRKwen3xTcYM5EHMKMd2yQiQL/JomjHrNw4sFgaqs5YOuQt5NVR4I0gb
	K0BNM9wFOU9UWeHxZzAqeyEKBKZY2Jmgqvzzjyh+XDNUvHl+yPi+Nz+l4H1mGqzIU8XaxAVWo+a
	CGyaoTDTeFIvgyznKQ3e81id43GvggUmlzKqKFHNted1uL28T9l0e3AMNl3is8J
X-Google-Smtp-Source: AGHT+IH2aAKoc3rAG/qXUabUikj4892OrzH2t0bgWmHMpBTkxJWD9/FuokOe61AUb1FB7NHXZ/X5nw==
X-Received: by 2002:a05:6402:350f:b0:5d0:b455:36ad with SMTP id 4fb4d7f45d1cf-5d4185faa5emr504294a12.27.1733747390155;
        Mon, 09 Dec 2024 04:29:50 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3bf50397csm4910222a12.79.2024.12.09.04.29.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:29:49 -0800 (PST)
Message-ID: <23097a11-2bf3-4ae0-a1d8-9df5f772e15d@sedlak.dev>
Date: Mon, 9 Dec 2024 13:29:48 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH] rust: macros: add authors
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: guilherme giacomo simoes <trintaeoitogc@gmail.com>,
 Wayne Campbell <wcampbell1995@gmail.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, walmeida@microsoft.com,
 fujita.tomonori@gmail.com, tahbertschinger@gmail.com,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241206192244.443486-1-trintaeoitogc@gmail.com>
 <CANiq72neo_RtANWJu_GW5LxsR5KWxriS1L8nsXkNn7ioiaEQKQ@mail.gmail.com>
 <30ddfc7f-4b13-4caf-8859-2cd2e72ef878@sedlak.dev>
 <CANiq72mh2_QhHcE65-t+6UEEqe+9XwGQ3gJ1CCQpZ6r3HOcokQ@mail.gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <CANiq72mh2_QhHcE65-t+6UEEqe+9XwGQ3gJ1CCQpZ6r3HOcokQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/9/24 12:47 PM, Miguel Ojeda wrote:
> On Sat, Dec 7, 2024 at 11:15 AM Daniel Sedlak <daniel@sedlak.dev> wrote:
>>
>> I think we could fight with the code formatting, because when it comes
>> to the rust macros, rustfmt is often very confused and we could end up
>> with variations like:
>>
>>          authors: ["author1", "author2",
>>                          "author3"]
>>
>> or
>>
>>          authors: [
>>                     "author1",
>>                     "author2",
>>                    ]
>>
>> and rustfmt would be totally ok with both of them.
> 
> Yeah, that is a good point. There are hundreds of drivers with 2+
> authors, so this could indeed be an issue eventually.
> 
> Having said that, we already have e.g. the `alias` and `firmware` keys
> that take a list, so I think we already have the potential issue, thus
> being consistent in our use of lists sounds simpler (unless we are
> discussing migrating those away too).

Ops, it did not occur to me, that we already have lists. I would propose 
to migrate them too, however it may be controversial.
> 
> We could also try to mitigate the formatting issue via e.g.
> `checkpatch.pl` if needed.

That is true, it could be part of `checkpatch.pl`, however I would argue 
that if we can overcame the formatting problems by repeating the field, 
instead of modifying `checkpatch.pl`, then none code is better than some 
code (regarding modifying `checkpatch.pl`).

Thank you for feedback

Daniel

