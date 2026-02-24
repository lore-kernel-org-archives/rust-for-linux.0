Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C921F1304
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 16:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771950210; cv=pass; b=BPdf2ROwEnaZ4OUdsK6IfwCjWCeV7u1gXOjK1MDhRZHfwxXDOItKgY+1ImNddTWA03kQYL9hbidgZFJ+QS2kUl/Qc+WzU0G3v8zUZXCmNpE07PVEEg6Q6KzVJEggk0wbhN9coHZPkysYSnys4+07iP7v+ZYt72dHfwl/HUWIU1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771950210; c=relaxed/simple;
	bh=ZqJufl22SDOPAyHAbjNV+mtVnTAnC3F95iDjVkPYjsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kQo/bf5kfp+4rdenPeqlms51w1ZZleJHFr3A5rwCB9MnQBOjsOf/KpfpP0t+CAG1D3RFe670zz6xFJtPNv/QQRO1IFGl0mlYQw/+1rPNDb9rL+Ko+J1pZ5IJP9GlFsHk4XC6DuaMl4RHOgnqW4hX5NT/8WQrLOUOMTmkwlTHd+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NfHhBxwa; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NfHhBxwa"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2baa1ed79b0so198832eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Feb 2026 08:23:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771950208; cv=none;
        d=google.com; s=arc-20240605;
        b=fffVaZAUz47Nft558tpmSYhm4C2NKacsbM2EcWDHpBkBNS2IZcbznicvd6yX3zqvgn
         OHVtQSRmGubSLSx1Ai1S49LUmRJzEsZ2oOFTWOrU8AJ9fUu6xrhFXeZdEI07ClqMJc+t
         M6qYbdn6JJtcs5JZXQdFKu9ezhGJZ6iV2BGVKkJgYQs99OZ1PRY9HX46G2z1XMRcc55u
         LTZjzAOm/nuayl+T9US/G8e+bU0njrMSvhGB+4iksZkQ9OjIIR9Kv3YceEuNj8NyXvvJ
         FeX4QKGkJCwFeyoZyNZQ/ymS/lVCisoQZa6Ev6m7I4mXDMQ9Q4bRGBVlI6bUXiGzU37N
         Ei0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZqJufl22SDOPAyHAbjNV+mtVnTAnC3F95iDjVkPYjsc=;
        fh=Ddk6pfycgQFmrhU708R94zIdaA//UxuLlIu9Fb7DFF8=;
        b=cvT4jFc8pWRJnOdBWB9Lxl0H8hx9f+E8iSMQ5YNcaemcL1mmx5NEKul+yYsp8otnIq
         +XvK/W0ubsGgj/l+TWkMSwrzKqOvjgRdawsoEAYclULDNW182+g/ayJmcF3AMQdp7Ypy
         rEPu4r77j0eMVHZTfL4Utem4yadTzN76BdFdRTyzIXWp5z45exXnELDLCB4LwDv5SUPT
         BNcumJE5jlA1mgUq8g8+hq6cpRnRAZaLFUhcxbreaex3Fv7H5O+esX0Iq+d+g6HiNdfp
         fYOtp5lBS7MIqDdNIx41VlxslvAHgHp9Z8JBle+k2BC9a/E8u5c+50pVdubeus4dAbEU
         VAGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771950208; x=1772555008; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqJufl22SDOPAyHAbjNV+mtVnTAnC3F95iDjVkPYjsc=;
        b=NfHhBxwaHqxl4hP4LhBuPbhxDtmpiUFDuF5vJRhyFz5nkOHWcUGkUm5MX9wTLP0seS
         GJ8KrR/HdE1e8GbmYgRb02OmbqlXHHSdRM4WcXsysG7svjxujS5yIR2K9DqfRXtKORVb
         IU4/zVkixcIXv9DqCAYhKaQ7d3zdGMJAfNwCDvkvotzDm9yS3LlLkeY3BsxT5Bp2nOsf
         bmKZiBAO/cyIW6Y+sBWEDKvpaXzaixEvOyVU5AbZrbif99YUrZau0afZWmQiXKFuXZrr
         VrC8SELGZwndi17J9h79PV/iXdD39izMmg4yTxXleGzGtm5DtnpHZFzEvZ0EZje3h7YW
         Yk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771950208; x=1772555008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqJufl22SDOPAyHAbjNV+mtVnTAnC3F95iDjVkPYjsc=;
        b=sI+LZ0gP4x/Z2NaQuSfC1xGR+Ji0xRWjMMA9iXNZEPDR3wADpuMgOwZUrE1wdH53K/
         ya35HiKOPq1TM2rDFt3DFLjA50GkuAhBRM26LclEq4ywqaXjBS2Y2KVFFFu082sICqRj
         sz1g+W81fJ/PzGR7BXUFbm6UjPvEK6zRwKkdyRpjAAeVz9z8Ucmc5rMPV4Ipo5MBeknF
         QYba1oDnmG2G2mcLJ/RPBGudZUFaNCm5vhw58AXDhn6PTIJx0e+2a5LYEvaAr734eaJ2
         3sO3ejkJCK/5633XQNxEuu0ZvJ4+aalO4jzhom9U7WpR8xNYe1Z4RFejuiJafa9sxzIO
         YYPA==
X-Forwarded-Encrypted: i=1; AJvYcCXQv8j47CbC5V7EcC8DS8cBtShM/hZ3YN46z5JrYKpny+V+f/xON4SPdD1P8r+JI8qtWtJTfwJuc9ipbq1G6g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOXK70RR8+kjUOYHsYJAzDlcBN6LSKykbhUZH6vpuDFQSYiHS
	qmWJFQx7/c7rQAT6GoBsR73C+4JbK5UuLnoBRK/bFKNhgkqjl9U+TC/gmLjF1IO6cgpjx1SMbdt
	f4mKv/cV4o/pz4dDo37ZZHtJRWeojIcA=
X-Gm-Gg: ATEYQzy5ZpM/LQhnQH4JQdLNJ1crlwRe+7/Dr87xsmcc19leehOLGBtNOJPDbXwKstT
	uj2X+Kk+u2VyJuAVYxpwxUws4etfm3tihxajopkuC6QXe0LVrXZXk/GFS4PxO4PwZcS2+UhqQxM
	xi93HV9sjUJ6fb4cklX+0XZ0xnIyQBFjWlwtIAZa1A2a4OrSFALKX3IHD1X0yAWLbNScxy3wztu
	SJDPcG+qj8/MxNzVnIMZsl1QhABH9g37RcqExe5uarLr+ZobJVz41PY46E5JyJKRh/bDTrv3Jtw
	J+tNj4ksNUgHfGSTx6rxz7y88/tR92akRmzcwyWVGBBSM2ZJfgWHkyW8KsPV1pUNBcWFctQ99vz
	h5TVD8ulNnPDhHLANO/qxvEw3Qv6A
X-Received: by 2002:a05:7300:dc8e:b0:2ba:7013:2b94 with SMTP id
 5a478bee46e88-2bd7bd5a668mr2692037eec.4.1771950207813; Tue, 24 Feb 2026
 08:23:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223220504.2102-1-iprintercanon@gmail.com> <20260224043211.1747-1-iprintercanon@gmail.com>
In-Reply-To: <20260224043211.1747-1-iprintercanon@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 24 Feb 2026 17:23:15 +0100
X-Gm-Features: AaiRm53w0bVWON5EvGEnE-QSWW26Y5D2UjioC8X6mMuMoDlaoNudcBlKEg6cgtQ
Message-ID: <CANiq72n9=xwb+HVkSDc9+6HGQA0-vw46OUHJ5PouhGgiFbcYBA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/3] net: phy: add Rust reference driver for ET1011C
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Trevor Gross <tmgross@umich.edu>, 
	Russell King <linux@armlinux.org.uk>, Miguel Ojeda <ojeda@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 5:32=E2=80=AFAM Artem Lytkin <iprintercanon@gmail.c=
om> wrote:
>
> This series adds a Rust reference driver for the LSI ET1011C PHY,
> following the pattern established by the existing Rust Asix PHY driver
> (ax88796b_rust.rs).

It is great to see more Rust code, and I am glad the "Rust reference
driver" model is useful here. But reference drivers, in principle, are
meant to bootstrap the abstractions and so on. The cover letter says
"following the pattern established", but the idea is not to duplicate
every C driver.

Since there is already a PHY one, is this meant to bootstrap the two
new APIs? Or something else?

Of course, it is up to the maintainers, i.e. if they want/need to have
more reference drivers, that is great. But I think it would be good to
clarify.

Thanks!

Cheers,
Miguel
