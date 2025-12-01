Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC2331328D
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 13:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764595598; cv=none; b=UPutrnZ1LDSr/M1K/Hm7TkkqR2C2OM4lqArvqnyLBQMg6+QKtxcO8kGEbL4rzXqIGOxZSikGHzc0tyx6OXmDtPwJmTGBmHN/aYivz6tpu5nFvvNxgUuiQ44iRqy0bmKNwNSb2h6aiw/YuIL7xwCV4JRCVlq95UdjdqHFUx+jjzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764595598; c=relaxed/simple;
	bh=3T6/0S4gPiSOBnlelsuWcgr3GW8g8ZN1ilk88BBgsW0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVLzY5gN+9QWGX1YVVqzoP/MMeXk8i7i493lW2hsLUvUsm5UhDQajzYq+r7+9t028iO3X+aVXgWsGuprOlH8kZEmP7ZGhvboxs0gcqIQyFHuRy6mtqQSAnssbV8aBEDXGI0AfcLrMCG1VRprCnBMmkao6C9lpMnD8eL9toMZI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vswj24ml; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vswj24ml"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-295548467c7so48762105ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764595596; x=1765200396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wA17GOnwiv2jpqWsGoFzoIHwNhefYdk6hSbFidk+tz4=;
        b=Vswj24mlqDUqCoYeokwitUL5W4w2teQv2KA2Gf4sIf9k5Uj0U73pWv5gtsI0DSQ5As
         ygAzSDt0b9R+RfkwAlCYYOPoEodHNjAayv2xucN9hP9e+e466Xomn64a4vHkPQaOvx7C
         N5fnnZTjkJhPM2+8E98T1Zdkf671UZMqhiPu9/2d30e+vfFF6JVEk9t4/nMq83MEAlNE
         IzbYwN2IbR4ChnntP51yd0TGRULwvk0P0pfgdRNNXQX+WSN14Okl8S/9046YGt4YCYlK
         9ehzMlLYw1HrwMz3uleUQwRkGwU8dgft4F74nmpvqDm7FTm3/q5sga7rb2vVYJoLpThk
         09yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764595596; x=1765200396;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wA17GOnwiv2jpqWsGoFzoIHwNhefYdk6hSbFidk+tz4=;
        b=UKtYsvPezTEuIgc+Sec1eCsoKtQPKImhZgtLTR20RJjglKiMAbYIYYHuYeWvjTcjJV
         q1mHoySF80WjVhf/5/7jSDyBvNsYxIY51YVZkkZS7NQfTridpCmvi6C9Yaa2vX/j7O57
         3QZKQP+vF8LUYUhMQpjrnJr2RxW9ul8YCJWVexIQJIiQ9U2ymb25spSg47U6pz0E3gSZ
         cmq5/k0YGSqVPOcQiATXkjjMGesgcmPmK1xnHBUegA+2bHabxlO6xrlwqGUJ5AxS8/ni
         9+GT6X8fnGHOnGtmj/Jq3YM5HSJ8Ao9R3rGg1LGzwnHotOdcWTU9tWM2rUigeNABIprx
         iE3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWtQ/eX+AxhLgIYP0TFFhkrH5R5BWQ/xYAX/SBQIO1ZifYdq7pq9jTWY5JNA3ZtT1QOjm/0K+hQkAIVcpXMA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs/NW5rfM9nS3aZJcUDYzFbelylZGdnKqe8SUaS90VbTemvkdx
	CLjizVm/QSv5wG1lz4uQCcOyRpF84YuL0iYVluWY8RleAzc+qUhVAWkG
X-Gm-Gg: ASbGncuunLihBaaTQt+Eyg6t/FXx4J4GgfHRJ0TtesTJApB+tGM/oJ0UEqNDaB+Kooj
	uKTIz9R+wourhiFfip+hahke0BbOe3Z0QMNubLjvY175NcX2ka78ed4/qroeFNJvSj+HRHxApGY
	xAn4HyGIWDU0HqFOLhxKHVF9P9Hgf+4+o4tImOXExFm58xDHWSECm4S1pun3p+KwzV1dPoEfjDH
	F0jgcrhfg9WjmdcJ5/3itntIpDyE966gcYTn5bxRg92MVrV59uV8MMQG4BU1oqgesarAF2qWN6W
	Q1TIHlxMEhrqlhUX2yIfYBj30fiuUVNDeipmLWwtU/cwSqe1kCVfbL7NxHheBIio1iGs4qT7pQA
	6D9mrA2PZxFglc3rEmVVjEhpoZ+Tm1OuN4wcjGVk9IYQGoX5i+bjaMLgYNHoZhhGRI6UzdXzj+o
	7oviixIh5UP+rBg0Lp1e31ZfHZ
X-Google-Smtp-Source: AGHT+IEEKiDrI7ns1+pletsxo1fyTBz9LyKzbgyJwnY8+B2uVkJjavaFHgIHgN6sqR/X84ryCTFCHg==
X-Received: by 2002:a17:903:320a:b0:295:9b73:b156 with SMTP id d9443c01a7336-29b6bf8072bmr322859055ad.51.1764595596265;
        Mon, 01 Dec 2025 05:26:36 -0800 (PST)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce477e94sm122535865ad.43.2025.12.01.05.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 05:26:35 -0800 (PST)
Message-ID: <692d978b.170a0220.b1da0.297a@mx.google.com>
X-Google-Original-Message-ID: <aS2XiPwBlQcOHLtX@yuwhisper-pc.>
Date: Mon, 1 Dec 2025 21:26:32 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: num: bounded: add safety comment for Bounded::__new
Mail-Followup-To: Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Miguel Ojeda <ojeda@kernel.org>, Yury Norov <yury.norov@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20251201062516.45495-1-yu.whisper.personal@gmail.com>
 <aS1qC_ol2XEpZ44b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <aS1qC_ol2XEpZ44b@google.com>

On Mon, Dec 01, 2025 at 10:12:27AM +0000, Alice Ryhl wrote:
>I disagree. For the same reasons as str::from_utf8_unchecked, this
>should also be unsafe. It creates a value that violates invariants,
>which may be used to trigger UB combined with other safe code.
>
>Alice

I understand. Once the caller passes a value that cannot be represented 
with N bits, the type invariant is violated. Keeping this function safe 
could allow callers to overlook this critical requirement.

Thank you for the feedback. I will submit v2 with the necessary changes 
and improved documentation.

Best regards,
Hsiu Che Yu
