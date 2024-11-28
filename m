Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DB61BE238
	for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 16:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732812231; cv=none; b=BB5syUvmU7aiG+O6RlxUhX1/Xw5jcZjNKPrpV7+xdYtgLtF21tNkanvJRkK3ScGbhfcEFH6JKyiuy+VD+OYysc+X+kZJCHvEAWFQ/PD22TcL9bIh50sKMbXtp3kQdxUwEnrJUrm5JxqBdu983RN1QYyKfAiI+cvjJzLe4hlQ3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732812231; c=relaxed/simple;
	bh=R7Omu7J6X5LKJ16FM7yNx4t1+DrV5kkPvPh63I4qE54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbHprDImmL1g+QDq8IQMLya65mD72tORR7CxMDQHtZsG8iZI/ha97/yhm71CgXu8HWJOzDQvE2eSqY1KnrHN2gL/pDqaurdr16sYIPOER9FICddOiNlOoKpL0jSoYhY/QWSBI/CkZ/9SbBLEcTqYR4lsXtYZt41xC8Xb0tE0gSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F3Cf58N5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F3Cf58N5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732812228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K+3dmbf6C9Y2rlj/QHY9nRJ9DkG1EoefJsooKwPlv10=;
	b=F3Cf58N5ZhULG0EcMLR7WDcFjruynXIidJkayHdv0P3ayLk+EgjhNbJjM2xzY78p32JGMT
	0Rexts1Xef3iKJNwEmlLFaFvaEvOADNiHwA7tNjfZOjA5kL3Z3H5qbldIr0qPMo+j3H5Ey
	pIkMy1wWn3opVQmwo9fyNUHdTjLpyFM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-14-Ci6tQT5HMZy0OWIIHgvDsA-1; Thu, 28 Nov 2024 11:43:47 -0500
X-MC-Unique: Ci6tQT5HMZy0OWIIHgvDsA-1
X-Mimecast-MFC-AGG-ID: Ci6tQT5HMZy0OWIIHgvDsA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38243a4ba5fso613584f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 28 Nov 2024 08:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732812226; x=1733417026;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+3dmbf6C9Y2rlj/QHY9nRJ9DkG1EoefJsooKwPlv10=;
        b=lzA6e3rCCM9wihr9g0FdBjfrOkBcwWHqno8dRdU59kSwRCyHCvONTeuQD4q4/S9DNk
         O/uv9WEn4mNkMWH+0q4WmE8UbphW86HvcamWb927DxTYaZKdAgqm+sk7yMX5wsEdApI5
         FzfO71tpyjJuj1NuVRSuqdP6KzeAE8sWdcMeJNYFlI0eFDSfhecwAN6ccKZw8I3bzDvX
         AjFpZuTJCLCMGEANqlezerqvBpVOWFrLSBJblklZygTrWx3vNsORYwWupjgpmI71plsb
         4j0JX4E+5Xi6hlu84EZoQTxqz2zi7HW8rDcajOOq9f38P/MQHPl70ZbyukqWUkkZhHmD
         8uWA==
X-Gm-Message-State: AOJu0YwnDMgLDWyxu0ENN//WFx/wjqvFUaiAw4kd3MUgd0YmFY4tUHwm
	EsI1OfiZoHvIAJcllow13PJ5m9veczXB2jB3WvFEDqfAzTVHuHGnUo0LeeK6MjMsEeYLJG7jJLD
	Lc3tS2eNwa1QYT0oSM6gd6TEYbZYap01ZRfIH+zEvuMlnFJZ3ljxomTN5S86M5NGG
X-Gm-Gg: ASbGncuVHH7HDcZ36+5Iz2hG68bgEEuQuycWMVbV9uUeG56YGaTHo8XPxM+tzVGeg2m
	lFcpMwqkmBvA0eAajrGilR5GVf7W3R8rwwmKZj2WRFBItWfqSB7CZvy3e0QHll1YbzUezbn5I1e
	EJfoX2ehFwpz6zqGRG6fspsjOyDOSppSonPQKM0eh1VBGDKq5BUU6vqUNQh6FU9UFO/QyWG5lQ6
	24K/sQA/LKM55ceGHcosMsKd/JkfXjUEVbJbRiMNvUbSeWG2LJIZRQ=
X-Received: by 2002:a5d:59af:0:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-385c6ebb8c7mr7364829f8f.30.1732812225937;
        Thu, 28 Nov 2024 08:43:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFC4BYSXCVnEpYmCQy+9reJYshrH6n+hXcy3RvBypV2jgbG7ijT6BD4xz1XKqt0CRFoaWIVmA==
X-Received: by 2002:a5d:59af:0:b0:37d:4833:38f5 with SMTP id ffacd0b85a97d-385c6ebb8c7mr7364811f8f.30.1732812225627;
        Thu, 28 Nov 2024 08:43:45 -0800 (PST)
Received: from [192.168.10.27] ([151.49.236.146])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-385ccd7fec1sm2031756f8f.97.2024.11.28.08.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 08:43:45 -0800 (PST)
Message-ID: <d7f045c1-79df-4592-a116-01874f402de4@redhat.com>
Date: Thu, 28 Nov 2024 17:43:43 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] rust: Zeroable: allow struct update syntax outside
 init macros
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 boqun.feng@gmail.com, ojeda@kernel.org, benno.lossin@proton.me,
 axboe@kernel.dk, tmgross@umich.edu, bjorn3_gh@protonmail.com,
 gary@garyguo.net, alex.gaynor@gmail.com, a.hindborg@kernel.org
References: <20241128141323.481033-1-pbonzini@redhat.com>
 <20241128141323.481033-2-pbonzini@redhat.com>
 <CAH5fLgjJbzAbf5CO3xjHxcThpqju3j0tNdo+QiGupARVmoThYw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <CAH5fLgjJbzAbf5CO3xjHxcThpqju3j0tNdo+QiGupARVmoThYw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Awglq85KqHJsMEcfbPw4KZudHRozRktDLF6xz4MtXeQ_1732812226
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/28/24 15:40, Alice Ryhl wrote:
>> The definition of the ZERO constant requires adding a Sized boundary, but
>> this is not a problem either because neither slices nor trait objects
>> are zeroable.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> Slices are zeroable. I know they don't implement the trait,

Right, I should have used the uppercase "Zeroable" for clarity.

> but they could implement it, and this could be used to implement e.g.:
> 
> pub fn write_zero<T: Zeroed + ?Sized>(value: &mut T) {
>      memset(0, ...);
> }

Yeah, that would be I think

     pub fn write_zero<T: Zeroable + ?Sized>(value: &mut T) {
         unsafe {
            ptr::write_bytes((value as *mut T).cast::<u8>(), 0,
                             std::mem::size_of_val(value))
         }
     }

?  And it works for both sized values and slices.  If Zeroable is 
limited to sized types, I guess you could still do:

     pub fn write_zero_slice<T: Zeroable>(value: &mut [T]) {
         ptr::write_bytes(value.as_mut_ptr(), 0, value.len())
     }

So the question is whether the ZERO constant is worthwhile enough, to 
justify the limitation of the Sized bound (e.g. having separate 
write_zero and write_zero_slice in the future).

Thanks,

Paolo

