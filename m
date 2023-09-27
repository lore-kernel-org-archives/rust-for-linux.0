Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59291851
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 03:39:48 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1591B5BB7
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 20:39:47 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c724cd25f9so1081285ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Sep 2023 20:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695785986; x=1696390786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hocLd/uEKh7RhAqHXf9abGpBnXKXUuxbONu+Pka/TDI=;
        b=B2b19Zuq++Mc9sULTSM7yNqYvVgUHFwIUB5jj8PWMWxKIu6MP7Sb8oi8YHlXvx9Myb
         qvmTl6/7V0g+zbCIJ35ACztulfzlZy7aUlaWA0b6Mg7syXL1rW3BZdiMw0KRaD5tNc5Y
         9BwE02vCO65PFLX0eFdBRC3OFmZoQLr8rIyKYS0ABvz4A5jGFFLxSdpA5y49gshq5L9u
         p/v3HN1ItS7O526eF/p0DrBHJj24CWFs0qyXJXIikQsK2shbCr7AkueNcPe/ivYEWzHo
         0dFyVqFR1U3ZC7TEBQu79v5Qz2PFSyUOr+eZTzrn46X4iEgAhQmaIRtl46nCgAKQnrPu
         RYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695785986; x=1696390786;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hocLd/uEKh7RhAqHXf9abGpBnXKXUuxbONu+Pka/TDI=;
        b=ai8QFYLtf77MKNRoffjssoCZi3A8gTrCJ2tuCHLrdP0LKIBHFcs89V4DYIidBmEOP8
         Qx8dp/dAVUdGxFghWVihdXZyeTk3iTq9zDBOizghlVlGs9E2DdMiGE4YEPvj+uZkTQ+4
         0oWy7yrX6WiyV7xUzuItbCGZiXISwC4qn1a2sS4avZ4koP9U9ZMYUBRczVK7PH6lnF0/
         0xRk0mEkZ/2TXeLCR71QxThWGO6i+oeumdvH9p4dO1Rxz5hyPqb/k3dNGuGkN83FsdpE
         nVjpzDwBSxsz1X4TZre2K2QDWA6zqn/adFvyBu+YYPDAOIOemfHsTwCivZZEWH/KXSk6
         UpxA==
X-Gm-Message-State: AOJu0Ywo4OkgSJZT19xOKpPz7cM1UoU/IgqxBzPuZlS5bR97kCsFtpRy
	zZZRZVzszpL6MKug8ndZYpE=
X-Google-Smtp-Source: AGHT+IHVVoQ+MXAVzzFBqPueT1MpAoufpoubSpRklCrZzllxgozUzSByH/ZkJz55FMYygqkRUQbWhw==
X-Received: by 2002:a17:902:d48d:b0:1c3:4073:bf80 with SMTP id c13-20020a170902d48d00b001c34073bf80mr768592plg.0.1695785986408;
        Tue, 26 Sep 2023 20:39:46 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902db0100b001b03f208323sm11793812plx.64.2023.09.26.20.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 20:39:45 -0700 (PDT)
Date: Wed, 27 Sep 2023 12:39:45 +0900 (JST)
Message-Id: <20230927.123945.1084774133034584337.fujita.tomonori@gmail.com>
To: tmgross@umich.edu
Cc: fujita.tomonori@gmail.com, rust-for-linux@vger.kernel.org,
 andrew@lunn.ch, miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CALNs47vE7p_m=q0Q5+bHUSVaNVEbfeJfZFHS9AkT1UaUMvuevQ@mail.gmail.com>
References: <20230924064902.1339662-1-fujita.tomonori@gmail.com>
	<20230924064902.1339662-2-fujita.tomonori@gmail.com>
	<CALNs47vE7p_m=q0Q5+bHUSVaNVEbfeJfZFHS9AkT1UaUMvuevQ@mail.gmail.com>
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
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, 26 Sep 2023 02:54:21 -0400
Trevor Gross <tmgross@umich.edu> wrote:

> On 9/24/23, FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index e8811700239a..0588422e273c 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -14,6 +14,7 @@
>>  #![no_std]
>>  #![feature(allocator_api)]
>>  #![feature(coerce_unsized)]
>> +#![feature(const_maybe_uninit_zeroed)]
>>  #![feature(dispatch_from_dyn)]
>>  #![feature(new_uninit)]
>>  #![feature(receiver_trait)]
> 
> 
>> +            // SAFETY: The rest is zeroed out to initialize `struct
>> phy_driver`,
>> +            // sets `Option<&F>` to be `None`.
>> +            ..unsafe {
>> core::mem::MaybeUninit::<bindings::phy_driver>::zeroed().assume_init() }
>> +        })
> 
> I think we may actually want to avoid using
> `const_maybe_uninit_zeroed` and other features that indirectly rely on
> `const_mut_refs`, just because some of the internals are still TBD.
> That means that the best solution is to create a `const
> DEFAULT_DRIVER: bindings::phy_driver` and use that to fill the
> remaining fields.
> 
> Which really isn't all that bad since it means that if any fields are
> ever added to `phy_driver`, we will need to confirm that our default
> is OK a single place.

Such change to phy_driver would unlikely happen? Wth such change, all
the PHY drivers need to be updated.

const_maybe_uninit_zeroed was suggested during the review of my
bindings patches for NICs. If there is a consensus not to use
const_maybe_uninit_zeroed, I'll initialize all fields by hand.

