Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1863CD8C9
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 09:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786613784; cv=pass; b=l12o/Qf2FqsD3HulJkzIvO7i3LtnbH2Pn2UtZmmNwUMqGyokjKFyIqGOdF3r1jZPuk4GGvnnEi0XIuXBJ+/ybfEV6QtNijEdlVqL35fW+HkYuXkHywW9FmGmOwcIxY2tXlA1Tmpzt73ZfPdkekhFLbW/w6ywMK87Mocaq3yH3RQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786613784; c=relaxed/simple;
	bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OgtKF0ZKCSe1O6cn1QW29arzqDxTB9UK9/LmVTbzsZiBHM+D4qYAB/HAfwUwasbg+6U9iGoRJn5nDP10Z8Utn5z7YyXuRpYtPDCNCv+e3+6BmK3JBzeaw0kP3XFccKvwS3irdNM6OrK1mKHI6Go0+paVmcJzJXdH2hNlwbVFp6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLY20tq3; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLY20tq3"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d319b84213so4105785ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Aug 2026 02:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786613775; cv=none;
        d=google.com; s=arc-20260327;
        b=mV3iPAHxf48DTQFg0PDSa65m6T6voAz0Et6fV8Z4jQ/Dz7sYwHZRimfNKUrw8M7p9A
         InfWm5O+oGj2aGM3BdvXdnyeAHF/2Q3lOBytldb7/JVy2s8I11dN9Ohac7HgaJM+kMap
         NHAAuyP6H2Dl22GyBNhv2AIxYowBcRMZIL3Y0p3hYdnGJntL/RhZrQtmpT67SifDMsuf
         Xb3uvOq3KBx8SwLY/1fOcQsOsNBtKmRUmXITuNyxehaIjuLuAcCOoBFl3d0N/vNGc9et
         tPJaadrgqt+eu4YTpR9UAkYPFYPCSTsNrMVcAodbNa42iLvtqKcf9CXagfkB8m3hZL+j
         ss4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        fh=0WRdxF97GMcHilsSozPA+ZHCGUNE/yyecNtGw6gk/Dg=;
        b=LjE3drUJrBxn0clIr0E//F8LhxsD3Rer/JS4qYgsYOO7ykc5HTcjRodkIWTG/oqOVP
         ExBMK6VfIB9HCf5ZqqANtzHKy9tKe7202iJxImj2tV7dnWVDsuW4dK2kWFtdAJnND3pJ
         fkry5Xn4y+wPyb8+DFE1Ic/RRLapmGEEsIbWicjNZyttkG2tyBkLAurm5nIHdeN7GsV8
         C2TJT6LZKBldL/y4P14HY596rsaXHFYUNC16Cl70KUQZ+XqMhyvvp1aXlWZgLDQPCY2q
         Aa4IXfBlzZUOA/j2T55+PCNins0RA73siT9ehGxTpy9clcs947YbH6rdibPyf/lb6fiY
         p/Rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786613775; x=1787218575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=hLY20tq3DTzgOPpU2TWFvqupEvw6BZf9j3keoSE+Gba2EpwLBOoPs3SQcPLdhbHOQd
         av4LzjQ9lYk8iOzG7fbP90+/67JTKwJKjagYjTnyBsp7LINLmDMXAMkvWpmAAwVUvpVB
         WOEJ5hPHiPAW5JflzYC087QtbgUj9OaqQKBUyQviZTqRro+AWpjLp6W2TORQUC3zlftH
         x00J3FqT8MvEhq5XipmwYmYthJ2Z4yrlDkTn3YRtrL9UiuQjU016jZXv5tQqSGMfeB1W
         CUN6JmXZU6P23klRsBB+8cEq/q+V2fmSeWpK4LPNLpfnOwggw5yl0cHmhsqlOKZT9DAk
         1v2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786613775; x=1787218575;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9h0QULojzau7syX2ptB1YiILa8mj5wKL7cDn/JLX6g=;
        b=b6qFrA9Z4qbd3HLqVDfnhNJyN90kMeqRSmZFyA8krvrhQyfypllPx0/cMjlWxh5Z6+
         gvBNtc286ghxyj4DJTVjh22CBeuk6SnPuNXolSHBd8+U2sMEfT6i4+BFceCO2q9LrUlj
         Y7mqnlIpN+EhUGC8LPoYny3mAruSOWXCYYi0ZlkvOuEjLldlA2OpZXn0BTiDZTjKvDox
         4ZuX4aDtlFYGy5fokUIJ3Zh+EWAL64YHVD+XrmN4P5okEwp3BEK9AwytoBjb1uKKycXK
         4CMQ7pdw/MZ21qZmm4BNOLw1atYtsl0X0nuDURGbzRhFieWHj5qI5XFhXiErhid2et1/
         I7iQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjrLZhaM3aIJFM55UZY4xBWYxeoDKi1s6bycF/86Ub/jn3sW21NszdHhR8sPr9J/EyX9K/LvNYYR4MSZPFVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HpVwirWtHK5GxXXHwSHqDXuh/jpZv6vug8c20M6sPPTNKJz6
	UZtrdEd3gyjbGcRCZDsVq8+Hz2ztAIou9mN7XpgyFV+enU9WP2xhvKUsNKvyMY56Nj7RcBhXa7h
	8nlhFym6akLph2vW5GTQN6AsewzRuJJ8=
X-Gm-Gg: AR+sD10Db8A74cvEdrl38gjOu6i7VYGyJHvoSeugGwxnuJIhYD/1jiyiA9UyJadU6Nh
	Pp7NjfNHIQEiMHGsCwbRe1GTROwpwhQ6IPIXw5b5LVwzqlvilONsqn/4cUmMI2sqPIIaI6KjAWY
	cTFZSpoQc91cWz4Wb7B32lf52EeyHegTeZ6QvgfHhR5F8jpQrhMNDD9WJrLcrxLUWj7enMX0PPV
	gNc7bXY1p4hvUmdxn3VnpP3Pg2HM3NzAvg56loX9SQJbyCcuaxZWs0GipmJ5hPJY4fm4Vh5hM2R
	7RoWNpGBJd8lvJDNhK5fMqTHLq6P4nxUMDBJjPkDCMlt3LHg9bEQBoOV2AINN2tQvQyGtL1mjKb
	GxKal1MslPkMO9VUQzihwHnH3grZ7xJFgHjY9SgO66sQ7kqv+Im22AJMzVoZLTkz9qXtOAoc=
X-Received: by 2002:a17:902:ea0b:b0:2c9:fbde:ab68 with SMTP id
 d9443c01a7336-2d389b9107fmr28401875ad.3.1786613775343; Thu, 13 Aug 2026
 02:36:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
 <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com> <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
In-Reply-To: <DKNAS52KYWLD.M15VEC6U0F6R@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Aug 2026 11:36:01 +0200
X-Gm-Features: AUfX_mydrO4nx0TADc_1KF-ELy8K1d4zi4yvOYINpS4bHvyjdnsvoZ1CepMueE4
Message-ID: <CANiq72nR3K9d0Y--FyUm1yAkww2LaAuYQZ3yHXjYxxfztgMMYw@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Danilo Krummrich <dakr@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 11:53=E2=80=AFPM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> This series has a semantic conflict with both the driver-core and the drm=
-rust
> tree:
>
> @Mark: When you merge driver-core-next after rust-next (which I think is =
the
> case) then you need to include the diff in [1] into the merge.

Mark: in case it helps to make it clearer and so you don't have to
read much, that [1] diff still needs to be included (i.e. the rest of
the discussion and the commit I added is independent).

Thanks!

Cheers,
Miguel
