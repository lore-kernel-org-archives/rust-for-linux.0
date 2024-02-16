Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0AD130E2F
	for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 17:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708103497; cv=none; b=oed6eicO/ONxcnICaPLZQJ7C7Si5FlsEPJDzcNJWrodSIjvmryiRKxMZ4iHtVr9YUTO37WlU4yk3tzmugF4Te1CRWauRvbLyNOrr5eVH1jOE+bezGhNVQnCeph0GWzaqkfLdGCfonJz6pkpSSkhiRUBx1aN5ko5Fs/JxMb2dvFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708103497; c=relaxed/simple;
	bh=JGNjC7+UwjY9T7LKlTiK6c8kteezBUyHZKMhIDM1Evg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m5FltuZtEgdSIYXIaXZrrAuRD7Udj3wfZVxJsMdtdPihGWifiqKMQR/pZAyvjzUMfCJytLUotC0rjG5A95Vkd5zit3GUDupxEbDAS1d1rrg5td9qHpREiDfhE5RsclHtyM3IY2Rt2ctLZOKRjzf6zfWCOohHhgaVR43k8OoWEjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C3gPGtm+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C3gPGtm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708103495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MIijY/r8LLfMl6D20rFmwbeRhmzXm+JMQ2A7E38ejDY=;
	b=C3gPGtm+sb2FuixF0HaBMQzSDAHE+xXXnArPIEnRRH4+KtZGvRAcXZ06b0cZi2KeWCMC7x
	djQk8AhSnSM1RuHfG8oJHGaOwxviikfRWkxa4katVb3M/M35DvhDdHR2b9QOP/xTYsTO5C
	ovrMs0HyJIC0KQmEUKt+r3E+VtuzvnA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-sGcL5-nNNLSf1B8Qy0u7tw-1; Fri, 16 Feb 2024 12:11:33 -0500
X-MC-Unique: sGcL5-nNNLSf1B8Qy0u7tw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a29bb25df84so148951566b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 16 Feb 2024 09:11:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708103492; x=1708708292;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIijY/r8LLfMl6D20rFmwbeRhmzXm+JMQ2A7E38ejDY=;
        b=BaHK4zKCpMnHfTdP4joIVx1khsV9t9GlrpUyhHGXoBY4WjWyyVw+iwZhsON4eY0qVd
         yGV6WOThI1kgt61dU/kTSoC4tCJfJC2xCBwjZ9CDTvaQzBI12O2K8ba0piiXPsCuOTmE
         oay2e0f0FEuaDhqv0BvZ/JvjD/VlwOyeJBb8SRkvJ90AMrrfxsJIIL8tXq0XYgVcGvIX
         7ogexfKwVP12jNKJH1FqeEyJSQv/dWPzjTXRbDFQu/apnZorf2+1b72RyuIZ1huqHIe4
         mO7oQHi02kldwzkhXC0/Qk1XUgS7ifHP+UGoZWJuJMSMOkTMlMrn2T6SQ9usA6F+AA2Q
         R4kw==
X-Forwarded-Encrypted: i=1; AJvYcCX1Rxt3c624yhck/Ak3UG+d9J1SaM5gH9UOmey1S4n9RWuqHtAZ3523rQyxDjT2miYCZanXThEaSIJTs06rQNZz6cAl/VZs4zxLhxx0aGQ=
X-Gm-Message-State: AOJu0YzfDgskEgfEAVGw5zqyxuNonIF5AzCkGwEbZR7s7EfYhqb1uRjT
	NW6brCkpLuDsVzGYhvNt+DJZS93QIeH6a/vfmLG/8X/kh0RUc9TfcgG/1Tk+ew/wQY+wiZ0aQhJ
	KXsRtFjr+s/B/VMGK4PSVfhR+WuFxtsQjnnwlL9YPgv7jSMCKYhlALwO//yJXHl+l
X-Received: by 2002:a17:906:3bd8:b0:a3d:86c0:4689 with SMTP id v24-20020a1709063bd800b00a3d86c04689mr3695496ejf.32.1708103492546;
        Fri, 16 Feb 2024 09:11:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpvQYv23/X9db3iCL0o1v5CbF+U8MTR/LKixroenoT99EeMYj3m5SvBXid/pIob2FHWV+Y1A==
X-Received: by 2002:a17:906:3bd8:b0:a3d:86c0:4689 with SMTP id v24-20020a1709063bd800b00a3d86c04689mr3695480ejf.32.1708103492265;
        Fri, 16 Feb 2024 09:11:32 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b? ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id v22-20020a1709061dd600b00a3d8fb05c0csm141614ejh.86.2024.02.16.09.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 09:11:31 -0800 (PST)
Message-ID: <18a49662-3640-49c1-9587-db5cc9d62fbc@redhat.com>
Date: Fri, 16 Feb 2024 18:11:30 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: str: add {make,to}_{upper,lower}case() to
 CString
To: Alice Ryhl <aliceryhl@google.com>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, benno.lossin@proton.me,
 bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 linux-kernel@vger.kernel.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
References: <20240214172505.5044-1-dakr@redhat.com>
 <20240216165320.1820346-1-aliceryhl@google.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20240216165320.1820346-1-aliceryhl@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/16/24 17:53, Alice Ryhl wrote:
>> +    pub fn make_ascii_lowercase(&mut self) {
>> +        self.0.make_ascii_lowercase();
>> +    }
> 
> It's important to note here that this doesn't remove or introduce NUL
> bytes.
> 
> pub fn make_ascii_lowercase(&mut self) {
>      // INVARIANT: This doesn't introduce or remove NUL bytes in the c
>      // string.
>      self.0.make_ascii_lowercase();
> }
> 
> Ditto for make_ascii_uppercase. (But not the to_* methods.)
> 
>> +    /// Returns a copy of this [`CString`] where each character is mapped to its
>> +    /// ASCII lower case equivalent.
>> +    ///
>> +    /// ASCII letters 'A' to 'Z' are mapped to 'a' to 'z',
>> +    /// but non-ASCII letters are unchanged.
>> +    ///
>> +    /// To lowercase the value in-place, use [`make_ascii_lowercase`].
>> +    ///
>> +    /// [`make_ascii_lowercase`]: str::make_ascii_lowercase
>> +    pub fn to_ascii_lowercase(&self) -> Result<CString, AllocError> {
>> +        let mut s = (*self).to_cstring()?;
>> +
>> +        s.make_ascii_lowercase();
>> +
>> +        return Ok(s);
>> +    }
>> +
>> +    /// Returns a copy of this [`CString`] where each character is mapped to its
>> +    /// ASCII upper case equivalent.
>> +    ///
>> +    /// ASCII letters 'a' to 'z' are mapped to 'A' to 'Z',
>> +    /// but non-ASCII letters are unchanged.
>> +    ///
>> +    /// To uppercase the value in-place, use [`make_ascii_uppercase`].
>> +    ///
>> +    /// [`make_ascii_uppercase`]: str::make_ascii_uppercase
>> +    pub fn to_ascii_uppercase(&self) -> Result<CString, AllocError> {
>> +        let mut s = (*self).to_cstring()?;
>> +
>> +        s.make_ascii_uppercase();
>> +
>> +        return Ok(s);
>> +    }
> 
> Please move these to `CStr` as well.

That would result into two copies if I actually want a CString, wouldn't it?

Also, what would be the use case? And even if someone wants to have a CStr
again, couldn't we just deref the resulting CString?

- Danilo

> 
>> +impl DerefMut for CString {
>> +    fn deref_mut(&mut self) -> &mut Self::Target {
>> +        unsafe { CStr::from_bytes_with_nul_unchecked_mut(&mut *self.buf) }
>> +    }
>> +}
> 
> Needs a safety comment.
> 
> impl DerefMut for CString {
>      fn deref_mut(&mut self) -> &mut Self::Target {
>          // SAFETY: A `CString` is always NUL-terminated and contains no
> 	// other NUL bytes.
>          unsafe { CStr::from_bytes_with_nul_unchecked_mut(&mut *self.buf) }
>      }
> }
> 
> Alice
> 

