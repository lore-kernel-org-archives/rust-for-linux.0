Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67712481DD
	for <rust-for-linux@vger.kernel.org>; Sat, 30 May 2026 17:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780160993; cv=none; b=X8B+IoO7EZh2vWgZQj2dYigz7d2tmgydf6rsEpc71t73vTWMzRfW5UZ0W/pINZd+t93TrvfVFxY0UBRTvuSoje5deHoXyJRzPvy6vTqeBSebNdikx6B/uDGRgiGyYA6s3SGWAiOcCH5pzqq3IhNyEn+9tDftshpmN4q+X96VZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780160993; c=relaxed/simple;
	bh=qBD/mHSUmJqrxaVMpvUD3p/T9xzAY2i3acJwOa37W+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psRFyWstnCet2QLER9sJRfWkUhOtoBb1u3Scs/zZekYWHTFG4HmCHpgQ0GETihhGiG8K7yfVJlLNoZV3Q5BJPgvea8MHGc/VtfLLSvxNSf2pKHEN7bP5cPp4ZBVfFn/NkZz04EjI+b3nAJbqCE7g5fNmJujw3sZT+SAQE0rfwsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Q3P3a8hP; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Q3P3a8hP"
Message-ID: <ced4d92f-b2c6-451e-a04f-8ca8a82eab58@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780160988;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8DUiI5/CtwoV/hg6C3p/NoAPXtWGSXu91T5qSVkjkBM=;
	b=Q3P3a8hPTPUdKr8AHQ/PKVsyWprGwROwZeswpBo0EVuueTIH/LuqgfXVOoK11uit1mdeWM
	qjCvDr4EzVlrxIpb0vO41GNAvxlsMK0QOGJ/+gpR3/vaWdyaycIV98LbDqdYPTr4eTOHt3
	Vc6UGOOrNE312kyxjhZHpfKfrKD07d8=
Date: Sat, 30 May 2026 18:09:47 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] i2c: rust: fix I2cAdapter refcounts double increment
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Boqun Feng <boqun@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>,
 Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20260526194734.14378-1-nico.antinori.7@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Igor Korotin <igor.korotin@linux.dev>
In-Reply-To: <20260526194734.14378-1-nico.antinori.7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hello Nicolás

On 5/26/2026 8:47 PM, Nicolás Antinori wrote:
>           // SAFETY: `adapter` is non-null and points to a live `i2c_adapter`.
>           // `I2cAdapter` is #[repr(transparent)], so this cast is valid.
> -        Ok(unsafe { (&*adapter.as_ptr().cast::<I2cAdapter<device::Normal>>()).into() })
> +        Ok(unsafe {
> +            ARef::from_raw(NonNull::new_unchecked(
> +                adapter.as_ptr().cast::<I2cAdapter<device::Normal>>(),
> +            ))
> +        })
>       }
>   }

The `adapter` here is already a NonNull pointer. No need to call 
.as_ptr() and then rewrap
with new_unchecked.

Cheers
Igor
