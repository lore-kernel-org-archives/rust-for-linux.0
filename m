Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D67B155A4E
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 14:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758637002; cv=none; b=mnzKt/uQCGc/NFcOCP33jGNf+31GlxOiqhf2YPYOomcPyNnRis50M7NNJFKfE1b7WftBuVLvJzwsRhLRJ+Z8UEGnV5W8UmAamxS+tzwdLxxuAKnfixrY/ADZjMWI/o0xy4CDmdaV9ia8VKOFVNZMCzKePAlZ7IutowVYg1NgBh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758637002; c=relaxed/simple;
	bh=dc0LTmBu+dOpA+A+NZjK2VnTaiUPLbi5QPaHxg/XqmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VD9BPkIqjcuPrmKMhk2HW7yL1Wr+MdiY9/PGEJd4/azzdO44cb49QEYfOsSGme/R9nt5iYMAQKuwQnKWrlA7y+DeNRDazwcSjmF+k/pTVS0uepXM7iwEjkmCG+fdE/69Pz6Mt37gjNMZq/gqlTkmgVHmx6764Nu8IKL2ASV1DcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KN175lqR; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KN175lqR"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b2e66a2fb63so303600666b.2
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 07:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758636998; x=1759241798; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZb80l+O1E6xQBvd+VRgbjxn94X8U/j59tKSQYo1uxw=;
        b=KN175lqRjx4eQP6T58FgKuTwjDr7oHD9QnbPl7291jq/XjHfTlGSkOQHhLJU0hof3a
         1EzxkeyIiYS5L6BCpDtRUe3yhuWcDVhOBYDowhn1fm2+YNVl0tW2/OsrCSV0foTvjZVP
         TDybNUhmzUI9EZkFs5lRIlIaflUNlHHYLRLaCcqjLkBUXRQxwAod96uQJAybqpuCI4ti
         4b/LxDZkVpIUieU9skzTQg7/iLHnMVS+1fkZN3f2UICzKzcyz0Vjurc4eoe9JsfSIHYQ
         I1tn+mCtNsvD3ZJKckXvRixMfFI0CFSZm2vGZKOqdqp1XAjYSadPiulz/Cee/2i5PTUn
         CjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758636998; x=1759241798;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZb80l+O1E6xQBvd+VRgbjxn94X8U/j59tKSQYo1uxw=;
        b=SiW7kbaJSYFnyi4D7t6Dljk48kVlk840vfqNUxHbVkOiivC6G5po72eh7sSvx4mwXm
         ra2Twqgd4rMCSSGua8VTVC8QiUDpQ7YP1QIDG1OIQgIz3tKzdUgroJj8+npmvc3MR2Q7
         kOzLubyTZNOmYYkCfsfqVjnNjZHMnSdHA/4BVhyDVVvScS7tKj71MPdypBp+MgQW+pHR
         jGmk+pDIBNXhwGkK6CQ6OcMArSTcj1M4+SXHFOepzQ8HfGLNyIM4uN7DUqZgx3sCFu1y
         TMWGz7CaNHuuDK5/FyarEFSMG8fSi3wO4IjnTY6Lyk1aR1tB/7L7t437EBgGYCjnF4YQ
         /vbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTXTH3c+56Tsr/J2Cxdof5y86Xl/w/4QS985OfyE47sT9k6nT2fY9wZT7zGCF9mLimLyDdmfBgCy7vQvawjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoeTSQG428xwPm8i1VxBFRnt4SLp3wNR1XqbFuEW44J3TMk/EP
	t6vNeNjej6wHHirNkkHBQA7jz1P6TC895BHFAiwr4xayFFsmqWYCJPYcpATHxBRUPVw=
X-Gm-Gg: ASbGncsrSNHE0PtW57j16jjYbkSEVBmVLeJzYFy2B3dDZd74WNSqFI/3jG3QP1unTCw
	3t030DSPyEJGHs7dZcH9+VAazNHqkDgFlKeqBMW1uMyV37gIChBDE9TScWD4xo/CQSsGPmuo4wH
	hNlqoOi6Q8FbUc7iem6vMjUtA9YLmHWLd0Ay/oGUdWSUiHj/WgA/j8EdnQKbE5MuxAGXPIsRO8R
	KSo+SBSCIuU9OHszNGaEDdHkyc26W/JdkWk86g4ZN4WG1N4W1G21fpgQyh9p3OW8V1IKMTkwBl2
	0iD4H7+m2Q97BAld9q/G/Wt2QXNG5GvfVmuSe7u806y0y8rIW7kOX04rJw0bsRbwhZIiDv7dg62
	Bpu68AWdqo2XdsEt/WWWErqZ/7EWohoYXplS2rZlhXaRRlqnixhrshxOPWLWKfxkJ
X-Google-Smtp-Source: AGHT+IEBzQ2i1Adt3iCXJ4XnxKAN2NtFXYdtXtl8S+XU9JKg1rsZ+VFiaHRRKP8LO02MhtH+JmPQOg==
X-Received: by 2002:a17:906:c10e:b0:b07:e207:152a with SMTP id a640c23a62f3a-b302764dbafmr282212266b.19.1758636998268;
        Tue, 23 Sep 2025 07:16:38 -0700 (PDT)
Received: from ?IPV6:2001:a61:136c:1301:bd1:21a5:4846:e6d8? ([2001:a61:136c:1301:bd1:21a5:4846:e6d8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b27217f616esm944449166b.72.2025.09.23.07.16.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Sep 2025 07:16:37 -0700 (PDT)
Message-ID: <f5a802a4-ac9b-4b45-8d1c-871e2e06d7ac@suse.com>
Date: Tue, 23 Sep 2025 16:16:36 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: usb: add basic USB abstractions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <20250825-b4-usb-v1-1-7aa024de7ae8@collabora.com>
 <DD07LUJXNZN9.3RHH9NJNRFVNN@kernel.org>
 <2025092356-rounding-eligibly-c4b7@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025092356-rounding-eligibly-c4b7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.09.25 16:13, Greg Kroah-Hartman wrote:

> Functions like usb_fill_bulk_urb() takes a pointer to a usb_device, not
> an interface.  Yes, we should fix that, but that "mistake" dates way way
> way back to the original USB api decades ago.  So much so that I didn't
> even remember that we used that pointer there :)

How would we do that? We need to be able to send at least control
request to devices before we have established which configurations
or interfaces the device has.

	Regards
		Oliver

