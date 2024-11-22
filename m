Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B03156C40
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Nov 2024 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732261391; cv=none; b=gkmc/5dJp4Wn8dTFRaNqj1jGT8aU1CLe8SmozLKcfPEibV6d1vP9IW1eDrvVf6VO0EFL7vMIFEnXqZf3HGQ+j42XDG9UchAppn5rXsZ0UX3KDnkmmNhsLIV+RQ4KAbDlkbhOWsS4VytJFrwXuKHihlWIBXaBd/5MnNXKS+DKpRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732261391; c=relaxed/simple;
	bh=jK/FNIlK8tsMqB8ZFmlzab7x6UGHSAQ5wXn2mzOrQSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vlj/2AcArZUTlIRatMKuR05rHlqmoVUApd1Sjg8WMBuosL1M/TspQbyDNP4f1NmW69xPqxZIORfpduDaERSANE5Cp3LEcCpZTe2NiahIUeayl6eq4gsKIDao2upjXt01sGa4L6rAqMo12bwBM7tVxe5q4H3VUrr4HU3WAP/pmtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VKhpmIpo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VKhpmIpo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732261388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MLuOM2jyOvbwOm3slJe1qDQLYEaIBoA5WM2sEjnXbxs=;
	b=VKhpmIpojWHQrcXtH133DmqA8aMt86YZUtI66Ss8iLn9zBysu5kN1/lOeEUIadhJlOlYXy
	s6jk1xwMumzho4NO3bMGTQ/mXvVzRSUEL9hS5dV17wB6dxp7uBpmGjBlwhZ7J9ivhHYVYP
	fcxMeydvE9yZR23cissYdnR4IXDDF9o=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-Q4UIWISdM0eCgb9968RpVg-1; Fri, 22 Nov 2024 02:43:07 -0500
X-MC-Unique: Q4UIWISdM0eCgb9968RpVg-1
X-Mimecast-MFC-AGG-ID: Q4UIWISdM0eCgb9968RpVg
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38242a78f3eso956025f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 23:43:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732261386; x=1732866186;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MLuOM2jyOvbwOm3slJe1qDQLYEaIBoA5WM2sEjnXbxs=;
        b=U0HIuXG2+w9ISeHs0MG3ieqmEJHOVqKsnJykLVy86yfOvISWVHc8H5MsX1MM3oOwFN
         GvX5qT+LpDdL1b6ExhauX8C3mjDOTjddLnMxXc3OqVsMUftu9H7BrNbCCxMkXN2RPHbm
         xKlOF3CMPWb80QizPOKndQOS6WPXFPi35xo87OaHnVK35cIEn46jieGhPD9/hnIUE9WE
         ANPkfKAyXU/iaMwlWN2DI1u/HLA3QsofDQA80GCE2Dlo/TiKzNkSQN8CIb7iXaqRBIcI
         Qdp2SsRt6zIq04eQ7m7pIZa82d9VlD9xYMRmNLCvIlz+K73FLQpEckibpW4bEo5Xpmt4
         ztbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWM2L+wPZKio/qgtknp8N5MABqJaqxqIw7YtA6KsP6RzihG4JSa7YIuxBCBBOJZNW4qeU2W+fEbHLruULlpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmq7HpEwQcK6h961AxEeCocky+NiX/KkQoyExVEXo+o0vzKmIq
	u8TpVzt02lB/df6cjW0fmCA24wh7MbRffVdu6vio+7/9L/uTez5vIdf2OGXkx8zAqg714jb6H5s
	hCULaqKB7JPgc2A1gTjd2G+7eztECISLrRM9aRUDuEqQkPTq0uwpiVtU8vnNvAlKt
X-Gm-Gg: ASbGncudWoKPdFGBJom1vKWx//g7nz5Zuiy1ynOGt7idFZno3K0hTKchjwEutT2GmyV
	U/XYIeWwPLY1xNrHrDaG6Ve7j3xf5kz2I/4yqHyeSYIrH4GmfneFjdZfhxvInWbZtgWo4Tqg5oZ
	spsicCs1CN+qgcaClV4gGg51EZmJOCv7Kp2qL++yFFS66qGRvEaUEqf8Q+qKisi+4s/1y8gT9uK
	GFRg01gzhdBm0odMA6dyb1FkalPK2aCxusloB+4XFrnePjftTKSbw==
X-Received: by 2002:a05:6000:1a85:b0:382:4a84:674 with SMTP id ffacd0b85a97d-38260b4d71bmr1550590f8f.6.1732261386213;
        Thu, 21 Nov 2024 23:43:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErr6tGtMpb1BI/SaT/P9DocViH61GRfOwtoSRh1kWEGsxbd7v7DIZjhkvQ1DPGpB8NU6RJNw==
X-Received: by 2002:a05:6000:1a85:b0:382:4a84:674 with SMTP id ffacd0b85a97d-38260b4d71bmr1550569f8f.6.1732261385918;
        Thu, 21 Nov 2024 23:43:05 -0800 (PST)
Received: from [192.168.10.3] ([151.49.204.250])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3825fb537dfsm1641614f8f.63.2024.11.21.23.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 23:43:05 -0800 (PST)
Message-ID: <d24e6a07-eff2-403c-ad4d-f52d55fffe2f@redhat.com>
Date: Fri, 22 Nov 2024 08:42:57 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/7] mm: rust: add abstraction for struct mm_struct
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>, John Hubbard <jhubbard@nvidia.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Christian Brauner <brauner@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
References: <20241120-vma-v8-0-eb31425da66b@google.com>
 <20241120-vma-v8-1-eb31425da66b@google.com>
 <0c6f4dbb-ff09-439c-b736-35568c1450cc@lucifer.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <0c6f4dbb-ff09-439c-b736-35568c1450cc@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: p0R-5Mo4jw25zRlvMmo0xObLi2-Q3_-vwwSNNCJQEzQ_1732261386
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/20/24 19:13, Lorenzo Stoakes wrote:
> I will obviously inevitably ask a TON of questions as a result of not being
> a rust person so, bear with me...

I'm just a lurker on the rust-for-linux mailing list but... thanks *so 
much* Lorenzo and Alice for this thread.  It's the best introduction to 
Rust idioms for kernel programmers I've ever seen.

Paolo

