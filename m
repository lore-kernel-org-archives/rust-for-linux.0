Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA021B1A7
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 12:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733746880; cv=none; b=jlYSz0bPEF4nplX6BMtmR/aZdHC7zeMNMi7dXMGkXw9Fh8GgtJQyzK/sJVIiIWp5A5wR+HG/laTkah3SMoI2wlm6umdukxw81nNij2mFJeO4B2skew97MleKF+FbOnuzKN178W60qRiaD9abPYNcH/g2664thnML6uiP4fYoZsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733746880; c=relaxed/simple;
	bh=8utcAxsj+pJTUqPDN860t1qjaumRVIpZTC75BYlvgmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fPNAyr7EQ2sN6/miEpAWXR6xd9iaHeD6DsMN0Fam4jovMR+B3dlawQVzmzxyiQ4va2ROgLrUggXLObgHHJ3aNZ13vsFjKuLDkjZ2hs2IXxbQrUI02aeETwYoGuWuYCaMfUXdCOv2b/D8789KI289BdJp8W1HcMxi85zAByFAl+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=aSbfBIrH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="aSbfBIrH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3dce16a3dso3373850a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 04:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733746876; x=1734351676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VAe/WrvAO614ewJyqnO2H121EDzMzUqOIWvHqI1VrK0=;
        b=aSbfBIrHPr0EMCf+07VE1IaVy5UMe09skgRhf938pZC/pyPbQgzzlPJZ9XU84KXZRI
         cltx41QvpKz14IbBnch5Q3OE1NY0TtpE/qESBjwNB2E5NEXskgl+S3ZmlvUBvoP5ZFnm
         +DcioWhX60xEtXQ5lpANTzDaPrm3kHzOYEK9O4A89xpEbsvzGuOB+PAZMllK2tzB2hJR
         1ocd8zde/gWMndxho8pO6ASj2NzBF2AHcjBYU2MMV/oie3eQxSApKFWEybVzFYgztecy
         rGcxhoPYvm2h6XGlUrcPIb/IlAXq78a418baG7NnX0Kbfoi2lyHfK87KhzKUOAX736FJ
         z6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733746876; x=1734351676;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VAe/WrvAO614ewJyqnO2H121EDzMzUqOIWvHqI1VrK0=;
        b=Iqjjtokb8SsrzeiOuV7uBBxUe6AUiLB0CS6gW85tfOSgwh83PrgT5kIJeRN9/HKWdx
         A+c1FlrSrBYOpeXSpSchTLbU2BcVfGtmwfHty55tU50J4RjZx5DAKnBqTg7S8iEpkWUF
         dPm3Ygz2FY4jxmMaq7QmqHOt1noEnZuHOviQB+O8WBG6qMAR8x3j7iwDNWvnwD74Va1o
         8S8uzDMMTPGE7PRlek/gj0vk+xiubLta12ByiXT/VRe4+ArDMfaDjwKrXWQKTIIQGFzp
         DWecZ+HsgxuGTWQBVaA2Sw63lOVYbfgX4xuD4dhEmmUp5PaR0iOtwlAnPBhJRb5SI+7b
         APcA==
X-Forwarded-Encrypted: i=1; AJvYcCVTLI4Sme2V5xTI1993QKiuSdGvTnhZ7I+qJzAovl7sn4ghxp+8JohWDqhgE6dGTjUI51ZxKDBQ1NmmWvZ/bw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8hdg4uaFKx0oy01C8VJ1S8/CtdR7oNoKHdS9baBENMMqmGry
	3iBB2Egb6yJc24QKpGB4hvVBQWhJNT3q3tPnRgfVdRDqZDwzYoGZd/+rubPqnCY=
X-Gm-Gg: ASbGnctYFmaDcoOmg47JAdsyp1/ggnimWQ3zGU2UV9FxMY63UWyEuBKqWB1vNDRCkXD
	npxQbv6Yt4ViJnCtNhOMCa8UrANHkd6DEpYwc3zHzcq7OV7Cu0pS2TH8r/O/8eIBcmv55KCWOXU
	LU9TTO73bRYQa6tyeu8Mu3rnx4THrUKe+XX7fcOSuSGd4e1VCEyMSqLPmZDPQjR+uA5yoTngYc+
	CWrhRyIdlnp/QR5Z1fVoYgsHdoNeZT/j5Gxnvt8bFWsdjYbHxope6SrO3en
X-Google-Smtp-Source: AGHT+IHjrh6LE0PcPZmR8mr8RHYphJyd/XBzn2/0KrIDe7xA1buFgD7f4zOLwWuixcQm58vMO7Dqtw==
X-Received: by 2002:a05:6402:a00e:b0:5d3:d8e7:d6d2 with SMTP id 4fb4d7f45d1cf-5d3d8e7d818mr9722162a12.1.1733746875821;
        Mon, 09 Dec 2024 04:21:15 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a48acasm5985744a12.26.2024.12.09.04.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 04:21:15 -0800 (PST)
Message-ID: <47973753-510a-4410-af72-dea9228ca5de@sedlak.dev>
Date: Mon, 9 Dec 2024 13:21:14 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: macros: add authors
To: guilherme giacomo simoes <trintaeoitogc@gmail.com>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
 benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com,
 fujita.tomonori@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, tahbertschinger@gmail.com,
 tmgross@umich.edu, walmeida@microsoft.com, wcampbell1995@gmail.com
References: <30ddfc7f-4b13-4caf-8859-2cd2e72ef878@sedlak.dev>
 <20241207160703.55846-1-trintaeoitogc@gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <20241207160703.55846-1-trintaeoitogc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/7/24 5:07 PM, guilherme giacomo simoes wrote:
> Daniel Sedlak <daniel@sedlak.dev> wrote:
>> Since module is a macro, if we would allow syntax in the macro like:
>>
>> 	authors: ["author1", "author2", ...]
>>
>> I think we could fight with the code formatting, because when it comes
>> to the rust macros, rustfmt is often very confused and we could end up
>> with variations like:
>>
>> 	authors: ["author1", "author2",
>> 			"author3"]
>>
>> or
>>
>> 	authors: [
>> 		   "author1",
>> 		   "author2",
>> 		  ]
>>
>> and rustfmt would be totally ok with both of them.
> It seems to me that the rustfmt.toml in the kernel, don't have a max width for
> line. Are you sure that the rustfmt would broke the line for big enough lines?

That is not what I meant. See [1] or [2] as an example (there are plenty 
of those cases).

Link: https://github.com/rust-lang/rustfmt/discussions/5437 [1]
Link: https://users.rust-lang.org/t/rustfmt-skips-macro-arguments/74807 [2]
> 
>> I think accepting several "author" fields is the best one because it
>> mirrors the C API, where in C when you want to specify more authors you
>> just repeat the MODULE_AUTHOR("author<N>") macro.
> If you (daniel and miguel) are ok with repeat the `author` field and think that
> this is the better option I is happy to make this change.

I am Ok with repeating the field, so I would vote for that. However if 
Miguel thinks that it is a bad idea, I will not contest that.
> 
> I was run the follow command:
> grep -rwo 'MODULE_AUTHOR' . | awk -F: '{count[$1]++} END {for (file in count) if (count[file] > 1) print file, count[file]}' | sort -k2 -n > res
> for found the modules with more than one MODULE_AUTHOR.
> I see that the maximum of MODULE_AUTHOR that is contains in a module is 11. 

Thank you for posting your results and working on that.

Daniel


