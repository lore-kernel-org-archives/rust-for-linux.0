Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD6D1F4C87
	for <rust-for-linux@vger.kernel.org>; Sat, 13 Sep 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757795868; cv=none; b=ehpUF0vimVIEpd6NmrlYpNCNRd8eJ8ehR22YhnjC0nD+sWteZhHeH8cJCXpWnJexOrfNbO7vKMDWcijYREIPJIQ8tP9NujFDPtrSllYJWz0ss87TXxUIXzQUxrd6KeYw4baPAUQ7/JH+yKeFjK4Y+gU9zNhDnuESoxKTweK3dkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757795868; c=relaxed/simple;
	bh=mATTaO6ztWHtL31tz3fa3XmKHBNOJGaadXz3sI1bEqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XcYNr7M9XXp/YXrQ41V6YctFDZobpIdJsiCcxAT4X51hs3u/5LU5GtXgY+9ufVMW4yTOBmB3mETg/+pUSKnuJbntm3Ib4Gxxw7Z2EPMJhvQOyrMOwUj4XMPysfU/9aYxCFsI4zuenwjxQgv0TFoR/Ldxs+vt+45iX90IxtmYLMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aicbIYdG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aicbIYdG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-25c99c2aa12so3262505ad.0
        for <rust-for-linux@vger.kernel.org>; Sat, 13 Sep 2025 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757795866; x=1758400666; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mATTaO6ztWHtL31tz3fa3XmKHBNOJGaadXz3sI1bEqM=;
        b=aicbIYdGiH8VNGqjOQzBkUyuHU8uFGws2VWGJQo0fZQx21hdpG9qIAfStWBdFrpmL0
         8W7cdIixRIwsWlocIhQJTUCvcLyJxux58ol0HRg8FnKduEmrl+MFQHFAALG1uKf9mWrL
         s6zoeo4zZ5SYRWHV9HYQaUZ397KIQQew0IQ/ZOh0Vk+/VBoukNXETU/CEw2qCsOSL3jx
         e+giTYBZdUjJJ6/qDd37w6bTDdjnzSSfklLPmF8S1TMBP6LDgO+5pJ3vmuD+/QnX/7Ag
         ov5bQu0jKpW2wj13XsWULvhp9GYR4YxmN52RIfvP01Rvh5dKlfRuHxwyCTTw7QFBcPWF
         nDxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757795866; x=1758400666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mATTaO6ztWHtL31tz3fa3XmKHBNOJGaadXz3sI1bEqM=;
        b=pVgMntO4/T1wHiXki64Kgz4tk5dQ5J/e48SXXSiiWrScU2JvtrOd20+H0QN35nxUe4
         gFVtrq6b5HlXALt92tAhCQJK1+bO5akgwjxfYxxHYirO/ZX/E/VMJfgdDAPyywtX47k2
         tELoV2/N1GA/Z1TEQFU6msFM7fRZGzX0Ji3kZ5YcsItjZLRjtcHL5Gt9EWUf54n0Pe4w
         H3znjOCLHFvq8YVtcqVPEyKzlYEwonuAmHMEFdN2e4PjzRA/KexGxMKA/g40wDy7LQlg
         t6waQmYINgf8IRV5SMBj8yRjZJYIX0OtPI+NP6VGDNqrUwHF/joCASQk80/W5PTC7fEG
         uOgg==
X-Forwarded-Encrypted: i=1; AJvYcCXNe9QiRmwianTAVFjHcmAn0MfJxQ0uNCtGyVvhek4mzX6CZ/aC1kOYGnL2lWfbtOE/L5Z9CIjTeWoe6wyEzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTfDVL6Yz2kHNVzqy8VBpM6nf+65vCAQq66vF9Yq5jPKP9JYTk
	Dq765ZYsSisoOl9J8qvsHOW1ErhYfVzKNs3T9THLTkmvY3DdrDK9591UBaSp2ppZioUNW1KUe+K
	njQcfP2Qb2IbCeZTlNNV/Z47jzW9l+1c=
X-Gm-Gg: ASbGncujoDanQvq731/tcPKZBeX37G99tc8DrRdIaXwj6W9ISoAzy/DqSnQ6Khd62uW
	NDWQ9EC+aTb4aio242kMbxwQZ2+FZFLVm3Zbh8HgCeAovw95Y3XfYEzRUMfYWQVsX17xVFfm2Mj
	7GHMMlL9TIFyEwCg3bOVT6guFMBpw/+w4eLm/eOFV8SDjt4+uS/3+zAIv3S7qaZTXrHZP9x34wz
	t7hdv1iJDOKl5aEkmPS+HBNcxLiNwOeHiqRB6oZkdDhWa4nyClnFfT52I9qz9ZpGjpcMKWdUd1b
	RM6weWGOHVqLJetMwM6wKohyNsMyfsFJv50v
X-Google-Smtp-Source: AGHT+IHrVkKejELNksEXUkmKRimQGTe3Ad5+7htwK4BUNxGJGqqmJCijjdcznEeh8fuxUViY+RIMf0xL/mdPT29M8js=
X-Received: by 2002:a17:902:ce87:b0:261:500a:5742 with SMTP id
 d9443c01a7336-261500a594fmr14779775ad.10.1757795866176; Sat, 13 Sep 2025
 13:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com> <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com> <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
In-Reply-To: <20250913171357.GA1551194@joelbox2>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 13 Sep 2025 22:37:34 +0200
X-Gm-Features: AS18NWCCjEi2nGimzvlQTTclneuWdDWNwA3S6j0YpJVAggEoL-8q-kmCadYD0Hg
Message-ID: <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2025 at 7:14=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> I am not alone in that opinion.

Hmm... I am not sure how to read this.

> This should be first-class in a (systems) language, built into
> the language itself?

I would suggest taking a look at our website and the links there (like
issue #2) -- what we are doing upstream Rust is documented.

(Danilo gave you a direct link, but I mention it this way because
there are a lot of things going on, and it is worth a look and perhaps
you may find something interesting you could help with).

> except to satisfy paranoia

Using unsafe code everywhere (or introducing unsoundness or UB for
convenience) would defeat much of the Rust for Linux exercise.

Cheers,
Miguel
