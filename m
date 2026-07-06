Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8F548034A
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jul 2026 09:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331150; cv=none; b=EJe/Gv896SJ+NL8PDNbn6MokEnGXB4CW35ZKcWnYxXUG9gsPZ3i7NafQ60O8VrjqQrDwS6oaZ9TmSAAji9qPbzHBhUCsSOMNl2nuFgVtrsdrGwWFcdkLK0gy1ciCAgDZJ9nwLVn+2wm2Zbxj7GbhqDlxgKJLDp00z3h7IOpGjig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331150; c=relaxed/simple;
	bh=z4ME+i1zwbwk/OvLpxkjwkYtIu4Ubp7pj7q23hgveLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DrNr5++c207YAnPGAssR02I1SO1PAE2ZtcpsG7/5vc8MjUAAUTwlUJ855oIQzDnZ07W7OHVGuPuGuyGCK8KNmYe8CMK8gYsi4xojtPg7gsfIRTpRl09NbagE1MUTYeKzh9uXlRHGFwvGYQpiFtFQLk3hcPPYAES7nCvjoWML73w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cbDdMPMl; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cbDdMPMl"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2375969f8f.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jul 2026 02:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783331142; x=1783935942; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bfNeQMc5HHOHbeivRIaOAaMk1zlvUrisd/hLb6wkCKs=;
        b=cbDdMPMl+Kq8222YH4wo77Fiyxnrq0vd0jsudkqQ58UaonzsAKg75/hhRsQjK65BK2
         MruVztF+HPdb7KsUczumHe7tQssHveCG/LourN7F0j2RdgNMxVbHza2ttF5RPY1PNbGx
         n43VxqKoUxE8nlv9IHfAHwUEH9V3T/HC6qPO67OLQysNXsb8H7q4qZ9djNM2MN6i7A28
         iEpJFB7nQ/2Hr4c3BjXxDw0Ma3HDchvt3l56KmrzJmsSATUw5oUw39FPBRFz+Vg8eccE
         Dbv6LqANmhAAOFFcJtK/ayy5F51NRZLNI+tRr0mwvutzuIF38XXyc9MuAht/IyMbl/z7
         VB9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331142; x=1783935942;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bfNeQMc5HHOHbeivRIaOAaMk1zlvUrisd/hLb6wkCKs=;
        b=KyfaqjG7eH5meEMX391aGTrEH5AC8HYTMIXoYJQWfkkSI4zX8Qt5QbE2bimlcOjI+c
         Rw/bFhNe6LsJr5ypYNkkf4S1M1/ZS5O2fTnBu0spAHxg5+x0nG1dTQc2Y8NsbIH0V1oT
         tyi1Ox0x2xPPRgKxrVtP3pgs1BKzBUmjZHPGTkSS2I6/KDEOd7pvnXnURBapBAudZP2H
         ef3bBbNwiRH2J4v7q6ag0FlhLHtgDzA6GT7kYy93Y8YC+cOX1s2UZz60vvY46AgFGJG/
         /PWuexs78rKoPtE0jCd18qrZlgZUydz63t6vxhSHtXNAQeKXBI81Omjv4uZoMVMLhT9X
         xM4g==
X-Forwarded-Encrypted: i=1; AHgh+RrrM19khr+3bpMPWr9TnsYU6KC9soxCkB/nQa8ZPPjYvK3nhWdYxI8nq6gC3S/geq+P8E4//UBGn+p6r3w9DA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3wkYBdwaPA/o2D4gA47lIrB0dATGFSAvK5ONZMZzzmNkVAA4o
	pbl5s0dokpBhTvnqmSfvayMytN5QcZ5/XV51aP+8m4LHujdyhh3ZZxny0kkU674H3Pc=
X-Gm-Gg: AfdE7cl1LP8BanFBJYvtSLJaF1k4wXV0seJHjCsjEr3cZkQdp0fFgOuJugOfGMJxvvQ
	JjF5Xc0siamvyHM8lQAXL0/qMUPC34RVrPpTLJePfCT4dQayV9c+NM1AFC/Ov56bdI/sQ/IExPu
	7FKkKmII3UymSG+X3+ypgI6GjuZ3eX0wrrqX7NcbXNejzwePcsz/f92ULL0va1EvsSQbd6P21Zh
	GsE9uZjqLf5qS1uWkZ29siXxlKSQVq1LsSEgfUpRug+dzRuG3jBhrmJcK44GE00Kc6Ojpl8uNpG
	l6gv7eBQFeAiTkRcVbpz644F7ogFPtdVXRwB7XFRvFqQBpNSYFELNMUP4YaqBgmLpE3s2AiHmtt
	ft9XfaN+YUxw9ifkPryTbLxbDQuBNyccd+5/rPo2eZbkNoVe6YCYUVnLsyycOBBWK31bqJAQD7d
	b22dEB7lxeo2HgasJY6svgt3ZGFXcFcS73f7rSJDBYJU6gOt728F7lKlg=
X-Received: by 2002:a5d:490f:0:b0:473:b63c:8a21 with SMTP id ffacd0b85a97d-47aac2095ebmr8664733f8f.18.1783331142538;
        Mon, 06 Jul 2026 02:45:42 -0700 (PDT)
Received: from ?IPV6:2001:a61:136f:7201:4a82:7cef:c61f:a3f3? ([2001:a61:136f:7201:4a82:7cef:c61f:a3f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f213e8sm20582902f8f.34.2026.07.06.02.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:45:42 -0700 (PDT)
Message-ID: <fddbeaed-ff21-4962-b09f-d975c96cd926@suse.com>
Date: Mon, 6 Jul 2026 11:45:38 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 10/11] rust: usb: keep usb::Device private and gate
 transfers on Interface<Bound>
To: Mike Lothian <mike@fireburn.co.uk>, rust-for-linux@vger.kernel.org
Cc: linux-usb@vger.kernel.org, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Daniel Almeida <daniel.almeida@collabora.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org
References: <20260617145946.1894-1-mike@fireburn.co.uk>
 <20260703030020.2694-1-mike@fireburn.co.uk>
 <20260703030020.2694-11-mike@fireburn.co.uk>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260703030020.2694-11-mike@fireburn.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 03.07.26 05:00, Mike Lothian wrote:
> Address the v1 RFC review (Danilo Krummrich):
> 
>   - Do not make `usb::Device` public. Writing a `usb::Interface` driver should
>     not require naming the underlying `usb::Device` (cf. commit 22d693e45d4a
>     ("rust: usb: keep usb::Device private for now")), so the struct is
>     private again and the device-wide transfer operations are exposed on
>     the interface.

Hi,

I would say that this is just conceptually wrong.

1. drivers talk to the common control endpoint of the _device_
not their interface
2. drivers ought to be able to set a configuration (That's a device property)
3. Drivers need to be able to claim secondary interfaces (we have an API for that)
4. Devices and links (and functions) have states, not interfaces.

These operations operate on the device level. Hiding that fact behind an
interface (which may not even be accepted at that point) is just a layering
violation. Even calling a device reset through an interface is strictly speaking
wrong.
We even have a driver that can ride piggyback on another driver's interface
and use only control transfers to endpoint 0.

This patch is fundamentally flawed because it operates on assumptions
that are just not true. USB does device level operations. Just drop it.

	Regards
		Oliver

