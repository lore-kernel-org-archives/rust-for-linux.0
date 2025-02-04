Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1E821767D
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738702082; cv=none; b=G+fS4TAHgDg5dv/+gfzDoq2KoNr0dTujElg/SHoPzM3RI/eZmGDtY860oV+fE+9US4nbrHpSWptjqQHscHGVdJMFKHvkzNck72bv48jngJxrYCfTpivSqEPl2hxdSm8dbgjQA+PvfVWBtl3zZyr5jor+sunU6mz8pdxabSjacno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738702082; c=relaxed/simple;
	bh=njuP0jpl7EaEG6atDAQumzAWNDGlStoUTl+r7sW2BV0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=XSS/uibIaead9pUORnihOazLpbNo+jSZtVhUp9k7WPEMl6mo+1+nPlKmowimwYNhOfd0bytBm7anrzFwXzSWWI+Ih9PeOK64c+ABUXlEXaq94L6WTwPGRt2iC3hGp3lGbyp9gc+Sxuhb4eBsyixRwcJFjf/AgIqcwcyRuZvF0EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=erdcAZJX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="erdcAZJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738702079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=z4vImUuz5gXwBthaSk4zpKVBhpNpdK0P0dtelk1zWfg=;
	b=erdcAZJXt7tBAvd27c1NzhtBXCJTFR7vYNI5WA8lsugPKWaz6AlbHawU0i7Jqxs3u7NMGF
	UyYYkG/yYR7MJIJ305pZF2GsNim7wAzdz7IKWVcV6+PMJo7hByKndDrIlombCaGEtiDh00
	Ula04ROpuXvYD22A8w+pAaplXmzfjxg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-ByfpMk4IOYqK1NuBQqeB_w-1; Tue, 04 Feb 2025 15:47:58 -0500
X-MC-Unique: ByfpMk4IOYqK1NuBQqeB_w-1
X-Mimecast-MFC-AGG-ID: ByfpMk4IOYqK1NuBQqeB_w
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361eb83f46so47875075e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 12:47:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738702077; x=1739306877;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=z4vImUuz5gXwBthaSk4zpKVBhpNpdK0P0dtelk1zWfg=;
        b=LtBjtYYp0qL3Vzxo2RUCu8xc1PSS5WQrRtvrJ05CqlZWWkEEB0ARxRIi4iaK6ckirA
         tkD+VXxAGAtaYs9Vr1k6Hc/U7OExi4EUjH3OWBDHf3IbcRH7wiO3mllpmW9+eEnB5sQa
         oE1tI5ly4OlhhZrCKq5WTRPJ3RQPeC7TtXZTEnIa9ryP+esLDSN2ChRPUiVRZBBcuLM5
         i8NGdkDnXv9bKgk0EHVnoLk9aNJhsyeBBJKP66x9P7ML/CQhDQBjOUAVjyvSFbHOtZe7
         W2rkoKTvpWO/XzOIn/R1frt+kElc9JKy/3sVhHJHmYW5PLeIo1kxg/F5h5y4OzRlYtlF
         64wg==
X-Forwarded-Encrypted: i=1; AJvYcCU215Lq7s8YKOeHq5ar/DhmZTG7pkmSFknWXNJeH5H/ApKXm0IeQ2c7EuY/rUubaF4wxx4cEbA6LC3eAiOnQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMyYYv24mZ/afpY6z7QjIUc/SU3naDKLgX8reBsEm0dYEUJKkP
	dB4ta8Pc3UWV9DkEXnzzQ/r/MTRwHOniZG2qaFSUjaVaK1Gt4A5slKMPOxHmjLV9okclLvg9bxM
	SN6b9IpOITZgE7Xs0HFVyLTKPOAZ4CdZ8ij/2j3hBsElhrnGarOyLAdI3jmQQn09M
X-Gm-Gg: ASbGncviy9xTFObP6R5rF88jzAzLMV0RvsQC8GyfTJ7Kr5fhoXXv+Epl5pVS7jZZ7RL
	0Z/k/GwDW8/d19FzCXE+xdGrqps/SAdKGVdoKd9ezg3HtbqQ3/2Plim6F4kR2ORUSGfB304H8DL
	rGpvABkufhHi0X0u3jr+G4zHM0UfRxzSGZrEtOvj9Py8xCPQhF5fiSyafUj4qf2aEZ5NhVFmbYo
	LyACR+SaE9WxxmN6pNoZ7sc5+EXxrxnPK9XBB3IIBWU0aGoWFt8jGBwdQGxLtRRgHuIjCwWpFQX
	jlXqdZLyRGOj104EM8w3q0vm/1eV/6p0
X-Received: by 2002:a05:600c:5252:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-4390d43e153mr631585e9.18.1738702077060;
        Tue, 04 Feb 2025 12:47:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8MfxYAnnJeUXQFxt7doefvYBPuFEStFKJefTGH1z0tD/45gZRF4e/Q5kb3BA51DWWjYy/Lg==
X-Received: by 2002:a05:600c:5252:b0:436:30e4:459b with SMTP id 5b1f17b1804b1-4390d43e153mr631415e9.18.1738702076694;
        Tue, 04 Feb 2025 12:47:56 -0800 (PST)
Received: from [192.168.3.141] (p5b0c6602.dip0.t-ipconnect.de. [91.12.102.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e245f41esm202542205e9.36.2025.02.04.12.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 12:47:55 -0800 (PST)
Message-ID: <c4c39ea5-3602-4b92-9ffd-af33e122538d@redhat.com>
Date: Tue, 4 Feb 2025 21:47:53 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
From: David Hildenbrand <david@redhat.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jann Horn <jannh@google.com>,
 Matthew Wilcox <willy@infradead.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Wedson Almeida Filho
 <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
 <20250204202656.GL2296753@ziepe.ca>
 <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <08ce9562-9ded-4d95-a495-b60f90d75490@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HGpHmvoO_LuEN9dpSF6u65ItB0LgswZxDsQ1pkHBur4_1738702077
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.02.25 21:41, David Hildenbrand wrote:
> On 04.02.25 21:26, Jason Gunthorpe wrote:
>> On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
>>> Fully agreed, this is going into the right direction. Dumping what's mapped
>>> is a different story. Maybe that dumping logic could simply be written in C
>>> for the time being?
>>
>> ?
>>
>> Isn't dumping just a
>>     decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?
>>
> 
> IIUC, the problematic bit is that you might not have a directmap such
> that phys_to_virt() would tell you the whole story.

... but it's late and I am confused. For dumping the *page table* that 
would not be required, only when dumping mapped page content (and at 
this point I am not sure if that is a requirement).

So hopefully Asahi Lina can clarify what the issue was (if there is any 
:) ).

-- 
Cheers,

David / dhildenb

