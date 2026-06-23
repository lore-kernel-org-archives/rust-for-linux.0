Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25536367F31
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 09:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208391; cv=pass; b=eh2rWVETeUm3REcJ13sV8zAqLcu44Ect+2F7CFETWes5sGTYnEiDb8klDyUBHkqtIAB2Jrh1ygXVY3c4eAHvmCJhSSYhRPzJvbn7VVxpw6aVzHgSffhrqyX9N8cLRZhtcxI11Cy9Xfda5Hejv6HXihbMaGOP+lPUremLO8P5kf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208391; c=relaxed/simple;
	bh=oD0SX+qNmhfrapVROd/rHVLulNY501VFTgteqW+bmiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NV3MHt53uMyxvdz7UHqUROOXS5Gw3+5k7oBPa5V2sYZhd4t54XiZbhzEwwDgpEPJITKfvQoOsL0psfZxJH7F403n4Pa/GYfxCkKOfeSTlH+diU8HIrc9YKSzCB7Qk6LNWRzu2v0ocXbodHcYaZpZsRYrNYnXAuKMJVcnHnzJPLY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBjlHm5I; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBjlHm5I"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c514b9658so133756eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Jun 2026 02:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782208388; cv=none;
        d=google.com; s=arc-20240605;
        b=UJimBQX/CXZJO/BHdkZWDN9BGTBECt+CYdwHzt9jOfxduBFTqoVweROJBNid1wfhB5
         CY1hJkemc0Io6VHJvpMo1MXvLtZoin5ajZuG3sF/FCW6f+NLUn1tgJZ+PyUdxzxF7HG7
         OGOHfhe/b8GH5wbS3tij9rpaKdl7M5tLWmZa7rQRB8ojLjRZcdUVlCwYfDKeoFHMzNPO
         nNvdwICmBnqJqaz/Mx4O8ouhvA035aYDbUjHJSp9Sid9dmbtAp3i9lLhmvR3zc5wJwIb
         0JyNA2V1ALFm37DJZu4rbb5EojDMVtRCRJLe9JJsZ12oKfY9ZeRpBup0Y2KJuVN9LZ12
         jY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oD0SX+qNmhfrapVROd/rHVLulNY501VFTgteqW+bmiM=;
        fh=Vpn8uhkoDLykYZplqEsK1LumELHt/v1Ex+jNxS4kOo8=;
        b=Wanl+rP78y5e7XUf4zDnhXWKoA6MLEaRv7kTHBRIKGte3X+WWnUFw1o0LEiQFdlDf/
         BCE+2QqaDiMgZyA24/9CBtJYG/t2T43L30MyaVqZDLWuOI73f/Z1vj3H2KM9v3nDV/jF
         RPIAmrZR6odAFrzEp4ByiTfk7iLhH04JimANsDI/7s5Fb1iCspggHP6n71iqya2oQka4
         K5Xr+iwwwqccMsOowEQvCAZmsfYhUuTlA6D0KaIkTa9j2D28FdvTu40LWXKq3ytxGU5o
         49kS8sApD5ReDoMZ9rfhf31RMbcu8M8giFJeoPLu7ta53GwGrl7a5OTBaaKsjsnB4qx0
         29Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782208388; x=1782813188; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oD0SX+qNmhfrapVROd/rHVLulNY501VFTgteqW+bmiM=;
        b=MBjlHm5IxNJKQRcVOTsQYvN37BE2McB8GHKXOMu2J6b4GDUKw7q80sBftRCSavIWfX
         kHFkoGmSMEj+jVwnFyYYRW5QVlYizBmullTz7lbiXVmSlMsT0jIFNjjYXpzfiF9OVCcm
         /CgmDt1AlO1AmXkmwIGo0y1Xw9s0lr+W03QrvkhwfQzJE1+TEu55bzH9RjAhMMoI6g7H
         3RQA2thtDOisRg7HIVHz62YLSXA7tKJWRo0mUz1NK+E16mwoUdVJ+ShWuR0O2N/jTXH2
         a3L1E1j7ujSdrTYIhnLe5RAT024VovFBzMyOY2SWZ2l/4jebzIxmsTgQZbNP2jrB06SI
         xlSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782208388; x=1782813188;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oD0SX+qNmhfrapVROd/rHVLulNY501VFTgteqW+bmiM=;
        b=enAA1N2noi0S9dRLdtpNZN62AxTx4ERRFLVlBBDa7DbiTKHKTxdi5d+zpyACZQq8rZ
         KZa9Szxilgyzi5EeGqgQ4gOmo6qYrFL+8HYVK+9OQL2j0nRX+Cn7c6TyB98YKNuBF5wF
         K+wOP8OjS88P0FQSXmD/shOXZ/fpWrGbdGCuiHhe+kxpKcZ6MwQSG/RvNTc728R55QWt
         DcEmiStdGjHJrCznCH2CbS/HQeOmhEIkZILKylMcVI8rS+8vi8WOiQbeD8dCq7sHux0M
         xGE3Q4FhsEOnCtfhzDNr2WnO3SFFkgP2ZA5WO1OqOZL3PJpqQ9sKze3e0gb0cOnRqMvl
         olBw==
X-Gm-Message-State: AOJu0YygOLJZFgAFHq7+l+Y0Bd2D/5OphUirpab2D+vsd1gJFpKOOAqJ
	f5QXH0BbB+XshfLyjD9jyyVQVqhaQTIzj1W23DM6K9/igXYmu03cNUWxptTiDiOzR/sXh/WSi5K
	DlFL2+aGvxzAOfqCS7O8JMPKBl+Wj4uU=
X-Gm-Gg: AfdE7cmbcLOBk0HVnXbSFhk5EJIIIsYg2f048R0ny9XY+Q4GtH3Ui+Z6LBtI2CLLu79
	Yek8MrKM6bOwnet+fN5Otox2FViXq+Ihu+WaQ8DXtMAN6XJztEPrUdII49ow1jUCc9906g1+pbH
	fOYCYA2227KMU7W8Znyi2gBjovHXjwtemdewnaxl5f0cI6a15DhjpMdkWq4pfCqMkEB5iPHMihu
	18HeoctyiHhIswK3enrCt/ThB6m7kffG+fYEv5jYBqekaWStIiRc/OtcOn4xkxy70KxMurfJfAN
	OBAc9n2OE3tZuvUyeCGR5HMKADvWHjD+vTQpYqcB/e+liNuqQSOeS5ZAq8s5kTzLJbZk2j8kR+E
	F8y2VZI3t9xEJ
X-Received: by 2002:a05:7300:8626:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-30c51e0a9c6mr1347953eec.0.1782208388003; Tue, 23 Jun 2026
 02:53:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623093919.3543473-1-cppcoffee@gmail.com>
In-Reply-To: <20260623093919.3543473-1-cppcoffee@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 23 Jun 2026 11:52:54 +0200
X-Gm-Features: AVVi8CeV80fcldi_N9sbAOnQmjyg1l3bbXCp4cBmAtT1SPqIg-CTD7xhKY0n3LY
Message-ID: <CANiq72=sSkApehxg6eEpAoNU8zSsRAfqD+RVymM3UQGuvfKyeQ@mail.gmail.com>
Subject: Re: [PATCH] rust: helpers: move list_lru and task_work helpers out of binder.c
To: Xiaobo Liu <cppcoffee@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	Linux-MM <linux-mm@kvack.org>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 23, 2026 at 11:39=E2=80=AFAM Xiaobo Liu <cppcoffee@gmail.com> w=
rote:
>
> The helpers in binder.c wrap generic list_lru and task_work inline
> functions and have nothing to do with binder. Move them to mm.c and
> task_work.c respectively, where they belong by subsystem.
>
> Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>

In general, please Cc the relevant maintainers/reviewers/subsystems as
well as the LKML -- `scripts/get_maintainer.pl` can help there;
otherwise, you can check `MAINTAINERS` manually too.

Doing so here for you to give you an idea of how it could look like --
I hope it helps.

> +#include <linux/list_lru.h>

Since you are creating a new file for `task_work`, what about one for
`list_lru` too?

(And we should likely add the new files to the respective
`MAINTAINERS` entries.)

Thanks!

Cheers,
Miguel
