Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC96D33D6C1
	for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 23:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778454394; cv=none; b=GGGJytUZm3ZykbteF49hiHYfBbeknSjGo2m2DecGdn6bLuWKOqDHlSmlbNDZwCV8DPltwbuCzNmBogR4SefOn3HN9yJnXaG+2dahR4+2iI5r78mulkYSE44UaRoOjBAEAaiW2phrq7f3VTR0LldR9OEAdmTif0YW56lcc2ExdZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778454394; c=relaxed/simple;
	bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eh54DBtjVCES69rDKl13+JyyqFQiayEU6dIZOmgBRKps6GRa8ghdc2gT2xT1Q3dORBTZpnI6ZIfBU6PJNXwgcl7qOf5Kw4RCAOlQFoaQcOopvuw7fVt0sHoC0rIGXUFfU7KFKaUcsKMs7Y2iFuGiW5Rb7mc0FVLm8YAeQByPI5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmsmNZsx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmsmNZsx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so1839174f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 10 May 2026 16:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778454391; x=1779059191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
        b=LmsmNZsxlnX0RFrXBAUgz3AdYYmRjtiQ0pY5/vyXLRxHlmF00je4/4S9LQ+1vKMebq
         IUiyDVTrncoW0BUICF7cLnE9sCUfVrd8iugJew5xynHN7rzpGGqrPmnw/YRqWLSzrLmd
         lSNITbfs33K4P28tc9FG+pdWaZosD/h61pZUzpuC8tyTp/OmCGifI48EBRLOcXxi6+q/
         fJnSobTyIBDZwSdkcG+gNKtqBvA0xQrhg9SRMFAveCc+/GpkJjYEqA1WXwhEU/5LyquN
         bUN62Qclos/LBxRGvc280xxAbj6RMZKBGeuSestfgND534w3M1185tma5fvIXbs55fLO
         cS7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778454391; x=1779059191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eemCiHiNS27wL/8fxUZ2muIoAy472g5AIstMVrvrMQs=;
        b=coeJfhmjINJmEDpN0Oo+jy21zp7s72esqiv3H5vV94DEebQsFpXOFn7wDpmPfD0Ckk
         4IVKQ3PCs2sp5W/wqZK3ep3wWKNRr750hi6pGleFBgDCHLVd0+GaTHrlTb7/vzVXPA4b
         A8rfSgKLWjjt8VLXNPsm8+UFAFDfVhdjC0r8FDtnSlCBvTItYhj4KaOl/ejpgNJ9Go8g
         B7amYbzqR/xjYy4bM5GSGlL+INwre/hl+eOQl0wzgVRAIfNHyvWixJUFg75652QsyWfz
         aE+UDZfGsayyq6wef0pfsg0p635TjZQ+YMIr12yOQ49aaeSa/rpsaRmGa78UGPjyFkdz
         x9eg==
X-Forwarded-Encrypted: i=1; AFNElJ+WZVJIgYr346OkmqG/YmnPrKvg7e5ncnKFEHjZFgWad+0psPVT0RBii/HqlY/K/VHJDyvg3oHASh2r3sPaOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvjulMU0IGdtBQ9g1XFDimrgmWYFxW/gV1vl1Jsrmr43jrF5R9
	zbUg5whURU5tOxRyBkGrEop1bflCLRFIjhewV4tmiUkPBjDs4PQRFl/J
X-Gm-Gg: Acq92OHrhDTvgJTrJARowkPBfLWRQgv8Tk/gkEWe+fyx/7atIpGT+Ud+rFAN+gOrY0E
	SEcLUbfibJt+n2sr//Jrapt/w8FwZ7QDlIwPrkssMUaAUSv93l9mA62t5dq18F4l6s28Z9KrlvL
	9X+OP+JNe7YwoEkGgspxtjCQFbVXHhugEPkXAQQs4sbbL7N+znP/y9896zKMxm9yl6IA+PJjiDP
	UTgRlBBhMcwKuMP9RtCevFOJ7g3WVhoemoesR2g1K1fPa6Lh77JlJOpVzR4T12ZaI01sFqZdSL7
	5JUJEkYcgkc5hD180earwqTjnBeU5ycWbBy0DuXsGNItW4vLc1F2/4EuieZ8W1QmYddsQJEEEzF
	Fc7pau+0+/0YZOvEwPjk9g1MH4/Tw36nKhf6ZM6+X8kR9JXw2Zmg8oFAL6nb6nMx97OZx4Mem/C
	LMpDH03hhDKOfEzj9pUVJurZDWwQGoGzWybA6Coc0TsdUJ2NcN579QKgE=
X-Received: by 2002:a5d:64c7:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-4515d5c6c70mr34288383f8f.35.1778454391049;
        Sun, 10 May 2026 16:06:31 -0700 (PDT)
Received: from [192.168.0.41] (bl21-200-180.dsl.telepac.pt. [2.82.200.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548eb75c29sm20984879f8f.9.2026.05.10.16.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 16:06:30 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <851ccd3c-d86a-409e-bd73-f0ef10b85879@gmail.com>
Date: Mon, 11 May 2026 00:06:26 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/2] add kconfirm
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Jan Engelhardt <ej@inai.de>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com,
 akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org,
 corbet@lwn.net, qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <q02rn6o5-5pr6-1744-6os9-1052roro79s8@vanv.qr>
 <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <CANiq72kUD=s7VkOUBNFLbcASvDoO_qFXHziOcSFdDqtg5NXoUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/10/26 10:49, Miguel Ojeda wrote:
> In any case, when we discussed offline building in v1, that did not
> necessarily mean vendoring every dependency manually into the tree,
> but rather let the user set up the dependencies before (i.e.
> connecting is fine) so that then the actual `make` steps can proceed
> offline. For instance, using `cargo vendor`
Hi Miguel, thanks for clarifying. I think I like this path (user
downloads dependencies themselves, outside of `make`) the most. But I'll
wait to see other opinions.

In this second submission, I had attempted to filter out non-linux
platform code and tests, docs, etc. from the dependencies by using
cargo-vendor-filterer, but yeah, it seems to have missed some things.

So in RFC v3, I'll likely use this design of having users run `cargo
vendor` first.

> By the way, another option for that may be using the distribution's
> registry (e.g. Debian and Fedora provide one through the package
> manager).

Unfortunately, it seems that there's no built-in way to fall back for
other distros:
https://github.com/rust-lang/cargo/issues/3066

The workaround could be to create various Cargo config.toml files, and
instruct users that, for example, if they want to use the debian
packages, they can download their dependencies using:
`cargo vendor --config debian.toml`
But I need to test this and confirm first since I don't use any of these
distros.

I appreciate your thorough feedback!

- Julian Braha
