Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E0A29401
	for <rust-for-linux@vger.kernel.org>; Sun,  2 Jun 2024 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717313781; cv=none; b=bw8ydsvoN82oGqq1qvgsn+xtEyqZcTk/HCUQQlVvDFGWfFuUexreOWiOP+O8Kqd/2UCF8bi4Pc00336Jyu0VH1TMz64scSA70Hdnx8wcR2S5UG5vAmYgy5XeNSo1Wo4kHFpPsR10jd3q1woysgnt+ILj6Jjo14RiDivIQzY3Az0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717313781; c=relaxed/simple;
	bh=VgT9Gm+qax6Y7etYDdUOKmuT+soeiz2PWDhUKiwur5Q=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=LlHH3WsV7g9mqWym2IPh8FTvv23opmIm/ZBmxP8vu6KWONl8vFpCbrj+x6w6KEa4y3H7ycL/GVLgHqOjKPpyatgy+3UT8dZCinJrQoH3FNmx5DXCqwc491RqqKnrWd2+nsQLZyuAWXWGETP/rQbB6MK3OzMTqvzZIETN1jt9sIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XslLFhJm; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XslLFhJm"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70264696399so10759b3a.3
        for <rust-for-linux@vger.kernel.org>; Sun, 02 Jun 2024 00:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717313780; x=1717918580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oivA9MpjXV/c0JIavaOEgd+O/g0Zy9f/RTEL8IZ+hPg=;
        b=XslLFhJmBEcScyPdj05X6ehpZin/NiOrXc2D+Vk/og+oexxTlqIVxVWxSgFTclYKjF
         29BuarCld0kHrS4Bd3ZYIukWV4BfqtsahlODzX3R1w2eOJNdjNSkVQs9FN1LRvCcdg6f
         8Ff50qc3aaTsYJO6TWk6SmLLgt/RazWEdwQiYCecM9Gqfa7Ec7/Qe3PlZslVyV5y12m+
         5fxMZ8+sGz8msLEJh2CKTDhqMPF8jfGJXyXlNttkylifZcGuYJY/6ewjD/E/mGyZR0X9
         TdwqJ05qwU6XZtGEfgLTWKcwPlgNdIstr2gRk6w5E6pM5N4x5Bq1bO3WB6ce5vY6pMUt
         y3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717313780; x=1717918580;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oivA9MpjXV/c0JIavaOEgd+O/g0Zy9f/RTEL8IZ+hPg=;
        b=Q9vfzyKdR27XwOuN3wmiHuxZQiXUmjrX8bhaQkSc0t3UTAUDBZudzxO0+LnYozKcA+
         yMZLHTgPLzEBA7VnMOS/YstFbxgA/z5N1JBErYzkrtfWSej6O+Bk4xv2IemGSi/buP7w
         rLmqFxs8qMQfVMEM9zvxwWoNH+x3/dpI7YpiE0qBubsNPzwZNCoy7muyyiOkQdN9SE8x
         LOvZqSeofEhyKbEIppWAB37NAIWHUKN9q256A+C6dgW7lQwMRfOrWVhc0eOeoPzpRiQo
         Sn1catJv7iVezyu3NLEm4woX3uJs8szcyEoV9RU48aZDfHSKZDRUI2JpBNfEJO7DiK8g
         t2Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWRT3qbTQ6vwjGIqmwMEwYFgvNt3TDgnTybtX8px9wvAh3AWlKtIF85Afm8xOpi8r5US+wNB35Q5H+/5HbbjLCXrUlZanAYc44tIaSi1so=
X-Gm-Message-State: AOJu0YzA2MhUhb9tQfQ39Vwd1chAvEt/sftzgNIQ7U6NWFT2/D1h8HxH
	+QX3ri5Fcg0TwNbuIJo+Or9R1tX5RWDWFIXJR8mJYwhV+vuGsOR7
X-Google-Smtp-Source: AGHT+IGBvqMaoDHWYdfCBHuSCaQdv+R/KSgoCrEVc+FBTz2dNpv835YnS3WDeKUt6yVQDb9J9Jxtcg==
X-Received: by 2002:a05:6a21:78a1:b0:1b0:111f:2b70 with SMTP id adf61e73a8af0-1b26f2b0776mr7512706637.3.1717313779547;
        Sun, 02 Jun 2024 00:36:19 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7025477bbb2sm2019361b3a.158.2024.06.02.00.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jun 2024 00:36:19 -0700 (PDT)
Date: Sun, 02 Jun 2024 16:36:05 +0900 (JST)
Message-Id: <20240602.163605.1664548427631907126.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 2/2] rust: net::phy support for C45 genphy
 helpers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <c67b9654-cc6c-41b0-9693-b8830ec42e78@proton.me>
References: <20240601043535.53545-1-fujita.tomonori@gmail.com>
	<20240601043535.53545-3-fujita.tomonori@gmail.com>
	<c67b9654-cc6c-41b0-9693-b8830ec42e78@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Sat, 01 Jun 2024 12:23:16 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

> On 01.06.24 06:35, FUJITA Tomonori wrote:
>> Add support for genphy_c45_* helper functions. Instead of adding
>> genphy_c45_ methods, this unifies the API for genphy functions with
>> trait.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
>> ---
>>  rust/kernel/net/phy.rs | 49 +++++++++++++++++++++++++++++++++---------
>>  1 file changed, 39 insertions(+), 10 deletions(-)
>> 
>> diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
>> index 286fd5a7ec91..aabd714ae3f6 100644
>> --- a/rust/kernel/net/phy.rs
>> +++ b/rust/kernel/net/phy.rs
>> @@ -248,16 +248,8 @@ pub fn genphy_suspend(&mut self) -> Result {
>>      }
>> 
>>      /// Checks the link status and updates current link state.
>> -    pub fn genphy_read_status(&mut self) -> Result<u16> {
>> -        let phydev = self.0.get();
>> -        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
>> -        // So it's just an FFI call.
>> -        let ret = unsafe { bindings::genphy_read_status(phydev) };
>> -        if ret < 0 {
>> -            Err(Error::from_errno(ret))
>> -        } else {
>> -            Ok(ret as u16)
>> -        }
>> +    pub fn genphy_read_status<G: reg::GenPhyOps>(&mut self) -> Result<u16> {
> 
> With this change, don't you also need a change in the ax88796b Rust
> driver?

No, the driver doesn't use genphy_read_status().


>> +        G::read_status(self)
>>      }
>> 
>>      /// Updates the link status.
>> @@ -446,6 +438,43 @@ fn write(&self, dev: &mut Device, val: u16) -> Result {
>>              })
>>          }
>>      }
>> +
>> +    /// PHY helper functions.
>> +    ///
>> +    /// This trait is used to implement some helper functions executed either
>> +    /// via C22 or C45 registers.
>> +    pub trait GenPhyOps {
> 
> Why does this need another trait? Can't it be part of the `Register`
> (currently named `Access`) trait?

Indeed, it can be. I'll do with the comment on `Register` updated.

Thanks a lot!
