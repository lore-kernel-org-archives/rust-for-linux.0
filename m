Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795737378;
	b=Bo5j4AkClTNqx/37Wteagzg2xiFEGE+a9FttB6hlI8U2Rxe5NVLoSvBd9qZnzx/3xprD
	 5fIuM+BZAT96maX1AoykrMd6rSyn6A4Oe1IhQPLaq7f2+PkzHBaTp25/nLxlrttHxEiIT
	 AMUbdowFwTcBkM4uulpLnWBVv2TSqN8I5gN0jy7o9fcarWJz33HeqG/HvbVETwayF318v
	 m21xeSbgEJt/X+DwjL1eDweIvY+vrQTWZjvJwBUSYKh1UlOKZQlL+i3I8DKg8mFg6B7SD
	 Q8QFZDf2fEcDXYNSValMa8JCHcIjqcddrSeX4IXkQH6IYiZ49g+Vn9+W8LGLWPdes+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795737378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=LaUG1WyYJVQ7dlLvzt89P9Dst4rSbBmHbm3uXYe8MRQ=;
	b=ccm2A+dPfl3JuY8rUOiFpyOZYwcS6Vur4g055qc/+0q0gFubG/SLiQdqFfc9lzxuNKvz
	 wO6gQChe9TrC1yqKa59hQkdCWb/jUJHxvpYjRfm1GtlzdnDT/rT52h5X5bW6F3DeCUIsS
	 GezVlTD3mHPu14oCKTyI8PAVsnyZ6waeXnFan8m5E5H1nS4sPpLzMTbvnXC6XrRke39mV
	 b4Gg0exR7RyOILISCpwHvYDzs59WidZ4Po90tZyJbXm4y/uJpeuv0QNIyuM105RxJaYqm
	 P545ZU77o3ml024AzaBqtB9ckLQMoU+tQN1zVlOpr6h2hr/wDF9PmHIt0vkbyTDJVdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikJhu+W6;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C517606A31E
	for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 23:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C517606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ikJhu+W6
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1b244fb7fffso8160515c88.1
        for <rust-for-linux@vger.kernel.org>; Thu, 26 Nov 2026 15:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795737377; x=1796342177; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LaUG1WyYJVQ7dlLvzt89P9Dst4rSbBmHbm3uXYe8MRQ=;
        b=ikJhu+W6juEwDhcC4tRupeakNXkzVbxGKgrdXD19Dy4SL2lQ17Ll6DeeDvZdYxOUzI
         +9VJIZ6Y0Mz5hi4u1RNa9gEiLZZGWOwDCcgkmfYyslEsD4A/9tjVbewqlSsT/5a8yWkN
         fjYcVYejRr8Shh5mw1hejUuI0AqxvmVhOcyjN0QldOZuyg0M2uGFGpgZy7v1xy/ldI3b
         CtfgNjN9maYwagLkdJTFVsA9fwYtKiQoSRWsiIYDG4bm94qmVdJc/6oDnYd0m8gl2G+n
         heR790DtFHFunGZt8xeHakgTdtNj/go68pACV0o/+LwIdqH0dg2XfAENrus/gbj97vd2
         r1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795737377; x=1796342177;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LaUG1WyYJVQ7dlLvzt89P9Dst4rSbBmHbm3uXYe8MRQ=;
        b=m+5PUw2+w81mh3zRcuD7qTEZdImB2PvD/3PWNWPxY+2AM7xD3NjzLMYzoqSG3RiFPK
         IG10inz/3Kp0/GMHqAQ0vpKHyUhzToOLta1zkTXKkff6U7vwOnr15MKa6zjRHXVSJeCC
         wrHoiUkbyTfRtbLWXBlIhz2glKTwvr0+/v0eUJtk93XsX54sMgsl79vdnoYVp7qKHMQs
         r6cgxzbGHJ8yr0AOgX4KUZ5NEmderMb53ogkOjMPWx3Zroq/Y7LBqtaZg5WZ2sA1F3sb
         jyarernl2Cx0BLFbPk3RcXAJa5ponsOLtNgfr/FGtg9FxH5SFJq86BAVGqKDhoHgYs7c
         CebA==
X-Forwarded-Encrypted: i=1; AL+hErED1gqEVDCusOq7u3D5YatpfRWAjwf5/fxZApwvufCKC5CXwolQUC3zDk0DXEVSw2hL/e4HUhJO0Iw0ep8VZQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/arUu/UMm70RyAmHzp45n6OjHafUT1VlC6ZUnc46XCdy/X99Hq
	Nux/mLqL+WDPGPCUpmQ4IlaO5tk1XneuPPQXQasoZx8iXF8HSJx453OG
X-Gm-Gg: AZFdTZd3car5Q5QzqpbxbOdKJvDIk4UZT0hxrpPZ4D8OM/enHoPpWvpLXBg/PXVefWw
	e0X76S05JbAcFAqASAnHvhm9YnuA7GBPWT6vLLhYXK+MwD5eSNWjxEAXPv7kZEGMWRCWajDp7k2
	UQ6djG6CqEzB3LehNjQB3YiBufFz3yBjiRYfisT3ZurwoUU31DJiun6805qyiWBaAUAUaSrO+ry
	4f2mMY8rxgB3Fpd0HgTrN4wBXRGQEWDYogyVoqbUEOXmnMypqYzftLUSQFJyZMrxyMoKM0ZrsB5
	rgZI8myFliguiRfyBeU+jzPXcWP/PpesquWT7FOTGMbajm9j1dsITLs2OqkM3YKWX2GxzKR0cFE
	JC5znuOYWNoD77K1wJBIwWzYChu4sZjIwSo1j5Fyx0LqUefWk5KSzxjshlNqBZo6zEjUYT2NGEj
	0gdQjHA+XWe2l9ziUlJtChAHdpydB69jnOBxdh7uQBm1RGhny6yRWPERutMvfbgG04qc5vfXQgw
	yzbSOsz0DkoJcE0mvrr9sS8Z2LMf3/dZeVAQLqr0bk582e70bkBSOO3ZagaCUsqgrahx2ISRUN5
	BZZEVRCkk4osArWjVa4hEga9ZLk=
X-Received: by 2002:a05:701a:ccda:10b0:1b5:7477:ff7d with SMTP id a92af1059eb24-1b574780064mr13682312c88.15.1795737376560;
        Thu, 26 Nov 2026 15:56:16 -0800 (PST)
Received: from localhost ([2001:8004:6f80:e4a4:63f4:2ea2:b5db:9dfa])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm51067878c88.2.2026.11.26.15.56.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 15:56:16 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 07:56:04 +0800
Message-Id: <DN5JROQRBFHK.1T3SMLE6KKBVD@gmail.com>
Subject: Re: [PATCH v2] rust: dmi: add basic DMI matching abstraction
From: "Nick Dowsett" <nick42d@gmail.com>
To: <nick42d@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Jean Delvare" <jdelvare@suse.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261126-rust-dmi-v2-1-33064f0bb005@gmail.com>
In-Reply-To: <20261126-rust-dmi-v2-1-33064f0bb005@gmail.com>

Please ignore this - I missed the `#[inline]` annotation.
v3 will follow at a later stage with this corrected.

Nick
