Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37862390205
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Mar 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772617982; cv=none; b=hee9aO2xegHc6hilBSCcUw01piB3mDsMEeSPWaCwL8lZpO6FtI98kQgsMnZF763uAj2gcuO2tqAaacTvG9YxaOiEf0xxsigUzFlIHUuE9aQRkq+IMinO+sQuFqxDo0qRgNqzW+uSu2CK1nrrLkA/Mmd0oqpdL0HGbx2p/j2p8oY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772617982; c=relaxed/simple;
	bh=a3mln1kEP+59PZ9KmiBNaErXa7H6SCVIYmETnIC8zew=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=DsFPdZ2HaqhCTob6SO9MuhCCuZ7K/kDMm3gsa/6PwcJMK98Wl/+Zkklgvmucc2V0zNCLcp6z7UPciUan+1rrvXLShYpR38C3BjJeZvJFDgaLCOQahus457XtDCn7Jwo1TQs3htjg45QuxexbxeGqVE/ti2tzcP6YlcE/RO47CrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hatZjevA; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hatZjevA"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3598df39444so1868030a91.2
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Mar 2026 01:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772617980; x=1773222780; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3mln1kEP+59PZ9KmiBNaErXa7H6SCVIYmETnIC8zew=;
        b=hatZjevAYN2rxcV+cmIkgDyD4co1A6rAs/P7CVeK7QpKscw5n1cvQlUrwhcf0saDqf
         7+HiLBdzWTZExmzrv2dPLGh6k88S0QAlLkGEVkZ2JV8WNa8Kotb5DeZX8wO9ZcSibx1G
         Jbzrp1zFqNsKrALL6/4YIuzyPN2xJoA9vAZdJKTFQHAYMrH/s3hDNLGHJzSwA7I5QfRV
         1MdP0YPMORO9eYetzyFyTdw9CdcZ9z5nju7D0e6XmEW+sxGsBU8I1z88ZhSh6NerOFme
         LP3h1Ydu77s68KN21xLdeg8VsJevMj4JyETMUN3bIffmsqv3A9IUZyhDCljjqzREN2AJ
         j8PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772617980; x=1773222780;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a3mln1kEP+59PZ9KmiBNaErXa7H6SCVIYmETnIC8zew=;
        b=gnpXqrhgWKYWuJZ6u6HmayYbkso6f9AqyYgVR47J861xqmu5B3LsIRuThgYuF/Yj18
         KYbsmKO4rtSWQtIbrVWJ6LGwLuprfzdrH0kZCictFZ5mfnpzER3er+OSBYtAW+9GOHwj
         RIgxfE+RTgWcWmFN8BNhB0NJOPcG1J7ANIfT6gi+KpM9ZVz2h1TXkBmB+wCaeW16K3Ti
         ps1maC1gvvl46SpmFZEl/aDNcE4hOwiZ9qRtsbzyIaOPZQp3iZuxhRlpZEPJIwQaTOlI
         irHx8SBmJeDYR3sdhFFpZFX19nFxsAT48ACcnc4NMgurUfhSrWJWhSwqiPCUre8HvZEj
         FC2g==
X-Forwarded-Encrypted: i=1; AJvYcCUACQXHBE8a86lAMrKDvkkd1d2Kg5KkdCADLdv4XCFE2XCUcywWK56QpwJbKH1ZTexgUGumraNgXO3uM+43IQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCsdgRr6cbIbNrNJmoeJnr5Rpf6vkA15u/yUXqRzjuzTDLwmUu
	k/JpqDyBUSAZV6thAJVaYfi6K867sfbnxZWeTsxjPwSgDCvJQ10the/a
X-Gm-Gg: ATEYQzxr/YaMrjISwARX9c3MWbvd7l63Fv6j0+cGZxmN+Sm3jOCPMyb2Spy5CE64Z8P
	MR3mu/ebqMUCxy1WybNvL7ZF+wfndxzMUUU5vq+k/ctFElEUNkufuIWierMI6lFeykDfx09KlK4
	IV1Azb1jNJBg0H2JTZ4tlPz3WIMp69NnMazpldVfrvcIQ19gUSoJReGFCtFw6EwxvbDnwi8Ku27
	Lit08lfb7YgDF7xO0oXKmTNcDZSVhGzlqx/lIrZK5G7renOba7VI8nYgb9+9s0DB3sk6quHbGlL
	+kGpc2rts6kVwmJKgqtfDTkSQ3Q026nmhSp4ro95LJL10itDJ+nj6qr9TNdUO83ZcXKtTxD57ZZ
	RdmQt76SK82uVg0KV/pihl3XWH6dlPgmAEkVgzI3wmv8YV8q+tQiynG4OBzgPV5ETuL8yse1D5F
	SyluuvlbubBC8QJd8Inw==
X-Received: by 2002:a17:90b:3d07:b0:356:22b5:704f with SMTP id 98e67ed59e1d1-359a69d9ff9mr1485561a91.15.1772617980556;
        Wed, 04 Mar 2026 01:53:00 -0800 (PST)
Received: from localhost ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0787sm5563221a91.15.2026.03.04.01.52.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 01:53:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:52:55 +0900
Message-Id: <DGTWMO57AFUE.22DFGS0HKH2BO@gmail.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] rust: take advantage of newer rust-analyzer
 features
From: "Jesung Yang" <y.j3ms.n@gmail.com>
To: "Tamir Duberstein" <tamird@gmail.com>, <y.j3ms.n@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260109-ra-fix-primitive-v2-0-249852a4145a@gmail.com>
 <CAJ-ks9nd4Vmbgw8gOajhU7ijgVrvcqpQL46rgX-tuPN1QOQBVg@mail.gmail.com>
In-Reply-To: <CAJ-ks9nd4Vmbgw8gOajhU7ijgVrvcqpQL46rgX-tuPN1QOQBVg@mail.gmail.com>

On Tue Mar 3, 2026 at 1:58 AM KST, Tamir Duberstein wrote:
[...]
>
> Hi Jesung, is this something you'd be interested in updating now that
> type hints have been staged in rust-analyzer-next?

Yeah, I'll send the next version within a few days.

Best regards,
Jesung
