Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C117EEFD
	for <rust-for-linux@vger.kernel.org>; Tue, 21 May 2024 15:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716304836; cv=none; b=OAVF5DbyheVbQvfsll5uhG/YIS7CBW/eHyksjqRtn+pJY2U54cmPOxgeHB78LoPgaKNRCGqXiWXi7CnXpPmNe83ON7c8/PGMZa88tNDr/iSkZ2AHUB2ulJ7fcDZ2YBA6yKO/WJ8fQS3y+Mv80zmvvYt8KC0utlYL+xkFE1jLffQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716304836; c=relaxed/simple;
	bh=eEcz/+iuzm6fgHIJGfAKLVLEhLlMIWtjsJFN14kjXkE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=BrDzbzZ/Dm+dYkGM3K/ymO5klNZFdOglrDIvcGzokn8TOfQ693NssfHf7kgk1ZNml7CasT9jZafVCCiS84AeNm/kIDOqJfAyUjP/NbBAvJmjY7jB0+47xEcEx1wgZCEj+Tj05cJx65hnupjrflllfDm3zsWhuPaHicKbMFhp08E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqZx8QcH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqZx8QcH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FF3C2BD11;
	Tue, 21 May 2024 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716304835;
	bh=eEcz/+iuzm6fgHIJGfAKLVLEhLlMIWtjsJFN14kjXkE=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=kqZx8QcHb7VEdfjv7T3zcqe2EjR6yBjlaaTxkeC4mUP4fZP3K8WiupAEMha0ik5SM
	 rOuBJc1hZSqrVv6EcpGpf6yLplMtWDTEt9Zm878BhTt5tYk8HlcaEXnK2UaYPwolG7
	 2G4e2EKePBEPkui5BTsbTFt4i+vdm8YmUNazarEc5z1YoeBZzlM5cy3ZRSWdStQuti
	 pi7V0dj2VBTGx/PvGkucoy4PSXGfOZTl+ICk7BqPqe5OjgnTODE5rnt41zRaFIQe8i
	 tIurrZs5tyOVwknyV99AAWLnpS4tBMv1/K5vAxvrRHlY+kwtJRwRM2T80SyKnvRpH9
	 PiWc5SGpEUDRA==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 May 2024 18:20:33 +0300
Message-Id: <D1FFABJRCD85.1EA4JBU93JT5Y@kernel.org>
Cc: <rust-for-linux@vger.kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>
Subject: Re: ASN.1
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.17.0
References: <D1F44P3VLTBN.30LUQ60X5J3DN@kernel.org>
 <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>
In-Reply-To: <CANiq72=Kv217NDGf5sXgx+EYez=cs+hO50+YNnZf9oL2zxni9Q@mail.gmail.com>

On Tue May 21, 2024 at 5:52 PM EEST, Miguel Ojeda wrote:
> Hi Jarkko,
>
> On Tue, May 21, 2024 at 8:36=E2=80=AFAM Jarkko Sakkinen <jarkko@kernel.or=
g> wrote:
> >
> > So question is how to approach this? How the holding data structure for
> > holding the deserialized data should represented so that is is also
> > directly accessible from C?
>
> Daniel (Cc'd) is working on in-kernel Rust codecs and is experimenting
> with `cbindgen` support to easily provide an API for C code (of
> course, you can do it manually too), so you may want to talk :) He
> recently wrote this article on it: https://lwn.net/Articles/970565/
>
> The main issue with a parallel implementation is whether the relevant
> maintainers will be OK with keeping both versions alive in the kernel.
> As usual, some ideas that may help offsetting the maintenance cost may
> be showcasing a security benefit, or a performance improvement, or a
> complexity reduction, or an avoidance of unsafe code, etc.

For me the main use case would be loading of keys (I co-maintain
keyring).

For keyring the ASN.1 C-API is actually quite good in the sense that
callbacks in parsing and sequential encoding are great at not conserving
memory (actually zero consumption almost). In that sense I'm happy with
it.

It is just hard to modify in the sense that it is very prone to
off-by-one errors and such.

Here's an example of a patch set that I wrote over the weekend for
asymmetric keys:

https://lore.kernel.org/linux-integrity/20240521031645.17008-1-jarkko@kerne=
l.org/

In this case I could imagine loading ASN.1 blob by calling Rust
functions. But yeah more like "immediate mode" API rather than "retained
mode" style ;-)

> Cheers,
> Miguel

BR, Jarkko
