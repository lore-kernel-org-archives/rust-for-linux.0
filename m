Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B7131F7081
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 15:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734448300; cv=none; b=hCXPhzYYHPGCNz4tNB+rQL6/GRC6OsT7Mw/LdYCv5ncWn658ROtAGgfz4ZFm30RpBnpVTUagt4dLhe7NZXn7SmaomrV5CpG+V3sb6e2u9ggSLWArNeMK0XdOaF8sCH4qajN3sW8R1lJ2DMWqTbfbgdwIcc5XffEtR8GMFmiTwP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734448300; c=relaxed/simple;
	bh=3vdtslznFlau/IIKpnpAX9khJOjvyT2k2Unfnr81K1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3HX2pCFsnqAcCmK+OyQYbS1URjFY/b2ZL7fbhlRb/sNZaQX89lnoEi3Mp7W4l1RvQeCeV82pOyMxkJNnKQpo8T/ucGqV2gb2Eb7Vlyt7JgKozmk2dCmaVC8TLAiJzCncVnnb1YJctQzM8QR7CzrF12lzBiYUKhOtzTvl+xO3NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UijCtV+V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UijCtV+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734448298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c5eA38m2GxvNU/dLIOnc1BQum9+UOA/0HsJWGFSLPmY=;
	b=UijCtV+Vba2hkDMUU3nOiHtOJFhxuag/jCyrVxmM1kosWMh4oVfSiagblTbc0uAd8QDQ/S
	yYjhXGa9FJG9BdhyGie51cuWfldize1jNdkkqkdGY/ZsvZOMfGJM61sm+7LuExsinzVgDZ
	2hQ/pYyB/QkuyaXXrAma4CEhIrTvrgI=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-179-bkv2OBvoN_-HG18b7Mbvig-1; Tue, 17 Dec 2024 10:11:35 -0500
X-MC-Unique: bkv2OBvoN_-HG18b7Mbvig-1
X-Mimecast-MFC-AGG-ID: bkv2OBvoN_-HG18b7Mbvig
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d889fd0fd6so95749076d6.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Dec 2024 07:11:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734448294; x=1735053094;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c5eA38m2GxvNU/dLIOnc1BQum9+UOA/0HsJWGFSLPmY=;
        b=Rk4Yrmf9f9GicdHomRWpIXUTzD2gyBLmZ4cYGxAC5J+N+NKbOIsMTG7TtOcrB34tNj
         YjDTHULRjlC5UtefvK1cOUCriPac9YmUP/dLXBS8kbDebaNBw0oWdNLGJh5qRYRE95lI
         GEjHghEjtiMGOPo+D+JX+ijlY6dzqXdJZfZ+pRVUvi9cWzcq1C6EqGxybD7ek0K2WBlz
         3EJbGzygtSzs1i5FHqprXggVmQfjEHmobDo4QsNlxaWYYWxeORlTC++EjP2O0Sss3shZ
         XFIWM94GPdrnzTxP2CDPffhexmA0yZx8yZ/lmqg7Bo91rcoLd94x4rnZYpAYNJmNyO5h
         LRAw==
X-Forwarded-Encrypted: i=1; AJvYcCWn0twJ6/pp54EXG6zKKRhigUF6U7er+7T21Spel222bVy2fZ2EKSQeVjJJDyYvcKwAfBQgOav7dSbpGBmrbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdygSELlhAPWH+/dh5hBLleKFPh4Aic+y+1YoLP6q8tGC7+M1U
	tftyCTUBaOQW8vPV6jWIGBUMo6Z5hdVBfTht+d8vVZ13/C37/6gK1gWpspf54/bTn8Nkwz3gwIB
	Qa4MPkdbh4f8sqZgiElNSyfCzQqXi73k4YcBQwveDBgm/tt4KjJEe+9bFDwp9Y4OF
X-Gm-Gg: ASbGnctosfnRCSupAfr4BjwtYsSxf74/gTWNOl9LWbWdA6PRLwBJCZumv2sBtti7DDP
	p4O/LFFjmzBUErZ46+LGh3vrAIsg/h6GjhRo/wgaYK2u0b0rGiaAcc44tC5w6yk7Do+p+FrEPaX
	H4HaHb9c2VAP+JIrwmm+7BuQBNWzgnnZ1Qwec7KgSexrLoLDjY9XgOWgfNTntYaF9McxRUb+IXz
	iAZXexB+H02uxKMPC2KCzgaiubodkcBwgMF6A2Bq+866Kvjmfy2szwwrEFQljZAxGjtIJslSmOZ
	B/revVjiEQ==
X-Received: by 2002:a05:6214:2486:b0:6d8:a3f2:4cc with SMTP id 6a1803df08f44-6dcf4c385demr65027626d6.5.1734448294393;
        Tue, 17 Dec 2024 07:11:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFzP57X/BweuIG/kHJ9/JmT/cEseWmJofpVUL+Fb/1flSIptNOX/KnR0C4pN3YCP3WvTPvOXg==
X-Received: by 2002:a05:6214:2486:b0:6d8:a3f2:4cc with SMTP id 6a1803df08f44-6dcf4c385demr65026936d6.5.1734448293817;
        Tue, 17 Dec 2024 07:11:33 -0800 (PST)
Received: from [192.168.88.24] (146-241-69-227.dyn.eolo.it. [146.241.69.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd22f494sm39601816d6.18.2024.12.17.07.11.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 07:11:33 -0800 (PST)
Message-ID: <b701482d-760a-437b-b3fb-915dc3fc2296@redhat.com>
Date: Tue, 17 Dec 2024 16:11:29 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] rust: net::phy fix module autoloading
To: Jakub Kicinski <kuba@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, davem@davemloft.net,
 edumazet@google.com, rust-for-linux@vger.kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, tmgross@umich.edu, aliceryhl@google.com,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, netdev@vger.kernel.org
References: <20241212130015.238863-1-fujita.tomonori@gmail.com>
 <778db676-9719-4139-a9e3-8b64ffa87fd2@redhat.com>
 <20241217065439.25e383fe@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20241217065439.25e383fe@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TyZUWqGZjserdb6ZIfCrshPvOjJnGwmozilmP0n1mK0_1734448294
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/17/24 15:54, Jakub Kicinski wrote:
> On Tue, 17 Dec 2024 09:54:11 +0100 Paolo Abeni wrote:
>> @Jakub: I still can't reproduce the nipa (rust) build failures locally.
> 
> I'll look into it. Just in case you already investigated the same thing
> I would - have you tried the rust build script from NIPA or just to
> build manually? 

I tried both (I changed the build dir in the script to fit my setup). I
could not see the failure in any case - on top of RHEL 9.

/P

