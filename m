Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C82757EA
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 09:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766653818; cv=none; b=pngE09taW6mgNUv08+Vfqr7cEhk59otphdQejpLKNBnUHSf5HHr/fSUpkNGWpjc3sa+/MscCcaWG3QO4DgxeusTuJwXAVi5cFdyvEQkLS5HjQS/rv41NY2/KEDVjmOMta+atyTIefisxHuEJzjLxGA/ioRvc3Y1PelJX1oMsfbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766653818; c=relaxed/simple;
	bh=fidimhvskzenC8vv31RTcoVsNcs3n7YKe+cqigb2wvM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmA1axSupax5xqFol5I8jBdSRkM5R1a59ynncuyD5uYQNoOBQSRHL0gzmTK3mH5/HxYIT9yeFjGGp+TlphgHJjtHTImOKqdOimP49C3IyKQ7iZbKzJNghQHPP8+AjxqaT96L/Y6gjdwpdcTGwfHnzWuvalJJUnSoX333OL+Da9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+i5DDdb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+i5DDdb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-34e825b0c42so1168136a91.1
        for <rust-for-linux@vger.kernel.org>; Thu, 25 Dec 2025 01:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766653817; x=1767258617; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fidimhvskzenC8vv31RTcoVsNcs3n7YKe+cqigb2wvM=;
        b=O+i5DDdbAJJj21ZaDgaIHWMxgo7WgQrHK/VDvdHPlwrVYEXYmheYkIdx6Wqf9quEbT
         0cNfhZNnXQshmzjnmynSD6F6mdxSxt3jT3wg+FzRcnOmnOsQTk5k10t4RX55csB463ya
         a7PkZCqtUpgmLGEgV+tVX3+CF7N8d+9ZX3osT5X9mShw6Ho4a51gjYSrpBszaqiozH3y
         9ExPKtcLVYVmXStqBncpE4Fp5wgNSWwRw/KoTkqXZYqQxVq9RQNyjwNt3gzV9Fo9prjN
         L8kHpyYkG12Kj/Q1uGmBVfhBSG7plnviKoiOgnpInqabVxiEdtQjc+c6ZZQSurV4tyrF
         r5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766653817; x=1767258617;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fidimhvskzenC8vv31RTcoVsNcs3n7YKe+cqigb2wvM=;
        b=OAG2H5EX/Z0xzw9OH0oYlMuYSAKjprbRePV+99mIJQTZwYMH+zjVwbGwL7TmNJvMAk
         BOmBReVGnVshpHRuumNbCpDdtzT7Ph48Uck/V3RMcpq6iRBgcEpScS3Wfo6YfB720/Y1
         Q7e06SDoig7ZoKpHlCleIZ42S+7N8RaL+ILmQcx88LsBX4/Ua1COADzVVarJg23/ysN7
         tN95zEc6D0h8JW49XkxqbN9e5hX/fKblQ1MITqO2DCi+78gVXTL+oqnr/zCgX3bHAUqO
         6YfYX+mc1S9ZYJBZWKbAA4ItO3eByROk97TofiBFuqEC+5IcDGZS7GYK36uIdha47Pmq
         rJag==
X-Forwarded-Encrypted: i=1; AJvYcCX6cQj7r4ShxG8SvvGeDZguNmmCMICgQVwUjiOlCVDnjdisEDx9G9By/TL5xoQr+rDOou34x5OTsb1llQ7QOg==@vger.kernel.org
X-Gm-Message-State: AOJu0YysOWX636ga5I0XyyJMdubNcXhmZ1q4uPoQ4QABzUGijINOW3jZ
	po7wwj1LCij3wMXRiQyJ7u8RarSdHwgYKskv61dYXCwa+FIWgFp5VixOl9ZPWDgy67d/WsZU4Dw
	e60vB/eNrBuDfVtA5X57C+m6cSndjY+U=
X-Gm-Gg: AY/fxX59REiW50mfZGrN+vTMUwIj7pFuX+Sl17kDTa+C+Tqq5WgjOceTqRZaMw/CSDV
	wxOw7GcrYcC+gTF7mWvIAD6LrlxLlsPz/UK7L9MwwBfr0ob6tp58oA9HWz8MyX3oPKqKA56NTPP
	k8bvLKHkyKq2FyRrOVyMuXvhiRVRB+Uxy31AQ9pzTF/UNYqUScVjkkQUfhk5E6ip1boC+4r01xt
	kGwmsz2Wr3J2OIYirtOgLX/dP2GAtM+aBfnvbr3nM2a6bx/EWdzCt33VL4inYMqRfu4sPVwFBHk
	RoUw1UYZ5QoNgjUY8sVXJSdpqjt8JQ3k/Ro/unfYiwWhOzIdG2mt4hk0383rOrWDqVVfrLFfHXa
	KdzbhjC5/1I7M
X-Google-Smtp-Source: AGHT+IFcX1yBOStOKm5HdMQUD4DJ1B1ik5oviZQe1zo9UG/MP8cNODSPMd1h6tL4mWPgoT4qrIX/TF6a+BH8rDBCMsE=
X-Received: by 2002:a05:7301:4090:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b05ec45daemr11153031eec.6.1766653816672; Thu, 25 Dec 2025
 01:10:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215025444.65544-1-boqun.feng@gmail.com>
In-Reply-To: <20251215025444.65544-1-boqun.feng@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 25 Dec 2025 10:10:04 +0100
X-Gm-Features: AQt7F2o6kyHN8cKX_uujVj8hNOuUsXA5ClwSn19v52Gv06vvnfMS7OSidQW-HuY
Message-ID: <CANiq72n1SX4OGFR4wNzurNX2RQki_ZmD13bBfywxxOEmw6cGZg@mail.gmail.com>
Subject: Re: [PATCH] PCI: Provide pci_free_irq_vectors() for CONFIG_PCI=n
To: Boqun Feng <boqun.feng@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 3:54=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> Commit 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI
> is disabled") fixed a build error by providing rust helpers when
> CONFIG_PCI_MSI=3Dn. However the rust helpers rely on the
> pci_alloc_irq_vectors() function is defined, which is not true when
> CONFIG_PCI=3Dn. There are multiple ways to fix this, e.g. a possible fix
> could be just remove the calling of pci_alloc_irq_vectors() since it's
> empty when CONFIG_PCI_MSI=3Dn anyway. However, since PCI irq APIs, such a=
s
> pci_alloc_irq_vectors(), are already defined even when CONFIG_PCI=3Dn, th=
e
> more reasonable fix is to define pci_alloc_irq_vectors() when
> CONFIG_PCI=3Dn and this aligns with the situations of other primitives as
> well.
>
> Fixes: 473b9f331718 ("rust: pci: fix build failure when CONFIG_PCI_MSI is=
 disabled")
> Signed-off-by: Boqun Feng <boqun.feng@gmail.com>

Related: https://lore.kernel.org/rust-for-linux/20251209014312.575940-1-fuj=
ita.tomonori@gmail.com/

I guess it counts as a report, so we may want a Reported-by (Cc'ing Tomo).

Cheers,
Miguel
