Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C21A15B106
	for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163945; cv=none; b=sd4o7I+DtPPkWir1BHuDCWvmWznKQVQCBbkymas+L/tw0wiZdBW5TS1WiEZr1RcjfHIK3R8YvMg0CbmlnW7oVfQDQkGGQO5vL3Wow/U9OIVIT0gYlrxa6JMBUWjDRPexiQbWxYNKMpJngf8uty9DTMIfi1DXsyzNq01hSqp9e1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163945; c=relaxed/simple;
	bh=stHt2TlkHAqh6v4J0X2XomoOzP0sY7/ATfe8L5Ai1n8=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NwkrU5V6q9RUN/V6QU/zJ6jSCz9gm4vmPA36pflXezA2juGl77ecMGpjmEnYperKx3Q5r29SgSVjL+E0eOuprKm0BQ4tNoLaKeKn+26umDuNCQsywHAVqjTE7sZZTkVf5aWA7lmp3I+lg+GjuzbDtAiSYplofd5n2A/HVdAvzoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hm5UNEdP; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hm5UNEdP"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7022f44b53bso76656b3a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 31 May 2024 06:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163944; x=1717768744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuMA6lX4upWzeQalJ9m7pUdralNxn+ciFWaj8VjuuuI=;
        b=hm5UNEdP89GFyTLoyn9xW87aUFq92aUXLuy+TQMsYvJ6xU4A4nbzdgwhsuaGqLam4e
         PAKssbC2HkPMx2Agcm+7jSSduD3O+uZf64BbZh648pwo9OwC2kQHx3xTjgU0I/BNFJaD
         iihGP4F73Vnvse3BhJggooeV62A3ph4ZNDlpQlwO1UKHnvdG/iOEIYytBNpTemWtCBX+
         DcMVjE/qVKXGdcjhZCW7e+xvZDSI1DDNIOUqvWmBW5O6f+erLqoyKl7ZyHQ54dmGMOCF
         +lORsXACEaLfGHpFskpO6Y4B7EQXvkJ7SwxXTGeA8KTzBdppuJHE5lmtDZA6SIPxnynb
         CRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163944; x=1717768744;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZuMA6lX4upWzeQalJ9m7pUdralNxn+ciFWaj8VjuuuI=;
        b=rnP7TRujEX8/4Ripy9eWvYeMTXt7jEy87l67QOpvTGLKTeH1qKA0xKaWN42q4eBlAH
         iDfHpWAsNE+aVmGNNOTTa5MsnpzVz1816LgZA/LnNIOohlUKvkUKyYZAvYiHvOcJGiEi
         XGGhvF51/51twHypiv2vk8zO2AN85mr18uQoqaakeb9sxWNTUzi7g1u8Zs3E4FAOm2k6
         ajJQRDC+dE6jD9KwCICfaADFH+C/Qm+MSX4I3+Nw8s/ixnnovvhpD9zJUb7SJ/eEMw8t
         xNO8DvyNy5KiIEPdhdmqrpSWYLwSeM78n2nnfCrRVWmIZXN09JY8Aj189Yl9sgBPll0H
         64XQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXKaRmSgAWju4DAkZM/X/ajCVO52rUozidfw6CjFO0pjQ7hxfxnBLbwgM9j2uxP5mgrcYMrSc4kd7mHCG/rLmdCJJHB482Tb3590vHOT4=
X-Gm-Message-State: AOJu0YzqApMgohRAffDGT4npyQbWl11Famdy0emtyYQ0K6VlabnQCsvk
	ZhUKHrFJFRQJzdH1Ldw/MC494FsfA99XSsa1QHe/AyJeDCCWq6dZnZtwOm68
X-Google-Smtp-Source: AGHT+IFpUijM20QnEM9V72w1cxRNH3CM7MYAy0WurOJTDI5FMdHfTHndRw5UZt9EsgvkxXUFNwXmlQ==
X-Received: by 2002:a05:6a21:7887:b0:1af:cf0c:95aa with SMTP id adf61e73a8af0-1b26f1178bamr2495523637.2.1717163943479;
        Fri, 31 May 2024 06:59:03 -0700 (PDT)
Received: from localhost (p5261226-ipxg23801hodogaya.kanagawa.ocn.ne.jp. [180.15.241.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1c27cb414sm1513014a91.16.2024.05.31.06.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:59:02 -0700 (PDT)
Date: Fri, 31 May 2024 22:58:57 +0900 (JST)
Message-Id: <20240531.225857.1252492134294581333.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: andrew@lunn.ch, fujita.tomonori@gmail.com, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH v1] rust: net::phy support to C45 registers access
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <4a6aba6c-3e52-4ace-be88-58f9c1b44693@proton.me>
References: <20240527.104650.353359058235482782.fujita.tomonori@gmail.com>
	<8c47a50d-fbba-4884-b409-925aecf4686a@lunn.ch>
	<4a6aba6c-3e52-4ace-be88-58f9c1b44693@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

On Thu, 30 May 2024 08:05:50 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

> On 27.05.24 23:57, Andrew Lunn wrote:
>>> +/// Accesses to C22 registers.
>>> +#[derive(Clone, Copy)]
>>> +pub enum RegC22 {
>>> +    /// Basic mode control.
>>> +    Bmcr = uapi::MII_BMCR as isize,
>>> +    /// Basic mode status.
>>> +    Bmsr = uapi::MII_BMSR as isize,
>>> +    /// PHY identifier 1.
>>> +    PhysId1 = uapi::MII_PHYSID1 as isize,
>>> +    /// PHY identifier 2.
>>> +    PhysId2 = uapi::MII_PHYSID2 as isize,
>>> +    /// Auto-negotiation advertisement.
>>> +    Advertise = uapi::MII_ADVERTISE as isize,
>>> +    /// Auto-negotiation link partner base page ability.
>>> +    Lpa = uapi::MII_LPA as isize,
>>> +    /// Auto-negotiation expansion.
>>> +    Expansion = uapi::MII_EXPANSION as isize,
>>> +    /// 1000BASE-T control.
>>> +    Ctrl1000 = uapi::MII_CTRL1000 as isize,
>>> +    /// 1000BASE-T status.
>>> +    Stat1000 = uapi::MII_STAT1000 as isize,
>>> +    /// MMD access control.
>>> +    MmdCtrl = uapi::MII_MMD_CTRL as isize,
>>> +    /// MMD access data.
>>> +    MmdData = uapi::MII_MMD_DATA as isize,
>>> +    /// Extended status.
>>> +    Estatus = uapi::MII_ESTATUS as isize,
>>> +    /// Disconnect counter.
>> 
>>> +    Dcounter = uapi::MII_DCOUNTER as isize,
>>> +    /// False carrier sense counter.
>>> +    Fcscounter = uapi::MII_FCSCOUNTER as isize,
>>> +    /// N-way auto-negotiation test.
>>> +    Nwaytest = uapi::MII_NWAYTEST as isize,
>>> +    /// Receive error counter.
>>> +    Rerrcounter = uapi::MII_RERRCOUNTER as isize,
>>> +    /// Silicon revision.
>>> +    Srervision = uapi::MII_SREVISION as isize,
>>> +    /// Reserved.
>>> +    Resv1 = uapi::MII_RESV1 as isize,
>>> +    /// Lpback, rx, bypass error.
>>> +    Lbrerror = uapi::MII_LBRERROR as isize,
>>> +    /// PHY address.
>>> +    Phyaddr = uapi::MII_PHYADDR as isize,
>>> +    /// Reserved.
>>> +    Resv2 = uapi::MII_RESV2 as isize,
>>> +    /// TPI status for 10Mbps.
>>> +    TpiStatus = uapi::MII_TPISTATUS as isize,
>>> +    /// Network interface configuration.
>>> +    Nconfig = uapi::MII_NCONFIG as isize,
>> 
>> 802.3 C22 defines 16 through 31 as vendor specific. Most of the
>> #defines appear to come from the S390 driver. We probably should not
>> add them in the Rust API when there meaning is not clearly
>> defined. However, a driver should be able to use them, e.g, by
>> defining their own vendor specific name to a given value.
> 
> @Fujita, you could fix this by adding a `VendorSpecific(T)` enum variant
> and add a generic parameter to `C22`. Then the user has the option to

I'm not sure. You meant something like:

pub enum C22<T> {
    Bmcr,
    Bmsr,
    VendorSpecific(T),
}

?

Then it's not handy to use the defined registers?

let ret = phy.read(reg::C22::<u8>::Bmcr)?;

I prefer:

let ret = phy.read(reg::C22::Bmcr)?;


> declare their own variant. You will probably need another trait for the
> `T` value to extract the correct register number (you can try to use
> `build_assert!` to ensure that the custom registers are not in the 0..16
> range).
