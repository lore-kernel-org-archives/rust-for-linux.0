Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA9E156C62
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Jul 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720526568; cv=none; b=axqCtBCmSitTDEWVvzczlsK90XsLczDIEqC50PgZi1kASsSBGn3mfd0YI+0Nc1zdVtHhXG+tVSUzyyk3GRd5w6M5XBgjZfUHsLduKjxzFYNuVYOAaEF9byKvdXZ+E4VR4HFO6vSChCN3Ul0dJfG4h1SjoiCXNq0uY5vMY3N6eIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720526568; c=relaxed/simple;
	bh=GPEKrnIfXI200uTTi3YvU/7kaTjsuMuRW1oNuL96hNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBC2/8LHTnpRZwx2eFylkJ2LKWQ9tmqBwtj2HPx1EcedTYTP0YtMCPRyIOOCc06wVsmFjeAGhgsFranQy+hgl5aq3fylt8GXsC2bZbjINRGMh7vDtFA5sflBf1eJmzwQg7N2usWnilzmXMpjZ0WzisRqlSaqDeL2HjEnYBhs/2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TQM19XKZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TQM19XKZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720526566;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dy4YRqqLNlf0j0FOWn3tiz8LkZrh0YUIypGbDuzRZ3A=;
	b=TQM19XKZ2L2u6NjO+J56FGQ9Mw+Qn4IfG/ubr9P6mQxsGi7wiXlEQG8vnNKecB0WFhghxJ
	sc9m64zQGucd6OlzpVh2G+15AuHMw6J2YPP36p1VtRcge+SX1AZyMB/pOdxcz+etAkl6U4
	bA4uFuP1j42ETehsayptfVvLBfdeXgc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-pbBawkgeNfa1nAENXH04sg-1; Tue, 09 Jul 2024 08:02:42 -0400
X-MC-Unique: pbBawkgeNfa1nAENXH04sg-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-427261986c0so2208675e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Jul 2024 05:02:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720526561; x=1721131361;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dy4YRqqLNlf0j0FOWn3tiz8LkZrh0YUIypGbDuzRZ3A=;
        b=g4uTcp2VZslR00lAsPfQ22Yp/lD4xVviqf4zlm5EtCHITae91Xrb0EcbtpS9BbXSAy
         9HQT7xaTwupHVtigbOrHgVwz43sj/oANJsOfmzzFVMZfUTVH7LOUBLGskah9QhdgWTjH
         oaE4zb0LgF4XJ+N6IyhMaK+g3P/5X1gVLwEG7Tu8xeJsXXllpXJ0PyL1gjIjCen7jEDD
         v4pate0vk1JbOc8K43lAZtTKNZkhXA1hkp0uKwjyIm1UgJexeU91p0NaBvwoGlRdOA9Z
         8AGOoq6gs3s5EqdusIa/uvT7GIxI78VWQO58jWpye7AdyoV0lXMyKLV80h3p8tpy02Ys
         XGlw==
X-Forwarded-Encrypted: i=1; AJvYcCWRLMAivBNIv5svKALJI7AJmmgKiumYOPeQNJWg1UeihSHunPXh8aKhMYxV0rnVgF2xEjKR7G3cPss5zhSH/sHEy/NrA96WT/4yjWkY7Kg=
X-Gm-Message-State: AOJu0YyxmZa3cVf0pVEMfbBXf98zuz/Q3tOSSf6Om9ccpG2jpPivPhiO
	/qkAyZuRs2ffaiM0KkET1tbhpukZvpd5Mz04LZY7j9nl74uiYiLaKVQC0dLQ+fuO4Us0rev3myP
	ghWS5wDV8y938mVNoIq6ys7bs8X8taNnw7nby4Xnp89ueO2Lcc7a0LP9jA2prhEHMQd7irKviCE
	U=
X-Received: by 2002:a05:600c:3226:b0:426:59ec:17a9 with SMTP id 5b1f17b1804b1-426707d7c9fmr16596785e9.22.1720526561304;
        Tue, 09 Jul 2024 05:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSrbJt0jJlRogPAw/bQ1qZ0Lbp/49hLv8AiWFs4Pgl2/5UBg3dAYp6ZylEW9+XrxlA+vNo9w==
X-Received: by 2002:a05:600c:3226:b0:426:59ec:17a9 with SMTP id 5b1f17b1804b1-426707d7c9fmr16596635e9.22.1720526560952;
        Tue, 09 Jul 2024 05:02:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7deeasm2422525f8f.8.2024.07.09.05.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 05:02:40 -0700 (PDT)
Message-ID: <48cb6b5e-3685-4661-9183-080e25348892@redhat.com>
Date: Tue, 9 Jul 2024 14:02:39 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/panic: Add a qr_code panic screen
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240709084458.158659-1-jfalempe@redhat.com>
 <20240709084458.158659-5-jfalempe@redhat.com>
 <2024070951-tall-effective-c916@gregkh>
 <2024070947-exorcism-purchase-2f28@gregkh>
 <acd5c505-f058-46e7-9d92-620dea41d707@redhat.com>
 <2024070944-follow-crazy-ff95@gregkh>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2024070944-follow-crazy-ff95@gregkh>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/07/2024 12:12, Greg KH wrote:
> On Tue, Jul 09, 2024 at 12:04:02PM +0200, Jocelyn Falempe wrote:
>>
>>
>> On 09/07/2024 11:12, Greg KH wrote:
>>> On Tue, Jul 09, 2024 at 11:11:35AM +0200, Greg KH wrote:
>>>> On Tue, Jul 09, 2024 at 10:40:10AM +0200, Jocelyn Falempe wrote:
>>>>> +config DRM_PANIC_SCREEN_QR_CODE_URL
>>>>> +	string "Base url of the QR code in the panic screen"
>>>>> +	depends on DRM_PANIC_SCREEN_QR_CODE
>>>>> +	help
>>>>> +	  This option sets the base url to report the kernel panic. If it's set
>>>>> +	  the qr code will contain the url and the kmsg compressed with zlib as
>>>>> +	  url parameter. If it's empty, the qr code will contain the kmsg as
>>>>> +	  uncompressed text only.
>>>>
>>>> meta-comment, should we by default do this on a kernel.org domain so
>>>> that no specific distro has to worry about hosing this type of web
>>>> service?
>>>
>>> Also, do you have the backend source for this to show how anyone can
>>> host it themselves as well?  We can't add features to the kernel that no
>>> one but closed-source implementations will use for obvious reasons.
>>
>> I've made a proof of concept backend here:
>> https://github.com/kdj0c/panic_report/
>>
>> And the javascript to decode the kmsg trace is here (under MIT licence):
>> https://github.com/kdj0c/panic_report/blob/main/docs/panic_report.js
> 
> SPDX lines are your friend, you might want to look into that for this
> stuff :)

Sure, I've added the SPDX header for this file.
> 
>> It uses the pako js library to uncompress the zlib data, which is also under
>> MIT/Zlib licence https://github.com/nodeca/pako/
> 
> Great, can you put that in the Kconfig help area for this option in your
> next version?

Yes, I will add a link to the panic_report github project.
> 
>> If kernel.org want to host a default service for that, that would be great.
>> It can be linked with https://bugzilla.kernel.org to easily create a bug, or
>> look for similar bugs.
> 
> Someone should at least propose it if this is going to be an option that
> the kernel supports.

I hope someone will volunteer to do that, as I'm not really into web 
development. Also it's a bit early, drm panic is quite new, and needs 
more driver support to be really useful.
> thanks,
> 
> greg k-h
> 


-- 

Jocelyn

