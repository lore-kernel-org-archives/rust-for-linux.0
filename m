Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBF7170A36
	for <rust-for-linux@vger.kernel.org>; Thu,  1 Aug 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502907; cv=none; b=fNvzLbyViqKFFxCArnS9mS4Bl4TD4nFqHQPKYYJxACqOw0eD84SwMm4OWuNsxMhTCLkJWncPCKNbf8RjZmqyzJWlTxhmN/g08PS2mNtLPVZjRJF56jPrXQVeacywP462eoKAgbqapbqfiyl/rEbElCdhKR+37fuSQTQeG5HH7W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502907; c=relaxed/simple;
	bh=wxn5DmtvY5tJjxAkykMV8xdmufUHERfyxYUef3tszTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D9zM2CgM19mFtVPnQxrMWsfP+1/mjuz+xt/4+fesPAwN2EgiE9cxJjr8X8bS1dBBBXXAYsvTze0mnWqiy/kd1ss32w8QlF3V3D9qySaJX8+RcD+Zg5jx59BEkIHyBOdqY/DSSCFeHUcavngiu4jtFHYY54DW7vozrIUPa41fzo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JlxXRyKR; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JlxXRyKR"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so2604440f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 Aug 2024 02:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502905; x=1723107705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxn5DmtvY5tJjxAkykMV8xdmufUHERfyxYUef3tszTk=;
        b=JlxXRyKRTG2s9rL14WMtBu2/R96AOZrsRD1Jp/1OJQ0a1HGhHrPKt+wpyNE4+dEGS7
         0FjSnwH+57auGulJ5IpAVfz0gb/T6a+yVW/RbKle8H9S/XaGRPqvZF/dXUKhqJu+6KRT
         jPwu/+5WPGEvTTAj9N6mQ5Cxk6mQjz2/zAh2En2mNiXhBxax58E5l/t1VxjvFGMwfKsS
         JBVn38LcwzvvoZ1dco7UVyMSg0UCG1MtSLbEa3bFlrxhSWR8VYrUj/gudimTfjPb+2CD
         P1GA2qVYkplooGJ7r9WwC7UiEEXXP1Cp6ffDgofXYn6fhhmxwHIdXfBM1WMLn4RK0771
         IFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502905; x=1723107705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxn5DmtvY5tJjxAkykMV8xdmufUHERfyxYUef3tszTk=;
        b=OKW9fk49AZ8ByQVha/1vqpK7093kPC2HO5rHk4ERyinom9u24e7RmJ7MVkBWyBkpVT
         qMGeVfHzChj+vEK8N4fx7J2H/dlHpfEwe7ZT8iWgmgR4eESupsPfk3nkIH3V48ub3JXQ
         8nlxIkfNLyzcUJJEVQwregB6OgiOdhGhunKD1eSTv0azgp0ZhUOR2C2k3wYch0qyxg9K
         3CJOc8YsB5zJtWGGRBTFFpEgkZQ9zYE4XYvRz4iQtHnauElMIjJ4oE/ysUYqp/cCvBPk
         L+JF+q3qsIaRHdQP4fNCZeotiaXBBEs/G88Xbb5a/8b/XNpGn3KMsaMRQ3SvXnZ3B+Vk
         wcNg==
X-Forwarded-Encrypted: i=1; AJvYcCWeGhBqHJQzIVIzjcnkfCNO7njQocuEawNC0eX41t2xGE8BtBbCXmuRRmJsgkNDQVe1HN1LvTzp1/ee/eFswA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrYP0qF27JxdfY776sXy8cONQKPHQGrf0tBZpzqhgwB6Egrbds
	DcFANUo5IYMiPnnB+F42foXdRbfIDCiF1yIcSH6RdX+DQ7zj/W/7h5O1Y3l1prmgbkBX4eWaCIv
	E1wZ3fMSqQpWkcHa2l2FRF3T7WOP6grNRucdR
X-Google-Smtp-Source: AGHT+IEwo7ISwcTUk5BerlDsr2Gba/hr79v5U4FhsjjVg1c+9j0R5sUDJ2vbwzB9a93avQK1HQ+mamY4hBB7YwLmOIw=
X-Received: by 2002:adf:fd8b:0:b0:368:4e38:790c with SMTP id
 ffacd0b85a97d-36baacd1c74mr1390718f8f.14.1722502904273; Thu, 01 Aug 2024
 02:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708205325.1275473-1-benno.lossin@proton.me>
In-Reply-To: <20240708205325.1275473-1-benno.lossin@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 1 Aug 2024 11:01:32 +0200
Message-ID: <CAH5fLgg7HNmuzYk260Z1Qv-xYQnCCGwFBCsyoiykSu27nQi-Mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: kernel: add `drop_contents` to `BoxExt`
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@samsung.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 10:53=E2=80=AFPM Benno Lossin <benno.lossin@proton.m=
e> wrote:
>
> Sometimes (see [1]) it is necessary to drop the value inside of a
> `Box<T>`, but retain the allocation. For example to reuse the allocation
> in the future.
> Introduce a new function `drop_contents` that turns a `Box<T>` into
> `Box<MaybeUninit<T>>` by dropping the value.
>
> Signed-off-by: Benno Lossin <benno.lossin@proton.me>
> Link: https://lore.kernel.org/rust-for-linux/20240418-b4-rbtree-v3-5-323e=
134390ce@google.com/ [1]

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
