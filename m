Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A1B20F06E;
	Thu, 23 Jan 2025 13:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737639477; cv=none; b=nhX4q6Cwdav2eXZZBBUjV9ENaf4nnLZV0f4CkZWzEE2v861lHI6KTNHx/dE0fxt5OZHKEjMZ6TbIYox0qTUfj0Vfyutszl0Kz/uKBcTJUQgVToIQav6sTM9Untms4z2SW3H9JeOLguobSmrimeouwgdIC5I7yKxrxZZn4ONFO28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737639477; c=relaxed/simple;
	bh=dWwkvG0NgJkuDKDCVMlgsAAcUGE/cRUVyUcEKt93XTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QPXm4wJWfHBkrR4Kdpn82IiHwL7DcCqMDWb6uB+UDaOvFpTugqTtskzX3EDgssLit/MRZaJkuS8sDVPwXYOh3/o+YB52/mFQcAkQYFho4KtfVGlpI4oEoF0Tm7Gr692baQOTaWjXMPXQTPdiydFL9eigZpu5Gkxfr+Lo/3gtxBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOCFDoKw; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOCFDoKw"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5401bd6ccadso1004031e87.2;
        Thu, 23 Jan 2025 05:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737639474; x=1738244274; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/MMgpKl63Du7VL4wEl7ZQDO+gVwz7TEMPUfjQb0S+9E=;
        b=XOCFDoKwMm5kwPM5zVCYbSPrVAAJMZQ0PLIIZmXMOdBZo3zD25MOcvidVFrxcHPoDq
         DidwyhCuNGrQakkn2AGjVzr+0HStd0sCAzZssKAjzRkFbpZvIzUOsfFy/KcHI/HNWxlz
         OcVHSwl0Ka04Tb0zR6r2p5EzS9+/JrYeoINq+wYvpviTQdGWnnHknpzDu7p7IK5guTKe
         jOjhi3SmAQAQI1o64Mey77g4DAeJu6l8pZcF2GmV8I4cGyty2Db4NWekDU/n08qaOuoT
         utsTCzlBeCLn3MsMPJRJp/4njwqTsmA6Sbj9KiGFCVOyUBizr2UxUxG3Hh9XpLH6SkMm
         XR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737639474; x=1738244274;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/MMgpKl63Du7VL4wEl7ZQDO+gVwz7TEMPUfjQb0S+9E=;
        b=b8mr9TTnaIPqPo/7RVx5TZjNH9tVGJitSi0vmIKCbnHmgYyG2LWvgXTVaTcJ/eh5kJ
         wKUlrgspEk6/0ZyqZKjUbbB6Vk7TQOVwrhRKRknuhIh/kNobi0ow0IkPDgUXKjMeJS8Q
         /l8wCkn+eGJce5/IECKcW0C2tC3p2Ed6oR89HP4JyNHlXsrhHyNdBxqKwyGWQFDS77hN
         pi6oULWstIBzkF+vhXAkHfsNG9Z1ypG2mq0g0d+9VzYB5JBxsrV4oL94QnveM94jdBzG
         Phy0UhWRqd+bf8f89o2tsxIQ3IUz1gWb+Q1e8YI4hCHO8CEFM3mwwcAYaSUELMvjnK+g
         dPpw==
X-Forwarded-Encrypted: i=1; AJvYcCXoQFLe2YTzeICAqInlINeyRrHu+SrBtGLtKAzumfkmebVSMR9OHV7Spjb08WvIM/kpNzG5UlPWeOqxB9U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy+4HLXNgcEB+6x2Wrlp3o/WPXftFxOx2ALdYPXgH7lYOXKWcJ
	4zeV3ISyRHEFtCj4qlYM5b1xhDUSjTk/jSo5GZns5b0czdXPUWoD
X-Gm-Gg: ASbGncsYhsYz4wxZrrJ1sdNMWIbGTr7vz9SP5p3sLeTOyViVVs0MunqfJK3fgkORxYx
	m6fWsWoXu2Aueba6J//fE1rF1K3QMoiud7FGijTIsom9qRJjwTfReAnFXwNRKPc691vsHOxhXYz
	fnLcopgKPO9JVzZgZ53uZP+Qwy3m+1mflHbE04N8+7Sty2vN2FXCOtMsUk7j1zobtV2Rk2UQX2Y
	TAhFeaPgpAaUER0/pGgzQXWBjy2vEGsk3sk6LHy6jqu5MKtMHSI2Z1+bYcFkcLHZNuUhaIshHhY
	/h4h9d1ZD2Kfie58nyS8gvEf6uTo0qIjtJqkyirBhRaMGxQ4xNwtZsQVRxRdYA==
X-Google-Smtp-Source: AGHT+IGpH+jo8gywfkjdem5Cs1IfguO8yO2Jw4lhNXYRnXDJ1vlhdmkHqTpFhzY0l3OErzRsN1T9Bg==
X-Received: by 2002:ac2:511e:0:b0:542:98bb:5678 with SMTP id 2adb3069b0e04-5439c248293mr6346876e87.25.1737639473446;
        Thu, 23 Jan 2025 05:37:53 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af60942sm2680774e87.134.2025.01.23.05.37.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 05:37:51 -0800 (PST)
Message-ID: <ddc185e6-3fee-40ea-ab55-b0f414e0f015@gmail.com>
Date: Thu, 23 Jan 2025 15:37:50 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] rust: add dma coherent allocator abstraction.
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
 dakr@kernel.org, robin.murphy@arm.com, daniel@sedlak.dev,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
References: <20250121084756.1051758-1-abdiel.janulgue@gmail.com>
 <20250121084756.1051758-3-abdiel.janulgue@gmail.com>
 <Z4_7-jbmeQ62hMb0@tardis.local>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <Z4_7-jbmeQ62hMb0@tardis.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/01/2025 21:56, Boqun Feng wrote:
> On Tue, Jan 21, 2025 at 10:47:46AM +0200, Abdiel Janulgue wrote:
> [...]
>> +
>> +    /// Reads data from the region starting from `offset` as a slice.
>> +    /// `offset` and `count` are in units of `T`, not the number of bytes.
>> +    ///
>> +    /// Due to the safety requirements of slice, the data returned should be regarded by the
>> +    /// caller as a snapshot of the region when this function is called, as the region could
>> +    /// be modified by the device at anytime. For ringbuffer type of r/w access or use-cases
>> +    /// where the pointer to the live data is needed, `start_ptr()` or `start_ptr_mut()`
>> +    /// could be used instead.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must ensure that no hardware operations that involve the buffer are currently
>> +    /// taking place while the returned slice is live.
>> +    pub unsafe fn read(&self, offset: usize, count: usize) -> Result<&[T]> {
> 
> I don't think `read()` is a proper name here since this function only
> provides a slice for the caller to read. How about `as_slice()`? Or you
> can change the function signature to:
> 
> 	read(&self, offset, usize, count: usize, dst: &mut [T]) -> Result
> 

Thanks for the feedback! I've now changed this in v10 onwards.

/Abdiel


> Regards,
> Boqun
> 
>> +        if offset + count >= self.count {
>> +            return Err(EINVAL);
>> +        }
>> +        // SAFETY: The pointer is valid due to type invariant on `CoherentAllocation`,
>> +        // we've just checked that the range and index is within bounds. The immutability of the
>> +        // of data is also guaranteed by the safety requirements of the function.
>> +        Ok(unsafe { core::slice::from_raw_parts(self.cpu_addr.wrapping_add(offset), count) })
>> +    }
>> +
> [...]

