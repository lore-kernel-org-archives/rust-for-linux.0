Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2161591E2
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 09:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728896777; cv=none; b=d4W4tVvCbUK+q6oB5cOVXPNXcymAiItTUWEHKbQMkteZ8YoOKiCRB6yx5Tto0XBYUxFQZZUp6sKbtHjLF7Xg6kxAKZQtY/l927GKVkpTTaAFqUK7xknfzGpsFojC9VtUcmK7rX68H9omvaPOeoD4mrkE+pmq5J8K4/tQBsYfsQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728896777; c=relaxed/simple;
	bh=/NYDUbcYsfrPCw8OG9MBVDUi8PxJyMeQ6kptO07FNQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TYk6ajeWXWBsq0a/I4TPxsU2QWGCtKS43WkHTtjepMfqTsb4gh4v3qMdjmf1fdeTKen820HZtFC6Iwmx5MlBBTXtqpBeIF51+mfOiJDBalGU0yoc2hqgH2OfluL4tEXFi1eBFbrPLHRKv7Oc2+7dyQYMBLcXjZo68gFUuMbVCMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YXFTJtbv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YXFTJtbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728896774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F17udMnek9Ri4VpOz181mg426zHfJskr96SKZNMjm5U=;
	b=YXFTJtbvcdEw2QMpQc6fHWLSRAvp1M/wgnotR0bwFbeEAdDTyrQj2LLQnUT6sJRUURJGHv
	0lg2kX32hveVrMefw9Jxaiwke7pzxoO4zzmVgroAhQfNxZPdvisodr2x0jYO4EYkfgIUvu
	ckeFpNRBCIah7bAQnwIGd4FPQtEyEPc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-51c2g4W8PWyCFhXY1I-CqQ-1; Mon, 14 Oct 2024 05:06:13 -0400
X-MC-Unique: 51c2g4W8PWyCFhXY1I-CqQ-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37d67fe93c6so630445f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 14 Oct 2024 02:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728896772; x=1729501572;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F17udMnek9Ri4VpOz181mg426zHfJskr96SKZNMjm5U=;
        b=NxNsVTyVlJ5blTNWlU3nNO8VNsWObQwS2Xdt9lsgL1rSYlGM+b244/4e9J4Jum4It6
         Yfj2UunFbUdnpOFzvobw4bBcmjCICHMpwF/UjLRmSQGMX5GPqYtA5SLL7QhGNrBNeDrJ
         BPIWaFURI4PNj6SP4m29J85p79aEB9hjqPpWMmV8M8DZGYdYHr+h3PD6A21rUbL+pM3T
         ahMkBs8GSocAMLmqW0H2klZcNwlfXRxvP+UX7twDhArjO2k66OvhX38chgih8bzxgvm7
         dXFeAyrg8ku8Nd3qD6YB1Sh7m/XEk2uOwJGJMJSCErrmJGng+5qvhFvZxPJxL+K0tV1a
         pXCA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Tt6FIZHYXRjJrBiZ2oVca8e6rZOqaaJM+N/SmZL0jQtn0MXNaW2/sq5E/LtrOs1LwZXN2IB16CyRAz28fg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlreDfw2/lEUnzvN6dKTHOFVXmCyQJWwTAb6+J1sVzPtAoVU1E
	JLZpKO0CJCgwOxi94rn3Db+tWUEm5a2qlL2QuA7YGTm8if3Ujyrd4raZkaJhs2lIhe39Hu3VzVv
	8gs2uw8Sd67TDSCC/B4eJc+ETsV6t/uX8DbN+LUIVYEe8kDUj6vnvZNE2jD3dIqsa
X-Received: by 2002:a5d:424c:0:b0:37d:47f9:be8a with SMTP id ffacd0b85a97d-37d54e0b808mr8221814f8f.0.1728896772247;
        Mon, 14 Oct 2024 02:06:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmaiFzGAr2+K2rmr2gQwMt3POCAx28GuVYLjzk3R6/H+xl7EfaOtsr7q3eGv0V1GoD7XacMw==
X-Received: by 2002:a5d:424c:0:b0:37d:47f9:be8a with SMTP id ffacd0b85a97d-37d54e0b808mr8221783f8f.0.1728896771824;
        Mon, 14 Oct 2024 02:06:11 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd057sm10790092f8f.35.2024.10.14.02.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 02:06:11 -0700 (PDT)
Message-ID: <cfde8e06-0931-4a53-bae5-469219e77b49@redhat.com>
Date: Mon, 14 Oct 2024 11:06:10 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/panic: avoid reimplementing Iterator::find
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 =?UTF-8?Q?Thomas_B=C3=B6hler?= <witcher@wiredspace.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241012075312.16342-1-witcher@wiredspace.de>
 <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kG0Ai2DHfERD0aPDVuEpLYrZ_2uYdw17=eeHRp+2Q1Rg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2024 13:04, Miguel Ojeda wrote:
> Hi Thomas,
> 
> These commit logs are nicely explained -- thanks a lot for taking the
> time to write each!
> 
> A couple nits below.
> 
> On Sat, Oct 12, 2024 at 9:53 AM Thomas Böhler <witcher@wiredspace.de> wrote:
>>
>> implementing the same logic itself.
>> Clippy complains about this in the `manual_find` lint:
> 
> Typically commit messages use newlines between paragraphs.
> 
>> Reported-by: Miguel Ojeda <ojeda@kernel.org>
>> Closes: https://github.com/Rust-for-Linux/linux/issues/1123
> 
> Since each of these commits fixes part of the issue, I think these are
> meant to be `Link:`s instead of `Closes:`s according to the docs:
> 
>      https://docs.kernel.org/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
> 
> In addition, these should probably have a `Fixes:` tag too -- I should
> have mentioned that in the issue, sorry.
> 
> Finally, as a suggestion for the future: for a series like this, it
> may make sense to have a small/quick cover letter saying something as
> simple as: "Clippy reports some issues in ... -- this series cleans
> them up.". Having a cover letter also allows you to give a title to
> the series.
> 

Hi Thomas,

If you want to send a v2, the easiest way is to download the mbox series 
from https://patchwork.freedesktop.org/series/139924/
and apply it with git am.

That way you will have my reviewed-by automatically added.

I can push this series through drm-misc-next if needed.

Best regards,

--

Jocelyn

> Thanks again!
> 
> Cheers,
> Miguel
> 

