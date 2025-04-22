Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B451256C65
	for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 08:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309021; cv=none; b=e0xQs2IPWYUL4U2HXHYuuyOU6BxThIOkDs8lFtWqEzekWzhYXJP+tWyJG7oq/czCcYM/jpCCQGP5rmTNUIiKgoraKRrVIWc0zJHlUTtaYdtNfTpoGxdN+L6lMwYiD6Ukpp/mHdDfS702GdbeWQlV61BGOlKzIEs9dXZda0DqXYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309021; c=relaxed/simple;
	bh=dKPdPpGAfJASHgVshiOlw+Vp79bos95D4pF8d9EmIIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2WZ3v9kumBYbhaTa7M17+AX54VAMwB16rJxHyiAw4Tylqk35ApHJddMOH+WxAq+ndpWIAWW/ih0530lX0jIrxC0Yw0IRK0D52bokQmDbUydX3B2fXq5o8EvLVcZIfeiNKLWsyNYlQTRAULEcQqezQwGSZJPFXijfuO/9Yy3r2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jKY8Iapx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jKY8Iapx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745309018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KOK06Gy+USdFFUjUhlRbDrQoZuj04eP9w8IDxAKpvDk=;
	b=jKY8Iapx3SRFnaFHJaNpB4itDV0W3GH7i4TklFo3sckSTHLOs0JYd0SXdhUSx4sQiaimuy
	V4sa5IPIa3ftS7oXgVK6irWVt/KYIxdSa7ACw/3e+sY2zcYF1OfikFVSinaCqoCRbbPiqc
	iJ5ow4OkAFVEQlV89j0FjKJEu/ePtDA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-680-_3xxrESlM7qVM9Ri7onXSA-1; Tue, 22 Apr 2025 04:03:36 -0400
X-MC-Unique: _3xxrESlM7qVM9Ri7onXSA-1
X-Mimecast-MFC-AGG-ID: _3xxrESlM7qVM9Ri7onXSA_1745309015
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39123912ff0so1205146f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 22 Apr 2025 01:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309015; x=1745913815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KOK06Gy+USdFFUjUhlRbDrQoZuj04eP9w8IDxAKpvDk=;
        b=Y+aO37vliWpsZlaYw4kA4fKq7l0RdMQE1vVV0O+agU5eqALndJQAK7EU7iDUPAAbGx
         wPJQFsfovkheCmcZaECJBOhRpaTe9OlD04oTpF0HzV8b7zr36nZJz53kHSw7k2WHYVlj
         X5THczHOJSsFoDkM8W6j+2/QAzGpE3ZczjFrP/Qx1+xqOySprKIXbrbAjvjrgwwiBIXc
         qJRtC41fjGT3vbiMMtOD4H1i9IKfSFStrRVudcXIxWUeYiwbsE+9FYyVNiZWPHMwzA5p
         gw7qs750wnugN0LWv4b+wjd7OIkW1pVhqzXFAmWPDF6ZBPbULr10AG2XB61qZDAieVTH
         mYsA==
X-Forwarded-Encrypted: i=1; AJvYcCVTBuNBS3IcZhSuE+WqQhvw/k99Wgiy7rqzZd0P6maV9qfVcGOen0D3XQSl2cXEk2ydbYN5qI01qIZUx8Wexg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhyyxXJtJKEl15dp3cRaJhJXcy+MP4X5dkDwnQc5XLPovuYZdk
	OI9U1zJhXa+xLwe1BkJCHfBdX/xYpi1qvTMpfjyttaWyOALVK+2pe7NrbeOOfxX13vs0SxcLObs
	xkJvSgCUoJaOtm4tnEkDZT0/HNit58qrG+CpQzPaesItUq6DpdVKpmIBnEsmvznMn
X-Gm-Gg: ASbGncvcpWw80aDz5OdCTWASf+5l+GC3gOkRaIOzi1hm2Y5SZQ/Os4zZ/JXCHsyNCok
	DwyM8DQ0gCh1IWw7TkKkCGxqhBv5K2vVY9WrQ5OhQZxPL5thzFb2hTwO3v1NqVqWzautS/I6T2E
	UOzZHlbLHTugwV6w2/zbHfyJPAAKSLI7jIBu4ReY2tmgqaY5RnlaRZubnoPaV+dH4W6CUiBJ9SH
	9yJUFdJg9Bn9DS37pdnMTXeb9vtunZEg1b1B9G7GI2HHjOtilmDPv7i7LmL/g+0QZ+sm9zvAYhj
	/UGCpYj7QLVTtHo1L/TzG08HnQlij8n94vDFl+HCK6oKv7JmaPc=
X-Received: by 2002:a05:6000:1acb:b0:39e:cbf2:e23f with SMTP id ffacd0b85a97d-39efb949514mr12348681f8f.0.1745309015364;
        Tue, 22 Apr 2025 01:03:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+QyOm/Vu2YE4p69xcQvAMQItgNodGSQLc0uE5uT6jNKC/u0jIIwsbmq+1mCMLdKIAUP3k4A==
X-Received: by 2002:a05:6000:1acb:b0:39e:cbf2:e23f with SMTP id ffacd0b85a97d-39efb949514mr12348638f8f.0.1745309014968;
        Tue, 22 Apr 2025 01:03:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9ed9sm166802545e9.3.2025.04.22.01.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:03:34 -0700 (PDT)
Message-ID: <e18bccaa-bc73-4d7d-a708-688284b1d15f@redhat.com>
Date: Tue, 22 Apr 2025 10:03:33 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250418165059.560503-1-jfalempe@redhat.com>
 <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72neXsmmYQXQOYxndFWkyp1NKa=x3skekZZJOVE-wMZeuQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: orPuIoxreiUBHA_ruvRpvuwZzaZ_nD2YgXIlGafL5Kk_1745309015
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 18/04/2025 20:18, Miguel Ojeda wrote:
> On Fri, Apr 18, 2025 at 6:51 PM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> 
> Thanks for fixing that -- some tags for your consideration:
> 
> Reported-by: Miguel Ojeda <ojeda@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/
> Fixes: ccb8ce526807 ("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Thanks I will add those tags before pushing to drm-misc-next.

-- 

Jocelyn

> 
> Cheers,
> Miguel
> 

