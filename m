Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795706827;
	b=3HDaYgjtpEwbWbkr7MGGX0H+iwCzA+ZqRIBMUxqiqHS/oZNRhXp2dBamuPkyIe2lMY9l
	 CXbjKv1+JAUTTNcpHp5/j76wQthdRSeDGnb+VrcY33ubFbxGGhTzisb6EQ6QFLECa9JAA
	 2JpQGIyB71xSJamvc86ip6Cg52gEwZaj6gTXq0XUFu4wgLzCqfvUnxGsFs9e8BpZWo8al
	 KOLpeE0e4pBS0pQcb7kZj9EeXC3yleL29D30ejytANOvLy+UgnB0bbe5Oz86ih0H9Ezvs
	 FNtYGabkqRGnqRtphltlEknZkd2TdwjdLkcGWZ//GjccBxisoShY1SQhcklfBi1nGeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706827;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+5cJpclMU11DU6Bvzo/H/00JtHPT21YVbuVjS5f/dxY=;
	b=3Wga/fvauBRnOeGslDWbererKAce330Ph18aAn27o45q8Z4leNZI2Gbd/VatDp0hGim0
	 x7L5plTq2VRYwi7UnbV6k7lOz+ivXX0/lKEFVMo+AH6nYKl+Qc0uJjk9gxEjeDOlH8YoH
	 STW9dm8zMW46JumDqQUKWU1KECb2l8DKkiWMocJXqz7dzGIL1pbS7XYzVTGwboTDoWTVJ
	 eoOGxZaXTjOJgmCIA+YlvgMsK8gzsidXFRHgsC68pk2y8KBNYwaj3o7+x9jOij5gON/eI
	 hmuftbLZyvjQ7vxkPkcECLVJskblGdF3g0fKjT97vqp4VwHkx+lWcw7jxwz9Ut1CaKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EAvbuQ+x;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A96606A321
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 15:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96A96606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=EAvbuQ+x
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so4481630f8f.2
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 07:27:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795706825; cv=none;
        d=google.com; s=arc-20260327;
        b=qRiViKPzwlVLLBC42FKrFPItGowzFJAafQgPfcwPZI/0SH4qf6ITHJNYnpp41MkRpd
         4L6fkGRRvRiGjTmmNXuME+dhFacA3sSjnUKHQ46Trr2qxF77KUt6rhd6TwriQY6Yp/xV
         etFOxuUl3cjeq71ZSRNVk3K2d6rUNcfTQYk5zogya9OEJaqcptjVsEn2f0aCFkkhajBo
         gX3AbEjZVvHDkKOsb4AXM2RP7y8nbQ3LSrcbMyTanxa/sTadNigAB4SAVMua56YomGBb
         WEW0HSJ5eQHulNTwq+wyA0+UawGK5m1igvB3qCGPYMDUYNcLfF86KsCv8YGH1kQ/fqPg
         aShQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5cJpclMU11DU6Bvzo/H/00JtHPT21YVbuVjS5f/dxY=;
        fh=+xRo6d4uayhcO4L87YE8gYQXviEnQfv2RknXb4h9vMs=;
        b=Np4ZyatS1gOLvsYGTCskxFcmf9deKmpL60CuQBLfdhk5Wyb7bSXi6qhvDNZ/3rTfDQ
         Imw4p5Pw8mI2Dy7oWI6z7pMiXj6g2EBVQQCwy3ALYlpS5gp/5LuDWH7Cx/GRLymTqBCO
         sR0u+hicqtWPSvoXpp2HTMiGvHZNeWENwRlZKeRLUt7r33NE4dAJH8dLCeXhgj6CxWiP
         mpWKlkOp2k3GkKokMSSlCuz4ov+D5Oz1GqouE8tgai0tH9RgJEH3mktcKYJkorKV4GKb
         C22QJWHNkuAhmf3O7kuxqI7DOHKXFwF8tcCD6CDeKAJ6x1K1Y9S9O4lOdWnc5g+St2c8
         IQRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795706825; x=1796311625; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5cJpclMU11DU6Bvzo/H/00JtHPT21YVbuVjS5f/dxY=;
        b=EAvbuQ+xVnN3BjEfyABrcfLXQpFXV9Jj5Fr7THCBB+kUIqJmmeCWOVJh0FB22PAWwC
         fXA3r4jghMk/Uqn4K84lfBsNy5gn+l0fQmT8wiMQSP8jNzQK5rzqtmaZCqGzX4CkI1MW
         kTM4rda93GDWFF4sREDzk3Zx9QqtwW72C6GeRPK5vqBAjX8V3wU0Te3EmmXC+R4DpGpO
         Dcw0UnxRISHkfv/28DJXaUKkJerXPBBndIK1r/3+fwnMaf38QXr9w9QsR4JLXtj2GRBm
         JvgrLHayntYRFFe3jpII790MugAgG+JtTOFm4hq5gGfRxFZGLg20cng7Q+sYcbIT/yh7
         FEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706825; x=1796311625;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5cJpclMU11DU6Bvzo/H/00JtHPT21YVbuVjS5f/dxY=;
        b=u/0sq5veApfI8jSAYaaBHTPg3kd7za3zDr7Pzjb06hpcWVXrwmb3G+JqcGl0I4GbRN
         Izoq9mjBKHRXQ0+Tlrq7e1SEcDF+/yY8diKqNErjqS7yV3Tk6EPMLfFHNpd+c/VNJxby
         vM2vWfgIOYgi1IOiGtwQpGefWcDczPkvEx4bl4xiYpmiSdzU5M24aan8oGL7DV3Tzrhr
         mOfYkarGKvjVyfSSjFF6gaYM2RScovrzvmvx60QOCmV88ZNyn2MwENqVgsgK2I2QrKZD
         5Ue/PQG/++N+jOzluG7vHTurBzFf5fLr9/K68WCmeHJXZNz30WG2RsxHOd2Eh/wa76Ua
         gkWQ==
X-Forwarded-Encrypted: i=1; AL+hErH/uEcKdAUSC9n3hQ3soURlblNX0WkNHnRBPdjHdc3itKceD/q1KGnnJCY+7lP4lr3Hjrsvtau6WXzYa5eMBA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/t1BlTSR6lmNybD56J+FoN/C1AUgNXIQ/v1C31Gdme00Sco5EP
	ZMn/FCv4S5tar5zavIIGZ7LWe0CiJbjeTy1om0OpXVVJ/SpP35+JaqnL3wjNDpCPvaO3AFafyx2
	R6lMUR/J4su+X8WFodwtcix2+CuUpbEb7mhcftKuN
X-Gm-Gg: AZFdTZfW7ObPONSPbbn31bWusgn9YGu2zv1rNjj1l7xIj6ncSplJIwJy64ze3pHMv/e
	Q/6seMsmWcNr89yfGTAWk2ipgWFt9zQunz2QJDbZVEJu721jS2IKsl7PhgddLRT9cuDG5YwrWMF
	g7RR46WcMhAdStpJu3P/g4MwPE1bfk8eJuIKS2YbWMJDHXXELv3xwmFrR51sMFWvm9jG69uZ9W+
	XyA2NCiBriPKfcr7+iDW60jhmvGmx1CXJw9iivs1VrOX+gSw5jiykiFA1rJ6N6UYPcaO1PnTdkM
	0+C4dyWTXijJA97Cqb8JcdSiwQwg86UDajW4o5OPaCfzYiawVKl0DAJ+tnIlQPQJm7UQS4cytxo
	R1nEd0iY7w/9JXA7MUqh0HxAFKaeT6boa1bcL3ICJ9uW0b9f9p+qeuupvIpBYURy4vvgilu6mGV
	TLB2Z99vajeuat1Us7CyE8vbqa03ytGpCjHnA+1n2fLtL/
X-Received: by 2002:a5d:5d0c:0:b0:4b7:730e:bec1 with SMTP id
 ffacd0b85a97d-4b7730ebeefmr20593759f8f.33.1795706824164; Thu, 26 Nov 2026
 07:27:04 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126-dev-optional-v1-1-9e8d3a807d9b@garyguo.net>
In-Reply-To: <20261126-dev-optional-v1-1-9e8d3a807d9b@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 26 Nov 2026 15:26:51 +0000
X-Gm-Features: Aa3M54ov36TJ6LV26wCr0hmGLfHyPpN_El8S-AuZNocsuwL52_XWzLjr61zk3Aw
Message-ID: <CAH5fLgh08sP+6AV+2eKETUTidOUkUqtmA-RsfeTQHLTsvyku0Q@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: drop underscores from `#[optional]` methods
To: Gary Guo <gary@garyguo.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 3:20=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> In the `vtable` macro, `#[optional]` methods do not have a body, so they
> should not require underscore-prefixing the function parameters just like
> mandatory trait methods. Add `#[allow(unused_variables)]` to make
> underscore unnecessary and drop the prefix from existing users.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72neqitKHftQ9UVJaKLkcUd=
X8uAWLtoE08-G784mqX+H9w@mail.gmail.com/
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
