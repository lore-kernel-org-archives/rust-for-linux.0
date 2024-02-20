Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9081B76C9C
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708458959; cv=none; b=NNyLdQh8Sf/PB+5YUc/Jn/DXLZWK3zMCg3qcJ7RHkPuWxUy3fH1BYLhIDYH37elRVJ9t0whAUvmhC1DniNRhPG3zMZm/cqE83onyzDqQ4tm69uWO/SLVPGYSW+nsb0LWbhVpz7bEv0SyMSj0SDMXB2nyOMaFk0JNacdYuXhff9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708458959; c=relaxed/simple;
	bh=nyd+9GOMvavgqXZ0YaRqKHzUiavipX2Lbg12w9ySSEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YkNTSXR+4V0clUKgxZxRqXOqCbXkloWh2b7OyqoTKEBmkt7oM/DDIC5Ob6CGry2lpFlQlD5ukh8NpWLUdL2Dw/m5IrJ20D35otmo/QOxuggT92a/cTKYPxsBirjWZfR6uZGH0Oy6IsJ3f7+LzmyQJu6Lwrp2eHudNejGwxLVF2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EOXg4eEd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EOXg4eEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708458956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uyHevWF+0otpMjIyAgOTy4wZv/aTE0NbsvDAaIWioN0=;
	b=EOXg4eEd/Jy2MnrOFVQoG/3TKPeFf4xgbBv0vVxfUxXaeyx6qjxUEh2959SkFyVlPxgubu
	2hD05JXNggwnS7vbfwfLrARhGQmMwfaMq3C5pUS/tK0ZaGZblaT782irydmRfP/TmX5I03
	xRbkWfaBQPq46iqBQILygFoLFtwOIJs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-OOmh_CujOd2l_hMJhpmdqA-1; Tue, 20 Feb 2024 14:55:55 -0500
X-MC-Unique: OOmh_CujOd2l_hMJhpmdqA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a29bb25df84so371538566b.1
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Feb 2024 11:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708458954; x=1709063754;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyHevWF+0otpMjIyAgOTy4wZv/aTE0NbsvDAaIWioN0=;
        b=pwyk9uJ/XDtNCzIBL4MzUMeASwhGSjHa33UuRmgCpJWn0b5HZaVqvp06TAj8N9o39e
         WZqEdAn8GHDlPtXd/484uracy5D70K3tbMtl5CDfhyzrZFyg0AoblPKUfO2dCWdoRmAd
         Zcyt09TSd8L3dV9UDocnKUDCyf8c9yP67naCVv1/Ug1IJBgG0MysTy5qH//SCH4EjS1I
         T1CAe6vMP+tFD+/ytowjKYEzxrFxBgsA+eDXkJUkLb1QtaLSANgTHbgCar/fpfhZhgbK
         cMAzUaTIn99NwX0+T2DIYqCzfTGfYrvDIwmOhimTPaIboh6APpVG74VCGI2ZzfYIw3Vq
         qriw==
X-Forwarded-Encrypted: i=1; AJvYcCX1pz9Q1e71xHzW6G9hOMHwMld8I/wvThk3qiFdJ/4eAUUsqZ/TH/nqmH7O/Tlvrhd7YjJ0oXStrI3blKGsSmgdzRFO8bV4LIPcU/fDZUo=
X-Gm-Message-State: AOJu0YzArmQaYzpTFuhPQSf4NmivcID+BuGNh/KDPn3b3MA47zv1YBhH
	eM3vSI3JSSYl0qCq3pnzpT7wIlToHJRRp0tydUT8nxEX/bJ4RrDMlMADLlNBVHIQha0wYC6W2U7
	kxDChoe0D6vxPp/C9fcsVkNvtwfjB7gkg1YFXNwqHxS1LpNSbFwm8vRXU1LYYhhFN
X-Received: by 2002:a17:906:564a:b0:a3f:29e1:1a77 with SMTP id v10-20020a170906564a00b00a3f29e11a77mr244743ejr.32.1708458954178;
        Tue, 20 Feb 2024 11:55:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEZOzMGmty1Po3uqbF6oE2by9h3loAx1Hm2q3P4pQfPkYU06Yw+e7mXgpUgjQr4+aJ5fDgiVA==
X-Received: by 2002:a17:906:564a:b0:a3f:29e1:1a77 with SMTP id v10-20020a170906564a00b00a3f29e11a77mr244735ejr.32.1708458953907;
        Tue, 20 Feb 2024 11:55:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id lu16-20020a170906fad000b00a3d5efc65e0sm2941765ejb.91.2024.02.20.11.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 11:55:53 -0800 (PST)
Message-ID: <e8b4cb98-b0ab-4754-b80a-9df77983137a@redhat.com>
Date: Tue, 20 Feb 2024 20:55:52 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] rust: str: add {make,to}_{upper,lower}case() to
 CString
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, a.hindborg@samsung.com,
 alex.gaynor@gmail.com, benno.lossin@proton.me, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, gary@garyguo.net, linux-kernel@vger.kernel.org,
 ojeda@kernel.org, rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
References: <20240219163915.2705-1-dakr@redhat.com>
 <20240220093541.280140-1-aliceryhl@google.com>
 <e543b270-dea7-477a-b83d-62129d4ac708@redhat.com>
 <CANiq72nVkV3+1rt4Mi+Own6KGAzmvR2jf8fFsp9NBu_gy_ob5g@mail.gmail.com>
 <462aad75-4f03-4f8b-ad58-eef429ed2b34@redhat.com>
 <CANiq72m7-5CuKAKDk=G9sauri_sH0nR2TXi8ye5Eji-qaum3sw@mail.gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <CANiq72m7-5CuKAKDk=G9sauri_sH0nR2TXi8ye5Eji-qaum3sw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/20/24 17:53, Miguel Ojeda wrote:
> On Tue, Feb 20, 2024 at 4:53 PM Danilo Krummrich <dakr@redhat.com> wrote:
>>
>> The rational for a convention can't be that it is a convention. Instead
>> it should be a convention for an objective reason.
> 
> The rationale __for the lint__ is that it is a very established
> convention in Rust code.

Understood. I'm basically just asking why this is the convention.

Because I assume that there must be a good reason for that. If there is none,
and it's really just because everyone is doing it, I personally think that's
not an objective rationale.

If there is no other reason it could even be just the opposite causality, as in
it became the convention because clippy enforces it. (Disclaimer: I really don't
know and so far I have no reason to assume so.)

Generally, I don't think there is anything wrong with questioning things and I
also don't think there is anything wrong in not accepting "because everyone does
so" as an objective rationale.

Otherwise I don't see any disagreement. I also understood that you want to be
consistent and comply with this convention and surely I accept that.

But again, I also think it's perfectly valid questioning things.

> 
> That is what Clippy is telling you.
> 
> You may not agree with the convention (and thus the lint). That is
> fine, but it is still a fact that it is the convention, and that is
> why I said whoever wrote that Clippy description probably felt that
> wording is good enough.
> 
>> I'm not saying that we should enforce it otherwise, I just think that we
>> should have objective reasons for restrictions.
> 
> Again, you seem to be saying we do not have objective reasons.

I'm honestly sorry about this misunderstanding and that this seems to be an
emotional discussion for you.

I never said that you don't have objective reasons (in general). I just said that
I don't consider *one specific rationale* as objective (or factual).

And I think it's perfectly valid to claim the right to do so. This isn't a personal
attack in any way.

