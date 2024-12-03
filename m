Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3320D1DA0F5
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733226915; cv=none; b=DfF3qeIe/J6PFGamwnaRKJ6+U1HA6suPkKGHxZNsUkhK+kU+CwJKFC/CUzeVnUO/tyMrWFcuX4lWMIs651rpXApj+woNJ+TBYHyqucEOzLVwDfqSg7W2DPvKE1tetPBmCTz95JftMjbJfS7F9EkXsbvrQYC/Av8eBF3kzi2ou4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733226915; c=relaxed/simple;
	bh=v8zoQZ6dwqd3xojwqV6vSH8uy1LrM8PkPp2K6MbPIqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JR/kOOi91G7KXQ/CL7eOQqa0ezCpvpN4TpwgXFD0W0rFojFPtHWSIY/y6AuL+GAJ+pG546gInYcWP5susVdk5Vrs1SHeWA2iCa5a7wl80aru2OpAtVs6HJ3FDrWmknU6I6+KGbVdzrkkxdCEg3/IYq7djxpesyTwsOpmHXNobZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IfxbmrlE; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IfxbmrlE"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434a10588f3so34943115e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 03:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733226912; x=1733831712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=on3sYEGd2/W0CVrqLqHMmcTuEZdP/rp7cfagL/Up9EA=;
        b=IfxbmrlEq/cqZnRsNzpIw3k4ZKN1AYKDms//u9Np+68kMEFfO82QqNFmCtJhIBQ9rg
         eOHHV7XJ6DaTmnVFaT/3ayaEtFDKCz1TDAVRnkICnOutUExmg90hUn7IPEK8aBlPGcjw
         nJt6YPntx1ghfjwpcXOQcLgmk08cXTcBizL712fE4CtXnwMRx2puZw7nbMgrmcTBabin
         JEmrloHTNsNTWZMG5AMOvkVPnY/+jS5rmdx6QenoxxTtZB5Yqvg7fGZ4NPQAdIF5rhyL
         BL38DQBZBZ0sRK96U09l10l5+98Doa1QouMpNKJNv6RnzwFTb1eGQaubvXyfX89LWoON
         DS6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733226912; x=1733831712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=on3sYEGd2/W0CVrqLqHMmcTuEZdP/rp7cfagL/Up9EA=;
        b=ZOnGW219dJ1f+xGtQKaos7VC4iKzjTch3WUYztC5VXiQbB2yi9kodHwTnp8PaiBqLN
         HprLlAAFF31d53r+508ECb1rtbNkrKGS98YSnJ5HL/ESEDYYIW4xYFpjJIspW6iVTlBX
         TKTM85S7QU8RQAeqO/qsBGpsH/ajfjs/GE2iOX9TTToRUnT7HFkOYvaTYdmLk/ulOXiF
         fUVSRBjJSfT1wPZCZoMCj9xOnf01RbKie6zm42RK6Ud4ZVXQ4dDYXC1hGRF7NTPypujL
         iGmxdl6tbrkinkHjRhVh0k82Ko3JxklvG4ei1wmkWMN3PX03y0DP8VOQb1eiwz1isVvz
         c1fw==
X-Forwarded-Encrypted: i=1; AJvYcCXx53eRLH2504WYjwnnC+EtvmBYQKua6p1vi/dY6ayGBtdHX2o13QWJd1Jofv17Ap0qWXxCw9Pk3QY5gjz8LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNWLbZ78Y5h5ElLrAFReAFvx8fiAF9EXb7xtPaOp0sEOFBZErD
	pHwShkP4n6gyJxn49T9urYp8ZTfcjqydM0QszL5eCTlpgz4svtd+jqbwbJ0et08=
X-Gm-Gg: ASbGnct/Xo9fd9Jl1K+OiH6b1k6UTGntFFfjNP8pcEIhoZAaLCPiVv7obXlXfLeupvS
	tMHozJ4IfHOFusvBEWQvjR5PyG+6rqbdq5dZG92bhi+eO4LWCLhtQSTKaI5i+x7iQ5469Gsl+Qk
	tnQI9+JNgCt/WpsndC7fo9ywsTiph5xgWI/hq7RCoQElPlCUZceW1SNDQrNoXiHT3izecdWD7CF
	+V7F5VtXLuI2PnTk5y9xHEeKE5u8L+COFSTQneNZvVKZz0Me6iLpg==
X-Google-Smtp-Source: AGHT+IEOoaKE+Jx2lB/U0/CuOwfrHNpbiVubl22ruotoapXCu3d/MzBK3IqvDfPWg35JXHbV7cl2rQ==
X-Received: by 2002:a05:6000:1ac7:b0:385:f44a:a64 with SMTP id ffacd0b85a97d-385fd3d0816mr1896449f8f.24.1733226912618;
        Tue, 03 Dec 2024 03:55:12 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36557sm15172989f8f.24.2024.12.03.03.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Dec 2024 03:55:12 -0800 (PST)
Message-ID: <ba893003-afda-4615-bf96-79b62bee51a0@suse.com>
Date: Tue, 3 Dec 2024 12:55:11 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 12/18] gendwarfksyms: Add symbol versioning
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
 <20241121204220.2378181-32-samitolvanen@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20241121204220.2378181-32-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/21/24 21:42, Sami Tolvanen wrote:
> Calculate symbol versions from the fully expanded type strings in
> type_map, and output the versions in a genksyms-compatible format.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
