Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C91C68A1
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Oct 2024 14:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727791694; cv=none; b=I7h8nNuXat7xUYl4kNz0i51HGx1+O92vknDkeGDvPZHainXe2U+JAasTdq+GYdN/6BV77NMAZ3aXATT7Jbf1T7XmV+XZVO6q6ZBNe3nc+ijvjFqN5i3I3xq69T4jYL/eAxBw3bVTCj306Ge52OectUSVqLcCnvPDYJfF9EADVgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727791694; c=relaxed/simple;
	bh=BomYIPLYM5BI9NRjik6sw8fZV0AIRi6SbLd8MV+XBg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ob3GAOLoVs7zqfDDauMzy8pv0wyEEphZYFVxdTzN9E3v+7CLOP7kEuIl0FRQt4jdwcLThOIf+T04rMFo9AgTsXNZxC/dXZyr9QXxNUnLNp+AFgqvf4W8jdcfTXYI7c/Xy9ChNssJzbvRUe5hFh9ROVgv12QeDHW/lVke9PIcF4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P6QjCZOo; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P6QjCZOo"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso914765766b.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Oct 2024 07:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727791690; x=1728396490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuxy9H0NBJRRS74N6JfR6UfMk8p+Pp8gRC0GHyWlDK4=;
        b=P6QjCZOocYX/TymCID2swxqbhqENPZNlKJn29SPinWuWswEm/05d0pUZRqstr8xOjF
         HbVCtzjkJAasYQRyC8HuWieVQtDNks1UEB47MO0FAYRX+WfN1PYv8u0/Yt/Uh3iqnrPJ
         dfaamCSO+U4gjESZvVnNlNx+cLmCvpOeF4HLtY8adNl+HUGGJXZ4vectA/An/V3v3VJr
         4nfAgbCRfPh+9xxRL9ScNK8SOSZVXfgVqU1kwn6S0iLGouGcj20chCVEiHCIgvORWbVR
         miXw+OuwmsJbzrRDK2doafhLfJ8yzv6zEzMIP1FYXTiouyODmK26JqH8dTEMtNgMOYB8
         0I4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727791690; x=1728396490;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuxy9H0NBJRRS74N6JfR6UfMk8p+Pp8gRC0GHyWlDK4=;
        b=sVul4JvEYgp0kMqlW+551EMFSLldw/nYH2fYRwwulYHqRPpf9foEyfFW0QNW74P0eJ
         myHud1GflSJpi3q4C9h57j33sbtkvot91fC7brQl+5wXuaAqz4QtJXqywqPlSGXGxXt6
         VGsTP4WNAlnOEdoqdmfWSWFHK45VLdIe/nabfkJnRgUOQLZg5uqwxhqrSqXjEWvYSYYJ
         9Ahl01Zh1C3P5g0Q72RLE+QpzSt10ABWx5YBe3UIieCLdivaY3NWt9Xzd5IHbCySA7Of
         bSa7laT3V9LfQAuVsZYQbVcVE1QoHR8oypJiQ/4/XpltDtbduR3soUaTbrVuRt6fk4bK
         Qzjw==
X-Forwarded-Encrypted: i=1; AJvYcCVdceGu/MYGvPGr3/KDEV/UuuKxlfw1xqKik4qAQawWAR0P5Mpcji8hnOdPfgW12TPLj3iLLhWpWY/K//i7xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+pPoLZeOUQV5qHM5cxIcC/VCGJQOO8qfVKYVeojvLpdh0alU
	7SuSv399W0iqzQP4xi4nSPeY6NOt4RxpV60D8E7m2HzYdwUjz75oWk3rBvrCThw=
X-Google-Smtp-Source: AGHT+IGtCaqW1iYqY0ka6u8nR5cuIhkkzcw74TSNyxlTUt01ZQat8MsCjI7LNjjDnGVwTilgDCrZfQ==
X-Received: by 2002:a17:907:7ba3:b0:a77:eb34:3b49 with SMTP id a640c23a62f3a-a93c492a5d1mr1614882866b.37.1727791690027;
        Tue, 01 Oct 2024 07:08:10 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2775c22sm715531166b.20.2024.10.01.07.08.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:08:09 -0700 (PDT)
Message-ID: <6d0a36f0-6534-4301-bc4e-929a2e779e1c@suse.com>
Date: Tue, 1 Oct 2024 16:08:08 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/20] gendwarfksyms: Expand base_type
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>,
 Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>,
 Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>,
 Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20240923181846.549877-22-samitolvanen@google.com>
 <20240923181846.549877-27-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20240923181846.549877-27-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/23/24 20:18, Sami Tolvanen wrote:
> Start making gendwarfksyms more useful by adding support for
> expanding DW_TAG_base_type types and basic DWARF attributes.
> 
> Example:
> 
>   $ echo loops_per_jiffy | \
>       scripts/gendwarfksyms/gendwarfksyms \
>         --debug --dump-dies vmlinux.o
>   ...
>   gendwarfksyms: process_symbol: loops_per_jiffy
>   variable base_type unsigned long byte_size(8) encoding(7)
>   ...
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> [...]

Looks ok to me, feel free to add:
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
