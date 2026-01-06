Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022A8287E
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Jan 2026 03:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767668785; cv=none; b=mSmv3j/0LLKvjCbWJ2YxuNrLD+f6gF8YrDfO5PmDFd4252WI08rFeY0dI79+47QFag/ia3sgjCq5Ytovsj3wHLjNJH+iUlxbVPLYqeRsUFZHowyopoH9ASoy1tWSzuJBn5mtBtVJdp34Q8upmvCP43XNtLKy/5asji3fIGSu29Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767668785; c=relaxed/simple;
	bh=wn1g4XjONCFKaiC0D0EZEwINX7zi+3dPfDRTFwBWR/w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOQX+yLZXasHo0tkOFzGYCEXJMbXS8cwZ3Zoxrezc10gZcpv67040pCeOkuAJoxdRHAwMtY4KPlvqzxPFfa9Ot61bJGuLiD0QBgqJhORCSBp3AxN3qHm/44dzIHNj3bjkPyB17BpLllzKw/JjSHsZQ/qG0fF36pL/r0vTOemfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InE9L/Ln; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InE9L/Ln"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso5014725ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Jan 2026 19:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767668782; x=1768273582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk4CJTn7SedTBZRn6a98xWNtGUOFV9KcxBU3nfRsR98=;
        b=InE9L/LncKXTto1AvMm2c2u0kkX+vGJA+ghQaIeahbZBUxRNScPl1+iIYfwbrPtfcl
         jzI9TLF+miFypDDEavVrLt6UhVEMFMlGgz9YsgfaJYh2mrEhTrIt4hDzWsJ5wRRoFjJ/
         WfTd9fhiBVBEuAQIfau+Va53/dyfmbkftwKjA3rOwTOfD24rf91Gqd8IAhh/71RSzS7J
         qycZozEQKFPHqYUhuV4u5zMCeYZFrHKbxPVAPOyrNfMSGZzVdjsde1HV31Rh5aACVXvE
         LXBiHHEqEmWz1DM7ePxkOJstuO+Ri4wVBeATsvjPxeBgov0yjaI0KvcZAEiTAM8J968l
         GjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767668782; x=1768273582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fk4CJTn7SedTBZRn6a98xWNtGUOFV9KcxBU3nfRsR98=;
        b=Ds0x5/VCa+Hh/z+RsFCdeeAEC3QjEhfRYB7MHn49fTPZ3GmBVkrpJCN6kSKUmyI2mJ
         pgkof8GY2DIHxQztMwldfm45/2YdH7LCSIYryOOj3Lz+bzxzsJ/3wVyPYmTDRgzPS32l
         /kQ6MDrYYYpUG5kkRDHcCkeqmyW+QlmJJeyboYWAUKHuSQxLOUSZt9JaEfAX0tJHQymc
         9uOArcrVrKcVIbYE62aYj5Wfbvj/f80PPdus0ixJDuNCAHG3Q1oRmxxot65AROcwz80g
         ZjrlDBesZcLQZMccSYRDbMuRjQJrHFLrNellFp1Aaay4GPFklf1PEEaZQdLDE3C5Zo84
         cyeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr2lSUxBSDUrSnKamhIiyNgyeJ2A4gb0KnvrmWIf6Dz93J4g2Awf9NSVZGG9zfwUmbzyXO5FlVFuRMrFpxOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9f+KaKwUFqNnvhhaVEUvt0CPFImMSJwowH746s6dgIVIx796C
	CJP9MB8vc/2pj6OfM/pe3wfzRqFM88dsD0hV5XFVnZi6WNCk3X8ormBr
X-Gm-Gg: AY/fxX5OP1OAskAHSRZklUvF7HrHgcZ2oJLCpFWA9BTwBOHjB0VaHgzQwIic6wSHE/T
	XEkjFlbOqTwl1Y31rBihXBb+7APqTNWDIeepEjod5vFRCDD99jg4cU8VR/8nALWifyBlCQ0ViNt
	ax5EVCllpvK158yFBPRDCoc9D1jG07MddLQXABHiEIXd4W/u1wajdhRGA4MEjO/SceG8QmcUyLZ
	YXPFxHMITqIyRxL3Xku66jy7L88fVs2xMsDzHKRAjo+5xjPE+Rqqj+gERu927NWMWW7xnNCfLJ6
	91gouC05Rjsd00zGPmrx/8v+A19eNLcwD1aV4QK08/tcOK2nvMzMSwNgIV2PAWx8SgtUaLkmcId
	E8JVjAaSAoHUvRnZYvNgwGNCth2s59UJoZguajhrmDviGuxlTvFkG7VrZ/eBz5EeQj/zGO1QoMY
	HzuMmcBtMTpDE=
X-Google-Smtp-Source: AGHT+IHxJ/Uk/6XAkUY7puP6o0CG4BSvFMFmP0IPZMfqgmJ56D3xnk+Yy96xcoi65RKVSCCOx/pqYQ==
X-Received: by 2002:a17:902:e74b:b0:2a1:3cd8:d2dc with SMTP id d9443c01a7336-2a3e2d44154mr15985825ad.57.1767668782115;
        Mon, 05 Jan 2026 19:06:22 -0800 (PST)
Received: from [10.0.10.3] ([195.245.219.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc793fsm5580975ad.72.2026.01.05.19.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 19:06:21 -0800 (PST)
Message-ID: <d35cafb6-c3ca-4641-bc49-863afb101d66@gmail.com>
Date: Tue, 6 Jan 2026 11:06:13 +0800
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/4] rust: fmt: Default raw pointer formatting to
 HashedPtr
To: Alice Ryhl <aliceryhl@google.com>, Petr Mladek <pmladek@suse.com>
Cc: Dirk Behme <dirk.behme@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Timur Tabi <ttabi@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Benno Lossin <lossin@kernel.org>, John Ogness <john.ogness@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org
References: <20260101081605.1300953-1-sunke@kylinos.cn>
 <20260101081605.1300953-4-sunke@kylinos.cn>
 <aVgC1qXp1La6E9p0@pathway.suse.cz> <aVt0JYbbXLeuqFBt@google.com>
From: Ke Sun <sk.alvin.x@gmail.com>
In-Reply-To: <aVt0JYbbXLeuqFBt@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/5/26 16:19, Alice Ryhl wrote:
> On Fri, Jan 02, 2026 at 06:39:34PM +0100, Petr Mladek wrote:
>> On Thu 2026-01-01 16:16:03, Ke Sun wrote:
>>> Make raw pointers (*const T, *mut T) automatically use HashedPtr when
>>> formatted with {:p}, providing safe default behavior for kernel pointers.
>>>
>>> This allows users to format raw pointers directly:
>>>      pr_info!("{:p}\n", ptr);  // Automatically hashed
>> It should check no_hash_pointers variable, see default_pointer() in
>> lib/vsprintf.c.  See also "no_hash_pointers" and "hash_pointers=never"
>> kernel command line options.
>>
>> Hashed pointers prevent leaking information but are not good for
>> debugging. The "no_hash_pointers" variable allows to print
>> raw pointers without changing the code.
>>
>> I am not sure how this should be implemented in Rust. If you need
>> to keep HashPtr then it should become an implementation detail
>> and should not get exported. Nobody wants always hashed pointers.
>>
>> I hope that we could find a better solution which would allow
>> to reduce the code duplication.
>>
>> For example, I wonder what would be needed to allow calling
>> snprintf() from Rust code. The fn fmt() might call
>> it with "%p" format...  It would make it easier to get
>> also other "%p?" formats.
>>
>> It seems that something similar has been discussed at
>> https://lore.kernel.org/rust-for-linux/CALpAb9MoT20Ch4pe-oMz8kpqaZsvmgNwPk1XSC+faZi7huwQKg@mail.gmail.com/
>> And it was said that it would need bigger changes.
>>
>> Maybe, we could create C wrappers which would allow to call
>> snprintf() with some specific format, e.g.
>>
>> int scnprintf_p(char *buf, int size, const void *p)
>> {
>> 	return scnprintf(buf, size, "%p", p);
>> }
>> EXPORT_SYMBOL_NS_GPL(scnprintf_p, "RUST_INTERNAL");
>>
>> And use the same approach for any other %p? format, e.g. for %pU:
>>
>> int scnprintf_pU(char *buf, int size, const u8 *addr)
>> {
>> 	return scnprintf(buf, size, "%pU", addr);
>> }
>> EXPORT_SYMBOL_NS_GPL(scnprintf_pU, "RUST_INTERNAL");
>>
>> Best Regards,
>> Petr
>>
>> PS: I suggest to wait longer before sending a new version. It would
>>      allow to get feedback from more people who might see it from
>>      different angles.
> I think there are two approaches we could take:
>
> 1. Have the C side provide a method that returns the correct integer
>     address to print.
> 2. Have the C side provide a method that returns the correct string
>     to print.
>
> In general, for cases where the output is an integer formatted in some
> standard way (e.g. hex), I think the first option is stronger because
> the Rust formatting machinery lets you specify different modifiers such
> as "prefix with zeroes or spaces" or "how many zeroes/spaces to prefix
> with" or "hex uppercase or lowercase" or "hex vs octal vs base10" etc.
> By having the C side pass an integer back to Rust, these modifiers are
> taken into account automatically.
>
> Now, just using scnprintf to write the resulting string to a buffer and
> passing that string into the Rust formatting machinery is also an option
> of course. Especially for modifiers such as %pF that prints something
> like versatile_init+0x0/0x110.
Thank you for the suggestion. I'm exploring this approach.

I previously implemented a version using snprintf, but found that C's %p 
format specifier
doesn't integrate well with Rust's formatting infrastructure.

Best Regards,
Ke Sun
> Alice
