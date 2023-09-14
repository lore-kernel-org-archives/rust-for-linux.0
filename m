Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E6D1D524
	for <rust-for-linux@vger.kernel.org>; Thu, 14 Sep 2023 10:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35A30C433C7;
	Thu, 14 Sep 2023 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694686650;
	bh=b+9ToMIBM8x209Hzw2zn9JJCQXl0UcJ7K3gTTGzPZ58=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=OghSiJ4KoHHuZhGsXXQmyCne+9V/R/URtQC8IuWVJP8IEbd4eUYco0s+NFiNxO5ev
	 F3B8nyJWQazeaFVdByACzVgaQr01xeE6DCaeoZgkk+OLcu/WwxlOuRzm7i4R3KvX2E
	 su7N3SYd1AyYCc12kjF3lnOWPk2bfCypzRtogNWKnw10jVV3lYdL4IDkdKmJLZAotD
	 VnoWKWkuZVONnDQhwDL/LR3N21cZvi1GIZ2+p4lZkHzJoWp2bcMGZWa5BSJza7a9Nh
	 IPkRyMfZhdBgHhaN24k3pRdvtgQ4cJwsBJLiltddKnK4LjlEogMAkVzf8LxZpYmHOv
	 M7b9VbZAKW3tA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Sep 2023 13:17:27 +0300
Message-Id: <CVIKA1ZXOTK9.3G84PRD9KH12R@suppilovahvero>
To: "Trevor Gross" <tmgross@umich.edu>, "FUJITA Tomonori"
 <fujita.tomonori@gmail.com>
Cc: <rust-for-linux@vger.kernel.org>, <andrew@lunn.ch>
Subject: Re: [RFC PATCH v1 1/4] rust: core abstractions for network PHY
 drivers
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.14.0
References: <20230913133609.1668758-1-fujita.tomonori@gmail.com>
 <20230913133609.1668758-2-fujita.tomonori@gmail.com>
 <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>
In-Reply-To: <CALNs47vAj=dLtAUiG0WGKJoZZuWRCXF8Wh8zPO+O1NUJ68Z0Sw@mail.gmail.com>

On Thu Sep 14, 2023 at 8:47 AM EEST, Trevor Gross wrote:
> > +/// Corresponds to the kernel's `enum phy_state`.
> > +#[derive(PartialEq)]
> > +pub enum DeviceState {
> > +    /// PHY device and driver are not ready for anything.
> > +    Down,
> > +    /// PHY is ready to send and receive packets.
> > +    Ready,
> > +    /// PHY is up, but no polling or interrupts are done.
> > +    Halted,
> > +    /// PHY is up, but is in an error state.
> > +    Error,
> > +    /// PHY and attached device are ready to do work.
> > +    Up,
> > +    /// PHY is currently running.
> > +    Running,
> > +    /// PHY is up, but not currently plugged in.
> > +    NoLink,
> > +    /// PHY is performing a cable test.
> > +    CableTest,
> > +    /// Unknown, not defined in the kernel.
> > +    Unknown,
> > +}
>
> These can embed the C bindings, but it does look clunky
>
>     pub enum DeviceState {
>         Down =3D bindings::phy_state::PHY_DOWN as isize
>         Ready =3D bindings::phy_state::PHY_READY as isize,
>     }
>
> Adding `From`/`Into` `phy_state` may ease use in the future.

Just observing but usually in kernel patch reviews anything that
may have use in future should be left out.

BR, Jarkko
