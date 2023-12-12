Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpuXCHvd"
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24D6DB3
	for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 15:49:11 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5cece20f006so63569967b3.3
        for <rust-for-linux@vger.kernel.org>; Tue, 12 Dec 2023 15:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702424950; x=1703029750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uAe6v/6ajEq/cfJA2eiouX3qGXzQ9dbNsX0V2P6TM5s=;
        b=fpuXCHvdgxU6x+4Q6FykdE1VIDMl+GoKBrX/jITKaHEvpdkE3I+DwXjldufUkpR023
         Ayl71rnMer+zdxFcMGyvtg81p8PLILh+0l+x4NODX8dGcVdwhbrQyFvh4PFxPYZ2fkBN
         oKcFsTlIHw55xYl47g58XKeW72UAaT8mJ87dypdDJzIwcyz8QoHP1aZaC4sApWMtb9uf
         Dnx1v+NhJdV0wAyHWHacq0hH61QuElFdQPFZZQcWr+xiWoQNRg6ozpgYN02giLjIKxg0
         tKpTJLc6JrsIoZVd/P5biEJPKrUGIh0CIfJdUPuNOWuXegVIe4OxjQq+kV6nN57ytYPr
         Ktog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702424950; x=1703029750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uAe6v/6ajEq/cfJA2eiouX3qGXzQ9dbNsX0V2P6TM5s=;
        b=Dcn3PKpZ3I6Z+9hktnVeh34Pn4wF3Ntd6QvpGro3nXXsehjcpOSQRBVksKxvIQu9Av
         VW02MPExOXGgue6oH6/LP4FCqKftdiV20YHQ/sIUhi3FjdrX7+7zsyj52P23g7MtE2BI
         Yz9qkxJyxU6ULwYnl5FI+FG2XLER0oWls3LV9CyQg/0piJzJemDPccQHQ/SYCewYAOVd
         WxjwMs5Svll1oG2653S87X3ACGXMcEqBsUXWnacLJLuSeuf98fuSeGn5BDlBm0SCqwMp
         36ODm0AlgBeZEZf61JHWO1vVy3eFVIA+vFpM39PmpbXQyWLakGstcdA9FuFUjjBes8+B
         3MZQ==
X-Gm-Message-State: AOJu0Yz9WcUMy4RBBIxCcdAyf/2kO4gEM9neElVyAN0lqKmBDaYf18JM
	wekVkngj6gAF+A2XBELNV2Yu1/63MfUHKxY2CQQ=
X-Google-Smtp-Source: AGHT+IEMsky3clCO7BY4/HrWgvkRv3dBHhlA20tIPmPwgYx++ZQ3oP679Gn8faGTpocQOk2Onyyb4FntR4VY5Q0IOBQ=
X-Received: by 2002:a81:77c6:0:b0:5d7:1940:f3db with SMTP id
 s189-20020a8177c6000000b005d71940f3dbmr6091889ywc.67.1702424950276; Tue, 12
 Dec 2023 15:49:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com> <CABVgOS=6Psq+BYET6o7KdQhKRP3A2wbTf+smAb54s-a4X--8kw@mail.gmail.com>
In-Reply-To: <CABVgOS=6Psq+BYET6o7KdQhKRP3A2wbTf+smAb54s-a4X--8kw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 13 Dec 2023 00:48:59 +0100
Message-ID: <CANiq72mNwVZN2ZUnN_6=GyUN6vJL=_yRgcryN_2qbEooE12QkA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
To: David Gow <davidgow@google.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 5:36=E2=80=AFAM David Gow <davidgow@google.com> wro=
te:
>
> Maybe it'd make sense to borrow some ideas from that and create a
> rust/.kunitconfig file so we can move the --kconfig_add CONFIG_RUST=3Dy
> (and any other options we may want to enable rust-specific tests)
> somewhere.

Yeah, that may be a good idea for "core" Rust stuff (I imagine
subsystems could/should independently/eventually add Rust on their own
if they use it in any case). We also have `kernel/configs/rust.config`
for Make.

Cheers,
Miguel
