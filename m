Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2202518E0B
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 11:30:10 +0000 (UTC)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00E2EC6
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 04:30:05 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-34f69780037so2602375ab.1
        for <rust-for-linux@vger.kernel.org>; Mon, 25 Sep 2023 04:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695641405; x=1696246205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gEG54+Y0+h9vZ050+Q7opwiaOWZXhFU/fwkmV/iPRZM=;
        b=i8rNJzxcB0tPNPkBwSQWCsf2S8b/YiN+U8SLFroXEEnZ+6P4/2kUKytNOux3nnHk9c
         /fQDrv+xHIP+Q/O0q2cJDafTT6YfHnH2UQAaGtWTD4fqLcTTbOUeL2zJ4QN6Dc1D+idP
         7lCy2szXNtHAy2K0hYaoMEA9LBCOU5w6inU1Uu/RK54i1rxBq0EoShqErNui49G2ixp5
         3MqdyBPR/keqqYzqmyfhC5A0e+jsPDUDEdPiq0zasjKKmLXXtPj14CzbgoXrEPQZcJ6C
         YcAHSrv82VbolWXDHvfmbJ4wS09UmlBohG9b9I34GDcBko4ZiDPZerFJ7iRBb9Ne+lO4
         zHCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695641405; x=1696246205;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gEG54+Y0+h9vZ050+Q7opwiaOWZXhFU/fwkmV/iPRZM=;
        b=pCmn+cUhMS/+9FRYhYkuHuYYlsAzkjEBhdJNppJ1BFBFZ9XGnWv/QloO0ctXQeO1Pu
         9vCXMJuElz8QG2y9kPOftKs/QIPSDf/VY0ijZkACK5OUqzEMUFVnWJ1NyG0L2ZeWeXQY
         5sRkgX9HKQVKwQK99PCwwRqHd7UImYqk/G4eHp+qjmhDNhwBhvUlpZjSH+dgydyodut7
         MNt3LsL5Y6jMrDwSG4glLfGaXMgGv3JBIrOK5rfV60dHsOKkObGay9tTR666HLyYB2yH
         v2BwvwahqYkwNxqbYvB9tFbfz+NeK+EZ3jNKOzHKpfv4tWyNjDjmacnHUJGboz/7ROAn
         yxpA==
X-Gm-Message-State: AOJu0YzVqBZhH47AgZEzCLNnWikBlVyT/vWTl2uXikTvGNjNz2TsAYVE
	6fpop0Dv+iXgrTjECsvPVMvq+C9IExVNjGND
X-Google-Smtp-Source: AGHT+IH+V3UR/3MDHsYV/WUPjqcqBw+BPPmzHpvPh54soHuOqWx/HWJ6BjIha548KxOJQh0fiJqw3w==
X-Received: by 2002:a92:b0f:0:b0:349:67b0:6045 with SMTP id b15-20020a920b0f000000b0034967b06045mr7163687ilf.3.1695641405229;
        Mon, 25 Sep 2023 04:30:05 -0700 (PDT)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id c198-20020a6335cf000000b00565d82769d1sm7727183pga.77.2023.09.25.04.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 04:30:04 -0700 (PDT)
Date: Mon, 25 Sep 2023 20:30:04 +0900 (JST)
Message-Id: <20230925.203004.1803118860435488218.fujita.tomonori@gmail.com>
To: benno.lossin@proton.me
Cc: wedsonaf@gmail.com, fujita.tomonori@gmail.com,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu,
 miguel.ojeda.sandonis@gmail.com
Subject: Re: [RFC PATCH v2 1/3] rust: core abstractions for network PHY
 drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <652520d9-c409-6bb4-821b-5bb8bf99bc0d@proton.me>
References: <20230924064902.1339662-2-fujita.tomonori@gmail.com>
	<CANeycqo5Ujf+tMTkMOVqc8znz3Kd4MFUyhfvNw3cRNPdYVSxBg@mail.gmail.com>
	<652520d9-c409-6bb4-821b-5bb8bf99bc0d@proton.me>
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

Hi,

On Sun, 24 Sep 2023 13:39:55 +0000
Benno Lossin <benno.lossin@proton.me> wrote:

> On 24.09.23 14:56, Wedson Almeida Filho wrote:
>> On Sun, 24 Sept 2023 at 03:49, FUJITA Tomonori
>>> +        let phydev = Opaque::get(&self.0);
>>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>>> +        unsafe {
>>> +            (*phydev).speed = speed;
>>> +        }
>>> +    }
>>> +
>>> +    /// Sets duplex mode.
>>> +    pub fn set_duplex(&mut self, mode: DuplexMode) {
>>> +        let phydev = Opaque::get(&self.0);
>>> +        // SAFETY: This object is initialized by the `from_raw` constructor, so it's valid.
>>> +        unsafe {
>>> +            match mode {
>>> +                DuplexMode::Full => (*phydev).duplex = bindings::DUPLEX_FULL as i32,
>>> +                DuplexMode::Half => (*phydev).duplex = bindings::DUPLEX_HALF as i32,
>>> +                DuplexMode::Unknown => (*phydev).duplex = bindings::DUPLEX_UNKNOWN as i32,
>>> +            }
>>> +        }
>> 
>> To avoid repeating `(*phydev).duplex =` and to reduce the amount of
>> code inside the unsafe block, I suggest you do something like this
>> here:
>> 
>> let v = match mode {
>>      DuplexMode::Full => bindings::DUPLEX_FULL,
>>      DuplexMode::Half => bindings::DUPLEX_HALF,
>>      DuplexMode::Unknown => bindings::DUPLEX_UNKNOWN,
>> };
>> 
>> // SAFETY: This object is initialized by the `from_raw` constructor,
>> so it's valid.
>> unsafe { (*phydev).duplex = v};
>> 
>> 
>> In fact, for this enum, you wan to use #[repr(i32)] and assign values
>> from `bindings` so that you can avoid the match as convert using just
>> `mode as i32`. See for example:
>> 
>> https://github.com/wedsonaf/linux/blob/rtarfs/rust/kernel/fs.rs#L71
>> 
> 
> I do not like `as`-style casts, they are error prone and no warning/error
> is generated if they are used incorrectly. They also make review harder,
> because I now have to look if the enum indeed has that correct repr.
> I think we should talk about this in one of our meetings.

Can we try to continue to discuss on the mailing list? I think that
this topic (enum conversion) is also important for developers who work
on mainly C now but are interested in Rust support.

About the above duplex-mode code, I'm not sure if there is the better way.

It's conversion from enum like const values on C side.

#define DUPLEX_HALF             0x00
#define DUPLEX_FULL             0x01
#define DUPLEX_UNKNOWN          0xff

We can't automatically generate rustified enum from them so we have to
convert them by hand, match or repr.

We don't need to think about divergence. Also we convert from Rust
enum to C value so no conversion error.

