Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 587459CA61
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Oct 2023 13:08:21 +0000 (UTC)
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D37FAC
	for <rust-for-linux@vger.kernel.org>; Sun,  1 Oct 2023 06:08:19 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-273e3d8b57aso3382655a91.0
        for <rust-for-linux@vger.kernel.org>; Sun, 01 Oct 2023 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696165699; x=1696770499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blMA5AE9xPiVXKPYsL8Q8O6mpr0V8KxlUe//SkaXdn0=;
        b=l1c3ohX9Sia8TE2BLRxhNqvEE6bcG4m+JNOvnpbF5h4l4Ed38RxJmyN2d/OTnRKkZ4
         xqiFVxLHMfHSnbo350t6Hkj3uxsw7emnPIngHrfqZVpDLNWeoHdLUHRPQgPXcH7r50M+
         Ql04F1+LWtMICRSqwU1pEDdERvNdsWehFD7SoNT9dbm0jgs5xjffCH5dnTRYSJZ9SspG
         InU8C2S7qW8KUUq+NCwC3jSOExWywr4KVICFfLMx09xtrG5Lql6zvu1Wt4eifMYr4VlP
         T5v8pj/ZKFqyHoQpWN7PQYPBQb6B27rtxhVmNL3AuTMucyyKWEenbTRcs625PWxMD0yc
         b2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696165699; x=1696770499;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=blMA5AE9xPiVXKPYsL8Q8O6mpr0V8KxlUe//SkaXdn0=;
        b=N/iH5/VjOLkPftbuhYKKNMoh190NYwIl2wztRDDAyEEp/RshbWoaaVSEebhZ6SzJQZ
         WL0+B7c8EJUf6HEe7Gd5lDSUAX/FPXg1s93qCzzZHvOQqXzY+jcMTb51sT56ATfp2/ix
         Rn7J6AqvTsybL6TiqipZJpG2DLngjODTw4w7l1hZP4ivcj6oSjtgrUzuKPZycFSaE1p3
         7LSVozpY7b7+jRfbJh/4qgR/iEbJ0cQGu4ql/UnqJh3fPhFdoZwJulopMua2YlGFvMmE
         ok1VTg2yUknoUMJW6pYHwrQ8iYH0MOuk6Rgn8nmRODxLQ2c/UfojhvY3p1WJrm9UMSE8
         Dixw==
X-Gm-Message-State: AOJu0YwY6ffxnoL/nIZpDkSIdMwb7sZ72KziPpyOXDJRXrZ/PaO77+24
	CbKa0oLFny2PGgeGCZqe0nw=
X-Google-Smtp-Source: AGHT+IEIdwE1Z9HlzaRc7qWkHnuvbLNcrCfKKEsTZSgGYtlGGrfAxKpx03rQTDlOSTRgnPG5AL5tkA==
X-Received: by 2002:a17:902:ea0c:b0:1c2:c60:8388 with SMTP id s12-20020a170902ea0c00b001c20c608388mr10318853plg.6.1696165698856;
        Sun, 01 Oct 2023 06:08:18 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id kg14-20020a170903060e00b001c0aa301703sm20234402plb.63.2023.10.01.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 06:08:18 -0700 (PDT)
Date: Sun, 01 Oct 2023 22:08:17 +0900 (JST)
Message-Id: <20231001.220817.560585176336523991.fujita.tomonori@gmail.com>
To: tmgross@umich.edu, miguel.ojeda.sandonis@gmail.com
Cc: gregkh@linuxfoundation.org, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, benno.lossin@proton.me, wedsonaf@gmail.com
Subject: Re: [RFC PATCH v3 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
References: <20230928225518.2197768-2-fujita.tomonori@gmail.com>
	<2023092900-manpower-runaround-859a@gregkh>
	<20230929.173856.1751823335892887678.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, 29 Sep 2023 17:38:56 +0900 (JST)
FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:

>>> +    /// Gets the id of the PHY.
>>> +    pub fn id(&mut self) -> u32 {
>>> +        let phydev = self.0.get();
>>> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
>>> +        unsafe { (*phydev).phy_id }
>>> +    }
>>> +
>>> +    /// Gets the state of the PHY.
>>> +    pub fn state(&mut self) -> DeviceState {
>>> +        let phydev = self.0.get();
>>> +        // SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
>>> +        let state = unsafe { (*phydev).state };
>>> +        match state {
>>> +            bindings::phy_state::PHY_DOWN => DeviceState::Down,
>>> +            bindings::phy_state::PHY_READY => DeviceState::Ready,
>>> +            bindings::phy_state::PHY_HALTED => DeviceState::Halted,
>>> +            bindings::phy_state::PHY_ERROR => DeviceState::Error,
>>> +            bindings::phy_state::PHY_UP => DeviceState::Up,
>>> +            bindings::phy_state::PHY_RUNNING => DeviceState::Running,
>>> +            bindings::phy_state::PHY_NOLINK => DeviceState::NoLink,
>>> +            bindings::phy_state::PHY_CABLETEST => DeviceState::CableTest,
>> 
>> Again, this feels like a maintance nightmare.
> 
> As I wrote above, it's guaranteed that C and Rust code never
> diverge. However, as you said, suley it's troublesome to maintain this.
> 
> We could directly use enum generated from C's enum at compile
> time. Then we can remove this conversion. The names are not pretty
> from Rust's view though.
> 
> Any concerns from Rust side?

Thanks a lot for the comments, Trevor and Miguel!

I leave this patch alone. Seems there is a good chance that bindgen
would support a feature to automatically generate something
useful. Once the requirement on the C side becomes clear, we can
propose changes to PHYLIB.

I'll drop RFC and send the patchset to netdev tomorrow.
