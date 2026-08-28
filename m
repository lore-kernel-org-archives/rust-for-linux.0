Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A772371CFF
	for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 15:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932473; cv=pass; b=qO+69cdNNITrcDC6f59NcFzdkyEzU6iD7hNkJm3/hEPNZazZ16S+BmFNjh/2LmpAuISqqElHA9cvVHXrIF8afQO/XXK6YUkWujHFbAWSXGh8bgGzz9/wP2hXr5Rl/4WMjFTZzlDwK5tf1D0gFpVc9CRkE0hdl6c3Ol29J4HE/5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932473; c=relaxed/simple;
	bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eM5LMx9JnXdBjYWibd4rqd7eIbSQ1uGAQgOMwzsmkr0vdKZGjK4Rs1eHkh29FpTECfy2zlhGC4Wf1p7jvNMVdQOwRH3EbYIa+qHm18yh68bBISJwwn7BU1wCkZkz2+dCZM6slqu+ymfJHnbPvb7CTrxztjDMMpIkBqNJhIENGf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVIi/hCl; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVIi/hCl"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9b3f380006so123808a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 28 Aug 2026 08:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787932471; cv=none;
        d=google.com; s=arc-20260327;
        b=YST5JAYpl1sbG8p0doMdv0lKFR+u56hTRgZZcH8ksIlGlM9+/kmTXpbhF7f7jBgbgq
         hN7+bXF8KC6W+bD+iylcppbbj9hASTTD/0M2izxccI+pQieV1QHwGg1t6fnMm1L0LK62
         Fr+J9qInkt2zm2NRXj+mk3Kr+fFj4aH1j2PMmjmk9oHLxdRiT8HpMb2shEvt2N8JXb9+
         g3Kni0A7WGYPVAHFCRsVkKxiUEHsdyTKjzpwLky9DcbHfOruD4le+NMMQwTDt8gsUg2x
         kQNjVtQKq9UMOoUEGWCEzjC47HeQvkD8UaVCGnJk2olFvItUzd6nkC4fSxh/Uqfdrrdq
         XM3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
        fh=QiWwjEmjfOvus/2DsENs/ElC/D9A55CNNH1jEPy4amc=;
        b=Hf6NW+X+X+/kgN2ewwPYIy15AXP7NA+2MiCq7P6wKiAJSsQeQU7cupO+n+iI5m5i8/
         LWTTqC/h6bCQ28i/4HiLRk3Xs1yZJCrTWbfNgiFIiJm1EDhZvESbm0ECMm2vhePr6lf2
         HEwsc7Noo9uJHO11VkaNQUtSt6wjFRG8IAhzYJjPqAq9zdmzSxezsMsR8w9yi5cSlsvH
         oqOd/EOlYGZfVsbd0VWxSWy8mfEKwMdxtXD3LipssOyuIqx3V7Gmg3m1aM0ZnI8gsN1h
         bPjibIc0TMIEjUS/6klbnjvwTQsNSsTFJAdA864xBuVKJhqzfjYOd3xbXFlkltUSAExf
         2pUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932471; x=1788537271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
        b=IVIi/hClxaWUFVANyFffXlZMs+KF08fI5QRAJUXFxb56FwzMlpLpF2XB+4zljcHqyh
         JEOLo+IWkMRG9CSd4QjYXqU0KPxZUaYCKoFsVuInzDuqZ4i9lALBAiO30CjdzkRQq6O2
         FAF4zfqONgkK7wO09g0fVakclJDrvQ4H+bbDJHhuNu7Zel0celo0t9nCcEvB7obC7Wi5
         K8+U5xkrm8QwGqyiGKltPyQokE6pNZOVAzARaVH7jbpYDIexE8HHDhRkjsMGAgHe7tLo
         GEvDF1fASJa12SnAwq3VlZmsRLVkxlEK33QfPBfxF/YIEx83Z8ar5zwl/NPInu4sWqx+
         GyZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932471; x=1788537271;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kfy16Ml8AIqm2UxgociG9Ls8ZlipU0fE+nWJOxn7ss=;
        b=M0K/veARjrtMTPNSq1OHGYh5IxhbJ9q3IybPsKlGKNeZH5nXiqOPNb+GWKmzJqlTsM
         ADa/CwQEBWUGMPZeN4DwL9kKNsQj3NhdpCcY+QzeJLHRAk9XRnKfMJWCU6/1/QrHatB2
         DRjZ5yBhUxfdK5I57uQlmtHHOL7MnNPb1LOful8HxEbQxFTI/zOmFh49CjH6wOIbR+T4
         25pXC/dL9RhYSBXx3CxQ/p/yM5hoBdOP4T3jeEl4t1xO+QaNZEeJEA/JL5aPv9XeESl6
         238LLUw7CtH6C4vvBmrxaBGJWoWT6LHFhAZTblWRFKAIzakmkXTqM5On1WhwSHygNG58
         TapA==
X-Forwarded-Encrypted: i=1; AHgh+RpcWAI6mOmZt6TADEkqruu6dakH30JKEGZmUhZWe4VbRCJLBzgNZWHFqd1LOal9QL4blJthvA5aTyUobh+jMQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lmfJ32zxeNR2i65wIMzAtMzx5ur3P4zZTmFiIxo2I4KHLKtca6
	5ZvZLuo6d5Ie/JPC5wcgoECl0normBOryuKKJh4wcV6Yjp6wPGBYc6TKYvF25y8a5paLE0OyBGN
	dHRvOZevr3rK90NcVzUhZkXUs+JLjrjc=
X-Gm-Gg: AR+sD10bZLGhyXZWvbuZvRygXH+tcgi5eWMxB59Z3PbzP7mApQ6Q6mVZMWiVSQ7FYGy
	1OQDyl0G8moZS3uo12fkaGFoDA52WMx2SaxJd2SeAc4TLVEDGZ//caYbpFNcp2X0xFyIUSwG0Lq
	4uMhQ7FD3BXDidMkdrXok8LkTsAQAMgXeN/X68V1Sj5H9HUDQais8Jw3Vel0esA0p6IeBp43455
	/4tlTzVUl5iBZb/ImBnpLIRuav142h6ZposbbueCWTU3CKrYxMvjUPHpKXwgFOnb7S7VlbRzhf4
	unuu6dVXBgY10JQQDEh/pxcVBdjTA8uhOAeb2DLsH345MKufv+mJzwScK8P+ZmzPr1mGa/UUuTO
	JKbpaNKXIJQpVgmA/H01KYNxuVrKjkAd7PjsIvPcqQ9g7sA8LCmfJLj63GxACvDSdjfGT3vo=
X-Received: by 2002:a17:903:228a:b0:2cb:2b50:d9da with SMTP id
 d9443c01a7336-2d74df53523mr73393885ad.3.1787932467853; Fri, 28 Aug 2026
 08:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828155033.2101924-1-gary@kernel.org>
In-Reply-To: <20260828155033.2101924-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 28 Aug 2026 17:54:13 +0200
X-Gm-Features: AcwNN1UJlMyeNXdr11ELA92T0Ey5VcxcjVrQRE6xE49VX38cuncqB5l7YyzDO7Y
Message-ID: <CANiq72nsED2k9omegCeghVHhpU1vnatBFyngFP-jCc9K=sg4hA@mail.gmail.com>
Subject: Re: [PATCH] rust: pin-init: use irrefutable pattern for `stack_pin_init`
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mohamad Alsadhan <mo@sdhn.cc>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 5:50=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Miguel, given that we're very early in the cycle and this effect
> upcoming nightly compiler, I'd prefer to route this via rust-fixes
> instead of pin-init-next. Thanks.

Sounds good. I was about to send the PR to Linus, so I will put this
one in the next round of fixes.

Cheers,
Miguel
