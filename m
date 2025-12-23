Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E64022D4E9
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 04:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766465643; cv=none; b=Tct9nY5ZiysdRE42zv/DaYN+xjn+IR50Zf4Pmxa5ut04a0ylCZzD7qGIHlWRABfQvoUMyX16Y9tlbi/DbV85COaJBYpEhrSGxdqy6fAOPvE9OJHnIEBCtlZDlQBg+W+yzIU9+nFMm+Wy57KWhN/1hQ6w+5oJjPUcrjXWIs04S8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766465643; c=relaxed/simple;
	bh=qLpP523aAmyAJ41p9m75RrcgnIuRG0JYZTi48i2BLGk=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=PmAhps1Q/+RK1r77Ebvz19Kq7884U+UpNZ8xaeOXZ1vv7rAWM9xB4h1/l9R3KMsN1e7OX4HT6JJ1jAZRxl9Zo39vTOq8ZGxigG2tdEjE8RR81IANowNVukDBY45zDmKyeFDgGzLrd4oThMVPCsMwDIKmKSCtyqiWk2qrLdJQhSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aARXnC5R; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aARXnC5R"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a09d981507so33334305ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 20:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766465641; x=1767070441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq+2iFrosRcl8h/Pjv1SkVbM8N3eRAOAbbgT8dXVoCY=;
        b=aARXnC5Rwnu5Kjw4wc3Ekhvh3Ucg1gqNy2/Ev1yJ4pQqhT0lfpposnvYeqy1dWLM6U
         Hj5znCCekstPeX3iOIcaU7iJu/e9QOofkhRA5HQog9Ulzp/cyTj2IXRBlf5UX5L+ubHx
         JiFGtZ7Z0Yc1Ei04cY9mbZo6p6QxtNQPIHBhykbBhOY3qj8/EohEKHsJ0pQMzRItbo0x
         P3574ZepERegH/XxPkj87kDi7P5LzJ4JRlmXuSi7fUCdOzgP2wspDHMLhkyB8WmWTGum
         jYKQbdTodRGflVGE+0Wnnw/MbYW+gE9ypGIKkCaVnBVRwbY7lBb0A4QG1mtJN/95caOj
         iTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766465641; x=1767070441;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq+2iFrosRcl8h/Pjv1SkVbM8N3eRAOAbbgT8dXVoCY=;
        b=TSGV98t38fCIlCOpo8Z4K5joBTPTyKK6B6gOjV7oms8G+TT9jy2/8U+hwQdjoDXg9I
         lTBkL/Zqvz0lrKOgtMaTMOfHKbFI2c5upZQGjP5XVb520MBuNblJg5eEWxDdVyMfhNow
         4zosS2McQq3qNLSLF9JGse8n9rO6IWZfVLWSaktodsv4FMf1tPVhR6gqP0cf3Ws+XdSZ
         guKVJZ7zuWS+rcbEixTvlTvk44kpOSAkXUY9OkqJgZop6ehozucoPAOV8TRuXZONzwXn
         2esFCP7bUk0JSr3i05yyGqZlI/8AbeKfmew8R5pFIGIDUGiVrqY6j3aI16Ynv+VlkH2S
         ylcg==
X-Forwarded-Encrypted: i=1; AJvYcCUcFG6Li9vH2wtpvegRPthmbxQhSlEO+35zdmgvJw2U8XAdhtpJvD8AWH1EriN97LP/l3lwgZzhEDEswc+Kxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0HvwiUIJd1WfV5HkJbQUx7fybbHJ/lNlDIq9J7wbgGM50wAMg
	XbxgcMqSq5ckE0NymVXNKTTwuJnzPZuKwPdckQDy/0a10v8WTWo3iGqv
X-Gm-Gg: AY/fxX4DCzZBueLy6MKCKg5TxZG4kL9d8w8olpqbo5BFhN0FUn29gsr2F9ckKYIawMt
	uJQMH5OtHr4tOIOVSc8CZonlCZviGwJaEpXBk6Y9GnIceR0pQFVtb4hvnCy8zensV/DvgbJ63CG
	nEH44RGqT3uxQQwekr0xFfwropPOwIzst+z2tArrgX1K5Nfi+TeNzSvyNQdXh7hsad7eucNbtlU
	RdUhZuGTLo0trCAkcZ6cecgLCy7Y3AwnfFGO8bw/GsaB55RgvweI9Nx3znpv+oTxDQLl785m96K
	+q7VGNAGbuw7bknOUeOfYhilY1cAzUQB3ZXfGGG3lQVVRxb1Q5NPaM1vUxWiRRL9QN3k44kSnmP
	ZYRHf4vjHApVsOodjOEL+ZBvMgihAbv0dAobX2AB1Pi3hMWotd1bL5TwM96DOIxIo64fABvJy5O
	EDNGGKNclyd6MYuRssMtO+xrHkiJSQjfkV9vqaua7X2C9HE0hgYyuF31jjY5BtgeDrWx4=
X-Google-Smtp-Source: AGHT+IEnueW9XJWReJEoENzLygv/WqzFObA6mLnZX3ys+kdkGpI1RYUpgPanB28I1VK0QGm/vDzE+A==
X-Received: by 2002:a17:902:ebc1:b0:2a0:a33d:1385 with SMTP id d9443c01a7336-2a2cab16191mr172702915ad.17.1766465641326;
        Mon, 22 Dec 2025 20:54:01 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d776b2sm113451265ad.98.2025.12.22.20.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 20:54:00 -0800 (PST)
Date: Tue, 23 Dec 2025 13:53:39 +0900 (JST)
Message-Id: <20251223.135339.1140460779640053821.fujita.tomonori@gmail.com>
To: tamird@kernel.org
Cc: fujita.tomonori@gmail.com, tmgross@umich.edu, ojeda@kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 dakr@kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 tamird@gmail.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 0/2] rust: net: replace `kernel::c_str!` with C-Strings
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251222-cstr-net-v1-0-cd9e30a5467e@gmail.com>
References: <20251222-cstr-net-v1-0-cd9e30a5467e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 22 Dec 2025 13:32:26 +0100
Tamir Duberstein <tamird@kernel.org> wrote:

> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
> 
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>
> ---
> Tamir Duberstein (2):
>       rust: net: replace `kernel::c_str!` with C-Strings
>       drivers: net: replace `kernel::c_str!` with C-Strings
> 
>  drivers/net/phy/ax88796b_rust.rs | 7 +++----
>  drivers/net/phy/qt2025.rs        | 5 ++---
>  rust/kernel/net/phy.rs           | 6 ++----
>  3 files changed, 7 insertions(+), 11 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251222-cstr-net-3bfd7b35acc1

Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

