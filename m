Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0893328F8
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 07:24:10 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7283CE5
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 00:24:09 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9a64619d8fbso85525966b.0
        for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 00:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1694676248; x=1695281048; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/aW4p/echy5uNxBf3hcbTDq4XUM3Pe4PT2VZDFpV3EA=;
        b=QX17V6+G7Ea0tZk8mSdDba5NbUsRTL0hCa7AzNzAg554Ffog8XdZw0OjgDFqOfGUQN
         yEa4CXuECM4vJ3/Gyygj0lniXYj3rJd9Fv6/HDQubLJ1jo7eDXPA1+z85JOGP8sgjuhm
         5/aLzGAI8yowLw/rLpQw58y63PaWvzR+U2IjpJ47yPoFazwcs9sqO3HT/ffCSJfn0ozd
         bDAGDPKDlLosn+fYDrKgHrZ5lBkEcr8LXHGQBGNV0imJT/LhGKq40vsde+Pv6rRRIZ1d
         TbTxWCxgDFB26YXANYVokkV/wFyNYgr1eMvp0ARAmKfWKBIFiT9Ul9zW81zNuZAH8ap+
         vrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694676248; x=1695281048;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aW4p/echy5uNxBf3hcbTDq4XUM3Pe4PT2VZDFpV3EA=;
        b=K43xu6kSrZEFhdto91LpvHdNHMQ0EiVHcgpGt3Zgx0o/Q5Fx5a5k2qjGIWn8U7svK3
         YzZj1gCgdGgb0lw+ClgTrmxMuAnE0hujMSKMEJFfnuXlKT6FzvS2AQjP1ALr59NY/kOH
         7lX9NkVDw/+o/HV1XpfQThF0SGDOyfqG+CD0nSJRmoCl3HYCylBXgY2iBpkLlHKK2s87
         smqooyoBGSZPTJVwhLouuzDDECmbomgV8ZCky/cNwposZE9CHdc9FkXpGjObxffvY0FO
         YGu8wBH6Exi4IiCB29JrcWfxlh5d5fYcteWDHzdxCoC5/iFbgvh0nF6WjErJFaivxyD0
         uCYw==
X-Gm-Message-State: AOJu0Yzib4MTX24xzP9+OinsXhSK3Qm+AD0pNs4fvmezqdBKNRxOB4N7
	Bmj9iQiieiP1SCmk7778MmHZRpy55/VJFQ+KtC0uQfoItHaI5kpRI2A=
X-Google-Smtp-Source: AGHT+IFOhxWMwkY7UDEKiky63zOhuFp9HTYzwbpe0trobbwhb0RKQT5qfW1GSIE9+K80FSBM7WmjbuZfshuDWwY6NPI=
X-Received: by 2002:a17:906:81c7:b0:9ad:b80c:c19d with SMTP id
 e7-20020a17090681c700b009adb80cc19dmr972772ejx.56.1694676248282; Thu, 14 Sep
 2023 00:24:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-3-fujita.tomonori@gmail.com> <CALNs47s7wH8yFU-jbcQxVRiHta_pEdueSGo9mFOdYriT=o0SOQ@mail.gmail.com>
In-Reply-To: <CALNs47s7wH8yFU-jbcQxVRiHta_pEdueSGo9mFOdYriT=o0SOQ@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 14 Sep 2023 03:23:56 -0400
Message-ID: <CALNs47u3s1gyDLksk5M=7HwTK=-vjadWKbhZQDm6OpDXqcDUbg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 2/4] rust: phy: add module device table support
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: rust-for-linux@vger.kernel.org, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"

Actually, looking closer at the use of this macro

+kernel::phy_module_device_table!(
+    __mod_mdio__asix_tbl_device_table,
+    [(PhyAx88772A::PHY_ID_ASIX_AX88772A, 0xffffffff)]
+);

Since the `paste!` macro is in kernel now this could be refactored
more like `MODULE_DEVICE_TABLE`, i.e. just take "asix" rather than the
clunky name.

Maybe it would be good to have a trait for a MDIO device as well

    enum PhyIdMask {
        Exact,
        Model,
        Vendor,
        Custom(u32)
    }

    impl PhyIdMask {
        const fn as_int(self) -> u32 { /* ... */ }
    }

    trait MdioDevice {
        const PHY_ID: u32;
        const PHY_ID_MASK: PhyIdMask;
    }

Then the macro just becomes

    kernel::register_mdio_device!(asix: PhyAx88772A, PhyAx88772C, PhyAx88796B);

And expands as

    static __mod_mdio__asix_tbl_device_table: [mdio_device_id; 3] = [
        mdio_device_id {
            phy_id: PhyAx88772A::PHY_ID,
            phy_id_mask: PhyAx88772A::PHY_ID_MASK.as_int()
        }
        // ...
    ];
