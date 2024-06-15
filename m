Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E51863F
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Jun 2024 07:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718437214; cv=none; b=Va9Agf8O+Y04TZ/UmyGLB4o9hxXlFQCY4yQ79Tb11/M05bhV0uMR9ZG3YXvdsGomrf139h5JYXNN8kc18/w4sYTskKRriPrCcA39q4lHniVig20//Hm9byVKKrnajuwfqV6xMXwCcOnf4RoW3YQOev3Y/4OWU85+TdKu3BzvhPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718437214; c=relaxed/simple;
	bh=qvgUJim3pRbhZeN0DPn0yqiMSkUz2P+HGCRhbGmloLM=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EV/6wXgLQ9/TZ80e59l5rhjOBmi6lnb5kFtzVOf2NQEfvEi2AIteQklNdiRR7Ibs9TrSANMkVHHjyFOJeTJ2sbb4FjQ+k+nQX/LQM0YKWBnLZu2O/I53GEU8C5AbbD+K6O192zXAfv+WNfjATNBzTJgDPTt8eAmkmSTLThi4NRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/KUzEMb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/KUzEMb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2c2cb6750fcso509603a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Jun 2024 00:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718437212; x=1719042012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ei/AMOKfCP+ddOOQgIczZeWWVHwnTEZ8E2Hz5OxR/g0=;
        b=J/KUzEMbZeKYFk+/t5rvSjL+VtN2tJ+wUU4xKNKEp5OvZxiHdxwouKI4Jrd5qm2jYx
         G8LqtEyZ++6mwiteJe6FDB+HNfi6kOAWodKDN4mJIOUW3uXU4+eCiBRJO3XrMzZNNwJC
         44Jbc3efX63AvBSkSOF8+c7nXnIn0pyuOlozSUv9VzQCpeTDWhjQ8X8PGl2Oo9z9FzhA
         5g67kNk9mPk4XKYiq41yopIRnJ5P5QDto1+f+kZLYtIsfB5lJCi8+XrMvpRTzblcu3CT
         UzEpNmF/zAJCIv+hBsmiehI5YcdzcjZV5QpPPA9uIp60toebFV3CA/j5NCA8HZwI3Upx
         Nrng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718437212; x=1719042012;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ei/AMOKfCP+ddOOQgIczZeWWVHwnTEZ8E2Hz5OxR/g0=;
        b=RvKO2l+HJ05lq/OaS/v6AZEmOQugKYg0MX+vbKikPSwk5lODvpjNKLZe3EgMzfE0Q0
         OLEkBiCvrbltFhke+9+5A4deSS98GVlFRa9pAzdYVzatgBU1kaGG98kkPFUwFDABG3Cm
         TCufQ+8CIQWFvOrc5KxLEKHSqcAwTaYHwYs9edjcawleJkoSux/EnsJdPB3vpD2DDYbj
         6s9vvXOuwFE3fDb1aoMym3z/9y6TdSwbSBoX14n36o0xcxxdjNuJ2qah9bttDJVfqyCL
         8kq4vFFyT+Ix6Y5ykthp7+DqprjAXu/IswPMpjlGUbc2L/p1IWWtUojA19fYIW21U5YL
         CW7A==
X-Forwarded-Encrypted: i=1; AJvYcCW6pSy+4p/tZokb9V7D2Xcrkz9IxV2DuP1aIlqe4G/5/MhhXp6KXV+28M36AR48tH+paa7MeA5ecPdU3ZLDcIQozA7okqQBW76w2XOp7fE=
X-Gm-Message-State: AOJu0YzkncNGTwJhvfnYznyWsMzDHo9F2clAI3ZGiIjtW2sr9L9cINF/
	G4ZLCe6SCRQ7uLE1P/70SB4pAlCVh1oJnkGHNdIqP+wA+JmS5s/hZYXrJVW2
X-Google-Smtp-Source: AGHT+IFlmfFHcnsw4v39MwjtKf7H4dy9UaDVANvaW56UjT4U4uHqtQw0zNfIhrgA1YcRJqeF6A5v+w==
X-Received: by 2002:a05:6a20:da9d:b0:1b5:ae2c:c730 with SMTP id adf61e73a8af0-1bae8001712mr5517521637.3.1718437212472;
        Sat, 15 Jun 2024 00:40:12 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb3bf00sm4167954b3a.135.2024.06.15.00.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 00:40:12 -0700 (PDT)
Date: Sat, 15 Jun 2024 16:39:59 +0900 (JST)
Message-Id: <20240615.163959.2103666830072203184.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v4 0/2] net::phy add unified API for C22 and C45
 registers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <7faa2f7c-32a6-4eb0-86e0-29f962fa47c7@proton.me>
References: <20240607052113.69026-1-fujita.tomonori@gmail.com>
	<7faa2f7c-32a6-4eb0-86e0-29f962fa47c7@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 14 Jun 2024 12:53:33 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

>> FUJITA Tomonori (2):
>>   rust: net::phy unified read/write API for C22 and C45 registers
>>   rust: net::phy unified genphy_read_status function for C22 and C45
>>     registers
>> 
>>  MAINTAINERS                      |   1 +
>>  drivers/net/phy/ax88796b_rust.rs |   7 +-
>>  rust/kernel/net/phy.rs           |  44 ++-----
>>  rust/kernel/net/phy/reg.rs       | 219 +++++++++++++++++++++++++++++++
>>  rust/uapi/uapi_helper.h          |   1 +
>>  5 files changed, 234 insertions(+), 38 deletions(-)
>>  create mode 100644 rust/kernel/net/phy/reg.rs
>> 
>> 
>> base-commit: c790275b5edf5d8280ae520bda7c1f37da460c00
>> --
>> 2.34.1
>> 
> 
> Both patches:
> 
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Thanks, much appreciated.

Thanks to your suggestions, the API has become much better than my
initial version.

