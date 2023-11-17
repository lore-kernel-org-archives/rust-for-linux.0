Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZGVbgzrN"
Received: from mail-lf1-x14a.google.com (mail-lf1-x14a.google.com [IPv6:2a00:1450:4864:20::14a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03119D4E
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Nov 2023 01:39:20 -0800 (PST)
Received: by mail-lf1-x14a.google.com with SMTP id 2adb3069b0e04-5079fd9754cso1875739e87.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Nov 2023 01:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700213958; x=1700818758; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yRP/aW0x+wuYfu3h+kWAPAGUjA7Hx5HhVmNICZELS2A=;
        b=ZGVbgzrNoEiKIWT4SMGW56A1cWwFPjK5UZHn5v67/yy/xrAr31HINFavgMXN5i9gSM
         SeLRYWUpVXI+5X6rCmirbDDLKkXQvjmR40CLN8bXwkWF0mE4PekWBE5zuF3Z+104o7fp
         AQ5vBqpbc/OW7ziJhPzx+HNL1wWyf+0P9zMY4xUE3ueBtT3V8rT0aohnNldTki58ionL
         gEnJSyM+PQjswfuhmZYAZ8S6CSiu49sSrvLnOZcHoh63iiZZxgvP4hoPXDWH+G9jluW8
         xLjqZ16vyokJRKJMC2JEFVOdy1iEeURf6HgsM6/15OSLnIwHPLR0Pye7N6y4SAGNc5BQ
         3rAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700213958; x=1700818758;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yRP/aW0x+wuYfu3h+kWAPAGUjA7Hx5HhVmNICZELS2A=;
        b=fa5OUKTKCSp+asXI1i19g+XQYcCEJ0OyAG/NdIoXE6Tf0yQOty/2acMSjyBSVjqdjS
         U7cc7zbRd8uCByM1RZSAOBXIMnrXrvzXwdWUAFNja/M0rJBLyQQ7555nmtCkplTK1hKN
         POH5JdepxCz1yMrPiWxp5Rypvqev1jzFn1+L7Q4sh0zDzgtcDXRVmlFK+d+ygkhh1eRq
         3SC2OlQW4vdYSuAIAhCqd9mcpVK8x9F6cMAaUy4qWyVD0wCCt3XwimJSkrzHAIAaypvR
         lwtinLUQLTAc/I4mVvagP9vBpzlO9dNFRde8k+ow2MeHbgvByKLIG3V6eP/Wx4NAQ09j
         XZ2w==
X-Gm-Message-State: AOJu0YxmpAdLofWVQ1iqClPsQdl/XrXHJPa6a8KRARD8oJOrLhWZBLwL
	v6li8NAvoFQ0yfZ5RPVTYgZCNq08VdOxGDs=
X-Google-Smtp-Source: AGHT+IH9p4D1RRU0dNE59yvw/KRBe9QqKBsY8rPqsWRGB5cgYzJqnqwfMKyX0F287MZsfIH74dfXzAAmvvU2rWg=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:3006:0:b0:2c5:177d:60cd with SMTP id
 w6-20020a2e3006000000b002c5177d60cdmr171034ljw.9.1700213958182; Fri, 17 Nov
 2023 01:39:18 -0800 (PST)
Date: Fri, 17 Nov 2023 09:39:15 +0000
In-Reply-To: <20231026001050.1720612-6-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231026001050.1720612-6-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231117093915.2515418-1-aliceryhl@google.com>
Subject: Re: [PATCH net-next v7 5/5] net: phy: add Rust Asix PHY driver
From: Alice Ryhl <aliceryhl@google.com>
To: fujita.tomonori@gmail.com
Cc: andrew@lunn.ch, benno.lossin@proton.me, miguel.ojeda.sandonis@gmail.com, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu, 
	wedsonaf@gmail.com
Content-Type: text/plain; charset="utf-8"

FUJITA Tomonori <fujita.tomonori@gmail.com> writes:
> This is the Rust implementation of drivers/net/phy/ax88796b.c. The
> features are equivalent. You can choose C or Rust versionon kernel
> configuration.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>

Overall looks reasonable. I found various nits below:

There's a typo in your commit message: versionon.

> +use kernel::c_str;
> +use kernel::net::phy::{self, DeviceId, Driver};
> +use kernel::prelude::*;
> +use kernel::uapi;

You used the other import style in other patches.

> +        // If MII_LPA is 0, phy_resolve_aneg_linkmode() will fail to resolve
> +        // linkmode so use MII_BMCR as default values.
> +        let ret = dev.read(uapi::MII_BMCR as u16)?;
> +
> +        if ret as u32 & uapi::BMCR_SPEED100 != 0 {

The `ret as u32` and `uapi::MII_BMCR as u16` casts make me think that
these constants are defined as the wrong type?

It's probably difficult to get bindgen to change the type, but you could
do this at the top of the function or file:

	const MII_BMCR: u16 = uapi::MII_BMCR as u16;
	const BMCR_SPEED100: u16 = uapi::BMCR_SPEED100 as u16;

> +            let _ = dev.init_hw();
> +            let _ = dev.start_aneg();

Just to confirm: You want to call `start_aneg` even if `init_hw` returns
failure? And you want to ignore both errors?

Alice
