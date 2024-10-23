Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52A51C9EB7
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729695314; cv=none; b=VQOf6GKO7YAJlZovAU9OTcZ/Q3Bu0/Mg8whIv2GrLoyV90OCQ4pid3IjcNdCOoJN3Io313IIBBktZBsJQd+mSKYcVO5TgsoZwrAOIniUoYI0NhJ43+dJlFD4VZYUXkvenrbVNXzK/TBUWbe6K2J/9sFqqajdLwn9nQCbJuWqjBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729695314; c=relaxed/simple;
	bh=ryoYcQggY/kP3u+FVq17nFJ4+xrseLriosS64MBSjiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oMw+w/gpjM2FTYwcduGAwiHwJHP00C5buFq8cNLcHr7wGsRC2JXJ3tREF0LY49D2tV0mmb330DWiQJ67XsrDbIQsZIbLqTEn1hNTXIMz793GKTyHuaHiAmMOBSnObzFT7BBNafrteAzhgu668FKfY3UGiFeAJHq4hXayiNP7bM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=e4uPbHcb; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e4uPbHcb"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a2cdc6f0cso924008666b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Oct 2024 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729695311; x=1730300111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gxca2+tKQUchr19uflxCnLEeCJ07Xy8uJKlCwApgGuc=;
        b=e4uPbHcb6f9d+eMF168nzKA9pBtIm0r0/3s5Dk55Q51B/BkwA2UObV3mHVvz9d1m34
         6pgsFKmoWu01QV0VgD9UrPbZdrztpsSvM6bylIvy3Gmm2uEmFJCOHo76soLnRhyN5Prp
         /JhPf7G+sRo89/pTxdcC1yXKVqXChkpt0sbjTa/7LbDVbIQigin0DFOlvffk4wwaTT24
         dHiEdm3firyi1p1FKdwt9R7ssyUlLGQqWEXPOjs0OMP0cbbMlKjdpOWIFNpc7SeJe6g4
         HKDn14rIPgB4r1nxBZ6g0ebPUu40aZT2Id8zUnY0LIuVZbHMHvdERpVzVcLNEJyVOh0G
         YZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729695311; x=1730300111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gxca2+tKQUchr19uflxCnLEeCJ07Xy8uJKlCwApgGuc=;
        b=rTkEu6yVRQbY4XFLQ7sIc4Q7JBl1isGSVeR6AFvL0jZdQ+qqgypVykQ+XC1MkiBDm4
         2w7Fko+uBzeqkHJ9n4FVNIstNcJgXcH/C0Qw9ReytKyU+qqm7rcXdziGRsBesOlh6JZP
         r/h7MgAKHX/8EgrAk0F78jebei/XDycqqVu7138aD50W1PdDJ2EinCwpOY0XIzsA63jV
         VRKH0bYTJHxhs5esHKguyd7CbmAKaOgv6KOXgVm/I575GUQZa/j5HPrI5WFavbUPKhFu
         pBODlxMIzQhSp62cLPwcpVJTCpGmJgVVPOKmm1RKnzwN9GJOmw4I812S84ZjlDt7tBoS
         UafQ==
X-Forwarded-Encrypted: i=1; AJvYcCX77kva4JDeKP4rW1MLqEknt7+rg4GgM/8pogSiPvVdfOl/NwwzPbo+ajj701T7yVxx9L5pyMgrM5gKfj/+hw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+CJSyqPPKLhwO/k5iYRG0sJkGAXScsFPulbp/nJSXQX2UUBnL
	AuvLpqfenRNYsJ9YNR5Fn1BVOj8uoiYPbdxaqQPwpl0aO4NFkCFBTu/3xCkOY6k=
X-Google-Smtp-Source: AGHT+IFF5GkyZ/SIiWUhNMG76ItfLSNQ1wsWrDDpfsA7r7xDzkAJuk4mXSah2g/qB/JAMfOt/g1vYQ==
X-Received: by 2002:a17:906:dace:b0:a9a:684e:9a64 with SMTP id a640c23a62f3a-a9abf96bd4dmr274083666b.61.1729695311081;
        Wed, 23 Oct 2024 07:55:11 -0700 (PDT)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a9157170esm494220166b.144.2024.10.23.07.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 07:55:10 -0700 (PDT)
Message-ID: <ba3199bd-e891-46af-832a-9194b64a3d39@suse.com>
Date: Wed, 23 Oct 2024 16:55:09 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/19] gendwarfksyms: Add support for symbol type
 pointers
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
References: <20241008183823.36676-21-samitolvanen@google.com>
 <20241008183823.36676-37-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241008183823.36676-37-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/8/24 20:38, Sami Tolvanen wrote:
> The compiler may choose not to emit type information in DWARF for
> external symbols. Clang, for example, does this for symbols not
> defined in the current TU.
> 
> To provide a way to work around this issue, add support for
> __gendwarfksyms_ptr_<symbol> pointers that force the compiler to emit
> the necessary type information in DWARF also for the missing symbols.
> 
> Example usage:
> 
>   #define GENDWARFKSYMS_PTR(sym) \
>       static typeof(sym) *__gendwarfksyms_ptr_##sym __used  \
>           __section(".discard.gendwarfksyms") = &sym;
> 
>   extern int external_symbol(void);
>   GENDWARFKSYMS_PTR(external_symbol);
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Acked-by: Neal Gompa <neal@gompa.dev>

Looks ok to me, feel free to add:

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- Petr
