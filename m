Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71630142E85
	for <rust-for-linux@vger.kernel.org>; Thu, 30 May 2024 05:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717048396; cv=none; b=HTBX6vxw5FlTcnDYs0VBU0ejzPxWMpTwQ87uShugLqJz/ObbVwRJSQEwPBHcCF+XXPigkWeVEQAqti3sBzA2q7FPNOA2/92qagdqTugbPcE2j1J95YEFMYTnwGgNOTTfeDbTz+f0QJAhYcv+yy/ZHWO5zZkd9CeCghuCIHPw8A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717048396; c=relaxed/simple;
	bh=zFTLbJ1LCqJX7laj7qH95dK7PdqAwQjxYgyChTRaIrE=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=KAPf5jvqGmIeJuwts9cnWY0i2xno3RJD7gjXENOA5oJZNdMXHqd9URK6emjmxZP8TjMA5qT3Q4nX5v1uZgjALffJFCXiJJKsaKTu6lFmpWHNMTiXWNpomgeSwL8Ls4w/86cPDwjOpiyVdAVBr/tX48EmAbNkd2rd/DQJwXou4es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSnQwRuE; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSnQwRuE"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6f8ec7f1f49so12307b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 29 May 2024 22:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717048395; x=1717653195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQdYYttOduzhdbukjbK3Ooi9MJl+pbbCSNTAhHkmNXA=;
        b=fSnQwRuEP0Lh/l0bizRgUxbL2y7EdpI8bpS6QswPJswjBtQI6wqZoiK9+e9GyrIvu4
         9KE4WwAJDHCRTZ+z0DmGWGSRG4zPrcPyLYQ6xpI8NvGbrfEzLc0gGhbwoFAjFVH6mYbU
         BUpDvgtlRs6gTMoX4khz/eWkvSJ3ZUxeGMjrBvoZgfHUPAAvJZ6UeFEGG7vQG8oR7SDj
         nJfGjaQT7oONH8UbxySl7RqR0zYgb/rp2/EQNzu42O51Mo9KMQ9JpsjGlGY4obrZbi79
         1bIKTTC/EqcqiMXiswRSbDJhFU6mq9Q+rMjlLAF8q7P68sr5FtIy6p29w43ZNEowC5ph
         iqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717048395; x=1717653195;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TQdYYttOduzhdbukjbK3Ooi9MJl+pbbCSNTAhHkmNXA=;
        b=wl4d4q65rREeoT9OkNP8rPqZhCZCvECIfPN9JtHWb45Lv8jF8npEiXQmHJ2zGyyyvC
         H20kzFdufXnfZKdqcfS3mLS3zQqhXvfmhcH3QdaB2TZzSNIHvYmeGUg5e7oy3YJK+tO9
         3hKpcPzkmw7o3iqE6J5JpzkRXRPMfFVfbWFr21eviQM1+L9Avm/YCJDfyWrraEtu1aEN
         6MwCo1MmqBWxh41UuK2m6OJVzlNhh2nIvQCCC/UPZ8X4OnXZbFhfmZArZoiOL9Umbe14
         cUC9PzBrI95Fp0o8MVzauYAcXaXfj1MOR8C0ev71od6oa6vdLLm5Gj5AAtOhynP8FxR8
         1Q2g==
X-Forwarded-Encrypted: i=1; AJvYcCWm+I3bzrQO+clItP9JJ7bSjhwdzwPhgYmZE4LejBA5/2+j8ufk4SsiQ4uK/7tfKXLD6x1uT9mxkUaJm1PTOHWmrhcl3xoHF+zNcSe6EcQ=
X-Gm-Message-State: AOJu0YwJgRhSRxEVDkuYTjpCRk1Y4TXEuBXSpJ1DyccDFp1+pKiXNZB0
	RvhqsQLZVTQ4HMEYWhKoGo2zOyW1n/t75RUn8Fpq5cv0Ztno4wri
X-Google-Smtp-Source: AGHT+IFZyKGeyRkYjl7Y1XXe5SGYtSCsxKGOZb1IUzehJB7D9E1UqlV7qCF3OQDNlsq/cTdDXuMBmQ==
X-Received: by 2002:a05:6a00:61c4:b0:6ec:f5d2:f641 with SMTP id d2e1a72fcca58-702310e0887mr1288326b3a.1.1717048394601;
        Wed, 29 May 2024 22:53:14 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fc36d29asm8907891b3a.82.2024.05.29.22.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 22:53:14 -0700 (PDT)
Date: Thu, 30 May 2024 14:52:58 +0900 (JST)
Message-Id: <20240530.145258.456915814420167538.fujita.tomonori@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, benno.lossin@proton.me, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <287303e0-dcca-4ec8-adae-5b17901a60ca@lunn.ch>
References: <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
	<20240528.080317.686110578274075402.fujita.tomonori@gmail.com>
	<287303e0-dcca-4ec8-adae-5b17901a60ca@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 28 May 2024 02:18:05 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> Ah, I was wondering about the difference between 802.C C22 and mii.h:
>> - the definition of 7, 8, b, and c are missing
> 
> They have not been used yet. There has been talk of using the two
> next-page registers, but no patches so far. The PSE registers might be
> interesting soon, since PoE is being added.

Understood.

>> - why vendoer specific addresses are defined
>> 
>> So what we should do are:
>> 
>> - define 0-15 according to 802.3.
>> - doesn't define 16-31 but allow a driver to use
>> 
>> Right?
> 
> Yes.

Thanks for the confirmation.

With updating this patch, I've started to think that it would be more
consistent for the driver to use phy_read_mmd/phy_write_mmd rather
than mdiobus_c45_read and mdiobus_c45_write (RegC45 than RegC45Direct
in this patch). This is because the driver uses
genphy_c45_read_status() helper for the read_status callback, which
also lets phylib to choose an appropriate bus protocol.

Additionally, I thought that we don't need to add RegC45Direct until a
driver that requires it emerges.

What do you think?
