Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdnOcIZ3"
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE93295;
	Tue, 12 Dec 2023 05:02:17 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ce3281a307so370074b3a.0;
        Tue, 12 Dec 2023 05:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702386137; x=1702990937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIuXQIUIfUACVfEcX1IkzElr14rHbEHbFUavRyQEfiU=;
        b=fdnOcIZ3lme9hQv0AFc/QowZPL0hYYaV5/97oMRAh/6e5RGJgNofswyBPZHRL11AJv
         9t7C7iFEnYg7K1aJ5HISjeiR0fw+AAnuau2XCAWEEaTu6cXdwYHT6ObOSWrLj9wewAvm
         GbQgLUq96B//V702Dlp6R8V9ZQw7ebv/kcMIZDlptHO2mMKVUh7LWCriMwq+hTZ/lLYo
         YvBao4bkbPnzV4MNZ2DwIjjzjsUnNsMeVzQSIZKT43nldjVbDqquLz34ihPEg81WncBP
         K1MAgB0LfYH9cD94gFhstRmULD+FZZg6whD45bD2Qh8ZARLV1BGYWgtuqUUOFV1t85ge
         U3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702386137; x=1702990937;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wIuXQIUIfUACVfEcX1IkzElr14rHbEHbFUavRyQEfiU=;
        b=tI7IBtPYrHrREsMKGMTLR24YOLlZMiPCydUfgCxcjCfGJYnRnssxosFl3s2siCR/s0
         1y0lLQJvlPlZ71Mov3UqRAWFbewfDR0Bl6nAJ4J9wySImEVf0BO8oKwbvAl+duVjOhSB
         hT1Wy3spHAQ3f/VHQ9HDI99dWzZ+4JHPIG6SErjLFcXb+nKQy6IGxtmiVZdz4iKv2IrG
         edSjIVM27Xx0m9XskD2z6WqXrPSCx+XnAHXyfTJ4Wo0aC3w1q51xgCafkHS/OhZepE5h
         Cepw61B1bSTekoIpaBfE+2UQsF9Ate9XPefNEI0OHTCDmPEeef1Q0BPyuXZeJsaFb+jH
         YXRw==
X-Gm-Message-State: AOJu0Yyf/IR0CdRfQV2wHQj6Pgp+RztCa0/ttUP2ZelAFtn990h72n08
	8f9JWxUovFWoUkPmk2BON3o=
X-Google-Smtp-Source: AGHT+IGL2x8zgYTwtHJh3mQclyE3x37U5ZI+WR+B6wfBWubvmTK/OMTCj56m7twasTiRuKmMfW90dA==
X-Received: by 2002:a05:6a20:e125:b0:18c:18d4:d932 with SMTP id kr37-20020a056a20e12500b0018c18d4d932mr13474772pzb.6.1702386137258;
        Tue, 12 Dec 2023 05:02:17 -0800 (PST)
Received: from localhost (ec2-54-68-170-188.us-west-2.compute.amazonaws.com. [54.68.170.188])
        by smtp.gmail.com with ESMTPSA id x13-20020a056a00270d00b006ce7f1ab3bfsm8108764pfv.65.2023.12.12.05.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 05:02:16 -0800 (PST)
Date: Tue, 12 Dec 2023 22:02:16 +0900 (JST)
Message-Id: <20231212.220216.1253919664184581703.fujita.tomonori@gmail.com>
To: boqun.feng@gmail.com
Cc: fujita.tomonori@gmail.com, alice@ryhl.io, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, andrew@lunn.ch, tmgross@umich.edu,
 miguel.ojeda.sandonis@gmail.com, benno.lossin@proton.me,
 wedsonaf@gmail.com, aliceryhl@google.com
Subject: Re: [PATCH net-next v10 1/4] rust: core abstractions for network
 PHY drivers
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <ZXf5g5srNnCtgcL5@Boquns-Mac-mini.home>
References: <ZXfFzKYMxBt7OhrM@boqun-archlinux>
	<20231212.130410.1213689699686195367.fujita.tomonori@gmail.com>
	<ZXf5g5srNnCtgcL5@Boquns-Mac-mini.home>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 11 Dec 2023 22:11:15 -0800
Boqun Feng <boqun.feng@gmail.com> wrote:

>> > // SAFETY: `phydev` points to valid object per the type invariant of
>> > // `Self`, also the following just minics what `phy_read()` does in C
>> > // side, which should be safe as long as `phydev` is valid.
>> > 
>> > ?
>> 
>> Looks ok to me but after a quick look at in-tree Rust code, I can't
>> find a comment like X is valid for the first argument in this C
>> function. What I found are comments like X points to valid memory.
> 
> Hmm.. maybe "is valid" could be a confusing term, so the point is: if
> `phydev` is pointing to a properly maintained struct phy_device, then an
> open code of phy_read() should be safe. Maybe "..., which should be safe
> as long as `phydev` points to a valid struct phy_device" ?

As Alice suggested, I updated the comment. The current comment is:

// SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
// So it's just an FFI call.
let ret = unsafe {
    bindings::mdiobus_read((*phydev).mdio.bus, (*phydev).mdio.addr, regnum.into())
};

If phy_read() is called here, I assume that you are happy about the
above comment. The way to call mdiobus_read() here is safe because it
just an open code of phy_read(). Simply adding it works for you?

// SAFETY: `phydev` is pointing to a valid object by the type invariant of `Self`.
// So it's just an FFI call, open code of `phy_read()`.
