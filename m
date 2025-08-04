Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E9E1FB3
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Aug 2025 14:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754318620; cv=none; b=AIeJssDSxc/DsoZmbLpk0h4s9mtL8ICWNc8soKkNSZkAwKDYxq4WMtJcMKxACjk28fAjhOTJxD3HSNjfioyzyLMsAA1CWFK7i6AV2px1mJDGK2f9+mxaGL7VD+aXqnWQ4FaEY0Gevmfw360VNLfF3M7ToJtCoieO/LfGbOEGQnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754318620; c=relaxed/simple;
	bh=XGQean79iKvQ1SNoOBxI1PwyXlQb1DFHHPAgILoJ7A8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fj+pJrmtjnwecbl9YJl755B/C3RvHTG9O3qZfmakESWtIyIODOtvrIYszC8P6SSzzJ4RInvvk0lSOKSrwCoaidWixLGkeR1gk+Xly8sOrgg47eFJZ7sills8HoIV8UtjAjHDV8g4dj34E0Jar64moEUj+WvWZiSS/GNRbxzITrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kNZpL5yT; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kNZpL5yT"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-458b8a63233so12628645e9.3
        for <rust-for-linux@vger.kernel.org>; Mon, 04 Aug 2025 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754318617; x=1754923417; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FyNoqlo59nlysoyzZ2+kIhnZYUh26JFaOn7hidphRIM=;
        b=kNZpL5yT87EFovfxtV+2870qZbFCkLRlEvs/WOQVZikp1hFJX9cTBCBAXOkTPjpn9+
         HfwVFFz1nuxQ6vU+RzcqQtL9bKkt7zKKris0fg1APkAGBlmKltAW7NSBDtZmPgeHjJmv
         cnLjzjpgoRiGYLPKsI7fMRVrNFo5AXkXFeCjKIrZJiS3YUH2C8NC/zi7TceXTT+7Lpbw
         hsPwqPmTGniAypOjoHheoCgeXpbG9X7fWs7R1/HxXe3DdJoPx/BIonqdGrE9aCcUkkUG
         2vGAt3w/VB687a+eb0Lqpt1SZ28Vj01Ra3eZ0HfOLQGFehw3UKSSeb0Cs72bu7PU7Jvo
         buNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754318617; x=1754923417;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FyNoqlo59nlysoyzZ2+kIhnZYUh26JFaOn7hidphRIM=;
        b=Jkr8ogJgkafI39Kwl6oFvg/P06PCvukyInOqNBf5NTCAztKnkurYmEMbdYIZt6pGMW
         Q3UV0z7Si79Meki1jpko7k+x7sIGTuvRSdRNVE+YM2Ad5gM/DbuYoJDgC+jV52lwfRZN
         UdflX6tFfU47uplOCwZFI1ZycVPIXb9qzj77Kn7XeoONckrwXIyeYItEaVqBTuaTYeMI
         6OhzNE9k3awrV8Y9ad1xdk96kTQbF4TZDwbI/4U60uIePLutOUMoEMKkMYa9FBCRI9oy
         vD8OP0j4VmFj+fPSohvljR+vtGp0rXlFEK5xwWPTaNRg8xykV0aU1qZURNAMihHWVmDm
         86sQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqeaw3bl7KToI73Q6jTidvfDgsDE3vAHXu2gtXMfGI7wL5b374mWXRlt5OA/Jtv42Ar7jS8gfiBKp4yBwabg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtB6YGUKPstbGLSqT6IWYreX3pAByMq0CN6Lrvf/5CHgFNIJ5I
	OWqfzZ3UGcPAleI1rcGbsbJzn4YVUo9JybFGlkVGTzR5EkxA7WLpUyCo
X-Gm-Gg: ASbGncsvI4lfPPGzLaUkG0/xKjWlLYtJfOzFUFzUTV92IURR/TXnSql+EzsKxwiRDAU
	oPf/Rs+UPCW1TI2Rezl7udVt/NAewSg8UnF1/Tb3uLcvocNrCru3uz+gXbohfa12OXy/gH4q9uv
	Rw/1Ulac0PaQQRt0JlaSVCPDbWHk7ZpnGvMZ1kJauT+SR1I+SBle+2sKkDmG81jupMC6tMA4aOr
	BAwkaokq1Oc7CPSM7Ugx9QDit7ZZaeEtsiEYFyxRj5Hu1+2jn+Y186398KjNGsqlPF3TNPiGSds
	Y4XLfZvpoly61a21Xpv1ghFxs9cGp7zDBQNRSo1tkdrJhzE8SRL7PNDLsuZYuxyi3O+MsPMsS21
	mz9tWXNJlnVY9idp7pmthu62lz3AywPA=
X-Google-Smtp-Source: AGHT+IE080w7Oe4IDvcmaEJBkqcQCkEOiP9u73syFRD4zcjilWDpZ16zJZCKXravzm4ewhPLe71dfw==
X-Received: by 2002:a05:600c:a48:b0:456:27a4:50ad with SMTP id 5b1f17b1804b1-458b6b6082fmr71621575e9.33.1754318616712;
        Mon, 04 Aug 2025 07:43:36 -0700 (PDT)
Received: from [10.38.1.85] ([188.39.32.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459dfa64da0sm14904335e9.3.2025.08.04.07.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 07:43:36 -0700 (PDT)
Message-ID: <f85e1109-ee2f-4c92-bcc3-385a8c2d8727@gmail.com>
Date: Mon, 4 Aug 2025 15:43:35 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] samples: rust: add Rust I2C sample driver
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154506.14810-1-igor.korotin.linux@gmail.com>
 <8291F536-BAAD-4F45-9072-8876CA44922B@collabora.com>
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
In-Reply-To: <8291F536-BAAD-4F45-9072-8876CA44922B@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Daniel

On 8/1/25 19:09, Daniel Almeida wrote:
>> +//! - The target system must expose an I2C adapter at index
>> +//!   `SAMPLE_I2C_ADAPTER_INDEX`.
>> +//! - To emulate an adapter for testing, you can load the
>> +//!   `i2c-stub` kernel module.
> 
> Anything else needs to be done?
> 

Sorry, not sure I understood — can you clarify?

Thank you for the review.

Thanks
Igor
