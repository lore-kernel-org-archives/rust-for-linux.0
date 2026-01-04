Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7452F5A27
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 13:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767531744; cv=none; b=KPS1uw/ePC9Zwj5wpyNoag9iBV2zIVkwcTxxbfrhEMKkvRDRGNQtUz3HpXst1yERHeUcxAnQL+ttHkJySzfjwMEximGxUz+XDiCi5wVXKvjpjsQA5dvgyg6YMnqvF+ZGNO6tuVW2O1GvGgw4/cCvjauBxCnJDmYtl9jMOb957wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767531744; c=relaxed/simple;
	bh=i/Euvub2KKbmLo+Havgbni84uKJackW4SAYlC4gHvrM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGneh12l+pD5g/YULvAqQ0TchU0U5tYu+cR4UuedP5kzAvXI9bDGZRds9R8xal1+gWvqIpe74ueV4e0wszsHQd0SnRUx9tf0mRLqfuSL7qae2GLK5j1IEneo5hKgEgFByXY9xz1F51nYF++jlhu4dX/YKhw4N+Aag9C4bfa15tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Cw7Xt37v; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Cw7Xt37v"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47774d3536dso9158675e9.0
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 05:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767531741; x=1768136541; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/Euvub2KKbmLo+Havgbni84uKJackW4SAYlC4gHvrM=;
        b=Cw7Xt37vwyeUlmxQzsmSsI2Eekq7eqkG86F1AxQa+ywlaXjgFcO9tsbg7m4Yb/pdqE
         gnQNgximydYgYSirM+pSnZOPJas9q/gjMki5zt8rHK0A1eHX2cJZBcN1HxzVNPdgqTuQ
         RAj2d0wBZt1zSjSYtqI1o2PYila9FcYtlDhjMxvDYYKjM6KZEC2WNO0+8rhK+0wf2WJ8
         E94l7gRYpR/6+Y3zJkPsoweJzvwVszSdaT7rePKcod+K1CzmKX8BQ2CdqZG4t87uAZDj
         RMfI5F1Tym6AC6A3Z5553+F9SldtVKvngcC/fmtbeyTZ4MHBLL9Ntsb3ET5hcljpoDhi
         H2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767531741; x=1768136541;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/Euvub2KKbmLo+Havgbni84uKJackW4SAYlC4gHvrM=;
        b=imTiAdybjQGGKx3h0R1ilHo/9+Pmyjuc+0EqgQBEQ7pK/0xuFzkc90ojsfES7G2nKw
         F2v2yD57zPeusXbGzceg76DKTSTu9GkkKrkFpjvc0iW81qDft+vD0qrde0b51642P6jI
         RUB02GyMuDsgT2hplXHn6IKXvFQdavL8IaX/RxEa5znv4QlRempG+of5T/Lzc05L/RAe
         EMdvylCEcuezEa/g8omF25ktxxjNpk1dQ8QXFM8MmKQcqI0I4UQoTlp5+AnUJKUR0tcZ
         dUe4tNhiLvsUCooP8KeoPUXPvhEk6hsTUrP9LKQmWrlu/XzYFQCZuNqQxFJGKyk8P7co
         0SpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9BI2EVonrahgHRXaZ2+DuJ1/YmUs9ybHEj6aHXbONox1PTfEYywpD/4EqZjHoTy+c48sR3oaQDybTDP6bhg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnzlzRJjRmvaHt9ca49wK5n1TAD7leuOTXGDsbMgRQytpC7f3T
	X//c1CnQPhLPFFRcaa6FaM5/jrMZfQUMs+yGORBevPNWsZsi1It6WsLPb02gSKGh1ojCP5ahtJS
	59er8bPQuHYg4mjIV021OHcTPuourQIkt4owqZzes
X-Gm-Gg: AY/fxX57+Ug4xND6eik/aXwPMJ5rl5hgENd2cdExsUW9wz3i5dNMgFWY2B931Sw7uRn
	HEpFitMBgyNajPyTy/qjJaUstLXlBY7l2NmWd9VCYhe4aVoHw/1X1Vx3Wxbn0QCW27PRIuV90F9
	gtRezeLmzoQvPtvwn4ZcV40UPUgM5i2N4f+P0x59YXvg9nVlJpCpRFtj4DBhIQND+0HkkuPScfC
	80+eMi6O95n5L+Tl3MZiE4AxlADGRqprwQL9/fJVnh8x5a8/xQFWEvIMuxHG9rqEmc5ZDbbPPb3
	AbB7v8qKQxQSIkcBawhbK8FNAQ==
X-Google-Smtp-Source: AGHT+IGOs+BTUkqsrLOPJxYm4bLUdRIQP0VEadqRnYlEYAJxy5p0iMO5fxrU7rFoy8iipXVho8cwIDZ3Z1BuYyNXHJ0=
X-Received: by 2002:a05:600c:3542:b0:46e:59bd:f7e2 with SMTP id
 5b1f17b1804b1-47d6ba8641amr78830115e9.11.1767531739241; Sun, 04 Jan 2026
 05:02:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
In-Reply-To: <20260104-fmt-paren-v1-1-6b84bc0da78f@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sun, 4 Jan 2026 14:02:07 +0100
X-Gm-Features: AQt7F2rellEyPlUHCII8O8Bls87gBuFlLKlKGebXJFWsPOaIblezveHEhnRp6E8
Message-ID: <CAH5fLggdM+wE+ONpO1hyVE+kkaN0jeEy300ttv3UYTFQhLURLA@mail.gmail.com>
Subject: Re: [PATCH] rust: fix formatting expressions
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Janne Grunau <j@jannau.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 4, 2026 at 2:00=E2=80=AFPM Tamir Duberstein <tamird@kernel.org>=
 wrote:
>
> From: Tamir Duberstein <tamird@gmail.com>
>
> Allow usage like `pr_info!("one + 1 =3D {}", one + 1)` to compile by
> ensuring that a reference is taken to the entire expression.
>
> Fixes: c5cf01ba8dfe ("rust: support formatting of foreign types")
> Reported-by: Janne Grunau <j@jannau.net>
> Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-Gener=
al/topic/Custom.20formatting/near/566219493
> ---
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
