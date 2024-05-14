Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7BB127B50
	for <rust-for-linux@vger.kernel.org>; Tue, 14 May 2024 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715691372; cv=none; b=G2AspvG59tfJ9KKUmA+M7fIOiETqe8ynYJZ+hfnUMlvshepq6DtB6TMmIB/uSKGjdUepIBzii/U29PCHilhY/pVAyJ7Y5ZK/MTFJocLx+Qkxbm91uqptrAXYUAYkyHXofzxe9f8DwQiTSkpQBMdkw9JuAA9u3rnXJTJblDqp2xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715691372; c=relaxed/simple;
	bh=LybmISOyHnXEgROR10GPXFsv9zBUJW4R3eJLfU5rXCU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ygrp5DqOzNZRd9K9iEuZXPJu3DdGdWa1viLcwHN+IDqjbRd1cwrNi5Rc5ilb6t0sLBpqT+PQPfE8BDwANHg7Vi/usHc7NswBNtGOdS7M9EJGuQpoAC8Tl4OS5Dj/JVQZ8CameW7n57rRC9DW6hKIH/abxQToUCVhiF9vIrY9gCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bjoXDM8m; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bjoXDM8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715691369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l2U848r0XOymSWtFojF2NkZeZcSi7Taj1KjYHYnwq0s=;
	b=bjoXDM8mEMkrQJAn+kH1NCV3ScfZQ6fpFb3/rQmDNOPn7OHkv/Sv8A+KsXH4cVhx5QZgV4
	ply98+9BcMRrxSAgoDP8E22LWLGKJQn3+2ytLuQmMDuylIIZpMUBSw6C8UNTNyn0Wxu8g9
	17QOaY2ML4VIjkuZ0pdvrJm/COWM70w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-OX3-H_uWNCSf5ov_HkeC5A-1; Tue, 14 May 2024 08:56:08 -0400
X-MC-Unique: OX3-H_uWNCSf5ov_HkeC5A-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a5a194b34a6so316384366b.3
        for <rust-for-linux@vger.kernel.org>; Tue, 14 May 2024 05:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715691367; x=1716296167;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2U848r0XOymSWtFojF2NkZeZcSi7Taj1KjYHYnwq0s=;
        b=stg3EW8v24aEMhiN9H7n9idRN8iSfOwyDtbCTSdai1Tf+OgeehyNVY37Zs/435YQi5
         KfnGf3M+uJlkMg3ONSa3NqDq0rfLTipRMv4au6ybpvbtmbn9TBUKC7Yb5s+bZN2U2nnv
         5ahwVwJh+bDThCh7ylYJXjvhRFnPirdzrZIdmIQOVZXEhWWOkvpFgbgfD1dU9IxlIdDj
         IC7uckgeU9DF3Pecl0ZiT+erfe1QfEMrpqo7Y1UfVg+ahi5p1N/XxSZJetiTw10xZVi8
         RL/CUiYu0wzB5o6Gnh3heIy9QijTx14Klbj4CqlzydgdzyGEnEdxeEaXFi5Zvk3m5Eyh
         5iQw==
X-Forwarded-Encrypted: i=1; AJvYcCVwJi7hegD2rLluAwqQYZ94T4sZh9cKVUw8UB0Q1m2VbAsOItubquW8od2CB7dUCvUVZxFHmozza53kG1POOgW8IxioH6m8SvTU8HQVULc=
X-Gm-Message-State: AOJu0YzHVBOBZ/EiDQ+XDkG2iTiJw15s/q5qy1RShBl3hAFdJER5Xvxy
	ODxgvRHKd93U80/BXcY5Rp7fPIBWeOkZfpFlLQkJJHGz9Pku1WY8Ce2o6yTGuYWyEouWIo9lwvc
	1Ki8LsDb5bc1pnzWiKUgl516jNhN6J/UOQMYsAiau5UTxKwsYQ3cY03Q8/oviUGrF
X-Received: by 2002:a17:907:77cd:b0:a58:e71d:d74 with SMTP id a640c23a62f3a-a5a2d55a8c7mr944894866b.13.1715691367454;
        Tue, 14 May 2024 05:56:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBw8zPoK21bWMigxFyg/UoHQzPn0FbuOFnGDSOVINN6UJq3sqqHlcfOMGZ/W1MSsVsdWHJVQ==
X-Received: by 2002:a17:907:77cd:b0:a58:e71d:d74 with SMTP id a640c23a62f3a-a5a2d55a8c7mr944893266b.13.1715691366980;
        Tue, 14 May 2024 05:56:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894d85sm717550266b.72.2024.05.14.05.56.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 05:56:06 -0700 (PDT)
Message-ID: <bf76a42e-715d-46ba-8609-3dc3d804653e@redhat.com>
Date: Tue, 14 May 2024 14:56:04 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Add room for insn-enconding and symbol name
From: Danilo Krummrich <dakr@redhat.com>
To: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>
Cc: David Rheinsberg <david@readahead.eu>,
 John Baublitz <john.m.baublitz@gmail.com>, x86@kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, rust-for-linux@vger.kernel.org
References: <20240414180929.79033-1-sergio.collado@gmail.com>
 <ea4a1a66-b584-48f3-8453-370d9ffb1f2d@redhat.com>
Organization: RedHat
In-Reply-To: <ea4a1a66-b584-48f3-8453-370d9ffb1f2d@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 5/8/24 13:58, Danilo Krummrich wrote:
> On 4/14/24 20:09, Sergio González Collado wrote:
>> The longest length of a symbol (KSYM_NAME_LEN) was increased to 512
>> in the reference [1]. This patch adds room for insn-encoding and a
>> symbol name, as proposed in [2]
>>
>> [1] https://lore.kernel.org/lkml/20220802015052.10452-6-ojeda@kernel.org/
>> [2] https://lore.kernel.org/lkml/16641a56-9139-4396-a5a8-89606bedd1f1@app.fastmail.com/
>>
>> Signed-off-by: Sergio González Collado <sergio.collado@gmail.com>

What's the status on this one? Are there any concerns or can we land this?

- Danilo

> 
> Acked-by: Danilo Krummrich <dakr@redhat.com>
> 
>> ---
>>   arch/x86/tools/insn_decoder_test.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
>> index 472540aeabc2..add51bfc2260 100644
>> --- a/arch/x86/tools/insn_decoder_test.c
>> +++ b/arch/x86/tools/insn_decoder_test.c
>> @@ -10,6 +10,7 @@
>>   #include <assert.h>
>>   #include <unistd.h>
>>   #include <stdarg.h>
>> +#include <linux/kallsym.h>
>>   #define unlikely(cond) (cond)
>> @@ -106,7 +107,7 @@ static void parse_args(int argc, char **argv)
>>       }
>>   }
>> -#define BUFSIZE 256
>> +#define BUFSIZE (256 + KSYM_NAME_LEN)
>>   int main(int argc, char **argv)
>>   {

