Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAEE1B423B
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 15:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733757454; cv=none; b=JzfjhmKDf0MTMCJ6ziHVI8Wf8e/QPL9nyS1YM7ZEZVSLTp2S0WjAy/g1FJ9F3j9qFsMfvnbm0Dg46ZhwzrIx1fGKr7mz6gRpm9cfw1TSxMUBiPDw5Bh2lMz3U+jw4ro2k83XPohJ0fItnzBZ+A5+L5ak4ywpGHMYjSpKGOauBxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733757454; c=relaxed/simple;
	bh=G0ENG36Osig8LvaNBY3l0NivzrsV0HCExmrV6Ai27Kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRQdatsIupJUE6dZayS1uYN0Y/nkCKanVrepvvJpLhLMrXcTpgj5G18L/NDEzwdOxmQDamWPqbRFSS+E6CczraefYzblOxfJc8C5zJQl1877iG+dWHVkx2881skNqNGkfNiC+15W4CfVUQ96QgEhsLbI8BVs7zWQwCdXU9lfLFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=mzVMkWTS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="mzVMkWTS"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa67f31a858so227495566b.2
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 07:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733757450; x=1734362250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c9InyJstwPNrnMRlLxrCZ2q97ihB36NUJa5qEz4/HO8=;
        b=mzVMkWTSJp3lfBcMwIfrZjF6n79GzXEr2P0QEVVg0dIqygKZnxfb3bZ3XqEGDi0Kak
         n2YOisCS+4Qw5dFNCSQwplJcxnIlScTcMOak9Djl6JEtxKbYbOdx15j3lth7AomChv+S
         C2pEYkD9NS+oX+A5/x7KVLSX5j1fvb4UQAN9DnFPjgYhakJ6fX6yoGRFEr/iAFMYBzYl
         Kp1U06VayFqdTzEo5JPEMmCJXkhgF+iyz8/9RAX9jWJ7bxcAVfsWvHMJpeNon/VjsxAH
         qbhhVH6r8oUUfBj/+06T4gaKc7paFSwCRVtrdLs1gUShoFHyVQpFiXd/op9Qz7Xfksd8
         bWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733757450; x=1734362250;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c9InyJstwPNrnMRlLxrCZ2q97ihB36NUJa5qEz4/HO8=;
        b=OsjiAz50xiz9qpyYsMnxmn8PEQje18Vq9vgD/1pczE+UTnzkeVNDa6FrVKjhptXFv3
         aTuqLBOJgnzbyOmJjDAnei0vuISOWqcQvBXy7F0geliC8iyjObvU5Zvq0tT0XrK5jT6V
         sP3f0fJUkmyl5AWZDbNZlGllgXyKoD8jFlypUTD2nnLLmjk+StU6OoEpugTMAc7jcolX
         jiOqgX4BdKLx6w2Y6wCOmeXFLpPlYN668BIwGJWg7mBU/ntIKB/mBBx9VNx+1S9Dj75A
         p2uDlkI8vj0Byc8WxE8tCufa2o84xhho59fmPG1hSu/8a2P14kE/qCNxnB/zhM/+YaF6
         t1Kw==
X-Forwarded-Encrypted: i=1; AJvYcCWAz7ovbTwRTzAAwrYcpTTyRE6A5Xs5alRmZ8ZJqIvC+4Vh+o0Gnjz9fjiEImLxUCCGfOOZ0+hwLyE5GJ7KMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3RrOedoBvO5M/AOh3u1BJAD58beEaMk7sSIrzpBB6tBngZpD
	QuMTxc+zB7nBi/Sfu7A4fYX+/teZQj507Yv/xVGpRl69OoYc2nBHHE7CLXWNN6E=
X-Gm-Gg: ASbGncuBfdTa0vZnhWcOX23NiUprW/QgbS9d5j+z++6bhTdsO3Y9CnPYX8a4Ev9GQlX
	D75v505Z9uwjhhk0DsqjIKFC6Ud/QjtZaHDtpkCjgnD7RRNp/9JI4oK7BC9sh1vomU56A/bVKTi
	ALeGUh+HclJjNVn6m8FedFvrdOeUazqvoFglFlzwezhOc5wrRRcZkpP8zzCUcLenXPF2yCLMgDv
	cJGwaXwEeiL+Ran+fMV+K/BkIdk95U3tnM3Cxt6FeFlFU4nOt+nUUWL7h9i
X-Google-Smtp-Source: AGHT+IErrAfYYDzm8WTBRnqzRTVNYnDwuZ1FCGJJ7c7gZm2O19AsYewd73MPiQXNFseoDwuz8lAu8Q==
X-Received: by 2002:a17:907:9556:b0:aa6:7785:5485 with SMTP id a640c23a62f3a-aa69ce0121emr106261366b.38.1733757450286;
        Mon, 09 Dec 2024 07:17:30 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa67ed22074sm230790266b.150.2024.12.09.07.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 07:17:29 -0800 (PST)
Message-ID: <0cae37af-2545-4665-b33e-c64069b93ef8@sedlak.dev>
Date: Mon, 9 Dec 2024 16:17:28 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] samples: rust: add kobject sample
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <20241208131545.386897-4-daniel@sedlak.dev>
 <2024120851-thesaurus-monsoon-443b@gregkh>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <2024120851-thesaurus-monsoon-443b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/8/24 2:46 PM, Greg KH wrote:
> On Sun, Dec 08, 2024 at 02:15:45PM +0100, Daniel Sedlak wrote:
>> Add basic example using the kobject API using Rust.
>> The example is similar to the already existing
>> examples samples/kobject/{kobject-example.c,kset-example.c}.
> 
> No, please no.  let's not have "raw kobjects in rust" even be an example
> of something that is a good idea to use...

Noted.
> 
> That being said:
> 
>> +config SAMPLE_RUST_KOBJECT
>> +	bool "Build kobject example in Rust"
>> +	help
>> +	  This config option allows to build kobject
>> +	  exampel written in Rust.
> 
> spelling check :)
> 
> And wrap your lines at a longer length please.
> 
>> index 000000000000..90db937dea5a
>> --- /dev/null
>> +++ b/samples/rust/kobject_example.rs
>> @@ -0,0 +1,66 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Rust example using kobjects.
> 
> No copyright?   No authorship?

I copied it from other rust samples, looks like collective "issue".

>> +
>> +module! {
>> +    type: RustKObject,
>> +    name: "rust_kobject",
>> +    author: "Rust for Linux Contributors",
> 
> No taking ownership of this?  I REALLY want someone to own this if it
> ever happens, so that they can handle all of the fallout over time with
> it :)
> 

Also copied from other rust samples, it looks like even some C samples 
have not author specified, but that not justify not specifying one. Will 
remember that in the future.

>> +            CString::try_from_fmt(fmt!("No one stored anything yet, value {}.\n", this.value))
> 
> Wouldn't this also happen if the text was ""?  If not, why isn't an
> empty string the default to start with?
This line in the sample is result of invalid fixup and should be:

	CString::try_from_fmt(fmt!("No one stored anything yet.\n"))



Thank you for your feedback

Daniel
