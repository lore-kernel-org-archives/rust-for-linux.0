Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F7D2C0303;
	Thu, 20 Nov 2025 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763669608; cv=none; b=NY/HJujsjHH4EZkA/0k82NyVUM+0dBXvWfzoqNynW8qnOvpctN6IrdZWDohzb9flL/pawf8avuZfBP7kx9bzqmhPOOwSrD9+ehKlrw9zSsIAWnKCM7EYyMVKEKYocCenkRrFMuD3HgozfliJ1NmfFx6n5I9GpSHvUAKuCPYgwXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763669608; c=relaxed/simple;
	bh=TLYtF66C70QdPZ/KfmOEyDuqsiinD6JCJ0p0S28xtCw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DIp7iUkJg06OPTqJN6kBBzie3F+/Mgs13mgO4eh3Ocpv1VFoWwJjWI+Wv5FSupZSQh7i3VkYxZ4n5mQYiW3+G0p7XXxqifOSQOcWjlHk0g2eEkgMUPHUkw6dRQ9p0VqnECZTu37dPFHEn/zvXxljhOB4eed5YDd+KZcvXd6a/nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlTjQ7Pl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlTjQ7Pl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53266C4CEF1;
	Thu, 20 Nov 2025 20:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763669607;
	bh=TLYtF66C70QdPZ/KfmOEyDuqsiinD6JCJ0p0S28xtCw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TlTjQ7Pl3HTVg5aiGez/VQtVBiwyPs7qIvsDICYEKV4ttdZWs5fBjFkzDaXK3SLOa
	 A6ux0rxCW8lZTcsfikTpLTF2indAiQE3KpsztDmcLe5Vs0rONL3Lz/HHCoWSZcnvYZ
	 zY6BDxIbuEOyNDn8S0BtN6N2bgmr1l/i9ahlGfG50CLy9KRxQlQ5HkodhVQBMPFvL+
	 BiAqPNg5W++ker0BYPRiAcmJxDYRTHV41MtrZhLgdWirfGqMVt/VnoNsFPqC1bC80w
	 exDnUHWhE5WkfWxe4tDC4H0CsE6OGRPma/BbjEhNvSNygO9Ep9QEWY2z4J7CPHHc56
	 hhwrLXaCZ+aew==
Date: Thu, 20 Nov 2025 21:13:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Alice Ryhl <aliceryhl@google.com>, Andreas
 Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Gary Guo
 <gary@garyguo.net>, Mauro Carvalho Chehab <mchehab@kernel.org>, Miguel
 Ojeda <ojeda@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: makefile: move rustdoc check to the build
 wrapper
Message-ID: <20251120211321.4e64a3d0@foz.lan>
In-Reply-To: <CANiq72nC9HH4tZT6dTgiEpkBUktY5i3tVtnNtKjZhKAvAVrdBQ@mail.gmail.com>
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
	<a9b172c926a4b30360530c34adc44f3789ec2b27.1763370163.git.mchehab+huawei@kernel.org>
	<CANiq72=bYzj6iU7PCm+VMBTeBbgUcL8nwrvUut9p4ph+3+itaQ@mail.gmail.com>
	<kjpquyekvw7fwrndoomtge7fnxtfefihqlikj6xcqtazrr6l77@424ufup7v45o>
	<87seeb47pk.fsf@trenco.lwn.net>
	<20251118201152.038e2749@foz.lan>
	<CANiq72nC9HH4tZT6dTgiEpkBUktY5i3tVtnNtKjZhKAvAVrdBQ@mail.gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 18 Nov 2025 22:40:09 +0100
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> escreveu:

> On Tue, Nov 18, 2025 at 8:12=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> >
> > Me too, but the bug is very annoying ;-)
> >
> > I'll try to seek for some time to better understand it, maybe
> > next week. =20
>=20
> I will try to find a moment to take a look too... This happens with
> only the new wrapper, right? Or is it something that happened even
> before? If the latter, I remember testing the logic that Carlos added
> a long time ago, but maybe something changed in the meantime.

I'm testing here against docs/docs-next, so it is based on -rc1,
so, yeah this is after the cleanups. The problem could be introduced
by the Makefile cleanup, but I didn't find anything obvious
but I haven't time to revisit after sending the patch, as I got
sidetracked with unrelated issues (*).

I'll try testing it tomorrow against linux-next.

Thanks,
Mauro

---

(*) I was preparing a new rasdaemon release, which was launched
    today.
