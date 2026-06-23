Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C954348C42
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 18:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782241099; cv=none; b=uMAK2HIWWmtF7bPvO9lyRmOt+e6UeigS8ermCdA9Ch+wlLZGNGVb+HI89A0HEOPmoxWnluCqdqc5a2UglqWpK9l711dLZsOMbxclRCGwO3WwVYoBZU4/qMHJKxLv77VSAz1L9zzJm5JznEip+5z77bk5KQfVM8Ci1ByBt54FqgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782241099; c=relaxed/simple;
	bh=6sizoAgwRLvjCh7zqg/EnqZzQNrUHjNmth2MBnONupo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kb4ygNUdsSFwMuqpe5pQp8n47xqxG/M+Gk0TYNYSL34wpX9D/wgwcQFg0wR1lT4uRB53kECrKt6ehOrncdllLd2YUvhg4FKg30hDUYCEZAI/wKuGlWUTse+mQEvhX9P8d8/ixnvdSE9lkYx2v7kUErK6x2741RWpBpMm7a71jo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBFa+vr7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBFa+vr7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4633193af19so188722f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 11:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782241097; x=1782845897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2fiFg69bZvG7eLHGu12BMJgm2iLA1vS/lgB2cc2WLrE=;
        b=OBFa+vr7LV6XYWQs/BbCkXg61dyzgwY+FE7mroZoDqF9yRQ/XL27w7KC1MfwLmwr4p
         Ea9zjNSSrVTbiC4BL72Chf/hrlMUcFYZ33j0+aaDmHkymxJiCZm/529O2rnuB/4/WRAh
         JapYutkIavZBvhIARtAvlr4rWPltl1dAdMEEJ7ClA6U9/iP2fLxf6GnUXpUxO8+VoeDt
         o4IyThWskguQKptwuwQKDRsK4e4l23oEv826UyCykbq4Vu0/nOQRpwPfXVYyJNNEWinU
         1kqelNVu2gVPWUBRjHpvEF37rCi7wQ9UB8dy4c9KllrZGo8XbmLq7zcIW5WAbt5zfGcV
         4bjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782241097; x=1782845897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2fiFg69bZvG7eLHGu12BMJgm2iLA1vS/lgB2cc2WLrE=;
        b=fyl97xShwwZMF0Dg/gxRA3adMaOSp4UkCv31ada3gnesQPyJMe0qskyw9P62yJa4hT
         78OTVotfDkRg+Tc02IM+ctUdvbJ7SIoYZVknz0MneMW7kHGco6lZ5lNrG0OKzWMisilU
         EOV/BKivPBOFGo2Xc7E9ZJDFckmabQyXDqbF2F/sTsyQdrk1VcWq2mrSYCBtkJ9rNKAo
         LU8UoYbyGQ3dpKtqfhcURkEF+ciSCukhcZZOptQILyNKOAV0Vzk+V8teBfdJv8ITe6zL
         trZXc7YfpfK2sEJV9Za3BLRhakOYDkg6y91Ehyp2CSxmjHtTJsDBwfyRN7odwlBChJaZ
         8tAw==
X-Forwarded-Encrypted: i=1; AHgh+RotF47djTOclN7jRUjwtmOcGRscgB0hyl2JvZM169l8XeOcpMiv8YqH51rnS9jMZB0HWtn7xxcTQGOmWY9P6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNw2B01Sa5ugB4qN28oscu/wO5GiwO62aRUSRBNHibpgvZErs7
	ceqcJKJBvEOlF6M+DHtfqGzAUigtRNk0/nU9fz6JkgDa+El/1UXo8Ye0
X-Gm-Gg: AfdE7clcjndtg5YxReQXbzBjuY5N7RHYvaC5RmY23TKrm9epEjVtk3LpCSPR6ZaVX/5
	mo8QxmDdLahfFpHtsVSMIxpKPeCfrmCDMnbPVirDagxyHPRU307W2Facvr4blpD/Rsi6NiVWRGo
	/QP0OsWjYobiGfKl3qEOVwFeAf4YhtiyGIAAogJBGIQTBZyBK3Yu+CJfgvhBkSQJ5n+JMqwMoTn
	pkTcc6vLtuFjH/uofbyihsNBmuVnsbs1veKk98YWRXtMBlltR9MJyWMEu3/lb0qSW69sgB4Hcon
	cD7gkaXkRkR4zk8SL+aqWkpn//Sz+pbSWgRlwGhPon4og0Zsg6Yxq44loGJSZQW9Ja3ASUV+NlD
	jvOuekp5WNrjwQeeSog/5yJ7H0JxJVceLdN8U76wbfQnqkc1JhvgitQ0ONKUoK7Gc1Loo+Clt4w
	tAv/8mDPBnHDnQQY34j9g+2zYfPxIr5WF8hqxBaDZlO9BnFzMRxRU4V3pJjbjJfILEnboS0kqbV
	sVxRCmJ
X-Received: by 2002:a5d:5f91:0:b0:462:1a7a:9846 with SMTP id ffacd0b85a97d-4666074429emr23730834f8f.8.1782241096893;
        Tue, 23 Jun 2026 11:58:16 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46666c57ba0sm38525006f8f.32.2026.06.23.11.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 11:58:15 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <e48a5c7f-2d9d-4202-be59-2e84120dfe11@gmail.com>
Date: Tue, 23 Jun 2026 19:58:14 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] lib: rspdm: Initial commit of Rust SPDM
To: alistair23@gmail.com, akpm@linux-foundation.org,
 rust-for-linux@vger.kernel.org, linux-pci@vger.kernel.org, jic23@kernel.org,
 bhelgaas@google.com, lukas@wunner.de, alistair@alistair23.me,
 linux-cxl@vger.kernel.org, djbw@kernel.org, linux-kernel@vger.kernel.org,
 Jonathan.Cameron@huawei.com
Cc: boqun.feng@gmail.com, benno.lossin@proton.me, a.hindborg@kernel.org,
 bjorn3_gh@protonmail.com, gary@garyguo.net, wilfred.mallawa@wdc.com,
 aliceryhl@google.com, ojeda@kernel.org, alex.gaynor@gmail.com,
 tmgross@umich.edu
References: <20260623045406.2589547-1-alistair.francis@wdc.com>
 <20260623045406.2589547-10-alistair.francis@wdc.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260623045406.2589547-10-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alistair,

On 6/23/26 05:53, alistair23@gmail.com wrote:

> +config RSPDM
> +	bool "Rust SPDM"
> +	depends on RUST
> +	select CRYPTO
> +	select X509_CERTIFICATE_PARSER
> +	help
> +	  The Rust implementation of the Security Protocol and Data Model (SPDM)
> +	  allows for device authentication, measurement, key exchange and
> +	  encrypted sessions.
> +
> +	  Crypto algorithms negotiated with SPDM are limited to those enabled
> +	  in .config.  Users of SPDM therefore need to also select
> +	  any algorithms they deem mandatory.
This patch introduces an unmet dependency bug when the user enables
RSPDM without enabling ASYMMETRIC_PUBLIC_KEY_SUBTYPE:

WARNING: unmet direct dependencies detected for X509_CERTIFICATE_PARSER
  Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n] &&
ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
  Selected by [y]:
  - RSPDM [=y] && RUST [=y]

- Julian Braha
