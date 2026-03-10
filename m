Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AE036D4FF
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773187059; cv=none; b=tYFwp+BgjeYNUgcABcLlJSnEg2kKTAm7O1f7cgn3s9Ksz9DGnSBrLK97vDaVGxuCnGD6N4pELzedT/IzByiAauLRFHrO6u8xPQ0V3mneMc6q/VNC2CJSDaWC2oB8ZJOwxROu8eI6+2h7SPWPpXKDnLbSyOm6cbxaaHWHtuEehBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773187059; c=relaxed/simple;
	bh=cJP0g25EjCZz5LlBgTEgoSsBxXU9wIOyRk9oOM+QSrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/Y1S9zgsZ331V6DJMOw7Dedqrl5Exd2yyCzLUfAaoA3EoPqVD+B+BPVceeVQXwpHdSr3WZvh+kda/ae8FQ8IFkoZNC8AM2ae6cNWKhFYEXmgbw/il7o/j3qNRuElGMpZz32P12rT4v1RiHtD3XvN7+Ukp4+hmRAiad/KMkYEsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIFqrWbB; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIFqrWbB"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2be27fa54feso11753979eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 16:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773187057; x=1773791857; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cJP0g25EjCZz5LlBgTEgoSsBxXU9wIOyRk9oOM+QSrc=;
        b=AIFqrWbB3b8Q2yvMj3UY2nxw8dWHRt1+hLZDX3RPfurL0kLnPSu85CgFt+mBTmbbbV
         Gp3Kr2bCs133zdutc1syhVa5ODeaxptTEGcgoS7crflssZy4gjxQiMSYjRisYzopnW+m
         rMH4iIOwAj0Ss1/+2ze+VL0oLnDlKOeEltaVFO75tSooGvbDDwMEZAHLvFCauGWghROK
         UKG4v65JvDjT0dwgHyBpO6PQnMpMeol/6i2ekuslS/NZIyn9DHAWujdPfIaMyMLp242b
         Bp8midURrAAyzm2WYlMXQxn2UWTs6jGjDDXsdysUnh/Qs93ZDhj7BDuVhSvhv12gEtKB
         ZzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773187057; x=1773791857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJP0g25EjCZz5LlBgTEgoSsBxXU9wIOyRk9oOM+QSrc=;
        b=hqUtuzFcxB7vuP1mr6HbyYaG12NrrF8yVkID/8zpJ8MOZcL1syJraV7N/IH5Zv8lO1
         S7mw2xTs0x3JKs+8pUlVc3tSwv3/0fqjeDQLTcDCQ7AVkOIUgw1+PmCccX5pheUXwSkP
         pFKmlIbalLmfCUFADbU4Qbq1zf3Us5CSG/URl2sf4vFXShU2qEXNQIUbfMy4G5IXWO0r
         ozFKkyDkfRmhJRB2lU7MSDWcKx7GkxG0Ubscul95950Rfr21B9AZRY4zMZI9LEMrGhHG
         iwaoHB2uBp6v1TkDTdYXEJUfXo9JM/EiOgFTc3Y28y8WRdGBOrHVHAGifgPzho/gPisU
         S/5g==
X-Forwarded-Encrypted: i=1; AJvYcCWEIYkxjGyXzEbWlpVHWTiMv/9gdh/iIx5IiPMOjhvdvu4HX4i7nv+akl3frhf2JXsay26h0rv0uB9Dz7J0yQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy54hJMrFCIYyn+2aLjN/lARzDNsxq7ZaBapP0H14XinUhKu1ur
	zqDZIQ3rtMycGO2+DQeh+vmbfjh/DUM8PYBfrlI/ZPu85Cn08YNJxoxp
X-Gm-Gg: ATEYQzyEd6KLarMt6haPtCfcO44uRNGt6n/KalDSoXCyMkEYm0MsEO0jO1jCr8vFyA1
	PH0ZBVV/QX5T+nY+6toshXNWA9iZF/YAOuvFe+DRbifSbHpnsSVkajcznYIDN8PKWcWHUoR3kpQ
	hhUEvBJduC3FiEjRhC+W61/noOZVFubvGcov7rms36ACfK5kUTNqZqHT5qBMcSmeq7b+euVG/X+
	/Ir4qJ+3BVsG3wRhVfboIuslU2/pDNIFWWJJ6Hq0SHNv/LyS8zEs7E5G8hkQbd+Q3INpqmdGpaR
	iYOuUr0pEr2VKGtq5lvyQohWxGjGlAf7piZCTGPSzMRiqZsAjL7LPKjQG2PSHOzSBD1SuWdfAHD
	YTHCKTe3So6A/n7a9MK/WMNSnx9PxKQF+SApiJb5Bh3hz93rt+y2Qwx+SYLQfnG0a8pmL9U3ifz
	A4jsoHNXZbhrDucsZhhnAxM0TLxTInRAz8YxIDMXoy
X-Received: by 2002:a05:7300:dc8e:b0:2ae:51fa:b7ec with SMTP id 5a478bee46e88-2be8a2eac77mr236090eec.25.1773187057388;
        Tue, 10 Mar 2026 16:57:37 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be8aa4ff75sm468057eec.20.2026.03.10.16.57.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 16:57:35 -0700 (PDT)
Message-ID: <b6558f4d-e424-464a-a9a7-ad14a174c542@gmail.com>
Date: Tue, 10 Mar 2026 16:57:34 -0700
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] docs: sp_SP: Add Spanish translation for Rust
 coding guidelines
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Edwin Toribio <edwin.toribio.j@gmail.com>, carlos.bilbao@kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260304200715.76360-1-edwin.toribio.j@gmail.com>
 <20260304200715.76360-4-edwin.toribio.j@gmail.com>
 <389808bb-f71d-4c35-bfd0-b4db14268d58@gmail.com>
 <CANiq72=Qe3x5xVQsFOd4YuD35mOan=mUt4PEFRQvStGnmLUcQw@mail.gmail.com>
 <25240ce9-0886-461f-a969-d049c84ae80d@gmail.com>
 <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <CANiq72=ZBYS-P7smq3u=CKN5y8_LTo5jThAegCVHhmo6TXTdpQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

On 3/10/26 13:14, Miguel Ojeda wrote:
> On Tue, Mar 10, 2026 at 4:33 AM Carlos Bilbao
> <carlos.bilbao.osdev@gmail.com> wrote:
>> TBH, a reasonable case can be made either way, and there are no written
>> rules on this question AFAIK.
>>
>> In terms of precedent, the Chinese (simplified) translation keeps code
>> blocks unchanged, which I suppose avoids giving the impression that
>> non-English comments are acceptable in kernel code.
>>
>> That said, the goal of translation docs is accessibility, and since these
>> are illustrative snippets, Spanish comments help readers follow the example
>> without having to switch back to English. Personally, that argument
>> convinces me more.
> Yeah, I guess it depends for whom the docs are meant, e.g. whether the
> reader is one that will afterwards go and read code or the English
> side of the docs, or whether it is meant as docs that external readers
> may want to read to inform themselves about what the kernel.
>
> I don't know if there is a policy for translations about this, but if
> it doesn't exist, then it may be a good opportunity to align.


I'll leave it up to you, Edwin, just make sure to leave keywords in
English.


>
> (Relatedly, machine translation on technical topics is quite good
> nowadays, so if the intention is that a reader may read the English
> docs or the code afterwards, perhaps it could be nice to have a
> suggested way for them to read those docs via machine translation,
> especially if there are accessible/free/OSS/... solutions).


Yes, I suppose one day I’ll work up the courage to use automatic
translations for what’s left. But I’d still need to review everything
carefully to catch mistranslations (the classic Spanish example is “driver”
to “conductor”), though in practice the issues are often subtler. It also
means resisting the temptation to skim large paragraphs and trust the
tools; something that’s probably more tempting with docs than with code.


>
> I hope that helps!
>
> Cheers,
> Miguel


Thanks,

Carlos

