Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080BC7F48C
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Dec 2024 16:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733761186; cv=none; b=lffIOQ5CsTh7Xy78qfA7AQCKa4bt/s6pBQdKu4Y9FvMNuTCE0zhm1eQpf+KpnVJMCqejnZLjXMJpShgrcqEoP3w0XWWuPhCuwmxueKKHG7Fk71a8os5FpnPaGRJSySVGroSTbwigxwGqfezaYzKCkPuCqTwFHXXL0IPQux3cQY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733761186; c=relaxed/simple;
	bh=8FLzNsyB3fptWxLXTIAybz+auJ+xxGgjPufYt3zW0Cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VtemHN8BF2JkqPp1JdQ9tR/Yb/JkYHnJ4ieckqbxE5LJtwnDAtijj17xq3i7XaW6hw3V+QvBU/cl0sHFDyc14RY/I6TkK1+3dNaR6BKt/c8X1pN421PhmXuEGUo9g4yhSHCQwQ2hOpjiXVMrWWk70wXuHhjKZGzO8obOVoX8TJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev; spf=none smtp.mailfrom=sedlak.dev; dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b=V555ovhG; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sedlak.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sedlak-dev.20230601.gappssmtp.com header.i=@sedlak-dev.20230601.gappssmtp.com header.b="V555ovhG"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso825602766b.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Dec 2024 08:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sedlak-dev.20230601.gappssmtp.com; s=20230601; t=1733761182; x=1734365982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NripXMxSvofQNxvS/QURB9raKTMdjSDqrrLZd9tIawk=;
        b=V555ovhGqfyXo7awkS+9xsKpex3V9SFeQD6qw0f6bk71L2lVslhOQSiQoHxdUtGfuv
         PYCAubMbVIMFpvpCRLLx1iFewRielNuppqkpoY8wN/mo6hNtIH5y7AZ8ViCwmtFYuytd
         qpCvk/nTVkkI6ab0iGjgeSGbuVxoTK2K91PCsqNC4/QvIFV159enwGFSD9xUZZgCkhG6
         zt6XeT8NQxP2Z2aT0jyzgci8gPz7AvrcaHf7KEoUxVKngmhRKnkazb4mrP8cVPBa/GSp
         zLrK+80KbgGXDhQMJP7uVreGepWoEWS7ZVTmBJFjiXYcnNq2iT46kwURm6dnH7jVYoxs
         tszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733761182; x=1734365982;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NripXMxSvofQNxvS/QURB9raKTMdjSDqrrLZd9tIawk=;
        b=CLDYAk7ks5SITxns+3tJym1M1YXiRL+c3CB5SF9AGCo/VJ+U+F5V2MzbjGEm3SvQaX
         LgV6XCx82WcBTZAwwLlrBTUYIFTER3YyipCMAh3oysjvufOaSXzZiaLQMEx4LLCmTOTv
         IqCICUsuSuTg76Cj+c/b3AYbudGRMrwLVTE/AHihUfoK8XpR5O4aQmkLkN0d2GfWeLlt
         orI+9ecFmkucAWJpauzRWdcouZQYawfYgoRR1iqVygkDH/7oC9vk/m662Xgaq1R88CkP
         2oAcyMAJbWl6E3Udczv3apGx2rHCEhGZpYIDxZeIm7VV5jcRI+drXugeEQel9+qv+ASd
         uXiw==
X-Forwarded-Encrypted: i=1; AJvYcCV8zLSey5akOAnHugyHLg3dDtmdwrZ0kJCyK7txo1EniyIz4SP3AhfzKmpJ1CnJ8qZEFt0JbzvsYo85oOY9SA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfKUOw105eymZGZk07FbIFr5qq5OGF1ZWItmejtZBmFEl1qLhR
	FdVCNfzJJ1geF/K8NV004bQFTP3H6kcbV/m7JuHQYcT0KahB8C+DuioC6odwX28=
X-Gm-Gg: ASbGnctgbi6yORVn0P2JAJteFw3GjuYWpOFSYh1S60XymSIJadMUa8QkLAZMMbGgZTh
	RM+7GHCpcAHGSyGYdOThX5C90Wf1CQUsRGr8ZWiPvwOBenUupwqMve5vCswAlvbslqfWgwLqU+S
	fZxZVcVDN1bo7pdzqhVHqfa95q8AoFQpz9HKGG3p93mIJpFaO4J0jqTyuYp2cVxD/rOkkXH+pJd
	bPE7Q8o2ou6AEauXkM8G3CdTq7sEudwXRn/xxR0G1Max4XmFA3I8M32WWYQ
X-Google-Smtp-Source: AGHT+IHNBjPC/5NF4BJrwWxv+J7UAuVC7WqIakAYaAn2fbKEP/W6Lt7zHXOLiWPmouujnYObj88/Mg==
X-Received: by 2002:a17:906:3103:b0:aa6:6f90:d51b with SMTP id a640c23a62f3a-aa69cd29f25mr109731266b.10.1733761182154;
        Mon, 09 Dec 2024 08:19:42 -0800 (PST)
Received: from [10.0.5.28] (remote.cdn77.com. [95.168.203.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6801060e4sm228571766b.158.2024.12.09.08.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 08:19:41 -0800 (PST)
Message-ID: <2f9e7c85-37db-4fda-a30c-7b0e6e6a88e9@sedlak.dev>
Date: Mon, 9 Dec 2024 17:19:41 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] rust: kernel: types: add mode wrapper
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org
References: <20241208131545.386897-1-daniel@sedlak.dev>
 <20241208131545.386897-2-daniel@sedlak.dev>
 <CAH5fLgjny4mZRdhSG3DS-GKPTfQB0pg_5sTroAw13wR-d_BhSg@mail.gmail.com>
Content-Language: en-US
From: Daniel Sedlak <daniel@sedlak.dev>
In-Reply-To: <CAH5fLgjny4mZRdhSG3DS-GKPTfQB0pg_5sTroAw13wR-d_BhSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 12/9/24 8:21 AM, Alice Ryhl wrote:
> On Sun, Dec 8, 2024 at 2:15 PM Daniel Sedlak <daniel@sedlak.dev> wrote:
>>
>> Add rust variant for representing file mode. This is needed
>> in order to set file permissions.
>>
>> Signed-off-by: Daniel Sedlak <daniel@sedlak.dev>
>> ---
>>   rust/kernel/types.rs | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index ec6457bb3084..35ac2898433a 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
> 
> Perhaps this should be defined in rust/kernel/fs.rs?

Yes, likely it is a better place. I was somewhat surprised, that we have 
dedicated `kernel/fs.rs` file with all that flags, but none of them 
regarding the permissions, so I thought that it was on purpose missing.

Daniel

