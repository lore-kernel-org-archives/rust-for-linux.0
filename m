Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7475A1ABEDC
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737659; cv=none; b=SmtTxBAicsSZHVH0+Cm/lBjHLcTVBLqKYiLfrP9Jju+Ye9phLP1B+V6twRN4LhE3pxAMDvBqTvUh91QXfkqrxkM+HGXPU3JZmfhy/+we5vIAcy3jgoq91Wy/WCRoHYkjn2ALKgVAHAgjXGWHmzdGSqJVWMwTxd046YhWeS2A9kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737659; c=relaxed/simple;
	bh=8EmgGrQTiAThFUecEEjj/YeR2I3mqpRC/ExlP7Mbp8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rsdQBzjwFQ8MQM4K8ucg5ulePWecil0jBHIi0+uk1hWUXLlO/xw4WO1nde8H7yJmbmgRXIkahOQPL/irEhNxbfDpZk5yNcER0bTJllvzrSlecdrlyQtZ3CWbCg21Guu1C+4WfxE0C3Z4qB/kKFDxIBMuEBa9LHaLiJW3JQY6WsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=ZIB6qPwR; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="ZIB6qPwR"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-39b26410e0cso634645ab.1
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Aug 2024 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1723737656; x=1724342456; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kvY52rn3VLdN7FSBDk7M0Q/xyXbEHYPcDeYIz1HEN8U=;
        b=ZIB6qPwRpqE5R1sOeKpkgt/kx+fb4VkH6RBlekOE207dVb2SivpPOn1Z7FY+xTda0O
         aWP5oEh5/m563ppxAKSQzoeXC8h0P0+k+5LMuOr5RK4GEgLK+b6wUCkQZOZUtHE4sfJz
         G+NZNhCqRIv88Ah7rQt2eabsLTfg5UDmX+0YFcOVsoTuLJlmsh752vcwpHwCqRVdZVAH
         UecYR9cz9BP/hNdDMxdHlLe1RU/KH+pmxEudC/hIMyftKpHA343WWMWbJZ03e7A0v9fm
         M7RzOjGqEAXRV+4a9zdpNyWyN4ICptusqYk4G4NaRLJ4QYtl4Qghxfto9tIPzqsXkJXH
         x3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723737656; x=1724342456;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvY52rn3VLdN7FSBDk7M0Q/xyXbEHYPcDeYIz1HEN8U=;
        b=f56txznm2jFYNnKXoiXw82GrqgXRYQ0cZNsTBS316apzaDaMezI3jW3evpp5+398C2
         PdGzZhUhmn6ykmPg1pltaHRThx3U2LFyRvgsKoOtTN61UaCn/FZqPieKtlKoo3fPsuaY
         uobPnc/5pyjI41UaoBtQEDBTQCHA9ZJeXSg3tio+uIEK2H6fG5Sp1g2nuDf4sPNlhlSD
         fMik/WfIEHcrOYAjr5BL7dj5jZve6qS6RRyNJiqO9gKWKpuEsoLEebeKbhRdXsw4Dh4O
         LSHMVO6Z3r9LdmPoEx5Dq35Afi+f2QydnazVaADCTS/oYkt3rkndiMLaIL9Etq6KSsua
         aomA==
X-Forwarded-Encrypted: i=1; AJvYcCWPAR0vernvMfEMfBKAb6zrfWVQ9/CkSUnZX7aISas+lRjf8vKrzw4UWUH+8pMc55pfP19VyVA4pFyvwgx9fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjAOO7o3ly4t0jN4XXNsfkNVdLCMwdqW6xx6ughU69jl9FWe3v
	5/EQwDB440ITrcM+Q5CCQCu1cFkOra21HaLEZQ2Uo11lOmnKq9oFDX5c8mmipv4=
X-Google-Smtp-Source: AGHT+IHVdJLpv3Jd1d39Hh3l6ibKrPATj6iR/ePmOqrUAeo+aVkAGUQ5weyaKqVzlglv7c5OP8ZOww==
X-Received: by 2002:a5d:91c9:0:b0:822:3c35:5fc0 with SMTP id ca18e2360f4ac-824f2721fa8mr14417139f.3.1723737655813;
        Thu, 15 Aug 2024 09:00:55 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ccd6f3db32sm566067173.116.2024.08.15.09.00.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2024 09:00:55 -0700 (PDT)
Message-ID: <622e155f-2ad0-4f62-a6a7-c9c88903db82@kernel.dk>
Date: Thu, 15 Aug 2024 10:00:53 -0600
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] rust: fix erranous use of lock class key in rust
 block device bindings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 Andreas Hindborg <nmi@metaspace.dk>,
 Andreas Hindborg <a.hindborg@samsung.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>,
 "Behme Dirk (XC-CP/ESB5)" <Dirk.Behme@de.bosch.com>,
 linux-block@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240815074519.2684107-1-nmi@metaspace.dk>
 <172373175849.6989.2668092199011403509.b4-ty@kernel.dk>
 <CANiq72kFXihVGDGmRyuc0LkODYOv2jX3shP-dEHjV3k1sqFEKg@mail.gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <CANiq72kFXihVGDGmRyuc0LkODYOv2jX3shP-dEHjV3k1sqFEKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/15/24 9:31 AM, Miguel Ojeda wrote:
> Hi Jens,
> 
> On Thu, Aug 15, 2024 at 4:22?PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> Applied, thanks!
>>
>> [2/2] rust: block: fix wrong usage of lockdep API
>>       commit: d28b514ea3ae15274a4d70422ecc873bf6258e77
> 
> If you picked 2/2 only, it requires the former as far as I understand.

Sorry I missed that, mostly because they were split into two separate
postings. Hence it only pulled one.

> If you want to pick both:
> 
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Otherwise, I am happy to take them too.

Go ahead and take them, I'll just kill the one I have. Thanks!

-- 
Jens Axboe

