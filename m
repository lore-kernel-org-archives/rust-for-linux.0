Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD46186E20
	for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088972; cv=none; b=ZkNYWWQ/07p511qTmJs4IlCV9yO4qKIPY+1BYt+rKQQBFZZZfzxTwy6Sa4Ie5mcTsMnVigYpkVZ1KbjfO4jbHWGm/G3jsnuqsE1P5IBLgnYF+8bY8qtoW+wfrnbx6vH35Xwy6a0mmJu0L+MUQ5a+ulf7m12uVAdBLZ6e0LgA99o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088972; c=relaxed/simple;
	bh=1nGruMCbppY7qn4neYE0wvu8NfeEHt8bZVd8Orps9qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZs8xfI5+dXvAg3jvVn6FmzfB99RmMLTYfE2gFYll5GEok67Ee0pY3UWKksCQ7MQIkGGQIhvxNkJ9BXIDhra0jiTBVFkLn4+y/VjrbNv/mSirZDHHIJm2l6jeBU0oCoRIgLBKG9yG6AcVmDiQXMPARiCJwUq21sDNIooqNrfLS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aoJjBXvT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aoJjBXvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743088969;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyIB6mZ7OHIQ8TN1E0AWKE682onUFLQ3XEbxIz51DMc=;
	b=aoJjBXvTG6ZabkrU6jjp2FKkMwfICmt9aNTrfHqMv7BVc/7Z6s6PX+nf1KYQSNT7w6gAYr
	3yyfrr6M24D2/YWWX+B4Y2yAAmNVvt7U9Q7Q6VEZ4KLmiSPZqZQ4JWNZAYWZlibccnB2nd
	RPyfNc5JXN94i09798iZYfOaOhlN8GA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-Sx5bEwmHMruGcRiSDIdmUQ-1; Thu, 27 Mar 2025 11:22:48 -0400
X-MC-Unique: Sx5bEwmHMruGcRiSDIdmUQ-1
X-Mimecast-MFC-AGG-ID: Sx5bEwmHMruGcRiSDIdmUQ_1743088967
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-391315098b2so490520f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 27 Mar 2025 08:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743088967; x=1743693767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KyIB6mZ7OHIQ8TN1E0AWKE682onUFLQ3XEbxIz51DMc=;
        b=tlb/7gVz4HNFgxiiuml8LI2LAMVm7KvMfhWYnNQwNuh0KdwgB7/V8uYMCPSPBi6F1f
         ZOPOLCIH5AL8lQq2+jAc8kRuuFDuYDQGjhmN1REn7AgXBhE6VUFdkZuiErImkF9Sgqtf
         3FK5qaxSEy0fNZg40KFaAvvptrjbxZX7wkf4H+L37YqIOKucz3w+eYJYbk4hpE6uKeEk
         X4yHCNDsHRRmzyYVXPmwLE4kCrFcOldj3E9FgiXsCUOtLS4H+QIX57lW7xjduZa5uUxq
         Q5jxJZzn8JI64arZrOV3Qd3TRB8KOvHUBXNuDGNh4Y7hhVgO93y9J596EuYMnVFGI0uv
         cWsw==
X-Forwarded-Encrypted: i=1; AJvYcCUNrscjjvUiWRAs9tAJrKd8aFbI/fr3dW9RnS5ZSkZT772UpLwF1qAM6xOdIZs5G/fHLba2YEP4E4jKO/w5rA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylgQrYOoBI80ZfVP/gfhr2QGMZVs42+u4De4j2KU7O/UTZ7N0+
	eLNKZ8vMJDG1QooR97WazYlNOzCqqSrz2au8fSVY9iZ5pZ4B9IZ/RqVdgnTJv5e+/zHM+AYHgMB
	GhrzPix7NNnYxd/okXCPwnH04bdMeEcS1F1FKMcSgyCzRUmECYkptfPeIjDJLUgw4
X-Gm-Gg: ASbGncs9krSM/YzhPv8FajYtDfnvnGO+/ZvmfXxUwmKCTN1JJO37Up0muyfG5DYbdCc
	lgLnX2z+wIvd1fLEojpxIfyUyDa3QM4W0tXWKP/R4yyLMFvmM/HC3/DDN5Kz6ND1BVXuENZpb/H
	PDAliktjtF+UONyt8fDEmwoR5toGBs4uEAm9ZLMxsMaxUgTeY7saNcr4qIYaYhnStzDf5W8G4y0
	0gfBdbiw3V0CY5pgUwrjz0GRGxFlXh6BevOhBgflyu+sDDMLlO4xoQHkcCVMcc/82+mzLB0yg9i
	9Bss7Z/JQQF4JE6uggrdxGw7JYZcBIGbCfZKTW42PzsEQ3AwFuHoHbI=
X-Received: by 2002:a05:6000:1f88:b0:38f:6697:af93 with SMTP id ffacd0b85a97d-39ad1740e6amr3598493f8f.9.1743088967245;
        Thu, 27 Mar 2025 08:22:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9Nh306S6nC8D3y6/2MymAxytzfH2EE+T7OhkoPuApxgDdG2zQZrGWFxbxp5lSU2j1CNBGxg==
X-Received: by 2002:a05:6000:1f88:b0:38f:6697:af93 with SMTP id ffacd0b85a97d-39ad1740e6amr3598456f8f.9.1743088966782;
        Thu, 27 Mar 2025 08:22:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede98sm41019095e9.6.2025.03.27.08.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:22:46 -0700 (PDT)
Message-ID: <a495133b-7fae-4b88-8254-78d65677990f@redhat.com>
Date: Thu, 27 Mar 2025 16:22:44 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] drm/panic: add missing Markdown code span
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20250324210359.1199574-1-ojeda@kernel.org>
 <20250324210359.1199574-3-ojeda@kernel.org>
 <dd1616d5-4808-46be-9167-6fbfe76e0c73@redhat.com>
 <CANiq72kz9SW8Rexj7feZRvTAhgF+cBwarpFnqu0TSk6C2r9SRQ@mail.gmail.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <CANiq72kz9SW8Rexj7feZRvTAhgF+cBwarpFnqu0TSk6C2r9SRQ@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NDTJbRj7O2jo6SLLsgnsp2pKszIEXfUTwJBz0A_JFp4_1743088967
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 25/03/2025 20:04, Miguel Ojeda wrote:
> On Tue, Mar 25, 2025 at 10:05 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>>
>> Thanks, it looks good to me.
>>
>> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> You want to take the whole series in the rust tree?
>>
>> Otherwise I can push the patch 1-2 to drm-misc-next if needed.
> 
> Please take them if possible, since others may want to take them
> through their tree anyway, plus it should have less conflicts if you
> change other bits, plus these are independent fixes anyway that can go
> in on their own whether or not the lint gets eventually enabled.

I just pushed 1-2 to drm-misc-next

Thanks,

-- 

Jocelyn
> 
> Thanks!
> 
> Cheers,
> Miguel
> 

