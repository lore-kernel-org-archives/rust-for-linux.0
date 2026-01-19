Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FA033F37E
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768811822; cv=none; b=m+yKbG53SDQVo3a8DBJT9wLoskfcX0Sq0GRPgnWG1iy48YW1jirXqbLbAR4kx57rHZ1mTGaGy3WkaTrUWo8wL2xFflzUT+NoMWOLciKBxO5tdksJVpsZ6EmAA7UoSkFVIMLnz0IWabf/o4ICLFygMIlONGAZL4v4TO09d79wfEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768811822; c=relaxed/simple;
	bh=JPGUxpj3usiRsVriSqD+UeAFWyIx7WItigFemqbJPJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tu+nC32quI27pBi0XnRCT0jlsK76G8YtWyO6CRumTZmRJ0OWVI/eBL6JZlo5cIW3rkNxkenzeYvasTXFHZEGmMbG3jspNvrr584F10veDNRb24VBzGpbxlg57KOd4B3G0r/vQD9EYwp6P7MPzRdeSsTagQJ4ESfGsZX/PouHuxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=ddfqNRjd; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="ddfqNRjd"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 925A7240103
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 09:36:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1768811813; bh=+D5k/zoj/DTxt+T6FL/I6PbKo0KHny5sH2WKKbCOAgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=ddfqNRjdG1cwTg/mAk/ZN6NDBrb3B9MSjqbKUJNkYYNsLz6haUmNSfH9sFiwTYAIh
	 lExy9WMnbdyNcOLmhAJckiM/+yORWg8QSYgYvcHdMsQmc2sWeumJjdKu3YScm+USG+
	 WSSedlYmOvMVN5pnv4cbZSLmiXkftczioTT+REEJMq591Cyikui+EC2FRFlHwMp3Qa
	 DYbvTcJJ5BJiXjp6X0VePMDwANE4Dq580KSuScP9VJgcHkNqH/Qi29GR50zmasUwa5
	 LbztzNRUoYYDklUBiEtfUD82TzANK7kibL9Q/g+f+LYPatShfv+oZjaM84XPPnifz2
	 zOrqpM/FXhCfQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dvkMj6n13z9rxD;
	Mon, 19 Jan 2026 09:36:49 +0100 (CET)
From: Charalampos Mitrodimas <charmitro@posteo.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Onur =?utf-8?Q?=C3=96zkan?= <work@onurozkan.dev>,
  rust-for-linux@vger.kernel.org,
  ojeda@kernel.org,  alex.gaynor@gmail.com,  boqun.feng@gmail.com,
  gary@garyguo.net,  bjorn3_gh@protonmail.com,  lossin@kernel.org,
  a.hindborg@kernel.org,  aliceryhl@google.com,  tmgross@umich.edu,
  dakr@kernel.org,  yutaro.ono.418@gmail.com,  borys.tyran@protonmail.com,
  daniel@sedlak.dev,  tamird@gmail.com,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
In-Reply-To: <CANiq72mrJ8yF-LVuXbsz3z_Sf3d3AXk2J_NbGNeu9Nsfgg8Zbw@mail.gmail.com>
References: <20251113144547.502-1-work@onurozkan.dev>
	<m2jyzo26y1.fsf@posteo.net>
	<CANiq72mrJ8yF-LVuXbsz3z_Sf3d3AXk2J_NbGNeu9Nsfgg8Zbw@mail.gmail.com>
Date: Mon, 19 Jan 2026 08:36:52 +0000
Message-ID: <87a4yac82m.fsf@posteo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Mon, Nov 17, 2025 at 1:13=E2=80=AFPM Charalampos Mitrodimas
> <charmitro@posteo.net> wrote:
>>
>> This is a nice change to have if it reaches the general consensus.
>>
>> Acked-By: Charalampos Mitrodimas <charmitro@posteo.net>
>
> So, typically, Acked-by tags are given by maintainers of the code.
> Sometimes, other stakeholders give it too:
>
>   https://docs.kernel.org/process/submitting-patches.html#when-to-use-ack=
ed-by-cc-and-co-developed-by
>
> I will keep the tag, but if this was meant to be a Reviewed-by or
> similar instead, please let me know.

Hi Miguel,

I was not aware, thanks for the heads up! Assume it is a Reviewed-by or
just discard since it's invalid.

>
> (Nit: it is usually -by, not -By).

Ah yes, need to update my email client snippet configuration.

C. Mitrodimas

>
> Cheers,
> Miguel
