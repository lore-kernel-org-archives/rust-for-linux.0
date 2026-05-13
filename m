Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9053D26F47C
	for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778680782; cv=none; b=aN6fUatsH0pRka+6WA9F1gbYoJ0fox4f8DODQrYDFQkOBDYdg56pJyYY9TVARxCppzpeWKAF+NM6huL8+XctDK0mMZb+A5zI0VhGm2pyVS9QYNWLkoKrv6Ui8u4higPbO+m7W4ROfNbM8/zH8LdnBwCK5gpOtYwW/BHpM2dqAak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778680782; c=relaxed/simple;
	bh=WkNnHaheJ5ggjAEfjUtSR2NL0BoAilq/XapW6CyXmwI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QHKCgYqkPyIP/861vsK72tlwrmS6cvLuda0BXT8Gq1yWNCjte/CkRU9h+xh5ZYniREgOYg80xGLznF803+Wf4y0fuiMn7yqzncUUtAUnOupViSrb3k+Vvow6jBJcLNSMI3+IcuwAVH0pksEstzaCDhidUUJsz907NrlhnCRzdBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tut49SjM; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tut49SjM"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-44c350a5b87so4297444f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 13 May 2026 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778680779; x=1779285579; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsFc3nYv1Tw4//qtRhqmTwmES9zr3g4CbXHYTHnJEHI=;
        b=Tut49SjMwT8eSX72cK7FRC6PvzB/JTy0PwtU3cxWrkHwFa4Hikw66yWiM2Q9nKxzVh
         YOMDn7xNTRv7mPMKwdpvG6/f+7vnPeaxxixQ6NYUxECp7BinQ5v4Ah+Ec2jV+MhIUtGk
         6j8+7DrNyq/ysz3EiOXj3ts9S9voEWd4IIB7nWFJw9Liat9UDFKlr2hbvRM6Gdw5isXI
         1jy3fR9hi9vYD8C7muNNfKiJxcRtyHNaasR6MrCHxTOrydoKA42GoyzEAJxm8MM4WzVb
         Q5QKBwnPN7qg3IV1iSZAswOct3wAMnKIpajbqDc0pcT7NwcQ/1qPR2pb9cwGIcbU0A3d
         5A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778680779; x=1779285579;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsFc3nYv1Tw4//qtRhqmTwmES9zr3g4CbXHYTHnJEHI=;
        b=D2wRBm+oC58gZ6FilA/A5MNf0/78usgVhTR8YrUAWfjPgbDp1iFkilp2tm4TbivFe7
         xCdcnq09gRQAnyHrsQZ5AD2aI5NEOXK3p67muY3ttXOj8L6DwRm5SyA58P1ZVNoxhGic
         OU5UqybMiUjJPeITnWKcTiWXVkH6k8py2woXj4/GyGOHFjDhQk9K2LCRJaMPcrdI1vgR
         +8od5eSrYFkoIbZAvMQQi/aZyqU3Ol/hXDwJd1DuM+j3a8UbL4dZjKVd7jz004yRFRIW
         /kBrWIvs/8AuAozA2BoKTqqObLm9ZSlaGofT6QT4eU5agDwlSDekTk2deCRzKhcnatJW
         bhPA==
X-Forwarded-Encrypted: i=1; AFNElJ8wMW9P0vCyeCJtAyVlexbb254X1yS7RIeaQCVVx5jDFKLarbCqQK1QokBVwFyMql8WwkJupmYXHuYU/LMbvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wq+CjLIsfp+QMMJrZoZZlTBb/yFI2vKxoS2FuyZPcrUpp9sB
	NfMLFDoI1cRmBL6afdMd8Y6y231s3+oFMlJeS0xdtPV2gRvaGGUPhKze
X-Gm-Gg: Acq92OEKLrbESkhTqTGZL0c0P84cSZ23iLC5gPpwPPOmp0dnxipJMYKqtLCVkC4/Al6
	Mp27cUKjuN0LgR+nKm+uVOciCuoV7bHs8xKU7ekUmZUuifPnoU2ioTG9i0FKwzL1oK2MKr35KhT
	pKeT8h44kJJDR77WEJyPYMuEvC7k7RcdE4W+Q79UEEIQkysUkVHcuR4J2ZZS6HEZva8finTBbbC
	tvJvIjGPtNkQVsqgoFkFFBwJI8KUstdYa9Ylcb1rgy4Ch1xu/MO27d1rP6Yt/Qy/9dsPWBbnxq9
	1Oejn5ZZl6FEOiXYZmHor67JfTzVQwr+q4Z8DbB/y3g4VAnQvNcDiX8Un5V6e9DroMbNkn5FaCh
	5pjdBzz5LwShtF29VWGPDBRKeIQY0f+trJMkfiJGGY5vQDBwJ8PVafbGZkCDy4BCCI+e+8RPIt0
	V5252M84Fkv0WbWA/S0SXcJ2+lLk3NV4IRbH7iFNjBDMnKuugwgTAg3oAjS5s=
X-Received: by 2002:a05:600c:a011:b0:48a:563c:c8c0 with SMTP id 5b1f17b1804b1-48fc9a0e65emr53080375e9.7.1778680778790;
        Wed, 13 May 2026 06:59:38 -0700 (PDT)
Received: from [10.128.10.158] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f442129sm42770485e9.28.2026.05.13.06.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:59:36 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <bc46423d-54aa-4773-bcad-e1c125086812@gmail.com>
Date: Wed, 13 May 2026 14:59:35 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [RFC v2 0/2] add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>, nathan@kernel.org,
 nsc@kernel.org
Cc: jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net,
 ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org,
 masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net,
 qingfang.deng@linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20260509203808.1142311-1-julianbraha@gmail.com>
 <8fe7c7c8-00f7-4a72-a984-e929f71bec22@gmail.com>
Content-Language: en-US
In-Reply-To: <8fe7c7c8-00f7-4a72-a984-e929f71bec22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/11/26 05:24, Demi Marie Obenour wrote:
> This adds too many dependencies.
> 
> Some suggestions:
> 
> - Use system libcurl instead of ureq.
> - Use libc getopt_long instead of clap.
> - Use manual FFI bindings instead of third-party crates.
> - Use the C Kconfig parser instead of a third-party library.

Hi Demi, thanks for going in-depth on the alternatives.

Unfortunately, given the amount of analysis performed on the parse tree,
even just replacing the parser amounts to a wholesale rewrite of the
tool.

I will look into the others though, just to reduce the amount of trust
that kconfirm users need to invest in the Rust ecosystem.

- Julian Braha
