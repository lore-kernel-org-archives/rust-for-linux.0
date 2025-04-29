Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E140274647
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 07:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745912008; cv=none; b=QnkLwCbbq9+lqceQuKhix1OjHHWjOX8iKhoUCRZ9Hxy5w+I8inTWYhtCB7yX7TiqN00kCa7bc4zcpEfRSIF3wg3gRC7STuYL3cLPs3cBTGuPO0/S4UuqFfipJwch8djlfbWsksi4iOOybJKkKXFApkjpDzocr1tUhXpmU1x7aPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745912008; c=relaxed/simple;
	bh=VxOgjQAyjmbmlzGYZ9KQPKGUWG0d7eiHgBvTdyWsskM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MFYj0SCQi4vSLfQ5ww2zYACjTq4mzbnb84yg6RW0GmKKWGKztuTMAoddhx4kbcyXBxnJVAUrm0VWvhCMCg5BPcF9v+c9RJsAAstw22fVuAB96g3T3igKrKDNqi4xzVeOTfRobYtVKW4dEfGLNJE4IWKFx/fDtMloAlElLT+dDQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ggxje4NR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ggxje4NR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745912005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P+72HNtfhPv8IsRO4PpBbClmzVtCdsJ1REbN19xYrgg=;
	b=ggxje4NRTKfkAUI0QIWOfWiOjaUkugR9C76Zj33BO3vVjdsWVdbhAP/XxGDVsHZ/oKscc9
	ydoDU3SsaZMrGfPBB60cI7lfnR8A9TnJLNfeLj0Et9pV76s984eV3+XmS0yxEbjVDsw2eK
	iIArgYXBy1B4vZVO/nr910ixW+0N4nI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-fXBXY5wZP96M0wcEjKJHVA-1; Tue, 29 Apr 2025 03:33:22 -0400
X-MC-Unique: fXBXY5wZP96M0wcEjKJHVA-1
X-Mimecast-MFC-AGG-ID: fXBXY5wZP96M0wcEjKJHVA_1745912001
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so39438855e9.1
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Apr 2025 00:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745912001; x=1746516801;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P+72HNtfhPv8IsRO4PpBbClmzVtCdsJ1REbN19xYrgg=;
        b=PEIY87BzNVirtZth/L5fJFMRNMI3ZaLjQYr48m2lR95bCForVo9hf/mhIWrDRPyiPR
         ZtMtcrJC8modz07WmLg8H/pgiK5ZFCw6ixbrY8COlBClp2i7NTUvXK/+m1cZljX0EyJa
         xlzgt0EfGo42jyMrw8KS/6cYnxgj5FJsG9Qd38Pbih9uy3HMA45Sa5IuPfT8RosfPw3a
         Bq/xJCyN1ECZ4OKFJvl4VwuIUd8I62Dm/Idbew1b7I37Grv2OmH1lm5KKtG4GpKlRmT1
         nfkkQ56K671MAFXVIifqOY/iV1FWvmITMCXcAfy5CZQFfDmfIU6EVtmqaW2LomK+UqJQ
         CGYg==
X-Forwarded-Encrypted: i=1; AJvYcCXxyaiuHbfYkvtpB+LN2MxNaIabxNHrc7rbZZqmq9oilkA2K69LQTgrUQ1bZyOqGj+k367x4t9zvS12PdsLOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdIDevpZD+BBFSfkkaLAfI6Q7wTOSWVJNK7LziYJGexsQxMSz4
	9s4pL8PNT8HFIeDtPcqJW5MnUSLBw16z/eokmRyGedjbqvTF9E0/KEn4dtf8hdJuA6tz4faWhcU
	sSc9JYgXsewI2vosy+JqQtmWbU3pUZxdQNBkuFrOvZM15GaZQ2yPT53th7a3xU5GH
X-Gm-Gg: ASbGnctCZx+wn9V+IqwOHJii8ULgM9F70LhRSPJ6RSLCchNpv06zqLmPfmCNwsadVkQ
	EY2X7oiI2H1UpYWOplM2BDWZKri8SebCdgASM3KX1F5IbfFWlQUzeqdT8JXmqV6LLq/A4pGyD3H
	/HBLDhF2jSf2n+HNHQuA2qvfdRM2y/Eki37QE22MZcsxudkZpWG2vr9hrI4WQiaW24ZjEPd/yaQ
	qmMpOipkUevjpe6l1tdvYrroIcWh5h/vmzx+3qgOMGVwMUDbAGe+CxLLU9SWp/qGCRsXfqqcRMM
	21RfeZz0+2VsXTEjrGoF15T5J0SLo3QNmvxb4xeACEPLY46urwinh1hLkKLA0JADYohRXw==
X-Received: by 2002:a05:600c:19cc:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-441ac85786bmr19965635e9.14.1745912001301;
        Tue, 29 Apr 2025 00:33:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQHljw4FTOErNPchc4gpA5RoNY02F91HquBdjkOTWdJUR7gI95jnweHCcRLzTuNXQSYwqi6w==
X-Received: by 2002:a05:600c:19cc:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-441ac85786bmr19965335e9.14.1745912000916;
        Tue, 29 Apr 2025 00:33:20 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8ca72sm12866525f8f.4.2025.04.29.00.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 00:33:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
 Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, Russell King <linux@armlinux.org.uk>, Paolo Bonzini
 <pbonzini@redhat.com>, rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] drm/panic: Use a decimal fifo to avoid u64 by u64 divide
In-Reply-To: <20250418165059.560503-1-jfalempe@redhat.com>
References: <20250418165059.560503-1-jfalempe@redhat.com>
Date: Tue, 29 Apr 2025 09:33:17 +0200
Message-ID: <8734dr1kxu.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pnKJwpK_BIaqAXfdjF47KAnSOb2sXpCF03cLpnv9Egs_1745912001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> On 32bits ARM, u64/u64 is not supported [1], so change the algorithm
> to use a simple fifo with decimal digits as u8 instead.
> This is slower but should compile on all architecture.
>
> Link: https://lore.kernel.org/dri-devel/CANiq72ke45eOwckMhWHvmwxc03dxr4rnxxKvx+HvWdBLopZfrQ@mail.gmail.com/ [1]
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

