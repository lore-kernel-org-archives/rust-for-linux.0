Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277F1A9F88
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771231089; cv=none; b=LBGe5o97nCQnOT8lFAPpXffmUb7iYRs6vEk4d191XD2EeTQcPk6kn4jPzoBGHzKrpwF2l3S+eU0HBDPnBCgwRavfjmfPuvAxy2vUBIeuqRRQ0jcdgCaJ0czIcAOXaZ6bj6kSDTwoCV4e4DWg0l+OSCHuAotusnS8x6xr2p2hsaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771231089; c=relaxed/simple;
	bh=mPnhZSKNqNfumkdc9GnVA3UFRFbIjAEp1joNZgb5Bls=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=If3whx1MF0VqvN1CDonMLcoQW6IE3YMgHMnC25kOhcKSVTZos0GTUJW6Xz+8ZpWd75SoQWfkbnVXWefses7UJqaCkPmtabrfA+7Kt880tIoP8Y4MACHpNldQOfI/EJS5iX1x9xSg6xxzVwOtuqX/IUOdn+qOc0kkjZVIHcQQXGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NVWlVA7u; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NVWlVA7u"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-65a2e81ce8aso2752137a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771231087; x=1771835887; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ARsMFBawA3mdhGKsAHTyetef05FVEu/bKyJzPWZbwU=;
        b=NVWlVA7u9Lq4+SPStEiUdZfRRtZosjtoAq5ipOtksdrm0oCwZz4mqoPiECKTG4s8Iv
         ov49YcGzRBJ+6IxJ/fle5s7tQbvml3avgIc5rinE9dzY2Y+yQo0U/OFdujoA7AIAxxkU
         dmQKps9xWBhQQv2U4Ibm5yoTIVmGbfJjcyfOS1UxZSiGMyIf/eSl1TDmHleqINuNMnDo
         wO4K7TgTJVhxQroavx+BRZa6ieUEDzMyOKNY6uQu13B/T8bI3Y4RJxqDArcbJxJGgJ30
         PdxYUFzE0Prbak4ME8MrnCIbcPDj3t+bDVmFDTZrt6VG9EEzudzkNVsuS1UYQmCWEkde
         WWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771231087; x=1771835887;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ARsMFBawA3mdhGKsAHTyetef05FVEu/bKyJzPWZbwU=;
        b=FyZTMoClKQ307hBEArh0ppmclRr08MWBCbWWaFOLoTFqMgnKL1Hjy99o8KnSo5nHDJ
         87I5dYF1d8CBB7Hkiw0zNnw8iGvjp6DFphZqK6rvYTo1WAT/y4+XxNgVUfg74usczmmy
         BBAuvmM0x6XxuAPeIh6eCFVAu9NqHHKF4VfmHNfrvqkKGE3qjvHaJxKlk0KX7JAhbyYB
         Og7WTBgJNHGrFeKptZTyLUPWf46N5vIjOMeOUn4nvaCAkDioWwFz/ZlPWWeifMLU5gCH
         aQ9CBR+67j9yxraH2G29iGSTX4q2uk3FB3fR5hAO/NfsYM1T5da15RElX4dCBGbxHbNy
         bQGw==
X-Forwarded-Encrypted: i=1; AJvYcCXnQVJmcywS6QPuqGDzhg2hu+LwUIHCbBwBAZk3/yFTEAa4FT9mHZZ9jGuhEq8iU5V/OugWMbaFey+8l09GqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6TA2UFBCLiKRxgm14EaUHfuTr8mI3QY975SCQDO009o5XwC3z
	dROhbK3pRkk8wt6LyxTqOL2YHdzLpsMV4kYrSrifSMkGFXlLlU02oeMyggaL944hulWbCyO4lAq
	+Vbg9/YlFpRbJblej+Q==
X-Received: from edsq13.prod.google.com ([2002:aa7:da8d:0:b0:659:3fcc:7497])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:399c:b0:65b:f5fa:afdd with SMTP id 4fb4d7f45d1cf-65bf5fab2dcmr1195154a12.5.1771231086641;
 Mon, 16 Feb 2026 00:38:06 -0800 (PST)
Date: Mon, 16 Feb 2026 08:38:05 +0000
In-Reply-To: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260215-hrtimer-docs-v1-1-bff6a6c0d923@kernel.org>
Message-ID: <aZLXbaV3deHUsSYl@google.com>
Subject: Re: [PATCH] rust: hrtimer: document handle based design rationale
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Feb 15, 2026 at 09:36:04PM +0100, Andreas Hindborg wrote:
> Add implementation notes explaining why the hrtimer abstraction uses a
> handle based approach.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
