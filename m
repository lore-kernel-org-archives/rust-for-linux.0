Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DDE5D73E
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Feb 2024 18:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706986207; cv=none; b=a0AKU7qECjbvl10mxLsM7t36iqx/AiE2A4mx1/+E+JtSUtNXvzZd7on1MyqyiCzjpOVHH2mN9uzaFtFCDabryRYftbfXM31FzUv6Tw9rft5zQ1WlMCb4+TTg0qksP7NhgldgxiVGgyJnUykKBsX3SNmZIzNx40wwf/G4RMlxy8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706986207; c=relaxed/simple;
	bh=U9/TOQzwuy9/hq0cRKlOy8Pt/uwVRyuioWWclKgTGj0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AtVXLEdCdvPQ/eoGl6ncEe/BjvyZPat95G/yOio9CAhOUA60kxf4g4L2VbIMQPGlpPV63XdgPiCpZJdh8BrR2Q4oyrhnL89noGEnkJE4SHqSFXr/BjM37ISDIk6GVoJkaCswsNStDgKXJczIJ474WdBRdeLdztd6HtcX+MRKJaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcmYNWWZ; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcmYNWWZ"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2380053a12.2
        for <rust-for-linux@vger.kernel.org>; Sat, 03 Feb 2024 10:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706986205; x=1707591005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qGdoZigyK51Z0E+hfu2rfpeDm9aDHbHFwn6pC8ZVk3Y=;
        b=VcmYNWWZAhZGfxnGsFsrZl5A892dKPNyWD0mhTDD3FJStO0e7WgsN8jR3w80/PapU2
         z6pwrAP94DQx8DVP8OVPGi1Vqz3f00hiZU7mVzZMs06uu2j2LylJS9XzU/xZZ1QdEj6M
         wqkowVPsgdgsADByb3VV4t5G5mtBDYWac4b5QRQs82re1mos6YF0tXfwFtkfb0BAIU0G
         SB1OHJoWbSEAmDjYFnOL7GB1u6Fuk+Z75WAKP+0cjqkPZix1e1ePqODQxc6m92By9WIR
         KsK+/JJ91zG/VZ9Yt4grpckFgOGTr0Hh0nTLLIqHWZmAORSxjzXJOJziNuAxcLjz8Yye
         D2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706986205; x=1707591005;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qGdoZigyK51Z0E+hfu2rfpeDm9aDHbHFwn6pC8ZVk3Y=;
        b=jQ53kKAufRqUPAA8z2teLisW4Kuf3Bhu/3z0pzHbRPdU+w/ii4ZW+P6iS97RqqWkZ0
         zUtpgdyXNe7ozjz/vCVTHx+d7aRKfyafs+r9T+xw2c/7cdb/Y51QPYuSaQbCSMjk0N/+
         +k+A/JNin1oJBqbCHg8suTr0FflOoPBJIds5OQx3Plg7Xz/ZqNWAjnmUQcFR01nhIqpK
         +O6fZw8o+8daIe/W52dMVFQ0vwa3Eo/Lcvl8TcnZ0YwV9GP/kbNsbyxfTWHh5Vqf8voi
         xwMjI1+lIlc6UVapf0eLv+WTvY4HiZ93hkD703No8pPDQlXVaVHSIjOcxbRXs8tWGFsT
         wUEg==
X-Gm-Message-State: AOJu0YzL5Re3LeNwIPpSOx7y2KKLN+IYnsBO+kqJNkuq1kDx1xPVgA2C
	1+Q9mD7Sz6nJVzTCInG/SzPVHv/2V79WvGyRanY3I2dJ2oXwsaZTio0XOuTd
X-Google-Smtp-Source: AGHT+IEknVo3tei3f6Z9AlfbLOojXrrbRuYi3PAniOcAINZYY3mttDdxfeMo5N+X0TtAXbntQOR3IQ==
X-Received: by 2002:a17:902:da84:b0:1d9:5583:4bd with SMTP id j4-20020a170902da8400b001d9558304bdmr9944854plx.60.1706986205322;
        Sat, 03 Feb 2024 10:50:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV5JGMnLdJl3loXk6zhxwVwGXyhKy22Xb8AeHcJYfYf7j2oPpqzBqxixNWOHeO3kJnmM8NGhYk8FSEiIfutyYxPEST7+/NyWUZeg/0OwO23Hxtk4Swq6tOVOIEdsZ+xFXWJgSnLQFOmXsQE7MOtsZ5vFHMcceNhOsvNWUsV6nMrQro/fcj/QAKKQJ5+
Received: from [192.168.54.105] (static.220.238.itcsa.net. [190.15.220.238])
        by smtp.gmail.com with ESMTPSA id y9-20020a170902b48900b001d73228cd88sm3531928plr.255.2024.02.03.10.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 10:50:04 -0800 (PST)
Message-ID: <492b7c1c-22ae-4464-98ea-000889301375@gmail.com>
Date: Sat, 3 Feb 2024 15:50:02 -0300
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: place generated init_module() function in
 .init.text
To: Thomas Bertschinger <tahbertschinger@gmail.com>,
 rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
 wedsonaf@gmail.com
References: <20240203182735.295946-1-tahbertschinger@gmail.com>
Content-Language: en-US
From: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
In-Reply-To: <20240203182735.295946-1-tahbertschinger@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/24 15:27, Thomas Bertschinger wrote:
> Currently Rust kernel modules have their init code placed in the `.text`
> section of the .ko file. I don't think this causes any real problems
> for Rust modules but it does present a challenge with implementing Rust
> functionality for existing C modules.
> 
> If a Rust `init_module()` function (that lives in `.text`) calls a C
> function annotated with `__init`, then a warning is generated because
> the C function lives in `.init.text`.
> 
> I ran into this while experimenting with converting the bcachefs kernel
> module from C to Rust. The module's `init()`, written in Rust, calls C
> functions like `bch2_vfs_init()` which are placed in the `.init.text`
> section.
> 
> This patch places the macro-generated `init_module()` Rust function in
> the `.init.text` section.
> 
> Note that this is not enough on its own to actually get all the module
> initialization code in that section. The module author must still add
> the `#[link_section = ".init.text"]` attribute to the Rust `init()` in
> the `impl kernel::Module` block in order to then call C `__init`
> functions. However, this patch enables module authors do so, when
> previously it would not be possible (without warnings).
> 
> Signed-off-by: Thomas Bertschinger <tahbertschinger@gmail.com>
> ---
> [...]

In resumi, to call `init` funcs in a module you must do it in
`.init.text`. Amirite?

Reviewed-by: Martin Rodriguez Reboredo <yakoyoku@gmail.com>
