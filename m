Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C589335092
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Dec 2025 17:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764608965; cv=none; b=otlj4NsaVOv7gtRaSuxzjmyz0shIKTdgKB3VgjMRL3+CXq7wGfvUuWBMr9jPWHShsiLWPxodWsvhzhQdbOiQXQvjE3rDE+VdLwwznhmHgCsZNuJXAiGyfBbj+8puf0Xh8F1wucMyy8x1sdLHSv+2Yj8XyGc2mMI/1W5QPi4U51c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764608965; c=relaxed/simple;
	bh=iBbiUzvYi/ln13SU4XKUqRn4bX9H63vGL1eyD6pfsfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O2MxSN+bT0TvQtDIo5MPyLC4+YEiUkTIH9LV+PrJpt132l/Qq9Pak5Uw5ENkSIPKq9RxoLixUG0Qg6YYppjLzA/H4a2vS8jbVGeC7W8SajKla+A1cL/BiGqfDpfF6x3nMF2Qvb0wJTPk4Xgzu0/8Pxl3x8FHsnMUf2QBauq9T54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HC15yTDF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HC15yTDF"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2960771ec71so8909645ad.0
        for <rust-for-linux@vger.kernel.org>; Mon, 01 Dec 2025 09:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764608963; x=1765213763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10oqy7XG0ziR1jN7iIJoYu4N7Sm/NTHUpb4SiggOXnk=;
        b=HC15yTDFMPAT0Lb1MqdcRSii4KackGdOk4+mnSLFKvQu0v3nYYM0yymTsluA866K0g
         4wPZylYTIdvo1CrxrAEL4ajRaxaaWzButBecL9BjilU3/dhFAtW+rojUu8vCC6Yl5zsX
         BLsenFBgxhaHLFtQuVHpJO+eFAvHVAHZKnAM6STfeELlh3+kopFlC9AJHQmfN9YvaXOK
         EYX5i08LaZ1RO10SUaY6TrqF+SiwDI4iUDzElt/WUX6WEqCTYSCqHWt2H58UcW3HLowI
         DTiRX73GhsiFHjfZHTHaRofvWJxqezdVthpcMV7iFihXwXRktd+rLkQb82BU8QLr12Jk
         /EMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764608963; x=1765213763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10oqy7XG0ziR1jN7iIJoYu4N7Sm/NTHUpb4SiggOXnk=;
        b=YQPl1ROmQHEWsmUdeZqMyMYn3ml6Odj3yertPs+bgpRsqhLnBvZR1SqMjd/UA2lERj
         4Ak5nDrNbWfzFyEpXVAyjjbT0yLzjuersD/exmB+NvtYb7bGyGAW6Keh3eCj49OoPBim
         a0kqDxBKZ8QsWS7MECl6IVMUJmy1mUFT3Vauob5M4WnfL31ajnM/oiDZ2o8kqjOYXs6/
         LhrKOvWI4z74eRyAlHwIw3ZCn2pM+eZsJLo0p+Tof+/KGTI9TFJgwUBG1WjYzC8tjKnb
         Su4RpNJogE0tlZJin/WVS0/o9ykUz07ZKAFuEpigtvFwLa0pg6+J8BOiEm21AwScXl2c
         LKLw==
X-Forwarded-Encrypted: i=1; AJvYcCUjs4KrjiZ8r4a05oaGfhRwvdLfNXLKOdXMGdSmBKxcgvS7F4rsiEfSc3cvrxWeKXtC7QoMvjrnkO1OGaVScg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxscIl5DF7iXkLowFsFs7RMR9AAzLct8kbXfUR1zugaYZNVjWmE
	eX1e0eqmxyodZuhRrfEPZSW1vCYfN/0mP28WUtRaM9zw8va5FZPrwSN5pk5f3LEj1ZjsRlsih8Q
	0YdA7bDv+coPd2c88qdebSqyrR0wWOjk=
X-Gm-Gg: ASbGnctwGUeJFUeQb/QUqrtZ/Wk6fXVSaPIUZ622oJY7Y8rVWXKgl+9+/OUlxEkjfQu
	z7gSYyya0C4IeOEl03hzRGPPCW/hPaP1COhvaGAwqSYQzgBNq+52YMI7n9jH0yXxUVuv7LYE2+i
	YbEijfngayAU9KDfeModkZNrcdIH/GNw4/czRSps6C/JvweTisz2y8uxTqseX1bc8p65vWpofLU
	OIblsidFiqJ9cNr0CmZuPyN9MZd30QUrgsVGpCALyLOJ90ev43ZggZ4UZrQHjNMYyIKN+FFDq1C
	jQEWhc9fxfVFbyYERJZGJncLZSXvmPZop13pB9K1z275wvXbeLpx5ZtRsdFQly9xVuESh2Dwa9G
	4hp7MHfwzSEM00g==
X-Google-Smtp-Source: AGHT+IF1YPYGD/E+eDHxFkwlvTUf8jqG51M5LA+tdLWxMqHx4a8yCVti7p4nga92l9CsKYM8VN2f66dz5zEFbxtTTgc=
X-Received: by 2002:a05:7301:e24:b0:2a4:3593:2c07 with SMTP id
 5a478bee46e88-2a7243ec7b9mr21959223eec.0.1764608963077; Mon, 01 Dec 2025
 09:09:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117-unique-ref-v13-0-b5b243df1250@pm.me> <20251117-unique-ref-v13-4-b5b243df1250@pm.me>
 <A5A7C4C9-1504-439C-B4FF-C28482AF7444@collabora.com> <aS1slBD1t-Y_K-aC@mango>
In-Reply-To: <aS1slBD1t-Y_K-aC@mango>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Dec 2025 18:09:10 +0100
X-Gm-Features: AWmQ_bnmy3Os7dUuxEXbA4TScnRqySjzLSX-NOnwmbpPdF9z2OcK2znpi-34sDw
Message-ID: <CANiq72=mZXc5+fMzsdTRupUsmsuLdsx=GZucn2MNoCTLAT1qkw@mail.gmail.com>
Subject: Re: [PATCH v13 4/4] rust: Add `OwnableRefCounted`
To: Oliver Mangold <oliver.mangold@pm.me>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	Asahi Lina <lina+kernel@asahilina.net>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-security-module@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 1, 2025 at 11:23=E2=80=AFAM Oliver Mangold <oliver.mangold@pm.m=
e> wrote:
>
> Ah, yes, rustfmt must I done that, and I missed it. Will fix.

Strange -- if you noticed a case where `rustfmt` wasn't idempotent,
please let us (and upstream) know about it.

> Not sure what you mean by fictional function. Do you mean a non-existent
> function? We want to compile this code as a unit test.

Typically that means either using a (hidden on rendering) function
that wraps the code and returns a `Result` or directly a doctest that
returns one (better, when applicable). Please check other tests for
lines like

    /// # Ok::<(), Error>(())

I hope that helps!

Cheers,
Miguel
