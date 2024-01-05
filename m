Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5D7250E1
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jan 2024 09:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VkcJyBS9"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-46771fc85cdso340357137.2
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jan 2024 01:42:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1704447775; x=1705052575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWcapK+4gPTCU4AKgsJIg/JwPTZZJk2BZElnDDx7WIE=;
        b=VkcJyBS9Bg/bFdxHSo7oO7aGO5cPsNXAsKCW6449H0ayrkS5OrIn9DKIf57B79mdRB
         rX755gYJX9mWNGq4TiyQaW2tqc3C2h/NpLlhg5EW5mnbNQQn4W2k1XpfAA3saMT7U7Xk
         7CfK3yCpYtJiOkiku1OXZaKa1WQajLJg1r6IWiI22OkDGKdkNiWhy8Gt4WFosmJpIbXo
         G5y5umVzG3uExvrCBZ0Be4e0VxyIBwfzGKb0zEV2bmeIBv0aE3BgqDR6F2sTyazWG/hZ
         GPdN/luMubMGU00nicaFzPXo8KiqThy/U6O2yecOmmnx0KPD8AEKE0LTAzgivlOEOs4s
         eH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704447775; x=1705052575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWcapK+4gPTCU4AKgsJIg/JwPTZZJk2BZElnDDx7WIE=;
        b=WfF2NwQCN4+TL5cTEzboAKmO1N8Px0/Qy5ytxyu01ZynmW/X4cvv/+RKbDK7NwBlSQ
         r10Y8Ys6W95Sk7L5ZjUI9dwzb1xV0beI2IKEgY012hk0CaYyUOD78jMTb+j8WxGAdyFL
         Ovhb5CW7EitgICTJ5f8BvFMkjqnuWizlhb60bHU9y6oBQNzJMK8iKSKv1JkTSwy7zKq7
         WZi18B+R8gCQ+BZHdtuO2LZF8sYgnJSkufEm5agKYj8QT0N+RH7IcM36A/HUXKUpg5V4
         5tj6RgJZvTqYqZm84jRWXC7jIIYKYEb71paXkwS+nK/kYCD2W5CELH6xZZV/nkagSKXU
         H9eQ==
X-Gm-Message-State: AOJu0YwzY/Qv9X828KAjkQiz62Vll2UHsSRTDvTgvel/MLO/NJ7U5HWG
	+c4qO6qQMHijDz+bsJvQ1dJvQBamsg8I2SZoT8DehZynrDGT
X-Google-Smtp-Source: AGHT+IESCC49EOa17Ki/LCzGy4Axu3cNswj9K4To7Z0Yqe9h8ZZJtWriSSU5Gia3aH253IZZC/M7sZdYmLWS2PnbYAk=
X-Received: by 2002:a05:6102:570f:b0:466:f130:9d0d with SMTP id
 dg15-20020a056102570f00b00466f1309d0dmr1308113vsb.32.1704447775543; Fri, 05
 Jan 2024 01:42:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240105012930.1426214-1-charmitro@posteo.net>
In-Reply-To: <20240105012930.1426214-1-charmitro@posteo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 5 Jan 2024 10:42:44 +0100
Message-ID: <CAH5fLggLUBJQYAKb9Vx66QD9CR2XZLpgqj1UQivV0-qvf+qDPw@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: `CondVar` rename "wait_list" to "wait_queue_head"
To: Charalampos Mitrodimas <charmitro@posteo.net>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@samsung.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 5, 2024 at 2:29=E2=80=AFAM Charalampos Mitrodimas
<charmitro@posteo.net> wrote:
>
> Fields named "wait_list" usually are of type "struct list_head". To
> avoid confusion and because it is of type
> "Opaque<bindings::wait_queue_head>" we are renaming "wait_list" to
> "wait_queue_head".
>
> Signed-off-by: Charalampos Mitrodimas <charmitro@posteo.net>

This has merge conflicts with a bunch of other patchsets, but the
change itself looks good.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
