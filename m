Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD112868B
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 08:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722501084; cv=none; b=NPYqwBW9u7HP1LGkZtCewl7ibYk0nZHTEmPUtCuTPTBRbG3IqUbpaMUOduael3CZNypqABTWwOFueTu2cC/YdcVtbdUH3Bl2VCOly+XEF76C7LTKnAY+/WLXBzWyb4XEKny18t4PpWV3RI+qXAAsgvIcY8kie6rWBIOKkcycrkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722501084; c=relaxed/simple;
	bh=j35qK7hgEdLDisIrenEFMd9EiCzNO2JfnVmaHQ9kMZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CACnSdP1B+DKcvfAY/xtPh3ujpNOad37xaFt3rPNse5GukGOSiV92c49cRbRevCZqvhx/HdpqIPIBoEJStWP1+huAyw1Xg5Rb9xmGV399ZJSUlt7tARp9N5cM9DmDltLv72ABqiBXFM4fG0dGbgA7bQzdMBJYgckQgyAqZY88A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=owbB2t/g; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="owbB2t/g"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fed72d23a7so49843985ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 01:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722501082; x=1723105882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T6DIqP6SgLThiqKeTL1B0jqC1r/AlJW+EfZyuiDXv98=;
        b=owbB2t/glVjqOjT80UWdn7BCkEPQhsD4j+QhoASp+8XZ4JQsPwTDBXgq1H1Tj8gHN0
         i1F1KQL/9qbEwuRT6kKbpLORO5YstPxaDszLSDvtEW93fL5idhq7dLwGHdf3AtOaL5G4
         NwAR5XeZe+7srAcbTKr+PKd5AIBT4FvZWx/jKnxu3JyVlSvM6zyDNQfS7uIjBcMX5NGN
         lZ2Oqkcq5+t+XEBI8Fz8sJRY5+AazQvBMZzrYj8nHUa6mfX+TCZ3ABANG8v2gbNgC1th
         lsXM5mqdJG6LmhvhVu1RernN7e0bseS9SC9Yyb1ftAkYX226V/ZQnXG8eKmRluOgCbfy
         zAuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722501082; x=1723105882;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6DIqP6SgLThiqKeTL1B0jqC1r/AlJW+EfZyuiDXv98=;
        b=tpO0zWdzKVm8si2OIvh9tqrIenTtrngEK5NLPewDm5R7qkQFA5oq9W3DmU/3a7B2LN
         Efs3EpHqFca3T0YkBJD9DqebtOvw2NzFpHgTpHUf7gRS/no3BT5KHIz5szyWaXNHiFRo
         hbYis8piywup5D8wDsbq368FgPj0kVta8+DV7L2FiWNsWkTdWmmb0Tb3qpol/GyeN6an
         W34Aec1+/tgCelkyvcgKnsksla5CTsoQcAk27eEiUCCS3GTzYU4obeK83quc4omHmloZ
         e+AZh60NR5hBInUUQTNGDfwvQJOy2oKcWItDGyfTg9Qe2nXCjKeBGuteOaOkKwMlFceI
         /aPA==
X-Forwarded-Encrypted: i=1; AJvYcCWoTEhLVJU+fHfsk3kw1uqioUp3gU5GvOEyqvn/QcmkTNUb3KMtB6jGzsNq0QTN1XVYGO9IW+yosJT/5gPqOl/IT/1xGiFv3MMihnUKvUY=
X-Gm-Message-State: AOJu0YxBOhCcbmsix4cuD2NzxQNm6uwkPOyN7mT/g8v6yalSBNPrOpBH
	HqeClcG9efs3HXetzXBeTtp/s/iBGz0mIRrSTaw06wGMiIAIFsKg9Y/LRl3/4PQ=
X-Google-Smtp-Source: AGHT+IEFbcz8UfvSIGynalkuH6rlmXwWqz3KVvNjKxzROzhzmV0ozLRqPOZ3mGMQ5a9sLQ4urpd9tw==
X-Received: by 2002:a17:902:da8f:b0:1fd:6b87:2147 with SMTP id d9443c01a7336-1ff4ce57f02mr20721685ad.6.1722501081886;
        Thu, 01 Aug 2024 01:31:21 -0700 (PDT)
Received: from localhost ([122.172.84.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee1482sm133790605ad.155.2024.08.01.01.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:31:21 -0700 (PDT)
Date: Thu, 1 Aug 2024 14:01:19 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Danilo Krummrich <dakr@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
	rust-for-linux@vger.kernel.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	Erik Schilling <erik.schilling@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Joakim Bech <joakim.bech@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 8/8] cpufreq: Add Rust based cpufreq-dt driver
Message-ID: <20240801083119.bwd6k6vimwyhv6cl@vireshk-i7>
References: <cover.1722334569.git.viresh.kumar@linaro.org>
 <e0df2db1caa49f15628aa18779b94899dcf37880.1722334569.git.viresh.kumar@linaro.org>
 <CAL_Jsq+SxdPyb3qQyce7u8Ur=WCd1p+pQxJ+yJrTyS2xk3BF0w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+SxdPyb3qQyce7u8Ur=WCd1p+pQxJ+yJrTyS2xk3BF0w@mail.gmail.com>

On 31-07-24, 15:14, Rob Herring wrote:
> We don't want anything in Rust based on of_find_property() which this
> is. That function assumes a device node and its properties are never
> freed which is no longer a valid assumption (since OF_DYNAMIC and then
> overlays). There's some work starting to address that, and my plan is
> using of_find_property() on dynamic nodes will start warning. The
> of_property_* API mostly avoids that issue (string types are an issue)

Okay. Migrated to of_property_present() now. Thanks.

> Also, it's probably the device property API we want to build Rust
> bindings on top of rather than DT and ACPI. OTOH, the device property
> API may be missing some features needed with OPP bindings.

I am not sure which device properties are you talking about. Are there
any OF related examples available there ?

-- 
viresh
