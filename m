Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA921487E9
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 18:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766429128; cv=none; b=k3pw58JThkmChs1s4pXdXT0wKXHEaaQLF9Qb+PlYv4gV3zhFvOmLKnWMdFclPKDFPTROPBPQ+IekHfiBUSvXIrYbnV93PQ3EWRYxCr6JL8Lq6YaQF4s6djx7gROcqt/nDDqvWXJ/qh/fhxEY0Z3vXOSEMZJX2JOCM41cAUJQ/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766429128; c=relaxed/simple;
	bh=0V99LgdBACo3xxJHbBCDcAZxLNLyf+l6Fy3cte0oM+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OsYQKk49d/nxBdmLqHt8tRtXxxfXOEJKeSyGM1N0cs0Y2CSfOUkCqse3qUlWsDbWJzP/r2on9nA38NkLopc6uzXkEZ0kIxdqHUb7XQECbULlfP7gP+PW8mFyETQ80b5LED8Z6VE007Stu3pFJbjrnhKLqJjBKGF3bn4/uipDjZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i4/X+aFy; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i4/X+aFy"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a08ced9a36so10486845ad.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Dec 2025 10:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766429127; x=1767033927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0V99LgdBACo3xxJHbBCDcAZxLNLyf+l6Fy3cte0oM+Q=;
        b=i4/X+aFyZnaRllXz5iN0aWqdHjUnuCQOJr1XCKSWdv+q4mcUed2aSc6dAa6zL32p4/
         jPM7rKlQJmLILW4gNJfIw5k2w0pRrJa8yCeJeUH6ghYd+aKUevAWfaO1ZrZv86WZyoVB
         nl84pWx39yj0x/oHkpLHNfyK1oWsvr7nl56ca5gn41kbonq8HF5Ko7GIgH/+I7X5uyDE
         +O9oXuBeAZF7x0w6LbXjXPu2Xl63APE5FCVrGWBWVGgKct5O/PS8hWQpuE6nbWq2QMN2
         2wplsCkKrlGH6m5+jGymafY5AtdwH7CSUBYoUKbiUr71uaJQtUQ/kuvAuG4PnofGVJZC
         RqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766429127; x=1767033927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0V99LgdBACo3xxJHbBCDcAZxLNLyf+l6Fy3cte0oM+Q=;
        b=vRbS63cJ4jp7ZFMFZCB4PbgaiUDUYmUTHUOYgcNOCp+MYR9DNYdTUehCosOfe+EMb0
         qsycLqe+MYknAfwROvj+T5u0LB0sPsI0OXFJQf+1SfRHJCQlzntUvRxdbjE9b3A1ZlV7
         CE76r2QQ2hE9QD8AP/Ns3JdaFYJlXOuinFNMujjgMFOxu7XwpBJEaq07ibt7/eg0AMs6
         ikYEHI1EZU7BcgxiXYEseLi+NJy+weabfZyk7FJ1ONkfqnexK7M0nz2wL8tMp1P8w9K9
         ws/HMD1/hdTF4j2SQpIIEgggZ2/bojEqo1hjsoquf5yElpU5WXhB+Ilpke+3ZrqjdVBj
         knag==
X-Forwarded-Encrypted: i=1; AJvYcCXc7IDbhd0IyQP3m3o5sY2LGjocgpxQIH1JcArIsK7URvMWYzvVn79MjZeoa+29SXAB+ZSlXSyV6Jc7oQuCQA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9KZGTWL2s+wMxJEmak+o+WGF3FH56Cdpy4hKbX3nmHQGvbl8R
	UKB8kDHnPNY2wi6IHKjnzH8RdIEzWgwIG2E/xoz9u4v2/CE99vdL0lXy/vXZb1opQVQBVCjN37g
	VwXTWFxw3kG0M6HL5ceN3rFasuXQfKxc=
X-Gm-Gg: AY/fxX7Nydbff30/YxzrtWXDxV64yXGDT5iHqsi+zcSqTsVcIvg/gSKotjv52TYVLon
	NA6yon4DrhECb9p9Z/HNhGzTnlI86WStUJQWpuhq8GG2bpG2jy0ukF+HSW40CPPy0NkgqBjKtGX
	tcWWzhLoUCGnjlO+9WrOfRz1YPlx73WFD88Z3iw2XO5fFTJXAq9UoEe8lT85siO4agmbRNvG6jr
	pcenEbIp17TX75xqotEUAiMJ3vnXZkkxmWc75WrbUMI6QjzvI3ktMtWL0uFw+qkfnrtjBbysnlx
	zLXw1ci5LOd9QPTYLL8Lro64H91XR9JhPpt+f9qYHiHaQACbG6Smfu3yO+9CI5J9iOxNbECv9mB
	yAZoMG9c+q4i+
X-Google-Smtp-Source: AGHT+IEVyNhkgcvIagnTngabZtenk9WfgkzkXjmffkiPYIbBKr6Bvo6J0p2a+xWqn6m9fufk/xazVKMPD90VLH4K3yY=
X-Received: by 2002:a05:7301:1a18:b0:2ab:ca55:89bd with SMTP id
 5a478bee46e88-2b05ec309f6mr4941730eec.4.1766429126486; Mon, 22 Dec 2025
 10:45:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-cstr-i2c-v1-0-df1c258d4615@gmail.com> <a0109742-8213-4aa3-a64a-d9326c694f46@gmail.com>
In-Reply-To: <a0109742-8213-4aa3-a64a-d9326c694f46@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 22 Dec 2025 19:45:13 +0100
X-Gm-Features: AQt7F2qrpCbDesQWhnZ8QAwHCGHKx5A9FpJpuaBPqZQSwCgxxKeWanD09r4fup4
Message-ID: <CANiq72m_ZMiPObgSHW-ja0jD+gjgH5-DZ01h-UkRvj9jmXG9eA@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: i2c: replace `kernel::c_str!` with C-Strings
To: Igor Korotin <igor.korotin.linux@gmail.com>
Cc: Tamir Duberstein <tamird@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 22, 2025 at 7:17=E2=80=AFPM Igor Korotin
<igor.korotin.linux@gmail.com> wrote:
>
> Acked-by: Igor Korotin<igor.korotin.linux@gmail.com>
>
> Since I don=E2=80=99t yet have a public kernel tree, I=E2=80=99d apprecia=
te it if
> someone could pick this up through their tree.

I can do that.

Cheers,
Miguel
