Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A771FF60A
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Jun 2025 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144722; cv=none; b=THxDnVgWHmrbWn7JVzA1fxtPGtjdF6BjPzwvgzQv6cYEESSzKJ8mtsFSyvTbAZkdvzzTu4bkJ6FCSR0AfABfX/4zvjmHve3pgWAz3xYj4xb/AfjHfzuSwKpaKepf1xCB7s3INpYQv24Dnm5vmUL7bZj6pdUjPUqGvrubdyofqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144722; c=relaxed/simple;
	bh=9R65Cbrq4SwmKcv4zIYmfXLUL/XNfrP+SMWhdTE92JQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=EdE+1K+owEwy7RcrTlC7VAbgj1JTFqiWMSqjECK7/YSGcXid5uW04zASb6N/rwfcTxqZDXuhTGkFnhSkJvHR1sXkNPOl13rb6D0f5xJeKEqEGQSZI5GNsk3lDsFOVCXYf++vNqBWYOEeCOO3e+zJbFGWRK23+t5/8VzgDmZXnfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6WHBRDe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6WHBRDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89190C4CEE3;
	Tue, 17 Jun 2025 07:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750144722;
	bh=9R65Cbrq4SwmKcv4zIYmfXLUL/XNfrP+SMWhdTE92JQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=N6WHBRDeO+QEePqEYwy/ti8wiYaoSmChdlfAu1FeF0w0vjQMssHoLbE7kILvAoCZk
	 EFTvs8/3AM+tUD+8LtoLqY3J593fZ+urA4y0FnkpZ3BrkE5IwJi4zvggkaManW2l+6
	 YAma3l132VvcAdcWB/AsOfxExyMiQ3CXvusH2zGknqiVK3gkYWfNHvgdmFOBZ79dTv
	 S3QGpsoIclav5wzd6phDj2yJZ6Oopv+hNmdWMFvqJ5iUDav73YXDvPvZO33ucpii2j
	 43az3J3ta0EbArlId+GjkVZajBEommcxt2jSmQyLurzOz/UPe8tl8G5Lwfrjv4lLw1
	 BCMheFoKTAlNQ==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Jun 2025 09:18:38 +0200
Message-Id: <DAOMIWBZXFO9.U353H8NWTLC5@kernel.org>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
From: "Benno Lossin" <lossin@kernel.org>
To: "Marcelo Moreira" <marcelomoreira1905@gmail.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <skhan@linuxfoundation.org>,
 <linux-kernel-mentees@lists.linuxfoundation.org>,
 <~lkcamp/patches@lists.sr.ht>
X-Mailer: aerc 0.20.1
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com>
 <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org>
 <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
 <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
 <CAPZ3m_gGOy2XsiVaVbbAivwO0JBpgqMke68LV4OD+i2L1Z5PEw@mail.gmail.com>
 <DANRU0TC3F11.30DUO1LQZUE42@kernel.org>
 <CAPZ3m_gBEBfnCHtcFoga=HEi_acr6-eJ1a71VgrZDJbfrCz=0A@mail.gmail.com>
In-Reply-To: <CAPZ3m_gBEBfnCHtcFoga=HEi_acr6-eJ1a71VgrZDJbfrCz=0A@mail.gmail.com>

On Tue Jun 17, 2025 at 4:49 AM CEST, Marcelo Moreira wrote:
> Em seg., 16 de jun. de 2025 =C3=A0s 04:15, Benno Lossin <lossin@kernel.or=
g> escreveu:
>> How about:
>>
>> // - `self.data` is valid for writes because of `Self`'s type invariants=
:
>> //   `&mut Self` guarantees exclusive access, thus no other thread can c=
oncurrently access `data`.
>> // - this function is a drop function, thus this code is at most execute=
d once.
>
> Ok! =3D)
>
> I thought about using "so" instead of the first "thus" so I wouldn't
> have to repeat the use of "thus" so many times.

I personally don't care about repeating those "filler" words in safety
documentation. The clearer it is the better :)

> Final version:
> // - `self.data` is valid for writes because of `Self`'s type invariants:
> //   `&mut Self` guarantees exclusive access, so no other thread can
> concurrently access `data`.
> // - this function is a drop function, thus this code is at most executed=
 once.

That is fine too.

---
Cheers,
Benno
