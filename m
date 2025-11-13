Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322F62C0287
	for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 21:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763067976; cv=none; b=mLtvTijM1Df9xGME+KfChXLsHuh42C4lPXGc+F6mRbqswxNOIHiexi5jFkYusCjicYdEav7GLfUJv/oWXRaNd1gO2Zvqv2QvXszpYaradCEGmfsN0HZFaj/ClY3gD97CXUrYFZG6hRsoSMDbgYXcV6PiKY+v2Wn30nSnwUhR/xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763067976; c=relaxed/simple;
	bh=IkvuSu9rWWa7QPd3bxTRb/cXO+DLM1AUSxOr9k0uIQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H43goGfLlIrjzFV7L6KNhIBvWZfLaUPQqt9+fz9NWt5d5xnLwclzfgE/1cmArGjND+yj3M9lacgANZjycfdEwY0V+RLQjitXFbr4ti1oTk1oHfD8iBFaRIg9OMq3R/QBGQEVTU2kfBLjbOGSu6mw0RtfB2M/3or7m+WtfC2jehc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1N7DwSo; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1N7DwSo"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297e2736308so1290885ad.1
        for <rust-for-linux@vger.kernel.org>; Thu, 13 Nov 2025 13:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763067974; x=1763672774; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkvuSu9rWWa7QPd3bxTRb/cXO+DLM1AUSxOr9k0uIQM=;
        b=l1N7DwSo5MFTyt3d9Jjs8zGxv+V/BwL1R1IYUdX37Qc0qNqdhAN8oh8su9iiu2mkOq
         e086jdVCOuiWOn0XE7QZGF/CA+6MAy+WacWUIhtJ8oZx/OyBCNfSOgGeBvZam61dlCMA
         izK0NWglxwm/TP9YJ7a+wnBzBau3w/g8egwM0a4GZQZRRaQHJrnMPH8NHnHWnkb0yod/
         DP8nwSc+GWn+g6q+vRNuIT1GP/4/KvEV/6CVwJPEfzAPFvFzaqYJ1CrWlG1NNSUOMs6y
         oZ8wBlMzm7cIVjTnI2i3gPdOHwPwoBX4kWPa5wI6kBw4cYCl/LKjePIVg1G3MTHrQdkT
         n3fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763067974; x=1763672774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IkvuSu9rWWa7QPd3bxTRb/cXO+DLM1AUSxOr9k0uIQM=;
        b=spWSPb7memZPUd0gFGuoHnJo+QmjdLRWCbCjAJvg/75ejXyijPcRtYqo8aZ7YjBkEG
         bv3FbIXQT4FnKppdAw/MVezAk6zQ6UqNrqccnbE/Qs8/P9TCbZ/2X8UqtSBnOXpD6VXY
         pB036YKOT1R+jYn1g4Rpuj4ieSKQ0cEqrcS9OzuDhRsAOFlVggXbu8oXjgcMM0svpZQZ
         M22lGSaN6TGGeqSuxlmBUBhBsi1HOYW4JtGUbS3dMRdqvRSlqQyiO+V46xm9ZwKnysiQ
         cjTEXbyjmBtoNdba2INnws5ykUjMDiD/4pySmiScfJX4mXT/+vJHpn60CmnJLll9Ag9+
         Iqsg==
X-Forwarded-Encrypted: i=1; AJvYcCUyOPqR53Y06wLFVNDzLBITXwP5UcS1X022bQiA+LPnKQMAxUFFcS7d2XbfCxVYP9LWkZCMBgHgxyzSenGbjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6NdM8ATLEtGUANCe40JftFPsRzXAtqq2P46VChiBA7zbybfE8
	wTIqgosNN868+OqblNDX3CWV4VwRWhAcRmuOzmHurplrkhD8am9uF40gSlhXmCtwHT1HsHbtnQP
	36odFXx/9uIpVtMgxNlomTHeKlLMNA/A=
X-Gm-Gg: ASbGnctZSHsJguVgEgbFfHpLTJwkqcARhCPu7Af7kvbRSUXlV4W4Ah+6TkiOjIfn3z5
	Tyk84j6TsZLxrLOA2b4/C91Z38L1qsqV4HfsTtkjXzh+/189I65ohjh8gaHk7mGMsP38fbwB6XB
	H250qdOxsUhgplaifO/ooXq8NKeBW7cHamE6QNCkLHUtP3fKkoHvS3i0OLe9GfXVBIeyxRhA1Sg
	+c6OsmBa2cWKk13qNB8t2/TcXhxG8vmbsNAnxq8hYR7ZCk7QzIsknqJ53co3rQywGUU0YFYllmx
	KshWzEwlJ9TS5I1E1xvV/A8mpjdCGNllcXwixU+XaVT5cz6ZzWUvQNDgopB33pSXDcNpYjMceid
	uES4=
X-Google-Smtp-Source: AGHT+IGc/swO51qpOb+K5sX/d8iAc2AY5U9sMoJdlRH2NdNoAFevSN5DGusca5m2Xzj6E8DzsnpMTwI1c9otLyuf+G8=
X-Received: by 2002:a05:7300:fb05:b0:2a4:3593:5fc8 with SMTP id
 5a478bee46e88-2a4abb56fe7mr187971eec.2.1763067974468; Thu, 13 Nov 2025
 13:06:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113-create-workqueue-v2-0-8b45277119bc@google.com>
 <20251113-create-workqueue-v2-1-8b45277119bc@google.com> <0bf00b4c-3227-4214-b8ba-929cf044d9fa@nvidia.com>
In-Reply-To: <0bf00b4c-3227-4214-b8ba-929cf044d9fa@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 13 Nov 2025 22:06:02 +0100
X-Gm-Features: AWmQ_bljjt8wJE8V3Muakwu6v84zrNPQh_MLPY3HxW5m4BXITa2gtN7riQVtHDY
Message-ID: <CANiq72mCHYg0Oo9+MVdbfLO_jKUf9Y-d_7KqQy7CkF+HsDJ46g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: workqueue: restrict delayed work to global wqs
To: John Hubbard <jhubbard@nvidia.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Tejun Heo <tj@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Philipp Stanner <phasta@kernel.org>, Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 9:40=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Also, rustfmt (1.8.0-stable) split the changed line for me, upon
> saving the file, I'm not sure if it will do that for everyone. Just
> a heads up.

If `rustfmt` happens to behave differently for different people (in
the Rust versions we support), then that is a (quite painful) bug for
us, so please let me know!

Cheers,
Miguel
