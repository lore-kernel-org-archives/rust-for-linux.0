Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD482153E7
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 13:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765717884; cv=none; b=hXqVH62npvWHNcbfr1k1+rWm3IeoVmLEnXQ5VHDnCAU8YNokSiFBQZFrJb+IvtC14XyRX7LRghJTTKUj2FmAA7bu1jNBxj5nKJ2vqeHt6KRl1h3EJ87wjap3+Mqs9DQPlZtbAgjuQFQl2eT+xySR6f4Oqj7gMd2F6Ci8AykW/Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765717884; c=relaxed/simple;
	bh=qAc5c5CXIpOe28HklUPQOs1np7gCZo5gNjX84D78IGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=POxB6qAqphnm3gUnpkK/EIE3r3x5tgebnj0gMPpGzff7ZJFuffiEFI6Xfk0IPF67y7gArE6ezY/U17YlIhrV3RFGGEWyag7AHqiidosZnJ3g8te6MBUE/+FEBE+9++jk1lPASqgtMq1tqiQdLQvDu0ICTP3MyhPgwKgpSk1IU9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BaYK2BZ6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BaYK2BZ6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b3c5defb2so1566403f8f.2
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Dec 2025 05:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765717880; x=1766322680; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRFv6Z3hOE5MgiaLdERO/7r7S0LRw/2DuHOWz18/LOA=;
        b=BaYK2BZ6wV7AmdR/16bwxKGlYsx94ab5LxBbhun+F2Owf6nzJz627L3l2YTV/cT1eg
         YtTmKgN3qGQTE3VsMiXjBziZrEVWtVV7quy26MrdEA8YMlkgKZFwMATSXsfRgW6LtwVp
         6OLSeY1Rqqg2AaaluCHAS/qxpxOOZae0aj6Pbanb1N4zJlWJ28D54WAWBCSiN9JJ0uhm
         ayXSyFzcmqWA50+F6z5SYrNY5TqBOJ3LiIq/dJyYO2yQDE8r7Eh3VPRUvGiUL9sfWIJ2
         Wr/PBMvIcfIbdzO75u5Ly5tjQKI7nUIBOgxz37djD12z8eIlzk+LRifvFqfvd+8PFbv/
         26Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765717880; x=1766322680;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRFv6Z3hOE5MgiaLdERO/7r7S0LRw/2DuHOWz18/LOA=;
        b=w8UIwB6w7m+LPNKvav2EGAIp+Zj2CSENTYW3ttNGvmJ1vb6hLUlmLhhr2j4wBqyCQz
         xa4hC8X6VGsdNqdKhwsR/TeRVHeHHnFlqRz+a4ocSdL3L99+0kzTnDlUr6jK7uFqJ3Wr
         sJDf1oeDOWwP2N4+XvNRqgAixXIQfTStmEPXDxjMyGFZfyTrM+K0eeuxTAwZY4vN0HOn
         tRJK50l9kQMn35kZjqFlymMHS28mc4+CAPF3W6LT/ee0GAkH0HQ4Aoc1OWbqT4OtfWq5
         0IvFQkS5uNUIU1rdYkzTitl9QXq/6jRIqr6WXZyOGCuI+NxIzgkRx0KImpqsPNZrEbAH
         Vtlg==
X-Gm-Message-State: AOJu0YyoEzaKbq5zjIGycol1kBD3YI6nuu1xaZLiqxcufeuQR556I9a/
	VDxMvv8KkPlZQYs/ymPZ7SWCr6UbG9RXmC0cI3mUgn//oYg+Ca9UaGYlrhLkJkoBNiwf5rZq7wP
	wEa/GYXqtqQqs7FK9tSdWmdEAz1hH2+SDrzTzENg=
X-Gm-Gg: AY/fxX5XvNuz6HuXbUeX3Xh0xtkxoSzlaFBu4weSBpIv02WejK9iY25Sg/6u/IawkcP
	dc958wKNcG7PW2KZGoA6w681L8/TAg/UgQizNs6F55EZhllu0TI+cWlmVYDuAKYwdlVPs1f40KH
	UBqvqPKH3OIvNRsmCPFJXsYnP9Ou8um1VwNB4t9Enf3i4k7MDIFhjFzaW/clN2XmgfxWJSVBkdC
	fAKhyLeFD3a3jLVjeJX4CFrmni6//+bbJvVjQ1L/sFGzkAUA8xgb7dJpnowWVAgUD035Vs=
X-Google-Smtp-Source: AGHT+IH2lZgakateaVXby7/lXt3PokjCBuOsCI2aPNrCh2v8wFjAcqKEGHysezjTPA03BTL9uzua3bTs+lc/itCCJyg=
X-Received: by 2002:a05:6000:611:b0:42f:7616:6c7c with SMTP id
 ffacd0b85a97d-42fb44e3cbbmr7583847f8f.14.1765717880312; Sun, 14 Dec 2025
 05:11:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAO0d=D-+p2QbA9bxOSO0rd185GY5Pe0ruq=A=hcgTvovC3d1oA@mail.gmail.com>
In-Reply-To: <CAO0d=D-+p2QbA9bxOSO0rd185GY5Pe0ruq=A=hcgTvovC3d1oA@mail.gmail.com>
From: Riccardo Adami <riccioadami@gmail.com>
Date: Sun, 14 Dec 2025 14:11:08 +0100
X-Gm-Features: AQt7F2p801seByU9Y4AlQQFdgVHN7C2yi2dQsmH6yBB3vTQ9_gAb6Fw5Y8w4nBQ
Message-ID: <CAO0d=D8c_JYAvhe6cB-R+23-uxH5AnKi7TtuLA3Ra3hfViiGgw@mail.gmail.com>
Subject: Fwd: [PATCH] rust: document safety requirements for fmt::Arguments dereference
To: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
Da: Riccardo Adami <riccioadami@gmail.com>
Date: dom 14 dic 2025 alle ore 13:54
Subject: [PATCH] rust: document safety requirements for fmt::Arguments
dereference
To: <rust-for-linux@vger.kernel.org>


The `unsafe` dereference of `*ptr.cast::<fmt::Arguments<'_>>()` in
`rust_fmt_argument` is safe because `ptr` is provided by the kernel
formatting path for the `%pA` specifier and  during `vsnprintf`
processing.
 It always points to a valid `fmt::Arguments` value created by the caller.
 The value lives at least for the duration of this call and it is only
read here and not stored or accessed after returning.


--- a/rust/kernel/print_dot_rs
+++ b/rust/kernel/print_dot_rs
@@
-    // SAFETY: TODO.
+    // SAFETY: `ptr` is provided by the kernel formatting path for the `%pA`
+    // specifier during `vsnprintf` processing and always points to a valid
+    // `fmt::Arguments` value created by the caller. The value lives at least
+    // for the duration of this call and is only read here. It is not stored
+    // or accessed after returning, so dereferencing it is safe.
     let _ = w.write_fmt(unsafe { *ptr.cast::<fmt::Arguments<'_>>() });

Thanks
