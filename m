Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174FC2DA
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Feb 2024 11:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707133299; cv=none; b=QiOl1dTeUDryUW5hVUelXQccLqLwna1klwXorxLrCseHjvzq9rrmj7KzrFwFqp3mOiL0gfZSLaDHFMPs6udrWdLNWXrzVOEjhK2RWsji3HUcpkdP0HQ83zF7Bxrni5cYtgUg/TSCsd4fVwQcETtAxu1h0Hs3P4x5yNwBXo968d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707133299; c=relaxed/simple;
	bh=Sr5Z0nXUJIYpGbIhXV9yiXFHoZkAUgFcgHdfNEx1mEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QunF8avdY/TV/XJfeXow7eOx5xFUnFGdRLi43s0CMXfshYsLU7k7+b3rAmk03ZUMkCdaWgvT5tlPHJye2o4Rqn1s77I7oO61pi18kisQ81NAXbj4fGr9PFa0NyiCVWusDM71F+svyb/HnMW92attyGYFrJ+akZ2XcoGrjKKhmGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=InBthqqO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="InBthqqO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707133296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xxkGPipDgLYu1wcjjzx43/7/OwVkW+5FMa9JE9N18oA=;
	b=InBthqqOXVuuBgxsiNRcgsB+NcVkjDmsRjOJ65D5bmds2lbmHFEJmeivksByzqatTefGNf
	/58qLd22DSu5ZkgLQCr57G4GMfUHvbE+eTxIrMAIU01FdqwkDsHrk1/njaEltMd2b8Ny1x
	KSe32tPOUwGkrojgVN+hwY2ArTRMPaU=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-DQoTmq8zPNqpxLzRPRQnZA-1; Mon, 05 Feb 2024 06:41:35 -0500
X-MC-Unique: DQoTmq8zPNqpxLzRPRQnZA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2d09ac3a302so15429191fa.3
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Feb 2024 03:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707133294; x=1707738094;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxkGPipDgLYu1wcjjzx43/7/OwVkW+5FMa9JE9N18oA=;
        b=dXr5uDt6RSVDdH4Du+SNZwJXyndh4dnPXpwjVBK2kCu967ukWCrg433986BXI79oYw
         LKrpcYVlC4WP2GNlD8dqMuf4ScyzM+1hJ2GqIkKlbSBJ7suWqxBlnmI92b3zzLKidX2B
         GkN1/L3uRxnZdfiAsCBmlxQUsPTiODMHG1HIEpWTKzd4KMDPUWdztlJ2OaEBCOxJaBrH
         LTY2kQ5nDrm1j/UO3Bpn1BLOF0SC0TbYP8c2ttZOCVUiXoeQr9CoLOxCD4QYm5xe89mT
         B/J8OqVLN6MnXK6+E+uTFJwSOSnu1arrCiUmsW5tt4zhy+pfnemK1NME2dtqpOz2qW6p
         om4g==
X-Gm-Message-State: AOJu0YyvhMjPXIVxsI+o7EBhgmCMh5ahSC8VmmLnthlpSPYrixeUPQ2F
	KtFnn2s8n6nSryjvmZLeYXRyhKe66piGK6mUQhpAD228j/Ztf+TnLCBLZfovwxZiymetjG91AFx
	0Hv1KOG/HM9Icwtp9jdFttX9KMC1pFDS9W8TfRevnLdhux6j68M56fzLfaNE+OFJa
X-Received: by 2002:a2e:9e81:0:b0:2d0:6217:b1e3 with SMTP id f1-20020a2e9e81000000b002d06217b1e3mr7338903ljk.46.1707133294194;
        Mon, 05 Feb 2024 03:41:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6eSrDMepMb6aEmpU+//mpg7efR9tcvaZKOP0I2/N0VFiC2FGwBwJ4ZqV/dJdS5jOUlGy09g==
X-Received: by 2002:a2e:9e81:0:b0:2d0:6217:b1e3 with SMTP id f1-20020a2e9e81000000b002d06217b1e3mr7338892ljk.46.1707133293854;
        Mon, 05 Feb 2024 03:41:33 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWxR9jx4H/98unJPs9RHgQZNPXDnGvKx1Ew5+an4MhxaKKDQ791m5zHU0nTY8LlmaAP3TVj3N8W3/W4kzHhyOZkxPYhVrY7t9p9C26fOm87ekhYvFkRclzyeh9Ff/6Hfjwpx7dIZqy2cPgZLskJIH7mWxFPZKi4YWR8tFMsh9/ez3eehDayJoN7/ANT
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id x12-20020aa7d6cc000000b0056010210438sm2793664edr.32.2024.02.05.03.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 03:41:33 -0800 (PST)
Message-ID: <f60af824-633d-4e9d-b20e-7fb9911d9e0e@redhat.com>
Date: Mon, 5 Feb 2024 12:41:32 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RfL branch for PCI bindings
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Andreas Hindborg <a.hindborg@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Philipp Stanner <pstanner@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 Greg KH <greg@kroah.com>
References: <929f47e0-8aca-471d-b54f-26908321999b@redhat.com>
 <CGME20240201185509eucas1p253299bc51f92d6be1041765c804246ad@eucas1p2.samsung.com>
 <CANiq72=zcLXOzYbLjNz08s_xN=oC1ZaePnsRigMJLzQONUa5xA@mail.gmail.com>
 <87o7cztais.fsf@samsung.com>
 <CANiq72mSVg62nS_Qk+7o74vzcMdt5Vx5COWEfnu+tpj1_2JzEA@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CANiq72mSVg62nS_Qk+7o74vzcMdt5Vx5COWEfnu+tpj1_2JzEA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/3/24 19:31, Miguel Ojeda wrote:
> On Fri, Feb 2, 2024 at 11:40 AM Andreas Hindborg <a.hindborg@samsung.com> wrote:
>>
>> We could start out in one configuration and then change later down the
>> road if it becomes clear that another config would be more beneficial.
> 
> +1, let's start with what we discussed -- we can change the
> arrangement whenever needed.
> 
> I have created the branch in our repository:
> 
>      https://github.com/Rust-for-Linux/linux/tree/rust-pci
> 
> And added it to the website:
> 
>      https://rust-for-linux.com/branches#rust-pci
> 
> Please feel free to push to the branch as you see fit -- thanks Andreas!

+1

And thanks Miguel for setting things up!

@Andreas: Please let us know once you pushed the patches.

- Danilo

> 
> Cheers,
> Miguel
> 

