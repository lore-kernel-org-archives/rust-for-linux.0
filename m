Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41821D3D2
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Dec 2025 06:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766472560; cv=none; b=gDYYruih1PjLq6zHUdpkZfm8Iy32MLeemVMB0fZubjP+h5LAi4rb1RHiStUgOfrJ0dAyFpkJekiqg5wQJYdDgo2y7evnj/UNP7HZ0Q2zgeG0RszlTJUI1yN83bPxvETaKygxNIqFS0eMyDlMS4vl++IPUAvbRcmMrVEbWi2HpG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766472560; c=relaxed/simple;
	bh=PQxNYr9ZXJfgGYILBpWkHWINJHiX4XK6YmEE+lv5WXQ=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=oeRFfTuOrQOhxwbrT84NRWA9MiuOO83yCa0UkQHblyoQjGJXtxfq2n8QOEEYzt5N/Hes3OUVPn8g+/XkTYpk5RLa3YVmrNnzz5XDO8fs9W9t/jdQkWy66gIuX0+oSXd95KENti8sacEoL9rti97UYFt7IBuhUNlafydku1ehhjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m4wX37K1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m4wX37K1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a0b4320665so71485885ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 22:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766472559; x=1767077359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CXn4XTCIcm7noszlDmRBcMvKxGe1LNPDb2C0/ug/Hu0=;
        b=m4wX37K1/f5Sey2wy0RnMOf34PBTgGQYh/lwcNa7p6xnFlme8UfHeHpm/51r1dL/21
         uyo4+2YzMmXWHBUO+LHjW1PetWQ4tbmZIgiIK3umQYobku/JD8p6pOMm6vqYlALSKiBc
         I1DfrfXDbBt8AyI0qmJTb0X/w8xl3rudIAc89Vn3rdiAhFLMOLTKM+to1fm7mMafT0DX
         uYan1ufbn9C4FMb84STXDMqtkMoM5bzvaoXJe0ggYWDN9Csf6AYn6yO4VTy71Lsmc76w
         tyNdAE/SE0s1EpohUVnjQHU5am6UMDKKrLNTQ6/IfwOSf/fEXCgyphLPNdB/ZHILvB/M
         p9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766472559; x=1767077359;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXn4XTCIcm7noszlDmRBcMvKxGe1LNPDb2C0/ug/Hu0=;
        b=peMQ8NFJON5Uqf6ljL04oretGTwxbHnvrDv2v88NKYSUymXa8lugKEYmegc27FiOm+
         ThnapVQNnyZW9wcjA/SnYg/G6LHs53v3Br9woI8EBIfhhkp56S/gb/318zHvTb3FwOIm
         jYMGA0AyfWFvlUnRBIhudKLonLujMvIvHNjLitZpnvJWgSKXg/wp4NxDxZgV//fWO/U0
         LCuQZnjW6APGezQyHZjeAatBXWgzmx758TyMuXh9wRfciQop029Tx+loYA3u9NFFS5xF
         DRcsN2VG7SFAi6rmL3Gf1zfQ7o29n8u4P7YyaH3jCGJZpe6qZqCBuC/62JfzCr7M4UhY
         fjnA==
X-Forwarded-Encrypted: i=1; AJvYcCURsMl/cv4vo+LkS5HLWDBVU82EDad8+FmNicLG03qdxscXbAzzM1NyPyHlgG/r+WPXbtHT2qNIF2z9VVBpjA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1aQoxnTq0d4FQ3vFHfexEdxCKBPlLnhm68nKkIWXyhYS94+vu
	qMMBfnDgTVSz2VDRNGiN4+e079j4juTktiWzSaEq8dEbrKutoyV+0Rq9HDlf+w==
X-Gm-Gg: AY/fxX7HSSm/dc/Flw0X4xIWJI1Lt7QgsCklv8s1lFcO665bmRr+j0PEF/j6FBhzFNV
	WdBzUL0n/zW1G/qxEmZS18AL/EGFwtiMg2tTLxPY0zw2QWPK510DolKtPwUnZNpZIw9Ez56Ujn3
	RhUa6EVwJU+ZjwOCjssWyrroaLQ6UjXDvHXJ2MDOY9gE7A/g2z1gQYtkcn0rtIzS1FbbDW7z6/3
	Nw7N7VTJpQtpzXNBG1a/fEv1Q9zS5D5vZJWegdxL0JYnvhlCCRlYYRWl0nUP7u4ERKT6/wh5I4L
	doyDKBYXZ2yEU58JqDs8AQaxyEArR5jMGSfwa7Pnw0iG8V3KKEMU3IA9dLYDzSF0sa3p6qI9wwn
	oYXInzNlr4bsSpEjPYKzTmSgeBto4m0fKwrkQnU4cK+rEToEHHOdX3zyrLz/F9S46Epa8bYJ/QY
	HHnQsw5IOmKFerKKmI/K77zpUYGHz+IXn9/GynU9y29wPQH14Li94HADrqu28koFgkBRE=
X-Google-Smtp-Source: AGHT+IEKUCPxVA6C/XMV7jNexXwq1dD00BjA12Tryut3oH6HXGQ/Md+aahJ5Qvwj/jS42Eq5K18yKA==
X-Received: by 2002:a17:903:1b04:b0:2a2:acc7:f1ee with SMTP id d9443c01a7336-2a2f2527a64mr133778585ad.21.1766472558802;
        Mon, 22 Dec 2025 22:49:18 -0800 (PST)
Received: from localhost (p5342157-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.39.242.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d36esm118102595ad.63.2025.12.22.22.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 22:49:18 -0800 (PST)
Date: Tue, 23 Dec 2025 15:49:04 +0900 (JST)
Message-Id: <20251223.154904.2227272932843420754.fujita.tomonori@gmail.com>
To: aliceryhl@google.com, ojeda@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com,
 a.hindborg@kernel.org, boqun.feng@gmail.com, bjorn3_gh@protonmail.com,
 dakr@kernel.org, gary@garyguo.net, lossin@kernel.org,
 rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 1/2] rust: Add support for calling a function
 exactly once
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <aUPnnL4kg9yiWtZn@google.com>
References: <20251117002452.4068692-1-fujita.tomonori@gmail.com>
	<20251117002452.4068692-2-fujita.tomonori@gmail.com>
	<aUPnnL4kg9yiWtZn@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Thu, 18 Dec 2025 11:38:04 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> On Mon, Nov 17, 2025 at 09:24:51AM +0900, FUJITA Tomonori wrote:
>> Add the Rust equivalent of the kernel's `DO_ONCE_LITE` macro. While it
>> would be possible to implement the feature entirely as a Rust macro,
>> the functionality that can be implemented as regular functions has
>> been extracted and implemented as the `OnceLite` struct for better
>> code maintainability.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Thanks a lot!

Miguel, would it be possible to merge this patchset set into
rust-next?

https://lore.kernel.org/rust-for-linux/20251117002452.4068692-1-fujita.tomonori@gmail.com/

I'd like to follow up with adding warn_once() after this series is
merged. There are several TODO comments under rust/ that mention using
WARN_ONCE().

