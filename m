Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48913B584
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 03:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768792232; cv=none; b=Dm04YjJMSot4bGFeF7rcKyXvP6nhFh1zwbyeOIgELHPpoKhgwYHAMAkxGRSJg89VDKR0PXZ3lAa1BJj2ZwTz2nb7crjE9afhXmgiDWP8j/JvIrs1dpSGiLVRhWFkxcHiQaSa9GZMEhZnUXjrg3+0WbX6+ZWBF/fSZtOE49Ixte0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768792232; c=relaxed/simple;
	bh=oo5ZkUeVa070qbf4SBLZAAVQYzGoIJlQsmhkIb9OE4I=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bT8yNbTAUpqWe1j5nvLmeJoiehgeFZSItnxMMA2Q4d2T2o+KOwKa/ssPCqv6C/DxtHqXLdgm4bsNXgcd1jvbxUNVP0tCITt3bHw/UHDu+1h5cg9K/3GDZWZ4YcTi+oOxmDs4lvZwTC50qYhCOxqIle96+5+JDFOycuHt5dYYQI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtA/SWuU; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtA/SWuU"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29f2676bb21so38714595ad.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768792230; x=1769397030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3uWVBpkLfZJHSqQ4QDdkZTFmAqRAttQTMYIRxcEh/rA=;
        b=WtA/SWuU1N0p4bdnaDgu8os4ZHFiBJnm0Ex92j6CueVwkCTmR9Kit7DJ1CBnBGtYIk
         x8q1es6KfQe/cQlvdD9aCgWVER2UuB5z1SiqEKjZ5sAEXX7Lz+rHaWzHgUOk2Nx/CdXP
         jqqO3DRB0zKecvxAfcx1oOdhnap2gAWYscPDlFvR/OTAZB5HchdnVYcIw59AY25JCw9I
         Btp3grQ91LgvAFEIjPiFI9Xkh7ztwic/ohpFXeym9b43TzgWRTthSkKpTuLlgP15AboS
         ZUu+3s7C8JmWpoMT7a91aga75n42rii/wG3ZVAJXj3x1GkTNRbgL5CvpS56spnwVdaIf
         gUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768792230; x=1769397030;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uWVBpkLfZJHSqQ4QDdkZTFmAqRAttQTMYIRxcEh/rA=;
        b=ABi3EzqbIzyFcsOwk3t7YctMUU3BXi3fmQz/ClRwiu8/iv7JW5A2uOl8NuHhJSXPDM
         dh9d18ACeAkOdTlBqwq8Ed7GAk8mm6iOvXn9cn+XZd5UJlpidPI0l+uJxTZoWSRIfjd4
         n1lJscblDvWmqEe2Gql/mNL0gqiw0InYhJDD5fQKkaEEDvPScmqtkbOw5himWPTJGSP8
         UisgjnMEPr1j4IWdHqDcweyZCPKeDMKmsdx1SgEIGmnR1BYUjSY3dkQI8/nZpf7pN5hN
         DpQRIi3L5OCJQnpCFHERH6gZnKMzC3lIWsAu5RgyzCGkiNrSQKlONqQZboE0GoJyQ7n8
         jxAA==
X-Forwarded-Encrypted: i=1; AJvYcCXU12/aB3xt76HytryiZGEG7sZUPZuPRVbcx+7+5PE2QpKiNTaQlomFZkL/FHkZqNBT0CEvjpFf5jdSeRVAwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCNB3n2DSZkEvnHpv7eNL8ICantu0JuXTqFHsSseKFUZ0+1YNr
	ikvpiv61V/23hEz8NazBnonnuySLBc8dJWN1oW2J0QLY7LBz02yBmaDx
X-Gm-Gg: AY/fxX4SUTrliWdUgQgScyrpQCxcTzpcK63lS/nQOdQ+UpewMQoREFMPFWjYNUN6JQL
	YYr0hPuzUSZ/NaL2entUKq3ZaoV05jrIJeQ3rKGjJEyL6k/PT2AE8rZ7Rm6sWuhReKeyyua3qJO
	F3RFWzp8c1GG1mEwxEd+rJLpCXFjwZb/dmUNRNbG4FyKdw3iFg2xb35CwcashDaMLpoQ0Vdmlaj
	q5nC3ZhQKXSAYY3gXZ2PRD1RGOW1qenL1ufuxOQOGkfQirm3eBkM9Tinl3dbhQLNAlOs8GNKWO4
	eO2pEgB3tbANSA8hoWBabkoDiGmEtrlKWOzbCyfup1/n6guJBJAa9j2dTVSeZ5luU+kqHTIMb1E
	yhHIxxj1UQ/A6XpXjL2aBoDJkDvfuuC1pa4iVB/NoLPZWxHVw5nyKcrQ4r8B0ZeRi8MBlICDJOu
	46n8GykBAqLnsmPrRVnQJ3EPZT/SlfUVrB0/3Vv5ftRwCFA+F3t1MeGBVjC7zi5iaEph0=
X-Received: by 2002:a17:902:c40e:b0:298:616a:ba93 with SMTP id d9443c01a7336-2a718857417mr77082675ad.9.1768792230522;
        Sun, 18 Jan 2026 19:10:30 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce415sm79890265ad.35.2026.01.18.19.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 19:10:30 -0800 (PST)
Date: Mon, 19 Jan 2026 12:10:25 +0900 (JST)
Message-Id: <20260119.121025.255021656975699898.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, ojeda@kernel.org, peterz@infradead.org,
 will@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
 lossin@kernel.org, mark.rutland@arm.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v4 1/2] rust: sync: atomic: Add
 performance-optimal-integer-backed Flag for atomic booleans
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aW2HQvo2h46WecQ3@tardis-2.local>
References: <20260115021230.3297420-1-fujita.tomonori@gmail.com>
	<20260115021230.3297420-2-fujita.tomonori@gmail.com>
	<aW2HQvo2h46WecQ3@tardis-2.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 19 Jan 2026 09:22:10 +0800
Boqun Feng <boqun.feng@gmail.com> wrote:

> On Thu, Jan 15, 2026 at 11:12:29AM +0900, FUJITA Tomonori wrote:
>> Add a new Flag enum (Clear/Set) and implement AtomicType for it, so
>> users can use Atomic<Flag> for boolean flags.
>> 
>> The backing integer type is an implementation detail; it may vary by
>> architecture and change in the future.
>> 
>> Document when Atomic<Flag> is generally preferable to Atomic<bool>: in
>> particular, when RMW operations such as xchg()/cmpxchg() may be used
>> and minimizing memory usage is not the top priority. On some
>> architectures without byte-sized RMW instructions, Atomic<bool> can be
>> slower for RMW operations.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/sync/atomic.rs | 71 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 71 insertions(+)
>> 
>> diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
>> index ca9cab77abf0..58f57903460f 100644
>> --- a/rust/kernel/sync/atomic.rs
>> +++ b/rust/kernel/sync/atomic.rs
> 
> I prefer we can move `Flag` into atomic/predefine.rs, I queued in
> rust-sync with the following version, please let me know whether it
> works, thank you all!

Works for me, thanks!


