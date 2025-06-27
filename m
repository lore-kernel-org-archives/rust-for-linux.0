Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DDE2BF012
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 11:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025179; cv=none; b=V8rE/mDA61Vf38tflyQg8ZdTeTGQ2ZUVeFVxm1GShB/mvyFoQmVk6lLgkWF1RRNS/8nhXxG/HmLwr1vQpHYkO5mvwUWaoGR5Dv+COCU6KfzBKUODxKi2ybWdU0ZkU56zV/G+6PpgZd9HjL3Vw7S4LgOwIZjUzk8ZNATnqLqW/mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025179; c=relaxed/simple;
	bh=u11MIuHtUTbGSc2ik9QGX6Z4TTuaMv+lnuhq6XgccLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBjq4N1ddpoxr/UPr40uk2ri6/NbLeV4fiBtfYhmxSCjmW2V6rzBouNsz0b51d+4SVyOJrYMyLMwdq6ceSAri9mK8vz+Sffgi9Z4G6Xi4i0FPxRnmrHDyNC4OMtaBk8m+KnRQEYj4kGChHEYgbPWYcFN++SRETkfEhdVeDG65is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SQswvY78; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SQswvY78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MNCLtd/5j3xpGlE8KxmjKTA6IB3ovsHWJ5xcxyIyoHI=;
	b=SQswvY783V+WWbnnQK4BtCrpwcy00B5lpkeiQ6NngCjoQvBZY+92PU0+RwFP/wJwab1an/
	TaQsqHwgvthGtKEMYXx8Jvxk/nBK6SaUB5LV6p40FyKv5gMeAbDbxHisn1Ab/VdSUhBW4c
	BPiThlLShQdL02G9CY2uJcW4wZDKj58=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-or39be5XML-jXRNwibtlag-1; Fri, 27 Jun 2025 07:52:53 -0400
X-MC-Unique: or39be5XML-jXRNwibtlag-1
X-Mimecast-MFC-AGG-ID: or39be5XML-jXRNwibtlag_1751025172
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4535ee06160so14391355e9.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 04:52:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025172; x=1751629972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNCLtd/5j3xpGlE8KxmjKTA6IB3ovsHWJ5xcxyIyoHI=;
        b=qD+7yMPHKBws+AQGF6DKJGrU7ACJP0haHDuQbTPB8LXaCSBgld9JZOA/3PmoNFU1xJ
         eCOqBkLDvV9Bzq2QXvb6uZik8Cy2ngeG93ZLqeSrl0fKyraPoqQdRja1eC9l82LD6/vd
         RnAtMH0Vf0uWyfJgOtncdDBft5zjsUx9QfnD74EFNR9clVt45NdGn/hfuvWZa47HlvgN
         sGUdu3eTSCvwO2+jIlS5DaN3A50yWffOW0LF8dGWPL1KNMvlm6T06uJsobfcCWWwN8Bw
         2AkzD0JPOo7BA6Ls3mYka2JagEgde9c02Ev8PGVFd5J9rkoWqDk7m+3FeZ/50hk48iZO
         qcMw==
X-Forwarded-Encrypted: i=1; AJvYcCW+PPpxA+pq4iISDPGb7piUq3c5w1SFhqD4qrWLfcy4MVdSmCsjVkblb8qw+e0SRQ4h1hVbbSEEIbbrXwPvHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzB/8l1AUiyadVaeHPX942IN5aUHcNm0kdn0FBHguGMYsu+o/4M
	V9AgcjN/eozUFI2XfORD03s0GIVOXNdvGFGVJ9LwXjndWyo++FzuUjEDTF4QwRrGzL0rXACrTkq
	7Nz04Gtk77AAsA+ZkoElMaO/tKsljUTDODop+GgbZbP7ABG6liUcS1TQBWRcOr8E2oPwh
X-Gm-Gg: ASbGncuD+SYr94VIVhkgp7snswIxqKPBtQJPkbLvasc+ztUhdRxvJjKe9JlySBtwEDA
	RYtZDrQdEwPDhMNBDmyCIORbF4cAvDJTwX8N2Q+We5fRIU44MqtpjIjjiscd3LKPoEjNdnCLvQQ
	CWdRNADI3wU01QsvsNNoO8v75EIcRVUNGz8niKIoRUZq1rB/eNMYucnYZhu8zzxziR3zmtkSQ6l
	6en/F/ugMGyfxZMzSyWklThHgV1M14a6xjBIjsLlHnKPAwvM1S6DNKD3U11ZVl3O9BwTqPHNwPN
	PPvLUuv1nzuwtgUb8ci4snI2wNR5FpJMPYUnQxs5y1uzWh/bgDHqnpaihkZqCQ==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id 5b1f17b1804b1-45394179dd4mr1049525e9.28.1751025172092;
        Fri, 27 Jun 2025 04:52:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPo2dBKUZ/Zkw1L6EzaaAtBgiEo7s2NtlnGP+y82PmhNo6U42m+eKNQAeG/uBgsf87Iii9iQ==
X-Received: by 2002:a05:600c:35d1:b0:450:d3b9:4bac with SMTP id 5b1f17b1804b1-45394179dd4mr1049205e9.28.1751025171615;
        Fri, 27 Jun 2025 04:52:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62? ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe0efsm47851935e9.24.2025.06.27.04.52.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 04:52:51 -0700 (PDT)
Message-ID: <bc3cf135-5432-4cdb-8992-7c400e728a97@redhat.com>
Date: Fri, 27 Jun 2025 13:52:49 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
References: <20250627094102.770689-1-jfalempe@redhat.com>
 <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YmE2LO989PL9Ob2ZZ7s1ko0f27kuzigfuOxCN9RSgPY_1751025172
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/06/2025 13:44, Miguel Ojeda wrote:
> On Fri, Jun 27, 2025 at 11:41 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> +/// On arm32 architecture, dividing an u64 by a constant will generate a call
>> +/// to __aeabi_uldivmod which is not present in the kernel.
>> +/// So use the multiply by inverse method for this architecture.
> 
> This sounds more like a normal comment instead of function docs, no?

Yes, I think I'm still confused between // and ///, so I will replace 
with //.
> 
> By the way, formatting:
> 
>      `u64`
>      `__aeabi_uldivmod`

ok, I will do that in v2.

> 
> Thanks for fixing this! It is nice seeing 32-bit arm taking shape.

Thank you for your reactivity

> 
> Cheers,
> Miguel
> 

-- 

Jocelyn

