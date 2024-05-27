Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B56383B1
	for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 23:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716851013; cv=none; b=L81Y7suShUkjgzW+0PMTRcfpJzIXphnASPS8DmWenK/UL0fsoNIzlOf0zl92xBqhXQqGqULeZaPKeXTH+bFL/RHyDZ3bsQIq6cVC3uVuTPjgjI092Cs6nBFUevdAVNUQkz+gdqh7fCR4p2u3sMJjK5MDvOUAhH8kly/8dYYLp6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716851013; c=relaxed/simple;
	bh=o+daZYSTtbrtQ2/5dFMiSfKX58RNWh2R4Dw/fO6wKyk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=ow33A7Sh7RtFNhJmfLEDOJCva+UXDgAoWmssjlUM894r3HRlqeRszh/Ocj5asOC4ZkmExNuyQS/ZplhcXeoYtZ2MT+bLE17H03khqiN3FpD/Rfz3JIU/VwMxppr8mLyJTcxkgHoW6CuqGeHc9Z4uMITwP4mv4+vmqOrYQv+7/3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGAVVAje; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGAVVAje"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2bf5baa6034so48457a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 27 May 2024 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716851011; x=1717455811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cydwAHn+UdqXMLt8pYMTiO94v2088pZyStDFXs2KF/4=;
        b=XGAVVAje8EP4X1ZXYSgB3D+eXe7uHbLX08BW0QgFLuH+tELED+IpR9o6yYmdNa7AVY
         /Jm64a563csJ1PvPJcsu+HE7FwqQ+yKkz1o9WONzjjQ7sQahHlTpgBP4vPXX1O6Ru8se
         Bfha+xm9jV+unj+e6NJKnMaxywWubLw/KaYgspCirVi6VPHE8BPvp0uB+v35Zkn2eFTx
         GadpdBZKzOpks4abJcxn9zswmS6gB1PJ+neEpVadOrGmV8DF7YCAJcdcNdDnAtxHvJEY
         +3wpsDmTD6QaYsTE1atfb4qEVsxpKz2z6BaPnR/YUPwGfWcirDpCEXl9AqIRTEMOqbq+
         tK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716851011; x=1717455811;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cydwAHn+UdqXMLt8pYMTiO94v2088pZyStDFXs2KF/4=;
        b=WmciwLiewxoZVxYFT+7CCUytTOaYwst4uhy0NvGaVyjFU+lhT40mdHe5EwGi9TL53H
         Jxb01gQ2RQ2N4NBfqxyVmIytR0BdATrO9FRyXJgqXrG/0sojP2n2WSY8EUGhq/rXn+BG
         mhccPuxXYZbR9OR3TTtUUjqhlFe5z1yaoETKYW3nfIFkH4qqCcOoqsz413f13HTHqViT
         lxW7hWAqufxtBvijbU9aDBcRBVWSVBOXPvWJQNEuqOIzAd7WKrcqKd3TYGzXrhehqNhR
         nMbpuA8DKyebKltHuRIWBrqzLXf48AYS/Mkzxmh/gP1tUz8ymMn63/AfdrLux3YP0k9h
         AT4A==
X-Forwarded-Encrypted: i=1; AJvYcCX0ZNxBsU+I+wRAvLP5lcul1qrroQAGfwk0JpDvXIBMCAzIG6iY5E37/4IQo95tB8rgOPbjyn3T7EjuwGfcQjMmWjqeWs+cyCq20vHwZ1E=
X-Gm-Message-State: AOJu0YxN90ITenShfb4wNiJo0HTe2M6QaFfSf2s5/CR+gtwN/XHr3mnl
	XkaHZ+rfrs43ft91T+bbLxdwgRg8YLJAuWdIeTOpJwuhWjUmNW+b
X-Google-Smtp-Source: AGHT+IGdkiKbXhARpnlwNNs7FYAENI9WLxCyLUhx+I/ujpOiXgVjgltxSR23b+kWZZbVEagIx/QeTQ==
X-Received: by 2002:a17:902:e801:b0:1f2:fbc8:643c with SMTP id d9443c01a7336-1f448f2e808mr118425205ad.3.1716851010803;
        Mon, 27 May 2024 16:03:30 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c75dfc5sm68638085ad.2.2024.05.27.16.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 16:03:30 -0700 (PDT)
Date: Tue, 28 May 2024 08:03:17 +0900 (JST)
Message-Id: <20240528.080317.686110578274075402.fujita.tomonori@gmail.com>
To: andrew@lunn.ch
Cc: fujita.tomonori@gmail.com, benno.lossin@proton.me, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
	<8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Mon, 27 May 2024 23:57:37 +0200
Andrew Lunn <andrew@lunn.ch> wrote:

>> +/// Accesses to C22 registers.
>> +#[derive(Clone, Copy)]
>> +pub enum RegC22 {
>> +    /// Basic mode control.
>> +    Bmcr = uapi::MII_BMCR as isize,
>> +    /// Basic mode status.
>> +    Bmsr = uapi::MII_BMSR as isize,
>> +    /// PHY identifier 1.
>> +    PhysId1 = uapi::MII_PHYSID1 as isize,
>> +    /// PHY identifier 2.
>> +    PhysId2 = uapi::MII_PHYSID2 as isize,
>> +    /// Auto-negotiation advertisement.
>> +    Advertise = uapi::MII_ADVERTISE as isize,
>> +    /// Auto-negotiation link partner base page ability.
>> +    Lpa = uapi::MII_LPA as isize,
>> +    /// Auto-negotiation expansion.
>> +    Expansion = uapi::MII_EXPANSION as isize,
>> +    /// 1000BASE-T control.
>> +    Ctrl1000 = uapi::MII_CTRL1000 as isize,
>> +    /// 1000BASE-T status.
>> +    Stat1000 = uapi::MII_STAT1000 as isize,
>> +    /// MMD access control.
>> +    MmdCtrl = uapi::MII_MMD_CTRL as isize,
>> +    /// MMD access data.
>> +    MmdData = uapi::MII_MMD_DATA as isize,
>> +    /// Extended status.
>> +    Estatus = uapi::MII_ESTATUS as isize,
>> +    /// Disconnect counter.
> 
>> +    Dcounter = uapi::MII_DCOUNTER as isize,
>> +    /// False carrier sense counter.
>> +    Fcscounter = uapi::MII_FCSCOUNTER as isize,
>> +    /// N-way auto-negotiation test.
>> +    Nwaytest = uapi::MII_NWAYTEST as isize,
>> +    /// Receive error counter.
>> +    Rerrcounter = uapi::MII_RERRCOUNTER as isize,
>> +    /// Silicon revision.
>> +    Srervision = uapi::MII_SREVISION as isize,
>> +    /// Reserved.
>> +    Resv1 = uapi::MII_RESV1 as isize,
>> +    /// Lpback, rx, bypass error.
>> +    Lbrerror = uapi::MII_LBRERROR as isize,
>> +    /// PHY address.
>> +    Phyaddr = uapi::MII_PHYADDR as isize,
>> +    /// Reserved.
>> +    Resv2 = uapi::MII_RESV2 as isize,
>> +    /// TPI status for 10Mbps.
>> +    TpiStatus = uapi::MII_TPISTATUS as isize,
>> +    /// Network interface configuration.
>> +    Nconfig = uapi::MII_NCONFIG as isize,
> 
> 802.3 C22 defines 16 through 31 as vendor specific. Most of the
> #defines appear to come from the S390 driver. We probably should not
> add them in the Rust API when there meaning is not clearly
> defined. However, a driver should be able to use them, e.g, by
> defining their own vendor specific name to a given value.

Ah, I was wondering about the difference between 802.C C22 and mii.h:
- the definition of 7, 8, b, and c are missing
- why vendoer specific addresses are defined

So what we should do are:

- define 0-15 according to 802.3.
- doesn't define 16-31 but allow a driver to use

Right?

