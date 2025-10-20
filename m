Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85C52DF122
	for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 11:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760959570; cv=none; b=fw/fmx2JlaxpSuxXIUfIur1QU1BwGLCE/fC1H2M852EJIxKAFSo34zCRKQ3pJMlCwnR0n9Nh1AvFfrAA+oYmXKA7IIVUf7A5IW7wJKmW4OcBqMRd+k0rXC2p2ttPRGcfCfa/zLfXoDAdjOpITNv7kKJaLwP9GuZbpCP7OJ8JUu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760959570; c=relaxed/simple;
	bh=hgOColYtjypJYFmtghZDQhWFnff6Vuq/Pns/rc/RTxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PzaYhSQN6WwMPKOiiE1ddNa/4ibai3MHbNb6QiV54Kmbmec26DFskVsSZY3SXOjxUFdFqYdwVvvcUOeBHdNF6umSxt0Hrql4pUnuAlK9vY7ERbN42qAlrgizueSfs95JoEvg/bdEXtRBZitW6BPapJ1/FTiwSibtWQdqz2cAI3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OhwKQZH4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OhwKQZH4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-280fc0e9f50so8317535ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 20 Oct 2025 04:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760959568; x=1761564368; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgOColYtjypJYFmtghZDQhWFnff6Vuq/Pns/rc/RTxY=;
        b=OhwKQZH4XCkNBxqdgYf8t4PRIoL0R7vfzMjrnIsRVCinoMnJNGTYlU79n7qlW8wfpa
         zNOeNBYKYP6/eYxWB/2sc9DemE26+rxb53oellKA91Nvv7rHQG0wJZCIgVDmJQ+2XEw1
         dEm6GoPgvuxODr7HArd+jLce17R43kU8183W8FwR/u1CVZTaZDg9vg818DlpOWT/z/1p
         k0dzpsWGEn5ROTH33AbNQbPizHs684iy59JSAW6NdXdsN2bxSG0/7KdSUIHh8JcgxNE6
         I3Hz76xnKnwdypq8mtZNQp2XGIGK2gn+JoMRHkY7nKIjO1OAXExZEZtqPbwJKVTae6vD
         9y1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760959568; x=1761564368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgOColYtjypJYFmtghZDQhWFnff6Vuq/Pns/rc/RTxY=;
        b=C/q84g7zsChaeNx7TIS+JKt4ZhSQFuCpSCZYxLdrNobyuBwUr3ZQeScr+ou/dCP1YH
         E3D99PeqoV7mbQ8LgKVHsQ0NcRomjyYW0GWaee7UbMLxq8zjccoT/7F7do1FQpC+PfhI
         H2rVHRdLukcw+phkqtF6K5xR2LUl7sC1Hfad8VSTCW4qm4mC7LzzSll0zfwzC9zOU8dd
         qT2SA4QwjWtVcQy9PF0T79DT9+8oYLl1PcRJqncw/eBZxoGizKbcC0aa4FfKWeW1+wIJ
         XCip7xrSD5wAPcJ9OA0Gfc2rML+qEnEFyHJDnXhQgNRZpKQ+V7YaPMNPogVt0WkQpEmR
         IvBA==
X-Forwarded-Encrypted: i=1; AJvYcCVDJn2xPn5+xZBIrq0B0gcb1m6hkMxavHNCU/9xalb8WBCm+sTyoaRd4lBNbh2il+HSzGP9ftXh+OSptUdrBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQRj8IEljkCDtBfxVa3ujoQILP7eEsFlLAWBnYDGqfsvESjyY7
	1wbQD66XmzkyQyl54dKHsCoTTWQld9sNuPYNCZjJ3WCmQ6VgldX3U43nla9/xJ4xjyrCFa7zc7O
	XY8aEm4hti1x+OA02jHHwDpWCNIq4n9Y=
X-Gm-Gg: ASbGncvrvbNPt8f7g+ByKI4K9rUJ1CQdHfoF/j1x16BbowKCp2Cq0AD6tifl0tKTxb9
	QDwdh66R2kVdUW4RrkKdFrL8WczGWK67nT4wsCy5TB3sgMsIrErEcGkDfFDXb68vZd8jegnf2uz
	SZfR7OrHmOmAwwNDliOSoL9xwu46h86EvmFPiQDnc9XieIp5Qny+zPYD0nrYi9fNkN+pXS4Tz0t
	8R3gKr6DM8U4IBYmmB4vwpO7ewiMPO0S1aHLGzE6bXtjQx+2dqb1eLac3PC22vG0XNxXFSZWlUw
	52NnmO3oMHkv732mJWBzmbPxJVCEmi0vmJlEyMQ3ZJzjQE6x7/SLHhtANwd0xPEUk1SkXgHkS4u
	Ki3MSATwG7z3OLmsGz89HXvFz
X-Google-Smtp-Source: AGHT+IEKwZbSy/N18wL4YfpzGb1pRy6ao0FR9zqJgT5EVU+s2mj3AZEqw0jAcF02AG4TQ9WpRH8/nfLRy1ytZSe20ms=
X-Received: by 2002:a17:903:40ca:b0:290:55ba:d70a with SMTP id
 d9443c01a7336-290c9cf3306mr86594545ad.2.1760959568266; Mon, 20 Oct 2025
 04:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251020031204.78917-1-huangsiyuan@kylinos.cn>
In-Reply-To: <20251020031204.78917-1-huangsiyuan@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 20 Oct 2025 13:25:55 +0200
X-Gm-Features: AS18NWDO0ydrU_D3vxY3mykKLDQk63GF017mZ_6ZLZcYagnPF_Cv3D8Dk6e5NHQ
Message-ID: <CANiq72=9=W_j_o=oT+AdghQbEFbEmqT+Gx6q8oK8-yVwcrnDXQ@mail.gmail.com>
Subject: Re: [PATCH] rust: acpi: replace `core::mem::zeroed` with `pin_init::zeroed`
To: Siyuan Huang <huangsiyuan@kylinos.cn>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, linux-acpi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 5:12=E2=80=AFAM Siyuan Huang <huangsiyuan@kylinos.c=
n> wrote:
>
> All types in `bindings` implement `Zeroable` if they can, so use
> `pin_init::zeroed` instead of relying on `unsafe` code.
>
> If this ends up not compiling in the future, something in bindgen or on
> the C side changed and is most likely incorrect.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1189
> Suggested-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Siyuan Huang <huangsiyuan@kylinos.cn>

Rafael: I guess you will take this; otherwise, please let me know -- thanks=
!

Cheers,
Miguel
