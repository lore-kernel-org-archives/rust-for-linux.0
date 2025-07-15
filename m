Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640D125CC64
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752565431; cv=none; b=geYBIhYFmltsDmgbXqxRhR6uKf8FH13HrKZ8FhXfGvOn1VpEpnBRc54vKl4DsXx/pazDnQG3+bj+JJh1/4hZrO4jT6gUGy2+bmfMJJ8vX8pSgXJvW40hwG5qp05TQHR6qHrsIRbb/MCw0qDgEP1dyA83y1FAQ/6cDBBaLpnmW/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752565431; c=relaxed/simple;
	bh=S6ZBbnBRdm61eYlM0P1O6TiMquJdOsVhEn0le3DpHeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bvb9JtJqg8YBLw3G/va8zeMYX62T0HaHpQPWic0CUzAHY/TbhnRVdqpulRwo8jQg24185RXp3Kzi6GkoQwIr3UO/vX1uSP6WMikPW7Mu405g8qFis6La9LWC37wF6PIYJI+C8GhPfB9QBFRRhc08Uje5T/w+5AuKGl8DxEv6/qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0lHkNhXN; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0lHkNhXN"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-455ecacfc32so15881285e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Jul 2025 00:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752565428; x=1753170228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uOEo0Mg2XI7OcoOFqG5XTj/kjS9gvP/PzpP2FvhjQ20=;
        b=0lHkNhXNaHoEFJNmP7V19ubrjB5uQzXC6dfboaYirhEF5FQFGGt4ucfiHF/v/QwzbU
         Tn6CM749w2KXChAB0pn3qjyshN652FEvEKV1CfyhUp8QjpJ24/AkmOPK4/bJl6Bopcto
         RfWjsAu95qr4jTlqBmrrDaMQ8ojhiLXgBEAfzV81B3bNVkCtj9h4uuhhpLDI7iZz89Wj
         l9Nr1H7POoQqUN2AvKbhIkZvq/+5rSfEKdViE+0Q3SdNynGs7baJYdrsofepELfHkwL7
         Xov/IqizLh4e+E49XWwOKsuDRoRkhB8oJWCbjyoT4RVor4XolxB2an3RUGTA7FrjDu4S
         EQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752565428; x=1753170228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uOEo0Mg2XI7OcoOFqG5XTj/kjS9gvP/PzpP2FvhjQ20=;
        b=FoakeW0SXrL1Fr7rAwhIXNQdUI8Sdk0gGuK7rWhAiRSBxHAsU1e1L9AQ6xoWTMA2Nv
         envcPk9W4pttpL1foT8/CdoKpVozRBphguFslxe8DJUphyV2xSxsSaxtHuZtikXgIEAJ
         cdFKlTXQsEILmoIgS9xzqow8pUev0VBfu4GYUBhZn3oDeO+ZPPmWRgDwqG48uQD/E9Tb
         2672shcdkfcnt7qbZa6rFAHzvyUjJ/3eJ0QhPI1Cfhn2DOwDI/Gi8WxyidFyZxtY5xs9
         eqPm3RNioa2k5HgqRz0W2D3WHvnu3LpmgBFKeRjJ42t7L0YTSZ0HwXnRr/PwNKDQc9KU
         HFzg==
X-Forwarded-Encrypted: i=1; AJvYcCV7EwTCaClvIKt61oCBpjss+o03PNTeSkpCNTzWpVsue8yIt9QusoYHI6iUUZybUaN5vOj7eGH2HOW9ysE94Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGhssIp1pGG2U5YJCPKnpztUvRCxYdtttYLm7C3l3zk4f45yb7
	p6WRZ4N868IFjcNbm39IldpLtyY9/CZc402aLI8crPfXfLKHiOasDPpT8kiOzsH8MeSTb1Knl03
	LWoLZOWTmVYd6932HI2hlIdEG7QA8GqTTSKWf9mW8
X-Gm-Gg: ASbGnct+8Ns1ovLB4zXlo+NhO8uAJdrwJEpJktVOvuJX6PvHZRXeZkv9wVUoAJTnW0m
	hpvZsBKn9cboz10uQGv1bbGrJJ0RMEsTF0pSxNnbRYnLgPWYMY67fbh3KptkCA1X+nCZsEU+Zyt
	sqK9yH8MfXaY78NuV3rl8axB5UzfwrCPoUF6LKGZwixP+RoQokZ1Zf9i5cUT5+vY9aX/67dQDmM
	ed2AUXk
X-Google-Smtp-Source: AGHT+IHKOjN/sac0fVVUzXU6SWIDaibaKPn5EMHPr4B2QK4ix+5qA6E1C5pV5zapc/cBUs3NTC3X0j1Puzdh+W5+uro=
X-Received: by 2002:a05:600c:821b:b0:43c:ec4c:25b4 with SMTP id
 5b1f17b1804b1-4555f89f507mr181921355e9.10.1752565427632; Tue, 15 Jul 2025
 00:43:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250714124637.1905722-1-aliceryhl@google.com>
In-Reply-To: <20250714124637.1905722-1-aliceryhl@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 15 Jul 2025 09:43:35 +0200
X-Gm-Features: Ac12FXxKYM27WKloFSX7QfkGMGrcwA4IyJa2dCd9Yy0ZhdKGcFXHCyK325MyFag
Message-ID: <CAH5fLgh=kGj2shvChkPD4LHyHrmJ7ZCeWVpM-ZE3dG5NRMLWXA@mail.gmail.com>
Subject: Re: [PATCH 1/2] vfs: add Rust files to MAINTAINERS
To: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 14, 2025 at 2:46=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> These files are maintained by the VFS subsystem, thus add them to the
> relevant MAINTAINERS entry to ensure that the maintainers are ccd on
> relevant changes.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> +F:     rust/kernel/fs.rs
> +F:     rust/kernel/fs/
> +F:     rust/kernel/seq_file.rs

I guess we may also want to include rust/kernel/sync/poll.rs ?

Alice
