Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC3913A868
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Dec 2024 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734361717; cv=none; b=EfjMjR8QXwwGgL8DEcRF7bjk6rDKDdb2/A/bTUktbkWlu9+rDU16Zd00yvV7WGzG/qxSsXoXR9tT5HxRtUElba49MVXNRorFM8vn6juiSN9sp/bRs94TtuRfeu7+/lfSGKk2w+7SB+GRbVoplywbUpvluKFjelaMQ4KZ6RZMqCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734361717; c=relaxed/simple;
	bh=y/hSn94vqcnNhsYw94s6FXu3f+/P18H8zbeqcBwJtu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLnzYYgMPwZjacvhNgmi2ykcGFOp0VpE3Ck8aI0QucYb5qHoCvyc9LBaC6v62GzGkpjU8LvEynEM55ztfwnPiAMDAf197mwd2Gdu+DAlsTdZgNXyTtt8UZP/KeQFVYsvvwzdx2K5Ax9KY5d4AE0/1Tt1qXs6ODM1vxktmEBHfG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=EklESSlR; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="EklESSlR"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-728ea1e0bdbso3200657b3a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Dec 2024 07:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1734361715; x=1734966515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cHndDb93nJKHf3y12UiyHgWO3egb1uH1jrrMzcjDJHY=;
        b=EklESSlR01l6cX8QdXLCnxqWfgE6fhvTEZfTJfN9X3zWOX2kTBzt2nqOFcFt5Ea0Ua
         Zd3lvEAagFAoDmehSRYCIoZC9EVoPchtQFUDyrQEhM2z7I8u5m9ywksnY/DCZrVSBc/7
         qKlEusR5kv1qoDSr/o8GeuuLj6L4Bxi0qGkzPOs2/RiuTAk2e7VUyeRZ9zDpb5eCHXj6
         6pm8mP2YmQCPEzSkNRAIuo0r2fl5TzMK86C/5Yvwc9Pa7kQJoaT45AFkQQCCekrXGZMI
         MWDgcYJLlV+a70Q3J63P3KcaZPBQpmebuU6X6VfrBrVjGjFeUu5fhWChg8l/ET2CiG5G
         zAAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734361715; x=1734966515;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cHndDb93nJKHf3y12UiyHgWO3egb1uH1jrrMzcjDJHY=;
        b=GrQ3YO4X1Xi+1Lt0KLYfjrWRM20ANBsW/4k8oE+Q9xgcm4EmAKMtK1QXXeL3GqVlAI
         KUBznGTERJVqkBPQfDrwW4+9PyWWGMULcWofstd9nKAe6asJm5JmHFwPXLe7rtG6cuJw
         L8v/mHFJmXkJiUCJdHgsw/ZVQILSbLuZqF1ecQTnHxMzfFMND5gibr5G8fzQwi9XJnVJ
         QIJTdZqgtJHW5ZELw4E74Qb+GDyI/RKwaZE0waXBeXglGFnlfQgmWis0u4Q3IyZrXeQQ
         sRO6cQYND20hASc5vuqbMs8Jay1RCkyVfUEsGvoVraA5R/MPd/7k+AlVPjHT/D8SDyiA
         GxUg==
X-Forwarded-Encrypted: i=1; AJvYcCVvfVJP6LmLeoLwpv9/nUZMN7+Nd0T3i0R+NJ4xw8WuFH+JOqdCoULL6QosGIkuhk4MHXNHnfWsYXzTqEiZzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHYksRkhb7hJ8baYzzW4RxvUXxYDvm9BFY16LFMsikdqR1fPyY
	Uour0dchgBAISSKkdFVdpDs/+KzZ5JCBMafDhqe8Kj1VD+vvz6bkOFxyhMmN3DY=
X-Gm-Gg: ASbGncsPku+e5dL+z/wfQX4JFc3T4P2KbNbMc/2yb5CeZVPFFSSWkRV61a3EdqVQ2ca
	77qMVJnrs2NYTzNZzbuWoxC4beO0x/vDzc3GjU18g5nGUyquo4MGpV5JaaSehF/MWuS7BWbmk3S
	9Jq8UrUspHb3/RJAyK51dNSMq1br+NpuErJwVIzUJLcbxqqHiAlt+RR5G5RqVDe3YngeiAWEGoR
	s7FFe8b9MlyD5Tj1xyBY+lkQsWp2LNSwRdWQ3FnvBcrntcYedkcnQ==
X-Google-Smtp-Source: AGHT+IGl28jR0r8TWcntTfBPiwR4SLoZRHONQFu6tyJH1gWCvGyfOrg5K7EgV6Uhd6M9VqjhOxm7SQ==
X-Received: by 2002:a17:90b:3848:b0:2ee:d797:408b with SMTP id 98e67ed59e1d1-2f28fa55c45mr18636200a91.2.1734361714814;
        Mon, 16 Dec 2024 07:08:34 -0800 (PST)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142fc305dsm8237518a91.52.2024.12.16.07.08.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 07:08:34 -0800 (PST)
Message-ID: <64a40555-e3f8-4671-8ece-3c3b677ccdfb@kernel.dk>
Date: Mon, 16 Dec 2024 08:08:32 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] rust: extend `module!` macro with integer
 parameter support
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda
 <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Trevor Gross <tmgross@umich.edu>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <I0v8YGJe3e1ex1oF3mki-7QKimYLCJHnBy6g1taHgoOFvpNmQSrSnsMGJyGS064pGJsJDsTsei-pInFRz5INWA==@protonmail.internalid>
 <2024121309-lethargic-ended-5f99@gregkh> <87ttb7d24p.fsf@kernel.org>
 <hmmCwoNftQc5Mj4BLjFC2qTABem8CvuXSx3ucXzjIfQSwLjULmZgsw7vpq3Zxy0kk5H3Zjpz-vd4d7E1sb4LHw==@protonmail.internalid>
 <2024121344-excusably-resurrect-d01a@gregkh> <87h674c5vq.fsf@kernel.org>
 <UW-ATumT4L-13ZXX-lO1inQGeZK7VgQWNAHE3688ulGj-rvzxWkUdrmnAUlufI1W5-9d6vzH3TXZ4VOmYh9wxA==@protonmail.internalid>
 <2024121646-shelve-series-5319@gregkh> <877c7zbx2u.fsf@kernel.org>
 <8e1b5c5e-52ae-4332-a49c-990add7611f6@kernel.dk>
 <2024121630-steed-grating-6352@gregkh>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <2024121630-steed-grating-6352@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/16/24 8:03 AM, Greg KH wrote:
> On Mon, Dec 16, 2024 at 07:43:12AM -0700, Jens Axboe wrote:
>> On 12/16/24 6:02 AM, Andreas Hindborg wrote:
>>>>> I understand that you would like to phase out module parameters, but I
>>>>> don't think blocking their use from Rust is the right way to go about
>>>>> that task. If you really feel that module parameters have no place in
>>>>> new drivers, I would suggest that to be part of review process for each
>>>>> individual new driver - not at the stage of enabling module parameters
>>>>> for Rust in general.
>>>>
>>>> I'm saying that module parameters do NOT belong in a driver, which is
>>>> what you are wanting to do here.  And as for adding new apis, please
>>>> only do so when you have a real user, I don't see a real user for module
>>>> parameters in rust just yet.  If that changes, I'll reconsider my stance :)
>>>
>>> I guess we disagree about what is "real" and what is not.
>>>
>>> In my view, null_blk is real, it is used by real people to do real work.
>>> They get real annoyed when the interface for their real tools change -
>>> thus making it more difficult to do this experiment.
>>
>> I'd have to agree with that - yes, null_blk doesn't host any real
>> applications, but it is the backbone of a lot of testing that blktests
>> and others do. Hence it's very real in that sense, and the rust version
>> of null_blk should provide and mimic how the C version works for ease of
>> testing.
>>
>> If this was a new driver where no prior art exists in terms of users and
>> API, then I'd certainly agree with Greg. But that's not the case here.
> 
> Ok, so are you going to drop the C version and go with the rust version
> if it shows up?  Surely you don't want duplicate drivers for the same
> thing in the tree, right?

Maybe at some point? The rust version is already there, it's just very
limited compared to the C version so far. The point of the rust null_blk
is to build out the API so that a real driver can get implemented as
well. For now, I think the plan is to just have it be the rust
playground on the block side.

Given that null_blk is the center piece of a lot of testing, it's not
necessarily an issue to have duplicate implementations of the same
driver. In fact it may be pretty useful for people coming from either
side and wanting to compare implementations and how to do various things
in either language. It's like an actually useful skeleton driver in that
sense too.

Whether one or the other will be the only one in the tree in the future
depends on a lot of other things that aren't necessarily driven or
decided by the rust null_blk driver.

-- 
Jens Axboe
