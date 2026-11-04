Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821983;
	b=I5oy5EgC7CEj55mQkgghkk9LqXsFzl1+M6kY4w4+iCmkJJDaTkOeXspjkemPQf/fs8gx
	 bvWw1RsyqOMDgN4wuGcMiNDREMtLFev9qeTZlkZi1aFNtddqq7ku3cDpu8+yHL/VWu2MG
	 6MZdHhPIuoctVWVwokJscWzLjdqWCRUIDLYooCGBnM9u/4GOX63dHi3nBsdk/9q0jyxax
	 7dpzzW4Maxrj1jzQtCE2Zincuxq14s04zp0g3lDmqopvaULPnSBOBSD4DdmHlpnH6EG+v
	 PBEfjTR2HpqJXK7xhqrR7dBegUoAInhZq/tA6EWB6cwmpbm56gcDL9JI771Zt9bzgAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=veFu+GeN/zVA2n2SaVCI85ywkvL139Q8TkIg1x4TZdo=;
	b=zUbGm0miqYla0Vjy/lVRbZ+agyIoa/FOx/qR1Krw2u437dLqp5RuGlSFSH9Ct1sB6GIT
	 SQnUteCbOBdcwPxbKyxIyRdvbwJEVCzqyncqZs0XdS3smmV6upl/hAbOj+12mMTauiV3J
	 A+tIu31RzPsj1ICI2+JsscjGVInRsadsLp9whRMYd12Ew/dNj/o4cuNaUcsBGx1R4IMGu
	 zW0mN+6TSGenzSaShUYwI3nLphrBNlpuuzgHeMoCwacEYHVBu8iMN6VOPE3VU+YEaBJRO
	 /MIDJiVBrATijb3bH9FDmptYGzgSY1vwEuUyQwOqxTmso48EwDCyP/8N0GCFFaEMrwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANJA3a98;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2F260D9EB7
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Nov 2026 19:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C2F260D9EB7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ANJA3a98
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9906c85122cso373538241.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Nov 2026 11:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793821981; x=1794426781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veFu+GeN/zVA2n2SaVCI85ywkvL139Q8TkIg1x4TZdo=;
        b=ANJA3a98FFvvIOpxw+9fKDajX7EDD2IFRKvH9PU+9a1uY4sPHSSxrQo6Gb2VOB+q6K
         Kkuup/Ar+oQar2+ucZvjAcMmZUaUYNVkQ0ouI10/NGnVLlAzJCDC1NlovCQiY8+xDL4A
         8U6aybAiThMxApJAxERlQ2os7ZsctB0tjT4eR4ehvvNbZncPKM7cu2G5kC3PGyDVjf2A
         9fCnF085z2qqlhcj17L1776oNFU884YV0+F1bDpYIqPccQNEmbId1ZnPdxl2RYBt3fMy
         8rabLD5Z2wZQuLs07BRvCqsYJ1ogEMzYz4hv+c5y1wE5JRRHUyuV+jXF87+Lx4rEuzuJ
         8rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821981; x=1794426781;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veFu+GeN/zVA2n2SaVCI85ywkvL139Q8TkIg1x4TZdo=;
        b=bHqgGpk255yIsiDZTFbkUtfZRUIaqq3lLGL9ieFmhtwCERuMr9W8XiFxy3uQcgz7oY
         rwQbFJ7+6M8XtaU5nQw6up4BzLj4s7ylQmgOSvAWJY/Ly2f7MOU9LUvWDZvFa5Nlnpzl
         AOS53bBOiawb2/BWrdNzjtY3jg6EKc5Aq2oZHGU6x9avvrTbfo/y5E5jJVkbKXSxNRz6
         XRmJBLg0PR9xdWwb8rPt1VxOIAjnPq+yppO+gLMuSIvmfFW7/xEL94Ndv5WFDKv2HK09
         +ZkQy3vRv0EoKyihSzGgnsGFMj/QvtabwZxjcsNrQ4fTycEZu/hgBjRvR0OI/54WKFpa
         23UA==
X-Forwarded-Encrypted: i=1; AKwUvBx7tKq3n3/11P7Xew8/5ikqrAY33t5XwH7Kd+zqt1WNkP87hEj66yioW39X68RCpRfggF5XMkbhyRy5pGIpzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/HbbRfErYhpA7jXwRVDZbEuO6DA6sS8Pr0P0OYy4xHwQL6ZREa
	OCzqs4U4B6u4U5uGkzGmk80N82GlSBTHcxZLXCC2sQl3l6c1pvSHEhE=
X-Gm-Gg: AYBFou3OoCHrFEw/NCyapZ8f9ruD9lqiVgPzxYBdfceNRu9FxjWABwUOzPNeaDbpSTI
	Dkz6tyinNZtt+VBEjZeUDRngcOEdjeBixOB7/u+LxwuNVlUhip3cgUTVLwwAfE14zR4S+ZCCK45
	+NDf6fO+C0CtS/UTEcDhzMFXC0+YhEPxugw5xHOnujjbLIEtTdlscrqngCdDqeG9HRQ3UHPu3lb
	wnPkPtbmqV0h2k82YEX9Pazj3ajWlwQVPsCJu9GTHbgmZuEQ4sGqQ7FB+1ci2jTNhYJhVq8F0Qs
	az9X/V7nwlwCYkYgNj0tPpYiTwi/SuW1CL9d/ON9ZV7THo8F6JBVxdSiD6DRGeYfC5/7TnDFUFc
	mhQQWY8WpV7U6qD4FNkEJquBURbaTYDLEKhMWy0+zTrB4KDv9wqTwpdGzRB6SmaKq1FIAQQYZ8Q
	cVAurYUOPjHhNnsdp0XRrKA0JhJ0xMjRchmjdzHW5xMjfmD+X7KbUgaYXxRiItfhlP8QamQtXnq
	GyewCx5oWRPJKw4TxXnszlz9tEQZYehyIw8Wg4q9AGjD97xyB8MO6EEMA81deZG4++ZKD9CLshp
	VJHSvCPE0yI/85PGISuJvpwuItcplXuQUrLbyWy44tZ6/1NCvt/8ZnINY9znP2U/W5owXUH5sSQ
	a9fzx
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id ada2fe7eead31-7d072baa450mr6439786137.10.1793821981337;
        Wed, 04 Nov 2026 11:53:01 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm2387237137.3.2026.11.04.11.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:53:00 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Igor Korotin <igor.korotin@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Georgios Androutsopoulos <georgeandrout13@gmail.com>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 0/2] remove TryFrom<&Device> implementations for pci and platform
Date: Wed,  4 Nov 2026 16:50:13 -0300
Message-ID: <cover.1793818280.git.nico.antinori.7@gmail.com>
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

I made this a series because both TryFrom implementations were
introduced in a series:
https://lore.kernel.org/all/20250321214826.140946-1-dakr@kernel.org/

Changelog:
v2:
 - Replaced "Closes:" tags with "Link:" tag in both patches.
 - Added mention to the soundness problem in the commit messages.
 - Removed bindings::dev_is_platform C binding since it has no other
   usages.
 - Solved Sashiko from v1: "[Low] rust: pci: unused
   rust_helper_dev_is_pci() left in rust/helpers/pci.c": Deleted the
   binding. Platform was in the same situation as mentioned in the
   previous item.
Link to v1: https://lore.kernel.org/rust-for-linux/cover.1792417858.git.nico.antinori.7@gmail.com/T/#t

Best regards,
Nicolás

Nicolás Antinori (2):
  rust: pci: remove TryFrom<&Device> implementation for &pci::Device
  rust: platform: remove TryFrom<&Device> implementation for
    &platform::Device

 rust/helpers/helpers.c  |  1 -
 rust/helpers/pci.c      |  5 -----
 rust/helpers/platform.c |  8 --------
 rust/kernel/pci.rs      | 21 ---------------------
 rust/kernel/platform.rs | 21 ---------------------
 5 files changed, 56 deletions(-)
 delete mode 100644 rust/helpers/platform.c

--
2.47.3

