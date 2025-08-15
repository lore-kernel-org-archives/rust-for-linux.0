Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCFE306D39
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755272464; cv=none; b=bVViGSkqUeqRLLhk1R4A9Nokys8YW1V+hwNS2ngT3gWPHrR6hP92z1uNyGNqS+zu3OD2QwKRKqQ7LZYKrBlJl5ZBFi3rUPmXB+WWf/AjGk5SPJF3JhfQZ7kvstLlSIJu9QoQiRWxc7rJi+DKiR9+n8LigY5coSFGeML6+DJ6U0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755272464; c=relaxed/simple;
	bh=w4iFGDtidQ+w0zVu6RkB2TaCelif6GJODof3qWCwF0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGsZmfMePhA5y1dJz8p2aPoCLgeJYOwRItf7fWIz0zlUpY5QRDqqbfe/Gw5OqIhxxJgy23Ea4Xr+FXus7gIC6Jvs31EFfw8jeWmiMMZe7oVTSgkTkum0cPv0IqA09XSEjyiqZsag8kGLzT3vFNzkvZRfjfKk4OKfMo3vnY+ZDJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwKOjFry; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwKOjFry"
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-50f88eea7f0so696270137.1
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755272462; x=1755877262; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w4iFGDtidQ+w0zVu6RkB2TaCelif6GJODof3qWCwF0k=;
        b=bwKOjFry1UFGVDIOhrulLat+uWAUi+lhcYnCzmklKeJPRTZekhBL9Sc+f/uEUPbx5g
         DeHBX5nG8mFwPrN0R/lqT60AjhdLhGStOWpySselv4MkIsT8gZ51c2m+tdvzCCejHWUx
         zmk90pTWkI///efuwRSaT8LKIBFHepSB7tojVL6owUNfJyWucXwcpLfEW9DeUbcKoqje
         Fl9BeqqVRAjm0q3F3imz2zFyH/TqLH0LBti5drJFmZz7xTt+jOtQxUZVkx7GHrxO5NK9
         0wmsNaFEryQ0yHXjM9Xgk0QQypRiyAMc30aS1XgbrVP5Wp49OG+vn2XnKnhfge5Dhve1
         RyLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755272462; x=1755877262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w4iFGDtidQ+w0zVu6RkB2TaCelif6GJODof3qWCwF0k=;
        b=gSRmcEaLgI7Cazx4PsI2wZ8TlzP+SYhvl5WABYYlSyFqC6PUaQMuUbP91iLJwyWx1H
         z/2O9BC08zLjJn7eI96UWg1CVjHjo8egVxCMXMx+Yntof8fpCOpRn6/Lxp4GXNdOVhmw
         eKSKYjUGg7BQE9d6T6obLAH7Fy2XzQRIoxJbIoR1zAXAZWSTU4EdWnGr1b5gK+0vvPDC
         x1WBVRH++Y6Tch5r49pLdlGAWMv4wVgdMXpxG853RyuqrzFYrpzbWO13981pvVKUwWao
         EkFCniLUD3pP6Gdrns6AmhgtItGChRW03zm0qpj1qwY0uSvTKJWNf0PcbmxFgLD/KEQp
         Gmiw==
X-Forwarded-Encrypted: i=1; AJvYcCXYQY9V2Gt13LN2pFZdqH+vxKMMURSp3gv33p0v1RXIVyLazVfFeqFC9+McEw80CxBVFTzKTCz80vQkep311A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiQUK02RWOf2g3F07EeFi3g4Q31sUOJ21lT7kAbIo3B1Aa82Yx
	EJu7VbpN4Zgk2Ezli1RyHlyeunQQXnw011TGE3XRHP8Fu8jU6NEBDIzl0cYc58cijepBqKEnz0Y
	WVJwbChZrkKfuQ9i0unpyp250bVI2Fo4=
X-Gm-Gg: ASbGncubkxRSe+bOHUkJC/pSB2X+kWIh6sIGarba69psiBnWtFT4jnYEllU1lg89BBE
	hF09fjRBGXLRk6AigZF/rTR5nTtqG802x8lupH5l8b4ls6hxycbiNJGNkBKMp9FcvIFurqzD29Y
	X7QbwSRaw6c/9UI/BKKTUJWznLGhKwj7cBmbF7owItjHin4B5GcTj4wG6sfEvnu6X7YUFaSqke/
	RA2+nb4C6sGX5A=
X-Google-Smtp-Source: AGHT+IH2XZRVezAjk4txCXAaiRMRZpnM7CWpJi66eQfyjjANR0AoPrjHiNcoS916gMqtsSKzUq7YkFR38QvRD31FssI=
X-Received: by 2002:a05:6102:5e84:b0:4fc:8330:97a with SMTP id
 ada2fe7eead31-5126cb4464bmr940600137.14.1755272462000; Fri, 15 Aug 2025
 08:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com> <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
In-Reply-To: <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
From: Igor Korotin <igor.korotin.linux@gmail.com>
Date: Fri, 15 Aug 2025 16:40:50 +0100
X-Gm-Features: Ac12FXz6DQVjPRJ2LtnIcM-CWj9mVaRAvWEWY_RNH0PCOwiTl2sr5WvFSZhgOkM
Message-ID: <CAG7QV93KGmoJ6+if-ZuwBF91x0BVDUKbOegspk2MC8r9OjvA9g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver abstractions
To: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

Hello Guys

Preparing v4, I keep thinking if for I2C I should rename `i2c::Device`
to `i2c::I2cClient` or `i2c::Client`. The reason why I made it `Device`
for the first iterations is so it would be the same code as for
PCI/Platform code for example.
But the original I2C C code has other terminology. Do you think it worth
keeping it in the Rust code?

Best Regards

Igor
