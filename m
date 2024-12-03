Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8C37DA67
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226852; cv=none; b=iw7J5bGgpKHuZCHqf375xGwrURBRt2KdHRRsIlOCdFWn8e6iTDhRZ00QbHbj+pA3viOp1usAIfAHt+mugQ2XETQxYuhAlkhuO4n8yc8JbyjBatQOJdmbV5vZO93OmteYtuO/h7Vc6+2GFo7HRZ1X7xUgw78AO1/8SVIETqukf44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226852; c=relaxed/simple;
	bh=iZ6iZsYDGgn6+nosV/i7U3c9sBZT+1+wu183Z3mPfA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UmARPqkc54ElvJiJDNiqllzp2y87Y29mFTIW1KiAnEEjQYmfxN90Ducuk6WlO2IdV6XT3Ds1dBZ3nKq32Jp0ubmy5hOXPnDoB4vMnZ2f43tzIejpxT4Ag4TZYkORvrSG2uUVbq+VpNESiogSPu1x2trEzePIAV1ZdKYoDMBpzHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C1+/yZjI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C1+/yZjI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385eaecc213so1406241f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733226848; x=1733831648; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZR6c9RoUjrM3dk40cs7PLYguaqe6xp835zylMe9vPV0=;
        b=C1+/yZjIPX22lJxVL5/59K8t2UzOxMgAMsfcH7jg7yWyPNbsHsdhExoI8UqKrCzj1D
         GYnWn2J1/IwyGF9bUNQOJRKG+ChCpUfdZno9hxSl7tfeIau8TMi206ETwDV7y7/n8Pp3
         KwzqWMkVebo2qOEgODlPjYMW99OEMCyIFwW3JUn5BM6lXh0p/t1oJWKCEmkdJOHqES9e
         QMfhKZ/heaYvjqad3m5S55UqsQmj1FwBcnmrrgoYIlrTMrOHgbdDKrYj2lvuQ/Py7ZU0
         C1BgnUljwa9mdnCWBb+1L6GHQR7Y8E1KmTi+yR95Wz4Hp7ScaJPPu+J9m+INB9zj1efY
         yuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226848; x=1733831648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR6c9RoUjrM3dk40cs7PLYguaqe6xp835zylMe9vPV0=;
        b=qz5mZLvDGLaEcTu3JEiTX7LYoi/ObABrhgMbFMoYTIdlNeoJkm24ijiXpYXG+ZHwFA
         zWfKqbYNqhCP6gbkc/U7HrX0VV/3ySYODwcgWSQVLcCj4In92srTBGK24hR3jQ6NEZbC
         jGQZTRCuw83YPyKZxbRtm6PtUQ5kEJXssjWSnB7XEGIqAxl1g6qDH34/Qz9C/NFtQNQr
         bXFkaYJAjirCnY9eKDPfYi5gAIoqkxamtLZcDfUECsovhPczeVdFmr+kexozJ2R3k5Q4
         RfUBKy4ctwBMSrC484Upat8e5kcB/lm1LX9Dg6gG5vMGR8tm0Qe/eZPbjkY50sm+P3KN
         CeJw==
X-Forwarded-Encrypted: i=1; AJvYcCVuI6XpFoxEUnoWZdqIIbtDEwvSeztIWm9OyiRMoeq4IM3f19w7/WnDWMByvuAjPFxHgFtc32LhHjp119dvYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJGugM/MYocLEPJIF+mDcOPnrMF3ypRGWxqmnn9LnjTviEApZN
	KbBDjWR4va4CAP00TC8/OmIBes/U79quYin3RcQLvWMHSWr7jNSDDHDwytLZJfg=
X-Gm-Gg: ASbGncvdzCEf7Lu0b9KlZc8IYLJsFHsAoK73/hiuCBpQWzELdIEwlUr0dbWqOhHnlJ3
	b/+BvsJg+tlF2Ez2S/jyIaMv5fuRhvMoCgcVajPWwN94tGSvv3XsgCa9+uEGrIx4otvOFi0H1f9
	iiu1ci3FwbpSfnCdUGMBWaToCHT7ZqvS5uMUsyZcf3uxQf/2wK95LHlbxahWHbR2bxCKsJ+CUzq
	bRUSJDn1hORFzD7EJtocXCCYXu/YdI9lAgeGyLUiHvtM5UBTr9MZg==
X-Google-Smtp-Source: AGHT+IF3C+gAe9enWE6coDrJOE0PJBinw+OtrvrTgQQOl+8HAIq0aTYlzIw7cnuVNYgk8Zd7vO+IRQ==
X-Received: by 2002:a05:6000:2c2:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-385fd969071mr2152487f8f.2.1733226848550;
        Tue, 03 Dec 2024 03:54:08 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385fa330ca0sm3064430f8f.11.2024.12.03.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 03:54:08 -0800 (PST)
Message-ID: <32fdbc0a-ba70-4d99-93c8-15ec8ebe6f70@suse.com>
Date: Tue, 3 Dec 2024 12:54:07 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/18] gendwarfksyms: Add symtypes output
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>,
 Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20241121204220.2378181-20-samitolvanen@google.com>
 <20241121204220.2378181-31-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-31-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> Add support for producing genksyms-style symtypes files. Process
> die_map to find the longest expansions for each type, and use symtypes
> references in type definitions. The basic file format is similar to
> genksyms, with two notable exceptions:
> 
>   1. Type names with spaces (common with Rust) in references are
>      wrapped in single quotes. E.g.:
> 
>      s#'core::result::Result<u8, core::num::error::ParseIntError>'
> 
>   2. The actual type definition is the simple parsed DWARF format we
>      output with --dump-dies, not the preprocessed C-style format
>      genksyms produces.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
