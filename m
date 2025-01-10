Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307101F6698;
	Fri, 10 Jan 2025 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496426; cv=none; b=FudqewOo81NlO+8tHnQUZFIt33pmb6mBW3WPZEgg3QvhsX7npV6IhBp0vsPjMLKDKuGzw8UXGK7zrc4DZmNBs4qvelfQI/mBY89Iv6EYrCkj4RpmUWiYorlHkrVQhcqtog+aJ/YE2oIlyccqf61QB9q9NOW9oX+/5soGib8rpxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496426; c=relaxed/simple;
	bh=S/07Lq4g6SQZA+O0TPG38HJaRNp1ftTFTV/q5XdL3AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S2yVtTKbVuKMuRjmDspPhWLqxTf4t7/qqzONpVnop9FHlGBW72wB4gzpzYokWs/5Rb1wjL34XveFLEfWCNYdSVLVNdjYYKB55r0BfRgmoXY6Xl0jpyyALi+eYBrCTjJYNGckNst/PP5q3cWGKBjde8e9PcJc17TERkvsePoBv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRPCLjsu; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRPCLjsu"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53e3a227b82so1556503e87.0;
        Fri, 10 Jan 2025 00:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736496423; x=1737101223; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iaIJAYfUAcAAsckScHCT7VmL8XK0S1e3k+LlB+CZhYo=;
        b=jRPCLjsumEajTc1Mi7ZVBu5jR1VEpOGPdgUaofwtdbbsoHwh2sb53egOaq6RQILxlE
         2HrAmU3x1peHqTdBST19WoV45B5Q49Vt9D+ROdLWyOzcDLeBQUhRjMHlpWGTMIkAbfO6
         L2UI6MSX+SP2vYZHPDdfLgYcQOfvZriAvI5zZ1ZszZcEqMbg4MZy+YxYxKkqA1On/b6W
         Vz4neNFS0/ZTQ1i5xaYTs8D+XgMpyeEjZLw9yVwF1mRIrwOy1Jd2cpu/5bR1Lcf0HkA6
         5Hf0CxXMFaZzJTsk89I1ZbQj7nnzmGpNfH8XQSsmFnNRT5nGXxJoLmYIK9nUv4M+2Tzz
         iE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496423; x=1737101223;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iaIJAYfUAcAAsckScHCT7VmL8XK0S1e3k+LlB+CZhYo=;
        b=WMaMH5CULjoIVmjcGdSdFulv3V2UsgKuqftKhymhcwJnUm2fCKxr1QoNst6qmuRhRj
         4JxFlRei70LHttL/xTdLODk+yH0kYP3nKQzY0A6zhs5HT8NwMcFAv1uX7SBy0W8IhkYc
         nd6rFdlnYO93FEnITDHP59X2y8ht5xnUY5e2rKm6A7AvuCIbdM0tya4HZMZff9QZeUQD
         FGUQX8gCX4D5nrxPFfXhkWNm4t5++DgLdmrQbZlivs8x6o77hI2lfDs0Jsj3R9fXuJkR
         4DaxUr0BBEwj6ylbWiQoJgIB4HDexwCvJrd37cGR3vDtxdDYuBtY2ESmwt1KX6Z3O+98
         u64w==
X-Forwarded-Encrypted: i=1; AJvYcCUEzMBXHzsyB+qNsbysdJ1F/iaLngRDU4/cmZCZ3/FfHZsIrhu+kjMr8/IyCIYUDNL5zGjq89JFBl02NAE=@vger.kernel.org, AJvYcCX1Wa07Djmyv4PLFC6mnjHgqwJEWF/us6WKuOOGT/gtVf9wzwyN2By3B1ebIhQUDy3IfgXGykM6hxTkVPqSBps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXMuYGckPEa37EgHAeQM+LVkFrKcXeyi0fdb/SY5OdNRg6olDl
	7oTQdcxVaphjzk9nrK7v20rHdKG+XmxJ0ytvq2vIgz/Gj7oUc3r/
X-Gm-Gg: ASbGncsF9cOHnQF0gPK2oXnonCrEFjt53dSoYqM1at4EjuBpBrvTlFU1Bm8oYN+Jh1V
	2ve6Gvric6S+ds7ISVTQbJMTj2+jGHmeHUno33in3HU26OiEuOAPCx+41q34W2odR11M9CuVVOw
	xXbVKApZ03pdtDvSERTKuyHYzrgTDvJ3GA2j53NcbzH+WXm9QmR0LfuRPdp5dCUPPeDX9Kv7B6W
	EmqfCuGQY2HEPfNbi8rS+bmQmj57g9IaVG+SXrzmebXjHMrP8uOvQg+tJSZF8IYGHtk2pViJW6p
	x5R+CXk+AVCKV54M4L5hvru64kU=
X-Google-Smtp-Source: AGHT+IEHAAuHb4Kr/mBw8+GAXqS+vcvNrL6NpogYByuTz2AGjklhx3461a1KQRiGvphtei5iThMVHw==
X-Received: by 2002:a05:6512:401b:b0:540:20eb:80c5 with SMTP id 2adb3069b0e04-542848166b8mr3084264e87.37.1736496423094;
        Fri, 10 Jan 2025 00:07:03 -0800 (PST)
Received: from [192.168.1.146] (87-94-132-183.rev.dnainternet.fi. [87.94.132.183])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be54869sm458053e87.108.2025.01.10.00.07.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:07:01 -0800 (PST)
Message-ID: <81e9f9aa-d6ff-4377-b278-21898d61b170@gmail.com>
Date: Fri, 10 Jan 2025 10:07:00 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] rust: add dma coherent allocator abstraction.
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Daniel Sedlak <daniel@sedlak.dev>, aliceryhl@google.com,
 robin.murphy@arm.com, rust-for-linux@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Valentin Obst <kernel@valentinobst.de>,
 open list <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
References: <20250108122825.136021-1-abdiel.janulgue@gmail.com>
 <20250108122825.136021-3-abdiel.janulgue@gmail.com>
 <588af6c5-02cf-437a-a909-c22744a6df1c@sedlak.dev>
 <EFC67281-5CE1-44BC-92A5-7B0E4A7FB6AD@collabora.com>
 <ba95a574-2dba-4299-9ec4-bb776a228d98@gmail.com>
 <CANiq72kiUgLacBf9i3Dt+OPLZEyksc3s==HRp5R3EB74VuZu9A@mail.gmail.com>
Content-Language: en-US
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
In-Reply-To: <CANiq72kiUgLacBf9i3Dt+OPLZEyksc3s==HRp5R3EB74VuZu9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09/01/2025 13:32, Miguel Ojeda wrote:
> 
> Note that in mainline, `ffi` (the crate) still redirects to
> `core::ffi`, since we split the change in 2 kernel cycles to make it
> easier to migrate. But in `rust-next`, `ffi` (the crate) already uses
> the new mapping.
> 
> The idea is that you can already use `ffi` (the crate) -- so please use that.
> 
> I hope that helps!
> 
> Cheers,
> Miguel

Thanks, sticking to ffi::c_ulong does indeed fix this.

Regards,
Abdiel

