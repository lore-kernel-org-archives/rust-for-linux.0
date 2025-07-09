Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF01292B33
	for <rust-for-linux@vger.kernel.org>; Wed,  9 Jul 2025 13:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752068251; cv=none; b=fozrOj8xAnJT6U3Y+vMgByE1idFkjfGpESeSmihPJ4xi8EaE0kWqmwvo0/smdbwPztI62SySLYGM4pIHWk6xMP8dyy9OcOcwZr4QE/Y43vMV4OUMPAumwxUk7ywPf1Mg1NLIENdwqDw1HBhIuduWoDkRJmmnDCKQyDa9353KKek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752068251; c=relaxed/simple;
	bh=x1O3yV0tYWPYFSK8SczYbxy40k33Giz5zO0qk0GiNPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gU3NevsWi73w5x9T8CLQgOld8QVG76MBnGxShcc2cG1HL+UQJwbwiDzHYXMADDtYS2Li3rIOhjlmuTNAfDAU8YbJktXNSjxxQ5cACJWak/YELmgEKO4XoDeKWvsSYosqjN0H2ZzWKeWrYpzycQakaDQNTcwiNK33RaLd36Q/NyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hf5W1YXP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hf5W1YXP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453643020bdso43911745e9.1
        for <rust-for-linux@vger.kernel.org>; Wed, 09 Jul 2025 06:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752068248; x=1752673048; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x1O3yV0tYWPYFSK8SczYbxy40k33Giz5zO0qk0GiNPk=;
        b=hf5W1YXPtxZSSzDSdszBMY8gTXr/oFFGyWLDNSCCQ0dOvd7B+VCaY9Ql19NRv9oPUL
         A3plrVSFhLytYsY7m3teRtBFNpiU2F5vA6gy9z7ruqr9MqXv2P/7evyOR3KHNY1Q8h/d
         1mPa3JlegriI6WyRoOb9jZB9EGdFTx2s6f6Hb4r+7d3g1m6u22pWS74nG+61m45NtzT9
         rfGOe0WASEkT15p+I7xF8ORURKai/JhaIoJ9AdhWNbvIExpXS2PA+LTQWx2SDoeYBpfa
         oacEByb7Eo4Udj2Lq5gnxgq1VLWCK7YvfXs72XsDa+/htpIC481oQyLso1MZsygt6b3j
         ssOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752068248; x=1752673048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1O3yV0tYWPYFSK8SczYbxy40k33Giz5zO0qk0GiNPk=;
        b=hznbvWDydJz3NTOo+m42PBvPtpkoSsbPVWogy/M6DFtCoSkKHeSzWOgc0OQsjWXB0G
         85xctd88vlp1ZdZyvCh+ma7yFXMn98JJ++IA5tV2+UnIQiDuFYdpcaSaNVXz5cYUO4o3
         VBFB5zj7PkIiFNb8Yp+6j1o4cMXqZBfJ+0Glw4vdN/D3QZKmR2XAM3/0vd1JlgZgi3lK
         k1idlyVY8BVA4m1gZmp99L/nvVmzbp3K9kePOHOfsH/fBsLEEez0oQ/UW3F7j4Om//wZ
         YiuJARl6W533tFyl6HYl+pSlgQq5GccWG8gkcINF5UbqSBJMsWVAUQ+6qIZUhEjaMyoW
         v93g==
X-Forwarded-Encrypted: i=1; AJvYcCXgHoSfPnlK3Gdt5xGJ8JS+QM4cGfOt3JYynHaFYJEo0j6ODBty8rY7qveboCQTG1vBPDltPOJElf9QJG97MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhj+e3ptqZ4eUjsX6NxYB2zFcqoCqcIGHF5uxfyaTmH+Z1hacG
	LrmPNC7mdABKRMtfrT7KNzPFBlFJ3TneqgDwP6Lgkuec3g0u6pWtF3ez8qNnFk/3RCW8W7ToeG9
	0KbzAHxly5N8N3psAZd13ybAp+WAtHNrIKXeLoi4a
X-Gm-Gg: ASbGncu98CDepaAx0agMaG3k+gynAf2St66/qkjCKjhC4fciuGuCnwamlD08jH2QbMB
	ehOyi+IR0B5qM99yPzOWU8TN/bgIdYS7fUrRuoY6cs1h1Rfrk2Q7Dfdd05mw7ZKZODbqrXHyNC9
	lRmo0TVH+VQvFPgefrCiZWCyfoXa69YAloMTElowi1+K/eielkaGKF8bkFo32zH6UnAU3A5NCrv
	Q==
X-Google-Smtp-Source: AGHT+IEA716nulAqRa5a2S60pK57wjynJP6MZeuoqr0aItMDvDtiVKvSCOQ7tPSH50CZIlyU0jurvE61IyCCQaR9h4E=
X-Received: by 2002:a05:6000:178f:b0:3a5:25e0:1851 with SMTP id
 ffacd0b85a97d-3b5e44e3f6amr2141108f8f.7.1752068248159; Wed, 09 Jul 2025
 06:37:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-list-no-offset-v3-0-9d0c2b89340e@gmail.com>
In-Reply-To: <20250423-list-no-offset-v3-0-9d0c2b89340e@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 9 Jul 2025 15:37:16 +0200
X-Gm-Features: Ac12FXyCr_gESQ0NBGSVDz1Tvd9THD57xkpCcUipxVzlzPqqz_epCDTU0SghXaQ
Message-ID: <CAH5fLghgRy_B6kJ9c4HDWw-EUTcUQC6qhm81zizeRk+mZPu_0w@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] rust: list: remove HasListLinks::OFFSET
To: Tamir Duberstein <tamird@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 6:30=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> The bulk of this change occurs in the last commit, please its commit
> messages for details.
>
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
