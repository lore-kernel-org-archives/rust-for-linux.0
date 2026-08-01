Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3AD3A6B76
	for <rust-for-linux@vger.kernel.org>; Sat,  1 Aug 2026 02:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785551013; cv=none; b=MqidLwHkyP53CVilc+0WjCUADLeVgpC8ALErzLO/qroiuF6g4dc9RsDLva2bumuqX+q3AvIAyMMYw3UU+cds6ACJuX52rIo4t+aT7l9vAlAX6VwfUHENu9snXnR57owAIrCNfPwxTWm2yE/EHuzW9nJlvsrMcp0zV2YP1+m/zjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785551013; c=relaxed/simple;
	bh=rPf3/79Ct9yT++Fk2GOpTyZMRy9tMo2ywlH0Xw9EJ4E=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=F+2VwkmjwQegbLsT5IqxwbIYqoH9k1BjUb4BbZRnz+lTs47mouPJjX1r+SxpvdDFzydUsLfT5M9OvCTZzD/ymT3yl4zELaSxFbKoXelErcLBGRCYut0jcMQxWC4W7/dLC0/PPFUhwuR8n34uQIVGqh8iPxGHDEuk37ldJp3atOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com; spf=pass smtp.mailfrom=wyliodrin.com; dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b=ess4JQCO; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyliodrin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wyliodrin.com header.i=@wyliodrin.com header.b="ess4JQCO"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47de008b020so1166609f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 19:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wyliodrin.com; s=google; t=1785551010; x=1786155810; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rPf3/79Ct9yT++Fk2GOpTyZMRy9tMo2ywlH0Xw9EJ4E=;
        b=ess4JQCOPWuJyHzzNFCKEGx2grXyfef7H6f4Pb0Qt3kGPKfFltVEKMGSz0DBakiqgw
         wuQYcRpATaKBr5eHsfdcuf0Qh2aGYfAqOijHhUHUwAgNJ1+AcI84thJiN7b6W8qiH82F
         mfUcWL1HevNwb9dBZuKIKOKMs2cys3tOWYYjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785551010; x=1786155810;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rPf3/79Ct9yT++Fk2GOpTyZMRy9tMo2ywlH0Xw9EJ4E=;
        b=Jqx0VTQ+FNIKhdMwiz9GfVBpiuiy+/I0eluxk3VXyC3yx95GpiiyPjqDslUS1cFBsp
         aR4ouFS/xhl8l4RWF8EkEkT/gd6yP3vvB6AcuXs/KbSU1Rr1XoUz7L3NCaKi9+55Jt8k
         +6socQQ/E5DXQ29AwwxCi1JpBNvFSmnAZot1JOjhTeglRMiwBr3NftcG5EwNiiN2z2KF
         pHJGMAfJbHYiKDv/JiPyLNBFk/TlBya+YsdLMuL6rONKmDtaZjrW23wH39YiwyzIH1lY
         aDWsfBMJoO0qOEyDDQh8SdSv+YWh279CZHC/kEPLnduuHqZn0uXmWc0d5E7ym67y8EnI
         qQpg==
X-Forwarded-Encrypted: i=1; AHgh+Rrh0Lg/JJJkUU3BGMIGimt8LHuay16CJooq28K3RVcQN8o8Oqgzg01te+UVPl4D53Vm4N53qJQnfFHPHviySQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/GCUIYA7eqO0itqNcnfh268S/2vTjOnsh0dY0lzgUUYq7NBG
	NGophb68wwo8pPq8Mwm9qIdQurHLOmq5+hqgRFiyleBnAjeSRw066tJm2xj5svu4pPY=
X-Gm-Gg: AR+sD13nkqAEI+LoVVXgbtaMIFJxGnFAdUunTCIJZCU1d3Yx9MMw5KAnnQpvKgiRKC2
	5oOfqtXKNFq6A28OdP75FvY/kPILDBvWxEcD1ZNtvN7G7r2py9B6J4TDMV4iLuaxVhDyEH5TRS0
	OYO3+pb+u1/35Dadzgq8eNqSCRMpRLVE1Jjo0/6Av5TytTqr8fnCwkPp4+IWX6RGi8WU9Kfp4br
	LSqyDHeWmFfkyRYMqWQT+9krASTQ7j6U85iq6Hb6yRkAIZJVhVm/1DaH2O/bdhDdQ135KLSnyg9
	JtLJe2X8kT9H2+qrFUtBYe9QWw/7Mwd0noXGOJ2Y4LTv4M/MUVzK17NJGlRfpJNpCKJQ7DJhfLE
	ulBO3skJ5qH9Tr4iSkxn9pHE0ngKCaMlqaXKX2H5ze9y7vQEfJdStrOE6EFdkDJBUlgmiXuhR9K
	/tNJ3lsKWjVybRLjlHkyMtVZV5Zr0vHE6rvFvkPvVsRWIEo2B6ZR5k3w37rqUtCZIsgxsIueKoB
	nadoOkpupbDC0FIF+/hRZik/7btQsiV5A==
X-Received: by 2002:a05:6000:480c:b0:47d:f6a5:1fbb with SMTP id ffacd0b85a97d-47fd7270145mr3362412f8f.13.1785551009970;
        Fri, 31 Jul 2026 19:23:29 -0700 (PDT)
Received: from localhost ([86.122.199.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm12176466f8f.19.2026.07.31.19.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 19:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Aug 2026 05:23:26 +0300
Message-Id: <DKD908MWMH7D.2UF27D0IWQ77P@wyliodrin.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH RFC 0/2] rust: usb: abstractions towards the port of
 usbsevseg.c to Rust
From: "Alrexandru Radovici" <alexandru.radovici@wyliodrin.com>
To: "Alexandru Radovici" <alexandru.radovici@wyliodrin.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: aerc 0.21.0
References: <20260801-rust-usb_control_msg-v1-0-124cf21c82ee@wyliodrin.com>
In-Reply-To: <20260801-rust-usb_control_msg-v1-0-124cf21c82ee@wyliodrin.com>

On Sat Aug 1, 2026 at 2:59 AM EEST, Alexandru Radovici wrote:

Fixed some mistakes, will include them in v2:
- use `Duration` instead of `i32` for control functions timeout
- fix control function 0 value timeout from "for ever" to `USB_MAX_SYNCHRON=
OUS_TIMEOUT`
- add `#[inline]` to short functions
- use `u16::from_le` to read `wMaxPacketSize`
- rename `Generic` generic type to `Dir`
- impl `max_nak_rate` for `HostEndpoint<Bidirectional, Control>`
- make data `&mut [u8]` for `receive_control_message`

Alexandru
