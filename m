Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426440;
	b=rT5gsiBQh/NZr9cZTuzXtKBDEHKki0v6Z/WVVt0OXQFeLhXAuOy27e/NB9GZC5gzTXgc
	 oP970D0lGVILsAN6Wntg3Lvv2t15QfCr/Zs90cFRRutRxbgCpYPwjWJUL+aKFO9uTYni7
	 pTVt8LtmPRzNpbChNUd0GxqbYFB/l25TDkCN5vHvCY3bqAMP+F6sEaZsHGRV7B9bGpzIG
	 trJEAllshKwft5eOf6cJz6kWzeSv49/keANvbKPPPmRK1tpD902OWh1z+1h7mSJTdbFKW
	 Jk9d7qEpb/0zPuV14JVQmPIu45fJpmaafqLmIDyrhMnd5jiHsn6H/RlZMDtfOZjLy8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
	b=xOAi5Bt5H4OXsTmcs6gChHYJyDArCvmbhf9z+eti64nBbKgdgYgI10DoTMpBjeaGq7Mj
	 8iFJIuhH+SzdpG/LWDa+lfuSdNo1K0U1mMTgbV584h7Tab0Io8SGYO3CMlb6m0hf1w4Ar
	 ukb7DzoOKu4mqYeQkfSBz85qAoBxed4Xpyc+f7IHRCXSeaXG6rMOd1eXJl9KpQudBPJ/O
	 YHQtCpd0bAY/kfRiQUh6CnAnuFupu/XdPx0jSuZKajfYrj4CxyWOzxWxIseC59LiV3cBC
	 LJILDVjwSYpBiPc+c+ZJ0ia7iitLNksZqgMqAjx2ljTWw2hDh4cHi02L6/Pn/silztw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGCix4OS;
	arc=none smtp.remote-ip=209.85.217.45
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED87606A333
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 16:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED87606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TGCix4OS
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7cc2bb73cd9so610389137.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Oct 2026 09:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426439; x=1793031239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
        b=TGCix4OSFUVd2foLkH/AQ3yvxD1aX1OJPmYZ7YehqJhxPdSPXmXPixodwvOoqXvR5k
         ds0P+wHXh4/5EGpnSs9+gF7w68GF7tlvLHhrUsK4fmGTF+bjxwhK29DwnQfdwvzkTFDH
         PUZiIvyZG5PX45NXM662AbBKlUVMK/mLq4KsrBME26k98B8kVKz+LN2MyhRjVjp69J7J
         P0nyleuKq+3hDm5xPzXOCHCAQLrSMT4wUWfOjFHrxxTKmPNCYOP/s6iqvHLlYTGO9w2d
         ni8ag7nItDl2SaLCiOD86eAVjcC9MmHA7+ts2eUv92XMBJ5UyvDlVHTn0yUe2SAj1TPB
         ZjYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426439; x=1793031239;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wE8DD8N71MQfznU3Ft9s/Hf8dnnaSHV9fDu9XrNDJAk=;
        b=iNOlOUJeWep67JvxUw8x5QmQgbC7hscg5Dfn1+mkoBIDBnos4mUgfPiY7bbyfk9ahX
         08Rj/lP3qr6jNvP/XB5/n9mEa6+BS9St0BVK2eOSp1zSSXfeV4TwD2ghDQ1Htmekuu+s
         F91ZDmGHm9MffWC3yyZ8UCsTgF5JFOYQG3z71XTosPNyi9PIc+olJcBmBV07I4pohQu+
         6Zurc/qnEwirJSsK9oOwiJY8P7iHrd3oPwuMs5mM7IUMeg0kqMGySymmBiyo/8K/EnNq
         VpwDGeSndkksqxwVU2Dt/w8caH2cySit2t/LzX0HZa9VjD79yrtj+uYsNwBBhT+wDctF
         oSlg==
X-Forwarded-Encrypted: i=1; AKwUvBxdT2/id+MxdqmVyAkAFyZhvXAUmiJ+0vnDfAPZkRVRZui1zfvfkg5ymMoP8qBhJNdks1L/taiWKnVW2gEg7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSpGq6XRu73y6tqoAOQdti7m1mnOJH+2xIb6MSVZ9d8eLnDZ4k
	hQoVndWVMcboBmRPUGQML9JuGaELUXTXF4ylox2vukCK6Vg827J0bzo=
X-Gm-Gg: AYBFou3yuYLZjIOtY1K43UWMA2d/4APCPrFwCMe7AUkgq/yIGdTAdFk+/wmr47+6rmh
	tOOWfNDD4qYnvFrVktxCrk9EjgR4vCLssArdCPyeDke2LhvYSVUNMC2ETvxvWm5qzPbULOfU3YI
	L6JTGOOlskOdRS+jO7ra+KqNo9FQKqO0Oxi3mf/zk+TPLF/DA1usCwGtGtS0L8LBzJ9TWUb7Zb9
	1W2rNKspgWTVMlLbjfpGU7kl0clRaN1FmfLhu8Zn/gOWj0HGHZKwp8tX1y17CvtCy06nv57kXud
	5KIweqRZWuVBveNDABicxpF9GvDo6Bz92yLln3c1+GZVdaE+sdDUTFlnth9RX1jzlGu+B8FPl4U
	+zhwrKm4yyhzoOmTBD41i/4OqPWchzQT44MpfG5g0WnO5BHznYYnVUni2MtYWVdQCa5r9d4XUf4
	Qv9sUl1YaDKIHtlBL/Dp3CElKjB/SZp0QR+/cXKivN5NDu3OQEGGZjyFzS227xnItSc6C6IIWqy
	pI4zw0D5yyjKIWp10AdFC/3fSA0Fd8z/ubdNhDyeaSZ5h/l4A==
X-Received: by 2002:a05:6102:5113:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7cc368f6cdemr2108176137.10.1792426438620;
        Mon, 19 Oct 2026 09:13:58 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb38f7f1sm525062241.10.2026.10.19.09.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:13:57 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/2] remove TryFrom<&Device> implementation for pci and platform
Date: Mon, 19 Oct 2026 13:13:36 -0300
Message-ID: <cover.1792417858.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

This patch series removes `TryFrom<&Device<Ctx>>` implementations for
pci and platform's `Device` struct.

To make sure that there were no remaining users, I checked for usages of
the `try_from` method and the structs implementing `TryFrom` using rust
analyzer, activated the modules that were using the structs, removed the
implementation and compiled the kernel (did not trust entirely in rust
analyzer because it does not find usages that depend on this
implementation like the `try_into()` in fact, the last usage of the
trait was a `try_into()` in pci).

I did what I described above from the most recent changes (rust-next,
linux-next, drm-rust-next) down to the introduction of the
implementation, stopping in all major versions (7.3-rc7 to 6.19) to find
the last usage and mark the commit in the `Fixes:` tag. I found no
usages for the platform implementation.

If applied to current rust-next, commit 7c306f00835a ("rust: zerocopy:
update to v0.8.62"), nova driver will fail to build, drm-rust-next and
linux-next are ok.

This series, along with the i2c patch [1], closes:
https://github.com/Rust-for-Linux/linux/issues/1264

I made this a series because both TryFrom implementations were
introduced in a series:
https://lore.kernel.org/all/20250321214826.140946-1-dakr@kernel.org/

[1] https://lore.kernel.org/rust-for-linux/20261019152329.620610-1-nico.antinori.7@gmail.com/T/#u

Best regards,
Nicolás

Nicolás Antinori (2):
  rust: pci: remove TryFrom<&Device> implementation for &pci::Device
  rust: platform: remove TryFrom<&Device> implementation for
    &platform::Device

 rust/kernel/pci.rs      | 21 ---------------------
 rust/kernel/platform.rs | 21 ---------------------
 2 files changed, 42 deletions(-)

--
2.47.3

