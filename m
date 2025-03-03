Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1AA1F3BA2
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Mar 2025 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740998436; cv=none; b=TiDfvIFtRFj3HgaQ5EDZFMhsobwDMyCqU2JMmAm182VayD4kEkncJ2RCLqB8TRMUvURNZqzcK7F6pBXwvBeZ1cWQ6vhu50WtYBsWDjNHpY0prf+Hw7gEWqmzkejxFZ+IToueallrGi2FE4z2aDsa2TEo/McaMESMrx16dG+zudk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740998436; c=relaxed/simple;
	bh=zYzeZ6zTKrsdjyQMrhBRuUHzx5EImxcJueoGYS/gfNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHHt9bKpIiRiJSladIh6x2jT3HM/5dmX3ECxnC0vruAnsq9tyId8aBSKePrv/LD8jI3n3XkCy6pzKEMHTJS3Wh3XdoBs3xKnULfjiHz75x1uBognRv/Cqk6A/D9n5DILCOI4VP5mfQDx4cs3O69STqfeFgBRqlgAwd0LWsyA19s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GYslWog6; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GYslWog6"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e50de0b5easo2655663a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Mar 2025 02:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740998433; x=1741603233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5a9h6+RNdDno0AFoqzH4L74Ntb9x5So7/S1R2/2cyIA=;
        b=GYslWog63dqMweEDm27I28sHouJUBHzjwq52qXZH1odMB2UimNOkTpsYfnwW116Pe5
         sILzOQDXALHGyIzF0xK52YOezZuDVOLBP37a7CNn2GLW9N33G8Rd1zhlzKdw0bd49et5
         E+tEMV98K8FiqYL/FamqYqN2RFvuDL3lIFaSP28+JexmH8mL+mgwQKPx7mpu0kyr8z/U
         LBUH6jKhImCIfa/wcA2ri3DLWdax8OmIUQfuPKxvgY3eHAsrTJD60B1hpMXw1smRCRj1
         WrAyTny9iMlm4WwIsEkPP/ZqWDqxo8x+cupGZkOgJgPbCIO9/8SK/czyAGBODfIniwd8
         z6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740998433; x=1741603233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5a9h6+RNdDno0AFoqzH4L74Ntb9x5So7/S1R2/2cyIA=;
        b=p6yeifi8t3soAm2HKw1fOhcagzfO2U6KocqNElamzHVg+M6Vb/JswTeXnG6S9YKTy2
         BWI0MSPc3p/V1GOkbtl5rC3Z7BicWn+Qk8+Yg0jikNm7VL8H+PMZ4TjAl8UkylGJprn1
         9pDEHBVbd4U7+3RaIYJeYT+eCWLfu9lqf6nHywemYr5xJjpf8lnp6VgvXE0CxlF1E/7I
         ++kKzkisY9G53C3L2OJDhosCXFK0qUEiVTrApQvU2gWyi1xCdoS+kVPMNxqo+0m6th29
         BTpDvcrRR8v8z1FNm723JUTzmU92/jgg7UTGvQ51GyPaDLpI2XygfNyC6Ux0vxkwct49
         hPew==
X-Forwarded-Encrypted: i=1; AJvYcCXHoAqjbfCo+OsxWzZBtSq2FYVCJiyj7TpyL+j/N2dy3ZUHFuRlf/q96tVQ/nzm7fC2opqpcyCWNzDnutY3tg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8lOaQdv++bQHHkku4B2KBiL6IHY7UKLrMZCuRaIXQ6WWU7Iia
	UuOQPQdU1N0nr/mSslOSeYNCGOSGu06UIqY47sSv18BgEL5agnREm05KugqdME8=
X-Gm-Gg: ASbGncvqRvu9n58yDW6QU7Dm2iMuOAaDkg/C+/ayZdOpMAt9dL1L97SDdB/PxEQDUTA
	JdIu08BgOV39naDEKXe3hU5k+kcrjazNPuCmtq3o6EWtz7vOM0Cr529LRlA/HQCFoyz/IHNe1yH
	4Jn43EX26Cgjv5T17WY1H8wqqCdGHx5r8SrRc+v4QCj7tSEDiE+g0y9E12W7eOsg8VoN48Aaco5
	e53buwiHiLWKnlWDW6h4tzlmr99399ZKVpXQfi1QUI+4VZO97eZe7uoG9F3MaXFMlIQwpftpfm5
	HIv5aEwnGLfVb5EWXplKJ426QKX+rP4jfRcE6oKzUFhNudU=
X-Google-Smtp-Source: AGHT+IFdxe1UliGedp4UVoTzjvVx7nmKJ02BWHR9cvVprp2v8Ja1Mccur8mOERuQ9+frcz5n+hpjGg==
X-Received: by 2002:a17:907:3ea9:b0:ab7:bac4:b321 with SMTP id a640c23a62f3a-abf2656bcefmr1434681866b.29.1740998433246;
        Mon, 03 Mar 2025 02:40:33 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf75481eb4sm207346566b.83.2025.03.03.02.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 02:40:32 -0800 (PST)
Date: Mon, 3 Mar 2025 11:40:30 +0100
From: Petr Mladek <pmladek@suse.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tamir Duberstein <tamird@gmail.com>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/5] print: use new #[export] macro for
 rust_fmt_argument
Message-ID: <Z8WHHs8eGcV2mCAw@pathway.suse.cz>
References: <20250303-export-macro-v3-0-41fbad85a27f@google.com>
 <20250303-export-macro-v3-4-41fbad85a27f@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-export-macro-v3-4-41fbad85a27f@google.com>

On Mon 2025-03-03 08:45:15, Alice Ryhl wrote:
> This moves the rust_fmt_argument function over to use the new #[export]
> macro, which will verify at compile-time that the function signature
> matches what is in the header file.
> 
> Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Acked-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
