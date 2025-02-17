Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B8B155321
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Feb 2025 10:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788065; cv=none; b=pjBidektCg4REckTqE6zVIWmAIRPhVTS14cRLLNw9ia7irB6P5j9pGfUnMq5HwNH3s5iJZopFzNd9P7k1rkt6ANlvn3kGVmFRPo4otB6ClegCZHDfJw7DXAlKOupz8saLfsqK0ECHJtYnFLdhvHt0EcMgUMO5H7+YNDJ0J+3Np0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788065; c=relaxed/simple;
	bh=EK+112KzZRYcpPHXSL1MB9m3HLKRqSwNI05I9TJltSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dALIRftLi1AM2jDUnWg4otxvcUX6VT5QMAHBclLuos+Nw+2Rlqf2W8S2DyjGWRJJi+LkiJBAJjvLkxm67nYvgIdY0OmE/DSIIBkHCoChfISLDeHWTKqyltKHE/MiaBWuNQsF2iJA5yB6z2quV6BlKalqXs/aucUwNq+vTLP12Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aKdVlrzk; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aKdVlrzk"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-abb90f68f8cso203444766b.3
        for <rust-for-linux@vger.kernel.org>; Mon, 17 Feb 2025 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739788061; x=1740392861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aUsyjtdwJudOrq2BVYPPPLmXtZGANjt6rB5YxXGDCHQ=;
        b=aKdVlrzktnUkea5HDMMTnv4ZhtKw1+cqiE2E7M/JLSD9dR1je6nfLe2j2xbFdPKUqM
         3bX9gCAsdlslWcmwZ4MWquO/rzZjSjbtzutHhQT3MSFvuG3rgIcKmS6luCa7Js+op8Jk
         7o5ZJ90RwwoC1O6PT9CuXGfxrkugtmxsnj+3HCq0lD4cy9GqvIoiK09QGSLZ2eE44FtZ
         I4bTF1qy/Powhb6dEiItCyRjdDDHnutTYmqReZH/Zg2KeF7/8nJPL2DcFpDwZnlhWRHK
         P31pQEMDuFWtXqk+LJkbqWC1fIYDPkBQpwFrXzuiWVarEsZEFPTdt8h7T1stS2K27QEa
         YsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788061; x=1740392861;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUsyjtdwJudOrq2BVYPPPLmXtZGANjt6rB5YxXGDCHQ=;
        b=tcgd4HKUjNY1P6NsoVG6lZIMgMu87Je2ap5Rbfl53ratixQ6A+0RFtptsMyBceBmK3
         ntEP4C9Iu1HdwHG+auzXCGue2hNDNEpUi+JIL/MdkHeYzB/o2FPrkCZmd3DksbA3ixwj
         ohOhiLRA4z6UWOxXHo3uT2/nYuqA09TU+LIgjUbpvXYtE0qlRJuBTn7jjXOH4UlYWYVZ
         5LFHFm1h8JD0sNjVB8M7N8bYXD5uHJG0uGGkGK+3T2+Jv8XQT0Rf9R6fiqS+B6eeU+K8
         8DUZSay2A+QKLYtNhDuuueSbjNjML83bDs72bQo9J9zYtUWPLCtu9HucHEMJ8eP80j6S
         8mXw==
X-Forwarded-Encrypted: i=1; AJvYcCXnzieKZaMuQSfHNR/yDICG6UNTy6EJdkKqs0vYnE7UyCByaaFi/4Jp+M0i5MTdMnV0SVaryZPa+rQnI3xO6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdcA+v1xQDcz3xqLMULi9nD1WpDvy0NhvZQknjcFurafpduZUk
	X1RFRRowZ3FUWvKrn7xijkFUyImh1IqjyezV6yXRbgnXrObwKOTf1v7dBknJptY=
X-Gm-Gg: ASbGncswoyVOze7aeScGNTsV4NTM4rUo0Bo2ua6T09kIdN8qB5iPWf5b2D0eJy2fRZE
	dc6LryrnbSLWgss9I67AghjeL3+fQcw3xZT+NaaRNOoiRy7FOwy+ctx8COC7BTMtRzf6iEPKNcb
	QdeBP9+B8FoOBW9SYsEEVcoeC7MdYszP0wxSe9/+jQH6DJCBqNVAYlId9eJ5nMtMLVszIUsyPia
	rFg2UWZuUMScBozSfQ02z+IMmdZQByQDeTozmrDOQqy8dlc3SQzeMy/YF6Mojx8mTzgyq2VOHZt
	GCTLnJ7WBBOWtC6JOr8=
X-Google-Smtp-Source: AGHT+IE+SP8oa6aMi/Tazd2StJ2PQQ1xliUBBqg3M956avxBmZaXfoRNcJbotwH3UYKzBBxyZyxzjA==
X-Received: by 2002:a17:907:80b:b0:aba:519b:f774 with SMTP id a640c23a62f3a-abb70df5d81mr943214466b.52.1739788060920;
        Mon, 17 Feb 2025 02:27:40 -0800 (PST)
Received: from [10.100.51.161] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm309892566b.174.2025.02.17.02.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 02:27:40 -0800 (PST)
Message-ID: <7798e5f7-11bb-4ef0-8956-1208827cb097@suse.com>
Date: Mon, 17 Feb 2025 11:27:39 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] rust: add parameter support to the `module!` macro
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
 <20250211-module-params-v3-v6-6-24b297ddc43d@kernel.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20250211-module-params-v3-v6-6-24b297ddc43d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/11/25 16:57, Andreas Hindborg wrote:
> This patch includes changes required for Rust kernel modules to utilize
> module parameters. This code implements read only support for integer
> types without `sysfs` support.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

For what it's worth, this looks reasonable to me from the modules
perspective.

Acked-by: Petr Pavlu <petr.pavlu@suse.com> # from modules perspective

-- 
Thanks,
Petr
