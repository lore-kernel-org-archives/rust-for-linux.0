Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C422026E71C
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 21:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080577; cv=none; b=QcnqBMmrt80JkuHEi/JR4w3F8OmB5o3wYdKbSA660k+mfg8mZFxW5pTjoC+XPAjLk4QeaPM3i/mwZHbnRteYynuZ6dn2UMWIvTC2m7m4+ZQ3Z9NRdplSpAl6QI/ykT0de0C0PIsOn6anhLDGtb3LWnAtC0wjbTjkmz/KM117/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080577; c=relaxed/simple;
	bh=a1fqTM0O5gxsoV2tXF+ss7N+4YqL1CCP48EMSfUSRyQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=npfV0IjPgJth9+84xs2xPP5SBTi6QI/C8v0xZPlHAkvFAwp3dsZSzJPGaNxBHM65IhIUDog+NsOd21h+ouud7dbIOpMN8VmuPES+MHOH4j+67lOrtx+H/4lxksOjofqVaM0b2xN2UD+s8FR2JQxQcLSVOKiF5QyHDwrPz8oHfd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJQTW12r; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJQTW12r"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-427007b1fe5so4024967f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761080574; x=1761685374; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3VWRo5EFxoaqz4RaN/xBKz8dikjBB1xO43OTvgsl4g=;
        b=QJQTW12rQwW7w0beJWyGm7H5K3jTkIigUizVpdBfhTyeqXA2oKZya/QhV/qnUFUPtq
         NlKe07Q6ThsEVUbmcC6L+XJ2PvLS7ghYNHtKlYGkO0M3CDXg2vKlc8NrJLsOtboPW1aQ
         Y4trQjv70nWZKizPQyYNH/t8zFSA22IlXbcepyKC3L/zTByh/Lrg8vB4Z/jks8Slg9jn
         RNcoW8iOxcBcc9bqVA22Ls/f8lqnwEmsAgx/qahiDrALKfQkJwdBaFXtAgvtjEbaSTr1
         RScGb3CJlo1/xzIUOEkziQ4+/FVXeR80+aahGmF+YOr/7FQtLiyA8ppVhzqbta9IPkmV
         nouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080574; x=1761685374;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g3VWRo5EFxoaqz4RaN/xBKz8dikjBB1xO43OTvgsl4g=;
        b=bMgkCLF1ob4nn7SWYv0fOzeJsUsMRKzof7EutQu/ZNAPMe4XJgVcKhzBb5OBlNx6Do
         UdVbbbW688oB7MLkFS7tre0sEo9Hoiuw0Uu5h9rBSjcpbpxgxyXt/Rqiu6mglU1LXw4G
         okWXwlsgH3eYVRKFXnh+mFyBryPByhj/SI1Zn/XGPK3CmU4zXGmtDLbGJYwKoR3fNVpb
         jb6E6aYZP5KzV3+m6ih96c14r2MLyFeoipDxDGMXANhYYhg0wV1stKhnXdCOQ9t9fmCM
         bKRbFvPzGIBHaEO3lRHZxF9cYuNL3mYaN0PHzPCRtp0Nvj768mpsFvSCtHq2UhzmGL4s
         HOzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtIg/yGzxxRwUHqUF2BQPMTg2JbDI+IjZbYU2iJLcN+p5lZt9ADd61Ow67rmsCS3bxeGYfboNO0jtk5f3lQw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1oeTn/+HvLSeNhkQAJmrXwGqp4tlxavcmDn+qEy4MAjbd/azX
	PwaeQ+/H6NLjMZFybbRtwzj9p9lWvwCP0xaPqJxwC5TvZF3aPIhYAHxA
X-Gm-Gg: ASbGncsBQUMYgJk21e01weBv7UsYO31rAY4Iqi03AK2kISADuLQbE8VBjRnBsqVYxo3
	q71bcASyKpbAeGm9PH0/chJSTedLZo7wnNh2I+dM5JKatYulRAYMbM+XNInxPJ1eTDbNzXWUMya
	Y1hx20ZrJP93DgoBeSXhS/6q9OmrKpCNJrCC1szBoEj0g6Xbji1lgRNHsNs2E1Y+ZfUyj27bMBt
	ZP0oajix9F9djgd4qzB4WsvhPZubRAhvWVz2zmWGEBUm6F1JLj1zuMZ/eLqoMskXXyneIM6YOtP
	zTLqj9Hb6bU1cmhVFiIbesAoz8k1ma5YQqij8q9bKPQfNeqmkoFCxsf+rP0/S3X+/7fAsuR6PCx
	46Ux44zymJH1J9IkShzBpIYHqXrCHgAvtSfSfogPClnSpZT6kONJ00hGHX+eqVMNuu9RSb4jFyK
	pY0/eUlvZGTHWcohhZ0QAS+LRD+ILu6aX0EcbEKMM42pVj8pnG4mBd8LKAJl4bLuek
X-Google-Smtp-Source: AGHT+IEVtBuMpzBjQPNdH7IVEG0SJF2D+Y5V5JJi94cEhLsAluhw17DTDY/3QS2GycUVnc/8hA+KDw==
X-Received: by 2002:a05:6000:2c0c:b0:427:928:78a0 with SMTP id ffacd0b85a97d-42709287a50mr11351360f8f.63.1761080573883;
        Tue, 21 Oct 2025 14:02:53 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:8b21:7400:b8cf:c119:c08b:a64e? ([2a02:c7c:8b21:7400:b8cf:c119:c08b:a64e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3ae9sm21747689f8f.13.2025.10.21.14.02.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 14:02:53 -0700 (PDT)
Message-ID: <af7a8880-e166-4e1a-851d-31b731c2d2fa@gmail.com>
Date: Tue, 21 Oct 2025 22:02:52 +0100
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Igor Korotin <igor.korotin.linux@gmail.com>
Subject: Rust: Manual reimplementation of C unions and layout testing
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Benno Lossin <lossin@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Trevor Gross <tmgross@umich.edu>, Andreas Hindborg <a.hindborg@kernel.org>,
 rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

As you might know, I'm working on the Rust side of the I2C subsystem, 
and currently looking into representing `struct i2c_algorithm`.

In C, this struct contains two anonymous unions for callbacks.
bindgen generates rather awkward names for them, which makes the Rust
bindings less readable and less stable.

I'm considering declaring this structure manually in i2c.rs, effectively
copying the layout that bindgen would generate but renaming the union
fields for clarity. To avoid accidental ABI drift, I could add 
compile-time assertions to ensure the Rust and C layouts remain compatible.

Would that be an acceptable approach?
Any thoughts or preferences on how such layout checks should be done 
in-tree?

Best regards,
Igor Korotin
