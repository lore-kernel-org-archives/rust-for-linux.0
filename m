Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DD518B47E
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731948713; cv=none; b=hTOgtJsFvu+cFUoQsuZH2u8YQ3O5BrDPX/Xp4ZZoor+uFXWjCE8CoMope2wRt0oSTW++u+ux9r0o2iMlgn30zyS5bwr2FZHbjfz0PfL5+UvqRUUlPjQDIDWCB+XMToy273MfKN3dSGv6ILMPqHJFm2Fy5kzvklL6gU/5WlJo8rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731948713; c=relaxed/simple;
	bh=WDu2Oikl/jGzfO+avQIVSWVRgrEBYjNnYbhhmbfvVXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DlhysHz4XZzBPZ0IVuatOEQghJ0InQe9TxFEG68rsulu2hx538R4eJPS1wJbeZQdRmVCF47GlXzR9tcGNuI/LCHYZSoEgEBpRHzgA4bYBsN3J+YSmiGu0qkWU+Gs8oxU0tymPXQTBti4acJYC2EOFpMDs7bA7k2+/YxiKlb0FP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in; spf=pass smtp.mailfrom=iiitd.ac.in; dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b=EU57mqSF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.b="EU57mqSF"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so18306b3a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Nov 2024 08:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1731948711; x=1732553511; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sMdXwLgVF7Z3n3YGDkjgiYYFwcIaUbZAvIKsYx7KubM=;
        b=EU57mqSFCncLGjdx/BpNLWa7Zn4njWc8iFABe2R/qJeRmKuvNQXTUXAt18AxRBR4UT
         QlAwlAVUDDe972eOGpXUEw78+EGGFpXQxGWM4VBrFYpWP/fBIbdlgdAmx3RjSoXhg3R0
         RIXIUjsQAppmvZT+dFXoq5TLEyfAp7ZaT5o1Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731948711; x=1732553511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sMdXwLgVF7Z3n3YGDkjgiYYFwcIaUbZAvIKsYx7KubM=;
        b=m+XxuRxhbjbIX6cXQkhTWsWuzzmrKmiqfgZTDuaC9cxsoox2yn4ZqFNHIqsYUPjE9Z
         caDTpR4e5gQACAQGoeXvRqZzeUplN4OzVANhOcFmpBXKVVYFV8jYmCBD7TuB+dR9nau7
         /yPHgPCAjGjKXJwesDaiWGGQQtyUmQBz9DJvKmaD0Lw3nbwYjee/2VVK4bcevggEJepa
         xPKLh+jDghz6EEO9bGSA8Q5q7IaPyowi0Jl8GvsyotOhOeuqNGOy7dgnana3MS+GDP2B
         9/1RN//AneUNTsuDMujr0VIFz0/cEHKrcmUwUjwR46bGImia8EEokszPBC31aBe4EG/w
         V2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWNotxaJAgjaXwcandPSdvq6IX8OuWuQyTh++xw6cW2iilQ9YYrjzXznTGNmkSF/i64j6ZQ0KqPfPna6Cg4OQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3g4qecjIIQtxHm1jk3VO2pVM4IVf5fyz0AvCA34ulRfk+kSFs
	Y4MoLfzFgwq7ih5h61/CVINzKKp0PwF897DAvRi7IFKdrevZc+fyhv6KaAiX9Jw=
X-Google-Smtp-Source: AGHT+IFbZeO0TLbTg5btgg7zj4JUOeReCx8mqTM5Hq9wbFjWmOUBqAKamCJ+ej5gh5GsIGXWoJfdnw==
X-Received: by 2002:a05:6a00:3c95:b0:71e:b1dc:f229 with SMTP id d2e1a72fcca58-72476d171aemr18109816b3a.19.1731948711313;
        Mon, 18 Nov 2024 08:51:51 -0800 (PST)
Received: from fedora ([103.3.204.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724770eefe7sm6353059b3a.31.2024.11.18.08.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 08:51:50 -0800 (PST)
Date: Mon, 18 Nov 2024 22:21:38 +0530
From: Manas <manas18244@iiitd.ac.in>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Alice Ryhl <aliceryhl@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Anup Sharma <anupnewsmail@gmail.com>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH v2 1/3] rust: block: simplify Result<()> in
 validate_block_size return
Message-ID: <6x6kvvfmjaeihfnfy3j42sijo42rhdblzby25y6cziiddmnk3g@q2tkqkem2dk4>
References: <20241118-simplify-result-v2-0-9d280ada516d@iiitd.ac.in>
 <20241118-simplify-result-v2-1-9d280ada516d@iiitd.ac.in>
 <CANiq72=o56xxJLEo7VL=-wUfKa7jZ75Tg3rRHv+CHg9jaxqRQA@mail.gmail.com>
 <oc2pslg33lfkwpjeho2trjltrg6nw2plxizvb7dq3gvlzkme6t@eauzzfnizzqu>
 <CANiq72mcGs61PPDi2FHiqDtdNc7R8-G7R4R35zK=CVCRTQdWwQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72mcGs61PPDi2FHiqDtdNc7R8-G7R4R35zK=CVCRTQdWwQ@mail.gmail.com>

On 18.11.2024 17:29, Miguel Ojeda wrote:
>On Mon, Nov 18, 2024 at 3:22 PM Manas <manas18244@iiitd.ac.in> wrote:
>>
>> Actually, "Manas" is my __official__ name.
>
>I didn't say otherwise (nor I meant to offend, I apologize if that is the case).
>
I didn't take an offense at all. :) No worries.

>I worded my comment that way because a "known identity" does not need
>to be an official/legal/birth name, e.g. some contributors prefer to
>use a nickname, and that is perfectly fine too.
>
I am in private talks with Andrew about this. I will CC you.


-- 
Manas
