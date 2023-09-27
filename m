Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D6A23741
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 11:19:55 +0000 (UTC)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B97191
	for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 04:19:51 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-57bf04841ccso379889eaf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 27 Sep 2023 04:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695813590; x=1696418390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5fUwhmO3/Eyrc57GyJgOzjVvg/N5ETarHabanAzMFuw=;
        b=PETxEJvCyfPmdqjctRVw4C1NjgCrrme7Q0u/POFszptJOMoRhlCsExjkLt2WR32pXl
         OPk5KibX0iT/wvR7GCHt8RLjiB25z3FZiCEQOnj91Rs1Y8pbYfk28lz82f1TDO2Exy28
         u1wnDKxDZNcMFFb1PmHjZrP/lF+4oabEziP7tbRnVP5Vot/tCJlVYzrRCjsRDSpfb/Yr
         22pYeIUecxoZKOw5hgFJTyEjAKyBPCAiiMGs9gQrNbI9ADSAp7nYqA+WAzJKBJc/QQUJ
         N9sOxwZ7hZH86S+1TDWMbjkvV882OCaqhp247fEuyh6XZN0j0HTY7ckQzrwgjAmfFbwO
         PL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695813590; x=1696418390;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5fUwhmO3/Eyrc57GyJgOzjVvg/N5ETarHabanAzMFuw=;
        b=U4kTUJFoKPO0hTf+n1j5lnY+obvF8bTgtU50hfh1HMoLCr/DwaYlHaYag3ZCxmFVEZ
         HMGzECYm3GYpZRJBTaiVGNyb8fXpcfPEcBt8veIUFz6Ux9S1xe0Aq6cLCbK48GQZviwc
         SIsvE6fhCustgSHUBya30Oqg51Z1TAaf7jJ1HOOsHoB9JZPrFgLiagoEXHmWiwzxaNKh
         8OlXJShorKnhWeZoqr6ERvPB1HpRx0CofPc8HtE71owTZB20YBYMu+RErlxcRert5EBX
         ea6SydOEUw7tXgKh6cEJEOWmOQ+HEx9KAwcnQWhRePkVefZqVt5tCgxmR9VjIe6mJtHp
         Rvcg==
X-Gm-Message-State: AOJu0YxOG8DDi70+rMvi1RWTr2psLj7xoPTWgBdf5sUO97QW63+TI0E+
	UEXokVNWQ1NfHwERCutGcs0=
X-Google-Smtp-Source: AGHT+IFyJRBvaqdC3nJLM7+dYP5jgcy496R7NmoUXbf8wZZ97O5Awj7ayjBABxA4nuj6Qr7cV0qHNQ==
X-Received: by 2002:a4a:c58f:0:b0:57b:7804:9d72 with SMTP id x15-20020a4ac58f000000b0057b78049d72mr1979026oop.1.1695813590310;
        Wed, 27 Sep 2023 04:19:50 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id x10-20020a63b34a000000b0056946623d7esm9784309pgt.55.2023.09.27.04.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 04:19:49 -0700 (PDT)
Date: Wed, 27 Sep 2023 20:19:49 +0900 (JST)
Message-Id: <20230927.201949.984780386551923087.fujita.tomonori@gmail.com>
To: miguel.ojeda.sandonis@gmail.com
Cc: fujita.tomonori@gmail.com, benno.lossin@proton.me,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <CANiq72m-9pALVX3gS4N99+xhDK8rS=Wss0H+aBoUyrZTBwmV3w@mail.gmail.com>
References: <CANiq72nO=Eje0dv_NCagvTzOLU7WkfM-bwqH33z_kC=f=m1m1A@mail.gmail.com>
	<20230926.224630.1323587629112314285.fujita.tomonori@gmail.com>
	<CANiq72m-9pALVX3gS4N99+xhDK8rS=Wss0H+aBoUyrZTBwmV3w@mail.gmail.com>
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

On Wed, 27 Sep 2023 12:49:21 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

>> No helper function for a function that returns avalue like the
>> following?
>>
>> let ret = unsafe {bindings::some_function()};
>> if ret < 0 {
>>    Err(Error::from_errno(ret))
>> } else {
>>    Ok(ret)
>> }
>>
>> if to_result() returns a value, it can handle both types.
> 
> Do you mean a function that takes the `ok` value:
> 
>     let ret = ...;
>     to_result_ok(ret, ret as u16)
> 
> or simply having `to_result` return the value back in the ` Ok` case:
> 
>     let ret = to_result(...)?;
>     Ok(ret as u16)
> 
> ? (which is what Wedson implicitly suggested, but `to_result` does not
> return the not-an-error-integer back at the moment in the happy path)?

The latter. I think that to_result() would be more handy if it
returns an integer in the happy path like:

pub fn to_result(err: core::ffi::c_int) -> Result<core::ffi::c_int> {
    if err < 0 {
        Err(Error::from_errno(err))
    } else {
        Ok(err)
    }
}

> The returning one has the advantage that we see the explicit `Ok()` at
> the end, without having to remember what an extra function does or the
> order of its parameters. It also allows one-liners with `?` like the
> `map()` approach assuming one really, really needs/wants those:
> 
>     Ok(to_result(...)? as u16)
> 
> It also gives a chance to give a better name to the value when needed,
> since at that point it is not an "error-or-value integer" anymore, but
> the actual value we want, i.e.:
> 
>     let my_thing = to_result(...)?;

Surely.
