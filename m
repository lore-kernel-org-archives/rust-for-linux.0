Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DB0443D
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 09:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnJ+mWRk"
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA8AAA3
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Nov 2023 01:56:02 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5401bab7525so7196706a12.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Nov 2023 01:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699264561; x=1699869361; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tTXtgz9/jS3QJxI7tiCthA4Zxx/NHa2NNZyi3X+/pSI=;
        b=JnJ+mWRkcsSoefL+nA7MK2rMbMWUiK73nd3WkegAUgklr7TflUBeJu6Jb4EuNRdunO
         ilh96BTAEXkiDZTj6PQ5rKWQDYzR7ATJhgMojUp8hc9vEs8VDJUrnDgx/ktlmvk3t4FQ
         AFEi7y7QOJ8zIme16WWBdNbI7RFofz8uCVXMLsD7zr3XI0N2gxdt7aenPt75ubEkHzES
         AdR80eNTJZf6kUZToRZBCXhmEwgOoywSHmrXjab/3kMqVqxkcA54CZwAGD/DopX4dZ2m
         O+kgTxcYWRLXGhO5r7+ILjGtHgQswMGhM8LkItwth+54Y/fu/rLnIqpkA8WXg39SvPFO
         yPzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699264561; x=1699869361;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tTXtgz9/jS3QJxI7tiCthA4Zxx/NHa2NNZyi3X+/pSI=;
        b=ZCYs+N4dz66NZacM7OlscOpi+N3hSHvQFHGGTzx4mvpYeLY6CzH2AGcG9csJRwL9/N
         gVNllluF7dIAKR9J/h10uUXQsj1nwhlpEPJ2t3JtRdzPSGEAuLVefR7iYfpHtDhp/Y/V
         hIuadeRUJxrPhDfUzYskjTO/O2C5KhgfQVU8estqUZ9gSSZltv7lQrku8DeFLxODlKCD
         yZg9FFhV6p3OLjkIR6KzLtOXVk+FmC1Xk9aIW7x06pO4kllTwnNBStyQH5hPsORi0b+7
         X9nc+cxuuB5vo8ydhWSpQPbP3lDcR9gxiZbPNqn0dil4mBKnu33GCK3cvUTDcghATTxC
         kVpg==
X-Gm-Message-State: AOJu0YwXbXNnxy1mMktDwAYnJbvn1+oQtOhTy9SXw5OV8PgTrUxj09OZ
	+Q1iQD2enLFYfhOpfvi56FA3emXh+q4LbQY3yA9D0Tt/ebrHPi8u
X-Google-Smtp-Source: AGHT+IHuHADuPWPIzjrCSowaBbxJ43Fe0SFmWOu65/DChw0NyxGgNoD/st9TaBXmvk2e3Jo91/0xVJEJ+ay+1CA2lLE=
X-Received: by 2002:a50:9e87:0:b0:53d:a1c0:410f with SMTP id
 a7-20020a509e87000000b0053da1c0410fmr21495482edf.2.1699264560971; Mon, 06 Nov
 2023 01:56:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Steve Fan <stevefan1999@gmail.com>
Date: Mon, 6 Nov 2023 17:55:50 +0800
Message-ID: <CAM0aA4MOzDx7HK5O6aYjJAqASKCkLm6mi=Z3fsr2-VSKO4KFdg@mail.gmail.com>
Subject: Considering first class integration for Cargo
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello all,

Please consider supporting Cargo for pulling in external crates, as I
got some no-std based data structure crates on crates.io.

The idea is that we can separate the kernel part with the core
algorithm/data structure part such as declaring filesystem structure
and use nom for binary parsers to virtualize the read source (for
example read from block device).

Someone has a WIP integration for this:
https://github.com/Rust-for-Linux/linux/issues/865#issuecomment-1214148291

I tried upgrading it to the latest kernel but failed. Linker issues
are nasty and b*tchy.

It is such a PITA to copy all the needed crates and mark them as
`extern crate`...

In the future we can also use Cargo.toml to check for GPL compliance.
There's a license field in Cargo.toml so that we don't have to add a
huge GPL header every time.

Stefan
