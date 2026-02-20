Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16C2313281
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 13:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771593640; cv=none; b=ja9qRKpyPLF/bylEpp8xw369OME1vNOVeVBONUisRoUZr+mRYnBbTtpSj5fh36DKH/q6ATjkydQKcmXymbXROBvxF2BIuiZmc3e5oA+QYUzUO36MaxqngqlK7WgiH/0uLtZ4mKZ3YiO8kzah5WjgmhmRbr0VSfNHNnR3Cnd8YTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771593640; c=relaxed/simple;
	bh=wuvRQXlCRLuwIsSmpqcRNATCL2TV0Dnk15w9Ychvgbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z/UGCDkGSciKyETGtpW5SZ5pUM8jHB2m7eTOd0E8ZQ6DwNUozr/Pygpk/Ks7pAUJ+2AKYA06JTC0wb612tYqfijsIvR5bXNVMPiKj0ygdFhfErz51FER72RA99i8mukXi8hdGQqc5S9ZzGv9LAzAH0+BGAH9tJrqxmvGr4mzoV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLOFozTw; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLOFozTw"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4359a16a400so1858347f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 05:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771593637; x=1772198437; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yisxG46a/j9NykTgwbDnRnNT6I9RQR5YNqufY/coaEE=;
        b=nLOFozTwMyShuy0rrOpCiAs1fhqIagmnGl8B60gLA0/gZZGiGIEZN6nsdxATCb1+kd
         NyiFkkWaYswVnwNw6ptYjiCwp4mIs+7IJ3cn3LLekiy6fu8okhgP0/y/F/NY4wTprjqJ
         6pYo0SkGl0ddq10K3NOFhTi59uH2auQCGT0Ubz9cLbFxBFHLb7ZicrSlAiiCA/J65EAf
         8CjVy9XuD6PWm05cEQRr958ohRWSen/tNbhlkInIyax2ux/vx0173BvvM9510OkccDap
         TBmm4p5J7ldtxRkPeNlpjRKLyQUwdKG23XaNbdo1U+NYAtYhYr/OYXW6iCgX5+F34wdU
         B9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771593637; x=1772198437;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yisxG46a/j9NykTgwbDnRnNT6I9RQR5YNqufY/coaEE=;
        b=DqCdDdxMmnrC1bGrZIilutVX9HnDDVbcDYSoXhmSWcSEegifSp69v5o59z8H8NAjcH
         0t0lFtMz5Ay5G0i56uTXpX4bmqlPD4TZ5rbwGZQ2nCfyur27tSNr4SPvmQb/ZRCGMupS
         L3W+yftZtY4ic3y5YKzYEX+o0eLPrkT1/mrQmlyni8vIYMWTt5Ua6eRJM+S+uhQL9pFu
         iLdosh46gKo9zMMsohp93rBDaaiVhVHhgGlkl6P3gvvEPU5ourlYnFfFaO4shClIa5U6
         0HOvHud+DAd0BJFXFaqK3G4nkIMZXqSNqV3KprDM4tJz/+4ocfHQafCfNX5dXukXYBZ5
         XGHg==
X-Forwarded-Encrypted: i=1; AJvYcCWVnFFPKkQpp9XAwV5PP2f6zYRlCNA6q/ILAFcQPoPwCautppBumHA5tpj6ZUTeMEfzwIyPLQexLbRhSK19Bg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTM8jWS2QQZqubDb7WkiFMKdxGDFO0jlUhYPmRju6O6fU16OUu
	INyLVbLe6IGSnpGFYc3noFuYqBDHUI0L6yIhJjYrPlqRxG3+6XKxLZUo
X-Gm-Gg: AZuq6aKsjP4kuXGqZZr26RjhHmXTRTc9umeNlOPjj7NpR0GQ3IaxOilGXKuOLerIVRP
	c5k+nDQCJOawODgZjm/RmP8xFi+Dc/5ATkTcfe78a3dzkeY05IdOi1LHBI4PcIQiAd5W704AbFZ
	iWKRdyHEEg8Aaj4CcY8UYo20Cf71geiSWz4+n4LatZk/Z4BLfZM9VCySESkKUTi3xtpPMXq2KzS
	SDh4NMzl7Q3phcwOVTzQQmDwVm1akQf+Ll5o8BrtWRg1cGa0AbYbJu5ryX9ahe2XpdT1O0ge+Yl
	kigKlIrDphZ2gKHRkGvKaNGkKdIkUvjTsDBpj9M400y9JPxd2sGJnOYD20AKaBp0ZXl57tsyiyg
	cSaiL9Oheh0UAnaCidKkUGDVk9CoWvmoiPePs7AznKjkfTRj/nDUhR4lZuKWQvTw5zW2BVyuoJu
	vgU9PTk7qDN6i9DPaEQL+qoXzmEXoTQO17EqS8qt8qHhn99EArec/A0/EzlM4f1XuqE7qnXfuFt
	RMWcRrxUmmfXq4eAsXpTpfsmLpfgbQMmwWqDlMhVc3aOMSgOn2G6zSOng==
X-Received: by 2002:a05:6000:400e:b0:435:9882:234e with SMTP id ffacd0b85a97d-43958e58315mr15302003f8f.59.1771593636717;
        Fri, 20 Feb 2026 05:20:36 -0800 (PST)
Received: from ?IPV6:2003:df:bf29:9000:7fb1:1192:aeeb:ca3f? (p200300dfbf2990007fb11192aeebca3f.dip0.t-ipconnect.de. [2003:df:bf29:9000:7fb1:1192:aeeb:ca3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5acaasm51063862f8f.6.2026.02.20.05.20.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 05:20:36 -0800 (PST)
Message-ID: <e5c01465-9571-442b-8490-6ae336cffba8@gmail.com>
Date: Fri, 20 Feb 2026 14:20:34 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] rust: add `register!` macro
To: Alexandre Courbot <acourbot@nvidia.com>,
 Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>
Cc: Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 Dirk Behme <dirk.behme@de.bosch.com>, Steven Price <steven.price@arm.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexandre,

On 16.02.26 09:04, Alexandre Courbot wrote:
> This new revision took some time because it is (yet another) overhaul.
> ^_^;
> 
> Thanks to a breakthrough by Gary, we found a way to have the I/O type
> perform the actual I/O instead of the register type, which moves us from
> this access pattern:
> 
>     let boot0 = regs::NV_PMC_BOOT_0::read(bar);
> 
> to this arguably more natural one:
> 
>     let boot0 = bar.read(regs::NV_PMC_BOOT_0);
> 
> It also has the benefit of taking advantage of deref coercion for types
> that wrap an `Io`, something the register-based methods couldn't do and
> which would have required extra `AsRef` implementations just for this
> purpose.
> 
> Furthermore, this resolves the inconsistency of the former register API
> that couldn't use the `try_` I/O accessors (and even had methods whose
> names clashed with them). Now if `Io` supports it, it can be done on a
> register.
> 
> Another benefit is that there is less work done within macros, and more
> in generic code, which is (generally) a win for readability. The
> `register!` macro is considerably smaller and easier to work on, and now
> mostly made up of the bitfield accessors that will eventually be moved
> into another macro.
> 
> I decided to remove a couple of tags because the code has changed quite
> a bit since they were obtained.

Last time I gave this a try was with v2. From my aarch64 simple timer
test on that version I have [1] below. Could you give a hint how to
convert this to v6? :)

Many thanks!

Dirk

[1]

register!(TCR(u16) @ 0x10 {
        9:9    icpf;
        8:8    unf;
        7:6    icpe;
	5:5    unie;
	4:3    ckeg;
	2:0    tpsc;
});


impl TCR {
	fn handle_underflow<const SIZE: usize, T>(io: &T)
	where
	    T: Deref<Target = Io<SIZE>>,
	{
	    let tcr = Self::read(io);
	    if tcr.unf().into() {
	        tcr.set_unf(false).write(io);
	    }
	}
}

...

// Reset the underflow flag
TCR::handle_underflow(io);




