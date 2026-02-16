Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA06D1E32CF;
	Mon, 16 Feb 2026 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771251696; cv=pass; b=Ia5sxuL8gzkKs7g5NFLU1imfEBPxn+ixFmD3HRI3pnLZPUvKWcXpoGIdMH/O1ztKwQZyu3oq7vD70YzwlBhf2yRqepyUTVl/QkJJymbj5vnlRCUrgjTLCSGjWXUGuxkPXv4kti9ZtR6HOVl1eYgxgWKZ/FJO+sjSPD08w7SAIms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771251696; c=relaxed/simple;
	bh=P9AWPsLWP+tw/FgtxvdmkbEH4GnF0i4SnqBN/FEAeIA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=QpH6dORSo82Ot7huHz6/gkRfnnB2fcQEnUqwirVq+ER9EMRfiLUMbA4DixGwuGSBvWeKp84jjmsY8zbpVJx5z/vhjd+APQQyPJf9Y8JEf/CWN45aKOePayGYjKeiIvqH0ABF6lOZVoIt2Re4QUYSzpeHst+26QjvT/p6L2cXhVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=beJa32oM; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="beJa32oM"
ARC-Seal: i=1; a=rsa-sha256; t=1771251684; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KhCTDpS/VGYFoOoHsCxk8vaFYdPi3nHISkcO+Pm9COn0lVKzgFg/O4L2jNStfF51jk2H0YqPLeyxHzVFr75L5e9juMzj1ifgsjKmoQBeK8zq7eBOzvkgWIMwcYFjDU32WXokfiUyxGwXHaA7PiduyigYij/0fqgis14+0om/HUQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771251684; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=P9AWPsLWP+tw/FgtxvdmkbEH4GnF0i4SnqBN/FEAeIA=; 
	b=g1RqC6czSgEBAtQuLtXMKalEgL8ExLVZLcVTo6g+21DSFAlpovGMyA4+ea+TlnVtLXadF1wM4yb/bVTEsj39DfcJ0nUgsd7P23cJNgwny1jZDmALKtItUTdPzm9b5bz3BSurCd3ziYoow/+4cXgCMX/LIxRI3ejA3y93SnWqwoI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771251684;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=P9AWPsLWP+tw/FgtxvdmkbEH4GnF0i4SnqBN/FEAeIA=;
	b=beJa32oMUNwp95GSWIcptRjXzwDBpFiOjPXyFi5HYEr3aK0cfRzlFV3XLTHg5OhP
	QaOFuYTRRMADsXLACoY2R0/fAlQIBr/Jf031/CUkU/aDQUNGJppbYs1wkkmSXfBXgKS
	Es4D/Jfht+rJq2P68QqctiKURBkOm6JTnw4aLlNQ=
Received: by mx.zohomail.com with SMTPS id 1771251681818735.6583029166486;
	Mon, 16 Feb 2026 06:21:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] rust: add a ring buffer implementation
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org>
Date: Mon, 16 Feb 2026 11:21:06 -0300
Cc: Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D7C5FE8-CA15-418B-B2F7-D0EA4C37E1F0@collabora.com>
References: <20260215-ringbuffer-v1-1-9b359758a1b6@kernel.org>
 <8tULWyvUTjVb3E_HFZeW2maApI87eYLZungGtJ6k9CVT9J-C-TzIqx5ShmHA5vS30yqZRq7TmaBd0AIg5V7u6Q==@protonmail.internalid>
 <aZMMyJofDKualqXw@google.com>
 <873430es2p.fsf@t14s.mail-host-address-is-not-set>
 <C82DE0A6-17FC-4FD9-A272-257B59129A7E@collabora.com>
 <DGGFZX5JLZ22.3E1C8OVLNUDD6@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 16 Feb 2026, at 11:06, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> On Mon Feb 16, 2026 at 2:45 PM CET, Daniel Almeida wrote:
>> With the allocation being handled by a separate component, I don=E2=80=99=
t think
>> this is right. I think a better location is rust/kernel/io
>=20
> I'm not sure it is reasonable to ask people who just want a ringbuffer =
in system
> memory to take the indirection over an I/O ringbuffer implementation =
with
> generic I/O backends choosing the system memory I/O backend.
>=20
> The proposed code is simple, without comments and tests, less than 100 =
lines of
> code. The I/O infrastructure to make this happen is still WIP. So, I =
think it's
> fine to land it as VecDeque for now.


Well, this is a 100 line patch, but nothing was said of how much else =
was going
to be added on top in the future. In order to avoiding iterating on what =
I
consider the wrong approach, I suggested that we start out in the right
direction from the start, something that Andreas himself apparently =
agreed to.


> Once we have the I/O backend infrastructure, a system memory I/O =
backend that
> can deal with separate allocators *and* a ring buffer implementation =
that sits
> on top of it, we can still revisit if it makes sense to take advantage =
of
> synergies.
>=20
> But for now this seems a bit premature in terms of delaying Andreas' =
work.

IIUC, and feel free to correct me on this, the I/O backends are already =
in the
works. What is missing is a trivial system memory backend, and similarly =
a
ringbuffer implementation, which is the subject of this patch. I don't =
see this
as a lot of work or an unreasonable ask.

=E2=80=94 Daniel=
