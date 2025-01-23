Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11413D882;
	Thu, 23 Jan 2025 17:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737655081; cv=none; b=M9HggopACQF9bzPlCsXaDV3ZcUu6HKJ6yhRcUOcPO3QR3EC7TZQ0V+EOJMq9VYSPBbYiqaH/1gecwlTIo+rYmRPtMlNoWzt25Ba3QFHpEiiarMBCreeVs1+/Bh9Xq4bCBNeobZnXtVkS3cgWKK7a1VVZEN3AMl2smVtlBe3W6y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737655081; c=relaxed/simple;
	bh=1XgmgqTAgiju8SgPYQCpS9UEyVlVodD7DtYr3f+1hKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Am9GOaJXlsp8JH7UzMl8u3i0Nm8GxkZ9P6LVe+gVQ5q/vtMVlkvc3jzg5XqvFiXcOb2fj7e4TigsWUOfSuJAymvL43mWXOZKu10lP3d+ife+lEbXEyS6xFAPgSIC3u/m8CvX81HsjsSsTQrAAhE0FD206vaxqR7gobfrj0wzzs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbGYbx39; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbGYbx39"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso8983545e9.1;
        Thu, 23 Jan 2025 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737655078; x=1738259878; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NfDjk5yMleanbF1OvHIpa0anj5diZzdhr53pfwshB1w=;
        b=cbGYbx39ikBcBL/7QTfEheekJnY3hc8k1jQEGOoYVFmDX+CQBcpCgxcbPBf4Dq9TCP
         vtHv+vh6ApTllVTcbvzMuDHJvDnn6SxzPew0u478YdVoRrsfBGhuIiOKkfmo9+CyOraU
         EoxszB3NOwFVbPPsvTvJO8kreZDyfZJ6QTzguSCQuWGrWHwwtVAvXI0oZIzzFqAQzY4P
         A5X0xHN604lZcaD4uyCh6nkB9+mrdWwHfJCN6+dz1TBQSWu+jjj+2m/kVjE0MJrECT+o
         JgCGyhi/X/QDRJrERvwR9FoZT8uc4HwWXxOi/LabbDQ/ikTKGuvKElpCr8IwwL4luKkU
         tFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737655078; x=1738259878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NfDjk5yMleanbF1OvHIpa0anj5diZzdhr53pfwshB1w=;
        b=NNzGqI3wGHd5FFubFYw132hC5CFdcO7Cv315uKKai7BG3riTfEQDfgFGF2tmyN62oo
         TGBG7antKhMQXS0BAYErQyjI2MWS+W1BY+kdQkazkRRBJQwzvBPHrIOoBDr7mslhbDIt
         CPLPdWcZB8YFkw6YrQkhh4hdlKKR0h+ufOAY+5BD43yuw9AI8N4iKgIjRQgdwGmixrZU
         Ybo8y/Qjmm786MlPIvW5JUBWE04D0+xl5HEKlhGrHsqWauYvGN9CzyEVyD587OQZeU/l
         7qwkMFbkyKvZJpuCvBaNSph7j7s4W9lzpVRcjmLZJuzK0RpkHMXYvzdAU8P1siPO4mfq
         osqw==
X-Forwarded-Encrypted: i=1; AJvYcCVup7wrCdx8LI3kdqb6DGwBzAhA3tbqeRJhapCOKBKLG7Y5qSe7+TacUVvobXuWY5j+B9sUZHh4oPdjR5s=@vger.kernel.org, AJvYcCXFFFu45hWkx53fx+5lheFpiWDJ1mnESG+7zGeRnfqNKwcqtII0sqP2P02YLaAnH01NKCZF5jSRuPB71pvCP/U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDMmRK2F3KSUx/vMjsxqiHUEgRIWibdcxHK5TlNrj86lVMmuRB
	0M+eRqqmn/zz2T+imp19b8aDPVoFySIeXTmtYrc+CW1WHHa9xoML
X-Gm-Gg: ASbGncuLq1DNE9KvLS6qYSSZ74sTKI8SSuv9kiMa4zxs3cT1POLKH30UeH2FZYFuvLD
	RsNYc1M3RuWIyZKNuaHFfeJMSgpBxFsmR4+IvNq5H2tip+/uWiYZD3+djBKFjDAkYxQLm+JzLj2
	ZBzTyGcN7y8p5Fz8q50r0GHkMDSuYOQFSxeRd9tB1pvjI+MVuLcxPg08j+vf2j+0PDpP/rMoSNh
	i3ootuMg3cXdi0xFHA2H5BTgL32pap6NwtXVSr6CxRI4WBtDRRH2Djpzcz0bgm6t7g+vnDRCLpC
	eSeWvJ3KOT9xBcK1Wg==
X-Google-Smtp-Source: AGHT+IEkMtCjIvbPFkzHfXIik7N9eD6zl5dtW1DLtls9L3hrLk51QocdtJQDYB6Nn0CfsM/V30qZRw==
X-Received: by 2002:a05:600c:5112:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-438913cfa0emr245327285e9.8.1737655078077;
        Thu, 23 Jan 2025 09:57:58 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d9a39sm69176005e9.31.2025.01.23.09.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 09:57:57 -0800 (PST)
Message-ID: <7a84da97-504c-4d1f-9c98-3a152e348c73@gmail.com>
Date: Thu, 23 Jan 2025 18:57:56 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] rust: miscdevice: adjust the rust_misc_device sample
 to use RegistrationData.
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lee Jones <lee@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-3-edbf18dde5fc@gmail.com>
 <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <CAH5fLgismQ4whAKswp843T-=q_1+C7DB1qqg6rqk013DGr13iQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alice

On 21.01.25 4:40 PM, Alice Ryhl wrote:
> On Sun, Jan 19, 2025 at 11:11 PM Christian Schrefl
> <chrisi.schrefl@gmail.com> wrote:
>>
>> Share the mutex stored in RustMiscDevice between all instances using an Arc
>> and the RegistrationData of MiscDeviceRegistration.
>>
>> This is mostly to Demonstrate the capability to share data in this way.
>>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> This change causes all open files to share the same value, instead of
> it being per-fd.

I know, if that is unwanted I'm fine with dropping this patch,
it is mostly here to show how patch 2 can be used.

> 
> Alice

Cheers
Christian
