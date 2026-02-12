Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3864435BDDC
	for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 13:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770903545; cv=pass; b=su6+u+pSmmbRkXtkyQPLNL2IoXMkediK0vQGIM8XNpMl933UVw2+oIC+AHDQVaE3vCtUG4DWSI4uBfnJFzfHvsyV9i/dgvMu7PfXtyb3/tEBd8CW8Vw1ESbGsUsuQDhVlc1ilmQjJGA7bj1eJtzhAxcnL0U/x+Ud11+pVLNt+iU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770903545; c=relaxed/simple;
	bh=QKp90P+Dc8pDTwE+OqIi6Hys4inEx50M9pXSa1Wb6oM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tya84B9FOWObtg8qfHQ1+TW0BXWLAgWvP0FoZa6vNw98GAwp7FJQ10oCTIwiRMWWDvvmeSzjACFEmp+zeWeEpucNOnmGYhKH95z5mxbj8ReAjmxyv8V0PtUYnqp2fEEEFLPviQPsBJutZPofKKMhN+D/CoSG9x3P1ksbbxNF9o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYIKm5tw; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYIKm5tw"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba76e80509so326198eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 12 Feb 2026 05:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770903542; cv=none;
        d=google.com; s=arc-20240605;
        b=kG8lHhPsZeOIae7NnTY9F6CaPg7xWP8wFlDhpc54y0/KDjTb1Njv1RBUWmzkmMw98T
         i62aco3KPWT9x3pESh0p3sK4mHNG6A+lARlyzyTkCqdrKVpbZXMPn8ZUh72R2E6JTt4e
         j28fSfUh03V9yNS7JXawCamWOUUkhxOVwESMorXTbU9d93dPMyZm2osS3zy1Mcpt6OiQ
         mQjobbUUOnutGpsKGfJLfYKzYGeE3WmgjiMSsTh4KZlqTQZA+c0DXCf0V3Z8oHZ1RZVg
         /V3U1G3UdxvohcF0bwAvkqXP5cCXsyQLAuZmLgEgoh/Rs3/ycXmnS5MBJJM3ecGWZYT1
         DWiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+pzdwIXepqcvBbqWx0mXLhZCkcugB8CcRlbmpxqmrsc=;
        fh=SYb11o/oqucszhxXYMeFunAUs3UDoYQTAbQn68bP/J4=;
        b=Ts6LdIZtaf528YL/6vj1lqbGaFxOh9DssCVwczwiKnm4GxgZTOu2/Fp56AY/ZXW2p/
         BQd9UvcRrOSAc7B6+/NNih63wKyRGfdOv6JOF2CkWmIlWMgvMP4T0fbLaSnmHPw5AEWe
         SYcD9dGo0ZVJC9XWqpRmVLi6MDdyczOo6WGh12Gu+BKcDYWNRsC8/JPOLGBxi6jLRAor
         NiV5QuFzNgfEmhIeLfs9AiX/0U/WfDUtLCeSZx9NCDKpa6VTODL2db92thS8Vjsr3RKf
         BARgkP/pC2YyeGCAqzQBbsodxC1s1LyybkRcBvGv/Zhi4GuRlFILUnLfpc1JozQL8hRm
         FZ5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770903542; x=1771508342; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pzdwIXepqcvBbqWx0mXLhZCkcugB8CcRlbmpxqmrsc=;
        b=OYIKm5twW+nzIK+fT+5Zl0Kh+pI0YB3Y4toJ56bqD6vl16hE52yVnC8kamkZ5q9d3R
         U7fI3xtstmzTdOm9VX1sXcoed6a+QY4VU1OnTnU/BJ9RtkTaYDNrkfacyfBdux7jqKWT
         ZwlGQFIgSZA8ZgW74/Z0/Zy5xV4fHeJVM4aY6U7eBOzdvwrJSTaK6vJdEFf+M5LpwGmt
         rxR3T72Lfg51QDwi2En0k+TGjXmcmLbyOeyUooxr9dwi7jocqgxegkCvPVlwUHpD91zZ
         WMTVhZsHfDXLQNQe8w5bvNq9bt7B4P+RpY4PglxgNSyprvIz4DQKq7c9VxULsys+ovss
         qjzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770903542; x=1771508342;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+pzdwIXepqcvBbqWx0mXLhZCkcugB8CcRlbmpxqmrsc=;
        b=tGUlOrHEIxmE66CaXahwC9564yo6gJU2ek16ON0Na+REtsbczEe51RXie7ineXFUn+
         VZaJgK6fL2NfAzaG51EjqdM4snNixhrxP/WW7t/dEATdzcyloN7JYh19qGu9ShmStNib
         b/kfi9i6qU3y2QRI5XystGbTO97fPYlUHs9ZDryjR6xq2WKdmfJzdTjUFE/SxLudFNTB
         A+1iyp3lC0jKH4EruQP4Awj/JjhDlths/r/I/3E7yg/qMUhu/3Mi+Yf9D59RwddDqfFW
         V9BQKc5Wr338neDp84V9JBrZlh2X2GpKj/sN17AIm8koPFA1W8IZ2pEkTfMij8v6JCKH
         dR1A==
X-Gm-Message-State: AOJu0YwNNl7I2szceQiLyxKZM2RX3DAYc1TltS8qyd7bERQWQnZ+pXwl
	85GiWh1QhiYxCsKM2Wt5R8PE8nEaUdyawfKvXQWe/OGNq1iOs0vs0HR3EzGP+KtxnymuNyR+hzS
	8MmgGtD7v3e4rK6S7qEYpdvPTZ+mbZpyhUPFUhqo=
X-Gm-Gg: AZuq6aJoOeS6E7Me+m4d+cD3WXLXdeMtZvw4rLQiH/vfMJdCUq/af/IC7CvRPd51WD/
	I9HSQnZEpAT/6IKu+LyiEA+ueg/6D5ExqlHADGj1B/JgjhYR0YFslCxJOvBnUKvvVCobQeYf6OC
	K/OuwjPpYz6+AImyVxiwrDTj20WFdjEItUmFtQ9K+I+g4lnmGIBKk81xfRevcRCKSu+Bxoxy8UE
	5l1F9RH6DUZNFqLoPYsqnroz6p8pP6VHelnCmOBdf4SN/oM6rXMpJVxPTCVcMMc3/4riqpq5iWb
	WxNPSwnouY1dT6L+ioXshHFrv0vLmL6vKT9oQWSq23immGsGMlJTBXgahdsQ55h9TMYMuEaCcOv
	TzMJe0CRrc+NhluNnMo2CBDjR
X-Received: by 2002:a05:7301:6506:b0:2ba:7526:f74d with SMTP id
 5a478bee46e88-2baa7e6fa09mr586903eec.0.1770903542165; Thu, 12 Feb 2026
 05:39:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260212125427.122362-1-alizainuimx@gmail.com>
In-Reply-To: <20260212125427.122362-1-alizainuimx@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Feb 2026 14:38:49 +0100
X-Gm-Features: AZwV_QiTnsLNBEFTRcINNpbOv01_SPlMvt37a8QL2WY4dE6pCvmpMcm6-AxJWv8
Message-ID: <CANiq72nQKFVVtGs1Ra22D+xqj+f1Xtc-2Xm9aitOuhQ-31o=DA@mail.gmail.com>
Subject: Re: [PATCH] rust: print: Document SAFETY invariants in
 rust_fmt_argument and call_printk
To: Ali Zain <alizainuimx@gmail.com>, Shivendra Sharma <shivendra02467@gmail.com>, 
	Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 1:54=E2=80=AFPM Ali Zain <alizainuimx@gmail.com> wr=
ote:
>
> Replace remaining "SAFETY: TODO" comments with proper explanations.
>
> Document why the raw pointer cast to `fmt::Arguments` is valid
> and clarify the invariants required when calling `_printk`
> through FFI.
>
> This does not change behaviour.
>
> Signed-off-by: Ali Zain <alizainuimx@gmail.com>

Thanks! Please see:

  https://lore.kernel.org/rust-for-linux/20260211182755.82220-1-shivendra02=
467@gmail.com/

Cheers,
Miguel
